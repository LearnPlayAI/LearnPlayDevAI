# Configure WebClaw MCP Server

## What is WebClaw?

WebClaw is a tool that lets Cline control a web browser. Think of it like giving Cline eyes and hands — now Cline can navigate websites, click buttons, fill forms, and take screenshots to help you test your app's user interface.

## What is MCP?

MCP (Model Context Protocol) is how VS Code extensions talk to each other. It's like a universal adapter that lets Cline use WebClaw's browser capabilities.

## Configuration File

The WebClaw MCP server is configured in a GLOBAL file that VS Code reads when it starts. This file is NOT in your project — it lives in VS Code's settings.

### Find Your Configuration File

| Operating System | Path |
|-----------------|------|
| **Linux/WSL** | `~/.config/Code/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json` |
| **macOS** | `~/Library/Application Support/Code/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json` |
| **Windows** | `%APPDATA%\Code\User\globalStorage\saoudrizwan.claude-dev\settings\cline_mcp_settings.json` |

### How to Edit the File

#### Linux/WSL
```bash
code ~/.config/Code/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json
```

#### macOS
```bash
code ~/Library/Application\ Support/Code/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json
```

#### Windows
Open File Explorer, paste this in the address bar:
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

For WebClaw to work, you need:

1. **Node.js installed** — WebClaw uses `npx` to launch
2. **Chrome or Chromium browser installed** — WebClaw controls a Chromium browser

### Check if Chrome is Installed

```bash
# Linux
which google-chrome || which chromium-browser

# macOS
which google-chrome || which chromium

# Windows (via WSL)
winepath -u "$(cmd.exe /c echo %ProgramFiles%\\Google\\Chrome\\Application\\chrome.exe)" 2>/dev/null || echo "Check in Program Files"
```

## Troubleshooting

### "WebClaw not connected" in Cline
1. Make sure the cline_mcp_settings.json file exists and has valid JSON
2. Restart VS Code completely
3. Check that Node.js is installed: `node --version`
4. Check that Chrome/Chromium is installed

### "npx: command not found"
- Node.js is not installed. Install it first (see environment-setup skill).

### "Cannot find module webclaw-mcp"
- First time running WebClaw may take a moment as it downloads
- Check your internet connection
- Try running `npx -y webclaw-mcp` manually in the terminal to see if it works

### JSON syntax error
- Make sure the JSON is valid (no trailing commas, all brackets matched)
- Use a JSON validator online to check your file