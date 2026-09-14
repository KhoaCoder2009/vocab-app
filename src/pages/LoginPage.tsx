import { useState, type FormEvent } from 'react'
import { Link, useLocation, useNavigate } from 'react-router-dom'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { authService } from '@/services/authService'
import { useToast } from '@/hooks/useToast'

export function LoginPage() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const navigate = useNavigate()
  const location = useLocation()
  const { showToast } = useToast()

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    setError(null)
    if (!email || !password) {
      setError('Vui lòng nhập đầy đủ email và mật khẩu.')
      return
    }
    setLoading(true)
    const result = await authService.signIn(email, password)
    setLoading(false)
    if (result.success) {
      showToast('Đăng nhập thành công!', 'success')
      const from = (location.state as { from?: Location })?.from?.pathname || '/dashboard'
      navigate(from, { replace: true })
    } else {
      setError(result.message || 'Đăng nhập thất bại.')
    }
  }

  return (
    <div>
      <h1 className="font-display text-2xl font-semibold text-ink dark:text-white">Chào mừng trở lại</h1>
      <p className="mt-1.5 text-sm text-ink-soft dark:text-white/60">Đăng nhập để tiếp tục hành trình học từ vựng.</p>

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
        <Input
          label="Password"
          type="password"
          name="password"
          autoComplete="current-password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          placeholder="Password"
        />
        {error && <p className="text-sm text-rose-500">{error}</p>}
        <div className="flex justify-end">
          <Link to="/forgot-password" className="text-sm font-medium text-teal-600 hover:underline dark:text-teal-400">
            Quên mật khẩu?
          </Link>
        </div>
        <Button type="submit" className="w-full" size="lg" loading={loading}>
          Đăng nhập
        </Button>
      </form>

      <p className="mt-6 text-center text-sm text-ink-soft dark:text-white/60">
        Chưa có tài khoản?{' '}
        <Link to="/register" className="font-medium text-teal-600 hover:underline dark:text-teal-400">
          Đăng ký ngay
        </Link>
      </p>
    </div>
  )
}
