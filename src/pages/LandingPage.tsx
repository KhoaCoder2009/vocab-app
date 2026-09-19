import { Link } from 'react-router-dom'
import { motion } from 'framer-motion'
import {
  Layers,
  PencilLine,
  RotateCcw,
  LineChart,
  Brain,
  ArrowRight,
  Volume2,
  Menu,
} from 'lucide-react'
import { Button } from '@/components/ui/Button'

const features = [
  {
    icon: Layers,
    title: 'Flashcard thông minh',
    description:
      'Lật thẻ để xem nghĩa, nghe phát âm chuẩn và học theo nhịp độ của riêng bạn — không giới hạn số lần lặp lại.',
    color: 'teal',
  },
  {
    icon: PencilLine,
    title: 'Kiểm tra điền từ',
    description:
      'Sau flashcard, hệ thống yêu cầu bạn gõ lại từ trong ngữ cảnh câu thật — cách chắc chắn nhất để biết bạn đã nhớ hay chưa.',
    color: 'coral',
  },
  {
    icon: RotateCcw,
    title: 'Ôn lại từ sai',
    description:
      'Mọi từ trả lời sai được tự động lưu vào danh sách ôn tập, không bao giờ bị bỏ quên cho đến khi bạn thực sự thuộc.',
    color: 'violet',
  },
  {
    icon: Brain,
    title: 'Spaced Repetition',
    description:
      'Thuật toán lặp lại ngắt quãng giãn cách thời gian ôn tập theo mức độ ghi nhớ: 1 ngày, 3 ngày, 1 tuần, rồi 1 tháng.',
    color: 'teal',
  },
  {
    icon: LineChart,
    title: 'Theo dõi tiến độ',
    description:
      'Biểu đồ trực quan cho thấy số từ đã học, độ chính xác và chuỗi ngày học liên tiếp — động lực để bạn không bỏ cuộc.',
    color: 'coral',
  },
  {
    icon: Volume2,
    title: 'Phát âm chuẩn',
    description: 'Nghe phát âm Anh-Mỹ (và Anh-Anh) cho từng từ chỉ với một cú nhấp chuột.',
    color: 'violet',
  },
]

const colorMap: Record<string, string> = {
  teal: 'bg-teal-100 text-teal-600 dark:bg-teal-500/15 dark:text-teal-400',
  coral: 'bg-coral-100 text-coral-600 dark:bg-coral-500/15 dark:text-coral-400',
  violet: 'bg-violet-100 text-violet-600 dark:bg-violet-500/15 dark:text-violet-400',
}

const steps = [
  { label: 'Flashcard', detail: 'Xem từ, nghe âm, lật để kiểm tra nghĩa' },
  { label: 'Điền từ', detail: 'Gõ lại từ đúng trong câu ví dụ' },
  { label: 'Chấm điểm', detail: 'Nhận điểm ngay lập tức, có gợi ý nếu cần' },
  { label: 'Ôn lại', detail: 'Từ sai quay lại đúng lúc bạn sắp quên' },
]

