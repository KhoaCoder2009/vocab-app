import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { motion, AnimatePresence } from 'framer-motion'
import { CheckCircle2, XCircle, ArrowRight, Sparkles as SparklesIcon, BookOpen, Target } from 'lucide-react'
import { useAuth } from '@/hooks/useAuth'
import { useKeyboardShortcut } from '@/hooks/useKeyboardShortcut'
import { progressService } from '@/services/progressService'
import { sessionService } from '@/services/sessionService'
import { isAnswerCorrect, formatPartOfSpeech } from '@/lib/utils'
import { AudioButton } from '@/components/vocab/AudioButton'
import { AnswerInput } from '@/components/vocab/AnswerInput'
import { Button } from '@/components/ui/Button'
import { Card } from '@/components/ui/Card'
import { ProgressBar } from '@/components/ui/ProgressBar'
import { PageLoading } from '@/components/ui/Spinner'
import { ErrorState } from '@/components/ui/ErrorState'
import { EmptyState } from '@/components/ui/EmptyState'
import type { VocabularyWithSet } from '@/types/database'

interface DueItem {
  vocabulary_id: string
  user_id: string
  times_seen: number
  times_correct: number
  times_wrong: number
  mastery_level: number
  vocabularies: VocabularyWithSet
}

interface SetGroup {
  setId: string
  setTitle: string
  coverColor: string
  words: DueItem[]
  accuracy: number
}

type ViewMode = 'overview' | 'reviewing' | 'finished'

