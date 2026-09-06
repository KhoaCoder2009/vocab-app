import { useEffect } from 'react'

type KeyHandler = () => void

/**
 * Đăng ký phím tắt toàn cục. keyMap ánh xạ tên phím (theo event.key hoặc 'Space')
 * tới hàm xử lý. Tự động bỏ qua khi người dùng đang gõ trong input/textarea.
 */
export function useKeyboardShortcut(keyMap: Record<string, KeyHandler>, enabled = true) {
  useEffect(() => {
    if (!enabled) return

    function handler(e: KeyboardEvent) {
      const target = e.target as HTMLElement
      const isTyping = ['INPUT', 'TEXTAREA'].includes(target.tagName)
      const key = e.code === 'Space' ? 'Space' : e.key

      if (isTyping && key !== 'Escape') return

      const fn = keyMap[key]
      if (fn) {
        e.preventDefault()
        fn()
      }
    }

    window.addEventListener('keydown', handler)
    return () => window.removeEventListener('keydown', handler)
  }, [keyMap, enabled])
}
