# Scaffold Blueprints

## Lane A: Next.js full-stack PWA

Suggested repo structure:

```text
repo/
  apps/web/
  infra/compose/
  scripts/admin/
  docs/decisions/
  docs/runbooks/
```

Starter commands:

```bash
npx create-next-app@latest apps/web --ts --eslint --app --src-dir --tailwind --use-npm
cd apps/web
npm install zod @prisma/client
npm install -D prisma vitest playwright eslint-config-next
npx prisma init
```

Minimum files to require:
- `apps/web/next.config.ts` with standalone output for Docker.
- `apps/web/src/app/manifest.ts` or `public/manifest.json`.
- `apps/web/src/app/offline/page.tsx` if offline fallback is required.
- `apps/web/prisma/schema.prisma` with initial tenant/user/audit models.
- `apps/web/src/lib/env.ts` validating environment variables.
- `apps/web/src/lib/db.ts` with a single database client pattern.
- `apps/web/src/lib/auth/` for auth boundary.

## Lane B: Angular plus Spring Boot

Suggested repo structure:

```text
repo/
  apps/web/
  apps/api/
  infra/compose/
  scripts/admin/
  docs/decisions/
  docs/runbooks/
```

Starter commands:

```bash
npm create @angular@latest apps/web
# use Spring Initializr or curl to create apps/api with web, security, validation, data-jpa, actuator, postgresql, flyway
```

Minimum files to require:
- Angular PWA enabled with service worker config.
- Angular environment files with API base URL injection at runtime or build time.
- Spring Boot `application.yml` with profiles for local and prod.
- Flyway/Liquibase migration folder from the first commit.
- Actuator health endpoint enabled for container health checks.
- OpenAPI spec generation or typed client generation.

## Database baseline
Initial SaaS tables normally include:
- tenants/workspaces
- users
- memberships
- roles/permissions
- audit_events
- app_settings
- files or attachments metadata if needed
- billing_customer or subscription metadata if needed

## Vibe-agent stop rule
Before adding any new dependency, the agent must answer:
1. What problem does this solve?
2. Is this already solved by the selected stack?
3. What operational burden does it add?
4. Is it approved in the decision record?
