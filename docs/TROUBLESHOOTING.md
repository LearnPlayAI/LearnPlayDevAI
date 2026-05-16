# Troubleshooting Guide

Common issues and their solutions.

---

## Setup Issues

### "WSL is not installed"

**On Windows:**
1. Open PowerShell as Administrator (right-click → Run as Administrator)
2. Run: `wsl --install -d Ubuntu`
3. Restart your computer
4. Open Ubuntu from the Start menu

**If that doesn't work:**
- Your Windows version might not support WSL
- You need Windows 10 version 2004+ or Windows 11
- Update Windows: Settings → Update & Security → Windows Update

### "Git is not installed"

**Linux:** `sudo apt install -y git`
**macOS:** `brew install git`
**Windows/WSL:** `sudo apt install -y git`

Then configure:
```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

### "Node.js is not installed"

**Linux/WSL:**
```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt install -y nodejs
```

**macOS:** `brew install node`

**Windows:** Install via WSL using the Linux instructions above

---

## API Key Issues

### "API key is not configured"

1. Create a `.env` file in your project folder
2. Add: `AI_API_KEY=your_key_here`
3. Request a key from jan@learnplay.co.za if you don't have one

### "API connection failed"

1. Check your internet connection
2. Verify your API key is correct (no extra spaces)
3. Test with:
```bash
curl -s -H "Authorization: Bearer $AI_API_KEY" \
  https://ai.learnplay.co.za/v1/models | jq .
```

### "Unauthorized" error

Your API key might be wrong or expired. Email jan@learnplay.co.za for a new one.

---

## VS Code / Cline Issues

### "Cline extension not found"

1. Make sure you're searching in the Extensions panel
2. The extension is called "Cline" by Saoud Rizwan
3. Try reloading VS Code: `Ctrl+Shift+P` → "Developer: Reload Window"

### "Cline is disconnected"

1. Check your internet connection
2. Verify your API key in `.env`
3. Try reloading VS Code

### "WebClaw is not connected"

1. Check the cline_mcp_settings.json file exists (see docs/webclaw-mcp-setup.md)
2. Restart VS Code
3. Make sure Node.js is installed: `node --version`
4. Make sure Chrome or Chromium is installed

---

## Git / GitHub Issues

### "Permission denied (publickey)"

You need to add an SSH key to GitHub:
```bash
ssh-keygen -t ed25519 -C "your@email.com"
cat ~/.ssh/id_ed25519.pub  # Copy this output
```

Then go to https://github.com/settings/keys and add the key.

### "remote: Repository not found"

- Check your repository name is correct
- Make sure the repo exists on GitHub
- Use the correct remote URL

### "fatal: not a git repository"

- You might be in the wrong directory
- Run `cd ~/myprojects/your-project` to navigate to your project folder

---

## Docker Issues

### "Docker is not installed"

**Linux:**
```bash
sudo apt install -y docker.io
sudo usermod -aG docker $USER
```
Log out and back in for group changes to take effect.

**macOS:** Download Docker Desktop from https://www.docker.com/products/docker-desktop/

**Windows/WSL:** Download Docker Desktop from https://www.docker.com/products/docker-desktop/

### "Cannot connect to Docker"

- Make sure Docker is running
- On Linux, make sure you're in the docker group
- Try: `docker info` to test the connection

---

## General Tips

### Always check the basics first
1. Is your internet working?
2. Are you in the right directory?
3. Did you restart VS Code after installing extensions?

### Ask the AI agent
The Cline agent in VS Code can help troubleshoot specific issues. Just describe what's happening and it will guide you through the solution.

### Check the memory bank
The project's `memory-bank/decisionLog.md` might have notes about known issues and solutions.