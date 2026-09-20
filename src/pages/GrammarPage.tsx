import { useEffect, useMemo, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import {
  BookOpen,
  CheckCircle2,
  ChevronRight,
  CircleHelp,
  ClipboardCheck,
  Trophy,
} from 'lucide-react'
import type { GrammarTense } from '@/data/grammarTenses'
import { grammarService, type GrammarProgress } from '@/services/grammarService'
import { grammarQuizService, type GrammarQuizQuestion, type GrammarQuizResult } from '@/services/grammarQuizService'
import { useAuth } from '@/hooks/useAuth'
import { shuffleArray } from '@/lib/utils'
import { Button } from '@/components/ui/Button'
import { Card } from '@/components/ui/Card'
import { ProgressBar } from '@/components/ui/ProgressBar'

type ViewMode = 'theory' | 'exercise'

export function GrammarPage() {
  const { tenseId } = useParams<{ tenseId?: string }>()
  const navigate = useNavigate()
  const { user } = useAuth()
  const [lessons, setLessons] = useState<GrammarTense[]>([])
  const [selectedId, setSelectedId] = useState(tenseId || '')
  const [progress, setProgress] = useState<GrammarProgress[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)
  const [viewMode, setViewMode] = useState<ViewMode>('theory')
  const selectedTense = lessons.find((tense) => tense.id === selectedId) || lessons[0]

  useEffect(() => {
    if (!user) return
    Promise.all([grammarService.listLessons(), grammarService.getProgress(user.id)])
      .then(([loadedLessons, loadedProgress]) => {
        setLessons(loadedLessons)
        setProgress(loadedProgress)
        setSelectedId((current) => current || loadedLessons[0]?.id || '')
      })
      .catch(() => setError(true))
      .finally(() => setLoading(false))
  }, [user])

  useEffect(() => {
    if (tenseId && lessons.some((tense) => tense.id === tenseId)) setSelectedId(tenseId)
  }, [tenseId, lessons])

  const overallProgress = useMemo(() => {
    const total = progress.reduce((sum, item) => sum + item.attempts, 0)
    const correct = progress.reduce((sum, item) => sum + item.correct_attempts, 0)
    return total ? Math.round((correct / total) * 100) : 0
  }, [progress])

  const chooseTense = (tense: GrammarTense) => {
    setSelectedId(tense.id)
    setViewMode('theory')
    navigate(`/grammar/${tense.id}`)
  }

  if (loading) return <div className="p-8 text-center text-ink-soft">Đang tải module ngữ pháp...</div>
  if (error || lessons.length === 0) {
    return <div className="p-8 text-center text-rose-600">Không thể tải dữ liệu ngữ pháp từ Supabase.</div>
  }

  return (
    <div>
      <div className="mb-6 flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
        <div>
          <p className="text-sm font-semibold uppercase tracking-[0.16em] text-teal-600 dark:text-blue-400">Grammar Lab</p>
          <h1 className="mt-2 font-display text-3xl font-semibold text-ink dark:text-white sm:text-4xl">English Tenses</h1>
          <p className="mt-2 max-w-2xl text-ink-soft dark:text-slate-300">
            Đọc lý thuyết trước, rồi luyện bài tập với 20 câu hỏi ngẫu nhiên.
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
          {(['Present', 'Past', 'Future'] as const).map((category) => (
            <div key={category}>
              <p className="mb-2 px-2 text-xs font-bold uppercase tracking-[0.14em] text-ink-soft dark:text-slate-400">{category}</p>
              <div className="space-y-1">
                {lessons
                  .filter((tense) => tense.category === category)
                  .map((tense, index) => {
                    const itemProgress = progress.find((item) => item.lesson_id === tense.id)
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
                        {itemProgress && (
                          <span className="text-xs opacity-70">
                            {itemProgress.correct_attempts}/{itemProgress.attempts}
                          </span>
                        )}
                      </button>
                    )
                  })}
              </div>
            </div>
          ))}
        </aside>

        {selectedTense && (
          <main className="min-w-0 space-y-6">
            <div className="flex gap-3 border-b border-border pb-4 dark:border-slate-700">
              <button
                type="button"
                onClick={() => setViewMode('theory')}
                className={`flex items-center gap-2 rounded-lg px-4 py-2 font-semibold transition-colors ${
                  viewMode === 'theory'
                    ? 'bg-teal-500 text-white shadow-md'
                    : 'bg-white text-ink-soft hover:bg-slate-50 dark:bg-slate-800 dark:text-slate-300 dark:hover:bg-slate-700'
                }`}
              >
                <BookOpen className="h-4 w-4" /> Lý thuyết
              </button>
              <button
                type="button"
                onClick={() => setViewMode('exercise')}
                className={`flex items-center gap-2 rounded-lg px-4 py-2 font-semibold transition-colors ${
                  viewMode === 'exercise'
                    ? 'bg-violet-500 text-white shadow-md'
                    : 'bg-white text-ink-soft hover:bg-slate-50 dark:bg-slate-800 dark:text-slate-300 dark:hover:bg-slate-700'
                }`}
              >
                <ClipboardCheck className="h-4 w-4" /> Bài tập
              </button>
            </div>

            {viewMode === 'theory' && <TenseTheory tense={selectedTense} />}
            {viewMode === 'exercise' && <TenseExercise tense={selectedTense} />}
          </main>
        )}
      </div>
    </div>
  )
}

