# Technical Context — promptly.app

## Technology Stack

### Frontend
- Angular 18+ (standalone components)
- TypeScript 5.7+
- Tailwind CSS 3.4+ (only UI framework)
- RxJS 7+ (state management)
- Angular Service Worker (PWA)
- Angular Animations (transitions, micro-interactions)

### Backend
- Spring Boot 3.x (Java 21+)
- Spring Security 6.x (JWT, BCrypt)
- Spring Data JPA (PostgreSQL)
- Flyway 10.x (database migrations)
- MapStruct 1.5+ (entity↔DTO mapping)
- Lombok 1.18+ (boilerplate reduction)
- JJWT 0.12+ (JWT handling)
- Spring Boot Actuator 3.x (health, metrics)

### Database
- PostgreSQL 18
- Flyway migrations (SQL-first)
- UUID primary keys
- JSONB for flexible metadata

### Deployment
- Docker Compose (3 services: nginx-web, spring-boot-api, postgres)
- Nginx (Angular static files + API proxy)
- Caddy reverse proxy (on crphost.learnplay.co.za — DO NOT MODIFY)

## Development Environment
- Java 21+
- Node.js 20+
- PostgreSQL 18
- Maven 3.9+
- Docker + Docker Compose

## Runtime Environment
- Ubuntu 24.04 VPS
- pahost.learnplay.co.za (192.168.89.77)
- SSH: paadmin@pahost.learnplay.co.za / Liam@2018
- Caddy: crphost.learnplay.co.za (192.168.89.10) forwards pf.learnplay.co.za → pahost:80

## API Endpoints (Planned)
- POST /api/auth/register
- POST /api/auth/login
- POST /api/auth/logout
- POST /api/auth/change-password
- GET  /api/auth/me
- CRUD /api/prompt-projects
- CRUD /api/prompt-projects/{id}/versions
- POST /api/prompt-projects/{id}/conversation
- CRUD /api/ai-providers
- GET  /api/health
