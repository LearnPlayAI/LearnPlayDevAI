# WebClaw MCP Setup Guide

## What is WebClaw?

WebClaw is a browser automation tool that lets Cline (your AI coding assistant) interact with web pages. Think of it like giving Cline eyes and hands — Cline can now navigate websites, click buttons, fill forms, and take screenshots to help you test your app's user interface.

## What is MCP?

MCP (Model Context Protocol) is how VS Code extensions communicate with external tools. It's like a universal adapter that lets Cline use WebClaw's browser capabilities.

## Configuration File

WebClaw is configured through a global settings file that VS Code reads on startup.

### File Path by OS

| OS | Path |
|----|------|
| **Linux / WSL** | `~/.config/Code/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json` |
| **macOS** | `~/Library/Application Support/Code/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json` |
| **Windows** | `%APPDATA%\Code\User\globalStorage\saoudrizwan.claude-dev\settings\cline_mcp_settings.json` |

### How to Edit the File

**Linux/WSL:**
```bash
code ~/.config/Code/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json
```

**macOS:**
```bash
code ~/Library/Application\ Support/Code/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json
```

**Windows:**
Paste this in File Explorer address bar:
```
%APPDATA%\Code\User\globalStorage\saoudrizwan.claude-dev\settings\cline_mcp_settings.json
```

### Configuration Content

The file should contain:
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

## Prerequisites

For WebClaw to work you need:

1. **Node.js** installed — WebClaw uses `npx` to launch
2. **Chrome or Chromium** browser installed — WebClaw controls a Chromium browser

### Verify Node.js
```bash
node --version
npx --version
```

### Verify Chrome/Chromium
```bash
# Linux
which google-chrome || which chromium-browser

# macOS
which google-chrome

# Windows (via WSL)
# Check Program Files for Chrome installation
```

## After Configuration

1. **Restart VS Code** completely
2. Open Cline in VS Code
3. Check that WebClaw shows as "connected"
4. Try: "Can you navigate to example.com and take a screenshot?"

## Troubleshooting

### WebClaw not connected in Cline
- Verify the JSON file is valid (no trailing commas)
- Restart VS Code completely
- Check Node.js is installed: `node --version`

### "npx: command not found"
- Install Node.js first (see environment-setup skill)

### Browser doesn't open
- Ensure Chrome or Chromium is installed
- First run may take a moment as WebClaw downloads dependencies

### JSON syntax error
- Use https://jsonlint.com/ to validate your JSON
- Make sure all brackets are matched: `{}` and `[]`