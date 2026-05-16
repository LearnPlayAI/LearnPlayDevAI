# Configure WebClaw MCP Server

## What is WebClaw?

WebClaw is a tool that lets Cline control a web browser. Think of it like giving Cline eyes and hands — now Cline can navigate websites, click buttons, fill forms, and take screenshots to help you test your app's user interface.

## What is MCP?

MCP (Model Context Protocol) is how VS Code extensions talk to each other. It's like a universal adapter that lets Cline use WebClaw's browser capabilities.

## Part 1: Configure WebClaw MCP Server (VS Code GUI)

### Step 1: Open Cline MCP Settings

1. In the left sidebar of VS Code, click on the **Cline** extension icon
2. Click on the **MCP Servers** button (to the right of the Plus button)
3. Click on the **Configure** tab
4. Click on **Configure MCP Servers** button
5. A file called `cline_mcp_settings.json` will open

### Step 2: Add WebClaw Configuration

Delete everything in the file and replace it with:

```json
{
  "mcpServers": {
    "webclaw": {
      "command": "npx",
      "args": [
        "-y",
        "webclaw-mcp"
      ],
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
        "evaluate",
        "close"
      ]
    }
  }
}
```

### Step 3: Save and Verify

1. Save the file: Press `Ctrl+S`
2. Look at the Cline panel (bottom of VS Code)
3. You should see: **WebClaw MCP is connected**

## Part 2: Configure Chrome Browser & Install WebClaw Extension

### Part A — Configure Cline's Browser Settings:

1. Click the ⚙️ gear icon (Cline settings) in the bottom of the Cline panel
2. Click the **Browser Settings** icon on the left
3. Untick "Disable Browser Tool Usage"
4. Set the viewport size to "Large Desktop"
5. Tick "Use Remote Browser Connection"
6. Click "Launch Browser with Debug Mode"
7. A Chrome browser window should open automatically

### Part B — Install the WebClaw Extension:

8. Go to https://github.com/kuroko1t/webclaw/releases
9. Download: `webclaw-extension-v0.10.0.zip`
10. Ask the Cline agent to extract it to a `webclaw` folder in your workspace:
    > "Cline, please unzip webclaw-extension-v0.10.0.zip to the webclaw folder using gunzip"
11. In the Chrome browser: 3 dots → More tools → Extensions
12. Enable "Developer mode" (top right corner)
13. Click "Load unpacked"
14. Browse to the `webclaw` folder where you extracted the zip
15. Select the folder containing `manifest.json`
16. You should see "WebClaw 0.10.0" with a red error badge — this is good!

### Part C — Test the Setup:

17. Ask the Cline agent in planning mode to use WebClaw MCP to:
    - Open https://google.com
    - Take a screenshot
    - Tell you what it sees

## Prerequisites

For WebClaw to work, you need:

1. **Node.js installed** — WebClaw uses `npx` to launch
2. **Chrome or Chromium browser installed** — WebClaw controls a Chromium browser

## Troubleshooting

### "WebClaw not connected" in Cline
1. Make sure the `cline_mcp_settings.json` file has valid JSON
2. Restart VS Code completely
3. Check that Node.js is installed: `node --version`
4. Check that Chrome/Chromium is installed

### "npx: command not found"
- Node.js is not installed. Install it first (see environment-setup skill).

### "Cannot find module webclaw-mcp"
- First time running WebClaw may take a moment as it downloads
- Check your internet connection
- Try running `npx -y webclaw-mcp` manually in the terminal to see if it works

### "Extension not loading"
- Make sure you extracted the zip to a folder (not the Downloads folder directly)
- Make sure `manifest.json` exists in the extracted folder
- Try reloading the extension: go to Extensions page and click the refresh icon

### JSON syntax error
- Make sure the JSON is valid (no trailing commas, all brackets matched)
- Use a JSON validator online to check your file