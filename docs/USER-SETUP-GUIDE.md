# LearnPlayDevAI — Complete Setup Guide for New Developers

Welcome! This guide walks you through setting up your entire development environment. No coding experience needed — just follow each step in order.

**Think of this like assembling furniture:** Each step builds on the last. Don't skip ahead!

---

## What You'll Need Before Starting

| Item | Why You Need It | How to Get It |
|------|----------------|---------------|
| **A computer** | To write code on | Any computer works (Windows, Mac, or Linux) |
| **Internet connection** | To download tools | Your WiFi or Ethernet |
| **An email account** | To request your free API key | Gmail, Outlook, or whatever you use |

**Time needed:** About 15-20 minutes for everything.

---

## Overview: The Big Picture

Here's what we'll do, in order:

| Phase | What Happens |
|-------|-------------|
| **Phase 1** | Install VS Code (your code editor) |
| **Phase 2** | Install Cline (your AI coding assistant) |
| **Phase 3** | Get a free API key (so Cline can talk to AI) |
| **Phase 4** | Set up your computer's development tools |
| **Phase 5** | Install Git and set up the project workspace |
| **Phase 6** | Clone this project to your computer |
| **Phase 7** | Set up the WSL environment (Windows users) |
| **Phase 8** | Configure the project (API key, settings) |
| **Phase 9** | Set up WebClaw MCP (browser automation) |
| **Phase 10** | Test everything and start building! |

Let's go through each phase together!

---

## Phase 1: Install VS Code

**What is VS Code?**
VS Code (Visual Studio Code) is a free program from Microsoft where you'll write and organize your code. Think of it like a word processor, but for building apps. It's your "writing desk."

### Step 1.1: Download VS Code

1. Open any web browser (Chrome, Firefox, Edge, etc.)
2. Go to: **https://code.visualstudio.com/**
3. Click the big blue **Download** button
4. The file will download to your Downloads folder

### Step 1.2: Install VS Code

**If you're on Windows:**
1. Go to your **Downloads** folder
2. Find the file that starts with `Setup` (like `Setup-x64.exe`)
3. **Double-click** it
4. Click **"Next"** through each screen
5. Click **"Install"** when prompted
6. Wait for installation to finish
7. Click **"Finish"**

**If you're on Mac:**
1. Go to your **Downloads** folder
2. Find the `.dmg` file (like `VSCode-darwin.zip`)
3. **Double-click** it to open
4. Drag the VS Code icon into the **Applications** folder
5. Open **Applications** and double-click VS Code

**If you're on Linux:**
1. Follow the instructions at https://code.visualstudio.com/docs/?dv=linux
2. The easiest way: open a terminal and run:
   ```bash
   sudo apt install -y code
   ```

### Step 1.3: Open VS Code

- **Windows:** Search for "VS Code" in the Start menu and open it
- **Mac:** Open the Applications folder and double-click VS Code
- **Linux:** Search for "Visual Studio Code" in your apps and open it

**You should see a window with a menu on the left and empty space in the middle.** That's VS Code — you just installed it! 🎉

---

## Phase 2: Install the Cline Extension

**What is Cline?**
Cline is an extension (add-on) for VS Code that acts as your AI coding assistant. Think of it as a patient teacher who sits next to you, explains everything, and helps you build apps step by step. You tell Cline what you want to build, and Cline does the technical work.

### Step 2.1: Open the Extensions Panel

1. In the VS Code window, look at the **left sidebar** (the narrow column on the far left)
2. Click the **Extensions icon** — it looks like 4 small squares arranged in a grid like this: 🟦🟦🟦🟦
   - Or press `Ctrl+Shift+X` (Windows/Linux) or `Cmd+Shift+X` (Mac) on your keyboard

You should now see a search box at the top of the left sidebar.

### Step 2.2: Search for and Install Cline

1. In the search box, type: **Cline**
2. You should see **Cline** by Saoud Rizwan in the results (it will be one of the top results)
3. Click the blue **Install** button next to it
4. Wait a few seconds — you'll see a progress bar

**You should see a Cline panel appear** (usually at the bottom of the window). If you do, congratulations — Cline is installed! 🎉

### Step 2.3: If You See a "Reload" Button

