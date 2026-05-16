# Reliability and Security Checklist

## Robustness baseline
- Use database migrations from day one.
- Add seed data only for local/dev unless explicitly safe for production.
- Add health endpoints and Docker health checks.
- Add request validation at every boundary.
- Add structured logging; include request IDs.
- Add error boundaries in the UI.
- Add audit logs for important admin and data-changing actions.
- Add automated tests for auth, permissions, tenant isolation, and critical CRUD flows.
- Add end-to-end smoke test after deployment.

## PostgreSQL safety
- Use a named Docker volume or external managed database.
- Backup using `pg_dump` custom or plain compressed format.
- Test restore regularly into a temporary database/container.
- Keep at least daily backups for early production; adjust retention by business risk.
- Do not store backups only on the same VPS long term; copy to external object storage when production data matters.

## Secrets
- Commit `.env.example`, never `.env` or `.env.prod`.
- Use long random secrets for session/auth/JWT/encryption keys.
- Rotate secrets after accidental exposure.
- Prefer Docker Compose secrets for sensitive files where practical.

## Container hardening
- Prefer small official base images.
- Use multi-stage builds.
- Run app containers as non-root where possible.
- Avoid mounting the Docker socket into app containers.
- Publish only ports that must be public.
- Set memory/CPU limits where supported and useful.

## App security
- Enforce HTTPS at the reverse proxy.
- Set secure cookies in production.
- Add CSRF protection where cookie auth and unsafe methods apply.
- Add rate limits for auth and public forms.
- Add security headers at proxy or app layer.
- Validate tenant access on the server, not only in UI.
- Protect admin routes with explicit role checks.

## Observability
- Minimum: `docker compose ps`, health checks, structured logs, disk usage, backup status.
- Better: metrics endpoint, uptime monitor, error reporting, log aggregation.
- Spring Boot lane: expose Actuator health and metrics safely.
- Next.js lane: add instrumentation and request logging middleware where suitable.
