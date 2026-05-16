# Requirements Intake

Ask for or infer these fields. If information is missing, proceed with safe defaults and list assumptions.

## Product shape
- App name and domain.
- Primary users and roles.
- Core SaaS modules.
- Multi-tenant model: single tenant, team/workspace tenant, enterprise tenant, or unknown.
- Expected first-year scale: users, tenants, records, file volume, background jobs.
- Compliance needs: invoices, audit logs, retention, privacy, regional hosting.

## Technical preferences
- Preferred frontend lane: Next.js/React, Angular, or no preference.
- Backend complexity: simple CRUD, complex workflows, integrations, reporting, background jobs, real-time features.
- Authentication needs: email/password, magic link, OAuth, SSO/SAML, MFA.
- Admin needs: super-admin panel, tenant admin panel, support impersonation, audit logs.
- Deployment: single VPS Ubuntu 24.04, Docker Compose, domain, TLS, backups.

## Default assumptions for novice solo SaaS builders
- Single VPS production target.
- PostgreSQL in Docker volume for early stage, with documented path to managed database later.
- Reverse proxy in Docker using Caddy for automatic TLS, or Nginx if the user prefers manual control.
- Docker Compose with named volumes, internal networks, health checks, and profiles.
- One repository with `apps/web`, `apps/api` if split stack, `infra`, `scripts`, `docs`.
