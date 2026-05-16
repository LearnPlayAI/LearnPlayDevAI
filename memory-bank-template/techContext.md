# Tech Context

## Technical Stack

The workspace template is platform-agnostic. The recommended tech stack is determined per-project by the saas-platform-planner skill using a decision matrix.

## Environment

### Target Platforms
- **Windows + WSL** (primary target for non-technical users)
- **Linux native** (Ubuntu/Debian recommended)
- **macOS** (via Homebrew)

### Required Tools
| Tool | Min Version | Purpose |
|------|-------------|---------|
| git | 2.30+ | Version control |
| node | 18+ | JavaScript runtime, npm |
| python3 | 3.10+ | Scripting, backend |
| jq | 1.6+ | JSON processing |
| docker | 24+ | Containerization (optional for start) |

### IDE Configuration
- **VS Code** — Primary editor
- **Cline extension** — AI coding assistant
- **WebClaw MCP** — Browser automation for UI testing

### AI API
- **Endpoint:** https://ai.learnplay.co.za/v1
- **Key:** Stored in `.env` as `AI_API_KEY`
- **Request:** jan@learnplay.co.za

## Project Structure

```
promptly-app/
├── .clinerules              # Agent behavior rules
├── .env.example             # Environment variables template
├── .gitignore
├── README.md
├── .vscode/                 # Project-level VS Code settings
├── .github/                 # GitHub templates
├── apps/                    # Application code
│   ├── web/                 # Frontend
│   └── api/                 # Backend
├── docs/                    # Documentation
├── infra/                   # Infrastructure (Docker)
├── memory-bank-template/    # Pre-seeded memory bank
├── scripts/                 # Utility scripts
└── skills/                  # Skill modules