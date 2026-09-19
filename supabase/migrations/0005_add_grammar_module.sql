-- Grammar lessons and per-user writing progress.
create table if not exists public.grammar_lessons (
  id text primary key,
  name text not null,
  name_vi text not null,
  category text not null check (category in ('Present', 'Past', 'Future')),
  level text not null,
  summary text not null,
  formula jsonb not null,
  uses text[] not null default '{}',
  signals text[] not null default '{}',
  examples jsonb not null default '[]',
  common_mistakes jsonb not null default '[]',
  compare_with text not null,
  vocabulary jsonb not null default '[]',
  is_published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.grammar_writing_exercises (
  id text primary key,
  lesson_id text not null references public.grammar_lessons(id) on delete cascade,
  level smallint not null check (level between 1 and 5),
  topic text not null,
  vietnamese text not null,
  accepted_answers text[] not null,
  explanation text not null,
  sort_order smallint not null default 0,
  unique (lesson_id, sort_order)
);

create table if not exists public.grammar_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  lesson_id text not null references public.grammar_lessons(id) on delete cascade,
  exercise_id text not null references public.grammar_writing_exercises(id) on delete cascade,
  submitted_answer text not null,
  is_correct boolean not null,
  attempted_at timestamptz not null default now()
);

create table if not exists public.grammar_progress (
  user_id uuid not null references auth.users(id) on delete cascade,
  lesson_id text not null references public.grammar_lessons(id) on delete cascade,
  attempts int not null default 0,
  correct_attempts int not null default 0,
  last_attempted_at timestamptz,
  updated_at timestamptz not null default now(),
  primary key (user_id, lesson_id)
);

alter table public.grammar_lessons enable row level security;
alter table public.grammar_writing_exercises enable row level security;
alter table public.grammar_attempts enable row level security;
alter table public.grammar_progress enable row level security;

create policy "published grammar lessons are readable" on public.grammar_lessons
  for select to authenticated using (is_published = true);
create policy "published grammar exercises are readable" on public.grammar_writing_exercises
  for select to authenticated using (exists (
    select 1 from public.grammar_lessons l
    where l.id = lesson_id and l.is_published = true
  ));
create policy "users read own grammar attempts" on public.grammar_attempts
  for select to authenticated using (user_id = auth.uid());
create policy "users read own grammar progress" on public.grammar_progress
  for select to authenticated using (user_id = auth.uid());

create or replace function public.submit_grammar_attempt(
  p_lesson_id text,
  p_exercise_id text,
  p_submitted_answer text
)
returns table (is_correct boolean, correct_answer text, explanation text, attempts int, correct_attempts int)
language plpgsql
security definer
set search_path = public
as $$
declare
  exercise public.grammar_writing_exercises;
  normalized_answer text;
  answer text;
  matched boolean := false;
  next_attempts int;
  next_correct int;
begin
  if auth.uid() is null then
    raise exception 'Not authenticated';
  end if;

  select * into exercise
  from public.grammar_writing_exercises
  where id = p_exercise_id and lesson_id = p_lesson_id;
  if not found then raise exception 'Exercise not found'; end if;

  normalized_answer := lower(trim(regexp_replace(p_submitted_answer, '[.!?]+$', '', 'g')));
  foreach answer in array exercise.accepted_answers loop
    if normalized_answer = lower(trim(regexp_replace(answer, '[.!?]+$', '', 'g'))) then
      matched := true;
      exit;
    end if;
  end loop;

  insert into public.grammar_attempts(user_id, lesson_id, exercise_id, submitted_answer, is_correct)
  values (auth.uid(), p_lesson_id, p_exercise_id, p_submitted_answer, matched);

  insert into public.grammar_progress(user_id, lesson_id, attempts, correct_attempts, last_attempted_at, updated_at)
  values (auth.uid(), p_lesson_id, 1, case when matched then 1 else 0 end, now(), now())
  on conflict (user_id, lesson_id) do update set
    attempts = grammar_progress.attempts + 1,
    correct_attempts = grammar_progress.correct_attempts + case when matched then 1 else 0 end,
    last_attempted_at = now(),
    updated_at = now();

  select gp.attempts, gp.correct_attempts into next_attempts, next_correct
  from public.grammar_progress gp
  where gp.user_id = auth.uid() and gp.lesson_id = p_lesson_id;

  return query select matched, exercise.accepted_answers[1], exercise.explanation, next_attempts, next_correct;
end;
$$;

revoke all on function public.submit_grammar_attempt(text, text, text) from public;
grant execute on function public.submit_grammar_attempt(text, text, text) to authenticated;
