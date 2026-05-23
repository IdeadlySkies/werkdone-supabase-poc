-- supabase/seed.sql
insert into ai_tasks (title, description, status, environment, assigned_to) values
  ('Test email automation', 'Verify SendGrid integration fires correctly', 'pending', 'local', 'obie@werkdone.com'),
  ('Run LLM pipeline smoke test', 'Check Claude API responses against expected output', 'completed', 'local', 'obie@werkdone.com'),
  ('Validate dev DB migrations', 'Confirm all migrations applied cleanly on dev', 'running', 'development', 'obie@werkdone.com'),
  ('Load test task queue', 'Simulate 100 concurrent AI jobs on dev env', 'pending', 'development', 'obie@werkdone.com');