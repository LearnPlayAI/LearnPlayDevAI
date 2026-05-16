# promptly.app

Enterprise AI Prompt Engineering Platform

A complete replatform of PromptForgeV2 (Next.js + Drizzle + Better Auth) into:

- **Frontend:** Angular 18+ (Tailwind CSS only, PWA-ready)
- **Backend:** Spring Boot 3.x (Spring Security + JWT + Flyway)
- **Database:** PostgreSQL 18
- **Deployment:** Docker Compose on Ubuntu 24.04 VPS

## Architecture



## Quick Start (Development)

### Prerequisites

- Java 21+ (for Spring Boot)
- Node.js 20+ (for Angular)
- PostgreSQL 18
- Docker Compose (for deployment)

### 1. Start PostgreSQL

localhost:5432 - accepting connections

### 2. Backend (Spring Boot)



Backend runs on 

### 3. Frontend (Angular)


up to date, audited 885 packages in 8s

213 packages are looking for funding
  run `npm fund` for details

16 vulnerabilities (11 moderate, 5 high)

To address issues that do not require attention, run:
  npm audit fix

To address all issues (including breaking changes), run:
  npm audit fix --force

Run `npm audit` for details.

> promptly@0.1.0 start
> next start

Frontend runs on 

## Project Structure



## Production Deployment

Deploy to  via SSH:



Public URL: https://pf.learnplay.co.za

## Enterprise Features

- Multi-tenant workspace isolation
- Role-based access control (OWNER, ADMIN, MEMBER, VIEWER)
- Audit logging on all data-changing actions
- JWT authentication with HTTP-only cookies
- Rate limiting on auth endpoints
- Spring Boot Actuator health/metrics

## Testing

- WebClaw MCP browser user-journey testing (per .clinerules)
- Spring Boot unit + integration tests
- Angular unit tests
- Flyway migration validation

## Documentation

- [Implementation Plan](IMPLEMENTATION_PLAN.md)
- [Technical Architecture](docs/technical-architecture.md)
- [Implementation Roadmap](docs/implementation-roadmap.md)
- [Next Agent Handoff](docs/next-agent-handoff.md)
