# VPS Docker Deployment

## Target
Ubuntu Linux 24.04 VPS, Docker Engine, Docker Compose plugin, one app per repository, deployable with one command.

## Recommended production layout on server

```text
/opt/myapp/
  current/                  # checked-out release or app repo
  shared/
    env/.env.prod
    backups/postgres/
    logs/
  releases/                 # optional timestamped releases
```

## Compose services
Minimum services:
- `reverse-proxy`: Caddy or Nginx, public ports 80 and 443.
- `web`: Next.js standalone app OR Angular static app served by proxy.
- `api`: Spring Boot API for split stack; omit for Next.js full-stack unless separately needed.
- `postgres`: PostgreSQL with named volume.
- `backup`: optional scheduled backup container, or host cron running admin script.

Optional services:
- `redis` for cache, queues, rate limits, or sessions.
- `worker` for background jobs.
- `prometheus`, `grafana`, `loki`, or lightweight alternatives when observability is required.

## Compose requirements
- Use named volumes for PostgreSQL data and proxy certificates.
- Use an internal Docker network for app-to-db traffic.
- Publish only reverse proxy ports publicly.
- Add `healthcheck` to app/api/db where possible.
- Use `depends_on` with health conditions for service readiness.
- Add restart policies such as `unless-stopped`.
- Configure log rotation using Docker logging options or host logrotate.
- Keep `.env.prod` out of git; commit `.env.example` only.

## Deployment command contract
The repo must support:

```bash
./scripts/admin/appctl deploy
```

Deploy should:
1. Check Docker and Compose are installed.
2. Check `.env.prod` exists.
3. Pull or build images.
4. Run migrations.
5. Restart services.
6. Wait for health checks.
7. Show status and recent logs.
8. Fail fast and print recovery instructions.

## Migration rule
Never run destructive migrations automatically in production. Require explicit confirmation and backup before destructive migration steps.
