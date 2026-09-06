import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { motion, AnimatePresence } from 'framer-motion'
import { CheckCircle2, XCircle, ArrowRight, Sparkles as SparklesIcon } from 'lucide-react'
import { useAuth } from '@/hooks/useAuth'
import { progressService } from '@/services/progressService'
import { sessionService } from '@/services/sessionService'
import { isAnswerCorrect } from '@/lib/utils'
import { AudioButton } from '@/components/vocab/AudioButton'
import { AnswerInput } from '@/components/vocab/AnswerInput'
import { Button } from '@/components/ui/Button'
import { ProgressBar } from '@/components/ui/ProgressBar'
import { PageLoading } from '@/components/ui/Spinner'
import { ErrorState } from '@/components/ui/ErrorState'
import { EmptyState } from '@/components/ui/EmptyState'
import type { Vocabulary } from '@/types/database'

interface DueItem {
  vocabulary: Vocabulary
}

export function ReviewPage() {
  const { user } = useAuth()
  const navigate = useNavigate()

  const [items, setItems] = useState<DueItem[]>([])
  const [sessionId, setSessionId] = useState<string | null>(null)
  const [index, setIndex] = useState(0)
  const [flipped, setFlipped] = useState(false)
  const [answer, setAnswer] = useState('')
  const [checked, setChecked] = useState<'idle' | 'correct' | 'incorrect'>('idle')
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)
  const [finished, setFinished] = useState(false)
  const [correctCount, setCorrectCount] = useState(0)

  const load = async () => {
    if (!user) return
    setLoading(true)
    setError(false)
    setFinished(false)
    try {
      const due = await progressService.getDueForReview(user.id)
      const list = (due as unknown as Array<{ vocabularies: Vocabulary }>)
        .filter((d) => d.vocabularies)
        .map((d) => ({ vocabulary: d.vocabularies }))
      setItems(list)
      setIndex(0)
      setCorrectCount(0)
      if (list.length > 0) {
        const setId = list[0].vocabulary.set_id
        const session = await sessionService.startSession(user.id, setId, 'review')
        setSessionId(session.id)
      }
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

  const current = items[index]?.vocabulary
  const isLast = index === items.length - 1

  const handleCheck = async () => {
    if (!current || !user || checked !== 'idle') return
    const correct = isAnswerCorrect(answer, current.word)
    setChecked(correct ? 'correct' : 'incorrect')
    if (correct) setCorrectCount((c) => c + 1)

    try {
      await progressService.recordAnswer(user.id, current.id, correct)
      if (sessionId) {
        await sessionService.recordAnswer({
          sessionId,
          userId: user.id,
          vocabularyId: current.id,
          userAnswer: answer,
          correctAnswer: current.word,
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
            totalWords: items.length,
            correctAnswers: correctCount,
            wrongAnswers: items.length - correctCount,
            score: correctCount * 10,
          })
        } catch {
          // ignore
        }
      }
      setFinished(true)
      return
    }
    setIndex((i) => i + 1)
    setFlipped(false)
    setAnswer('')
    setChecked('idle')
  }

  if (loading) return <PageLoading label="Đang tải danh sách ôn tập..." />
  if (error) return <ErrorState onRetry={load} />

  if (items.length === 0) {
    return (
      <EmptyState
        icon={<SparklesIcon className="h-10 w-10" />}
        title="Bạn không có từ nào cần ôn"
        description="Tuyệt vời! Hãy quay lại học từ mới hoặc kiểm tra lại sau."
        action={<Button onClick={() => navigate('/sets')}>Học từ mới</Button>}
      />
    )
  }

  if (finished) {
    return (
      <div className="mx-auto max-w-md text-center">
        <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-teal-100 text-teal-600 dark:bg-teal-500/15 dark:text-teal-400">
          <CheckCircle2 className="h-8 w-8" />
        </div>
        <h1 className="font-display text-2xl font-semibold text-ink dark:text-white">Đã ôn xong!</h1>
        <p className="mt-1.5 text-ink-soft dark:text-white/60">
          Bạn đã ôn {items.length} từ, đúng {correctCount} từ.
        </p>
        <Button className="mt-6" onClick={() => navigate('/dashboard')}>
          Về Dashboard
        </Button>
      </div>
    )
  }

  return (
    <div>
      <div className="mb-6">
        <p className="mb-2 text-sm font-medium text-ink-soft dark:text-white/60">
          Bạn có {items.length} từ cần ôn — {index + 1}/{items.length}
        </p>
        <ProgressBar value={index + 1} max={items.length} colorClassName="bg-coral-500" />
      </div>

      <AnimatePresence mode="wait">
        <motion.div
          key={current.id}
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0, y: -12 }}
          transition={{ duration: 0.25 }}
          className="rounded-[24px] border border-ink/[0.06] bg-white p-8 text-center shadow-card dark:border-white/[0.06] dark:bg-[#1A1D2E]"
        >
          <p className="font-display text-3xl font-semibold text-ink dark:text-white">{current.word}</p>
          {current.pronunciation && <p className="mt-1.5 text-ink-soft dark:text-white/50">{current.pronunciation}</p>}
          <div className="mt-4 flex justify-center">
            <AudioButton text={current.word} />
          </div>

          {!flipped ? (
            <Button variant="secondary" className="mt-6" onClick={() => setFlipped(true)}>
              Hiện nghĩa
            </Button>
          ) : (
            <>
              <p className="mt-6 font-display text-xl font-semibold text-teal-600 dark:text-teal-400">
                {current.meaning}
              </p>
              {current.example && (
                <p className="mt-3 text-sm italic text-ink-soft dark:text-white/60">&ldquo;{current.example}&rdquo;</p>
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
                      <XCircle className="h-4 w-4" /> Đáp án: <strong>{current.word}</strong>
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
                    {isLast ? 'Hoàn thành' : 'Từ tiếp theo'} <ArrowRight className="h-4 w-4" />
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
