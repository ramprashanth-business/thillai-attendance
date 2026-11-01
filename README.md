# Attendance & Salary

Mobile-first attendance and salary app (godown / mandapam rates, morning + night shifts, notes & advance).
Single `index.html` + Supabase (project `epvyxduwyuptuumfzjjn`).

## Deploy (GitHub Pages)
1. Create a GitHub repo, upload `index.html`, `README.md`, `supabase/`.
2. Repo Settings > Pages > Deploy from branch `main` / root.
3. Open `https://<username>.github.io/<repo>/` on iPhone > Share > Add to Home Screen.

## First login
1. Supabase dashboard > Authentication > Users > Add user (email + password, tick Auto Confirm).
2. SQL editor: `update auth.users set raw_app_meta_data = raw_app_meta_data || '{"role":"staff"}' where email = 'your@email.com';`
3. Authentication > Sign In / Providers: turn OFF "Allow new users to sign up".
4. Sign in on the site.

Only users with role `staff` can read or write data (row level security). The publishable key in `index.html` is safe to be public.
