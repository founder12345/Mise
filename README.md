# Mise Menu Lab

Vite + React + Supabase menu-costing app. Start with `npm install`, copy `.env.example` to `.env.local`, set the Supabase URL and publishable/anon key, run `supabase/migrations/001_initial.sql` in Supabase SQL Editor, then `npm run dev`.

Never put a Supabase service-role key in browser environment variables. Configure Supabase Auth email confirmation and production redirect URLs. Before launch, test RLS using two accounts, backups, account deletion/export, and deployment environment settings. This repository is a production-oriented starter, not a certification of production readiness.
