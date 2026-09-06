import { useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { motion } from 'framer-motion'
import { PartyPopper, RotateCcw, RefreshCw, Home } from 'lucide-react'
import { sessionService } from '@/services/sessionService'
import { formatDuration } from '@/lib/utils'
import { Button } from '@/components/ui/Button'
import { Card } from '@/components/ui/Card'
import { PageLoading } from '@/components/ui/Spinner'
import { ErrorState } from '@/components/ui/ErrorState'
import type { StudySession } from '@/types/database'

export function ResultPage() {
  const { sessionId } = useParams<{ sessionId: string }>()
  const navigate = useNavigate()
  const [session, setSession] = useState<StudySession | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)

  const load = async () => {
    if (!sessionId) return
    setLoading(true)
    setError(false)
    try {
      const data = await sessionService.getSession(sessionId)
      if (!data) {
        setError(true)
        return
      }
      setSession(data)
    } catch {
      setError(true)
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    load()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sessionId])

  if (loading) return <PageLoading label="Đang tổng hợp kết quả..." />
  if (error || !session) return <ErrorState onRetry={load} />

  const durationSec = session.completed_at
    ? (new Date(session.completed_at).getTime() - new Date(session.started_at).getTime()) / 1000
    : 0

  const stats = [
    { label: 'Tổng số từ', value: session.total_words },
    { label: 'Đúng', value: session.correct_answers, color: 'text-teal-600 dark:text-teal-400' },
    { label: 'Sai', value: session.wrong_answers, color: 'text-rose-500' },
    { label: 'Độ chính xác', value: `${session.accuracy}%` },
  ]

  return (
    <div className="mx-auto max-w-lg text-center">
      <motion.div
        initial={{ scale: 0.6, opacity: 0 }}
        animate={{ scale: 1, opacity: 1 }}
        transition={{ type: 'spring', stiffness: 200, damping: 14 }}
        className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-coral-100 text-coral-600 dark:bg-coral-500/15 dark:text-coral-400"
      >
        <PartyPopper className="h-8 w-8" />
      </motion.div>
      <h1 className="font-display text-3xl font-semibold text-ink dark:text-white">Hoàn thành!</h1>
      <p className="mt-1 text-ink-soft dark:text-white/60">Bạn đã hoàn thành buổi luyện tập điền từ.</p>

      <Card className="mt-6 grid grid-cols-2 gap-4 p-6 sm:grid-cols-4">
        {stats.map((s) => (
          <div key={s.label}>
            <p className={`font-display text-2xl font-semibold text-ink dark:text-white ${s.color || ''}`}>
              {s.value}
            </p>
            <p className="mt-0.5 text-xs text-ink-soft dark:text-white/50">{s.label}</p>
          </div>
        ))}
      </Card>

      <div className="mt-4 flex items-center justify-center gap-6 text-sm text-ink-soft dark:text-white/60">
        <span>🏆 {session.score} điểm</span>
        <span>⏱️ {formatDuration(durationSec)}</span>
      </div>

      <div className="mt-8 flex flex-col gap-3 sm:flex-row sm:justify-center">
        <Button variant="secondary" onClick={() => navigate('/review')}>
          <RotateCcw className="h-4 w-4" /> Ôn lại từ sai
        </Button>
        <Button variant="secondary" onClick={() => navigate(`/learn/${session.set_id}`)}>
          <RefreshCw className="h-4 w-4" /> Học lại
        </Button>
        <Button onClick={() => navigate('/dashboard')}>
          <Home className="h-4 w-4" /> Về Dashboard
        </Button>
      </div>
    </div>
  )
}
