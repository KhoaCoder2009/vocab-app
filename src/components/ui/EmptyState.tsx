import type { ReactNode } from 'react'
import { cn } from '@/lib/utils'

interface EmptyStateProps {
  icon?: ReactNode
  title: string
  description?: string
  action?: ReactNode
  className?: string
}

export function EmptyState({ icon, title, description, action, className }: EmptyStateProps) {
  return (
    <div
      className={cn(
        'flex flex-col items-center justify-center rounded-[20px] border border-dashed border-border bg-white/80 px-6 py-14 text-center dark:border-slate-700 dark:bg-slate-800',
        className
      )}
    >
      {icon && <div className="mb-4 text-ink-soft/60 dark:text-white/40">{icon}</div>}
      <h3 className="font-display text-lg font-semibold text-ink dark:text-white">{title}</h3>
      {description && <p className="mt-1.5 max-w-sm text-sm text-ink-soft dark:text-white/60">{description}</p>}
      {action && <div className="mt-5">{action}</div>}
    </div>
  )
}
