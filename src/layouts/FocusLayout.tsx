import { Outlet, useNavigate } from 'react-router-dom'
import { X } from 'lucide-react'

/**
 * Layout tối giản dùng cho các trang học tập cần tập trung: /learn, /practice, /result
 * Chỉ có nút thoát, không có sidebar/nav để tránh phân tâm.
 */
export function FocusLayout() {
  const navigate = useNavigate()
  return (
    <div className="min-h-screen bg-paper dark:bg-slate-900">
      <header className="flex items-center justify-between px-4 py-4 sm:px-8">
        <button
          onClick={() => navigate('/dashboard')}
          aria-label="Thoát"
          className="flex h-10 w-10 items-center justify-center rounded-full text-ink-soft hover:bg-ink/5 dark:text-white/70 dark:hover:bg-white/10"
        >
          <X className="h-5 w-5" />
        </button>
      </header>
      <main className="mx-auto max-w-2xl px-4 pb-16 sm:px-6">
        <Outlet />
      </main>
    </div>
  )
}
