# Implementation Plan

[Overview]
Replatform PromptForgeV2 (currently Next.js + Drizzle + Better Auth) into a new enterprise-grade application called "promptly.app" using Angular 18+ (Tailwind CSS only) for the frontend and Spring Boot 3.x (Spring Security + JWT + Flyway) for the backend, deployed via Docker Compose to Ubuntu 24.04 VPS. The new project lives at `/vscode/promptly.app/` and clones all PromptForgeV2 functionality — prompt builder, AI conversation flow, prompt library with versioning, AI provider configuration management, authentication, dashboard, settings — while adding enterprise capabilities: multi-tenant workspaces, role-based access control, audit logging, structured logging, rate limiting, health endpoints, admin console, and automated backup. All UI user journeys will be validated using the WebClaw MCP browser testing workflow defined in the `.clinerules` file, with findings documented in `BROWSER-TEST-RESULTS.md`.

The current PromptForgeV2 codebase at `/vscode/PromptForgeV2` serves as the functional reference. Every feature, data model, API endpoint, and UI flow must be reproduced in the new stack with identical user experience and enhanced enterprise capabilities. The implementation is broken into 10 phases, starting with workspace bootstrap and scaffolding, through database schema redesign, backend API implementation, frontend UI implementation, PWA configuration, Docker deployment, admin console setup, testing, and final handoff documentation.

[Types]
Enterprise type system redesign for Spring Boot backend entities and Angular frontend interfaces.

Spring Boot backend JPA entities:
- `User` — id (UUID), name (String 255), email (String 320, unique), emailVerified (boolean), imageUrl (String 500), createdAt (LocalDateTime), updatedAt (LocalDateTime), roles (Set<Role>), tenant (Tenant)
- `Tenant` — id (UUID), name (String 255), slug (String 100, unique), createdAt (LocalDateTime), updatedAt (LocalDateTime), settings (JSONB)
- `Role` — id (UUID), name (String 50, enum: OWNER, ADMIN, MEMBER, VIEWER), description (String 255), tenant (Tenant), permissions (Set<Permission>)
- `Permission` — id (UUID), name (String 100, enum: PROMPT_CREATE, PROMPT_READ, PROMPT_UPDATE, PROMPT_DELETE, PROVIDER_CREATE, PROVIDER_READ, PROVIDER_UPDATE, PROVIDER_DELETE, CONVERSATION_READ, CONVERSATION_CREATE, AUDIT_READ, USER_MANAGE), description (String 255)
- `TenantMembership` — id (UUID), user (User), tenant (Tenant), role (Role), joinedAt (LocalDateTime)
- `AuditEvent` — id (UUID), tenantId (UUID), userId (UUID), action (String 255), entityType (String 100), entityId (String 255), previousValues (JSONB), currentValue (JSONB), ipAddress (String 45), userAgent (String 500), createdAt (LocalDateTime)
- `PromptProject` — id (UUID), name (String 255), description (String 1000), owner (User), tenant (Tenant), targetService (String 255), desiredOutcome (Text), context (Text), constraints (Text), tone (String 255), outputFormat (String 255), successCriteria (Text), status (Enum: DRAFT, ACTIVE, ARCHIVED), isFavorite (boolean), versionCount (int), createdAt (LocalDateTime), updatedAt (LocalDateTime)
- `PromptVersion` — id (UUID), promptProject (PromptProject with CASCADE), previousVersion (PromptVersion, nullable), promptText (Text), targetService (String 255), desiredOutcome (Text), context (Text), constraints (Text), tone (String 100), outputFormat (String 100), successCriteria (Text), aiExplanation (Text), description (String 500), versionNumber (int), createdAt (LocalDateTime)
- `PromptConversationMessage` — id (UUID), promptProject (PromptProject with CASCADE), role (Enum: USER, ASSISTANT), content (Text), messageOrder (int), feedback (JSONB), createdAt (LocalDateTime)
- `AiProviderConfig` — id (UUID), name (String 255), providerType (String 100), baseUrl (Text), defaultModel (String 255), apiKeyEncrypted (Text), isActive (boolean), owner (User), tenant (Tenant), createdAt (LocalDateTime), updatedAt (LocalDateTime)
- `Session` — id (UUID), token (String 500), userId (User), expiresAt (LocalDateTime), ipAddress (String 45), userAgent (String 500), createdAt (LocalDateTime)

