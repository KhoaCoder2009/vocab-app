import { supabase } from '@/lib/supabase'
import type { GrammarTense, WritingExercise } from '@/data/grammarTenses'

interface GrammarLessonRow {
  id: string
  name: string
  name_vi: string
  category: GrammarTense['category']
  level: string
  summary: string
  formula: GrammarTense['formula']
  uses: string[]
  signals: string[]
  examples: GrammarTense['examples']
  common_mistakes: GrammarTense['commonMistakes']
  compare_with: string
  vocabulary: GrammarTense['vocabulary']
}

interface GrammarExerciseRow {
  id: string
  lesson_id: string
  level: WritingExercise['level']
  topic: string
  vietnamese: string
  accepted_answers: string[]
  explanation: string
  sort_order: number
}

export interface GrammarProgress {
  lesson_id: string
  attempts: number
  correct_attempts: number
}

export interface GrammarAttemptResult {
  is_correct: boolean
  correct_answer: string
  explanation: string
  attempts: number
  correct_attempts: number
}

function mapLesson(row: GrammarLessonRow, exercises: GrammarExerciseRow[]): GrammarTense {
  return {
    id: row.id,
    name: row.name,
    nameVi: row.name_vi,
    category: row.category,
    level: row.level,
    summary: row.summary,
    formula: row.formula,
    uses: row.uses,
    signals: row.signals,
    examples: row.examples,
    commonMistakes: row.common_mistakes,
    compareWith: row.compare_with,
    vocabulary: row.vocabulary,
    writingExercises: exercises
      .sort((a, b) => a.sort_order - b.sort_order)
      .map(({ lesson_id: _lessonId, sort_order: _sortOrder, accepted_answers, ...exercise }) => ({
        ...exercise,
        acceptedAnswers: accepted_answers,
      })),
  }
}

export const grammarService = {
  async listLessons(): Promise<GrammarTense[]> {
    const { data, error } = await supabase
      .from('grammar_lessons')
      .select('*, grammar_writing_exercises(*)')
      .eq('is_published', true)
      .order('id')
    if (error) throw error
    return ((data || []) as Array<GrammarLessonRow & { grammar_writing_exercises: GrammarExerciseRow[] }>).map((row) =>
      mapLesson(row, row.grammar_writing_exercises || [])
    )
  },

  async getProgress(userId: string): Promise<GrammarProgress[]> {
    const { data, error } = await supabase.from('grammar_progress').select('lesson_id, attempts, correct_attempts').eq('user_id', userId)
    if (error) throw error
    return data || []
  },

  async submitAttempt(lessonId: string, exerciseId: string, answer: string): Promise<GrammarAttemptResult> {
    const { data, error } = await supabase.rpc('submit_grammar_attempt', {
      p_lesson_id: lessonId,
      p_exercise_id: exerciseId,
      p_submitted_answer: answer,
    })
    if (error) throw error
    const result = Array.isArray(data) ? data[0] : data
    return result as GrammarAttemptResult
  },
}
