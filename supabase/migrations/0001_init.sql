-- =========================================================
-- VOCAB APP — INITIAL SCHEMA
-- Chạy toàn bộ file này trong Supabase SQL Editor (1 lần).
-- =========================================================

create extension if not exists "pgcrypto";

-- =========================================================
-- 1. PROFILES
-- =========================================================
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text,
  avatar_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Tự động tạo profile khi có user mới đăng ký
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.profiles (id, full_name)
  values (new.id, coalesce(new.raw_user_meta_data->>'full_name', split_part(new.email, '@', 1)));
  insert into public.user_streaks (user_id, current_streak, longest_streak)
  values (new.id, 0, 0);
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;

-- =========================================================
-- 2. VOCABULARY SETS
-- =========================================================
create table if not exists public.vocabulary_sets (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid references auth.users(id) on delete set null,
  title text not null,
  description text,
  difficulty text not null default 'medium' check (difficulty in ('easy','medium','hard')),
  is_public boolean not null default true,
  cover_color text default 'teal',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists idx_vocabulary_sets_owner on public.vocabulary_sets(owner_id);
create index if not exists idx_vocabulary_sets_public on public.vocabulary_sets(is_public);

-- =========================================================
-- 3. VOCABULARIES
-- =========================================================
create table if not exists public.vocabularies (
  id uuid primary key default gen_random_uuid(),
  set_id uuid not null references public.vocabulary_sets(id) on delete cascade,
  word text not null,
  meaning text not null,
  example text,
  example_translation text,
  part_of_speech text,
  pronunciation text,
  audio_url text,
  image_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists idx_vocabularies_set on public.vocabularies(set_id);
create index if not exists idx_vocabularies_word on public.vocabularies using gin (to_tsvector('simple', word || ' ' || meaning));

-- =========================================================
-- 4. USER VOCABULARY PROGRESS (spaced repetition state)
-- =========================================================
create table if not exists public.user_vocabulary_progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  vocabulary_id uuid not null references public.vocabularies(id) on delete cascade,
  times_seen int not null default 0,
  times_correct int not null default 0,
  times_wrong int not null default 0,
  mastery_level int not null default 0 check (mastery_level between 0 and 5),
  last_reviewed_at timestamptz,
  next_review_at timestamptz default now(),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, vocabulary_id)
);

create index if not exists idx_progress_user on public.user_vocabulary_progress(user_id);
create index if not exists idx_progress_next_review on public.user_vocabulary_progress(user_id, next_review_at);

-- =========================================================
-- 5. STUDY SESSIONS
-- =========================================================
create table if not exists public.study_sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  set_id uuid not null references public.vocabulary_sets(id) on delete cascade,
  mode text not null default 'practice' check (mode in ('flashcard','practice','review')),
  started_at timestamptz not null default now(),
  completed_at timestamptz,
  total_words int not null default 0,
  correct_answers int not null default 0,
  wrong_answers int not null default 0,
  score int not null default 0,
  accuracy numeric(5,2) not null default 0
);

create index if not exists idx_sessions_user on public.study_sessions(user_id);
create index if not exists idx_sessions_set on public.study_sessions(set_id);

