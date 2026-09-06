import { Volume2 } from 'lucide-react'
import { motion } from 'framer-motion'
import { useTextToSpeech } from '@/hooks/useTextToSpeech'
import { cn } from '@/lib/utils'

interface AudioButtonProps {
  text: string
  size?: 'sm' | 'md' | 'lg'
  className?: string
}

const sizeMap = { sm: 'h-8 w-8', md: 'h-11 w-11', lg: 'h-14 w-14' }
const iconSizeMap = { sm: 'h-4 w-4', md: 'h-5 w-5', lg: 'h-6 w-6' }

export function AudioButton({ text, size = 'md', className }: AudioButtonProps) {
  const { speak, supported, speaking } = useTextToSpeech()

  return (
    <motion.button
      type="button"
      whileTap={{ scale: 0.9 }}
      onClick={(e) => {
        e.stopPropagation()
        speak(text)
      }}
      disabled={!supported}
      aria-label={`Phát âm từ ${text}`}
      title={supported ? 'Nghe phát âm' : 'Trình duyệt không hỗ trợ phát âm'}
      className={cn(
        'flex items-center justify-center rounded-full bg-teal-100 text-teal-600 transition-colors hover:bg-teal-500 hover:text-white disabled:opacity-40 dark:bg-teal-500/15 dark:text-teal-400',
        sizeMap[size],
        speaking && 'animate-pulse bg-teal-500 text-white',
        className
      )}
    >
      <Volume2 className={iconSizeMap[size]} />
    </motion.button>
  )
}