export function ReviewPage() {
  const { user } = useAuth()
  const navigate = useNavigate()

  const [viewMode, setViewMode] = useState<ViewMode>('overview')
  const [allItems, setAllItems] = useState<DueItem[]>([])
  const [setGroups, setSetGroups] = useState<SetGroup[]>([])
  const [selectedSetId, setSelectedSetId] = useState<string | null>(null)
  const [currentItems, setCurrentItems] = useState<DueItem[]>([])
  const [sessionId, setSessionId] = useState<string | null>(null)
  const [index, setIndex] = useState(0)
  const [flipped, setFlipped] = useState(false)
  const [answer, setAnswer] = useState('')
  const [checked, setChecked] = useState<'idle' | 'correct' | 'incorrect'>('idle')
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)
  const [correctCount, setCorrectCount] = useState(0)
  const [wrongCount, setWrongCount] = useState(0)
  const [resultsPerSet, setResultsPerSet] = useState<Record<string, { correct: number; wrong: number }>>({})

  const load = async () => {
    if (!user) return
    setLoading(true)
    setError(false)
    try {
      const due = (await progressService.getDueForReview(user.id)) as unknown as DueItem[]
      const validItems = due.filter((d) => d.vocabularies && d.vocabularies.vocabulary_sets)
      setAllItems(validItems)

      // Nhóm theo set_id
      const groups: Record<string, DueItem[]> = {}
      for (const item of validItems) {
        const setId = item.vocabularies.vocabulary_sets.id
        if (!groups[setId]) groups[setId] = []
        groups[setId].push(item)
      }

      const setGroupList: SetGroup[] = Object.entries(groups).map(([setId, words]) => {
        const firstWord = words[0]
        const setInfo = firstWord.vocabularies.vocabulary_sets
        const totalCorrect = words.reduce((sum, w) => sum + w.times_correct, 0)
        const totalSeen = words.reduce((sum, w) => sum + w.times_seen, 0)
        const accuracy = totalSeen > 0 ? Math.round((totalCorrect / totalSeen) * 100) : 0

        return {
          setId,
          setTitle: setInfo.title,
          coverColor: setInfo.cover_color || 'teal',
          words,
          accuracy,
        }
      })

      setSetGroups(setGroupList)
    } catch {
      setError(true)
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    load()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [user])

  const startReview = async (setId: string | null) => {
    if (!user) return
    const itemsToReview = setId ? allItems.filter((i) => i.vocabularies.vocabulary_sets.id === setId) : allItems
    if (itemsToReview.length === 0) return

    setCurrentItems(itemsToReview)
    setSelectedSetId(setId)
    setIndex(0)
    setCorrectCount(0)
    setWrongCount(0)
    setResultsPerSet({})
    setFlipped(false)
    setAnswer('')
    setChecked('idle')

    // Tạo session với set_id đầu tiên hoặc null nếu ôn nhiều chủ đề
    const firstSetId = itemsToReview[0].vocabularies.vocabulary_sets.id
    const session = await sessionService.startSession(user.id, firstSetId, 'review')
    setSessionId(session.id)

    setViewMode('reviewing')
  }

  const current = currentItems[index]
  const isLast = index === currentItems.length - 1

  const handleCheck = async () => {
    if (!current || !user || checked !== 'idle') return
    const vocab = current.vocabularies
    const correct = isAnswerCorrect(answer, vocab.word)
    setChecked(correct ? 'correct' : 'incorrect')

    if (correct) {
      setCorrectCount((c) => c + 1)
    } else {
      setWrongCount((c) => c + 1)
    }

    // Cập nhật kết quả per-set
    const setId = vocab.vocabulary_sets.id
    setResultsPerSet((prev) => ({
      ...prev,
      [setId]: {
        correct: (prev[setId]?.correct || 0) + (correct ? 1 : 0),
        wrong: (prev[setId]?.wrong || 0) + (correct ? 0 : 1),
      },
    }))

    try {
      await progressService.recordAnswer(user.id, vocab.id, correct)
      if (sessionId) {
        await sessionService.recordAnswer({
          sessionId,
          userId: user.id,
          vocabularyId: vocab.id,
          userAnswer: answer,
          correctAnswer: vocab.word,
          isCorrect: correct,
          usedHint: false,
        })
      }
    } catch {
      // Không chặn luồng ôn tập nếu ghi log thất bại
    }
  }

  const handleNext = async () => {
    if (isLast) {
      if (sessionId) {
        try {
          await sessionService.completeSession(sessionId, {
            totalWords: currentItems.length,
            correctAnswers: correctCount,
            wrongAnswers: wrongCount,
            score: correctCount * 10,
          })
        } catch {
          // ignore
        }
      }
      setViewMode('finished')
      return
    }
    setIndex((i) => i + 1)
    setFlipped(false)
    setAnswer('')
    setChecked('idle')
  }

  // Keyboard shortcut: Enter để submit
  useKeyboardShortcut(
    {
      Enter: () => {
        if (viewMode !== 'reviewing' || !flipped) return
        if (checked === 'idle' && answer.trim()) {
          handleCheck()
        } else if (checked !== 'idle') {
          handleNext()
        }
      },
    },
    viewMode === 'reviewing' && flipped
  )

  if (loading) return <PageLoading label="Đang tải danh sách ôn tập..." />
  if (error) return <ErrorState onRetry={load} />

  if (allItems.length === 0) {
    return (
      <EmptyState
        icon={<SparklesIcon className="h-10 w-10" />}
        title="Bạn không có từ nào cần ôn"
        description="Tuyệt vời! Hãy quay lại học từ mới hoặc kiểm tra lại sau."
        action={<Button onClick={() => navigate('/sets')}>Học từ mới</Button>}
      />
    )
  }

  // OVERVIEW MODE
  if (viewMode === 'overview') {
    const totalWords = allItems.length
    const avgAccuracy =
      setGroups.length > 0
        ? Math.round(setGroups.reduce((sum, g) => sum + g.accuracy, 0) / setGroups.length)
        : 0

    return (
      <div>
        <h1 className="font-display text-2xl font-semibold text-ink dark:text-white sm:text-3xl">Ôn tập từ vựng</h1>
        <p className="mt-1 mb-6 text-ink-soft dark:text-white/60">
          Bạn có <strong>{totalWords} từ</strong> cần ôn từ <strong>{setGroups.length} chủ đề</strong>.
        </p>

        <div className="mb-6 grid grid-cols-1 gap-4 sm:grid-cols-2">
          <Card className="p-5">
            <div className="mb-3 flex h-10 w-10 items-center justify-center rounded-xl bg-coral-100 text-coral-600 dark:bg-coral-500/15 dark:text-coral-400">
              <BookOpen className="h-5 w-5" />
            </div>
            <p className="font-display text-2xl font-semibold text-ink dark:text-white">{totalWords} từ</p>
            <p className="mt-0.5 text-sm text-ink-soft dark:text-white/60">Tổng từ cần ôn</p>
          </Card>
          <Card className="p-5">
            <div className="mb-3 flex h-10 w-10 items-center justify-center rounded-xl bg-violet-100 text-violet-600 dark:bg-violet-500/15 dark:text-violet-400">
              <Target className="h-5 w-5" />
            </div>
            <p className="font-display text-2xl font-semibold text-ink dark:text-white">{avgAccuracy}%</p>
            <p className="mt-0.5 text-sm text-ink-soft dark:text-white/60">Độ chính xác trung bình</p>
          </Card>
        </div>

        <div className="mb-4 flex items-center justify-between">
          <h2 className="font-display text-lg font-semibold text-ink dark:text-white">Chủ đề cần ôn</h2>
          <Button size="sm" onClick={() => startReview(null)}>
            Ôn tất cả
          </Button>
        </div>

        <div className="space-y-3">
          {setGroups.map((group) => (
            <Card key={group.setId} className="p-5">
              <div className="flex items-center justify-between gap-4">
                <div className="min-w-0 flex-1">
                  <div className="flex items-center gap-2">
                    <h3 className="font-display font-semibold text-ink dark:text-white">{group.setTitle}</h3>
                    <span className="rounded-full bg-coral-100 px-2 py-0.5 text-xs font-medium text-coral-600 dark:bg-coral-500/15 dark:text-coral-400">
                      {group.words.length} từ
                    </span>
                  </div>
                  <div className="mt-2 flex items-center gap-4 text-sm text-ink-soft dark:text-white/60">
                    <span>Độ chính xác trước đó: {group.accuracy}%</span>
                  </div>
                </div>
                <Button variant="secondary" size="sm" onClick={() => startReview(group.setId)}>
                  Ôn ngay
                </Button>
              </div>
            </Card>
          ))}
        </div>
      </div>
    )
  }

  // FINISHED MODE
  if (viewMode === 'finished') {
    const reviewedSetIds = Object.keys(resultsPerSet)
    return (
      <div className="mx-auto max-w-2xl">
        <div className="mb-6 text-center">
          <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-teal-100 text-teal-600 dark:bg-teal-500/15 dark:text-teal-400">
            <CheckCircle2 className="h-8 w-8" />
          </div>
          <h1 className="font-display text-2xl font-semibold text-ink dark:text-white">Hoàn thành ôn tập!</h1>
          <p className="mt-1.5 text-ink-soft dark:text-white/60">
            Bạn đã ôn {currentItems.length} từ • Đúng {correctCount} • Sai {wrongCount}
          </p>
        </div>

        <h2 className="mb-4 font-display text-lg font-semibold text-ink dark:text-white">Kết quả theo chủ đề</h2>
        <div className="space-y-3">
          {reviewedSetIds.map((setId) => {
            const group = setGroups.find((g) => g.setId === setId)
            if (!group) return null
            const result = resultsPerSet[setId]
            const total = result.correct + result.wrong
            const accuracy = total > 0 ? Math.round((result.correct / total) * 100) : 0

            return (
              <Card key={setId} className="p-5">
                <h3 className="font-display font-semibold text-ink dark:text-white">{group.setTitle}</h3>
                <div className="mt-2 flex items-center gap-4 text-sm">
                  <span className="text-teal-600 dark:text-teal-400">✓ {result.correct} đúng</span>
                  <span className="text-rose-500">✗ {result.wrong} sai</span>
                  <span className="text-ink-soft dark:text-white/60">Độ chính xác: {accuracy}%</span>
                </div>
              </Card>
            )
          })}
        </div>

        <div className="mt-6 flex justify-center gap-3">
          <Button variant="secondary" onClick={() => setViewMode('overview')}>
            Ôn tiếp
          </Button>
          <Button onClick={() => navigate('/dashboard')}>Về Dashboard</Button>
        </div>
      </div>
    )
  }

  // REVIEWING MODE
  const vocab = current.vocabularies
  const setInfo = vocab.vocabulary_sets
  const formattedPos = formatPartOfSpeech(vocab.part_of_speech)

  return (
    <div>
      <div className="mb-6">
        <div className="mb-2 flex items-center justify-between text-sm font-medium text-ink-soft dark:text-white/60">
          <span>
            {index + 1} / {currentItems.length}
          </span>
          <span className="flex items-center gap-1.5">
            <span className="inline-block h-2 w-2 rounded-full bg-coral-500" />
            {setInfo.title}
          </span>
        </div>
        <ProgressBar value={index + 1} max={currentItems.length} colorClassName="bg-coral-500" />
      </div>

      <AnimatePresence mode="wait">
        <motion.div
          key={vocab.id}
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0, y: -12 }}
          transition={{ duration: 0.25 }}
          className="rounded-[24px] border border-border bg-white p-8 text-center shadow-card dark:border-slate-700 dark:bg-slate-800"
        >
          <div className="mb-3 inline-flex items-center gap-2 rounded-full bg-coral-100 px-3 py-1 text-xs font-medium text-coral-600 dark:bg-coral-500/15 dark:text-coral-400">
            <BookOpen className="h-3 w-3" />
            {setInfo.title}
          </div>

          <p className="font-display text-3xl font-semibold text-ink dark:text-white">{vocab.word}</p>
          <div className="mt-2 flex flex-wrap items-center justify-center gap-2">
            {vocab.pronunciation && <p className="text-ink-soft dark:text-white/50">{vocab.pronunciation}</p>}
            {formattedPos && (
              <span className="rounded-full bg-violet-100 px-3 py-1 text-sm font-semibold text-violet-600 dark:bg-violet-500/15 dark:text-violet-300">
                {formattedPos}
              </span>
            )}
          </div>
          <div className="mt-4 flex justify-center">
            <AudioButton text={vocab.word} />
          </div>

          {!flipped ? (
            <Button variant="secondary" className="mt-6" onClick={() => setFlipped(true)}>
              Hiện nghĩa
            </Button>
          ) : (
            <>
              {/* Định nghĩa tiếng Anh */}
              {vocab.english_definition && (
                <div className="mt-6 rounded-xl border border-teal-100 bg-teal-50 px-4 py-3 dark:border-teal-500/20 dark:bg-teal-500/5">
                  <p className="text-center text-sm font-medium italic text-teal-900 dark:text-teal-200">
                    &ldquo;{vocab.english_definition}&rdquo;
                  </p>
                </div>
              )}
              
              {/* Nghĩa tiếng Việt */}
              <p className="mt-6 font-display text-xl font-semibold text-teal-600 dark:text-teal-400">
                {vocab.meaning}
              </p>
              {vocab.example && (
                <p className="mt-3 text-sm italic text-ink-soft dark:text-white/60">&ldquo;{vocab.example}&rdquo;</p>
              )}

              <div className="mx-auto mt-6 max-w-xs">
                <AnswerInput
                  value={answer}
                  onChange={(e) => setAnswer(e.target.value)}
                  placeholder="Gõ lại từ này..."
                  state={checked}
                  disabled={checked !== 'idle'}
                  autoFocus
                  autoComplete="off"
                  spellCheck={false}
                />
              </div>

              {checked !== 'idle' && (
                <div
                  className={`mx-auto mt-4 flex max-w-xs items-center justify-center gap-2 rounded-xl px-4 py-3 text-sm font-medium ${
                    checked === 'correct'
                      ? 'bg-teal-100 text-teal-700 dark:bg-teal-500/15 dark:text-teal-300'
                      : 'bg-rose-100 text-rose-700 dark:bg-rose-500/15 dark:text-rose-300'
                  }`}
                >
                  {checked === 'correct' ? (
                    <>
                      <CheckCircle2 className="h-4 w-4" /> Chính xác!
                    </>
                  ) : (
                    <>
                      <XCircle className="h-4 w-4" /> Đáp án: <strong>{vocab.word}</strong>
                    </>
                  )}
                </div>
              )}

              <div className="mt-6">
                {checked === 'idle' ? (
                  <Button onClick={handleCheck} disabled={!answer.trim()}>
                    Kiểm tra
                  </Button>
                ) : (
                  <Button onClick={handleNext}>
                    {isLast ? 'Xem kết quả' : 'Từ tiếp theo'} <ArrowRight className="h-4 w-4" />
                  </Button>
                )}
              </div>
            </>
          )}
        </motion.div>
      </AnimatePresence>
    </div>
  )
}
