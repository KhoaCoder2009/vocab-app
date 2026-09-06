import { useEffect, useState } from 'react'
import { Star, StarOff } from 'lucide-react'
import { useAuth } from '@/hooks/useAuth'
import { favoritesService } from '@/services/statsService'
import { AudioButton } from '@/components/vocab/AudioButton'
import { Card } from '@/components/ui/Card'
import { PageLoading } from '@/components/ui/Spinner'
import { ErrorState } from '@/components/ui/ErrorState'
import { EmptyState } from '@/components/ui/EmptyState'
import { useToast } from '@/hooks/useToast'
import type { Vocabulary } from '@/types/database'

interface FavoriteRow {
  id: string
  vocabulary_id: string
  vocabularies: Vocabulary
}

export function FavoritesPage() {
  const { user } = useAuth()
  const [favorites, setFavorites] = useState<FavoriteRow[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)
  const { showToast } = useToast()

  const load = async () => {
    if (!user) return
    setLoading(true)
    setError(false)
    try {
      const data = await favoritesService.list(user.id)
      setFavorites(data as unknown as FavoriteRow[])
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

  const handleRemove = async (vocabularyId: string) => {
    if (!user) return
    const prev = favorites
    setFavorites((f) => f.filter((item) => item.vocabulary_id !== vocabularyId))
    try {
      await favoritesService.toggle(user.id, vocabularyId)
      showToast('Đã bỏ yêu thích', 'success')
    } catch {
      setFavorites(prev)
      showToast('Không thể cập nhật. Vui lòng thử lại.', 'error')
    }
  }

  if (loading) return <PageLoading label="Đang tải danh sách yêu thích..." />
  if (error) return <ErrorState onRetry={load} />

  return (
    <div>
      <h1 className="font-display text-2xl font-semibold text-ink dark:text-white sm:text-3xl">Từ yêu thích</h1>
      <p className="mt-1 mb-6 text-ink-soft dark:text-white/60">Những từ bạn đã đánh dấu để ôn tập nhanh.</p>

      {favorites.length === 0 ? (
        <EmptyState
          icon={<StarOff className="h-10 w-10" />}
          title="Chưa có từ yêu thích nào"
          description="Nhấn biểu tượng ngôi sao trên bất kỳ từ nào để lưu vào đây."
        />
      ) : (
        <div className="space-y-2.5">
          {favorites.map((f) => (
            <Card key={f.id} className="flex items-center gap-4 p-4">
              <AudioButton text={f.vocabularies.word} size="sm" />
              <div className="min-w-0 flex-1">
                <p className="font-display font-semibold text-ink dark:text-white">{f.vocabularies.word}</p>
                <p className="text-sm text-ink-soft dark:text-white/60">{f.vocabularies.meaning}</p>
              </div>
              <button
                onClick={() => handleRemove(f.vocabulary_id)}
                aria-label="Bỏ yêu thích"
                className="rounded-full p-2 text-coral-500 hover:bg-coral-100 dark:hover:bg-coral-500/15"
              >
                <Star className="h-5 w-5 fill-current" />
              </button>
            </Card>
          ))}
        </div>
      )}
    </div>
  )
}
