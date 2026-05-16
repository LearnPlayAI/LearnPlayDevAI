---
name: saas-platform-planner
description: plan and scaffold robust enterprise saas pwa platforms for vps ubuntu 24.04 docker deployments. use when the user asks an ai coding agent to choose between next.js/react and angular/spring boot, design a pwa saas architecture, scaffold dependencies, create docker compose stacks, plan postgresql persistence, add reliability and observability, define ui design standards, or generate terminal administration scripts for start, stop, restart, logs, backup, restore, and one-command deployment.
---

# SaaS Platform Planner

## Purpose

Use this skill before development begins. Produce a platform plan that a vibe-coding agent can follow without guessing the stack, dependencies, deployment model, or operational scripts.

## Core workflow

1. Capture app requirements using `references/requirements-intake.md`.
2. Select a stack with `references/stack-decision-matrix.md`.
3. Produce a scaffold plan using `references/scaffold-blueprints.md`.
4. Add Docker/VPS deployment requirements using `references/vps-docker-deployment.md`.
5. Add operational scripts and terminal UI requirements using `references/admin-console-spec.md`.
6. Add robustness, backups, observability, and security checks using `references/reliability-security-checklist.md`.
7. Add UI and PWA review criteria using `references/ui-pwa-checklist.md`.

## Default recommendation

For a solo novice vibe coder building enterprise SaaS PWAs, default to one of these two stack lanes unless the requirements clearly say otherwise:

- **lane a: next.js full-stack pwa** for faster SaaS delivery, strong React ecosystem, TypeScript, server components, route handlers, PostgreSQL, Prisma or Drizzle, Docker Compose, Nginx or Caddy, and a Bash/TUI admin console.
- **lane b: angular plus spring boot** for stricter enterprise layering, long-lived backend APIs, JVM maturity, strong dependency injection, Spring Security, Actuator, Flyway/Liquibase, PostgreSQL, Docker Compose, Nginx or Caddy, and a Bash/TUI admin console.

Do not frame React as inherently unable to support serious SaaS. React is a UI library; Next.js is a production framework that can be deployed to Node.js or Docker. Do not frame Angular as automatically higher-load. Load capacity comes mostly from architecture, backend design, database design, caching, infrastructure, and operational practices.

## Required output format

When invoked, produce this structure:

```markdown
# Platform plan for [app name]

## 1. Assumptions and missing decisions
[state assumptions; do not block unless critical]

## 2. Recommended stack lane
[choose lane a or lane b, explain why]

## 3. Architecture
[frontend, backend, database, cache, background jobs, storage, reverse proxy, observability]

## 4. Scaffold commands
[exact commands and files to generate]

## 5. Docker/VPS deployment layout
[repo tree, docker compose files, env files, volumes, networks, ports]

## 6. Admin console
[menu hierarchy and scripts]

## 7. Data safety
[backup, restore, migration, retention, test restore]

## 8. Reliability and security guardrails
[health checks, logs, secrets, TLS, non-root containers, resource limits]

## 9. UI/PWA standards
[design system, accessibility, responsive layout, offline/install behavior]

## 10. Agent instructions
[copy-paste prompt for the coding agent]
```

## Non-negotiables

- Use TypeScript for web code.
- Use PostgreSQL for persistence unless requirements explicitly justify otherwise.
- Use migrations from day one.
- Use Docker Compose for local and single-VPS production orchestration.
- Keep secrets out of source control; generate `.env.example` and require real `.env` on the server.
- Include health checks for app, API, database, and reverse proxy.
- Include backup and restore scripts before production launch.
- Include a terminal admin menu that wraps Docker Compose commands and database backup/restore commands.
- Include a "vibe-agent stop rule": do not let an agent add new frameworks, auth providers, state libraries, ORMs, queues, or UI libraries without first updating the platform decision record.

## Useful bundled script

Use `scripts/create_admin_console_template.sh` when the user wants a starter admin console directory. It writes a safe Bash menu skeleton into a target project folder.
