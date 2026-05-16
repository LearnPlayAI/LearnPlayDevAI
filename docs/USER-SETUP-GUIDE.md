# LearnPlayDevAI — Complete Setup Guide for New Developers

Welcome! This guide will walk you through everything you need to do to get started with the LearnPlayDevAI workspace. By the end, you'll have a fully configured development environment ready for AI-powered coding.

**No coding experience required!** Everything is done using the VS Code visual interface.

---

## Step 1: Install VS Code

[VS Code](https://code.visualstudio.com/) is a free program where you'll write and organize your code.

1. Go to https://code.visualstudio.com/
2. Click the big blue **Download** button
3. Install it (just click "Next" through the installer)
4. Open VS Code

**That's it!** You've installed your code editor.

---

## Step 2: Install the Cline Extension

Cline is your AI coding assistant — think of it as a patient teacher who helps you build your app.

1. In VS Code, click the **Extensions** icon on the left sidebar (looks like 4 squares)
2. Type `Cline` in the search box
3. Find **Cline** by Saoud Rizwan
4. Click **Install**
5. If prompted, click **Reload**

---

## Step 3: Install Git (Version Control)

Git is like a "save point" system for your project. We'll install it so your code can be saved online.

### Windows (via WSL)
1. Open PowerShell as Administrator (right-click → Run as Administrator)
2. Run: `wsl --install -d Ubuntu`
3. Restart your computer
4. Open Ubuntu from the Start menu and create a username/password

### Linux
```bash
sudo apt install -y git
```

### macOS
```bash
brew install git
```

---

## Step 4: Request Your Free API Key

To use Cline, you need a free API key that connects to the AI.

1. Open your email
2. Send a message to **jan@learnplay.co.za** with subject: `AI API Key Request`
3. Use this body:

```
Hi,

I'm a new developer using the LearnPlayDevAI starter workspace.
I'd like to request a free API key to connect to the AI model.

My name: [Your Name]
My email: [Your Email]

Thank you!
```

4. Wait for the email reply with your API key

---

## Step 5: Configure Your API Key in VS Code

Once you have your API key, set it up using the VS Code file explorer:

1. In VS Code, open the **Explorer** panel on the left (click the top icon that looks like 2 pages)
2. Find the file named `.env.example`
3. **Right-click** on `.env.example` → select **Rename**
4. Change the name to: `.env` (press Enter)
5. **Double-click** `.env` to open it in the editor
6. Replace `your_api_key_here` with your actual API key from jan@learnplay.co.za
7. Save the file: Press `Ctrl+S` (or `File` → `Save`)

**Important:** Never share your API key publicly!

---

## Step 6: Set Up WebClaw MCP for Browser Automation

WebClaw MCP lets Cline control a web browser — this is how it tests your app's interface.

1. In the left sidebar of VS Code, click on the **Cline** extension icon
2. Click on the **MCP Servers** button (to the right of the Plus button)
3. Click on the **Configure** tab
4. Click on **Configure MCP Servers** button
5. A file called `cline_mcp_settings.json` will open
6. Delete everything in that file and replace it with:

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

7. Save the file: Press `Ctrl+S`
8. Wait for WebClaw to connect (you'll see a confirmation in the Cline panel)

---

## Step 7: Configure Chrome Browser & Install WebClaw Extension

WebClaw MCP lets Cline control a web browser. You need to install the WebClaw extension in the Chrome browser that Cline launches.

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

## Step 8: Verify Everything Is Connected

Look at the bottom-left corner of VS Code where the Cline panel is:

You should see:
- ✅ **Cline is connected**
- ✅ **WebClaw MCP is connected**
- ✅ **API key is configured**

If you see a ⚠️ or ❌ next to any item, click it to see troubleshooting tips.

---

## Step 9: Create a GitHub Account (Optional)

GitHub is where your code will be stored online — like cloud storage for your project.

1. Go to https://github.com
2. Click **Sign up**
3. Enter your email, create a password, and pick a username
4. Check your email for a verification link
5. Click the link to verify

**Done!** You now have a GitHub account.

---

## Step 10: Install Other Required Tools

The Cline agent will check if you have all the tools you need. These include:

- **Git** — Version control (save points for your code)
- **Node.js** — Lets JavaScript programs run on your computer
- **Python 3** — For scripting and automation
- **jq** — For processing data

If any tools are missing, the Cline agent will guide you through installing them.

---

## Step 11: Start Building!

Once everything is set up, just tell the Cline agent what app you want to build. For example:

> "I want to create an app that helps people track their daily habits"

The agent will guide you from there!

---

## Troubleshooting

### "Cline is disconnected"
- Check your internet connection
- Make sure you have a valid API key in `.env`
- Try reloading VS Code: `Ctrl+Shift+P` → "Developer: Reload Window"

### "Git is not installed"
- Follow Step 3 above to install Git
- Then run: `git config --global user.name "Your Name"` and `git config --global user.email "your@email.com"`

### "WebClaw is not connected"
- Make sure Node.js is installed
- Restart VS Code
- Check that Chrome or Chromium is installed on your system

---

## Need Help?

If you get stuck, just ask the Cline agent in the Cline chat! It's there to help you through every step.