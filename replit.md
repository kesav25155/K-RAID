# Workspace

## Overview

pnpm workspace monorepo using TypeScript. Each package manages its own dependencies.

## Stack

- **Monorepo tool**: pnpm workspaces
- **Node.js version**: 24
- **Package manager**: pnpm
- **TypeScript version**: 5.9
- **API framework**: Express 5
- **Database**: Supabase (external)

## Artifacts

### K-RAID (`artifacts/k-raid`)
- **Type**: React + Vite (frontend only, no backend)
- **Preview path**: `/`
- **Description**: Kabaddi player and coach registration website with dark theme + admin panel
- **Database**: Supabase — 4 tables: videos, questions, submissions, responses
- **Admin path**: `/admin` — password: `kraid@2025`

## Supabase Setup

Run this SQL in the Supabase SQL Editor to create all required tables:

```sql
-- Videos table
CREATE TABLE IF NOT EXISTS videos (
  id BIGSERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  url TEXT NOT NULL,
  "order" INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Questions table (linked to videos)
CREATE TABLE IF NOT EXISTS questions (
  id BIGSERIAL PRIMARY KEY,
  video_id BIGINT REFERENCES videos(id) ON DELETE CASCADE,
  question_text TEXT NOT NULL,
  "order" INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Submissions table (user details)
CREATE TABLE IF NOT EXISTS submissions (
  id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  district TEXT NOT NULL,
  state TEXT NOT NULL,
  designation TEXT NOT NULL CHECK (designation IN ('player', 'coach')),
  submitted_at TIMESTAMPTZ DEFAULT NOW()
);

-- Responses table (answers linked to submission + question)
CREATE TABLE IF NOT EXISTS responses (
  id BIGSERIAL PRIMARY KEY,
  submission_id BIGINT REFERENCES submissions(id) ON DELETE CASCADE,
  question_id BIGINT REFERENCES questions(id) ON DELETE CASCADE,
  answer_text TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE videos ENABLE ROW LEVEL SECURITY;
ALTER TABLE questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE responses ENABLE ROW LEVEL SECURITY;

-- Public read for videos and questions
CREATE POLICY "Public read videos" ON videos FOR SELECT USING (true);
CREATE POLICY "Public read questions" ON questions FOR SELECT USING (true);

-- Public insert for submissions and responses
CREATE POLICY "Public insert submissions" ON submissions FOR INSERT WITH CHECK (true);
CREATE POLICY "Public read submissions" ON submissions FOR SELECT USING (true);
CREATE POLICY "Public insert responses" ON responses FOR INSERT WITH CHECK (true);
CREATE POLICY "Public read responses" ON responses FOR SELECT USING (true);

-- Admin insert for videos and questions (public for now)
CREATE POLICY "Public insert videos" ON videos FOR INSERT WITH CHECK (true);
CREATE POLICY "Public delete videos" ON videos FOR DELETE USING (true);
CREATE POLICY "Public insert questions" ON questions FOR INSERT WITH CHECK (true);
CREATE POLICY "Public delete questions" ON questions FOR DELETE USING (true);
```

## Supabase Storage Setup

Videos are stored in Supabase Storage (not as base64 in the DB). Run this SQL in Supabase SQL Editor:

```sql
-- Add storage_path column to videos table (if upgrading from base64 approach)
ALTER TABLE videos ADD COLUMN IF NOT EXISTS storage_path TEXT;

-- Create public videos storage bucket
INSERT INTO storage.buckets (id, name, public) VALUES ('videos', 'videos', true)
ON CONFLICT (id) DO UPDATE SET public = true;

-- Allow public uploads and reads on the videos bucket
CREATE POLICY IF NOT EXISTS "Public video uploads" ON storage.objects
  FOR INSERT WITH CHECK (bucket_id = 'videos');

CREATE POLICY IF NOT EXISTS "Public video reads" ON storage.objects
  FOR SELECT USING (bucket_id = 'videos');

CREATE POLICY IF NOT EXISTS "Public video deletes" ON storage.objects
  FOR DELETE USING (bucket_id = 'videos');
```

## Key Commands

- `pnpm run typecheck` — full typecheck across all packages
- `pnpm run build` — typecheck + build all packages
