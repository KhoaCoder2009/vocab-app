alter table public.vocabularies
	add column if not exists ielts_band numeric(2,1),
	add column if not exists ielts_topic text,
	add column if not exists cefr_level text,
	add column if not exists ielts_use text,
	add column if not exists ielts_skills text[],
	add column if not exists collocations text[],
	add column if not exists synonyms text[],
	add column if not exists antonyms text[],
	add column if not exists word_family text[],
	add column if not exists usage_notes text;

comment on column public.vocabularies.ielts_band is 'Target IELTS band for curated vocabulary';
comment on column public.vocabularies.ielts_topic is 'Primary IELTS topic';
comment on column public.vocabularies.ielts_skills is 'Recommended IELTS skills';
