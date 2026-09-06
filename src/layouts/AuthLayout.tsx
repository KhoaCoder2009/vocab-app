import { Outlet, Link } from 'react-router-dom'
import { Sparkles } from 'lucide-react'
import { motion } from 'framer-motion'

export function AuthLayout() {
  return (
    <div className="flex min-h-screen bg-paper dark:bg-[#12141F]">
      <div className="flex w-full flex-col justify-center px-6 py-12 sm:px-12 lg:w-1/2 lg:px-20">
        <Link to="/" className="mb-10 flex items-center gap-2">
          <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-teal-500 text-white">
            <Sparkles className="h-5 w-5" />
          </div>
          <span className="font-display text-lg font-semibold text-ink dark:text-white">VocaLoop</span>
        </Link>
        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4 }}
          className="mx-auto w-full max-w-sm"
        >
          <Outlet />
        </motion.div>
      </div>

      <div className="relative hidden w-1/2 items-center justify-center overflow-hidden bg-ink lg:flex">
        <div className="absolute inset-0 bg-gradient-to-br from-teal-600 via-ink to-violet-600 opacity-90" />
        <div className="relative z-10 max-w-md px-10 text-center text-white">
          <div className="mx-auto mb-8 flex h-24 w-32 -rotate-6 items-center justify-center rounded-2xl border border-white/20 bg-white/10 font-display text-2xl font-semibold shadow-lift backdrop-blur-sm">
            achieve
          </div>
          <h2 className="font-display text-2xl font-semibold leading-snug">
            Mỗi ngày một chút, từ vựng ở lại mãi mãi.
          </h2>
          <p className="mt-3 text-sm text-white/70">
            Flashcard thông minh, kiểm tra điền từ và ôn tập ngắt quãng giúp bạn ghi nhớ lâu hơn.
          </p>
        </div>
      </div>
    </div>
  )
}
