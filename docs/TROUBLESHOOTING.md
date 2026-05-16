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

### "Chrome browser won't launch from Cline"

1. Make sure "Disable Browser Tool Usage" is unticked in Cline Browser Settings
2. Make sure "Use Remote Browser Connection" is ticked
3. Make sure Chrome or Chromium is installed on your system
4. Try launching Chrome manually first to verify it works

### "WebClaw extension won't load"

1. Make sure you extracted the zip file to a folder called `webclaw` in your workspace
2. Make sure `manifest.json` exists in that folder
3. On WSL/Linux: Ask Cline to extract using gunzip: "Cline, please unzip the webclaw extension using gunzip"
4. Make sure Developer mode is enabled in Chrome Extensions page
5. Click "Load unpacked" and select the folder containing manifest.json

### "WebClaw extension shows red error badge"

This is expected! The red error badge means the extension is loaded but not yet connected to a running WebClaw MCP server. Once Cline uses WebClaw MCP tools, the error will resolve.

---

## WSL / Chrome Browser Issues

### "Chrome browser won't launch from Cline — cannot open display"

This happens when VS Code is running inside WSL but WSL doesn't have a display environment (no X server / WSLg).

**Solution 1: Check if WSLg is working (Windows 11)**
- In the WSL terminal, run: `echo $DISPLAY`
- If it's empty or shows nothing, WSLg isn't working
- Update Windows: Settings → Update & Security → Windows Update
- Restart your computer

**Solution 2: Install virtual display (xvfb)**
```bash
sudo apt update
sudo apt install -y xvfb
Xvfb :99 -screen 0 1920x1080x24 &
export DISPLAY=:99
```

**Solution 3: Use headless Chrome**
```bash
google-chrome --headless-new --no-sandbox --disable-gpu --remote-debugging-port=9222 &
```

### "WSLg not working on Windows 10"

Windows 10 doesn't have built-in WSLg. Options:
1. **Upgrade to Windows 11** — Recommended (WSLg is built-in)
2. **Install an X Server on Windows** — Install [VcXsrv](https://sourceforge.net/projects/vcxsrv/) and set `DISPLAY=localhost:0.0` in WSL
3. **Use xvfb** — See "Chrome browser won't launch" above

### "Project files are slow — I'm working on /mnt/c/"

You're working on the Windows filesystem instead of inside WSL. This is 10-100x slower!

**Fix:**
1. In VS Code, click the green `WSL: Ubuntu` in the bottom-left
2. Select "New WSL Window"
3. Clone your project inside WSL: `cd ~ && git clone <your-repo-url>`
4. Never work inside `/mnt/c/` — always use your WSL home directory (`/home/username/`)

### "Remote - WSL extension not showing up"

1. Make sure you installed the correct extension: **Remote - WSL** by Microsoft
2. Reload VS Code: `Ctrl+Shift+P` → "Developer: Reload Window"
3. Make sure WSL is installed: `wsl --list --verbose` in PowerShell

### "WSL: Ubuntu doesn't appear in status bar"

1. Check WSL is installed: `wsl --install -d Ubuntu` (in PowerShell as Administrator)
2. Restart VS Code
3. Make sure you have an Ubuntu distribution: `wsl --list --verbose`

### "Chrome/Chromium not found in WSL"

WSL needs its own Chrome/Chromium installation, not the Windows one.

**Install Chromium in WSL:**
```bash
sudo apt update
sudo apt install -y chromium-browser
```

**Or install Google Chrome:**
```bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
```

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