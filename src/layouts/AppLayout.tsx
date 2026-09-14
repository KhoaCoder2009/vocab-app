import { NavLink, Outlet, useNavigate } from 'react-router-dom'
import { Home, BookOpen, RotateCcw, Star, BarChart3, User, Moon, Sun, LogOut } from 'lucide-react'
import { useAuth } from '@/hooks/useAuth'
import { useTheme } from '@/hooks/useTheme'
import { authService } from '@/services/authService'
import { cn } from '@/lib/utils'

const navItems = [
  { to: '/dashboard', label: 'Trang chủ', icon: Home },
  { to: '/sets', label: 'Bộ từ vựng', icon: BookOpen },
  { to: '/review', label: 'Ôn tập', icon: RotateCcw },
  { to: '/favorites', label: 'Yêu thích', icon: Star },
  { to: '/statistics', label: 'Thống kê', icon: BarChart3 },
  { to: '/profile', label: 'Hồ sơ', icon: User },
]

export function AppLayout() {
  const { profile, user } = useAuth()
  const { theme, toggleTheme } = useTheme()
  const navigate = useNavigate()

  const handleSignOut = async () => {
    await authService.signOut()
    navigate('/')
  }

  const displayName = profile?.full_name || user?.email?.split('@')[0] || 'Bạn'

  return (
    <div className="min-h-screen bg-paper dark:bg-[#12141F]">
      {/* Desktop sidebar */}
      <aside className="fixed inset-y-0 left-0 z-30 hidden w-64 flex-col border-r border-ink/[0.06] bg-white/80 backdrop-blur-xl dark:border-white/[0.06] dark:bg-[#161826]/80 lg:flex">
        <div className="flex items-center gap-2 px-6 py-6">
          <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-teal-500 text-white">
            <span className="font-display text-xl font-bold">K</span>
          </div>
          <span className="font-display text-lg font-semibold">learnvocab</span>
        </div>

        <nav className="flex-1 space-y-1 px-3">
          {navItems.map((item) => (
            <NavLink
              key={item.to}
              to={item.to}
              className={({ isActive }) =>
                cn(
                  'flex items-center gap-3 rounded-xl px-3.5 py-2.5 text-sm font-medium text-ink-soft transition-colors dark:text-white/60',
                  isActive
                    ? 'bg-teal-500/10 text-teal-600 dark:text-teal-400'
                    : 'hover:bg-ink/[0.04] hover:text-ink dark:hover:bg-white/[0.06] dark:hover:text-white'
                )
              }
            >
              <item.icon className="h-[18px] w-[18px]" />
              {item.label}
            </NavLink>
          ))}
        </nav>

        <div className="border-t border-ink/[0.06] p-3 dark:border-white/[0.06]">
          <div className="mb-2 flex items-center gap-3 rounded-xl px-2 py-2">
            <div className="flex h-9 w-9 items-center justify-center rounded-full bg-violet-100 font-display font-semibold text-violet-600 dark:bg-violet-500/20 dark:text-violet-300">
              {displayName.charAt(0).toUpperCase()}
            </div>
            <div className="min-w-0 flex-1">
              <p className="truncate text-sm font-medium">{displayName}</p>
              <p className="truncate text-xs text-ink-soft dark:text-white/50">{user?.email}</p>
            </div>
          </div>
          <button
            onClick={toggleTheme}
            className="flex w-full items-center gap-3 rounded-xl px-3.5 py-2.5 text-sm font-medium text-ink-soft hover:bg-ink/[0.04] dark:text-white/60 dark:hover:bg-white/[0.06]"
          >
            {theme === 'dark' ? <Sun className="h-[18px] w-[18px]" /> : <Moon className="h-[18px] w-[18px]" />}
            {theme === 'dark' ? 'Chế độ sáng' : 'Chế độ tối'}
          </button>
          <button
            onClick={handleSignOut}
            className="flex w-full items-center gap-3 rounded-xl px-3.5 py-2.5 text-sm font-medium text-rose-500 hover:bg-rose-500/10"
          >
            <LogOut className="h-[18px] w-[18px]" />
            Đăng xuất
          </button>
        </div>
      </aside>

      {/* Mobile top bar */}
      <header className="sticky top-0 z-30 flex items-center justify-between border-b border-ink/[0.06] bg-white/80 px-4 py-3 backdrop-blur-xl dark:border-white/[0.06] dark:bg-[#161826]/80 lg:hidden">
        <div className="flex items-center gap-2">
          <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-teal-500 text-white">
            <span className="font-display text-lg font-bold">K</span>
          </div>
          <span className="font-display text-base font-semibold">learnvocab</span>
        </div>
        <button
          onClick={toggleTheme}
          aria-label="Chuyển giao diện sáng/tối"
          className="flex h-9 w-9 items-center justify-center rounded-full text-ink-soft hover:bg-ink/5 dark:text-white/70"
        >
          {theme === 'dark' ? <Sun className="h-5 w-5" /> : <Moon className="h-5 w-5" />}
        </button>
      </header>

      <main className="min-h-screen pb-24 lg:ml-64 lg:pb-8">
        <div className="mx-auto max-w-6xl px-4 py-6 sm:px-6 lg:px-8">
          <Outlet />
        </div>
      </main>

      {/* Mobile bottom nav */}
      <nav className="fixed inset-x-0 bottom-0 z-30 flex items-center justify-around border-t border-ink/[0.06] bg-white/95 py-2 backdrop-blur-xl dark:border-white/[0.06] dark:bg-[#161826]/95 lg:hidden">
        {navItems.map((item) => (
          <NavLink
            key={item.to}
            to={item.to}
            className={({ isActive }) =>
              cn(
                'flex flex-col items-center gap-1 rounded-xl px-3 py-1.5 text-[11px] font-medium text-ink-soft dark:text-white/50',
                isActive && 'text-teal-600 dark:text-teal-400'
              )
            }
          >
            <item.icon className="h-5 w-5" />
            {item.label}
          </NavLink>
        ))}
      </nav>
    </div>
  )
}
