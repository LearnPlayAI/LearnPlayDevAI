# System Patterns — promptly.app

## Architecture Overview
Mono-repo style structure with separate frontend and backend applications under apps/.

## Design Patterns

### Backend (Spring Boot)
- **Layered Architecture:** Controller → Service → Repository → Entity
- **DTO Pattern:** Separate request/response DTOs from entities
- **Adapter Pattern:** AI provider adapter interface (OpenAI-compatible, Anthropic, etc.)
- **Strategy Pattern:** Different AI provider implementations
- **AOP:** Audit logging via @Auditable annotation + AuditEventAspect
- **Interceptors:** JWT authentication, error handling, request ID injection

### Frontend (Angular)
- **Standalone Components:** No NgModule — use standalone components
- **Service Pattern:** Injectable services for all API calls
- **Guard Pattern:** AuthGuard, RoleGuard, TenantGuard for route protection
- **Interceptor Pattern:** JwtInterceptor, ErrorInterceptor for HTTP cross-cutting concerns
- **Observable Pattern:** All data flows through RxJS Observables
- **Tailwind CSS:** Utility-first styling with custom design tokens

### Database
- **Flyway Migrations:** SQL-first, version-controlled
- **JPA/Hibernate:** ORM for entity management
- **UUID Primary Keys:** All tables use UUID for distributed ID generation

## Key Technical Decisions
- PostgreSQL as source of truth
- Flyway for migrations (not Drizzle)
- JWT for auth (not Better Auth)
- Tailwind CSS only (no Angular Material/PrimeNG)
- Spring Security filter chain
- HTTP-only cookies for JWT
- BCrypt for password hashing