1. If VS Code asks you to reload, click the **Reload** button
2. After reloading, the Cline panel should appear

---

## Phase 3: Get Your Free API Key

**What is an API key?**
An API key is like a "password" or "key" that lets Cline talk to an AI brain. Without it, Cline can't help you. Think of it like needing a key to enter a special club — the API key is your invitation.

The best part? This one is **completely free** for users of this starter workspace!

### Step 3.1: Send the Email

1. Open your email (Gmail, Outlook, Yahoo — whatever you normally use)
2. Click **Compose** (or **New Message**)
3. Fill in these details:

   - **To:** `jan@learnplay.co.za`
   - **Subject:** `AI API Key Request`
   - **Body:** (copy and paste this text)

```
Hi,

I'm a new developer using the LearnPlayDevAI starter workspace.
I'd like to request a free API key to connect to the AI model.

My name: [Type your name here]
My email: [Type your email address here]

Thank you!
```

4. Click **Send**

### Step 3.2: Wait for Your API Key

- The reply will come to your email with your API key
- It usually arrives within a few minutes to an hour
- The email will contain a long string of letters and numbers — that's your key!
- **Save it somewhere safe** — you'll need it in Phase 8

**Note:** If you already have an API key from another AI provider (like OpenAI or Anthropic), you can use that instead. Just skip ahead to Phase 8 and use your own key.

---

## Phase 4: Set Up Your Computer's Development Tools

**What are these tools?**
Before we can build apps, we need a few basic tools on your computer. These are like the "hammer and screwdriver" of software development.

| Tool | What It Does | Simple Explanation |
|------|-------------|-------------------|
| **Git** | Saves versions of your code | Like save points in a video game |
| **Node.js** | Runs JavaScript on your computer | Lets your computer understand JavaScript code |
| **Python 3** | Runs automation scripts | Helps with background tasks |
| **jq** | Processes data | Helps read and organize information |

### The Easiest Way: Let Cline Help You!

**The simplest approach is to let Cline install these tools for you.** Once VS Code and Cline are working, just type this in the Cline chat box:

> "Help me set up my development environment. I need to install Git, Node.js, Python, and jq on my computer. I'm using [Windows/Mac/Linux]."

Cline will:
1. Check which tools you already have
2. Guide you through installing anything you're missing
3. Verify everything works
4. Explain each step in plain language

### Want to Do It Manually?

If you prefer to install tools yourself, here are the commands:

