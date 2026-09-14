import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { Search, Plus, BookX } from 'lucide-react'
import { useAuth } from '@/hooks/useAuth'
import { useDebounce } from '@/hooks/useDebounce'
import { vocabService } from '@/services/vocabService'
import { SetCard } from '@/components/vocab/SetCard'
import { Input } from '@/components/ui/Input'
import { Button } from '@/components/ui/Button'
import { PageLoading } from '@/components/ui/Spinner'
import { ErrorState } from '@/components/ui/ErrorState'
import { EmptyState } from '@/components/ui/EmptyState'
import type { VocabularySet } from '@/types/database'

export function SetsPage() {
  const { user } = useAuth()
  const [sets, setSets] = useState<VocabularySet[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)
  const [query, setQuery] = useState('')
  const debouncedQuery = useDebounce(query, 300)

  const load = async () => {
    setLoading(true)
    setError(false)
    try {
      const data = await vocabService.listSets(user?.id || null)
      setSets(data)
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

  return (
    <div>
      <div className="mb-6 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div>
          <h1 className="font-display text-2xl font-semibold text-ink dark:text-white sm:text-3xl">Bộ từ vựng</h1>
          <p className="mt-1 text-ink-soft dark:text-white/60">Chọn một bộ từ để bắt đầu buổi học.</p>
        </div>
        <Link to="/sets/create">
          <Button>
            <Plus className="h-4 w-4" /> Tạo bộ mới-Tạo theo yêu cầu liên hệ admin
          </Button>
        </Link>
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
            debouncedQuery
              ? 'Thử tìm với từ khóa khác.'
              : 'Hãy tạo bộ từ vựng đầu tiên của bạn để bắt đầu học.'
          }
        />
      ) : (
        <div className="grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
          {filtered.map((set, i) => (
            <SetCard key={set.id} set={set} index={i} />
          ))}
        </div>
      )}
    </div>
  )
}
