import { useState, type FormEvent } from 'react'
import { useNavigate } from 'react-router-dom'
import { Plus, Trash2, ArrowLeft } from 'lucide-react'
import { useAuth } from '@/hooks/useAuth'
import { vocabService } from '@/services/vocabService'
import { Card } from '@/components/ui/Card'
import { Input } from '@/components/ui/Input'
import { Button } from '@/components/ui/Button'
import { useToast } from '@/hooks/useToast'
import type { Difficulty } from '@/types/database'

interface WordDraft {
  key: string
  word: string
  meaning: string
  example: string
  example_translation: string
  part_of_speech: string
  pronunciation: string
}

function emptyWord(): WordDraft {
  return {
    key: crypto.randomUUID(),
    word: '',
    meaning: '',
    example: '',
    example_translation: '',
    part_of_speech: '',
    pronunciation: '',
  }
}

export function CreateSetPage() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const { showToast } = useToast()

  const [title, setTitle] = useState('')
  const [description, setDescription] = useState('')
  const [difficulty, setDifficulty] = useState<Difficulty>('medium')
  const [words, setWords] = useState<WordDraft[]>([emptyWord()])
  const [saving, setSaving] = useState(false)
  const [errorMsg, setErrorMsg] = useState<string | null>(null)

  const updateWord = (key: string, patch: Partial<WordDraft>) => {
    setWords((ws) => ws.map((w) => (w.key === key ? { ...w, ...patch } : w)))
  }

  const removeWord = (key: string) => {
    setWords((ws) => (ws.length === 1 ? ws : ws.filter((w) => w.key !== key)))
  }

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    setErrorMsg(null)

    if (!user) return
    if (!title.trim()) {
      setErrorMsg('Vui lòng nhập tên bộ từ vựng.')
      return
    }
    const validWords = words.filter((w) => w.word.trim() && w.meaning.trim())
    if (validWords.length === 0) {
      setErrorMsg('Vui lòng thêm ít nhất một từ hợp lệ (có cả tiếng Anh và nghĩa).')
      return
    }

    setSaving(true)
    try {
      const set = await vocabService.createSet({
        ownerId: user.id,
        title: title.trim(),
        description: description.trim(),
        difficulty,
      })
      await vocabService.addVocabularies(
        set.id,
        validWords.map((w) => ({
          word: w.word.trim(),
          meaning: w.meaning.trim(),
          example: w.example.trim() || undefined,
          example_translation: w.example_translation.trim() || undefined,
          part_of_speech: w.part_of_speech.trim() || undefined,
          pronunciation: w.pronunciation.trim() || undefined,
        }))
      )
      showToast('Đã tạo bộ từ vựng mới!', 'success')
      navigate(`/sets/${set.id}`)
    } catch {
      setErrorMsg('Không thể tạo bộ từ vựng. Vui lòng thử lại.')
    } finally {
      setSaving(false)
    }
  }

  return (
    <div className="mx-auto max-w-3xl">
      <button
        onClick={() => navigate('/sets')}
        className="mb-4 flex items-center gap-1.5 text-sm font-medium text-ink-soft hover:text-ink dark:text-white/60 dark:hover:text-white"
      >
        <ArrowLeft className="h-4 w-4" /> Quay lại
      </button>

      <h1 className="font-display text-2xl font-semibold text-ink dark:text-white sm:text-3xl">Tạo bộ từ vựng mới</h1>
      <p className="mt-1 mb-6 text-ink-soft dark:text-white/60">Thêm thông tin bộ từ và các từ vựng bên trong.</p>

      <form onSubmit={handleSubmit} className="space-y-6">
        <Card className="space-y-4 p-6">
          <Input label="Tên bộ từ vựng" value={title} onChange={(e) => setTitle(e.target.value)} placeholder="Ví dụ: Từ vựng Business English" />
          <div>
            <label className="mb-1.5 block text-sm font-medium text-ink-soft dark:text-white/70">Mô tả</label>
            <textarea
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              rows={3}
              className="w-full rounded-xl border border-border bg-white px-4 py-3 text-base text-ink outline-none transition-colors focus:border-teal-500 dark:border-slate-700 dark:bg-slate-800 dark:text-white"
              placeholder="Mô tả ngắn gọn về bộ từ vựng này..."
            />
          </div>
          <div>
            <label className="mb-1.5 block text-sm font-medium text-ink-soft dark:text-white/70">Độ khó</label>
            <div className="flex gap-2">
              {(['easy', 'medium', 'hard'] as Difficulty[]).map((d) => (
                <button
                  key={d}
                  type="button"
                  onClick={() => setDifficulty(d)}
                  className={`rounded-xl border px-4 py-2 text-sm font-medium transition-colors ${
                    difficulty === d
                      ? 'border-teal-500 bg-teal-100 text-teal-700 dark:bg-teal-500/15 dark:text-teal-300'
                      : 'border-ink/10 text-ink-soft dark:border-white/10 dark:text-white/60'
                  }`}
                >
                  {d === 'easy' ? 'Dễ' : d === 'medium' ? 'Trung bình' : 'Khó'}
                </button>
              ))}
            </div>
          </div>
        </Card>

        <div>
          <div className="mb-3 flex items-center justify-between">
            <h2 className="font-display text-lg font-semibold text-ink dark:text-white">Danh sách từ ({words.length})</h2>
            <Button type="button" variant="secondary" size="sm" onClick={() => setWords((w) => [...w, emptyWord()])}>
              <Plus className="h-4 w-4" /> Thêm từ
            </Button>
          </div>

          <div className="space-y-4">
            {words.map((w, i) => (
              <Card key={w.key} className="p-5">
                <div className="mb-3 flex items-center justify-between">
                  <span className="text-sm font-semibold text-ink-soft dark:text-white/50">Từ #{i + 1}</span>
                  {words.length > 1 && (
                    <button
                      type="button"
                      onClick={() => removeWord(w.key)}
                      className="text-rose-500 hover:text-rose-600"
                      aria-label="Xoá từ này"
                    >
                      <Trash2 className="h-4 w-4" />
                    </button>
                  )}
                </div>
                <div className="grid grid-cols-1 gap-3 sm:grid-cols-2">
                  <Input
                    placeholder="English word *"
                    value={w.word}
                    onChange={(e) => updateWord(w.key, { word: e.target.value })}
                  />
                  <Input
                    placeholder="Nghĩa tiếng Việt *"
                    value={w.meaning}
                    onChange={(e) => updateWord(w.key, { meaning: e.target.value })}
                  />
                  <Input
                    placeholder="Phát âm (VD: /wɜːd/)"
                    value={w.pronunciation}
                    onChange={(e) => updateWord(w.key, { pronunciation: e.target.value })}
                  />
                  <Input
                    placeholder="Từ loại (VD: noun, verb...)"
                    value={w.part_of_speech}
                    onChange={(e) => updateWord(w.key, { part_of_speech: e.target.value })}
                  />
                  <Input
                    placeholder="Câu ví dụ (tiếng Anh)"
                    value={w.example}
                    onChange={(e) => updateWord(w.key, { example: e.target.value })}
                    className="sm:col-span-2"
                  />
                  <Input
                    placeholder="Dịch câu ví dụ"
                    value={w.example_translation}
                    onChange={(e) => updateWord(w.key, { example_translation: e.target.value })}
                    className="sm:col-span-2"
                  />
                </div>
              </Card>
            ))}
          </div>
        </div>

        {errorMsg && <p className="text-sm text-rose-500">{errorMsg}</p>}

        <div className="flex justify-end gap-3">
          <Button type="button" variant="secondary" onClick={() => navigate('/sets')}>
            Huỷ
          </Button>
          <Button type="submit" loading={saving}>
            Tạo bộ từ vựng
          </Button>
        </div>
      </form>
    </div>
  )
}
