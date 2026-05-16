# System Patterns

## Architecture

The workspace template follows a modular skill-based architecture:

```
promptly-app/
├── .clinerules           # Master agent behavior
├── skills/               # Reusable skill modules
│   ├── saas-platform-planner/   # Tech stack selection
│   ├── environment-setup/         # OS/tool detection & setup
│   ├── account-setup/             # GitHub/API key setup
│   └── vscode-setup/              # VS Code/Cline/MCP setup
├── scripts/              # Utility scripts
├── docs/                 # User documentation
├── memory-bank-template/ # Pre-seeded memory bank files
├── .vscode/              # Project-level IDE config
└── README.md             # Public entry point
```

## Skill Pattern

Each skill follows a consistent pattern:
```
skills/<skill-name>/
├── SKILL.md                    # Skill definition and workflow
├── references/                 # Step-by-step guides
│   └── *.md
└── templates/                  # Reusable templates
    └── *.txt
```

## Key Patterns

- **Environment detection first:** Always detect OS before giving instructions
- **One step at a time:** Never overwhelm users with multiple commands
- **Celebration:** Acknowledge progress at every step
- **Plain language:** Explain all technical terms on first use
- **Cross-platform:** All scripts work on Linux, WSL, and macOS