import { useEffect, useMemo, useState } from 'react'
import { BarChart3, Target, CheckCircle2, XCircle, Flame } from 'lucide-react'
import { BarChart, Bar, XAxis, YAxis, Tooltip, ResponsiveContainer, CartesianGrid } from 'recharts'
import { useAuth } from '@/hooks/useAuth'
import { statsService, streakService } from '@/services/statsService'
import { Card } from '@/components/ui/Card'
import { Button } from '@/components/ui/Button'
import { PageLoading } from '@/components/ui/Spinner'
import { ErrorState } from '@/components/ui/ErrorState'
import { cn } from '@/lib/utils'
import type { StudySession, UserStreak } from '@/types/database'

type RangeKey = 7 | 30 | 90

export function StatisticsPage() {
  const { user } = useAuth()
  const [overview, setOverview] = useState<{
    totalAnswers: number
    correctAnswers: number
    wrongAnswers: number
    accuracy: number
    totalWordsLearned: number
    sessions: StudySession[]
  } | null>(null)
  const [streak, setStreak] = useState<UserStreak | null>(null)
  const [range, setRange] = useState<RangeKey>(7)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)

  const load = async () => {
    if (!user) return
    setLoading(true)
    setError(false)
    try {
      const [ov, st] = await Promise.all([statsService.overview(user.id), streakService.get(user.id)])
      setOverview(ov)
      setStreak(st)
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

  const chartData = useMemo(() => {
    if (!overview) return []
    const days: { day: string; words: number; accuracy: number }[] = []
    for (let i = range - 1; i >= 0; i--) {
      const d = new Date()
      d.setDate(d.getDate() - i)
      const label =
        range === 7
          ? d.toLocaleDateString('vi-VN', { weekday: 'short' })
          : d.toLocaleDateString('vi-VN', { day: '2-digit', month: '2-digit' })
      const daySessions = overview.sessions.filter((s) => {
        if (!s.completed_at) return false
        return new Date(s.completed_at).toDateString() === d.toDateString()
      })
      const words = daySessions.reduce((sum, s) => sum + s.total_words, 0)
      const avgAccuracy =
        daySessions.length > 0
          ? Math.round(daySessions.reduce((sum, s) => sum + Number(s.accuracy), 0) / daySessions.length)
          : 0
      days.push({ day: label, words, accuracy: avgAccuracy })
    }
    return days
  }, [overview, range])

  if (loading) return <PageLoading label="Đang tải thống kê..." />
  if (error || !overview) return <ErrorState onRetry={load} />

  const stats = [
    { icon: BarChart3, label: 'Tổng số từ đã học', value: overview.totalWordsLearned, color: 'teal' },
    { icon: Target, label: 'Tổng câu trả lời', value: overview.totalAnswers, color: 'violet' },
    { icon: CheckCircle2, label: 'Câu đúng', value: overview.correctAnswers, color: 'teal' },
    { icon: XCircle, label: 'Câu sai', value: overview.wrongAnswers, color: 'rose' },
    { icon: Flame, label: 'Streak hiện tại', value: `${streak?.current_streak || 0} ngày`, color: 'coral' },
  ]

  const colorClasses: Record<string, string> = {
    teal: 'bg-teal-100 text-teal-600 dark:bg-teal-500/15 dark:text-teal-400',
    coral: 'bg-coral-100 text-coral-600 dark:bg-coral-500/15 dark:text-coral-400',
    violet: 'bg-violet-100 text-violet-600 dark:bg-violet-500/15 dark:text-violet-400',
    rose: 'bg-rose-500/10 text-rose-500',
  }

  return (
    <div>
      <h1 className="font-display text-2xl font-semibold text-ink dark:text-white sm:text-3xl">Thống kê</h1>
      <p className="mt-1 mb-6 text-ink-soft dark:text-white/60">Tổng quan quá trình học tập của bạn.</p>

      <div className="grid grid-cols-2 gap-4 lg:grid-cols-5">
        {stats.map((s) => (
          <Card key={s.label} className="p-5">
            <div className={`mb-3 flex h-10 w-10 items-center justify-center rounded-xl ${colorClasses[s.color]}`}>
              <s.icon className="h-5 w-5" />
            </div>
            <p className="font-display text-2xl font-semibold text-ink dark:text-white">{s.value}</p>
            <p className="mt-0.5 text-sm text-ink-soft dark:text-white/60">{s.label}</p>
          </Card>
        ))}
      </div>

      <Card className="mt-6 p-6">
        <div className="mb-4 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
          <h3 className="font-display text-lg font-semibold text-ink dark:text-white">Từ đã học theo thời gian</h3>
          <div className="flex gap-2">
            {([7, 30, 90] as RangeKey[]).map((r) => (
              <Button
                key={r}
                size="sm"
                variant={range === r ? 'primary' : 'secondary'}
                onClick={() => setRange(r)}
                className={cn(range !== r && 'text-ink-soft')}
              >
                {r} ngày
              </Button>
            ))}
          </div>
        </div>
        <div className="h-64">
          <ResponsiveContainer width="100%" height="100%">
            <BarChart data={chartData}>
              <CartesianGrid strokeDasharray="3 3" stroke="currentColor" className="text-ink/5 dark:text-white/5" />
              <XAxis dataKey="day" fontSize={11} tickLine={false} axisLine={false} interval={range > 7 ? 4 : 0} />
              <YAxis fontSize={12} tickLine={false} axisLine={false} allowDecimals={false} />
              <Tooltip contentStyle={{ borderRadius: 12, border: '1px solid var(--color-border)', boxShadow: 'var(--shadow-soft)' }} />
              <Bar dataKey="words" fill="var(--color-primary)" radius={[6, 6, 0, 0]} />
            </BarChart>
          </ResponsiveContainer>
        </div>
      </Card>
    </div>
  )
}
