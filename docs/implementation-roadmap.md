# Implementation Roadmap — promptly.app

## Phase 1: Workspace Bootstrap and Project Scaffolding ✅
- [x] Create /vscode/promptly-app/ directory
- [x] Create .clinerules
- [x] Create .gitignore
- [x] Create .editorconfig
- [x] Create README.md
- [x] Create .env.example
- [x] Create directory structure (apps/api, apps/web, infra, scripts, memory-bank, docs)
- [x] Create memory-bank/ with all 6 markdown files
- [ ] Copy IMPLEMENTATION_PLAN.md
- [ ] Initialize git repository

## Phase 2: Database Schema Design and Flyway Migrations
- [ ] Design enterprise PostgreSQL schema
- [ ] Write Flyway migrations (V1_0_0_01 through V1_0_0_12)
- [ ] Verify migrations against local PostgreSQL
- **Status:** Not started

## Phase 3: Spring Boot Backend — Core Setup and Security
- [ ] Create pom.xml with all dependencies
- [ ] Create PromptlyApplication.java
- [ ] Create SecurityConfig with JWT
- [ ] Create JwtService
- [ ] Create application.yml
- [ ] Create HealthController
- **Status:** Not started

## Phase 4: Spring Boot Backend — Entity, Repository, DTO Layer
- [ ] Create all JPA entities
- [ ] Create Spring Data JPA repositories
- [ ] Create DTO classes
- [ ] Create MapStruct mappers
- **Status:** Not started

## Phase 5: Spring Boot Backend — Service and Controller Layer
- [ ] Implement AuthService + AuthController
- [ ] Implement PromptProjectService + Controller
- [ ] Implement ConversationService + Controller
- [ ] Implement AiProviderService + Controller
- [ ] Implement TenantService + Controller
- [ ] Implement AuditService + Controller
- **Status:** Not started

## Phase 6: Angular Frontend — Core Setup and Design System
- [ ] Create Angular workspace
- [ ] Configure Tailwind CSS
- [ ] Create shared UI components
- [ ] Create HTTP interceptors
- [ ] Create route guards
- **Status:** Not started

## Phase 7: Angular Frontend — Feature Pages
- [ ] Create SignInComponent
- [ ] Create SignUpComponent
- [ ] Create DashboardComponent
- [ ] Create LibraryComponent
- [ ] Create PromptBuilderComponent
- [ ] Create SettingsComponent
- **Status:** Not started

## Phase 8: PWA Configuration and Deployment Infrastructure
- [ ] Configure Angular Service Worker
- [ ] Create Docker Compose (3 services)
- [ ] Create Nginx config
- [ ] Create Dockerfiles
- [ ] Create deploy script
- **Status:** Not started

## Phase 9: Admin Console and Operational Scripts
- [ ] Create scripts/admin/appctl
- [ ] Create all action scripts
- **Status:** Not started

## Phase 10: Testing, Documentation, and Handoff
- [ ] Run backend tests
- [ ] Run frontend tests
- [ ] WebClaw MCP browser user-journey tests
- [ ] Update documentation
- [ ] Final git commit
- **Status:** Not started
