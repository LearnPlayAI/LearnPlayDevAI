# Next Agent Handoff — promptly.app

## Current State
Phase 1: Workspace Bootstrap — Nearly Complete

## What Has Been Completed
1. All planning and analysis done
2. Implementation plan created at /vscode/PromptForgeV2/implementation_plan.md
3. New workspace created at /vscode/promptly-app/ with:
   - .clinerules (adapted for Angular + Spring Boot)
   - .gitignore
   - .editorconfig
   - README.md
   - .env.example
   - Directory structure
   - memory-bank/ (6 files)
   - docs/ (technical-architecture, implementation-roadmap, next-agent-handoff)

## What Needs to Be Done Next
1. Copy IMPLEMENTATION_PLAN.md to /vscode/promptly-app/
2. Initialize git repository
3. Create infra/ files (Docker Compose, Nginx config)
4. Create scripts/ admin console template
5. Begin Phase 2: Database Schema Design

## Key Decisions
- Stack: Angular 18+ (Tailwind CSS) + Spring Boot 3.x + PostgreSQL 18
- Auth: JWT with HTTP-only cookies (Spring Security)
- Migrations: Flyway (SQL-first)
- Deployment: Docker Compose → pahost.learnplay.co.za
- Production URL: https://pf.learnplay.co.za (Caddy already configured)
- Fresh database: promptly
- SSH: paadmin@pahost.learnplay.co.za / Liam@2018

## Important Files
- /vscode/promptly-app/.clinerules — Rules and constraints
- /vscode/promptly-app/IMPLEMENTATION_PLAN.md — Full plan (to be copied)
- /vscode/promptly-app/README.md — Project overview
- /vscode/promptly-app/.env.example — Environment variables

## Stop-and-Ask Conditions
- Before modifying Caddy configuration
- Before adding new frameworks beyond Angular + Spring Boot
- Before changing production deployment target
