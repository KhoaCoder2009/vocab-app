import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { CheckCircle2, ChevronRight, CircleHelp, PenLine, Trophy } from 'lucide-react'
import { grammarTenses, tenseCategories, type GrammarTense } from '@/data/grammarTenses'
import { normalizeAnswer } from '@/lib/utils'
import { Button } from '@/components/ui/Button'
import { Card } from '@/components/ui/Card'
import { ProgressBar } from '@/components/ui/ProgressBar'

const progressKey = 'learnvocab-grammar-progress'

type GrammarProgress = Record<string, { correct: number; total: number }>

function readProgress(): GrammarProgress {
  try {
    return JSON.parse(localStorage.getItem(progressKey) || '{}') as GrammarProgress
  } catch {
    return {}
  }
}

function getLevelLabel(level: number) {
  return ['Easy', 'Basic', 'Intermediate', 'Advanced', 'Challenge'][level - 1]
}

function isAnswerAccepted(answer: string, acceptedAnswers: string[]) {
  const normalized = normalizeAnswer(answer).replace(/[.!?]$/, '')
  return acceptedAnswers.some((item) => normalizeAnswer(item).replace(/[.!?]$/, '') === normalized)
}

export function GrammarPage() {
  const { tenseId } = useParams<{ tenseId?: string }>()
  const navigate = useNavigate()
  const [selectedId, setSelectedId] = useState(tenseId || grammarTenses[0].id)
  const [progress, setProgress] = useState<GrammarProgress>(() => readProgress())
  const selectedTense = grammarTenses.find((tense) => tense.id === selectedId) || grammarTenses[0]

  useEffect(() => {
    if (tenseId && grammarTenses.some((tense) => tense.id === tenseId)) setSelectedId(tenseId)
  }, [tenseId])

  const overallProgress = useMemo(() => {
    const total = grammarTenses.reduce((sum, tense) => sum + (progress[tense.id]?.total || 0), 0)
    const correct = grammarTenses.reduce((sum, tense) => sum + (progress[tense.id]?.correct || 0), 0)
    return total ? Math.round((correct / total) * 100) : 0
  }, [progress])

  const chooseTense = (tense: GrammarTense) => {
    setSelectedId(tense.id)
    navigate(`/grammar/${tense.id}`)
  }

  const updateProgress = (isCorrect: boolean) => {
    const current = progress[selectedTense.id] || { correct: 0, total: 0 }
    const next = {
      ...progress,
      [selectedTense.id]: {
        correct: current.correct + (isCorrect ? 1 : 0),
        total: current.total + 1,
      },
    }
    setProgress(next)
    localStorage.setItem(progressKey, JSON.stringify(next))
  }

  return (
    <div>
      <div className="mb-6 flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
        <div>
          <p className="text-sm font-semibold uppercase tracking-[0.16em] text-teal-600 dark:text-blue-400">Grammar Lab</p>
          <h1 className="mt-2 font-display text-3xl font-semibold text-ink dark:text-white sm:text-4xl">English Tenses</h1>
          <p className="mt-2 max-w-2xl text-ink-soft dark:text-slate-300">
            Hiểu bản chất, luyện tập và tự viết câu. Không học công thức một cách máy móc.
          </p>
        </div>
        <div className="flex items-center gap-3 rounded-2xl bg-white px-4 py-3 shadow-card dark:bg-slate-800">
          <Trophy className="h-5 w-5 text-coral-600" />
          <div>
            <p className="text-xs text-ink-soft dark:text-slate-400">Tiến độ luyện viết</p>
            <p className="font-display font-semibold text-ink dark:text-white">{overallProgress}% chính xác</p>
          </div>
        </div>
      </div>

      <div className="grid gap-6 lg:grid-cols-[260px_1fr]">
        <aside className="space-y-3">
          {tenseCategories.map((category) => (
            <div key={category}>
              <p className="mb-2 px-2 text-xs font-bold uppercase tracking-[0.14em] text-ink-soft dark:text-slate-400">{category}</p>
              <div className="space-y-1">
                {grammarTenses.filter((tense) => tense.category === category).map((tense, index) => {
                  const itemProgress = progress[tense.id]
                  return (
                    <button
                      key={tense.id}
                      type="button"
                      onClick={() => chooseTense(tense)}
                      className={`flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-left transition-colors ${
                        selectedTense.id === tense.id
                          ? 'bg-teal-500 text-white shadow-[0_8px_18px_-10px_rgba(37,99,235,0.8)]'
                          : 'text-ink-soft hover:bg-white hover:text-ink dark:text-slate-300 dark:hover:bg-slate-800 dark:hover:text-white'
                      }`}
                    >
                      <span className="w-5 text-xs font-bold opacity-70">{index + 1}</span>
                      <span className="min-w-0 flex-1 truncate text-sm font-semibold">{tense.name}</span>
                      {itemProgress && <span className="text-xs opacity-70">{itemProgress.correct}/{itemProgress.total}</span>}
                    </button>
                  )
                })}
              </div>
            </div>
          ))}
        </aside>

        <TenseLesson tense={selectedTense} onAnswer={updateProgress} />
      </div>
    </div>
  )
}