function TenseTheory({ tense }: { tense: GrammarTense }) {
  return (
    <div className="space-y-6">
      <Card className="overflow-hidden">
        <div className="border-b border-border bg-slate-50 px-6 py-6 dark:border-slate-700 dark:bg-slate-900 sm:px-8">
          <div className="flex flex-wrap items-start justify-between gap-4">
            <div>
              <span className="inline-flex rounded-full bg-teal-100 px-3 py-1 text-xs font-bold uppercase tracking-wide text-teal-700 dark:bg-blue-500/15 dark:text-blue-300">
                {tense.category} · {tense.level}
              </span>
              <h3 className="mt-3 font-display text-3xl font-semibold text-ink dark:text-white">{tense.name}</h3>
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
            <h4 className="flex items-center gap-2 font-display text-lg font-semibold text-ink dark:text-white">
              <CircleHelp className="h-5 w-5 text-teal-500" /> Công thức
            </h4>
            <div className="mt-3 space-y-2 rounded-2xl bg-slate-50 p-4 font-mono text-sm dark:bg-slate-900">
              <p>
                <strong>Khẳng định:</strong> {tense.formula.affirmative}
              </p>
              <p>
                <strong>Phủ định:</strong> {tense.formula.negative}
              </p>
              <p>
                <strong>Câu hỏi:</strong> {tense.formula.question}
              </p>
              <p>
                <strong>Wh-question:</strong> {tense.formula.whQuestion}
              </p>
            </div>
          </section>
          <section>
            <h4 className="font-display text-lg font-semibold text-ink dark:text-white">Dấu hiệu nhận biết</h4>
            <div className="mt-3 flex flex-wrap gap-2">
              {tense.signals.map((signal) => (
                <span
                  key={signal}
                  className="rounded-full bg-violet-100 px-3 py-1 text-sm font-medium text-violet-700 dark:bg-violet-500/15 dark:text-violet-300"
                >
                  {signal}
                </span>
              ))}
            </div>
            <h4 className="mt-6 font-display text-lg font-semibold text-ink dark:text-white">Khi nào sử dụng?</h4>
            <ul className="mt-2 list-disc space-y-1 pl-5 text-sm leading-6 text-ink-soft dark:text-slate-300">
              {tense.uses.map((use) => (
                <li key={use}>{use}</li>
              ))}
            </ul>
          </section>
        </div>
      </Card>

      <div className="grid gap-6 lg:grid-cols-2">
        <Card className="p-6">
          <h4 className="font-display text-lg font-semibold text-ink dark:text-white">Ví dụ đời sống</h4>
          <div className="mt-4 space-y-3">
            {tense.examples.map((example) => (
              <div key={example.english} className="rounded-xl border border-border p-4 dark:border-slate-700">
                <p className="font-semibold text-ink dark:text-white">{example.english}</p>
                <p className="mt-1 text-sm text-ink-soft dark:text-slate-300">{example.vietnamese}</p>
              </div>
            ))}
          </div>
        </Card>
        <Card className="p-6">
          <h4 className="font-display text-lg font-semibold text-ink dark:text-white">Phân biệt và lỗi thường gặp</h4>
          <p className="mt-3 text-sm leading-6 text-ink-soft dark:text-slate-300">{tense.compareWith}</p>
          <div className="mt-4 space-y-3">
            {tense.commonMistakes.map((mistake) => (
              <div key={mistake.wrong} className="rounded-xl bg-rose-50 p-4 text-sm dark:bg-rose-500/10">
                <p className="text-rose-700 line-through dark:text-rose-300">{mistake.wrong}</p>
                <p className="mt-1 font-semibold text-teal-700 dark:text-emerald-300">{mistake.correct}</p>
                <p className="mt-2 text-ink-soft dark:text-slate-300">{mistake.reason}</p>
              </div>
            ))}
          </div>
        </Card>
      </div>

      <Card className="p-6 sm:p-8">
        <div className="flex items-center gap-2">
          <BookOpen className="h-5 w-5 text-teal-500" />
          <h4 className="font-display text-lg font-semibold text-ink dark:text-white">Vocabulary thường dùng</h4>
        </div>
        <div className="mt-4 grid gap-3 sm:grid-cols-2">
          {tense.vocabulary.map((item) => (
            <div key={item.english} className="rounded-xl border border-border p-4 dark:border-slate-700">
              <p className="font-semibold text-ink dark:text-white">{item.english}</p>
              <p className="mt-1 text-sm text-ink-soft dark:text-slate-300">{item.vietnamese}</p>
              <p className="mt-2 text-sm italic text-ink-soft dark:text-slate-400">{item.example}</p>
            </div>
          ))}
        </div>
      </Card>

      <p className="text-xs text-ink-soft dark:text-slate-400">
        Nguồn tham khảo: British Council, English Grammar Reference (Author: Not specified). Nội dung được hệ thống biên soạn lại bằng tiếng Việt dễ hiểu, không sao chép nguyên văn.
      </p>
    </div>
  )
}

