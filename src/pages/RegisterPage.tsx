import { useState, type FormEvent } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Button } from '@/components/ui/Button'
import { Input } from '@/components/ui/Input'
import { authService } from '@/services/authService'
import { useToast } from '@/hooks/useToast'

export function RegisterPage() {
  const [fullName, setFullName] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const navigate = useNavigate()
  const { showToast } = useToast()

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    setError(null)

    if (!fullName || !email || !password) {
      setError('Vui lòng nhập đầy đủ thông tin.')
      return
    }
    if (password.length < 6) {
      setError('Mật khẩu cần có ít nhất 6 ký tự.')
      return
    }
    if (password !== confirmPassword) {
      setError('Mật khẩu xác nhận không khớp.')
      return
    }

    setLoading(true)
    const result = await authService.signUp(email, password, fullName)
    setLoading(false)

    if (result.success) {
      showToast('Đăng ký thành công! Đang đưa bạn vào ứng dụng...', 'success')
      navigate('/dashboard', { replace: true })
    } else {
      setError(result.message || 'Đăng ký thất bại.')
    }
  }

  return (
    <div>
      <h1 className="font-display text-2xl font-semibold text-ink dark:text-white">Tạo tài khoản mới</h1>
      <p className="mt-1.5 text-sm text-ink-soft dark:text-white/60">Bắt đầu học từ vựng chỉ trong 30 giây.</p>

      <form onSubmit={handleSubmit} className="mt-8 space-y-4">
        <Input
          label="Username"
          name="fullName"
          autoComplete="name"
          value={fullName}
          onChange={(e) => setFullName(e.target.value)}
          placeholder="Username"
        />
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
          label="Mật khẩu"
          type="password"
          name="password"
          autoComplete="new-password"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
          placeholder="Ít nhất 6 ký tự"
        />
        <Input
          label="Xác nhận mật khẩu"
          type="password"
          name="confirmPassword"
          autoComplete="new-password"
          value={confirmPassword}
          onChange={(e) => setConfirmPassword(e.target.value)}
          placeholder="Nhập lại mật khẩu"
        />
        {error && <p className="text-sm text-rose-500">{error}</p>}
        <Button type="submit" className="w-full" size="lg" loading={loading}>
          Đăng ký
        </Button>
      </form>

      <p className="mt-6 text-center text-sm text-ink-soft dark:text-white/60">
        Đã có tài khoản?{' '}
        <Link to="/login" className="font-medium text-teal-600 hover:underline dark:text-teal-400">
          Đăng nhập
        </Link>
      </p>
    </div>
  )
}
