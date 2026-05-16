---
name: vscode-setup
description: Guide users through VS Code installation, Cline extension setup, and WebClaw MCP server configuration. Use when the user needs to install VS Code, install the Cline extension, configure MCP servers, or verify their IDE connection.
---

# VS Code Setup Skill

## Purpose

Guide COMPLETE NON-TECHNICAL USERS through setting up their development environment:
1. Install VS Code
2. Install the Cline extension (AI coding assistant)
3. Configure the WebClaw MCP server for browser testing
4. Verify the connection works

## Core workflow

1. Check if VS Code is installed
2. If not, guide installation using `references/install-vscode.md`
3. Guide Cline extension installation using `references/install-cline.md`
4. Configure WebClaw MCP using `references/configure-webclaw-mcp.md`
5. Verify the connection using `references/verify-connection.md`
6. Update `memory-bank/techContext.md` with setup status

## Step 1: Check VS Code Installation

Run:
```bash
code --version 2>/dev/null || echo "NOT_INSTALLED"
```

If VS Code is not installed, follow the workflow in `references/install-vscode.md`.

## Step 2: Install Cline Extension

Guide the user to:
1. Open VS Code
2. Click the Extensions icon (square icon on the left sidebar, or press `Ctrl+Shift+X`)
3. Search for "Cline"
4. Click "Install" on the Cline extension by Saoud Rizwan
5. Reload VS Code if prompted

Reference: `references/install-cline.md`

## Step 3: Configure WebClaw MCP Server

The WebClaw MCP server configuration is stored in a global settings file, NOT in the project.

### Linux/WSL Path:
```
~/.config/Code/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json
```

### macOS Path:
```
~/Library/Application Support/Code/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json
```

### Windows Path:
```
%APPDATA%\Code\User\globalStorage\saoudrizwan.claude-dev\settings\cline_mcp_settings.json
```

### Content:
```json
{
  "mcpServers": {
    "webclaw": {
      "command": "npx",
      "args": ["-y", "webclaw-mcp"],
      "type": "stdio",
      "autoApprove": [
        "navigate_to",
        "page_snapshot",
        "click",
        "hover",
        "type_text",
        "select_option",
        "list_webmcp_tools",
        "invoke_webmcp_tool",
        "screenshot",
        "new_tab",
        "list_tabs",
        "switch_tab",
        "close_tab",
        "go_back",
        "go_forward",
        "reload",
        "wait_for_navigation",
        "scroll_page",
        "drop_files",
        "handle_dialog",
        "evaluate"
      ]
    }
  }
}
```

Reference: `references/configure-webclaw-mcp.md`

## Step 4: Verify Connection

1. Open Cline in VS Code
2. Check that both "Cline" and "WebClaw" show as connected
3. Try a simple browser action through WebClaw to verify it works

Reference: `references/verify-connection.md`

## Important Notes

- The cline_mcp_settings.json is a GLOBAL file, not a project file
- It lives in VS Code's global storage, not in the project folder
- Do NOT commit cline_mcp_settings.json to git
- Node.js must be installed for `npx` to work (required by WebClaw)
- WebClaw requires Chrome/Chromium to be installed on the system