function TenseExercise({ tense }: { tense: GrammarTense }) {
  const [questions, setQuestions] = useState<GrammarQuizQuestion[]>([])
  const [loading, setLoading] = useState(true)
  const [quizStarted, setQuizStarted] = useState(false)

  useEffect(() => {
    setLoading(true)
    setQuizStarted(false)
    grammarQuizService
      .listQuestions(tense.id)
      .then(setQuestions)
      .catch(() => setQuestions([]))
      .finally(() => setLoading(false))
  }, [tense.id])

  const randomQuestions = useMemo(() => {
    if (questions.length === 0) return []
    const shuffled = shuffleArray([...questions])
    return shuffled.slice(0, 20)
  }, [questions])

  if (loading) {
    return (
      <Card className="p-8 text-center">
        <p className="text-ink-soft">Đang tải câu hỏi...</p>
      </Card>
    )
  }

  if (questions.length === 0) {
    return (
      <Card className="p-8 text-center">
        <p className="text-ink-soft">Chưa có câu hỏi cho thì này.</p>
      </Card>
    )
  }

  if (!quizStarted) {
    return (
      <Card className="p-6 sm:p-8">
        <div className="flex items-center gap-3">
          <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-violet-100 dark:bg-violet-500/15">
            <ClipboardCheck className="h-6 w-6 text-violet-600 dark:text-violet-300" />
          </div>
          <div>
            <h3 className="font-display text-2xl font-semibold text-ink dark:text-white">Bài tập {tense.name}</h3>
            <p className="mt-1 text-ink-soft dark:text-slate-300">{tense.nameVi}</p>
          </div>
        </div>

        <div className="mt-6 space-y-4 rounded-2xl bg-slate-50 p-6 dark:bg-slate-900">
          <div className="flex items-start gap-3">
            <CheckCircle2 className="mt-0.5 h-5 w-5 flex-shrink-0 text-teal-500" />
            <div>
              <p className="font-semibold text-ink dark:text-white">20 câu hỏi ngẫu nhiên</p>
              <p className="mt-1 text-sm text-ink-soft dark:text-slate-300">
                Mỗi lần làm bài sẽ chọn ngẫu nhiên 20 câu từ kho {questions.length} câu hỏi.
              </p>
            </div>
          </div>
          <div className="flex items-start gap-3">
            <CheckCircle2 className="mt-0.5 h-5 w-5 flex-shrink-0 text-teal-500" />
            <div>
              <p className="font-semibold text-ink dark:text-white">Bài tập trắc nghiệm</p>
              <p className="mt-1 text-sm text-ink-soft dark:text-slate-300">
                Chọn đáp án đúng cho mỗi câu hỏi. Mỗi câu có 4 lựa chọn.
              </p>
            </div>
          </div>
          <div className="flex items-start gap-3">
            <CheckCircle2 className="mt-0.5 h-5 w-5 flex-shrink-0 text-teal-500" />
            <div>
              <p className="font-semibold text-ink dark:text-white">Giải thích chi tiết</p>
              <p className="mt-1 text-sm text-ink-soft dark:text-slate-300">
                Sau mỗi câu trả lời, bạn sẽ nhận được giải thích chi tiết về đáp án đúng.
              </p>
            </div>
          </div>
        </div>

        <div className="mt-6 flex gap-3">
          <Button onClick={() => setQuizStarted(true)} className="flex items-center gap-2">
            <ChevronRight className="h-4 w-4" /> Bắt đầu làm bài
          </Button>
        </div>
      </Card>
    )
  }

  return <QuizSession questions={randomQuestions} tense={tense} onRestart={() => setQuizStarted(false)} />
}