Angular frontend TypeScript interfaces:
- `User` — id, name, email, emailVerified, imageUrl, createdAt, roles: Role[], tenant: Tenant | null
- `Tenant` — id, name, slug, createdAt, settings: Record<string, any>
- `Role` — id, name, description, permissions: Permission[]
- `Permission` — id, name, description
- `TenantMembership` — id, user: User, role: Role, joinedAt
- `AuditEvent` — id, tenantId, userId, action, entityType, entityId, previousValues, currentValue, ipAddress, userAgent, createdAt
- `PromptProject` — id, name, description, targetService, desiredOutcome, context, constraints, tone, outputFormat, successCriteria, status, isFavorite, versionCount, createdAt, updatedAt
- `PromptVersion` — id, projectId, previousVersionId, promptText, targetService, desiredOutcome, context, constraints, tone, outputFormat, successCriteria, aiExplanation, description, versionNumber, createdAt
- `PromptConversationMessage` — id, projectId, role, content, messageOrder, feedback, createdAt
- `AiProviderConfig` — id, name, providerType, baseUrl, defaultModel, isActive, createdAt, updatedAt
- `ApiResponse<T>` — success (boolean), data?: T, error?: string, message?: string
- `PaginatedResponse<T>` — data: T[], total: number, page: number, pageSize: number, hasMore: boolean

[Files]
Complete project structure for the new `/vscode/promptly.app/` workspace.

New files to be created:

**Workspace root:**
- `.clinerules` — Adapted from PromptForgeV2 for Angular + Spring Boot stack, retaining WebClaw browser testing mandates, Plan/Act mode boundaries, terminal discipline, memory bank update requirements, and enterprise non-negotiables
- `.clineignore` — Standard ignore patterns for Angular + Spring Boot workspace
- `.gitignore` — Standard for Angular + Spring Boot (node_modules, target/, .gradle/, .idea/, *.class, *.jar, *.war, .env, .env.local, .env.production, .DS_Store, etc.)
- `.prettierignore` / `.editorconfig` — Standard formatting configs
- `README.md` — Project overview, setup instructions, architecture diagram
- `.env.example` — Template for all environment variables across services
- `IMPLEMENTATION_PLAN.md` — This document

**Backend — Spring Boot (`apps/api/`):**
- `apps/api/pom.xml` — Maven project with Spring Boot 3.x dependencies: spring-boot-starter-web, spring-boot-starter-security, spring-boot-starter-data-jpa, spring-boot-starter-validation, spring-boot-starter-actuator, spring-boot-starter-oauth2-client (optional), jackson-datatype-hibernate5-jsr310, flyway-core, pg-jdbc, jjwt-api/jjwt-impl/jjwt-gson, lombok, mapstruct, spring-boot-starter-test
- `apps/api/src/main/java/com/promptly/app/` — Root package
- `apps/api/src/main/java/com/promptly/app/PromptlyApplication.java` — Spring Boot main class
- `apps/api/src/main/java/com/promptly/app/config/` — SecurityConfig, JpaConfig, FlywayConfig, ActuatorConfig, WebConfig, RateLimitConfig
- `apps/api/src/main/java/com/promptly/app/security/` — JwtAuthenticationFilter, JwtService, PasswordEncoderConfig, SessionCookieGenerator
- `apps/api/src/main/java/com/promptly/app/entity/` — All JPA entity classes (User, Tenant, Role, Permission, TenantMembership, AuditEvent, PromptProject, PromptVersion, PromptConversationMessage, AiProviderConfig, Session)
- `apps/api/src/main/java/com/promptly/app/dto/` — Request/Response DTOs for all endpoints (LoginRequest, RegisterRequest, PromptProjectRequest, PromptProjectResponse, PromptVersionRequest, PromptVersionResponse, ConversationMessageRequest, ConversationMessageResponse, AiProviderConfigRequest, AiProviderConfigResponse, TenantRequest, TenantResponse, RoleRequest, RoleResponse)
- `apps/api/src/main/java/com/promptly/app/repository/` — Spring Data JPA repositories for all entities
- `apps/api/src/main/java/com/promptly/app/service/` — UserDetailsService, AuthService, PromptProjectService, PromptVersionService, ConversationService, AiProviderService, TenantService, AuditService
- `apps/api/src/main/java/com/promptly/app/controller/` — REST controllers: AuthController, PromptProjectController, PromptVersionController, ConversationController, AiProviderConfigController, TenantController, AuditController, HealthController
- `apps/api/src/main/java/com/promptly/app/adapter/` — AI provider adapter interface and OpenAI-compatible adapter implementation
- `apps/api/src/main/java/com/promptly/app/exception/` — GlobalExceptionHandler, BusinessException, NotFoundException, UnauthorizedException, BadRequestException
- `apps/api/src/main/java/com/promptly/app/audit/` — @Auditable annotation, AuditEventAspect (AOP)
- `apps/api/src/main/java/com/promptly/app/ratelimit/` — RateLimitAspect
- `apps/api/src/main/resources/application.yml` — Multi-profile config (dev, prod)
- `apps/api/src/main/resources/db/migration/` — Flyway migrations V1_0_0_01 through V1_0_0_09+
- `apps/api/src/test/java/com/promptly/app/` — Unit and integration tests for all services, controllers, security

