import { Link } from 'react-router-dom'
import { motion } from 'framer-motion'
import { BookOpen, ArrowRight } from 'lucide-react'
import { ProgressBar } from '@/components/ui/ProgressBar'
import type { VocabularySet } from '@/types/database'

const difficultyLabel: Record<string, string> = {
  easy: 'Dễ',
  medium: 'Trung bình',
  hard: 'Khó',
}

const difficultyColor: Record<string, string> = {
  easy: 'bg-teal-100 text-teal-600 dark:bg-teal-500/15 dark:text-teal-400',
  medium: 'bg-coral-100 text-coral-600 dark:bg-coral-500/15 dark:text-coral-400',
  hard: 'bg-rose-500/10 text-rose-500',
}

const coverGradient: Record<string, string> = {
  teal: 'from-teal-500/15 to-teal-500/0',
  coral: 'from-coral-500/15 to-coral-500/0',
  violet: 'from-violet-500/15 to-violet-500/0',
}

interface SetCardProps {
  set: VocabularySet
  index?: number
}

export function SetCard({ set, index = 0 }: SetCardProps) {
  const learned = set.learned_count || 0
  const total = set.word_count || 0

  return (
    <motion.div
      initial={{ opacity: 0, y: 14 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ delay: index * 0.04, duration: 0.35 }}
    >
      <Link to={`/sets/${set.id}`} className="group block h-full">
        <div className="flex h-full flex-col rounded-[20px] border border-ink/[0.06] bg-white shadow-card transition-all duration-200 hover:-translate-y-1 hover:shadow-lift dark:border-white/[0.06] dark:bg-[#1A1D2E]">
          <div className={`flex h-24 items-center justify-between rounded-t-[20px] bg-gradient-to-br px-5 ${coverGradient[set.cover_color || 'teal']}`}>
            <BookOpen className="h-7 w-7 text-ink/70 dark:text-white/70" />
            <span className={`rounded-full px-2.5 py-1 text-xs font-medium ${difficultyColor[set.difficulty]}`}>
              {difficultyLabel[set.difficulty]}
            </span>
          </div>
          <div className="flex flex-1 flex-col p-5">
            <h3 className="font-display text-lg font-semibold text-ink dark:text-white">{set.title}</h3>
            <p className="mt-1 line-clamp-2 flex-1 text-sm text-ink-soft dark:text-white/60">{set.description}</p>
            <div className="mt-4">
              <div className="mb-1.5 flex justify-between text-xs text-ink-soft dark:text-white/50">
                <span>{total} từ</span>
                <span>{learned}/{total} đã học</span>
              </div>
              <ProgressBar value={learned} max={total || 1} />
            </div>
            <div className="mt-4 flex items-center justify-between">
              <span className="text-sm font-semibold text-teal-600 dark:text-teal-400">Học ngay</span>
              <ArrowRight className="h-4 w-4 text-teal-600 transition-transform group-hover:translate-x-1 dark:text-teal-400" />
            </div>
          </div>
        </div>
      </Link>
    </motion.div>
  )
}
