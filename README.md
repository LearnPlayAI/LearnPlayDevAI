# LearnPlayDevAI — Starter Workspace for AI-Powered App Development

> **No coding experience needed.** Follow the steps below to set up your development environment, then use AI to build any app you can imagine.

---

## Getting Started — Complete Step-by-Step Guide

### Before You Start — What You'll Need

| Item | Details | How to Get It |
|------|---------|---------------|
| **A computer** | Windows, Mac, or Linux | Any modern computer works |
| **Internet connection** | So you can download tools | Your WiFi or Ethernet |
| **An AI API key** | Free key to connect to AI | Email jan@learnplay.co.za (see Step 4) |

That's it! No other experience needed.

---

### Overview: What We'll Do

1. **Visit this GitHub page** — You're already here! 🎉
2. **Download and install VS Code** — The program where you'll write code
3. **Install the Cline extension** — Your AI coding assistant
4. **Get a free API key** — So Cline can talk to AI
5. **Set up your environment** — Prepare your computer for development
6. **Clone this project** — Download the starter workspace to your computer
7. **Start building!** — Tell Cline what app you want to create

Now let's go through each step together!

---

### Step 1: Visit the GitHub Repo

**You are here!** This GitHub page is your starting point.

**What is GitHub?**
Think of GitHub like Google Drive for code. It's where projects are stored online so you can access them.

**What to do:**
- Just stay on this page! You already found everything you need.

👉 **Link:** https://github.com/LearnPlayAI/LearnPlayDevAI

---

### Step 2: Download and Install VS Code

**What is VS Code?**
VS Code (Visual Studio Code) is like a word processor, but for code. It's where you'll type and organize your project. Think of it as your "writing desk."

**Steps:**

1. Open your web browser (Chrome, Edge, Firefox, etc.)
2. Go to: https://code.visualstudio.com/
3. Click the big blue **"Download"** button
4. Once downloaded, open the installer:
   - **Windows:** Double-click the file that starts with `Setup`
   - **Mac:** Open the `.dmg` file and drag VS Code to the Applications folder
   - **Linux:** Follow the installation instructions on the VS Code website
5. When installation finishes, **open VS Code**
6. You'll see a window — congratulations, you installed VS Code! 🎉

**If you get stuck:** Ask Cline! Even without Cline installed yet, you can search "how to install VS Code" and follow online guides.

---

### Step 3: Install the Cline Extension

**What is Cline?**
Cline is like having a patient teacher sitting next to you who helps you build apps. You tell Cline what you want to build, and Cline guides you step by step — explaining everything along the way.

**Steps:**

1. In VS Code, look at the **left sidebar** (the narrow column on the left side of the window)
2. Click the **Extensions icon** — it looks like 4 small squares arranged in a grid (or press `Ctrl+Shift+X` on Windows / `Cmd+Shift+X` on Mac)
3. In the search box at the top, type: `Cline`
4. You should see **Cline** by Saoud Rizwan in the results
5. Click the blue **"Install"** button next to it
6. Wait a moment — Cline is now installed!
7. You should see a Cline panel appear (usually at the bottom of the window)

**If you get stuck:** The extension should appear as soon as you type "Cline" in the Extensions search box. If it doesn't, make sure you're connected to the internet.

---

### Step 4: Get a Free API Key

**What is an API key?**
An API key is like a "password" that lets Cline talk to an AI brain. Without it, Cline can't help you. The best part? This one is completely free!

**How to get your free key:**

1. Open your email (Gmail, Outlook, or whatever you use)
2. Send an email to: **jan@learnplay.co.za**
3. Use this exact subject line: `AI API Key Request`
4. Use this body text:

```
Hi,

I'm a new developer using the LearnPlayDevAI starter workspace.
I'd like to request a free API key to connect to the AI model.

My name: [Type your name here]
My email: [Type your email here]

Thank you!
```

5. Wait for the reply — it will contain your free API key