**Frontend — Angular (`apps/web/`):**
- `apps/web/angular.json` — Angular workspace config with standalone components
- `apps/web/package.json` — Dependencies: angular, typescript, tailwindcss, @tailwindcss/forms, @tailwindcss/typography, @tailwindcss/container-queries, @angular/animations, @angular/service-worker, jest, cypress (optional), nx (workspace)
- `apps/web/tsconfig.json` / `apps/web/tsconfig.app.json` / `apps/web/tsconfig.spec.json`
- `apps/web/tailwind.config.js` — Custom design tokens, animation plugin, container extensions, responsive utilities
- `apps/web/postcss.config.js`
- `apps/web/src/` — Angular app source
- `apps/web/src/main.ts` — App bootstrap
- `apps/web/src/app/` — Angular standalone components
- `apps/web/src/app/routes/` — Route configuration with lazy loading, guards, resolvers
- `apps/web/src/app/components/` — Shared UI components (buttons, inputs, cards, accordions, badges, avatars, navigation)
- `apps/web/src/app/features/` — Feature modules: auth (sign-in, sign-up, change-password), dashboard (favorites, recent activity, archive), prompt-builder (intake form, conversation flow), library (listing, filtering, pagination), settings (AI provider config management, account settings), admin (audit log, tenant management)
- `apps/web/src/app/services/` — Angular Injectable services: AuthService, PromptProjectService, ConversationService, AiProviderService, TenantService, AuditService, NotificationService, ApiService
- `apps/web/src/app/models/` — TypeScript interfaces matching the enterprise type system above
- `apps/web/src/app/guards/` — AuthGuard, RoleGuard, TenantGuard, UnsavedChangesGuard
- `apps/web/src/app/interceptors/` — JwtInterceptor, ErrorInterceptor, RequestIdInterceptor
- `apps/web/src/app/animations/` — Angular animation definitions (fadeIn, slideIn, staggerList, scaleIn, expandAccordion)
- `apps/web/src/app/theme/` — Tailwind CSS customizations, utility classes, animation keyframes
- `apps/web/src/assets/` — Static assets (manifest.json, favicon, robots.txt)
- `apps/web/src/environments/` — environment.ts, environment.prod.ts
- `apps/web/ngsw-config.json` — Angular service worker config
- `apps/web/public/` — PWA manifest, favicon, robots.txt
- `apps/web/cypress/` or `apps/web/src/test.ts` — E2E tests

**Infrastructure (`infra/`):**
- `infra/compose/docker-compose.yml` — Docker Compose with 3 services: promptly-web (Angular served by Nginx), promptly-api (Spring Boot JAR), promptly-db (PostgreSQL 18), optionally promptly-redis (Redis cache)
- `infra/compose/nginx/nginx.conf` — Nginx config for Angular SPA fallback to index.html, API proxy to Spring Boot, health check endpoints
- `infra/compose/nginx/Dockerfile` — Nginx image with config copy
- `infra/compose/prometheus/prometheus.yml` — Optional Prometheus scrape config
- `infra/compose/grafana/dashboards/` — Optional Grafana dashboard JSON files
- `infra/compose/caddy/Caddyfile` — Caddy reverse proxy config with TLS

**Infrastructure Scripts (`scripts/`):**
- `scripts/admin/appctl` — Main CLI entrypoint per `.skills` admin console spec
- `scripts/admin/menu.sh` — Interactive menu
- `scripts/admin/lib/common.sh` — Shared helpers
- `scripts/admin/actions/status.sh`, `start.sh`, `stop.sh`, `restart.sh`, `logs.sh`, `deploy.sh`, `backup-db.sh`, `restore-db.sh`, `migrate.sh`, `health.sh`

**Memory Bank (`memory-bank/`):**
- `memory-bank/activeContext.md` — Current development state, what's being worked on
- `memory-bank/decisionLog.md` — Architecture and technology decisions with rationale
- `memory-bank/productContext.md` — Product vision, user journeys, enterprise positioning
- `memory-bank/progress.md` — Milestone tracking, session logs, test results
- `memory-bank/systemPatterns.md` — System architecture, boundaries, patterns
- `memory-bank/techContext.md` — Technical stack details, environment config, database schema

