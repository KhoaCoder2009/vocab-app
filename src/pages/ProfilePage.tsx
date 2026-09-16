import { useEffect, useState, type FormEvent } from 'react'
import { Mail, Calendar, Flame, BookMarked, Target, LogOut } from 'lucide-react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'
import { supabase } from '@/lib/supabase'
import { statsService, streakService } from '@/services/statsService'
import { sessionService } from '@/services/sessionService'
import { formatDate } from '@/lib/utils'
import { Card } from '@/components/ui/Card'
import { Input } from '@/components/ui/Input'
import { Button } from '@/components/ui/Button'
import { PageLoading } from '@/components/ui/Spinner'
import { ErrorState } from '@/components/ui/ErrorState'
import { useToast } from '@/hooks/useToast'
import { authService } from '@/services/authService'

export function ProfilePage() {
  const { user, profile, refreshProfile } = useAuth()
  const { showToast } = useToast()
  const navigate = useNavigate()
  const [fullName, setFullName] = useState('')
  const [saving, setSaving] = useState(false)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)
  const [stats, setStats] = useState<{
    totalWordsLearned: number
    accuracy: number
    sessionCount: number
    streak: number
  } | null>(null)

  useEffect(() => {
    setFullName(profile?.full_name || '')
  }, [profile])

  const load = async () => {
    if (!user) return
    setLoading(true)
    setError(false)
    try {
      const [overview, sessions, streak] = await Promise.all([
        statsService.overview(user.id),
        sessionService.recentSessions(user.id, 200),
        streakService.get(user.id),
      ])
      setStats({
        totalWordsLearned: overview.totalWordsLearned,
        accuracy: overview.accuracy,
        sessionCount: sessions.length,
        streak: streak?.current_streak || 0,
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

  const handleSave = async (e: FormEvent) => {
    e.preventDefault()
    if (!user) return
    setSaving(true)
    try {
      const { error: updateError } = await supabase
        .from('profiles')
        .update({ full_name: fullName })
        .eq('id', user.id)
      if (updateError) throw updateError
      await refreshProfile()
      showToast('Đã cập nhật hồ sơ.', 'success')
    } catch {
      showToast('Không thể cập nhật hồ sơ. Vui lòng thử lại.', 'error')
    } finally {
      setSaving(false)
    }
  }

  const handleSignOut = async () => {
    await authService.signOut()
    navigate('/login', { replace: true })
  }

  if (loading) return <PageLoading label="Đang tải hồ sơ..." />
  if (error || !stats) return <ErrorState onRetry={load} />

  const displayName = profile?.full_name || user?.email?.split('@')[0] || 'Bạn'

  return (
    <div className="mx-auto max-w-2xl">
      <h1 className="font-display text-2xl font-semibold text-ink dark:text-white sm:text-3xl">Hồ sơ</h1>

      <Card className="mt-6 p-6">
        <div className="flex items-center gap-4">
          <div className="flex h-16 w-16 items-center justify-center rounded-full bg-violet-100 font-display text-2xl font-semibold text-violet-600 dark:bg-violet-500/20 dark:text-violet-300">
            {displayName.charAt(0).toUpperCase()}
          </div>
          <div>
            <p className="font-display text-lg font-semibold text-ink dark:text-white">{displayName}</p>
            <p className="flex items-center gap-1.5 text-sm text-ink-soft dark:text-white/60">
              <Mail className="h-3.5 w-3.5" /> {user?.email}
            </p>
            <p className="mt-0.5 flex items-center gap-1.5 text-sm text-ink-soft dark:text-white/60">
              <Calendar className="h-3.5 w-3.5" /> Tham gia {formatDate(profile?.created_at || null)}
            </p>
          </div>
        </div>

        <div className="mt-6 border-t border-border pt-6 dark:border-slate-700">
          <h2 className="font-display text-lg font-semibold text-ink dark:text-white">Thông tin cá nhân</h2>
          <p className="mt-1 text-sm text-ink-soft dark:text-slate-300">Cập nhật tên hiển thị của bạn.</p>
        </div>

        <form onSubmit={handleSave} className="mt-4 flex flex-col gap-3 sm:flex-row sm:items-end">
          <div className="flex-1">
            <Input
              label="Username"
              name="fullName"
              autoComplete="name"
              value={fullName}
              onChange={(e) => setFullName(e.target.value)}
            />
          </div>
          <Button type="submit" loading={saving}>
            Lưu thay đổi
          </Button>
        </form>

        <div className="mt-6 border-t border-border pt-5 dark:border-slate-700">
          <Button type="button" variant="outline" onClick={handleSignOut} className="w-full sm:w-auto">
            <LogOut className="h-4 w-4" /> Đăng nhập tài khoản khác
          </Button>
        </div>
      </Card>

      <div className="mt-6 grid grid-cols-2 gap-4 sm:grid-cols-4">
        {[
          { icon: BookMarked, label: 'Tổng từ đã học', value: stats.totalWordsLearned },
          { icon: Target, label: 'Tổng session', value: stats.sessionCount },
          { icon: Target, label: 'Độ chính xác', value: `${stats.accuracy}%` },
          { icon: Flame, label: 'Streak', value: `${stats.streak} ngày` },
        ].map((s) => (
          <Card key={s.label} className="p-4 text-center">
            <s.icon className="mx-auto mb-2 h-5 w-5 text-teal-500" />
            <p className="font-display text-xl font-semibold text-ink dark:text-white">{s.value}</p>
            <p className="mt-0.5 text-xs text-ink-soft dark:text-white/60">{s.label}</p>
          </Card>
        ))}
      </div>
    </div>
  )
}
