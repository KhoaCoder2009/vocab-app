import { type ClassValue, clsx } from 'clsx'
import { twMerge } from 'tailwind-merge'

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

/**
 * Chuẩn hóa input trước khi so sánh đáp án:
 * trim, lowercase, gộp khoảng trắng thừa. KHÔNG tự sửa lỗi chính tả.
 */
export function normalizeAnswer(input: string): string {
  return input.trim().toLowerCase().replace(/\s+/g, ' ')
}

export function isAnswerCorrect(userAnswer: string, correctAnswer: string): boolean {
  return normalizeAnswer(userAnswer) === normalizeAnswer(correctAnswer)
}

/** Tạo chuỗi gợi ý dạng "_ n v _ r _ n m _ n t" — hiện nguyên âm bị ẩn, giữ lại một số ký tự */
export function generateHint(word: string, revealRatio = 0.35): string {
  const chars = word.split('')
  const letterIndexes = chars
    .map((c, i) => ({ c, i }))
    .filter(({ c }) => /[a-zA-Z]/.test(c))
    .map(({ i }) => i)

  const revealCount = Math.max(1, Math.floor(letterIndexes.length * revealRatio))
  const revealSet = new Set<number>()
  // Luôn lộ ký tự đầu tiên
  if (letterIndexes.length > 0) revealSet.add(letterIndexes[0])
  let attempts = 0
  while (revealSet.size < revealCount && attempts < 100) {
    const idx = letterIndexes[Math.floor(Math.random() * letterIndexes.length)]
    revealSet.add(idx)
    attempts++
  }

  return chars
    .map((c, i) => {
      if (c === ' ') return '  '
      if (!/[a-zA-Z]/.test(c)) return c
      return revealSet.has(i) ? c : '_'
    })
    .join(' ')
}

export function formatDuration(seconds: number): string {
  const m = Math.floor(seconds / 60)
  const s = Math.floor(seconds % 60)
  return `${m.toString().padStart(2, '0')}:${s.toString().padStart(2, '0')}`
}

export function formatDate(iso: string | null): string {
  if (!iso) return '—'
  const d = new Date(iso)
  return d.toLocaleDateString('vi-VN', { day: '2-digit', month: '2-digit', year: 'numeric' })
}

export const MASTERY_INTERVAL_DAYS = [0, 1, 3, 7, 14, 30]

export function nextReviewDate(masteryLevel: number): Date {
  const days = MASTERY_INTERVAL_DAYS[Math.min(masteryLevel, MASTERY_INTERVAL_DAYS.length - 1)]
  const d = new Date()
  d.setDate(d.getDate() + days)
  return d
}
