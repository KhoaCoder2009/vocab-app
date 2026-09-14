-- Add english_definition column to vocabularies table
-- Định nghĩa tiếng Anh giúp học từ trong context tiếng Anh

ALTER TABLE public.vocabularies 
ADD COLUMN IF NOT EXISTS english_definition text;

COMMENT ON COLUMN public.vocabularies.english_definition IS 'English definition of the word (for learning in English context)';
