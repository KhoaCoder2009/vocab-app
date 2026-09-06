import { supabase } from '@/lib/supabase'
import type { Difficulty, Vocabulary, VocabularySet } from '@/types/database'

export const vocabService = {
  async listSets(_userId: string | null): Promise<VocabularySet[]> {
    const { data, error } = await supabase
      .from('vocabulary_sets')
      .select('*, vocabularies(count)')
      .order('created_at', { ascending: false })

    if (error) throw error

    return (data || []).map((row) => {
      const withCount = row as VocabularySet & { vocabularies: { count: number }[] }
      return {
        ...withCount,
        word_count: withCount.vocabularies?.[0]?.count ?? 0,
      }
    })
  },

  async getSet(setId: string): Promise<VocabularySet | null> {
    const { data, error } = await supabase.from('vocabulary_sets').select('*').eq('id', setId).maybeSingle()
    if (error) throw error
    return data
  },

  async listVocabularies(setId: string): Promise<Vocabulary[]> {
    const { data, error } = await supabase
      .from('vocabularies')
      .select('*')
      .eq('set_id', setId)
      .order('created_at', { ascending: true })
    if (error) throw error
    return data || []
  },

  async createSet(payload: {
    ownerId: string
    title: string
    description: string
    difficulty: Difficulty
  }): Promise<VocabularySet> {
    const { data, error } = await supabase
      .from('vocabulary_sets')
      .insert({
        owner_id: payload.ownerId,
        title: payload.title,
        description: payload.description,
        difficulty: payload.difficulty,
        is_public: false,
      })
      .select()
      .single()
    if (error) throw error
    return data
  },

  async addVocabularies(
    setId: string,
    words: Array<{
      word: string
      meaning: string
      example?: string
      example_translation?: string
      part_of_speech?: string
      pronunciation?: string
    }>
  ): Promise<void> {
    if (words.length === 0) return
    const { error } = await supabase.from('vocabularies').insert(
      words.map((w) => ({
        set_id: setId,
        word: w.word,
        meaning: w.meaning,
        example: w.example || null,
        example_translation: w.example_translation || null,
        part_of_speech: w.part_of_speech || null,
        pronunciation: w.pronunciation || null,
      }))
    )
    if (error) throw error
  },

  async searchVocabulary(query: string): Promise<Vocabulary[]> {
    if (!query.trim()) return []
    const { data, error } = await supabase
      .from('vocabularies')
      .select('*')
      .or(`word.ilike.%${query}%,meaning.ilike.%${query}%`)
      .limit(20)
    if (error) throw error
    return data || []
  },

  async searchSets(query: string): Promise<VocabularySet[]> {
    if (!query.trim()) return []
    const { data, error } = await supabase
      .from('vocabulary_sets')
      .select('*')
      .ilike('title', `%${query}%`)
      .limit(20)
    if (error) throw error
    return data || []
  },
}
