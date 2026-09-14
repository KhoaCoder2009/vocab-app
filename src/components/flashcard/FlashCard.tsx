import { motion, AnimatePresence } from 'framer-motion'
import { Sparkles } from 'lucide-react'
import { AudioButton } from '@/components/vocab/AudioButton'
import { formatPartOfSpeech } from '@/lib/utils'
import type { Vocabulary } from '@/types/database'

interface FlashCardProps {
  word: Vocabulary
  flipped: boolean
  onFlip: () => void
}

export function FlashCard({ word, flipped, onFlip }: FlashCardProps) {
  const formattedPos = formatPartOfSpeech(word.part_of_speech)

  return (
    <div className="mx-auto h-[380px] w-full max-w-md [perspective:1600px] sm:h-[420px]">
      <motion.div
        className="relative h-full w-full cursor-pointer [transform-style:preserve-3d]"
        animate={{ rotateY: flipped ? 180 : 0 }}
        transition={{ duration: 0.45, ease: 'easeInOut' }}
        onClick={onFlip}
        role="button"
        tabIndex={0}
        aria-label={flipped ? 'Ẩn nghĩa' : 'Hiện nghĩa'}
        onKeyDown={(e) => {
          if (e.key === 'Enter') onFlip()
        }}
      >
        {/* FRONT */}
        <div className="absolute inset-0 flex flex-col items-center justify-center rounded-[24px] border border-ink/[0.12] bg-white p-8 text-center text-ink shadow-lift [backface-visibility:hidden]">
          <p className="font-display text-4xl font-semibold sm:text-5xl">{word.word}</p>
          <div className="mt-3 flex flex-wrap items-center justify-center gap-2">
            {word.pronunciation && (
              <p className="text-lg text-ink-soft">{word.pronunciation}</p>
            )}
            {formattedPos && (
              <span className="rounded-full bg-violet-100 px-3 py-1 text-sm font-semibold text-violet-600 dark:bg-violet-500/15 dark:text-violet-300">
                {formattedPos}
              </span>
            )}
          </div>
          <div className="mt-6" onClick={(e) => e.stopPropagation()}>
            <AudioButton text={word.word} size="lg" />
          </div>
          <span className="mt-10 inline-flex items-center gap-1.5 rounded-full bg-ink/5 px-4 py-2 text-sm font-medium text-ink-soft">
            Nhấn để hiện nghĩa
          </span>
        </div>

        {/* BACK */}
        <div className="absolute inset-0 flex flex-col items-center justify-center overflow-y-auto rounded-[24px] border border-ink/[0.12] bg-white p-8 text-center text-ink shadow-lift [backface-visibility:hidden] [transform:rotateY(180deg)]">
          <Sparkles className="mb-2 h-6 w-6 text-teal-500" />
          <p className="font-display text-2xl font-semibold sm:text-3xl">{word.word}</p>
          <p className="mt-1 font-display text-xl font-semibold text-teal-600">{word.meaning}</p>
          {formattedPos && (
            <span className="mt-2 rounded-full bg-violet-100 px-3 py-1 text-sm font-semibold text-violet-600 dark:bg-violet-500/15 dark:text-violet-300">
              {formattedPos}
            </span>
          )}
          {word.example && (
            <div className="mt-5 space-y-1.5 border-t border-teal-500/15 pt-4">
              <p className="text-sm italic text-ink">&ldquo;{word.example}&rdquo;</p>
              {word.example_translation && (
                <p className="text-sm italic text-ink-soft">&ldquo;{word.example_translation}&rdquo;</p>
              )}
            </div>
          )}
        </div>
      </motion.div>
    </div>
  )
}

export function FlashCardTransition({
  children,
  cardKey,
}: {
  children: React.ReactNode
  cardKey: string | number
}) {
  return (
    <AnimatePresence mode="wait">
      <motion.div
        key={cardKey}
        initial={{ opacity: 0, x: 24 }}
        animate={{ opacity: 1, x: 0 }}
        exit={{ opacity: 0, x: -24 }}
        transition={{ duration: 0.25 }}
      >
        {children}
      </motion.div>
    </AnimatePresence>
  )
}
