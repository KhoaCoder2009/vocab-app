import { useCallback, useEffect, useState } from 'react'

export function useTextToSpeech() {
  const [supported, setSupported] = useState(false)
  const [speaking, setSpeaking] = useState(false)

  useEffect(() => {
    setSupported(typeof window !== 'undefined' && 'speechSynthesis' in window)
  }, [])

  const speak = useCallback(
    (text: string, lang: 'en-US' | 'en-GB' = 'en-US') => {
      if (!supported) return
      window.speechSynthesis.cancel()
      const utterance = new SpeechSynthesisUtterance(text)
      utterance.lang = lang
      utterance.rate = 0.9
      const voices = window.speechSynthesis.getVoices()
      const preferred = voices.find((v) => v.lang === lang) || voices.find((v) => v.lang.startsWith('en'))
      if (preferred) utterance.voice = preferred
      utterance.onstart = () => setSpeaking(true)
      utterance.onend = () => setSpeaking(false)
      utterance.onerror = () => setSpeaking(false)
      window.speechSynthesis.speak(utterance)
    },
    [supported]
  )

  return { speak, supported, speaking }
}
