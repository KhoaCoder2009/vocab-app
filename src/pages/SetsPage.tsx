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
  [category: string]: {
    [topic: string]: VocabularySet[]
  }
}

export function SetsPage() {
  const { user } = useAuth()
  const [sets, setSets] = useState<VocabularySet[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)
  const [query, setQuery] = useState('')
  const [expandedCategories, setExpandedCategories] = useState<Set<string>>(new Set())
  const debouncedQuery = useDebounce(query, 300)

  const load = async () => {
    setLoading(true)
    setError(false)
    try {
      const data = await vocabService.listSets(user?.id || null)
      setSets(data)
      // Auto-expand all categories initially
      const categories = new Set(data.map(s => s.category || 'Chưa phân loại'))
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

  const filtered = sets.filter((s) => s.title.toLowerCase().includes(debouncedQuery.toLowerCase()))

  const groupedSets = useMemo<GroupedSets>(() => {
    const grouped: GroupedSets = {}
    for (const set of filtered) {
      const category = set.category || 'Chưa phân loại'
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
          Chọn một bộ từ để bắt đầu buổi học. Tổ chức theo band/cấp độ và chủ đề.
        </p>
      </div>

      <div className="relative mb-6 max-w-md">
        <Search className="pointer-events-none absolute left-3.5 top-1/2 h-4 w-4 -translate-y-1/2 text-ink-soft/60 dark:text-white/40" />
        <Input
          placeholder="Tìm bộ từ vựng..."
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          className="pl-10"
        />
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
          {Object.entries(groupedSets)
            .sort(([a], [b]) => {
              // Sort: IELTS first, then English grades, then others
              if (a.startsWith('IELTS')) return -1
              if (b.startsWith('IELTS')) return 1
              if (a.startsWith('English')) return -1
              if (b.startsWith('English')) return 1
              return a.localeCompare(b)
            })
            .map(([category, topics]) => {
              const isExpanded = expandedCategories.has(category)
              const totalSets = Object.values(topics).reduce((sum, sets) => sum + sets.length, 0)

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
