import { Suspense, lazy } from 'react'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { AuthProvider } from '@/hooks/useAuth'
import { ThemeProvider } from '@/hooks/useTheme'
import { ToastProvider } from '@/hooks/useToast'
import { ProtectedRoute } from '@/components/ProtectedRoute'
import { PageLoading } from '@/components/ui/Spinner'

import { AppLayout } from '@/layouts/AppLayout'
import { AuthLayout } from '@/layouts/AuthLayout'
import { FocusLayout } from '@/layouts/FocusLayout'

import { LandingPage } from '@/pages/LandingPage'

const LoginPage = lazy(() => import('@/pages/LoginPage').then((m) => ({ default: m.LoginPage })))
const RegisterPage = lazy(() => import('@/pages/RegisterPage').then((m) => ({ default: m.RegisterPage })))
const ForgotPasswordPage = lazy(() =>
  import('@/pages/ForgotPasswordPage').then((m) => ({ default: m.ForgotPasswordPage }))
)
const DashboardPage = lazy(() => import('@/pages/DashboardPage').then((m) => ({ default: m.DashboardPage })))
const SetsPage = lazy(() => import('@/pages/SetsPage').then((m) => ({ default: m.SetsPage })))
const SetDetailPage = lazy(() => import('@/pages/SetDetailPage').then((m) => ({ default: m.SetDetailPage })))
const CreateSetPage = lazy(() => import('@/pages/CreateSetPage').then((m) => ({ default: m.CreateSetPage })))
const LearnPage = lazy(() => import('@/pages/LearnPage').then((m) => ({ default: m.LearnPage })))
const PracticePage = lazy(() => import('@/pages/PracticePage').then((m) => ({ default: m.PracticePage })))
const ResultPage = lazy(() => import('@/pages/ResultPage').then((m) => ({ default: m.ResultPage })))
const ReviewPage = lazy(() => import('@/pages/ReviewPage').then((m) => ({ default: m.ReviewPage })))
const FavoritesPage = lazy(() => import('@/pages/FavoritesPage').then((m) => ({ default: m.FavoritesPage })))
const StatisticsPage = lazy(() => import('@/pages/StatisticsPage').then((m) => ({ default: m.StatisticsPage })))
const ProfilePage = lazy(() => import('@/pages/ProfilePage').then((m) => ({ default: m.ProfilePage })))
const NotFoundPage = lazy(() => import('@/pages/NotFoundPage').then((m) => ({ default: m.NotFoundPage })))

export default function App() {
  return (
    <ThemeProvider>
      <ToastProvider>
        <AuthProvider>
          <BrowserRouter>
            <Suspense fallback={<PageLoading />}>
              <Routes>
                <Route path="/" element={<LandingPage />} />

                <Route element={<AuthLayout />}>
                  <Route path="/login" element={<LoginPage />} />
                  <Route path="/register" element={<RegisterPage />} />
                  <Route path="/forgot-password" element={<ForgotPasswordPage />} />
                </Route>

                <Route
                  element={
                    <ProtectedRoute>
                      <AppLayout />
                    </ProtectedRoute>
                  }
                >
                  <Route path="/dashboard" element={<DashboardPage />} />
                  <Route path="/sets" element={<SetsPage />} />
                  <Route path="/sets/create" element={<CreateSetPage />} />
                  <Route path="/sets/:id" element={<SetDetailPage />} />
                  <Route path="/review" element={<ReviewPage />} />
                  <Route path="/favorites" element={<FavoritesPage />} />
                  <Route path="/statistics" element={<StatisticsPage />} />
                  <Route path="/profile" element={<ProfilePage />} />
                </Route>

                <Route
                  element={
                    <ProtectedRoute>
                      <FocusLayout />
                    </ProtectedRoute>
                  }
                >
                  <Route path="/learn/:setId" element={<LearnPage />} />
                  <Route path="/practice/:sessionId" element={<PracticePage />} />
                  <Route path="/result/:sessionId" element={<ResultPage />} />
                </Route>

                <Route path="*" element={<NotFoundPage />} />
              </Routes>
            </Suspense>
          </BrowserRouter>
        </AuthProvider>
      </ToastProvider>
    </ThemeProvider>
  )
}