**Windows (via WSL — we'll set up WSL in Phase 7):**
```bash
sudo apt update && sudo apt install -y git nodejs python3 python3-pip jq
```

**Linux:**
```bash
sudo apt update && sudo apt install -y git nodejs python3 python3-pip jq
```

**Mac:**
```bash
brew install git node python3 jq
```

**For now, you can skip this phase and come back to it after Phase 6.** Cline can help you install these tools once the project is cloned.

---

## Phase 5: Install Git

**What is Git?**
Git is a program that saves "versions" of your project. Think of it like a save point in a video game — if something goes wrong, you can always go back to a previous save.

### Step 5.1: Install Git

**On Windows (via WSL — we'll set up WSL in Phase 7):**
1. Open **PowerShell** as Administrator (right-click the Start menu → "Windows Terminal (Admin)")
2. Run: `wsl --install -d Ubuntu`
3. Restart your computer
4. Open **Ubuntu** from the Start menu
5. Create a username and password when prompted

**On Linux:**
```bash
sudo apt install -y git
```

**On Mac:**
```bash
brew install git
```

### Step 5.2: Configure Git

After installing Git, tell it who you are:

```bash
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
```

Replace "Your Name" with your actual name and "your-email@example.com" with your actual email.

---

## Phase 6: Clone This Project to Your Computer

**What does "clone" mean?**
Cloning means downloading a copy of this project from the internet to your computer. It's like downloading a song — except instead of just listening to it, you can modify, build on, and learn from it.

### The Easiest Way: Let Cline Clone It for You

Once Cline is installed and running, this is the simplest approach:

1. In the Cline chat, type:

> "Please clone this GitHub repository to my computer: https://github.com/LearnPlayAI/LearnPlayDevAI"

2. Cline will do all the technical work — running the git commands, creating folders, everything!

### Do It Manually (If You Prefer)

**On Windows (via WSL):**
```bash
wsl
cd ~
git clone https://github.com/LearnPlayAI/LearnPlayDevAI.git
cd LearnPlayDevAI
```

**On Linux:**
```bash
git clone https://github.com/LearnPlayAI/LearnPlayDevAI.git
cd LearnPlayDevAI
```

**On Mac:**
```bash
git clone https://github.com/LearnPlayAI/LearnPlayDevAI.git
cd LearnPlayDevAI
```

**What do these commands mean?**
- `git clone ...` — Download the project from GitHub
- `cd LearnPlayDevAI` — Go inside the folder you just downloaded (like double-clicking a folder)

---

## Phase 7: Set Up the WSL Environment (Windows Users Only)

**What is WSL?**
WSL (Windows Subsystem for Linux) lets your Windows computer run Linux tools. Most development tools work better in Linux, so WSL is like giving your Windows computer a "Linux superpower."

**Skip this phase if you're on Mac or Linux.**

### Step 7.1: Install WSL (Ubuntu)

1. Right-click the **Start** button
2. Select **Windows Terminal (Admin)** or **PowerShell (Admin)**
3. Run this command:
   ```powershell
   wsl --install -d Ubuntu
   ```
4. **Restart your computer** when prompted
5. After restart, search for **Ubuntu** in the Start menu and open it
6. Create a **username** (no spaces, like `john123`)
7. Create a **password** (you won't see characters as you type — just type and press Enter)
8. Remember these — you'll need them!

### Step 7.2: Install Tools Inside WSL

In the Ubuntu terminal, run:
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git nodejs python3 python3-pip jq
```

### Step 7.3: Verify the Installation

```bash
git --version    # Should show a version number
node --version   # Should show a version number
python3 --version  # Should show a version number
jq --version     # Should show a version number
```

If all four commands show version numbers, WSL is working perfectly! 🎉

---

## Phase 8: Set Up VS Code with Your Project

### Step 8.1: Open the Project Folder in VS Code

1. In VS Code, click **File** in the top menu
2. Click **Open Folder...** (or press `Ctrl+O` / `Cmd+O`)
3. Find the **LearnPlayDevAI** folder you downloaded in Phase 6
4. Click on it, then click **Select Folder** (or **Open**)
5. You should now see files in the left sidebar!

### Step 8.2: Install Recommended Extensions

When you open a project folder, VS Code might suggest installing recommended extensions. If you see a popup:
1. Click **"Install All"** or **"View Recommended Extensions"**
2. This ensures you have everything needed for this project

### Step 8.3: Switch to WSL (Windows Users)

**If you're on Windows and want to develop inside WSL (recommended for performance):**

1. In VS Code, look at the **bottom-left corner** of the window
2. Click the green button that says something like **`<user> ➜ Windows`**
3. Select **`WSL: Ubuntu`** from the menu
4. A new VS Code window will open connected to WSL
5. In that window, open the folder: **File → Open Folder** → navigate to `~/LearnPlayDevAI`

**At the bottom-left, you should see `🦎 WSL: Ubuntu`** — this confirms you're inside WSL!

---

## Phase 9: Configure the Project (API Key)

### Step 9.1: Set Up Your API Key

1. In the left sidebar of VS Code (the file explorer), find the file named **`.env.example`**
2. **Right-click** on `.env.example`
3. Click **Rename**
4. Change the name to: **`.env`** (just remove `.example`)
5. **Double-click** `.env` to open it in the editor
6. You'll see something like: `AI_API_KEY=YOUR_API_KEY_HERE`
7. Replace `YOUR_API_KEY_HERE` with your actual API key from Phase 3
8. Save the file: Press `Ctrl+S` (Windows/Linux) or `Cmd+S` (Mac)

**Example:**
```
AI_API_KEY=abc123def456ghi789...
```

**⚠️ Important: Never share your `.env` file or your API key publicly!**

---

## Phase 10: Set Up WebClaw MCP (Browser Automation)

**What is WebClaw MCP?**
WebClaw is a tool that lets Cline use a web browser. This is how Cline will test what your app looks like — by opening it in Chrome and looking around, just like a user would.

### Step 10.1: Configure WebClaw MCP

1. In the left sidebar of VS Code, click the **Cline** extension icon
2. Click the **MCP Servers** button (to the right of the Plus button)
3. Click the **Configure** tab
4. Click **Configure MCP Servers**
5. A file called `cline_mcp_settings.json` will open
6. **Delete everything** in that file
7. **Copy and paste** this:

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
        "evaluate",
        "close"
      ]
    }
  }
}
```

8. Save the file: `Ctrl+S`
9. Wait a few seconds — WebClaw should connect

### Step 10.2: Install the WebClaw Chrome Extension

1. Go to https://github.com/kuroko1t/webclaw/releases
2. Download the file `webclaw-extension-v0.10.0.zip`
3. Extract it to a folder (right-click → Extract All on Windows, or double-click on Mac)
4. Ask Cline to help you move it to a folder called `webclaw` in your project
5. In the Chrome browser that Cline launches:
   - Click the 3 dots (⋮) in the top-right
   - Go to **More tools** → **Extensions**
   - Enable **Developer mode** (toggle in the top-right)
   - Click **Load unpacked**
   - Select the `webclaw` folder

### Step 10.3: Configure Browser Settings in Cline

1. Click the ⚙️ gear icon (Cline settings) at the bottom of the Cline panel
2. Click the **Browser Settings** icon on the left
3. **Untick** "Disable Browser Tool Usage"
4. Set the viewport size to **Large Desktop**
5. **Tick** "Use Remote Browser Connection"
6. Click **Launch Browser with Debug Mode**

A Chrome window should open automatically!

### Step 10.4: Test the Setup

Ask Cline to test your browser setup:

> "Please use WebClaw MCP to open google.com and take a screenshot."

If Cline shows you a screenshot of Google, everything is working! 🎉

---

## Phase 11: Verify Everything Is Connected

Look at the Cline panel (usually at the bottom of VS Code). You should see:

- ✅ **Cline is connected**
- ✅ **WebClaw MCP is connected**
- ✅ **API key is configured**

If any item shows ⚠️ or ❌, click it to see troubleshooting tips.

---

## Phase 12: Start Building Your App!

🎉 **You did it!** Everything is set up. Now for the fun part:

Open the Cline chat (at the bottom of VS Code) and tell Cline what you want to build:

> "I want to create an app that helps people track their daily habits"

Cline will:
- ✅ Ask you questions to understand your idea
- ✅ Create the project structure for you
- ✅ Write the code step by step
- ✅ Explain everything as it goes
- ✅ Let you test and see your app
- ✅ Keep guiding you from there!

**Just describe your idea in plain English — no coding needed!**

---

## Troubleshooting

### "Cline is disconnected"
- Check your internet connection
- Make sure you have a valid API key in `.env`
- Try reloading VS Code: Press `Ctrl+Shift+P`, type "Developer: Reload Window"

### "Git is not installed"
- Follow Phase 5 above to install Git
- Then run: `git config --global user.name "Your Name"` and `git config --global user.email "your@email.com"`

### "WebClaw is not connected"
- Make sure Node.js is installed
- Restart VS Code
- Check that Chrome or Chromium is installed on your system

### "Chrome browser won't launch"
- Make sure "Disable Browser Tool Usage" is unticked in Cline settings
- Make sure "Use Remote Browser Connection" is ticked
- Try launching Chrome manually first to verify it works

### "WSL: Ubuntu doesn't appear"
- Check WSL is installed: `wsl --list --verbose` in PowerShell
- Restart VS Code
- Make sure you have an Ubuntu distribution

### "Cannot open display" error
- On Windows 11, WSLg should work automatically
- On Windows 10, install an X Server like VcXsrv
- Or ask Cline: "How do I fix the 'cannot open display' error in WSL?"

---

## Need Help?

**The easiest thing to do:** Just ask Cline! Cline is right there in your VS Code window and can help with any of these issues. You can type:

> "I'm getting this error: [paste the error]. Can you help me fix it?"

Or check:
- [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) — Common problems and fixes
- [docs/webclaw-mcp-setup.md](docs/webclaw-mcp-setup.md) — Detailed WebClaw setup guide
- [docs/github-ssh-setup.md](docs/github-ssh-setup.md) — GitHub connection guide