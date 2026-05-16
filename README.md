# LearnPlayDevAI — Starter Workspace for AI-Powered App Development

> **No coding experience needed.** Pull this workspace, install VS Code + Cline, and start building your app with AI guidance.

---

## Quick Start

### 1. Install VS Code

Download from: https://code.visualstudio.com/

### 2. Install the Cline Extension

In VS Code, open Extensions (`Ctrl+Shift+X`), search "Cline", and install it.

### 3. Request a Free API Key

Email **jan@learnplay.co.za** with subject "AI API Key Request" and include:
- Your name
- Your email

### 4. Set Up Your Environment

Follow the complete setup guide: [docs/USER-SETUP-GUIDE.md](docs/USER-SETUP-GUIDE.md)

This covers:
- Installing Git
- Setting up your project folder
- Installing required tools (Node.js, Python, etc.)
- Configuring your API key
- Setting up WebClaw MCP for browser automation

### 5. Start Building!

Open VS Code, open the Cline chat, and tell the AI agent what app you want to build:

> "I want to create an app that helps people track their daily habits"

---

## What's in This Workspace?

```
├── .clinerules              # AI agent behavior rules
├── .clineignore             # Files Cline should ignore
├── scripts/                 # Setup and verification scripts
│   ├── detect-environment.sh  # Detects your OS and tools
│   ├── verify-setup.sh       # Checks if everything is ready
│   ├── setup-git.sh          # Interactive Git config
│   └── setup-ide.sh          # Installs VS Code extensions
├── skills/                  # AI agent skill modules
│   ├── saas-platform-planner/   # Tech stack selection
│   ├── environment-setup/       # OS/tool setup guidance
│   ├── account-setup/           # GitHub/API key guidance
│   └── vscode-setup/            # VS Code/Cline/MCP setup
├── docs/                    # Documentation
│   ├── USER-SETUP-GUIDE.md   # Complete setup walkthrough
│   ├── FIRST-SESSION-GUIDE.md # What happens when you start Cline
│   ├── TROUBLESHOOTING.md    # Common issues and fixes
│   ├── webclaw-mcp-setup.md  # Browser automation setup
│   └── github-ssh-setup.md   # GitHub connection guide
├── memory-bank-template/    # Pre-seeded memory bank
├── .vscode/                 # VS Code project settings
└── .github/                 # GitHub templates
```

---

## Supported Platforms

| Platform | Status | Notes |
|----------|--------|-------|
| Windows + WSL | ✅ Primary | Recommended for Windows users |
| Linux native | ✅ Fully supported | Ubuntu/Debian recommended |
| macOS | ✅ Fully supported | Via Homebrew |

---

## What You'll Need

| Tool | Purpose | Required |
|------|---------|----------|
| VS Code | Code editor | Yes |
| Cline extension | AI coding assistant | Yes |
| Git | Version control | Yes |
| Node.js | JavaScript runtime | Yes |
| Python 3 | Scripting | Yes |
| API Key | Connect to AI | Yes |
| GitHub account | Code hosting | Yes |
| Docker | Containerization | Optional for now |

---

## The User Journey

1. **Visit this GitHub page** — You're here!
2. **Install VS Code + Cline** — Takes 5 minutes
3. **Request API key** — Free from jan@learnplay.co.za
4. **Set up your environment** — Follow the setup guide
5. **Pull this workspace** — Clone to your machine
6. **Tell Cline your app idea** — "I want to create..."
7. **Let Cline guide you** — Step by step, from there!

---

## FAQ

### Is this really free?
Yes! The API key is free for starter workspace users.

### Do I need coding experience?
No! The AI agent explains everything and guides you step by step.

### What if I get stuck?
Check [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) or ask Cline!

### Can I use this for any type of app?
Yes! The AI agent helps you choose the right tech stack for your specific app idea.

---

## License

This is an educational starter workspace. Feel free to fork and customize.

## Support

- **API Key Issues:** jan@learnplay.co.za
- **Setup Issues:** Ask Cline or check docs/TROUBLESHOOTING.md