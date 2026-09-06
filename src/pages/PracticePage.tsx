import { useCallback, useEffect, useMemo, useState } from 'react'
import { useNavigate, useParams, useLocation } from 'react-router-dom'
import { motion, AnimatePresence } from 'framer-motion'
import { Lightbulb, CheckCircle2, XCircle, ArrowRight } from 'lucide-react'
import { useAuth } from '@/hooks/useAuth'
import { useKeyboardShortcut } from '@/hooks/useKeyboardShortcut'
import { vocabService } from '@/services/vocabService'
import { sessionService } from '@/services/sessionService'
import { progressService } from '@/services/progressService'
import { isAnswerCorrect, generateHint } from '@/lib/utils'
import { Button } from '@/components/ui/Button'
import { ProgressBar } from '@/components/ui/ProgressBar'
import { AnswerInput } from '@/components/vocab/AnswerInput'
import { PageLoading } from '@/components/ui/Spinner'
import { ErrorState } from '@/components/ui/ErrorState'
import type { Vocabulary } from '@/types/database'

interface WordResult {
  vocabularyId: string
  isCorrect: boolean
}

function buildBlankSentence(word: Vocabulary): string {
  if (!word.example) return ''
  const escaped = word.word.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
  const regex = new RegExp(escaped, 'gi')
  return word.example.replace(regex, '______')
}

