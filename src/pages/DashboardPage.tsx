import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { motion } from 'framer-motion'
import { Flame, BookMarked, Target, RotateCcw, Star, ArrowRight } from 'lucide-react'
import { LineChart, Line, XAxis, YAxis, Tooltip, ResponsiveContainer, CartesianGrid } from 'recharts'
import { useAuth } from '@/hooks/useAuth'
import { Button } from '@/components/ui/Button'
import { Card } from '@/components/ui/Card'
import { PageLoading } from '@/components/ui/Spinner'
import { ErrorState } from '@/components/ui/ErrorState'
import { progressService } from '@/services/progressService'
import { statsService, streakService, favoritesService } from '@/services/statsService'
import type { StudySession } from '@/types/database'

interface DashboardData {
  streak: number
  wordsToday: number
  accuracy: number
  dueReview: number
  favoritesCount: number
  sessions: StudySession[]
}

export function DashboardPage() {
  const { user, profile } = useAuth()
  const [data, setData] = useState<DashboardData | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)

  const load = async () => {
    if (!user) return
    setLoading(true)
    setError(false)
    try {
      const [streak, wordsToday, overview, dueReview, favorites] = await Promise.all([
        streakService.get(user.id),
        statsService.wordsLearnedToday(user.id),
        statsService.overview(user.id),
        progressService.countDueForReview(user.id),
        favoritesService.list(user.id),
      ])
      setData({
        streak: streak?.current_streak || 0,
        wordsToday,
        accuracy: overview.accuracy,
        dueReview,
        favoritesCount: favorites.length,
        sessions: overview.sessions,
      })
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

  if (loading) return <PageLoading label="Đang tải bảng điều khiển..." />
  if (error || !data) return <ErrorState onRetry={load} />

  const chartData = buildLast7DaysChart(data.sessions)
  const displayName = profile?.full_name || user?.email?.split('@')[0] || 'bạn'

  const stats = [
    { icon: Flame, label: 'Streak', value: `${data.streak} ngày`, color: 'coral', big: true },
    { icon: BookMarked, label: 'Đã học hôm nay', value: `${data.wordsToday} từ`, color: 'teal' },
    { icon: Target, label: 'Độ chính xác', value: `${data.accuracy}%`, color: 'violet' },
    { icon: RotateCcw, label: 'Cần ôn', value: `${data.dueReview} từ`, color: 'rose' },
    { icon: Star, label: 'Yêu thích', value: `${data.favoritesCount} từ`, color: 'coral' },
  ]

  const colorClasses: Record<string, string> = {
    teal: 'bg-teal-100 text-teal-600 dark:bg-teal-500/15 dark:text-teal-400',
    coral: 'bg-coral-100 text-coral-600 dark:bg-coral-500/15 dark:text-coral-400',
    violet: 'bg-violet-100 text-violet-600 dark:bg-violet-500/15 dark:text-violet-400',
    rose: 'bg-rose-500/10 text-rose-500',
  }

  return (
    <div>
      <div className="mb-8 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div>
          <h1 className="font-display text-2xl font-semibold text-ink dark:text-white sm:text-3xl">
            Xin chào, {displayName} 👋
          </h1>
          <p className="mt-1 text-ink-soft dark:text-white/60">Hôm nay là một ngày tốt để học thêm vài từ mới.</p>
        </div>
        <Link to="/sets">
          <Button size="lg">
            Tiếp tục học <ArrowRight className="h-4 w-4" />
          </Button>
        </Link>
      </div>

      <div className="grid grid-cols-2 gap-4 lg:grid-cols-5">
        {stats.map((s, i) => (
          <motion.div
            key={s.label}
            initial={{ opacity: 0, y: 12 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: i * 0.05, duration: 0.35 }}
            className={s.big ? 'col-span-2 lg:col-span-1' : ''}
          >
            <Card className="h-full p-5">
              <div className={`mb-3 flex h-10 w-10 items-center justify-center rounded-xl ${colorClasses[s.color]}`}>
                <s.icon className="h-5 w-5" />
              </div>
              <p className="font-display text-2xl font-semibold text-ink dark:text-white">{s.value}</p>
              <p className="mt-0.5 text-sm text-ink-soft dark:text-white/60">{s.label}</p>
            </Card>
          </motion.div>
        ))}
      </div>

      <div className="mt-6 grid grid-cols-1 gap-6 lg:grid-cols-2">
        <Card className="p-6">
          <h3 className="font-display text-lg font-semibold text-ink dark:text-white">Từ đã học theo ngày</h3>
          <div className="mt-4 h-56">
            <ResponsiveContainer width="100%" height="100%">
              <LineChart data={chartData}>
                <CartesianGrid strokeDasharray="3 3" stroke="currentColor" className="text-ink/5 dark:text-white/5" />
                <XAxis dataKey="day" fontSize={12} tickLine={false} axisLine={false} />
                <YAxis fontSize={12} tickLine={false} axisLine={false} allowDecimals={false} />
                <Tooltip contentStyle={{ borderRadius: 12, border: '1px solid var(--color-border)', boxShadow: 'var(--shadow-soft)' }} />
                <Line type="monotone" dataKey="words" stroke="var(--color-primary)" strokeWidth={3} dot={{ r: 3 }} />
              </LineChart>
            </ResponsiveContainer>
          </div>
        </Card>

        <Card className="p-6">
          <h3 className="font-display text-lg font-semibold text-ink dark:text-white">Độ chính xác theo ngày</h3>
          <div className="mt-4 h-56">
            <ResponsiveContainer width="100%" height="100%">
              <LineChart data={chartData}>
                <CartesianGrid strokeDasharray="3 3" stroke="currentColor" className="text-ink/5 dark:text-white/5" />
                <XAxis dataKey="day" fontSize={12} tickLine={false} axisLine={false} />
                <YAxis fontSize={12} tickLine={false} axisLine={false} domain={[0, 100]} />
                <Tooltip contentStyle={{ borderRadius: 12, border: '1px solid var(--color-border)', boxShadow: 'var(--shadow-soft)' }} />
                <Line type="monotone" dataKey="accuracy" stroke="var(--color-accent)" strokeWidth={3} dot={{ r: 3 }} />
              </LineChart>
            </ResponsiveContainer>
          </div>
        </Card>
      </div>
    </div>
  )
}

function buildLast7DaysChart(sessions: StudySession[]) {
  const days: { day: string; words: number; accuracy: number }[] = []
  for (let i = 6; i >= 0; i--) {
    const d = new Date()
    d.setDate(d.getDate() - i)
    d.setHours(0, 0, 0, 0)
    const dayLabel = d.toLocaleDateString('vi-VN', { weekday: 'short' })
    const daySessions = sessions.filter((s) => {
      if (!s.completed_at) return false
      const sd = new Date(s.completed_at)
      return sd.toDateString() === d.toDateString()
    })
    const words = daySessions.reduce((sum, s) => sum + s.total_words, 0)
    const avgAccuracy =
      daySessions.length > 0
        ? Math.round(daySessions.reduce((sum, s) => sum + Number(s.accuracy), 0) / daySessions.length)
        : 0
    days.push({ day: dayLabel, words, accuracy: avgAccuracy })
  }
  return days
}
