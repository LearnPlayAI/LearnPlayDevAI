# Decision Log — promptly.app

## 2026-05-16: Stack Selection — Angular + Spring Boot
**Decision:** Choose Angular 18+ (Tailwind CSS only) + Spring Boot 3.x over Next.js/React

**Rationale:**
- Stricter enterprise layering (Angular modules, Spring IoC/DI)
- Longer-lived backend APIs (Spring Boot vs Next.js API routes)
- JVM maturity for enterprise workloads
- Spring Security, Actuator, Flyway ecosystem
- Angular standalone components with Tailwind CSS for modern, fluid UI
- Better separation of concerns for team-based development

**Alternatives considered:**
- Next.js 15+ full-stack (chosen prompt was this, but user selected Angular + Spring Boot for enterprise architecture)

## 2026-05-16: UI Framework — Tailwind CSS Only
**Decision:** Use ONLY Tailwind CSS for all styling. No Angular Material, PrimeNG, or other UI component libraries.

**Rationale:**
- Full control over design system
- Smaller bundle sizes
- No hardcoded breakpoints — use clamp(), min(), max(), container queries
- Fluid, modern, animated interactions
- Consistent with enterprise design requirements

## 2026-05-16: Authentication — JWT with HTTP-only Cookies
**Decision:** Replace Better Auth with custom JWT authentication via Spring Security

**Rationale:**
- Better control over token lifecycle
- HTTP-only cookies prevent XSS
- BCrypt password hashing
- Spring Security filter chain
- Refresh token rotation

## 2026-05-16: Database Migrations — Flyway
**Decision:** Replace Drizzle ORM with Flyway for database migrations

**Rationale:**
- Native Spring Boot integration
- SQL-first approach (V1_0_0_01__description.sql)
- Version-controlled migration files
- Automatic migration execution on startup

## 2026-05-16: Production Deployment — Replace-in-Place
**Decision:** Deploy promptly.app to same pahost.learnplay.co.za (192.168.89.77), replacing PromptForgeV2

**Rationale:**
- Caddy reverse proxy already configured (DO NOT MODIFY)
- Caddy forwards pf.learnplay.co.za → pahost:80
- Fresh PostgreSQL database (promptly)
- No downtime pressure (beta status)
- SSH: paadmin@pahost.learnplay.co.za / Liam@2018
