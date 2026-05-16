---
name: environment-setup
description: Guide users through development environment setup including OS detection, WSL installation (Windows), toolchain installation, and verification. Use when the user needs to set up their development environment, detect their OS, or install required tools like git, node, python.
---

# Environment Setup Skill

## Purpose

Guide COMPLETE NON-TECHNICAL USERS through setting up their development environment step by step. Detects the user's operating system, checks for required tools, and provides tailored installation instructions.

## Core workflow

1. Run `scripts/detect-environment.sh` to get a JSON report of the user's environment
2. Analyze the report to identify missing tools and configuration gaps
3. Guide installation of missing tools one at a time
4. Verify each installation before moving to the next tool
5. Update `memory-bank/techContext.md` with the detected environment

## Environment Detection

Run: `scripts/detect-environment.sh`

Expected output format:
```json
{
  "os": "windows" | "linux" | "macos",
  "subsystem": "wsl" | "native" | null,
  "wsl_distro": "Ubuntu-22.04" | null,
  "shell": "bash" | "zsh" | "powershell",
  "tools": {
    "git": "2.43.0" | null,
    "node": "20.11.0" | null,
    "python": "3.11.4" | null,
    "docker": null,
    "jq": "1.7" | null
  },
  "vscode": true,
  "cline_extension": true
}
```

## Installation Guidance by OS

### Windows + WSL (Preferred)
1. Guide WSL installation: `wsl --install -d Ubuntu`
2. Set Ubuntu as default: `wsl --setdefault Ubuntu`
3. Inside WSL, install: git, node, python3, docker, jq
4. Reference: `references/windows-wsl-setup.md`

### Linux Native
1. Use apt/yum/pacman based on detected distribution
2. Install: git, node, python3, docker, jq
3. Reference: `references/linux-native-setup.md`

### macOS
1. Use brew for package management
2. Install: git, node, python3, docker, jq
3. Reference: `references/macos-native-setup.md`

## Required Tools Checklist

| Tool | Minimum Version | Purpose |
|------|----------------|---------|
| git | 2.30+ | Version control |
| node | 18+ | JavaScript runtime, npm |
| python3 | 3.10+ | Scripting, backend |
| docker | 24+ | Containerization (optional for start) |
| jq | 1.6+ | JSON processing |

## Important Notes

- Guide ONE tool installation at a time
- Always confirm success before proceeding
- Explain what each tool does before installing it
- Provide the command to verify installation after each install
- If Docker is not available, note it as "optional for now"
- Always update `memory-bank/techContext.md` after setup is complete

## Useful Bundled Script

Use `scripts/detect-environment.sh` to detect the user's environment. It outputs a JSON report that the agent parses to determine the correct guidance.