**Documentation (`docs/`):**
- `docs/technical-architecture.md` — Full architecture diagram, module boundaries, API contracts
- `docs/implementation-roadmap.md` — Phase-by-phase breakdown with status tracking
- `docs/next-agent-handoff.md` — State for resuming work from any phase
- `docs/deployment/` — Deployment guides, runbooks, environment variable docs
- `docs/BROWSER-TEST-RESULTS.md` — Browser testing findings per .clinerules format

[Functions]
Spring Boot backend service functions and Angular frontend service methods.

Spring Boot backend — key service functions:
- `AuthService.registerUser(RegisterRequest)` → JWT token pair — Creates user, assigns default tenant/role, creates session
- `AuthService.login(LoginRequest)` → JWT token pair — Validates credentials, creates session, returns tokens in HTTP-only cookies
- `AuthService.logout(String token)` → void — Invalidates session, revokes token
- `AuthService.changePassword(ChangePasswordRequest)` → void — Validates old password, encrypts and stores new password
- `PromptProjectService.createProject(UUID tenantId, PromptProjectRequest)` → PromptProjectResponse — Validates inputs, creates project with version 1
- `PromptProjectService.getProject(UUID tenantId, UUID projectId)` → PromptProjectResponse — Returns project with version count and favorite status
- `PromptProjectService.listProjects(UUID tenantId, PageRequest)` → PaginatedResponse<PromptProjectResponse> — Supports filtering by status, favorite, targetService, pagination
- `PromptProjectService.updateProject(UUID tenantId, UUID projectId, PromptProjectRequest)` → PromptProjectResponse — Updates fields, audits change
- `PromptProjectService.deleteProject(UUID tenantId, UUID projectId)` → void — Soft delete or hard delete, cascades to versions and messages
- `PromptProjectService.toggleFavorite(UUID tenantId, UUID projectId)` → PromptProjectResponse — Toggles isFavorite flag
- `PromptProjectService.archiveProject(UUID tenantId, UUID projectId)` → PromptProjectResponse — Sets status to ARCHIVED
- `PromptVersionService.createVersion(UUID tenantId, UUID projectId, PromptVersionRequest)` → PromptVersionResponse — Creates version, increments versionNumber
- `PromptVersionService.getVersions(UUID tenantId, UUID projectId)` → List<PromptVersionResponse> — Returns all versions ordered by versionNumber
- `PromptVersionService.getVersion(UUID tenantId, UUID projectId, UUID versionId)` → PromptVersionResponse
- `PromptVersionService.copyVersion(UUID tenantId, UUID projectId, UUID versionId)` → String — Copies promptText to clipboard-equivalent API response
- `ConversationService.startConversation(UUID tenantId, UUID projectId)` → ConversationContext
- `ConversationService.sendMessage(UUID tenantId, UUID projectId, ConversationMessageRequest)` → ConversationResponse — Calls AI provider adapter, stores user message + assistant message, handles streaming fallback
- `ConversationService.getEndConversation(UUID tenantId, UUID projectId)` → ConversationResponse — Finalizes conversation
- `AiProviderService.createConfig(UUID tenantId, AiProviderConfigRequest)` → AiProviderConfigResponse — Validates base URL, stores encrypted API key
- `AiProviderService.getConfigs(UUID tenantId)` → List<AiProviderConfigResponse> — Returns all configs for tenant
- `AiProviderService.testConnection(UUID tenantId, UUID configId)` → ConnectionTestResponse — Pings AI provider endpoint, returns model list
- `TenantService.createTenant(UUID userId, TenantRequest)` → TenantResponse — Creates new workspace
- `TenantService.getTenants(UUID userId)` → List<TenantResponse> — Returns all tenants user belongs to
- `TenantService.addMember(UUID tenantId, TenantMembershipRequest)` → TenantMembershipResponse
- `TenantService.removeMember(UUID tenantId, UUID memberId)` → void
- `AuditService.getAuditEvents(UUID tenantId, AuditQuery)` → PaginatedResponse<AuditEventResponse> — Returns audit trail

