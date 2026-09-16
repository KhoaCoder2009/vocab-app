-- Public leaderboard aggregates completed study sessions without exposing raw session rows.
create or replace function public.get_leaderboard(p_limit integer default 20)
returns table (
  position bigint,
  user_id uuid,
  display_name text,
  avatar_url text,
  points bigint,
  sessions bigint,
  words bigint,
  accuracy numeric
)
language sql
stable
security definer
set search_path = public
as $$
  with totals as (
    select
      s.user_id,
      coalesce(nullif(trim(p.full_name), ''), 'Người học') as display_name,
      p.avatar_url,
      sum(s.score)::bigint as points,
      count(*)::bigint as sessions,
      sum(s.total_words)::bigint as words,
      round(
        sum(s.correct_answers)::numeric / nullif(sum(s.total_words), 0) * 100,
        2
      ) as accuracy
    from public.study_sessions s
    join public.profiles p on p.id = s.user_id
    where s.completed_at is not null
    group by s.user_id, p.full_name, p.avatar_url
  )
  select
    dense_rank() over (order by points desc, words desc, accuracy desc) as position,
    user_id,
    display_name,
    avatar_url,
    points,
    sessions,
    words,
    accuracy
  from totals
  order by points desc, words desc, accuracy desc
  limit least(greatest(coalesce(p_limit, 20), 1), 100);
$$;

revoke all on function public.get_leaderboard(integer) from public;
grant execute on function public.get_leaderboard(integer) to authenticated;