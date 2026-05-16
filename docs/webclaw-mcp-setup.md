# WebClaw MCP Setup Guide

WebClaw MCP is a browser automation tool that lets the Cline agent control a web browser. This is how Cline can test your app's interface, take screenshots, and interact with your application.

## What You Need

- **VS Code** installed
- **Cline extension** installed
- **Node.js** installed (WebClaw uses Node.js)
- **Chrome or Chromium** browser installed on your system

## Part 1: Configure WebClaw MCP Server (VS Code GUI)

### Step 1: Open Cline MCP Settings

1. In the left sidebar of VS Code, click on the **Cline** extension icon
2. Click on the **MCP Servers** button (to the right of the Plus button)
3. Click on the **Configure** tab
4. Click on **Configure MCP Servers** button
5. A file called `cline_mcp_settings.json` will open

### Step 2: Add WebClaw Configuration

Delete everything in that file and replace it with:

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

---

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

---

## Troubleshooting

### "WebClaw failed to connect"
- Make sure Node.js is installed (`node --version`)
- Make sure you have an internet connection (WebClaw downloads on first use)
- Check that Chrome or Chromium is installed on your system

### "Chrome/Chromium not found"
- Install Google Chrome or Chromium
- On Linux: `sudo apt install chromium-browser`
- On Windows: Download from https://www.google.com/chrome/

### "Extension not loading"
- Make sure you extracted the zip to a folder (not the Downloads folder directly)
- Make sure `manifest.json` exists in the extracted folder
- Try reloading the extension: go to Extensions page and click the refresh icon

---

*This guide uses the VS Code GUI. No terminal commands needed!*