Angular frontend — key service methods:
- `AuthService.signup(email, password, name)` → Observable<User> — Calls POST /api/auth/signup
- `AuthService.signin(email, password)` → Observable<User> — Calls POST /api/auth/signin, stores JWT in interceptor
- `AuthService.signout()` → Observable<void> — Calls POST /api/auth/signout, clears token
- `AuthService.currentUser()` → Observable<User | null> — Returns authenticated user with roles and tenant
- `AuthService.changePassword(oldPassword, newPassword)` → Observable<void>
- `PromptProjectService.create(name, description, targetService, ...)` → Observable<PromptProject>
- `PromptProjectService.list(filters, page, pageSize)` → Observable<PaginatedResponse<PromptProject>>
- `PromptProjectService.getById(id)` → Observable<PromptProject>
- `PromptProjectService.update(id, updates)` → Observable<PromptProject>
- `PromptProjectService.delete(id)` → Observable<void>
- `PromptProjectService.toggleFavorite(id)` → Observable<PromptProject>
- `PromptVersionService.create(projectId, versionData)` → Observable<PromptVersion>
- `PromptVersionService.list(projectId)` → Observable<PromptVersion[]>
- `ConversationService.sendMessage(projectId, message, role)` → Observable<ConversationMessage>
- `ConversationService.getMessages(projectId)` → Observable<ConversationMessage[]>
- `AiProviderService.createConfig(configData)` → Observable<AiProviderConfig>
- `AiProviderService.testConfig(id)` → Observable<ConnectionTestResult>
- `TenantService.list()` → Observable<Tenant[]>
- `TenantService.switchTenant(tenantId)` → Observable<Tenant>

[Classes]
Spring Boot backend classes and Angular frontend component classes.

Spring Boot backend classes:
- `PromptlyApplication` — `@SpringBootApplication`, `@EnableTransactionManagement`, `@EnableJpaAuditing`
- `SecurityConfig` — `@Configuration`, extends `WebSecurityConfigurerAdapter` (or uses `SecurityFilterChain` beans), configures JWT filter, CORS, CSRF, session management
- `JwtService` — `@Service`, generates JWT tokens, validates tokens, extracts claims, sets expiration
- `JwtAuthenticationFilter` — `OncePerRequestFilter`, extracts JWT from Authorization header or cookie, sets Authentication in SecurityContext
- `PasswordConfig` — `@Bean PasswordEncoder` (BCryptPasswordEncoder)
- `AuditEventAspect` — `@Aspect`, `@Around("@annotation(Auditable)")`, captures entity changes before/after for audit trail
- `RateLimitAspect` — `@Aspect`, `@Around`, enforces per-IP rate limits using Redis or in-memory counter
- `GlobalExceptionHandler` — `@RestControllerAdvice`, handles all exceptions, returns consistent error JSON
- `AiProviderAdapter` — interface with `CompletionResponse generate(ProviderRequest)`, `List<Model> listModels()`, `boolean testConnection()`
- `OpenAiCompatibleAdapter` — implements `AiProviderAdapter`, uses `WebClient` to call OpenAI-compatible endpoints
- `HealthController` — `@RestController`, exposes `/actuator/health` and `/api/health` endpoints

Angular frontend classes:
- `AppConfigService` — `@Injectable`, provides app-wide configuration (API base URL, feature flags)
- `ApiService` — `@Injectable`, base HTTP client with retry logic, error handling, request ID generation
- `AuthGuard` — `CanActivateFn`, checks authentication status from localStorage/interceptor
- `RoleGuard` — `CanActivateFn`, checks user has required role/permission
- `TenantGuard` — `CanActivateFn`, checks user belongs to target tenant
- `JwtInterceptor` — `HttpInterceptor`, attaches JWT to every outgoing request, handles 401/403 responses
- `ErrorInterceptor` — `HttpInterceptor`, catches server errors, shows notification toasts
- `NotificationService` — `@Injectable`, manages toast/notification state with Observable pattern
- `ThemeService` — `@Injectable`, manages dark/light theme, provides CSS variable updates
- `SignInComponent` — `standalone component`, reactive form with email/password, Tailwind styled inputs, loading states, error messages, animated transitions
- `SignUpComponent` — `standalone component`, reactive form with name/email/password/confirm password, animated strength meter, validation messages
- `DashboardComponent` — `standalone component`, grid layout with favorites section, recent activity accordion, archive accordion, animated list entries
- `PromptBuilderComponent` — `standalone component`, multi-step intake flow with progress indicator, conversation area with message bubbles, AI streaming indicator, inline save prompt accordion
- `LibraryComponent` — `standalone component`, paginated project grid, filter bar, sort controls, favorite star toggle, archive buttons, animated skeleton loaders
- `SettingsComponent` — `standalone component`, AI provider config tabs, account settings, change password form, animated accordions
- `AuditLogComponent` — `standalone component`, paginated audit event table, date range filter, action type filter, IP address display
- `TenantSwitcherComponent` — `standalone component`, dropdown/panel for switching between tenants
- `AnimatedCardComponent` — `standalone component`, card wrapper with hover animations, entrance animations, glassmorphism effects

