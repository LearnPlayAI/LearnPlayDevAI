# LearnPlayDevAI — Complete Setup Guide for New Developers

Welcome! This guide will walk you through everything you need to do to get started with the LearnPlayDevAI workspace. By the end, you'll have a fully configured development environment ready for AI-powered coding.

**No coding experience required!** We'll go step by step.

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

## Step 5: Configure Your API Key

Once you have your API key:

1. In VS Code, open the File menu → Open File
2. Create a file named `.env` in your project folder
3. Add this line (replace YOUR_KEY_HERE with your actual key):

```
AI_API_KEY=YOUR_KEY_HERE
```

4. Save the file

**Important:** Never share your API key publicly!

---

## Step 6: Create a GitHub Account

GitHub is where your code will be stored online — like cloud storage for your project.

1. Go to https://github.com
2. Click **Sign up**
3. Enter your email, create a password, and pick a username
4. Check your email for a verification link
5. Click the link to verify

**Done!** You now have a GitHub account.

---

## Step 7: Create Your Project Folder

Let's create a place for your projects:

### Windows (via WSL)
Open Ubuntu and run:
```bash
mkdir -p ~/myprojects
```

### Linux/Mac
```bash
mkdir -p ~/myprojects
```

---

## Step 8: Pull the Project Workspace

Now let's get the starter workspace. We'll create the GitHub repo first, then you'll pull it.

**The AI agent will help you with this step.** When you're ready, just say "I want to create [app name]" and the agent will guide you through pulling the template workspace.

---

## Step 9: Install Required Tools

The AI agent will check if you have all the tools you need. These include:

- **Git** — Version control (save points for your code)
- **Node.js** — Lets JavaScript programs run on your computer
- **Python 3** — For scripting and automation
- **jq** — For processing data

The agent will guide you through installing any missing tools.

---

## Step 10: Start Building!

Once everything is set up, just tell the AI agent what app you want to build. For example:

> "I want to create an app that helps people track their daily habits"

The agent will guide you from there!

---

## Troubleshooting

### "Cline is disconnected"
- Check your internet connection
- Make sure you have a valid API key in `.env`
- Try reloading VS Code: `Ctrl+Shift+P` → "Developer: Reload Window"

### "Git is not installed"
- Follow Step 2 above to install Git
- Then run: `git config --global user.name "Your Name"` and `git config --global user.email "your@email.com"`

### "WebClaw is not connected"
- Make sure Node.js is installed
- Restart VS Code
- Check that Chrome or Chromium is installed on your system

---

## Need Help?

If you get stuck, just ask the AI agent in Cline! It's there to help you through every step.