**Alternative: Use your own AI API provider**
If you already have an API key from another provider (like OpenAI, Anthropic, etc.), you can use that instead. Just skip the email and use your own key in Step 5.

---

### Step 5: Set Up Your Environment

This is where we prepare your computer to build apps. Don't worry — Cline will help you through this, but here's what will happen:

**For Windows Users:**
- Install **WSL** (Windows Subsystem for Linux) — This gives your computer Linux tools
- Install **Git** — A program that saves versions of your code (like save points in a video game)
- Install **Node.js** — Lets your computer run JavaScript programs
- Install **Python** — For automation scripts

**For Linux/Mac Users:**
- Install **Git** — Version control
- Install **Node.js** — JavaScript runtime
- Install **Python** — For scripts

**The Easiest Way: Let Cline Help You!**

Once you have VS Code and Cline running, simply type in the Cline chat box:

> "Help me set up my development environment. I'm on [Windows/Mac/Linux] and I need to install Git, Node.js, and Python."

Cline will:
- ✅ Check what you already have
- ✅ Guide you through installing anything you're missing
- ✅ Verify everything is working
- ✅ Explain each step in plain language

**We'll come back to this after we clone the project** — because Cline will help you with these steps once you have the project open!

---

### Step 6: Clone This Project to Your Computer

**What does "clone" mean?**
"Cloning" means downloading a copy of this project to your computer. It's like downloading a song — but instead of just listening to it, you can modify and build on it.

**The Easy Way: Ask Cline to Do It!**

Once Cline is installed, just type in the Cline chat:

> "Please clone this repository to my computer: https://github.com/LearnPlayAI/LearnPlayDevAI"

Cline will do all the technical work for you!

**If you prefer to do it manually:**

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

**What does "cd" mean?**
`cd` means "change directory" — it's like double-clicking a folder to open it, but with text instead.

**What does "git clone" mean?**
`git clone` means "download this entire project from the internet to my computer."

---

### Step 7: Open the Project in VS Code

1. In VS Code, go to **File** → **Open Folder** (or press `Ctrl+O` / `Cmd+O`)
2. Navigate to the `LearnPlayDevAI` folder you just downloaded
3. Click **Open** (or **Open Folder**)
4. You should now see all the files in the left sidebar!

**If Cline is already installed, you might see a message recommending you install recommended extensions — click "Install all" if you see it.**

---

### Step 8: Configure Your API Key in the Project

1. In the left sidebar of VS Code, find the file named **`.env.example`**
2. **Right-click** on `.env.example` → select **Rename**
3. Change the name to: **`.env`** (press Enter)
4. **Double-click** `.env` to open it
5. Replace `YOUR_API_KEY_HERE` with the API key you got from jan@learnplay.co.za
6. Save the file: Press `Ctrl+S` (Windows/Linux) or `Cmd+S` (Mac)

---

### Step 9: Set Up Cline and WebClaw MCP

**What is WebClaw MCP?**
WebClaw is a tool that lets Cline use a web browser. This is how Cline will test your app's look and feel — by actually browsing it like a user would!

**Steps:**

1. In the left sidebar of VS Code, click the **Cline** extension icon
2. Click the **MCP Servers** button (to the right of the Plus button)
3. Click the **Configure** tab
4. Click **Configure MCP Servers**
5. A file will open. Delete everything in it and paste this:

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

6. Save the file: `Ctrl+S`
7. Wait for WebClaw to connect — you'll see a confirmation in the Cline panel

For detailed instructions, see: [docs/USER-SETUP-GUIDE.md](docs/USER-SETUP-GUIDE.md)

---

### Step 10: Start Building Your App!

🎉 **You made it!** Everything is set up. Now for the fun part:

Open the Cline chat (at the bottom of VS Code) and tell Cline what you want to build:

> "I want to create an app that helps people track their daily habits"