[Dependencies]
New package dependencies for the Angular + Spring Boot stack.

Spring Boot backend Maven dependencies (pom.xml):
- `org.springframework.boot:spring-boot-starter-web:3.x` — REST API framework
- `org.springframework.boot:spring-boot-starter-security:3.x` — Authentication and authorization
- `org.springframework.boot:spring-boot-starter-data-jpa:3.x` — ORM and repository layer
- `org.springframework.boot:spring-boot-starter-validation:3.x` — Bean validation
- `org.springframework.boot:spring-boot-starter-actuator:3.x` — Health, metrics, readiness probes
- `org.springframework.boot:spring-boot-starter-oauth2-client:3.x` — Optional OAuth providers
- `org.flywaydb:flyway-core:10.x` — Database migrations
- `org.postgresql:postgresql:42.x` — PostgreSQL JDBC driver
- `org.postgresql:pgjdbc:42.x` — PG extension
- `io.jsonwebtoken:jjwt-api:0.12.x`, `jjwt-impl:0.12.x`, `jjwt-gson:0.12.x` — JWT handling
- `org.projectlombok:lombok:1.18.x` — Boilerplate reduction
- `org.mapstruct:mapstruct:1.5.x` — DTO mapping
- `com.fasterxml.jackson.core:jackson-datatype-jsr310:2.17.x` — Java 8 date/time support
- `org.springframework.boot:spring-boot-starter-test:3.x` — Testing
- `org.springframework.security:spring-security-test:6.x` — Security testing
- `org.springframework.boot:spring-boot-starter-data-redis:3.x` — Redis (optional, for rate limiting and caching)

Angular frontend npm dependencies:
- `@angular/core:18.x`, `@angular/platform-browser:18.x`, `@angular/platform-browser-dynamic:18.x`
- `@angular/router:18.x`, `@angular/forms:18.x`, `@angular/animations:18.x`
- `@angular/service-worker:18.x` — PWA support
- `@angular/common/http` — HTTP client
- `typescript:5.7.x` — TypeScript compiler
- `tailwindcss:3.4.x` — Utility-first CSS
- `@tailwindcss/forms:0.5.x` — Form element styling
- `@tailwindcss/typography:0.5.x` — Typography utilities
- `@tailwindcss/container-queries:0.1.x` — Container query utilities
- `postcss:8.4.x` — CSS processing
- `autoprefixer:10.4.x` — CSS vendor prefixes
- `jest:29.x` or `@angular-builders/jest` — Unit testing
- `@angular-builders/jest` or `karma` — Angular test runner
- `cypress:13.x` or `playwright:1.49.x` — E2E testing (WebClaw MCP for browser user-journey testing)

Infrastructure:
- `postgres:18-alpine` — PostgreSQL 18 Docker image
- `nginx:alpine` — Nginx reverse proxy for Angular static files
- `caddy:2.x-alpine` — Caddy reverse proxy with automatic TLS
- `redis:7-alpine` — Redis cache (optional)

[Testing]
Multi-layered testing strategy combining unit tests, integration tests, E2E tests, and WebClaw MCP browser user-journey validation.

Unit tests:
- Spring Boot: `@ExtendWith(MockitoExtension.class)` for all services, `@SpringBootTest` for controllers with `MockMvc`
- Angular: Jasmine/Karma or Jest for component tests, service tests, interceptor tests, guard tests
- Coverage target: 80%+ for backend services, 75%+ for frontend services

Integration tests:
- Spring Boot: `@DataJpaTest` for repository tests with testcontainers (PostgreSQL), `@WebMvcTest` for controller integration with real security filter chain
- Database: Flyway migration validation — each migration file tested against real PostgreSQL via testcontainers
- AI provider adapter: Mocked HTTP responses for connection testing

WebClaw MCP browser user-journey tests (MANDATORY per .clinerules):
- All user journeys tested exclusively through WebClaw MCP server at localhost:9222
- No use of built-in browser_action tool
- Test sequence for each journey:
  1. Launch browser at `http://localhost:4200` (Angular dev server)
  2. Navigate to each page: landing, signin, signup, dashboard, prompt-builder, library, settings, audit-log
  3. For each interaction: use `page_snapshot` → `click`/`type_text` → `screenshot` → `evaluate` for console log checking
  4. After each action, check console logs: `(() => { const logs = window.__appLogs || []; return logs; })()` or inspect `console.error`, `console.warn`
  5. Wait 5+ seconds after AI provider actions before checking results
  6. Document ALL findings in `BROWSER-TEST-RESULTS.md` with table: test, description, steps, findings, what works, what did not work, technical components involved
