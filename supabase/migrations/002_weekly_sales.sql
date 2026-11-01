create table if not exists public.weekly_sales (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  recipe_id uuid not null references public.recipes(id) on delete cascade,
  week_start date not null,
  units integer not null default 0 check (units >= 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, recipe_id, week_start)
);
create index if not exists weekly_sales_user_week_idx on public.weekly_sales(user_id, week_start);
alter table public.weekly_sales enable row level security;
drop policy if exists "weekly sales owner" on public.weekly_sales;
create policy "weekly sales owner" on public.weekly_sales
  for all to authenticated
  using (user_id = (select auth.uid()))
  with check (
    user_id = (select auth.uid())
    and exists (
      select 1 from public.recipes r
      where r.id = recipe_id and r.user_id = (select auth.uid())
    )
  );
