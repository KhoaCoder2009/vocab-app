import { supabase } from '@/lib/supabase'
import { nextReviewDate } from '@/lib/utils'
import type { UserVocabularyProgress } from '@/types/database'

export const progressService = {
  async getForVocabulary(userId: string, vocabularyId: string): Promise<UserVocabularyProgress | null> {
    const { data, error } = await supabase
      .from('user_vocabulary_progress')
      .select('*')
      .eq('user_id', userId)
      .eq('vocabulary_id', vocabularyId)
      .maybeSingle()
    if (error) throw error
    return data
  },

  async getForSet(userId: string, vocabularyIds: string[]): Promise<Record<string, UserVocabularyProgress>> {
    if (vocabularyIds.length === 0) return {}
    const { data, error } = await supabase
      .from('user_vocabulary_progress')
      .select('*')
      .eq('user_id', userId)
      .in('vocabulary_id', vocabularyIds)
    if (error) throw error
    const map: Record<string, UserVocabularyProgress> = {}
    for (const row of data || []) map[row.vocabulary_id] = row
    return map
  },

  async getDueForReview(userId: string): Promise<UserVocabularyProgress[]> {
    const { data, error } = await supabase
      .from('user_vocabulary_progress')
      .select('*, vocabularies(*)')
      .eq('user_id', userId)
      .lte('next_review_at', new Date().toISOString())
      .order('next_review_at', { ascending: true })
    if (error) throw error
    return data || []
  },

  async countDueForReview(userId: string): Promise<number> {
    const { count, error } = await supabase
      .from('user_vocabulary_progress')
      .select('*', { count: 'exact', head: true })
      .eq('user_id', userId)
      .lte('next_review_at', new Date().toISOString())
    if (error) throw error
    return count || 0
  },

  /**
   * Ghi nhận 1 lượt trả lời cho 1 từ và cập nhật mastery / lịch ôn tập kế tiếp.
   * Logic:
   *  - Đúng: mastery_level tăng 1 (tối đa 5), next_review_at theo bậc mastery mới.
   *  - Sai: mastery_level giảm về tối đa max(0, level - 1), ôn lại ngay (level 0).
   */
  async recordAnswer(userId: string, vocabularyId: string, isCorrect: boolean): Promise<UserVocabularyProgress> {
    // Đảm bảo có row progress (idempotent) — dùng RPC đã tạo trong migration
    await supabase.rpc('ensure_progress', { p_user_id: userId, p_vocabulary_id: vocabularyId })

    const existing = await this.getForVocabulary(userId, vocabularyId)
    const current = existing || {
      times_seen: 0,
      times_correct: 0,
      times_wrong: 0,
      mastery_level: 0,
    }

    const newMastery = isCorrect
      ? Math.min(5, current.mastery_level + 1)
      : Math.max(0, current.mastery_level - 1)

    const nextReview = isCorrect ? nextReviewDate(newMastery) : new Date()

    const { data, error } = await supabase
      .from('user_vocabulary_progress')
      .update({
        times_seen: current.times_seen + 1,
        times_correct: current.times_correct + (isCorrect ? 1 : 0),
        times_wrong: current.times_wrong + (isCorrect ? 0 : 1),
        mastery_level: newMastery,
        last_reviewed_at: new Date().toISOString(),
        next_review_at: nextReview.toISOString(),
      })
      .eq('user_id', userId)
      .eq('vocabulary_id', vocabularyId)
      .select()
      .single()

    if (error) throw error
    return data
  },
}