function QuizSession({
  questions,
  tense,
  onRestart,
}: {
  questions: GrammarQuizQuestion[]
  tense: GrammarTense
  onRestart: () => void
}) {
  const [index, setIndex] = useState(0)
  const [selected, setSelected] = useState<string | null>(null)
  const [result, setResult] = useState<GrammarQuizResult | null>(null)
  const [score, setScore] = useState(0)
  const [finished, setFinished] = useState(false)
  const [submitting, setSubmitting] = useState(false)

  const current = questions[index]
  const options = useMemo(() => (current ? shuffleArray(current.options) : []), [current])

  const submit = async (answer: string) => {
    if (!current || selected || submitting) return
    setSelected(answer)
    setSubmitting(true)
    try {
      const nextResult = await grammarQuizService.submitAnswer(current.id, answer)
      setResult(nextResult)
      if (nextResult.is_correct) setScore((value) => value + 1)
    } catch {
      setSelected(null)
    } finally {
      setSubmitting(false)
    }
  }

  const goNext = () => {
    if (index + 1 >= questions.length) {
      setFinished(true)
      return
    }
    setIndex((value) => value + 1)
    setSelected(null)
    setResult(null)
  }

  if (finished) {
    const percentage = Math.round((score / questions.length) * 100)
    return (
      <Card className="p-6 sm:p-8">
        <div className="flex items-center gap-3">
          <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-violet-100 dark:bg-violet-500/15">
            <Trophy className="h-6 w-6 text-violet-600 dark:text-violet-300" />
          </div>
          <div>
            <h3 className="font-display text-2xl font-semibold text-ink dark:text-white">Hoàn thành bài tập</h3>
            <p className="mt-1 text-ink-soft dark:text-slate-300">{tense.name}</p>
          </div>
        </div>

        <div className="mt-6 rounded-2xl bg-slate-50 p-6 text-center dark:bg-slate-900">
          <p className="text-5xl font-bold text-violet-600 dark:text-violet-400">{percentage}%</p>
          <p className="mt-2 text-lg font-semibold text-ink dark:text-white">
            {score}/{questions.length} câu đúng
          </p>
          <ProgressBar value={score} max={questions.length} colorClassName="bg-violet-500" className="mt-4" />
        </div>

        <div className="mt-6 flex flex-wrap gap-3">
          <Button onClick={onRestart}>Làm lại bài khác</Button>
          <Button variant="secondary" onClick={onRestart}>
            Quay lại
          </Button>
        </div>
      </Card>
    )
  }

  return (
    <Card className="p-6 sm:p-8">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <div>
          <p className="text-sm font-semibold uppercase tracking-[0.14em] text-violet-600 dark:text-violet-400">{tense.name}</p>
          <h3 className="mt-1 font-display text-2xl font-semibold text-ink dark:text-white">Chọn đáp án đúng</h3>
        </div>
        <span className="rounded-full bg-slate-100 px-3 py-1 text-sm font-medium text-ink-soft dark:bg-slate-700 dark:text-slate-300">
          Câu {index + 1}/{questions.length}
        </span>
      </div>

      <div className="mt-6 rounded-2xl bg-slate-50 p-5 dark:bg-slate-900">
        <p className="text-xl font-semibold text-ink dark:text-white">{current.prompt}</p>
      </div>

      <div className="mt-4 grid gap-3 sm:grid-cols-2">
        {options.map((option) => {
          const isChosen = selected === option
          const isCorrect = Boolean(result && option === result.correct_answer)
          const isWrong = Boolean(result && isChosen && !result.is_correct)
          return (
            <button
              key={option}
              type="button"
              disabled={Boolean(selected) || submitting}
              onClick={() => submit(option)}
              className={`rounded-xl border px-4 py-3 text-left text-sm font-semibold transition-colors ${
                isCorrect
                  ? 'border-emerald-500 bg-emerald-50 text-emerald-800 dark:bg-emerald-500/10 dark:text-emerald-300'
                  : isWrong
                    ? 'border-rose-400 bg-rose-50 text-rose-800 dark:bg-rose-500/10 dark:text-rose-300'
                    : 'border-border bg-white text-ink hover:border-violet-500/50 dark:border-slate-700 dark:bg-slate-800 dark:text-white'
              }`}
            >
              {option}
            </button>
          )
        })}
      </div>

      {result && (
        <div className={`mt-5 rounded-2xl p-5 ${result.is_correct ? 'bg-emerald-50 dark:bg-emerald-500/10' : 'bg-rose-50 dark:bg-rose-500/10'}`}>
          <p
            className={`flex items-center gap-2 font-semibold ${
              result.is_correct ? 'text-emerald-700 dark:text-emerald-300' : 'text-rose-700 dark:text-rose-300'
            }`}
          >
            {result.is_correct ? <CheckCircle2 className="h-5 w-5" /> : <CircleHelp className="h-5 w-5" />}
            {result.is_correct ? 'Chính xác!' : `Đáp án đúng: ${result.correct_answer}`}
          </p>
          <p className="mt-2 text-sm text-ink-soft dark:text-slate-300">{result.explanation}</p>
          <Button className="mt-4" onClick={goNext}>
            <ChevronRight className="h-4 w-4" /> {index + 1 >= questions.length ? 'Xem kết quả' : 'Câu tiếp theo'}
          </Button>
        </div>
      )}

      <div className="mt-5">
        <ProgressBar value={index + (result ? 1 : 0)} max={questions.length} colorClassName="bg-violet-500" />
      </div>
    </Card>
  )
}
