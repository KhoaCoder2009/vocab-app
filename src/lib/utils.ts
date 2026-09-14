import { type ClassValue, clsx } from 'clsx'
import { twMerge } from 'tailwind-merge'

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

export function shuffleArray<T>(items: T[]): T[] {
  const shuffled = [...items]
  for (let i = shuffled.length - 1; i > 0; i -= 1) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]]
  }
  return shuffled
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

/**
 * Lấy URL ảnh minh họa cho từ vựng.
 * Ưu tiên: image_url từ DB → Pixabay API → Unsplash fallback
 */
export function getVocabularyImage(word: string, imageUrl?: string | null): string {
  if (imageUrl) return imageUrl
  
  // Fallback: Unsplash Source API (nếu Pixabay không có hoặc chưa load)
  // Kích thước cố định 400x300 để tối ưu bandwidth
  const query = encodeURIComponent(word)
  return `https://source.unsplash.com/400x300/?${query}`
}

/**
 * Format loại từ thành tên đầy đủ để hiển thị trong giao diện.
 */
export function formatPartOfSpeech(pos: string | null | undefined): string {
  if (!pos) return ''
  const map: Record<string, string> = {
    noun: 'Danh từ',
    n: 'Danh từ',
    'n.': 'Danh từ',
    verb: 'Động từ',
    v: 'Động từ',
    'v.': 'Động từ',
    adjective: 'Tính từ',
    adj: 'Tính từ',
    'adj.': 'Tính từ',
    adverb: 'Trạng từ',
    adv: 'Trạng từ',
    'adv.': 'Trạng từ',
    pronoun: 'Đại từ',
    pron: 'Đại từ',
    'pron.': 'Đại từ',
    preposition: 'Giới từ',
    prep: 'Giới từ',
    'prep.': 'Giới từ',
    conjunction: 'Liên từ',
    conj: 'Liên từ',
    'conj.': 'Liên từ',
    interjection: 'Thán từ',
    interj: 'Thán từ',
    'interj.': 'Thán từ',
  }
  return map[pos.toLowerCase()] || pos
}
