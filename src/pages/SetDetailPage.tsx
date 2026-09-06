import { useEffect, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { ArrowLeft, Play } from 'lucide-react'
import { useAuth } from '@/hooks/useAuth'
import { vocabService } from '@/services/vocabService'
import { progressService } from '@/services/progressService'
import { Button } from '@/components/ui/Button'
import { Card } from '@/components/ui/Card'
import { ProgressBar } from '@/components/ui/ProgressBar'
import { PageLoading } from '@/components/ui/Spinner'
import { ErrorState } from '@/components/ui/ErrorState'
import { AudioButton } from '@/components/vocab/AudioButton'
import type { Vocabulary, VocabularySet } from '@/types/database'

const difficultyLabel: Record<string, string> = { easy: 'Dễ', medium: 'Trung bình', hard: 'Khó' }

export function SetDetailPage() {
  const { id } = useParams<{ id: string }>()
  const { user } = useAuth()
  const navigate = useNavigate()
  const [set, setSet] = useState<VocabularySet | null>(null)
  const [words, setWords] = useState<Vocabulary[]>([])
  const [learnedCount, setLearnedCount] = useState(0)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)
  const [notFound, setNotFound] = useState(false)

  const load = async () => {
    if (!id) return
    setLoading(true)
    setError(false)
    setNotFound(false)
    try {
      const [setData, vocabList] = await Promise.all([vocabService.getSet(id), vocabService.listVocabularies(id)])
      if (!setData) {
        setNotFound(true)
        return
      }
      setSet(setData)
      setWords(vocabList)

      if (user && vocabList.length > 0) {
        const progressMap = await progressService.getForSet(
          user.id,
          vocabList.map((w) => w.id)
        )
        setLearnedCount(Object.values(progressMap).filter((p) => p.mastery_level > 0).length)
      }
    } catch {
      setError(true)
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    load()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [id, user])

  if (loading) return <PageLoading label="Đang tải bộ từ vựng..." />
  if (notFound)
    return (
      <ErrorState
        title="Không tìm thấy bộ từ vựng"
        message="Bộ từ vựng này có thể đã bị xoá hoặc không tồn tại."
        onRetry={() => navigate('/sets')}
      />
    )
  if (error || !set) return <ErrorState onRetry={load} />

  return (
    <div>
      <button
        onClick={() => navigate('/sets')}
        className="mb-4 flex items-center gap-1.5 text-sm font-medium text-ink-soft hover:text-ink dark:text-white/60 dark:hover:text-white"
      >
        <ArrowLeft className="h-4 w-4" /> Quay lại
      </button>

      <Card className="p-6 sm:p-8">
        <div className="flex flex-col justify-between gap-6 sm:flex-row sm:items-center">
          <div>
            <span className="inline-block rounded-full bg-teal-100 px-3 py-1 text-xs font-medium text-teal-600 dark:bg-teal-500/15 dark:text-teal-400">
              {difficultyLabel[set.difficulty]}
            </span>
            <h1 className="mt-3 font-display text-2xl font-semibold text-ink dark:text-white sm:text-3xl">
              {set.title}
            </h1>
            <p className="mt-2 max-w-xl text-ink-soft dark:text-white/60">{set.description}</p>
          </div>
          <Link to={`/learn/${set.id}`} className="shrink-0">
            <Button size="lg" disabled={words.length === 0}>
              <Play className="h-4 w-4" /> Bắt đầu học
            </Button>
          </Link>
        </div>

        <div className="mt-6">
          <div className="mb-1.5 flex justify-between text-sm text-ink-soft dark:text-white/60">
            <span>Tiến độ</span>
            <span>
              {learnedCount}/{words.length} từ
            </span>
          </div>
          <ProgressBar value={learnedCount} max={words.length || 1} />
        </div>
      </Card>

      <h2 className="mb-4 mt-8 font-display text-lg font-semibold text-ink dark:text-white">
        Danh sách từ ({words.length})
      </h2>

      {words.length === 0 ? (
        <p className="text-ink-soft dark:text-white/60">Bộ từ vựng này chưa có từ nào.</p>
      ) : (
        <div className="space-y-2.5">
          {words.map((w) => (
            <Card key={w.id} className="flex items-center gap-4 p-4">
              <AudioButton text={w.word} size="sm" />
              <div className="min-w-0 flex-1">
                <div className="flex flex-wrap items-baseline gap-2">
                  <p className="font-display font-semibold text-ink dark:text-white">{w.word}</p>
                  {w.pronunciation && <span className="text-xs text-ink-soft dark:text-white/50">{w.pronunciation}</span>}
                  {w.part_of_speech && (
                    <span className="rounded-full bg-violet-100 px-2 py-0.5 text-[11px] font-medium text-violet-600 dark:bg-violet-500/15 dark:text-violet-300">
                      {w.part_of_speech}
                    </span>
                  )}
                </div>
                <p className="mt-0.5 text-sm text-ink-soft dark:text-white/60">{w.meaning}</p>
              </div>
            </Card>
          ))}
        </div>
      )}
    </div>
  )
}
