# Technical Architecture — promptly.app

## System Architecture

```
                    pf.learnplay.co.za
                    (Caddy Reverse Proxy)
                            |
                            v
                pahost.learnplay.co.za:80
                (192.168.89.77 - Docker Compose)
                    +-----------------------+
                    |  Nginx (Angular)      |
                    |  - Static files       |
                    |  - SPA fallback       |
                    |  - /api/ -> :8080     |
                    +-----------------------+
                    |  Spring Boot API      |
                    |  - REST endpoints     |
                    |  - JWT auth           |
                    |  - Flyway migrations  |
                    |  - Actuator health    |
                    +-----------------------+
                    |  PostgreSQL 18        |
                    |  - All persistent data|
                    |  - Fresh database     |
                    +-----------------------+
```

## Module Boundaries

### Frontend (Angular)
- Standalone components (no NgModules)
- Lazy-loaded feature routes
- Injectable services for API calls
- Route guards for auth/tenant access
- HTTP interceptors for JWT/error handling

### Backend (Spring Boot)
- Controllers: REST endpoints only
- Services: Business logic only
- Repositories: Spring Data JPA interfaces
- Entities: JPA annotations, relationships
- DTOs: Separate from entities
- Adapters: AI provider abstraction

### Database
- Flyway migrations: SQL-first
- UUID primary keys
- camelCase column names (matching Drizzle convention)
- JSONB for flexible metadata

## API Contract

All API responses follow this format:
```json
{
  "success": true,
  "data": {...},
  "message": "Optional message",
  "error": "Optional error string"
}
```

Paginated responses:
```json
{
  "success": true,
  "data": [...],
  "pagination": {
    "total": 100,
    "page": 1,
    "pageSize": 20,
    "hasMore": true
  }
}
```
