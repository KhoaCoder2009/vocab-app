-- Add category_id field for easier querying and consistency with frontend
-- This allows direct matching with frontend band IDs like 'ielts-band-4-5', 'english-12', etc.

ALTER TABLE public.vocabulary_sets
ADD COLUMN IF NOT EXISTS category_id TEXT;

-- Create index for fast filtering by category_id
CREATE INDEX IF NOT EXISTS idx_vocabulary_sets_category_id ON public.vocabulary_sets(category_id);

-- Update existing records with appropriate category_id based on category field
UPDATE public.vocabulary_sets
SET category_id = CASE
  -- IELTS Bands
  WHEN category = 'IELTS Band 1.0' THEN 'ielts-band-1'
  WHEN category = 'IELTS Band 2.0' THEN 'ielts-band-2'
  WHEN category = 'IELTS Band 3.0' THEN 'ielts-band-3'
  WHEN category = 'IELTS Band 4.0-5.0' THEN 'ielts-band-4-5'
  WHEN category = 'IELTS Band 5.0-6.0' THEN 'ielts-band-5-6'
  WHEN category = 'IELTS Band 6.0-7.0' THEN 'ielts-band-6-7'
  WHEN category = 'IELTS Band 7.0-8.0' THEN 'ielts-band-7-8'
  WHEN category = 'IELTS Band 8.0-9.0' THEN 'ielts-band-8-9'
  WHEN category = 'IELTS Band 9.0' THEN 'ielts-band-9'
  
  -- English Grades
  WHEN category = 'English 10' THEN 'english-10'
  WHEN category = 'English 11' THEN 'english-11'
  WHEN category = 'English 12' THEN 'english-12'
  
  -- Default
  ELSE NULL
END
WHERE category_id IS NULL;