- Required user journeys to test:
  1. Landing → Sign Up → Email Verification → Sign In → Dashboard (default tenant)
  2. Create Prompt Project → Fill Intake Form → Save → View in Library
  3. Prompt Builder Conversation: send message → receive AI response → save prompt → rate prompt → view version history
  4. Library: filter by status → toggle favorite → archive → restore → search
  5. Prompt Detail: continue conversation → save version → copy prompt → view versions
  6. Settings: configure AI provider → test connection → update account → change password
  7. Tenant Switcher: switch between workspaces → verify data isolation
  8. Audit Log: view events → filter by action type → verify audit entries for own actions
  9. Sign Out → Sign In as different user → verify tenant isolation
  10. Responsive layout test: resize viewport, test on mobile/tablet breakpoints

[Implementation Order]
The implementation must follow this exact sequence to minimize conflicts, ensure dependencies are ready before dependent work begins, and allow incremental verification at each phase.

Phase 1: Workspace Bootstrap and Project Scaffolding
1.1. Create `/vscode/promptly.app/` directory structure
1.2. Copy and adapt `.clinerules` and `.clineignore` from PromptForgeV2 for Angular + Spring Boot
1.3. Create `.gitignore`, `.prettierignore`, `.editorconfig`
1.4. Create `README.md` with project overview and setup instructions
1.5. Create `memory-bank/` with all 6 markdown files (activeContext, decisionLog, productContext, progress, systemPatterns, techContext)
1.6. Initialize `docs/` directory with initial documentation structure
1.7. Initialize git repository
1.8. Create `.env.example` with all required environment variables

Phase 2: Database Schema Design and Flyway Migrations
2.1. Design enterprise PostgreSQL schema with tenants, roles, permissions, audit events
2.2. Write Flyway migration files:
  - V1_0_0_01__create_tenants_table.sql
  - V1_0_0_02__create_roles_and_permissions_table.sql
  - V1_0_0_03__create_tenant_memberships_table.sql
  - V1_0_0_04__create_users_table.sql
  - V1_0_0_05__create_prompt_projects_table.sql
  - V1_0_0_06__create_prompt_versions_table.sql
  - V1_0_0_07__create_prompt_conversation_messages_table.sql
  - V1_0_0_08__create_ai_provider_configs_table.sql
  - V1_0_0_09__create_audit_events_table.sql
  - V1_0_0_10__create_sessions_table.sql
  - V1_0_0_11__create_indexes_and_constraints.sql
2.3. Create seed data migration (V1_0_0_12__seed_roles.sql)
2.4. Verify migrations against local PostgreSQL

Phase 3: Spring Boot Backend — Core Setup and Security
3.1. Create `apps/api/` with pom.xml
3.2. Create `PromptlyApplication.java` main class
3.3. Create `SecurityConfig` with JWT filter chain
3.4. Create `JwtService` for token generation/validation
3.5. Create `PasswordConfig` with BCryptPasswordEncoder
3.6. Create `JwtAuthenticationFilter` for cookie/header JWT extraction
3.7. Create `SessionCookieGenerator` for HTTP-only cookie management
3.8. Create `application.yml` with dev and prod profiles
3.9. Create `HealthController` for `/api/health` endpoint
3.10. Create `GlobalExceptionHandler`
3.11. Configure Spring Boot Actuator endpoints
3.12. Verify backend starts, migrations run, health endpoint responds

Phase 4: Spring Boot Backend — Entity, Repository, and DTO Layer
4.1. Create all JPA entity classes with relationships
4.2. Create all Spring Data JPA repository interfaces
4.3. Create all DTO classes (request and response)
4.4. Create MapStruct mappers for entity↔DTO conversion
4.5. Create `@Auditable` annotation and `AuditEventAspect`
4.6. Run `mvn compile` to verify no compilation errors

Phase 5: Spring Boot Backend — Service and Controller Layer
5.1. Implement `AuthService` and `AuthController` (register, login, logout, change password)
5.2. Implement `PromptProjectService` and `PromptProjectController` (CRUD, favorite, archive, list with pagination)
5.3. Implement `PromptVersionService` and `PromptVersionController` (create versions, list, copy)
5.4. Implement `ConversationService` and `ConversationController` (send message, get messages, end conversation)
5.5. Implement `AiProviderService` and `AiProviderConfigController` (create configs, test connection)
5.6. Implement `TenantService` and `TenantController` (create, list, add/remove members)
5.7. Implement `AuditService` and `AuditController` (query audit events)
5.8. Implement `AiProviderAdapter` interface and `OpenAiCompatibleAdapter`
5.9. Implement `RateLimitAspect`
5.10. Write unit tests for all services
5.11. Write integration tests for all controllers
5.12. Verify all API endpoints with curl/MockMvc

