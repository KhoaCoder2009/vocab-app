import { forwardRef, type ButtonHTMLAttributes } from 'react'
import { cva, type VariantProps } from 'class-variance-authority'
import { Loader2 } from 'lucide-react'
import { cn } from '@/lib/utils'

const buttonVariants = cva(
  'inline-flex items-center justify-center gap-2 rounded-xl font-semibold transition-all duration-200 disabled:opacity-50 disabled:pointer-events-none active:scale-[0.97] whitespace-nowrap',
  {
    variants: {
      variant: {
        primary:
          'bg-teal-500 text-white shadow-[0_8px_20px_-6px_rgba(37,99,235,0.4)] hover:bg-teal-600 hover:shadow-[0_10px_24px_-6px_rgba(29,78,216,0.45)]',
        secondary:
          'bg-white text-ink border border-border shadow-card hover:border-teal-500/40 dark:bg-slate-800 dark:text-white dark:border-slate-700',
        coral:
          'bg-coral-500 text-slate-950 shadow-[0_8px_20px_-6px_rgba(180,83,9,0.35)] hover:bg-coral-600',
        ghost: 'bg-transparent text-ink hover:bg-ink/5 dark:text-white dark:hover:bg-white/10',
        outline: 'bg-transparent border-2 border-teal-500 text-teal-600 hover:bg-teal-500/10 dark:text-teal-400',
        danger: 'bg-rose-500 text-white hover:bg-rose-600',
      },
      size: {
        sm: 'h-9 px-3.5 text-sm',
        md: 'h-11 px-5 text-sm',
        lg: 'h-14 px-8 text-base',
        icon: 'h-10 w-10',
      },
    },
    defaultVariants: { variant: 'primary', size: 'md' },
  }
)

export interface ButtonProps
  extends ButtonHTMLAttributes<HTMLButtonElement>,
    VariantProps<typeof buttonVariants> {
  loading?: boolean
}

export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant, size, loading, children, disabled, ...props }, ref) => {
    return (
      <button
        ref={ref}
        className={cn(buttonVariants({ variant, size }), className)}
        disabled={disabled || loading}
        {...props}
      >
        {loading && <Loader2 className="h-4 w-4 animate-spin" />}
        {children}
      </button>
    )
  }
)
Button.displayName = 'Button'
