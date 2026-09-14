import { Outlet, Link } from 'react-router-dom'
import { motion } from 'framer-motion'

export function AuthLayout() {
  return (
    <div className="min-h-screen bg-paper px-4 py-10 dark:bg-slate-900 sm:px-6 sm:py-14">
      <div className="mx-auto flex min-h-[calc(100vh-5rem)] w-full max-w-md flex-col justify-center sm:min-h-[calc(100vh-7rem)]">
        <Link to="/" className="mb-8 flex items-center justify-center gap-2.5">
          <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-teal-500 text-white shadow-[0_8px_20px_-8px_rgba(37,99,235,0.45)]">
            <span className="font-display text-2xl font-bold">K</span>
          </div>
          <span className="font-display text-xl font-semibold text-ink dark:text-white">learnvocab</span>
        </Link>
        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4 }}
          className="w-full rounded-[1.75rem] border border-border bg-white p-7 shadow-card dark:border-slate-700 dark:bg-slate-800 dark:shadow-none sm:p-9"
        >
          <Outlet />
        </motion.div>
      </div>
    </div>
  )
}
