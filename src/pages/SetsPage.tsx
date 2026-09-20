import { useEffect, useMemo, useState } from 'react'
import { Search, BookX, ChevronRight } from 'lucide-react'
import { useAuth } from '@/hooks/useAuth'
import { useDebounce } from '@/hooks/useDebounce'
import { vocabService } from '@/services/vocabService'
import { SetCard } from '@/components/vocab/SetCard'
import { Input } from '@/components/ui/Input'
import { PageLoading } from '@/components/ui/Spinner'
import { ErrorState } from '@/components/ui/ErrorState'
import { EmptyState } from '@/components/ui/EmptyState'
import type { VocabularySet } from '@/types/database'

interface GroupedSets {
  [topic: string]: {
    [category: string]: VocabularySet[]
  }
}

// Define IELTS band structure with IDs
const IELTS_BANDS = [
  { id: 'ielts-band-1', band: 1, category: 'IELTS Band 1.0', description: 'Non-user' },
  { id: 'ielts-band-2', band: 2, category: 'IELTS Band 2.0', description: 'Intermittent user' },
  { id: 'ielts-band-3', band: 3, category: 'IELTS Band 3.0', description: 'Extremely limited user' },
  { id: 'ielts-band-4-5', band: 4, category: 'IELTS Band 4.0-5.0', description: 'Limited to modest user' },
  { id: 'ielts-band-5-6', band: 5, category: 'IELTS Band 5.0-6.0', description: 'Modest to competent user' },
  { id: 'ielts-band-6-7', band: 6, category: 'IELTS Band 6.0-7.0', description: 'Competent to good user' },
  { id: 'ielts-band-7-8', band: 7, category: 'IELTS Band 7.0-8.0', description: 'Good to very good user' },
  { id: 'ielts-band-8-9', band: 8, category: 'IELTS Band 8.0-9.0', description: 'Very good to expert user' },
  { id: 'ielts-band-9', band: 9, category: 'IELTS Band 9.0', description: 'Expert user' },
]

const ENGLISH_GRADES = [
  { id: 'english-10', grade: 10, category: 'English 10', description: 'Tiếng Anh lớp 10' },
  { id: 'english-11', grade: 11, category: 'English 11', description: 'Tiếng Anh lớp 11' },
  { id: 'english-12', grade: 12, category: 'English 12', description: 'Tiếng Anh lớp 12' },
]