-- =========================================================
-- 6. STUDY ANSWERS
-- =========================================================
create table if not exists public.study_answers (
  id uuid primary key default gen_random_uuid(),
  session_id uuid not null references public.study_sessions(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  vocabulary_id uuid not null references public.vocabularies(id) on delete cascade,
  user_answer text not null default '',
  correct_answer text not null,
  is_correct boolean not null,
  used_hint boolean not null default false,
  answered_at timestamptz not null default now()
);

create index if not exists idx_answers_session on public.study_answers(session_id);
create index if not exists idx_answers_user on public.study_answers(user_id);

-- =========================================================
-- 7. FAVORITES
-- =========================================================
create table if not exists public.favorites (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  vocabulary_id uuid not null references public.vocabularies(id) on delete cascade,
  created_at timestamptz not null default now(),
  unique (user_id, vocabulary_id)
);

create index if not exists idx_favorites_user on public.favorites(user_id);

-- =========================================================
-- 8. USER STREAKS
-- =========================================================
create table if not exists public.user_streaks (
  user_id uuid primary key references auth.users(id) on delete cascade,
  current_streak int not null default 0,
  longest_streak int not null default 0,
  last_study_date date,
  updated_at timestamptz not null default now()
);

-- attach trigger now that user_streaks exists
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- =========================================================
-- updated_at auto-touch trigger (generic)
-- =========================================================
create or replace function public.touch_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_touch_profiles on public.profiles;
create trigger trg_touch_profiles before update on public.profiles
  for each row execute procedure public.touch_updated_at();

drop trigger if exists trg_touch_sets on public.vocabulary_sets;
create trigger trg_touch_sets before update on public.vocabulary_sets
  for each row execute procedure public.touch_updated_at();

drop trigger if exists trg_touch_vocab on public.vocabularies;
create trigger trg_touch_vocab before update on public.vocabularies
  for each row execute procedure public.touch_updated_at();

drop trigger if exists trg_touch_progress on public.user_vocabulary_progress;
create trigger trg_touch_progress before update on public.user_vocabulary_progress
  for each row execute procedure public.touch_updated_at();

-- =========================================================
-- ROW LEVEL SECURITY
-- =========================================================
alter table public.profiles enable row level security;
alter table public.vocabulary_sets enable row level security;
alter table public.vocabularies enable row level security;
alter table public.user_vocabulary_progress enable row level security;
alter table public.study_sessions enable row level security;
alter table public.study_answers enable row level security;
alter table public.favorites enable row level security;
alter table public.user_streaks enable row level security;

-- PROFILES: user chỉ đọc/sửa profile của chính mình. Cho phép đọc công khai tên/avatar (leaderboard sau này) — ở đây giới hạn chỉ chủ sở hữu để an toàn.
create policy "profiles_select_own" on public.profiles for select using (auth.uid() = id);
create policy "profiles_update_own" on public.profiles for update using (auth.uid() = id);
create policy "profiles_insert_own" on public.profiles for insert with check (auth.uid() = id);

-- VOCABULARY SETS: đọc bộ công khai hoặc bộ do chính mình tạo. Chỉ chủ sở hữu được sửa/xoá/tạo.
create policy "sets_select_public_or_own" on public.vocabulary_sets
  for select using (is_public = true or owner_id = auth.uid());
create policy "sets_insert_own" on public.vocabulary_sets
  for insert with check (owner_id = auth.uid());
create policy "sets_update_own" on public.vocabulary_sets
  for update using (owner_id = auth.uid());
create policy "sets_delete_own" on public.vocabulary_sets
  for delete using (owner_id = auth.uid());

-- VOCABULARIES: đọc được nếu set tương ứng công khai hoặc thuộc về mình.
create policy "vocab_select_via_set" on public.vocabularies
  for select using (
    exists (
      select 1 from public.vocabulary_sets s
      where s.id = vocabularies.set_id
      and (s.is_public = true or s.owner_id = auth.uid())
    )
  );
create policy "vocab_insert_via_own_set" on public.vocabularies
  for insert with check (
    exists (select 1 from public.vocabulary_sets s where s.id = set_id and s.owner_id = auth.uid())
  );
create policy "vocab_update_via_own_set" on public.vocabularies
  for update using (
    exists (select 1 from public.vocabulary_sets s where s.id = set_id and s.owner_id = auth.uid())
  );
create policy "vocab_delete_via_own_set" on public.vocabularies
  for delete using (
    exists (select 1 from public.vocabulary_sets s where s.id = set_id and s.owner_id = auth.uid())
  );

-- USER VOCABULARY PROGRESS: chỉ chính chủ
create policy "progress_select_own" on public.user_vocabulary_progress for select using (auth.uid() = user_id);
create policy "progress_insert_own" on public.user_vocabulary_progress for insert with check (auth.uid() = user_id);
create policy "progress_update_own" on public.user_vocabulary_progress for update using (auth.uid() = user_id);

-- STUDY SESSIONS: chỉ chính chủ
create policy "sessions_select_own" on public.study_sessions for select using (auth.uid() = user_id);
create policy "sessions_insert_own" on public.study_sessions for insert with check (auth.uid() = user_id);
create policy "sessions_update_own" on public.study_sessions for update using (auth.uid() = user_id);

-- STUDY ANSWERS: chỉ chính chủ
create policy "answers_select_own" on public.study_answers for select using (auth.uid() = user_id);
create policy "answers_insert_own" on public.study_answers for insert with check (auth.uid() = user_id);

-- FAVORITES: chỉ chính chủ
create policy "favorites_select_own" on public.favorites for select using (auth.uid() = user_id);
create policy "favorites_insert_own" on public.favorites for insert with check (auth.uid() = user_id);
create policy "favorites_delete_own" on public.favorites for delete using (auth.uid() = user_id);

-- USER STREAKS: chỉ chính chủ
create policy "streaks_select_own" on public.user_streaks for select using (auth.uid() = user_id);
create policy "streaks_update_own" on public.user_streaks for update using (auth.uid() = user_id);
create policy "streaks_insert_own" on public.user_streaks for insert with check (auth.uid() = user_id);

-- =========================================================
-- HÀM RPC TIỆN ÍCH
-- =========================================================

-- Lấy hoặc tạo progress row cho 1 từ (idempotent)
create or replace function public.ensure_progress(p_user_id uuid, p_vocabulary_id uuid)
returns public.user_vocabulary_progress
language plpgsql
security definer set search_path = public
as $$
declare
  row_result public.user_vocabulary_progress;
begin
  insert into public.user_vocabulary_progress (user_id, vocabulary_id)
  values (p_user_id, p_vocabulary_id)
  on conflict (user_id, vocabulary_id) do nothing;

  select * into row_result from public.user_vocabulary_progress
  where user_id = p_user_id and vocabulary_id = p_vocabulary_id;

  return row_result;
end;
$$;

-- Đếm số từ cần ôn hôm nay cho 1 user
create or replace function public.count_due_reviews(p_user_id uuid)
returns int
language sql
security definer set search_path = public
as $$
  select count(*)::int from public.user_vocabulary_progress
  where user_id = p_user_id and next_review_at <= now();
$$;

-- Cập nhật streak khi có 1 buổi học hoàn thành hôm nay
create or replace function public.touch_streak(p_user_id uuid)
returns void
language plpgsql
security definer set search_path = public
as $$
declare
  s public.user_streaks;
  today date := current_date;
begin
  select * into s from public.user_streaks where user_id = p_user_id for update;

  if not found then
    insert into public.user_streaks (user_id, current_streak, longest_streak, last_study_date)
    values (p_user_id, 1, 1, today);
    return;
  end if;

  if s.last_study_date = today then
    return; -- đã tính hôm nay rồi
  elsif s.last_study_date = today - interval '1 day' then
    update public.user_streaks
      set current_streak = s.current_streak + 1,
          longest_streak = greatest(s.longest_streak, s.current_streak + 1),
          last_study_date = today,
          updated_at = now()
      where user_id = p_user_id;
  else
    update public.user_streaks
      set current_streak = 1,
          longest_streak = greatest(s.longest_streak, 1),
          last_study_date = today,
          updated_at = now()
      where user_id = p_user_id;
  end if;
end;
$$;

grant execute on function public.ensure_progress(uuid, uuid) to authenticated;
grant execute on function public.count_due_reviews(uuid) to authenticated;
grant execute on function public.touch_streak(uuid) to authenticated;
