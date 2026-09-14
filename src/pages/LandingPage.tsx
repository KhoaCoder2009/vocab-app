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
    <div className="overflow-x-hidden bg-paper dark:bg-[#12141F]">
      {/* NAVBAR */}
      <header className="mx-auto flex max-w-6xl items-center justify-between px-6 py-6">
        <div className="flex items-center gap-2">
          <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-teal-500 text-white">
            <span className="font-display text-xl font-bold">K</span>
          </div>
          <span className="font-display text-lg font-semibold text-ink dark:text-white">learnvocab</span>
        </div>
        <div className="flex items-center gap-3">
          <Link to="/login">
            <Button variant="ghost" size="sm">
              Đăng nhập
            </Button>
          </Link>
          <Link to="/register">
            <Button variant="primary" size="sm">
              Bắt đầu miễn phí
            </Button>
          </Link>
        </div>
      </header>

      {/* HERO */}
      <section className="mx-auto grid max-w-6xl grid-cols-1 items-center gap-12 px-6 pb-20 pt-10 lg:grid-cols-2 lg:pt-16">
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
        >
          <h1 className="font-display text-4xl font-semibold leading-[1.1] text-ink dark:text-white sm:text-5xl lg:text-[3.4rem]">
            Học từ vựng.
            <br />
            Ghi nhớ lâu hơn.
          </h1>
          <p className="mt-5 max-w-md text-lg text-ink-soft dark:text-white/70">
            Học bằng Flashcard, kiểm tra bằng cách điền từ và tự động ôn lại những từ bạn chưa nhớ.
          </p>
          <div className="mt-8 flex flex-col gap-3 sm:flex-row">
            <Link to="/register">
              <Button size="lg" className="w-full sm:w-auto">
                Bắt đầu học <ArrowRight className="h-4 w-4" />
              </Button>
            </Link>
            <Link to="/register">
              <Button variant="secondary" size="lg" className="w-full sm:w-auto">
                Khám phá bộ từ vựng
              </Button>
            </Link>
          </div>
          <div className="mt-10 flex items-center gap-6 text-sm text-ink-soft dark:text-white/60">
            <div>
              <p className="font-display text-2xl font-semibold text-ink dark:text-white">100+</p>
              <p>Từ vựng có sẵn</p>
            </div>
            <div className="h-8 w-px bg-ink/10 dark:bg-white/10" />
            <div>
              <p className="font-display text-2xl font-semibold text-ink dark:text-white">5</p>
              <p>Bộ chủ đề</p>
            </div>
            <div className="h-8 w-px bg-ink/10 dark:bg-white/10" />
            <div>
              <p className="font-display text-2xl font-semibold text-ink dark:text-white">100%</p>
              <p>Miễn phí</p>
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
          <div className="absolute inset-0 translate-x-6 translate-y-10 rotate-6 rounded-[24px] bg-violet-100 shadow-card dark:bg-violet-500/10" />
          <div className="absolute inset-0 -translate-x-4 translate-y-5 -rotate-3 rounded-[24px] bg-coral-100 shadow-card dark:bg-coral-500/10" />
          <motion.div
            className="absolute inset-0 rounded-[24px] bg-white p-8 shadow-lift dark:bg-[#1A1D2E] [transform-style:preserve-3d]"
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
      <section className="mx-auto max-w-6xl px-6 py-16">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, margin: '-80px' }}
          transition={{ duration: 0.5 }}
          className="mx-auto max-w-xl text-center"
        >
          <h2 className="font-display text-3xl font-semibold text-ink dark:text-white">
            Một hệ thống học đầy đủ, không chỉ là thẻ ghi nhớ
          </h2>
          <p className="mt-3 text-ink-soft dark:text-white/60">
            Mỗi bước trong quy trình học được thiết kế để đưa từ vựng vào trí nhớ dài hạn.
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
              className="rounded-[20px] border border-ink/[0.06] bg-white p-6 shadow-card dark:border-white/[0.06] dark:bg-[#1A1D2E]"
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
      <section className="bg-ink py-16 text-white">
        <div className="mx-auto max-w-6xl px-6">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-center font-display text-3xl font-semibold"
          >
            Quy trình học 4 bước
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
      <section className="bg-gradient-to-br from-indigo-50 to-violet-50 py-16 dark:from-indigo-500/5 dark:to-violet-500/5">
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
              className="group rounded-[20px] border border-ink/[0.06] bg-white p-6 shadow-card transition-all hover:shadow-lift dark:border-white/[0.06] dark:bg-[#1A1D2E]"
            >
              <div className="mb-4 flex h-12 w-12 items-center justify-center rounded-xl bg-indigo-100 text-indigo-600 dark:bg-indigo-500/15 dark:text-indigo-400">
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
                  <div className="h-1.5 w-1.5 rounded-full bg-indigo-500" />
                  <span>Unit 1: Life Stories We Admire</span>
                </div>
                <div className="flex items-center gap-2 text-ink-soft/50 dark:text-white/40">
                  <div className="h-1.5 w-1.5 rounded-full bg-ink/30 dark:bg-white/30" />
                  <span>Unit 2-10: Coming soon</span>
                </div>
              </div>
              <Link to="/register">
                <Button variant="secondary" size="sm" className="mt-6 w-full group-hover:bg-indigo-100 dark:group-hover:bg-indigo-500/15">
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
              className="group rounded-[20px] border border-ink/[0.06] bg-white p-6 shadow-card opacity-60 dark:border-white/[0.06] dark:bg-[#1A1D2E]"
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
              className="group rounded-[20px] border border-ink/[0.06] bg-white p-6 shadow-card opacity-60 dark:border-white/[0.06] dark:bg-[#1A1D2E]"
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