export function SetsPage() {
  const { user } = useAuth()
  const [sets, setSets] = useState<VocabularySet[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)
  const [query, setQuery] = useState('')
  const [selectedTopic, setSelectedTopic] = useState<string>('all')
  const [selectedCategory, setSelectedCategory] = useState<string>('all')
  const [expandedCategories, setExpandedCategories] = useState<Set<string>>(new Set())
  const debouncedQuery = useDebounce(query, 300)

  const load = async () => {
    setLoading(true)
    setError(false)
    try {
      const data = await vocabService.listSets(user?.id || null)
      setSets(data)
      // Auto-expand all categories initially
      const categories = new Set(data.map(s => s.category || 'Khác'))
      setExpandedCategories(categories)
    } catch {
      setError(true)
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    load()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [user])

  // Get unique topics and categories (bands)
  const availableCategories = useMemo(() => {
    const cats = new Set(sets.map(s => s.category || 'Khác'))
    return Array.from(cats).sort()
  }, [sets])

  const availableTopics = useMemo(() => {
    if (selectedCategory === 'all') {
      const topics = new Set(sets.map(s => s.topic || 'Tổng hợp'))
      return Array.from(topics).sort()
    }
    const topics = new Set(
      sets
        .filter(s => (s.category || 'Khác') === selectedCategory)
        .map(s => s.topic || 'Tổng hợp')
    )
    return Array.from(topics).sort()
  }, [sets, selectedCategory])

  // Apply filters
  const filtered = useMemo(() => {
    return sets.filter((s) => {
      // Text search filter
      const matchesQuery = s.title.toLowerCase().includes(debouncedQuery.toLowerCase())
      
      // Category filter
      const matchesCategory = selectedCategory === 'all' || (s.category || 'Khác') === selectedCategory
      
      // Topic filter
      const matchesTopic = selectedTopic === 'all' || (s.topic || 'Tổng hợp') === selectedTopic
      
      return matchesQuery && matchesCategory && matchesTopic
    })
  }, [sets, debouncedQuery, selectedCategory, selectedTopic])

  // Reset topic when category changes
  useEffect(() => {
    setSelectedTopic('all')
  }, [selectedCategory])

  const groupedSets = useMemo<GroupedSets>(() => {
    const grouped: GroupedSets = {}
    
    // Initialize all IELTS bands
    for (const { category } of IELTS_BANDS) {
      grouped[category] = {}
    }
    
    // Initialize all English grades
    for (const { category } of ENGLISH_GRADES) {
      grouped[category] = {}
    }
    
    // Populate with actual sets
    for (const set of filtered) {
      const category = set.category || 'Khác'
      const topic = set.topic || 'Tổng hợp'
      if (!grouped[category]) grouped[category] = {}
      if (!grouped[category][topic]) grouped[category][topic] = []
      grouped[category][topic].push(set)
    }
    
    return grouped
  }, [filtered])

  const toggleCategory = (category: string) => {
    setExpandedCategories((prev) => {
      const next = new Set(prev)
      if (next.has(category)) {
        next.delete(category)
      } else {
        next.add(category)
      }
      return next
    })
  }

  return (
    <div>
      <div className="mb-6">
        <h1 className="font-display text-2xl font-semibold text-ink dark:text-white sm:text-3xl">Bộ từ vựng</h1>
        <p className="mt-1 text-ink-soft dark:text-white/60">
          Chọn một bộ từ để bắt đầu buổi học. Tổ chức theo Band/Level → Chủ đề → Bộ từ.
        </p>
      </div>

      <div className="mb-6 flex flex-col gap-4 sm:flex-row">
        <div className="relative flex-1 max-w-md">
          <Search className="pointer-events-none absolute left-3.5 top-1/2 h-4 w-4 -translate-y-1/2 text-ink-soft/60 dark:text-white/40" />
          <Input
            placeholder="Tìm bộ từ vựng..."
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            className="pl-10"
          />
        </div>
        
        <div className="flex gap-3">
          <select
            value={selectedCategory}
            onChange={(e) => setSelectedCategory(e.target.value)}
            className="rounded-lg border border-border bg-white px-4 py-2 text-sm font-medium text-ink transition-colors hover:border-teal-500/50 focus:border-teal-500 focus:outline-none focus:ring-2 focus:ring-teal-500/20 dark:border-slate-700 dark:bg-slate-800 dark:text-white dark:hover:border-blue-400/50 dark:focus:border-blue-400"
          >
            <option value="all">Tất cả Band</option>
            <optgroup label="IELTS">
              {IELTS_BANDS.map(({ category }) => (
                <option key={category} value={category}>
                  {category}
                </option>
              ))}
            </optgroup>
            <optgroup label="English Grade">
              {ENGLISH_GRADES.map(({ category }) => (
                <option key={category} value={category}>
                  {category}
                </option>
              ))}
            </optgroup>
            {availableCategories
              .filter(cat => !IELTS_BANDS.some(b => b.category === cat) && !ENGLISH_GRADES.some(g => g.category === cat))
              .map(cat => (
                <option key={cat} value={cat}>
                  {cat}
                </option>
              ))}
          </select>

          <select
            value={selectedTopic}
            onChange={(e) => setSelectedTopic(e.target.value)}
            disabled={selectedCategory === 'all'}
            className="rounded-lg border border-border bg-white px-4 py-2 text-sm font-medium text-ink transition-colors hover:border-teal-500/50 focus:border-teal-500 focus:outline-none focus:ring-2 focus:ring-teal-500/20 disabled:cursor-not-allowed disabled:opacity-50 dark:border-slate-700 dark:bg-slate-800 dark:text-white dark:hover:border-blue-400/50 dark:focus:border-blue-400"
          >
            <option value="all">Tất cả chủ đề</option>
            {availableTopics.map(topic => (
              <option key={topic} value={topic}>
                {topic}
              </option>
            ))}
          </select>
        </div>
      </div>

      {loading ? (
        <PageLoading />
      ) : error ? (
        <ErrorState onRetry={load} />
      ) : filtered.length === 0 ? (
        <EmptyState
          icon={<BookX className="h-10 w-10" />}
          title={debouncedQuery ? 'Không tìm thấy bộ từ nào' : 'Chưa có bộ từ vựng nào'}
          description={
            debouncedQuery ? 'Thử tìm với từ khóa khác.' : 'Liên hệ admin để được cung cấp bộ từ vựng phù hợp.'
          }
        />
      ) : (
        <div className="space-y-8">
          {/* IELTS Bands */}
          {IELTS_BANDS.map(({ category, description }) => {
            const topics = groupedSets[category] || {}
            const isExpanded = expandedCategories.has(category)
            const totalSets = Object.values(topics).reduce((sum, sets) => sum + sets.length, 0)
            const hasContent = totalSets > 0

            return (
              <div key={category} className="space-y-4">
                <button
                  type="button"
                  onClick={() => toggleCategory(category)}
                  className={`flex w-full items-center justify-between rounded-xl p-4 shadow-sm transition-all hover:shadow-md ${
                    hasContent
                      ? 'bg-white dark:bg-slate-800'
                      : 'bg-slate-50 dark:bg-slate-900/50'
                  }`}
                >
                  <div className="flex items-center gap-3">
                    <ChevronRight
                      className={`h-5 w-5 transition-transform ${
                        hasContent
                          ? 'text-teal-600 dark:text-blue-400'
                          : 'text-slate-300 dark:text-slate-600'
                      } ${isExpanded ? 'rotate-90' : ''}`}
                    />
                    <div className="text-left">
                      <h2 className={`font-display text-xl font-semibold ${
                        hasContent
                          ? 'text-ink dark:text-white'
                          : 'text-slate-400 dark:text-slate-500'
                      }`}>
                        {category}
                      </h2>
                      <p className="mt-0.5 text-sm text-ink-soft dark:text-slate-400">
                        {hasContent ? (
                          <>{totalSets} bộ từ · {Object.keys(topics).length} chủ đề</>
                        ) : (
                          <span className="italic">{description} - Chưa có nội dung</span>
                        )}
                      </p>
                    </div>
                  </div>
                </button>

                {isExpanded && hasContent && (
                  <div className="space-y-6 pl-4">
                    {Object.entries(topics)
                      .sort(([a], [b]) => a.localeCompare(b))
                      .map(([topic, topicSets]) => (
                        <div key={topic}>
                          <h3 className="mb-3 flex items-center gap-2 text-sm font-semibold uppercase tracking-wide text-ink-soft dark:text-slate-400">
                            <span className="h-px flex-1 bg-border dark:bg-slate-700" />
                            {topic}
                            <span className="h-px flex-1 bg-border dark:bg-slate-700" />
                          </h3>
                          <div className="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
                            {topicSets.map((set, i) => (
                              <SetCard key={set.id} set={set} index={i} />
                            ))}
                          </div>
                        </div>
                      ))}
                  </div>
                )}
              </div>
            )
          })}

          {/* English Grades */}
          {ENGLISH_GRADES.map(({ category, description }) => {
            const topics = groupedSets[category] || {}
            const isExpanded = expandedCategories.has(category)
            const totalSets = Object.values(topics).reduce((sum, sets) => sum + sets.length, 0)
            const hasContent = totalSets > 0

            return (
              <div key={category} className="space-y-4">
                <button
                  type="button"
                  onClick={() => toggleCategory(category)}
                  className={`flex w-full items-center justify-between rounded-xl p-4 shadow-sm transition-all hover:shadow-md ${
                    hasContent
                      ? 'bg-white dark:bg-slate-800'
                      : 'bg-slate-50 dark:bg-slate-900/50'
                  }`}
                >
                  <div className="flex items-center gap-3">
                    <ChevronRight
                      className={`h-5 w-5 transition-transform ${
                        hasContent
                          ? 'text-teal-600 dark:text-blue-400'
                          : 'text-slate-300 dark:text-slate-600'
                      } ${isExpanded ? 'rotate-90' : ''}`}
                    />
                    <div className="text-left">
                      <h2 className={`font-display text-xl font-semibold ${
                        hasContent
                          ? 'text-ink dark:text-white'
                          : 'text-slate-400 dark:text-slate-500'
                      }`}>
                        {category}
                      </h2>
                      <p className="mt-0.5 text-sm text-ink-soft dark:text-slate-400">
                        {hasContent ? (
                          <>{totalSets} bộ từ · {Object.keys(topics).length} chủ đề</>
                        ) : (
                          <span className="italic">{description} - Chưa có nội dung</span>
                        )}
                      </p>
                    </div>
                  </div>
                </button>

                {isExpanded && hasContent && (
                  <div className="space-y-6 pl-4">
                    {Object.entries(topics)
                      .sort(([a], [b]) => a.localeCompare(b))
                      .map(([topic, topicSets]) => (
                        <div key={topic}>
                          <h3 className="mb-3 flex items-center gap-2 text-sm font-semibold uppercase tracking-wide text-ink-soft dark:text-slate-400">
                            <span className="h-px flex-1 bg-border dark:bg-slate-700" />
                            {topic}
                            <span className="h-px flex-1 bg-border dark:bg-slate-700" />
                          </h3>
                          <div className="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
                            {topicSets.map((set, i) => (
                              <SetCard key={set.id} set={set} index={i} />
                            ))}
                          </div>
                        </div>
                      ))}
                  </div>
                )}
              </div>
            )
          })}

          {/* Other categories */}
          {Object.entries(groupedSets)
            .filter(([category]) => 
              !IELTS_BANDS.some(b => b.category === category) &&
              !ENGLISH_GRADES.some(g => g.category === category)
            )
            .sort(([a], [b]) => a.localeCompare(b))
            .map(([category, topics]) => {
              const isExpanded = expandedCategories.has(category)
              const totalSets = Object.values(topics).reduce((sum, sets) => sum + sets.length, 0)
              
              if (totalSets === 0) return null

              return (
                <div key={category} className="space-y-4">
                  <button
                    type="button"
                    onClick={() => toggleCategory(category)}
                    className="flex w-full items-center justify-between rounded-xl bg-white p-4 shadow-sm transition-all hover:shadow-md dark:bg-slate-800"
                  >
                    <div className="flex items-center gap-3">
                      <ChevronRight
                        className={`h-5 w-5 text-teal-600 transition-transform dark:text-blue-400 ${isExpanded ? 'rotate-90' : ''}`}
                      />
                      <div className="text-left">
                        <h2 className="font-display text-xl font-semibold text-ink dark:text-white">{category}</h2>
                        <p className="mt-0.5 text-sm text-ink-soft dark:text-slate-400">
                          {totalSets} bộ từ · {Object.keys(topics).length} chủ đề
                        </p>
                      </div>
                    </div>
                  </button>

                  {isExpanded && (
                    <div className="space-y-6 pl-4">
                      {Object.entries(topics)
                        .sort(([a], [b]) => a.localeCompare(b))
                        .map(([topic, topicSets]) => (
                          <div key={topic}>
                            <h3 className="mb-3 flex items-center gap-2 text-sm font-semibold uppercase tracking-wide text-ink-soft dark:text-slate-400">
                              <span className="h-px flex-1 bg-border dark:bg-slate-700" />
                              {topic}
                              <span className="h-px flex-1 bg-border dark:bg-slate-700" />
                            </h3>
                            <div className="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
                              {topicSets.map((set, i) => (
                                <SetCard key={set.id} set={set} index={i} />
                              ))}
                            </div>
                          </div>
                        ))}
                    </div>
                  )}
                </div>
              )
            })}
        </div>
      )}
    </div>
  )
}