Cline will:
- ✅ Ask you questions to understand your idea
- ✅ Create the project structure
- ✅ Write the code for you
- ✅ Explain everything as it goes
- ✅ Let you test and see your app
- ✅ Guide you from there!

---

## What's in This Workspace?

```
├── .clinerules              ← Rules that tell Cline how to behave (be patient, explain things!)
├── .clineignore             ← Files Cline should ignore (don't read these)
├── .env.example             ← Template for your API key (copy to .env)
├── scripts/                 ← Helper scripts
│   ├── detect-environment.sh  ← Checks what tools you have
│   ├── verify-setup.sh       ← Checks if everything is ready
│   ├── setup-git.sh          ← Sets up Git for you
│   └── setup-ide.sh          ← Installs VS Code extensions
├── skills/                  ← Knowledge modules for Cline
│   ├── saas-platform-planner/   ← Helps choose the right tools for your project
│   ├── environment-setup/       ← Helps set up your computer
│   ├── account-setup/           ← Helps with GitHub and API keys
│   └── vscode-setup/            ← Helps set up VS Code and Cline
├── docs/                    ← Documentation
│   ├── USER-SETUP-GUIDE.md   ← Complete setup walkthrough
│   ├── FIRST-SESSION-GUIDE.md ← What happens when you first use Cline
│   ├── TROUBLESHOOTING.md    ← Common problems and fixes
│   ├── webclaw-mcp-setup.md  ← Browser automation setup
│   └── github-ssh-setup.md   ← GitHub connection guide
├── memory-bank-template/    ← Templates Cline uses to track project progress
├── .vscode/                 ← VS Code settings for this project
└── .github/                 ← GitHub templates (for support requests)
```

---

## Supported Platforms

| Platform | Status | Notes |
|----------|--------|-------|
| **Windows + WSL** | ✅ Primary | Most common setup — WSL gives you Linux tools on Windows |
| **Linux native** | ✅ Fully supported | Ubuntu/Debian recommended |
| **macOS** | ✅ Fully supported | Using Homebrew for installs |

---

## The User Journey — At a Glance

```
Step 1: Visit GitHub repo  →  You found this page!
Step 2: Install VS Code    →  Download from code.visualstudio.com
Step 3: Install Cline      →  Search "Cline" in VS Code Extensions
Step 4: Get API key        →  Email jan@learnplay.co.za
Step 5: Set up environment →  Ask Cline to help you install tools
Step 6: Clone project      →  Ask Cline to clone the GitHub repo
Step 7: Configure project  →  Set up .env file with your API key
Step 8: Set up Cline       →  Configure WebClaw MCP for browser automation
Step 9: Start building     →  Tell Cline your app idea!
```

---

## FAQ

### Is this really free?
**Yes!** The API key is completely free for users of this starter workspace.

### I have no coding experience — is this really for me?
**Absolutely!** This workspace was designed for people with zero technical background. Cline explains everything and guides you step by step. You tell Cline what you want to build, and Cline does the technical work.

### What if I get stuck?
You have three options:
1. **Ask Cline!** — Cline is right there in VS Code and knows about every issue
2. **Check [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)** — Common problems and their solutions
3. **Email jan@learnplay.co.za** — For API key issues

### Can I use this for any type of app?
**Yes!** Whether you want a habit tracker, inventory system, recipe sharing site, or anything else — Cline helps you choose the right technology and builds it step by step.

### I already have an API key from another provider (OpenAI, etc.)
**That works too!** Just use your own key instead of requesting one from jan@learnplay.co.za. The steps are the same.

---

## License

This is an educational starter workspace designed to help anyone build apps with AI. Feel free to fork it and make it your own.

## Support

| Issue Type | Where to Get Help |
|------------|-------------------|
| **API Key Issues** | Email jan@learnplay.co.za |
| **Setup Problems** | Ask Cline (in VS Code) or check [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) |
| **GitHub / Account Issues** | See [docs/github-ssh-setup.md](docs/github-ssh-setup.md) |
| **General Questions** | Ask Cline! |