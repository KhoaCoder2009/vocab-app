import { Link } from 'react-router-dom'
import { Compass } from 'lucide-react'
import { Button } from '@/components/ui/Button'

export function NotFoundPage() {
  return (
    <div className="flex min-h-screen flex-col items-center justify-center bg-paper px-6 text-center dark:bg-[#12141F]">
      <Compass className="mb-4 h-12 w-12 text-teal-500" />
      <h1 className="font-display text-3xl font-semibold text-ink dark:text-white">Không tìm thấy trang</h1>
      <p className="mt-2 max-w-sm text-ink-soft dark:text-white/60">
        Trang bạn đang tìm không tồn tại hoặc đã được di chuyển.
      </p>
      <Link to="/">
        <Button className="mt-6">Về trang chủ</Button>
      </Link>
    </div>
  )
}
