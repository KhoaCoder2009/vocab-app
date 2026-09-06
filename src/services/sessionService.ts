import { supabase } from '@/lib/supabase'
import type { StudySession } from '@/types/database'

export const sessionService = {
  async startSession(userId: string, setId: string, mode: StudySession['mode']): Promise<StudySession> {
    const { data, error } = await supabase
      .from('study_sessions')
      .insert({ user_id: userId, set_id: setId, mode, total_words: 0 })
      .select()
      .single()
    if (error) throw error
    return data
  },

  async recordAnswer(params: {
    sessionId: string
    userId: string
    vocabularyId: string
    userAnswer: string
    correctAnswer: string
    isCorrect: boolean
    usedHint: boolean
  }): Promise<void> {
    const { error } = await supabase.from('study_answers').insert({
      session_id: params.sessionId,
      user_id: params.userId,
      vocabulary_id: params.vocabularyId,
      user_answer: params.userAnswer,
      correct_answer: params.correctAnswer,
      is_correct: params.isCorrect,
      used_hint: params.usedHint,
    })
    if (error) throw error
  },

  async completeSession(
    sessionId: string,
    stats: { totalWords: number; correctAnswers: number; wrongAnswers: number; score: number }
  ): Promise<StudySession> {
    const accuracy = stats.totalWords > 0 ? Math.round((stats.correctAnswers / stats.totalWords) * 10000) / 100 : 0
    const { data, error } = await supabase
      .from('study_sessions')
      .update({
        completed_at: new Date().toISOString(),
        total_words: stats.totalWords,
        correct_answers: stats.correctAnswers,
        wrong_answers: stats.wrongAnswers,
        score: stats.score,
        accuracy,
      })
      .eq('id', sessionId)
      .select()
      .single()
    if (error) throw error

    // cập nhật streak (bỏ qua lỗi nếu có, không chặn luồng chính)
    try {
      await supabase.rpc('touch_streak', { p_user_id: data.user_id })
    } catch {
      // no-op — streak không phải chức năng chặn kết quả bài học
    }

    return data
  },

  async getSession(sessionId: string): Promise<StudySession | null> {
    const { data, error } = await supabase.from('study_sessions').select('*').eq('id', sessionId).maybeSingle()
    if (error) throw error
    return data
  },

  async getWrongVocabularyIds(sessionId: string): Promise<string[]> {
    const { data, error } = await supabase
      .from('study_answers')
      .select('vocabulary_id')
      .eq('session_id', sessionId)
      .eq('is_correct', false)
    if (error) throw error
    return [...new Set((data || []).map((r) => r.vocabulary_id))]
  },

  async recentSessions(userId: string, limit = 30): Promise<StudySession[]> {
    const { data, error } = await supabase
      .from('study_sessions')
      .select('*')
      .eq('user_id', userId)
      .not('completed_at', 'is', null)
      .order('completed_at', { ascending: false })
      .limit(limit)
    if (error) throw error
    return data || []
  },
}
