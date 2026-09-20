// Các kiểu dữ liệu tương ứng với schema Supabase (xem supabase/migrations/0001_init.sql)

export type Difficulty = 'easy' | 'medium' | 'hard'

export interface Profile {
  id: string
  full_name: string | null
  avatar_url: string | null
  created_at: string
  updated_at: string
}

export interface VocabularySet {
  id: string
  owner_id: string | null
  title: string
  description: string | null
  difficulty: Difficulty
  is_public: boolean
  cover_color: string | null
  category: string | null // IELTS Band 4.0-6.0, English 12, etc.
  topic: string | null // Work & Jobs, Education, Unit 1, etc.
  created_at: string
  updated_at: string
  // Trường tổng hợp (join/aggregate), không có trong bảng gốc
  word_count?: number
  learned_count?: number
}

export interface Vocabulary {
  id: string
  set_id: string
  word: string
  meaning: string
  english_definition: string | null // Định nghĩa tiếng Anh
  example: string | null
  example_translation: string | null
  part_of_speech: string | null
  pronunciation: string | null
  audio_url: string | null
  image_url: string | null
  ielts_band: number | null
  ielts_topic: string | null
  cefr_level: string | null
  ielts_use: string | null
  ielts_skills: string[] | null
  collocations: string[] | null
  synonyms: string[] | null
  antonyms: string[] | null
  word_family: string[] | null
  usage_notes: string | null
  created_at: string
  updated_at: string
}

export interface UserVocabularyProgress {
  id: string
  user_id: string
  vocabulary_id: string
  times_seen: number
  times_correct: number
  times_wrong: number
  mastery_level: number // 0-5
  last_reviewed_at: string | null
  next_review_at: string | null
  created_at: string
  updated_at: string
}

export interface StudySession {
  id: string
  user_id: string
  set_id: string
  mode: 'flashcard' | 'practice' | 'review'
  started_at: string
  completed_at: string | null
  total_words: number
  correct_answers: number
  wrong_answers: number
  score: number
  accuracy: number
}

export interface StudyAnswer {
  id: string
  session_id: string
  user_id: string
  vocabulary_id: string
  user_answer: string
  correct_answer: string
  is_correct: boolean
  used_hint: boolean
  answered_at: string
}

export interface Favorite {
  id: string
  user_id: string
  vocabulary_id: string
  created_at: string
}

export interface UserStreak {
  user_id: string
  current_streak: number
  longest_streak: number
  last_study_date: string | null
  updated_at: string
}

export interface LeaderboardEntry {
  rank_position: number
  user_id: string
  display_name: string
  avatar_url: string | null
  points: number
  sessions: number
  words: number
  accuracy: number | null
}

// Kiểu mở rộng dùng trong UI
export interface VocabularyWithProgress extends Vocabulary {
  progress?: UserVocabularyProgress | null
  is_favorite?: boolean
}

export interface VocabularyWithSet extends Vocabulary {
  vocabulary_sets: {
    id: string
    title: string
    cover_color: string | null
  }
}