export function LandingPage() {
  return (
    <div className="overflow-x-hidden bg-white dark:bg-slate-900">
      {/* NAVBAR */}
      <header className="mx-auto flex max-w-7xl items-center justify-between px-6 py-5 lg:px-10">
        <div className="flex items-center gap-2">
          <div className="flex h-10 w-10 items-center justify-center rounded-2xl bg-teal-500 text-white shadow-[0_10px_24px_-12px_rgba(37,99,235,0.7)]">
            <span className="font-display text-xl font-bold">K</span>
          </div>
          <span className="font-display text-xl font-semibold tracking-tight text-ink dark:text-white">learnvocab</span>
        </div>
        <nav className="hidden items-center gap-8 text-sm font-medium text-ink-soft dark:text-slate-300 md:flex">
          <a href="#lo-trinh" className="transition-colors hover:text-teal-600">Lộ trình học</a>
          <a href="#tinh-nang" className="transition-colors hover:text-teal-600">Tính năng</a>
          <a href="#bo-tu" className="transition-colors hover:text-teal-600">Bộ từ vựng</a>
        </nav>
        <div className="flex items-center gap-3">
          <button
            type="button"
            aria-label="Mở menu"
            className="flex h-10 w-10 items-center justify-center rounded-full text-ink-soft hover:bg-slate-100 dark:text-slate-300 dark:hover:bg-slate-800 md:hidden"
          >
            <Menu className="h-5 w-5" />
          </button>
          <Link to="/login">
            <Button variant="primary" size="sm" className="border-2 border-teal-300/40 px-5 shadow-[0_8px_20px_-6px_rgba(37,99,235,0.45)]">
              Đăng nhập
            </Button>
          </Link>
        </div>
      </header>

      {/* HERO */}
      <section className="mx-auto grid max-w-7xl grid-cols-1 items-center gap-12 px-6 pb-24 pt-16 lg:grid-cols-[1.05fr_0.95fr] lg:px-10 lg:pb-32 lg:pt-24">
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
        >
          <p className="mb-5 text-sm font-semibold uppercase tracking-[0.18em] text-teal-600 dark:text-blue-400">
            Học chăm chỉ, tiến bộ mỗi ngày
          </p>
          <h1 className="max-w-2xl font-display text-5xl font-semibold leading-[1.02] tracking-tight text-ink dark:text-white sm:text-6xl lg:text-[4.8rem]">
            Từ vựng ở lại lâu hơn.
          </h1>
          <p className="mt-6 max-w-xl text-lg leading-8 text-ink-soft dark:text-slate-300 sm:text-xl">
            Một không gian học tiếng Anh nhẹ nhàng, có lộ trình rõ ràng và đủ công cụ để bạn tự tin nhớ từ mới.
          </p>
          <div className="mt-8 flex flex-col gap-3 sm:flex-row">
            <Link to="/register">
              <Button size="lg" className="w-full sm:w-auto">
                Bắt đầu học <ArrowRight className="h-4 w-4" />
              </Button>
            </Link>
            <Link to="/register">
              <Button variant="secondary" size="lg" className="w-full sm:w-auto">
                Xem bộ từ vựng
              </Button>
            </Link>
          </div>
          <div className="mt-10 flex flex-wrap items-center gap-x-6 gap-y-3 text-sm text-ink-soft dark:text-slate-300">
            <div>
              <p className="font-display text-2xl font-semibold text-ink dark:text-white">4 bước</p>
              <p>Để nhớ một từ</p>
            </div>
            <div className="h-8 w-px bg-ink/10 dark:bg-white/10" />
            <div>
              <p className="font-display text-2xl font-semibold text-ink dark:text-white">100%</p>
              <p>Tập trung vào việc học</p>
            </div>
            <div className="h-8 w-px bg-ink/10 dark:bg-white/10" />
            <div>
              <p className="font-display text-2xl font-semibold text-ink dark:text-white">∞</p>
              <p>Ôn lại đến khi nhớ</p>
            </div>
          </div>
        </motion.div>

        {/* Hero flashcard stack — signature visual */}
        <motion.div
          initial={{ opacity: 0, scale: 0.92 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 0.6, delay: 0.15 }}
          className="relative mx-auto h-[360px] w-full max-w-sm [perspective:1400px]"
        >
          <div className="absolute inset-0 translate-x-6 translate-y-10 rotate-6 rounded-[32px] bg-violet-100 shadow-card dark:bg-violet-500/10" />
          <div className="absolute inset-0 -translate-x-4 translate-y-5 -rotate-3 rounded-[32px] bg-teal-100 shadow-card dark:bg-blue-500/10" />
          <motion.div
            className="absolute inset-0 rounded-[32px] border border-border bg-white p-8 shadow-[0_30px_80px_-30px_rgba(15,23,42,0.3)] dark:border-slate-700 dark:bg-slate-800 [transform-style:preserve-3d]"
            animate={{ rotateY: [0, 0, 180, 180, 0] }}
            transition={{ duration: 6, repeat: Infinity, times: [0, 0.4, 0.5, 0.9, 1], ease: 'easeInOut' }}
          >
            <div className="flex h-full flex-col items-center justify-center text-center [backface-visibility:hidden]">
              <p className="font-display text-3xl font-semibold text-ink dark:text-white">achievement</p>
              <p className="mt-2 text-ink-soft dark:text-white/50">/əˈtʃiːvmənt/</p>
              <div className="mt-6 flex h-10 w-10 items-center justify-center rounded-full bg-teal-100 text-teal-600 dark:bg-teal-500/15 dark:text-teal-400">
                <Volume2 className="h-5 w-5" />
              </div>
            </div>
          </motion.div>
        </motion.div>
      </section>

      {/* FEATURES */}
      <section id="tinh-nang" className="mx-auto max-w-7xl px-6 py-20 lg:px-10">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: '-80px' }}
          transition={{ duration: 0.5 }}
          className="mx-auto max-w-xl text-center"
        >
          <h2 className="font-display text-3xl font-semibold text-ink dark:text-white">
            Học đúng cách, từ những việc nhỏ
          </h2>
          <p className="mt-3 text-ink-soft dark:text-white/60">
            Mỗi tính năng được đặt đúng chỗ để bạn tập trung vào việc quan trọng nhất: nhớ và dùng được từ.
          </p>
        </motion.div>

        <div className="mt-12 grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
          {features.map((f, i) => (
            <motion.div
              key={f.title}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, margin: '-40px' }}
              transition={{ duration: 0.4, delay: i * 0.05 }}
              className="rounded-[20px] border border-border bg-white p-6 shadow-card dark:border-slate-700 dark:bg-slate-800"
            >
              <div className={`mb-4 flex h-11 w-11 items-center justify-center rounded-xl ${colorMap[f.color]}`}>
                <f.icon className="h-5 w-5" />
              </div>
              <h3 className="font-display text-lg font-semibold text-ink dark:text-white">{f.title}</h3>
              <p className="mt-2 text-sm leading-relaxed text-ink-soft dark:text-white/60">{f.description}</p>
            </motion.div>
          ))}
        </div>
      </section>

      {/* PROCESS */}
      <section id="lo-trinh" className="bg-ink py-20 text-white">
        <div className="mx-auto max-w-6xl px-6">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-center font-display text-3xl font-semibold"
          >
            Một lộ trình rõ ràng để không bị lạc hướng
          </motion.h2>
          <div className="mt-12 grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-4">
            {steps.map((s, i) => (
              <motion.div
                key={s.label}
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true, margin: '-40px' }}
                transition={{ duration: 0.4, delay: i * 0.08 }}
                className="relative rounded-[20px] border border-white/10 bg-white/5 p-6"
              >
                <p className="font-display text-4xl font-semibold text-white/20">{i + 1}</p>
                <p className="mt-3 font-display text-lg font-semibold">{s.label}</p>
                <p className="mt-1.5 text-sm text-white/60">{s.detail}</p>
                {i < steps.length - 1 && (
                  <ArrowRight className="absolute -right-4 top-1/2 hidden h-5 w-5 -translate-y-1/2 text-white/20 lg:block" />
                )}
              </motion.div>
            ))}
          </div>
        </div>
      </section>

      {/* FOR STUDENTS */}
      <section id="bo-tu" className="bg-slate-50 py-20 dark:bg-slate-900">
        <div className="mx-auto max-w-6xl px-6">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-center"
          >
            <h2 className="font-display text-3xl font-semibold text-ink dark:text-white">
              Dành cho học sinh
            </h2>
            <p className="mt-3 text-ink-soft dark:text-white/60">
              Bộ từ vựng theo chương trình SGK, giúp bạn học hiệu quả hơn
            </p>
          </motion.div>

          <div className="mt-12 grid grid-cols-1 gap-6 md:grid-cols-2 lg:grid-cols-3">
            {/* English 12 Card */}
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.4, delay: 0.1 }}
              className="group rounded-[20px] border border-border bg-white p-6 shadow-card transition-all hover:shadow-lift dark:border-slate-700 dark:bg-slate-800"
            >
              <div className="mb-4 flex h-12 w-12 items-center justify-center rounded-xl bg-teal-100 text-teal-600 dark:bg-teal-500/15 dark:text-teal-400">
                <span className="font-display text-xl font-bold">12</span>
              </div>
              <h3 className="font-display text-xl font-semibold text-ink dark:text-white">
                Tiếng Anh 12
              </h3>
              <p className="mt-2 text-sm text-ink-soft dark:text-white/60">
                Từ vựng SGK Tiếng Anh 12 theo từng Unit
              </p>
              <div className="mt-4 space-y-2 text-sm">
                <div className="flex items-center gap-2 text-ink-soft dark:text-white/70">
                  <div className="h-1.5 w-1.5 rounded-full bg-teal-500" />
                  <span>Unit 1: Life Stories We Admire</span>
                </div>
                <div className="flex items-center gap-2 text-ink-soft/50 dark:text-white/40">
                  <div className="h-1.5 w-1.5 rounded-full bg-ink/30 dark:bg-white/30" />
                  <span>Unit 2-10: Coming soon</span>
                </div>
              </div>
              <Link to="/register">
                <Button variant="secondary" size="sm" className="mt-6 w-full group-hover:bg-teal-100 dark:group-hover:bg-teal-500/15">
                  Học ngay
                </Button>
              </Link>
            </motion.div>

            {/* English 11 Card */}
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.4, delay: 0.15 }}
              className="group rounded-[20px] border border-border bg-white p-6 shadow-card opacity-60 dark:border-slate-700 dark:bg-slate-800"
            >
              <div className="mb-4 flex h-12 w-12 items-center justify-center rounded-xl bg-violet-100 text-violet-600 dark:bg-violet-500/15 dark:text-violet-400">
                <span className="font-display text-xl font-bold">11</span>
              </div>
              <h3 className="font-display text-xl font-semibold text-ink dark:text-white">
                Tiếng Anh 11
              </h3>
              <p className="mt-2 text-sm text-ink-soft dark:text-white/60">
                Từ vựng SGK Tiếng Anh 11 theo từng Unit
              </p>
              <div className="mt-4 space-y-2 text-sm">
                <div className="flex items-center gap-2 text-ink-soft/50 dark:text-white/40">
                  <div className="h-1.5 w-1.5 rounded-full bg-ink/30 dark:bg-white/30" />
                  <span>Coming soon...</span>
                </div>
              </div>
              <Button variant="secondary" size="sm" className="mt-6 w-full opacity-50" disabled>
                Sắp ra mắt
              </Button>
            </motion.div>

            {/* English 10 Card */}
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.4, delay: 0.2 }}
              className="group rounded-[20px] border border-border bg-white p-6 shadow-card opacity-60 dark:border-slate-700 dark:bg-slate-800"
            >
              <div className="mb-4 flex h-12 w-12 items-center justify-center rounded-xl bg-teal-100 text-teal-600 dark:bg-teal-500/15 dark:text-teal-400">
                <span className="font-display text-xl font-bold">10</span>
              </div>
              <h3 className="font-display text-xl font-semibold text-ink dark:text-white">
                Tiếng Anh 10
              </h3>
              <p className="mt-2 text-sm text-ink-soft dark:text-white/60">
                Từ vựng SGK Tiếng Anh 10 theo từng Unit
              </p>
              <div className="mt-4 space-y-2 text-sm">
                <div className="flex items-center gap-2 text-ink-soft/50 dark:text-white/40">
                  <div className="h-1.5 w-1.5 rounded-full bg-ink/30 dark:bg-white/30" />
                  <span>Coming soon...</span>
                </div>
              </div>
              <Button variant="secondary" size="sm" className="mt-6 w-full opacity-50" disabled>
                Sắp ra mắt
              </Button>
            </motion.div>
          </div>

          <motion.div
            initial={{ opacity: 0, y: 10 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.3 }}
            className="mt-8 text-center"
          >
            <p className="text-sm text-ink-soft dark:text-white/60">
              💡 <strong>Lưu ý:</strong> Bộ từ vựng SGK được cập nhật thường xuyên. Đăng ký để nhận thông báo khi có Unit mới!
            </p>
          </motion.div>
        </div>
      </section>

      {/* CTA */}
      <section className="mx-auto max-w-3xl px-6 py-20 text-center">
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
        >
          <h2 className="font-display text-3xl font-semibold text-ink dark:text-white">
            Sẵn sàng ghi nhớ từ vựng lâu hơn chưa?
          </h2>
          <p className="mt-3 text-ink-soft dark:text-white/60">
            Tạo tài khoản miễn phí và bắt đầu buổi học đầu tiên ngay hôm nay.
          </p>
          <Link to="/register">
            <Button size="lg" className="mt-7">
              Bắt đầu học <ArrowRight className="h-4 w-4" />
            </Button>
          </Link>
        </motion.div>
      </section>

      <footer className="border-t border-ink/[0.06] py-8 text-center text-sm text-ink-soft dark:border-white/[0.06] dark:text-white/50">
        © {new Date().getFullYear()} learnvocab. Học từ vựng thông minh hơn mỗi ngày.
      </footer>
    </div>
  )
}
