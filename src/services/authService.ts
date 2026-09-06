import { supabase } from '@/lib/supabase'

export interface AuthResult {
  success: boolean
  message?: string
}

function friendlyAuthError(message: string): string {
  const map: Record<string, string> = {
    'Invalid login credentials': 'Email hoặc mật khẩu không chính xác.',
    'User already registered': 'Email này đã được đăng ký. Hãy đăng nhập thay vào đó.',
    'Email not confirmed': 'Vui lòng xác nhận email trước khi đăng nhập.',
    'Password should be at least 6 characters': 'Mật khẩu cần có ít nhất 6 ký tự.',
  }
  for (const key of Object.keys(map)) {
    if (message.includes(key)) return map[key]
  }
  return 'Đã có lỗi xảy ra. Vui lòng thử lại sau.'
}

export const authService = {
  async signUp(email: string, password: string, fullName: string): Promise<AuthResult> {
    try {
      const { error } = await supabase.auth.signUp({
        email,
        password,
        options: { data: { full_name: fullName } },
      })
      if (error) return { success: false, message: friendlyAuthError(error.message) }
      return { success: true }
    } catch {
      return { success: false, message: 'Không thể kết nối máy chủ. Kiểm tra lại kết nối mạng.' }
    }
  },

  async signIn(email: string, password: string): Promise<AuthResult> {
    try {
      const { error } = await supabase.auth.signInWithPassword({ email, password })
      if (error) return { success: false, message: friendlyAuthError(error.message) }
      return { success: true }
    } catch {
      return { success: false, message: 'Không thể kết nối máy chủ. Kiểm tra lại kết nối mạng.' }
    }
  },

  async signOut(): Promise<void> {
    await supabase.auth.signOut()
  },

  async resetPassword(email: string): Promise<AuthResult> {
    try {
      const { error } = await supabase.auth.resetPasswordForEmail(email, {
        redirectTo: `${window.location.origin}/login`,
      })
      if (error) return { success: false, message: friendlyAuthError(error.message) }
      return { success: true, message: 'Đã gửi email đặt lại mật khẩu. Vui lòng kiểm tra hộp thư.' }
    } catch {
      return { success: false, message: 'Không thể kết nối máy chủ. Kiểm tra lại kết nối mạng.' }
    }
  },

  async getSession() {
    const { data } = await supabase.auth.getSession()
    return data.session
  },
}