function TenseLesson({ tense, onAnswer }: { tense: GrammarTense; onAnswer: (isCorrect: boolean) => void }) {
  const [exerciseIndex, setExerciseIndex] = useState(0)
  const [answer, setAnswer] = useState('')
  const [submitted, setSubmitted] = useState(false)
  const exercise = tense.writingExercises[exerciseIndex]
  const correct = submitted && isAnswerAccepted(answer, exercise.acceptedAnswers)

  useEffect(() => {
    setExerciseIndex(0)
    setAnswer('')
    setSubmitted(false)
  }, [tense.id])

  const submit = () => {
    if (!answer.trim() || submitted) return
    setSubmitted(true)
    onAnswer(isAnswerAccepted(answer, exercise.acceptedAnswers))
  }

  const nextExercise = () => {
    setExerciseIndex((index) => (index + 1) % tense.writingExercises.length)
    setAnswer('')
    setSubmitted(false)
  }

  return (
    <main className="min-w-0 space-y-6">
      <Card className="overflow-hidden">
        <div className="border-b border-border bg-slate-50 px-6 py-6 dark:border-slate-700 dark:bg-slate-900 sm:px-8">
          <div className="flex flex-wrap items-start justify-between gap-4">
            <div>
              <span className="inline-flex rounded-full bg-teal-100 px-3 py-1 text-xs font-bold uppercase tracking-wide text-teal-700 dark:bg-blue-500/15 dark:text-blue-300">
                {tense.category} · {tense.level}
              </span>
              <h2 className="mt-3 font-display text-3xl font-semibold text-ink dark:text-white">{tense.name}</h2>
              <p className="mt-1 text-lg text-teal-700 dark:text-blue-300">{tense.nameVi}</p>
              <p className="mt-4 max-w-2xl text-ink-soft dark:text-slate-300">{tense.summary}</p>
            </div>
            <Link to="/grammar" className="text-sm font-semibold text-teal-600 hover:underline dark:text-blue-400">
              Tất cả thì
            </Link>
          </div>
        </div>

        <div className="grid gap-6 p-6 sm:p-8 lg:grid-cols-2">
          <section>
            <h3 className="flex items-center gap-2 font-display text-lg font-semibold text-ink dark:text-white"><CircleHelp className="h-5 w-5 text-teal-500" /> Công thức</h3>
            <div className="mt-3 space-y-2 rounded-2xl bg-slate-50 p-4 font-mono text-sm dark:bg-slate-900">
              <p><strong>Khẳng định:</strong> {tense.formula.affirmative}</p>
              <p><strong>Phủ định:</strong> {tense.formula.negative}</p>
              <p><strong>Câu hỏi:</strong> {tense.formula.question}</p>
              <p><strong>Wh-question:</strong> {tense.formula.whQuestion}</p>
            </div>
          </section>
          <section>
            <h3 className="font-display text-lg font-semibold text-ink dark:text-white">Dấu hiệu nhận biết</h3>
            <div className="mt-3 flex flex-wrap gap-2">
              {tense.signals.map((signal) => <span key={signal} className="rounded-full bg-violet-100 px-3 py-1 text-sm font-medium text-violet-700 dark:bg-violet-500/15 dark:text-violet-300">{signal}</span>)}
            </div>
            <h3 className="mt-6 font-display text-lg font-semibold text-ink dark:text-white">Khi nào sử dụng?</h3>
            <ul className="mt-2 list-disc space-y-1 pl-5 text-sm leading-6 text-ink-soft dark:text-slate-300">
              {tense.uses.map((use) => <li key={use}>{use}</li>)}
            </ul>
          </section>
        </div>
      </Card>

      <div className="grid gap-6 lg:grid-cols-2">
        <Card className="p-6">
          <h3 className="font-display text-lg font-semibold text-ink dark:text-white">Ví dụ đời sống</h3>
          <div className="mt-4 space-y-3">
            {tense.examples.map((example) => <div key={example.english} className="rounded-xl border border-border p-4 dark:border-slate-700"><p className="font-semibold text-ink dark:text-white">{example.english}</p><p className="mt-1 text-sm text-ink-soft dark:text-slate-300">{example.vietnamese}</p></div>)}
          </div>
        </Card>
        <Card className="p-6">
          <h3 className="font-display text-lg font-semibold text-ink dark:text-white">Phân biệt và lỗi thường gặp</h3>
          <p className="mt-3 text-sm leading-6 text-ink-soft dark:text-slate-300">{tense.compareWith}</p>
          <div className="mt-4 space-y-3">
            {tense.commonMistakes.map((mistake) => <div key={mistake.wrong} className="rounded-xl bg-rose-50 p-4 text-sm dark:bg-rose-500/10"><p className="text-rose-700 line-through dark:text-rose-300">{mistake.wrong}</p><p className="mt-1 font-semibold text-teal-700 dark:text-emerald-300">{mistake.correct}</p><p className="mt-2 text-ink-soft dark:text-slate-300">{mistake.reason}</p></div>)}
          </div>
        </Card>
      </div>

      <Card className="p-6 sm:p-8">
        <div className="flex flex-wrap items-center justify-between gap-3">
          <div>
            <p className="text-sm font-semibold uppercase tracking-[0.14em] text-teal-600 dark:text-blue-400">Writing practice</p>
            <h3 className="mt-1 font-display text-2xl font-semibold text-ink dark:text-white">Viết câu từ tiếng Việt</h3>
          </div>
          <span className="rounded-full bg-slate-100 px-3 py-1 text-sm font-medium text-ink-soft dark:bg-slate-700 dark:text-slate-300">Level {exercise.level} · {getLevelLabel(exercise.level)}</span>
        </div>
        <div className="mt-6 rounded-2xl bg-slate-50 p-5 dark:bg-slate-900">
          <p className="text-xs font-bold uppercase tracking-wide text-ink-soft dark:text-slate-400">{exercise.topic}</p>
          <p className="mt-2 text-xl font-semibold text-ink dark:text-white">{exercise.vietnamese}</p>
        </div>
        <div className="mt-4 flex flex-col gap-3 sm:flex-row">
          <input
            value={answer}
            onChange={(event) => setAnswer(event.target.value)}
            onKeyDown={(event) => { if (event.key === 'Enter') submit() }}
            disabled={submitted}
            placeholder="Tự viết câu tiếng Anh..."
            className="h-14 min-w-0 flex-1 rounded-xl border border-border bg-white px-4 text-base text-ink outline-none focus:border-teal-500 dark:border-slate-700 dark:bg-slate-800 dark:text-white"
          />
          <Button onClick={submit} disabled={!answer.trim() || submitted} size="lg"><PenLine className="h-4 w-4" /> Submit</Button>
        </div>
        {submitted && (
          <div className={`mt-5 rounded-2xl p-5 ${correct ? 'bg-emerald-50 dark:bg-emerald-500/10' : 'bg-rose-50 dark:bg-rose-500/10'}`}>
            <p className={`flex items-center gap-2 font-semibold ${correct ? 'text-emerald-700 dark:text-emerald-300' : 'text-rose-700 dark:text-rose-300'}`}>
              {correct ? <CheckCircle2 className="h-5 w-5" /> : <CircleHelp className="h-5 w-5" />} {correct ? 'Correct!' : 'Cần sửa một chút'}
            </p>
            <p className="mt-2 text-sm text-ink-soft dark:text-slate-300">Câu đúng tham khảo: <strong className="text-ink dark:text-white">{exercise.acceptedAnswers[0]}</strong></p>
            <p className="mt-2 text-sm text-ink-soft dark:text-slate-300">{exercise.explanation}</p>
            <div className="mt-4 flex flex-wrap gap-3">
              {!correct && <Button variant="secondary" onClick={() => { setAnswer(''); setSubmitted(false) }}>Thử lại</Button>}
              <Button variant="ghost" onClick={nextExercise}><ChevronRight className="h-4 w-4" /> Câu tiếp theo</Button>
            </div>
          </div>
        )}
        <div className="mt-5"><ProgressBar value={exerciseIndex + 1} max={tense.writingExercises.length} colorClassName="bg-violet-500" /></div>
      </Card>

      <p className="text-xs text-ink-soft dark:text-slate-400">Nguồn tham khảo: British Council, English Grammar Reference (Author: Not specified). Nội dung được hệ thống biên soạn lại bằng tiếng Việt dễ hiểu, không sao chép nguyên văn.</p>
    </main>
  )
}
