# Stack Decision Matrix

## Correct the misconception first
React alone is a UI library. Next.js is a React framework that supports production deployment, server rendering, route handlers, server components, and Docker/Node self-hosting. Angular is a full frontend framework with batteries included. Spring Boot is a backend framework. Angular does not replace backend capacity; backend load handling comes from API design, database design, caching, queues, resource limits, and infrastructure.

## Choose Next.js full-stack when
- The app is CRUD-heavy, dashboard-heavy, form-heavy, or content/workflow-heavy.
- The user wants the fastest path from idea to SaaS MVP.
- One TypeScript codebase is valuable.
- The backend can start with route handlers/server actions and later split into services if needed.
- The team prefers React ecosystem and component libraries.

Recommended components:
- Next.js App Router, TypeScript, strict mode.
- PostgreSQL with Prisma or Drizzle.
- Zod for validation.
- Auth.js, Lucia-style custom auth, or a managed auth provider depending on requirements.
- TanStack Query only when client-side server-state complexity justifies it.
- Tailwind CSS plus shadcn/ui or a commercial design system.
- Playwright for end-to-end tests; Vitest for unit tests.

## Choose Angular plus Spring Boot when
- The backend domain is expected to become complex and long-lived.
- There are many integrations, background jobs, permissions, reporting, and audit requirements.
- Strong layering, dependency injection, typed API contracts, and explicit backend architecture are more valuable than speed.
- Enterprise customers may expect JVM ecosystem maturity.
- The frontend and backend should be independently deployable.

Recommended components:
- Angular, TypeScript, Angular service worker for PWA, Angular SSR if public pages or initial render speed matters.
- Spring Boot, Spring Web, Spring Security, Spring Data JPA or jOOQ, Bean Validation.
- Flyway or Liquibase for migrations.
- Spring Boot Actuator and Micrometer for health and metrics.
- PostgreSQL.
- OpenAPI generation for typed client contracts.

## Avoid premature complexity
Do not add Kubernetes, microservices, Kafka, event sourcing, CQRS, or multi-database setups unless the app has a clear requirement. A well-structured Docker Compose monolith or modular monolith is often more robust for a solo developer than a distributed system.

## Decision record template
- Date:
- Selected lane:
- Why this lane fits the app:
- Alternatives rejected:
- Libraries approved:
- Libraries intentionally not approved:
- Conditions that would trigger reassessment:
