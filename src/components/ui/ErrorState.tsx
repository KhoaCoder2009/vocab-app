import { AlertTriangle, RotateCw } from 'lucide-react'
import { Button } from './Button'

interface ErrorStateProps {
  title?: string
  message?: string
  onRetry?: () => void
}

export function ErrorState({
  title = 'Đã xảy ra lỗi',
  message = 'Không thể tải dữ liệu. Vui lòng kiểm tra kết nối mạng và thử lại.',
  onRetry,
}: ErrorStateProps) {
  return (
    <div className="flex flex-col items-center justify-center rounded-[20px] border border-rose-200 bg-rose-50 px-6 py-14 text-center dark:border-rose-500/20 dark:bg-rose-500/10">
      <AlertTriangle className="mb-4 h-9 w-9 text-rose-500" />
      <h3 className="font-display text-lg font-semibold text-ink dark:text-white">{title}</h3>
      <p className="mt-1.5 max-w-sm text-sm text-ink-soft dark:text-white/60">{message}</p>
      {onRetry && (
        <Button variant="secondary" size="sm" className="mt-5" onClick={onRetry}>
          <RotateCw className="h-4 w-4" /> Thử lại
        </Button>
      )}
    </div>
  )
}
