# Product Context — promptly.app

## Product Vision
An enterprise-grade AI prompt engineering platform that helps users craft, refine, version, and export prompts for any AI service. It transforms prompt development from ad-hoc experimentation into a structured, collaborative, and version-controlled workflow.

## Target Audience
- Corporate teams using AI for content generation, code assistance, data analysis
- Enterprise IT departments managing AI provider configurations
- Prompt engineers who need structured prompt lifecycle management
- Teams who need audit trails for AI-driven decisions

## Key Features
1. **Prompt Builder** — Multi-step intake form with AI conversation flow
2. **Prompt Library** — Paginated, filterable, searchable project listing
3. **Version Management** — Save multiple versions with comparison
4. **AI Provider Configuration** — Encrypted storage of provider credentials
5. **Authentication** — Secure login/signup with JWT
6. **Dashboard** — Favorites, recent activity, archive
7. **Enterprise Features** — Multi-tenant, RBAC, audit logging

## User Journeys
1. Sign up → Create tenant → Create prompt project → Build with AI → Save → Share
2. Browse library → Filter → Open project → Continue AI conversation → Save version
3. Configure AI provider → Test connection → Use in prompt builder
4. View audit log → Filter by action → Review changes

## Non-Goals
- Building a chatbot (this is a prompt engineering tool)
- Hardcoding AI service integrations (users define targets)
- Using modals/dialogs unless explicitly requested
