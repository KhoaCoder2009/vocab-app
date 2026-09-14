import { useCallback, useEffect, useMemo, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { motion } from 'framer-motion'
import { ThumbsDown, ThumbsUp, ArrowRight } from 'lucide-react'
import { useAuth } from '@/hooks/useAuth'
import { useKeyboardShortcut } from '@/hooks/useKeyboardShortcut'
import { vocabService } from '@/services/vocabService'
import { sessionService } from '@/services/sessionService'
import { FlashCard, FlashCardTransition } from '@/components/flashcard/FlashCard'
import { Button } from '@/components/ui/Button'
import { ProgressBar } from '@/components/ui/ProgressBar'
import { PageLoading } from '@/components/ui/Spinner'
import { ErrorState } from '@/components/ui/ErrorState'
import { EmptyState } from '@/components/ui/EmptyState'
import { useToast } from '@/hooks/useToast'
import type { Vocabulary } from '@/types/database'

export function LearnPage() {
  const { setId } = useParams<{ setId: string }>()
  const { user } = useAuth()
  const navigate = useNavigate()
  const { showToast } = useToast()

  const [words, setWords] = useState<Vocabulary[]>([])
  const [sessionId, setSessionId] = useState<string | null>(null)
  const [index, setIndex] = useState(0)
  const [flipped, setFlipped] = useState(false)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)
  const [starting, setStarting] = useState(false)

  const load = useCallback(async () => {
    if (!setId || !user) return
    setLoading(true)
    setError(false)
    try {
      const list = await vocabService.listVocabularies(setId)
      setWords(list)
      if (list.length > 0) {
        const session = await sessionService.startSession(user.id, setId, 'flashcard')
        setSessionId(session.id)
      }
    } catch {
      setError(true)
    } finally {
      setLoading(false)
    }
  }, [setId, user])

  useEffect(() => {
    load()
  }, [load])

  const currentWord = words[index]
  const isLast = index === words.length - 1

  const goNext = useCallback(
    async (_known: boolean) => {
      if (starting) return
      if (isLast) {
        setStarting(true)
        if (sessionId && setId) {
          navigate(`/practice/${sessionId}`, { state: { setId } })
        } else {
          showToast('Không thể bắt đầu phần luyện tập. Vui lòng thử lại.', 'error')
          setStarting(false)
        }
        return
      }
      setFlipped(false)
      setIndex((i) => i + 1)
    },
    [isLast, navigate, sessionId, setId, starting, showToast]
  )

  useKeyboardShortcut(
    useMemo(
      () => ({
        Space: () => setFlipped((f) => !f),
        ArrowRight: () => goNext(true),
        '1': () => goNext(false),
        '2': () => goNext(true),
      }),
      [goNext]
    ),
    !loading && !error && words.length > 0
  )

  if (loading) return <PageLoading label="Đang chuẩn bị flashcard..." />
  if (error) return <ErrorState onRetry={load} />
  if (words.length === 0)
    return (
      <EmptyState
        title="Bộ từ vựng này chưa có từ nào"
        description="Hãy thêm từ vào bộ trước khi bắt đầu học."
        action={<Button onClick={() => navigate('/sets')}>Quay lại danh sách bộ từ</Button>}
      />
    )

  return (
    <div>
      <div className="mb-6">
        <div className="mb-2 flex items-center justify-between text-sm font-medium text-ink-soft dark:text-white/60">
          <span>
            {index + 1} / {words.length}
          </span>
          <span>Flashcard</span>
        </div>
        <ProgressBar value={index + 1} max={words.length} />
      </div>

      <FlashCardTransition cardKey={currentWord.id}>
        <FlashCard word={currentWord} flipped={flipped} onFlip={() => setFlipped((f) => !f)} />
      </FlashCardTransition>

      <motion.div className="mt-8 flex items-center justify-center gap-3" layout>
        {!flipped ? (
          <Button size="lg" onClick={() => setFlipped(true)} className="min-w-[200px]">
            Hiện nghĩa
          </Button>
        ) : (
          <>
            <Button
              variant="secondary"
              size="lg"
              onClick={() => goNext(false)}
              loading={starting}
              className="border-rose-200 text-rose-500 hover:border-rose-400"
            >
              <ThumbsDown className="h-4 w-4" /> Chưa nhớ
            </Button>
            <Button size="lg" onClick={() => goNext(true)} loading={starting}>
              {isLast ? (
                <>
                  Luyện tập điền từ <ArrowRight className="h-4 w-4" />
                </>
              ) : (
                <>
                  <ThumbsUp className="h-4 w-4" /> Đã nhớ
                </>
              )}
            </Button>
          </>
        )}
      </motion.div>

      <p className="mt-6 text-center text-xs text-ink-soft/70 dark:text-white/40">
        Phím tắt: <kbd className="rounded bg-slate-100 px-1.5 py-0.5 dark:bg-slate-800">Space</kbd> hiện nghĩa ·{' '}
        <kbd className="rounded bg-slate-100 px-1.5 py-0.5 dark:bg-slate-800">→</kbd> từ tiếp theo ·{' '}
        <kbd className="rounded bg-slate-100 px-1.5 py-0.5 dark:bg-slate-800">1</kbd> chưa nhớ ·{' '}
        <kbd className="rounded bg-slate-100 px-1.5 py-0.5 dark:bg-slate-800">2</kbd> đã nhớ
      </p>
    </div>
  )
}