export function PracticePage() {
  const { sessionId } = useParams<{ sessionId: string }>()
  const location = useLocation()
  const { user } = useAuth()
  const navigate = useNavigate()

  const [words, setWords] = useState<Vocabulary[]>([])
  const [index, setIndex] = useState(0)
  const [answer, setAnswer] = useState('')
  const [checked, setChecked] = useState<'idle' | 'correct' | 'incorrect'>('idle')
  const [usedHint, setUsedHint] = useState(false)
  const [hint, setHint] = useState<string | null>(null)
  const [score, setScore] = useState(0)
  const [results, setResults] = useState<WordResult[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)
  const [submitting, setSubmitting] = useState(false)

  const load = useCallback(async () => {
    if (!sessionId || !user) return
    setLoading(true)
    setError(false)
    try {
      let setId = (location.state as { setId?: string } | null)?.setId
      if (!setId) {
        const session = await sessionService.getSession(sessionId)
        if (!session) throw new Error('not-found')
        setId = session.set_id
      }
      const list = await vocabService.listVocabularies(setId)
      setWords(list)
    } catch {
      setError(true)
    } finally {
      setLoading(false)
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sessionId, user])

  useEffect(() => {
    load()
  }, [load])

  const currentWord = words[index]
  const sentence = currentWord ? buildBlankSentence(currentWord) : ''
  const isLast = index === words.length - 1

  const handleCheck = async () => {
    if (!currentWord || !sessionId || !user || checked !== 'idle') return
    const correct = isAnswerCorrect(answer, currentWord.word)
    setChecked(correct ? 'correct' : 'incorrect')
    setResults((r) => [...r, { vocabularyId: currentWord.id, isCorrect: correct }])
    setScore((s) => s + (correct ? (usedHint ? 5 : 10) : 0))

    try {
      await sessionService.recordAnswer({
        sessionId,
        userId: user.id,
        vocabularyId: currentWord.id,
        userAnswer: answer,
        correctAnswer: currentWord.word,
        isCorrect: correct,
        usedHint,
      })
      await progressService.recordAnswer(user.id, currentWord.id, correct)
    } catch {
      // Không chặn luồng học nếu lưu answer thất bại — dữ liệu chính (session) vẫn được cập nhật khi hoàn thành
    }
  }

  const handleUseHint = () => {
    if (!currentWord || usedHint) return
    setHint(generateHint(currentWord.word))
    setUsedHint(true)
  }

  const handleContinue = async () => {
    if (submitting) return
    if (!isLast) {
      setIndex((i) => i + 1)
      setAnswer('')
      setChecked('idle')
      setUsedHint(false)
      setHint(null)
      return
    }

    if (!sessionId) return
    setSubmitting(true)
    const finalResults = results
    const correctCount = finalResults.filter((r) => r.isCorrect).length
    try {
      await sessionService.completeSession(sessionId, {
        totalWords: finalResults.length,
        correctAnswers: correctCount,
        wrongAnswers: finalResults.length - correctCount,
        score,
      })
    } finally {
      navigate(`/result/${sessionId}`)
    }
  }

  useKeyboardShortcut(
    useMemo(
      () => ({
        Enter: () => (checked === 'idle' ? handleCheck() : handleContinue()),
      }),
      // eslint-disable-next-line react-hooks/exhaustive-deps
      [checked, answer, index]
    ),
    !loading && !error && words.length > 0
  )

  if (loading) return <PageLoading label="Đang chuẩn bị bài luyện tập..." />
  if (error) return <ErrorState onRetry={load} />
  if (words.length === 0)
    return <ErrorState title="Không có từ để luyện tập" message="Bộ từ vựng này không có từ nào." />

  return (
    <div>
      <div className="mb-6">
        <div className="mb-2 flex items-center justify-between text-sm font-medium text-ink-soft dark:text-white/60">
          <span>
            {index + 1} / {words.length}
          </span>
          <span>Điền từ · {score} điểm</span>
        </div>
        <ProgressBar value={index + 1} max={words.length} colorClassName="bg-violet-500" />
      </div>

      <AnimatePresence mode="wait">
        <motion.div
          key={currentWord.id}
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0, y: -12 }}
          transition={{ duration: 0.25 }}
        >
          <div className="rounded-[24px] border border-ink/[0.06] bg-white p-8 shadow-card dark:border-white/[0.06] dark:bg-[#1A1D2E]">
            <p className="text-center text-sm font-medium uppercase tracking-wide text-ink-soft dark:text-white/50">
              Nghĩa
            </p>
            <p className="mt-1 text-center font-display text-2xl font-semibold text-ink dark:text-white">
              {currentWord.meaning}
            </p>

            {sentence && (
              <p className="mt-6 text-center text-lg leading-relaxed text-ink-soft dark:text-white/70">
                {sentence}
              </p>
            )}

            {hint && (
              <p className="mt-4 text-center font-mono text-lg tracking-widest text-violet-600 dark:text-violet-400">
                {hint}
              </p>
            )}

            <div className="mx-auto mt-6 max-w-xs">
              <AnswerInput
                value={answer}
                onChange={(e) => setAnswer(e.target.value)}
                placeholder="Nhập từ tiếng Anh..."
                state={checked}
                disabled={checked !== 'idle'}
                autoFocus
                autoComplete="off"
                autoCapitalize="off"
                spellCheck={false}
              />
            </div>

            {checked !== 'idle' && (
              <motion.div
                initial={{ opacity: 0, y: 6 }}
                animate={{ opacity: 1, y: 0 }}
                className={`mx-auto mt-4 flex max-w-xs items-center justify-center gap-2 rounded-xl px-4 py-3 text-sm font-medium ${
                  checked === 'correct'
                    ? 'bg-teal-100 text-teal-700 dark:bg-teal-500/15 dark:text-teal-300'
                    : 'bg-rose-100 text-rose-700 dark:bg-rose-500/15 dark:text-rose-300'
                }`}
              >
                {checked === 'correct' ? (
                  <>
                    <CheckCircle2 className="h-4 w-4" /> Chính xác! +{usedHint ? 5 : 10} điểm
                  </>
                ) : (
                  <>
                    <XCircle className="h-4 w-4" /> Chưa chính xác — Đáp án: <strong>{currentWord.word}</strong>
                  </>
                )}
              </motion.div>
            )}
          </div>
        </motion.div>
      </AnimatePresence>

      <div className="mt-6 flex items-center justify-center gap-3">
        {checked === 'idle' ? (
          <>
            <Button variant="ghost" onClick={handleUseHint} disabled={usedHint}>
              <Lightbulb className="h-4 w-4" /> Gợi ý
            </Button>
            <Button size="lg" onClick={handleCheck} disabled={!answer.trim()} className="min-w-[160px]">
              Kiểm tra
            </Button>
          </>
        ) : (
          <Button size="lg" onClick={handleContinue} loading={submitting} className="min-w-[160px]">
            {isLast ? 'Xem kết quả' : 'Tiếp tục'} <ArrowRight className="h-4 w-4" />
          </Button>
        )}
      </div>
    </div>
  )
}
