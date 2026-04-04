# Workspace

## Overview

pnpm workspace monorepo using TypeScript. Each package manages its own dependencies.

## Stack

- **Monorepo tool**: pnpm workspaces
- **Node.js version**: 24
- **Package manager**: pnpm
- **TypeScript version**: 5.9
- **API framework**: Express 5
- **Database**: PostgreSQL + Drizzle ORM
- **Validation**: Zod (`zod/v4`), `drizzle-zod`
- **API codegen**: Orval (from OpenAPI spec)
- **Build**: esbuild (CJS bundle)

## Artifacts

### K-RAID (`artifacts/k-raid`)
- **Type**: React + Vite (frontend only, no backend)
- **Preview path**: `/`
- **Description**: Kabaddi player and coach registration website with dark theme
- **Database**: Supabase (external) — table: `k_raid_submissions`
- **Features**:
  - Registration form: name, district, state, designation (player/coach)
  - 5 videos each with 2 questions and large text-area answers
  - Submits all data to Supabase

## Supabase Setup

The K-RAID app uses Supabase. Run this SQL in the Supabase SQL editor to create the required table:

```sql
CREATE TABLE IF NOT EXISTS k_raid_submissions (
  id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  district TEXT NOT NULL,
  state TEXT NOT NULL,
  designation TEXT NOT NULL CHECK (designation IN ('player', 'coach')),
  v1_q1 TEXT,
  v1_q2 TEXT,
  v2_q1 TEXT,
  v2_q2 TEXT,
  v3_q1 TEXT,
  v3_q2 TEXT,
  v4_q1 TEXT,
  v4_q2 TEXT,
  v5_q1 TEXT,
  v5_q2 TEXT,
  submitted_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE k_raid_submissions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public insert" ON k_raid_submissions
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow public select" ON k_raid_submissions
  FOR SELECT USING (true);
```

## Key Commands

- `pnpm run typecheck` — full typecheck across all packages
- `pnpm run build` — typecheck + build all packages
- `pnpm --filter @workspace/api-spec run codegen` — regenerate API hooks and Zod schemas from OpenAPI spec
- `pnpm --filter @workspace/db run push` — push DB schema changes (dev only)
- `pnpm --filter @workspace/api-server run dev` — run API server locally

See the `pnpm-workspace` skill for workspace structure, TypeScript setup, and package details.