Phase 6: Angular Frontend — Core Setup and Design System
6.1. Create `apps/web/` with Angular CLI (`ng new`)
6.2. Configure Tailwind CSS v3 with `@tailwindcss/forms`, `@tailwindcss/typography`, `@tailwindcss/container-queries`
6.3. Create `tailwind.config.js` with custom design tokens (colors, spacing, typography, animations)
6.4. Create shared UI component library:
  - Button, Input, Textarea, Select, Card, Badge, Avatar, Loader/Spinner
  - Accordion (inline, no modal)
  - Toast/Notification component
  - Pagination component
  - Skeleton loader component
6.5. Create Angular animation definitions: fadeIn, slideIn, staggerList, scaleIn, expandAccordion
6.6. Configure Angular routing with lazy-loaded feature routes
6.7. Create `ApiService` with base HTTP client
6.8. Create `JwtInterceptor` for token injection
6.9. Create `ErrorInterceptor` for error handling
6.10. Create `AuthService` with Observable pattern
6.11. Create TypeScript model interfaces
6.12. Verify `ng serve` starts, Tailwind styles compile

Phase 7: Angular Frontend — Feature Pages
7.1. `SignInComponent` — email/password form, loading states, error messages, animated transitions
7.2. `SignUpComponent` — name/email/password/confirm password form, animated strength meter
7.3. `DashboardComponent` — favorites grid, recent activity accordion, archive accordion, bottom nav
7.4. `LibraryComponent` — paginated project grid, filter bar, favorite toggle, archive buttons, skeleton loaders
7.5. `PromptBuilderComponent` — multi-step intake form, conversation area with message bubbles, AI streaming indicator, inline save prompt accordion, star rating display
7.6. `PromptDetailComponent` — project detail page, continue conversation, saved prompts, version history, copy buttons
7.7. `SettingsComponent` — AI provider config tabs, account settings, change password form
7.8. `TenantSwitcherComponent` — dropdown/panel for workspace switching
7.9. `AuditLogComponent` — paginated audit event table with filters
7.10. Auth guards (`AuthGuard`, `RoleGuard`, `TenantGuard`)
7.11. Verify all pages render correctly with `ng serve`

Phase 8: PWA Configuration and Deployment Infrastructure
8.1. Configure Angular Service Worker (`ng add @angular/service-worker`)
8.2. Create `ngsw-config.json` with explicit caching strategy
8.3. Create `public/manifest.json` with app metadata, icons, theme color
8.4. Create `infra/compose/docker-compose.yml` with 3 services (web, api, db)
8.5. Create Nginx config for Angular SPA fallback and API proxy
8.6. Create Dockerfile for Spring Boot (multi-stage, Maven build)
8.7. Create Dockerfile for Nginx (Angular static files)
8.8. Create Caddy reverse proxy config for TLS
8.9. Create `.env.production.example`
8.10. Create `scripts/deploy-production.sh`
8.11. Create `infra/compose/prometheus/prometheus.yml` (optional)
8.12. Verify Docker Compose brings up all services

Phase 9: Admin Console and Operational Scripts
9.1. Create `scripts/admin/appctl` main CLI entrypoint
9.2. Create `scripts/admin/menu.sh` interactive menu
9.3. Create `scripts/admin/lib/common.sh` shared helpers
9.4. Create all action scripts: status, start, stop, restart, logs, deploy, backup-db, restore-db, migrate, health
9.5. Implement safety rules: set -Eeuo pipefail, typed confirmation for dangerous actions, pre-backup before restore/deploy
9.6. Test all admin console commands

Phase 10: Testing, Documentation, and Handoff
10.1. Run all backend unit and integration tests (`mvn test`)
10.2. Run all frontend unit tests (`ng test --watch=false`)
10.3. Execute WebClaw MCP browser user-journey tests (all 10 journeys defined above)
10.4. Document all test findings in `BROWSER-TEST-RESULTS.md`
10.5. Update `memory-bank/activeContext.md` with final state
10.6. Update `memory-bank/progress.md` with all sessions
10.7. Update `docs/next-agent-handoff.md` with complete handoff state
10.8. Update `docs/implementation-roadmap.md` marking all phases complete
10.9. Create `docs/BROWSER-TEST-RESULTS.md` with full WebClaw testing report
10.10. Final git commit and tag