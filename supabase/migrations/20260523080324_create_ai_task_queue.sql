-- AI Task Queue: tracks automation jobs across environments

create table ai_tasks (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  description text,
  status text not null default 'pending'
    check (status in ('pending', 'running', 'completed', 'failed')),
  environment text not null default 'local'
    check (environment in ('local', 'development', 'production')),
  assigned_to text,
  result jsonb,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Auto-update updated_at on row change
create or replace function update_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger ai_tasks_updated_at
  before update on ai_tasks
  for each row execute function update_updated_at();

-- Row Level Security (good habit even in PoC)
alter table ai_tasks enable row level security;

create policy "Allow all for now"
  on ai_tasks for all
  using (true);