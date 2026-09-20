import { getLocalQuizQuestion, getLocalQuizQuestions, type GrammarQuestionType } from '@/data/grammarQuizzes'
import { supabase } from '@/lib/supabase'
import { normalizeAnswer } from '@/lib/utils'

export type { GrammarQuestionType }

export interface GrammarQuizQuestion {
  id: string
  lesson_id: string
  type: GrammarQuestionType
  prompt: string
  options: string[]
  sort_order: number
}

export interface GrammarQuizResult {
  is_correct: boolean
  correct_answer: string
  explanation: string
}

function toPublicQuestion(item: {
  id: string
  lesson_id: string
  type: GrammarQuestionType
  prompt: string
  options: string[]
  sort_order: number
}): GrammarQuizQuestion {
  return {
    id: item.id,
    lesson_id: item.lesson_id,
    type: item.type,
    prompt: item.prompt,
    options: item.options,
    sort_order: item.sort_order,
  }
}

function localResult(questionId: string, selectedAnswer: string): GrammarQuizResult {
  const question = getLocalQuizQuestion(questionId)
  if (!question) {
    throw new Error('Question not found')
  }
  return {
    is_correct: normalizeAnswer(selectedAnswer) === normalizeAnswer(question.correct_answer),
    correct_answer: question.correct_answer,
    explanation: question.explanation,
  }
}

export const grammarQuizService = {
  async listQuestions(lessonId: string): Promise<GrammarQuizQuestion[]> {
    try {
      const { data, error } = await supabase
        .from('grammar_quiz_questions')
        .select('id, lesson_id, type, prompt, options, sort_order')
        .eq('lesson_id', lessonId)
        .order('sort_order')
      if (!error && data && data.length > 0) {
        return data as GrammarQuizQuestion[]
      }
    } catch {
      // Dùng ngân hàng câu hỏi local khi bảng quiz chưa có trên Supabase.
    }
    return getLocalQuizQuestions(lessonId).map(toPublicQuestion)
  },

  async submitAnswer(questionId: string, selectedAnswer: string): Promise<GrammarQuizResult> {
    try {
      const { data, error } = await supabase.rpc('submit_grammar_quiz_answer', {
        p_question_id: questionId,
        p_selected_answer: selectedAnswer,
      })
      if (!error && data) {
        const result = Array.isArray(data) ? data[0] : data
        return result as GrammarQuizResult
      }
    } catch {
      // Chấm local nếu RPC quiz chưa được tạo.
    }
    return localResult(questionId, selectedAnswer)
  },
}
