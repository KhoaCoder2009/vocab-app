import { forwardRef, type InputHTMLAttributes } from 'react'
import { cn } from '@/lib/utils'

interface AnswerInputProps extends InputHTMLAttributes<HTMLInputElement> {
  state?: 'idle' | 'correct' | 'incorrect'
}

export const AnswerInput = forwardRef<HTMLInputElement, AnswerInputProps>(
  ({ className, state = 'idle', ...props }, ref) => {
    return (
      <input
        ref={ref}
        className={cn(
          'h-14 w-full rounded-xl border-2 bg-white px-4 text-center font-display text-xl font-semibold text-ink outline-none transition-colors dark:bg-white/5 dark:text-white',
          state === 'idle' && 'border-ink/10 focus:border-teal-500 dark:border-white/10',
          state === 'correct' && 'border-teal-500 bg-teal-50 text-teal-700 dark:bg-teal-500/10 dark:text-teal-300',
          state === 'incorrect' && 'border-rose-500 bg-rose-50 text-rose-600 dark:bg-rose-500/10 dark:text-rose-300',
          className
        )}
        {...props}
      />
    )
  }
)
AnswerInput.displayName = 'AnswerInput'
