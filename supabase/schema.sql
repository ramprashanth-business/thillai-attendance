-- Run in Supabase SQL editor (already applied to project epvyxduwyuptuumfzjjn)
create table public.workers (id uuid primary key default gen_random_uuid(), name text not null unique, wg numeric not null default 0, wm numeric not null default 0, created_at timestamptz not null default now());
create table public.entries (id uuid primary key default gen_random_uuid(), date date not null, t text not null default 'M' check (t in ('G','M')), venue text not null, workers jsonb not null default '[]'::jsonb, created_at timestamptz not null default now());
create index entries_date_idx on public.entries(date);
create table public.notes (id uuid primary key default gen_random_uuid(), date date not null, worker_id uuid not null references public.workers(id) on delete cascade, name text not null, advance numeric not null default 0, note text not null default '', unique (date, worker_id));
alter table public.workers enable row level security;
alter table public.entries enable row level security;
alter table public.notes enable row level security;
create policy staff_all on public.workers for all to authenticated using ((auth.jwt()->'app_metadata'->>'role')='staff') with check ((auth.jwt()->'app_metadata'->>'role')='staff');
create policy staff_all on public.entries for all to authenticated using ((auth.jwt()->'app_metadata'->>'role')='staff') with check ((auth.jwt()->'app_metadata'->>'role')='staff');
create policy staff_all on public.notes for all to authenticated using ((auth.jwt()->'app_metadata'->>'role')='staff') with check ((auth.jwt()->'app_metadata'->>'role')='staff');

-- Approve a user (replace the email) AFTER creating them in Authentication > Users:
-- update auth.users set raw_app_meta_data = raw_app_meta_data || '{"role":"staff"}' where email = 'you@example.com';
