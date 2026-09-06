import { supabase } from '@/lib/supabase'
import type { UserStreak } from '@/types/database'

export const favoritesService = {
  async list(userId: string) {
    const { data, error } = await supabase
      .from('favorites')
      .select('*, vocabularies(*)')
      .eq('user_id', userId)
      .order('created_at', { ascending: false })
    if (error) throw error
    return data || []
  },

  async isFavorite(userId: string, vocabularyId: string): Promise<boolean> {
    const { data, error } = await supabase
      .from('favorites')
      .select('id')
      .eq('user_id', userId)
      .eq('vocabulary_id', vocabularyId)
      .maybeSingle()
    if (error) throw error
    return Boolean(data)
  },

  async toggle(userId: string, vocabularyId: string): Promise<boolean> {
    const exists = await this.isFavorite(userId, vocabularyId)
    if (exists) {
      const { error } = await supabase
        .from('favorites')
        .delete()
        .eq('user_id', userId)
        .eq('vocabulary_id', vocabularyId)
      if (error) throw error
      return false
    } else {
      const { error } = await supabase.from('favorites').insert({ user_id: userId, vocabulary_id: vocabularyId })
      if (error) throw error
      return true
    }
  },
}

export const streakService = {
  async get(userId: string): Promise<UserStreak | null> {
    const { data, error } = await supabase.from('user_streaks').select('*').eq('user_id', userId).maybeSingle()
    if (error) throw error
    return data
  },
}

export const statsService = {
  async overview(userId: string) {
    const [{ count: totalAnswers }, { count: correctAnswers }, { data: sessions }] = await Promise.all([
      supabase.from('study_answers').select('*', { count: 'exact', head: true }).eq('user_id', userId),
      supabase
        .from('study_answers')
        .select('*', { count: 'exact', head: true })
        .eq('user_id', userId)
        .eq('is_correct', true),
      supabase
        .from('study_sessions')
        .select('*')
        .eq('user_id', userId)
        .not('completed_at', 'is', null)
        .order('completed_at', { ascending: false })
        .limit(90),
    ])

    const totalWordsLearned = new Set(
      (
        await supabase
          .from('user_vocabulary_progress')
          .select('vocabulary_id')
          .eq('user_id', userId)
          .gt('mastery_level', 0)
      ).data?.map((r) => r.vocabulary_id) || []
    ).size

    const total = totalAnswers || 0
    const correct = correctAnswers || 0
    const accuracy = total > 0 ? Math.round((correct / total) * 10000) / 100 : 0

    return {
      totalAnswers: total,
      correctAnswers: correct,
      wrongAnswers: total - correct,
      accuracy,
      totalWordsLearned,
      sessions: sessions || [],
    }
  },

  async wordsLearnedToday(userId: string): Promise<number> {
    const startOfDay = new Date()
    startOfDay.setHours(0, 0, 0, 0)
    const { data, error } = await supabase
      .from('study_answers')
      .select('vocabulary_id')
      .eq('user_id', userId)
      .gte('answered_at', startOfDay.toISOString())
    if (error) throw error
    return new Set((data || []).map((r) => r.vocabulary_id)).size
  },
}
