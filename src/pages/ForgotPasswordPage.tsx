import { useState, type FormEvent } from 'react'
import { Link } from 'react-router-dom'
import { CheckCircle2 } from 'lucide-react'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { authService } from '@/services/authService'

export function ForgotPasswordPage() {
  const [email, setEmail] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [sent, setSent] = useState(false)

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    setError(null)
    if (!email) {
      setError('Vui lòng nhập email của bạn.')
      return
    }
    setLoading(true)
    const result = await authService.resetPassword(email)
    setLoading(false)
    if (result.success) {
      setSent(true)
    } else {
      setError(result.message || 'Không thể gửi email đặt lại mật khẩu.')
    }
  }

  if (sent) {
    return (
      <div className="text-center">
        <div className="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-full bg-teal-100 text-teal-600 dark:bg-teal-500/15 dark:text-teal-400">
          <CheckCircle2 className="h-7 w-7" />
        </div>
        <h1 className="font-display text-xl font-semibold text-ink dark:text-white">Kiểm tra email của bạn</h1>
        <p className="mt-2 text-sm text-ink-soft dark:text-white/60">
          Chúng tôi đã gửi liên kết đặt lại mật khẩu tới <strong>{email}</strong>.
        </p>
        <Link to="/login">
          <Button variant="secondary" className="mt-6 w-full">
            Quay lại đăng nhập
          </Button>
        </Link>
      </div>
    )
  }

  return (
    <div>
      <h1 className="font-display text-2xl font-semibold text-ink dark:text-white">Quên mật khẩu?</h1>
      <p className="mt-1.5 text-sm text-ink-soft dark:text-white/60">
        Nhập email của bạn, chúng tôi sẽ gửi liên kết để đặt lại mật khẩu.
      </p>

      <form onSubmit={handleSubmit} className="mt-8 space-y-4">
        <Input
          label="Email"
          type="email"
          name="email"
          autoComplete="email"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          placeholder="ban@email.com"
        />
        {error && <p className="text-sm text-rose-500">{error}</p>}
        <Button type="submit" className="w-full" size="lg" loading={loading}>
          Gửi liên kết đặt lại
        </Button>
      </form>

      <p className="mt-6 text-center text-sm text-ink-soft dark:text-white/60">
        Nhớ mật khẩu rồi?{' '}
        <Link to="/login" className="font-medium text-teal-600 hover:underline dark:text-teal-400">
          Đăng nhập
        </Link>
      </p>
    </div>
  )
}
