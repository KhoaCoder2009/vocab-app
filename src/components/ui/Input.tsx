import { forwardRef, type InputHTMLAttributes } from 'react'
import { cn } from '@/lib/utils'

export interface InputProps extends InputHTMLAttributes<HTMLInputElement> {
  label?: string
  error?: string
}

export const Input = forwardRef<HTMLInputElement, InputProps>(
  ({ className, label, error, id, ...props }, ref) => {
    const inputId = id || props.name
    return (
      <div className="w-full">
        {label && (
          <label htmlFor={inputId} className="mb-1.5 block text-sm font-medium text-ink-soft dark:text-white/70">
            {label}
          </label>
        )}
        <input
          id={inputId}
          ref={ref}
          className={cn(
            'h-12 w-full rounded-xl border border-ink/10 bg-white px-4 text-base text-ink placeholder:text-ink-soft/50 outline-none transition-colors focus:border-teal-500 dark:bg-white/5 dark:text-white dark:border-white/10',
            error && 'border-rose-500 focus:border-rose-500',
            className
          )}
          aria-invalid={Boolean(error)}
          {...props}
        />
        {error && <p className="mt-1.5 text-sm text-rose-500">{error}</p>}
      </div>
    )
  }
)
Input.displayName = 'Input'
