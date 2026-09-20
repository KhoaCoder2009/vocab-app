-- Add category and topic fields to vocabulary_sets for better organization
-- Category: IELTS Band, English Grade Level, etc.
-- Topic: Theme/Subject within each category

ALTER TABLE public.vocabulary_sets
ADD COLUMN IF NOT EXISTS category TEXT,
ADD COLUMN IF NOT EXISTS topic TEXT;

-- Create indexes for filtering
CREATE INDEX IF NOT EXISTS idx_vocabulary_sets_category ON public.vocabulary_sets(category);
CREATE INDEX IF NOT EXISTS idx_vocabulary_sets_topic ON public.vocabulary_sets(topic);
CREATE INDEX IF NOT EXISTS idx_vocabulary_sets_category_topic ON public.vocabulary_sets(category, topic);

-- Update existing sets with default values
UPDATE public.vocabulary_sets
SET category = 'General',
    topic = 'Mixed'
WHERE category IS NULL OR topic IS NULL;
