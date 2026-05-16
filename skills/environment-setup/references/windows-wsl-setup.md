# Windows WSL Setup Guide

## What is WSL?

WSL (Windows Subsystem for Linux) lets you run a Linux environment directly on Windows. Think of it like having a Linux computer inside your Windows machine — no dual-booting needed!

## Step 1: Check if WSL is Already Installed

Open PowerShell (right-click → Run as Administrator) and run:

```powershell
wsl --list --verbose
```

If you see Ubuntu listed, WSL is already installed! Skip to Step 3.

## Step 2: Install WSL

In PowerShell (as Administrator), run:

```powershell
wsl --install -d Ubuntu
```

This will:
- Install WSL
- Download and install Ubuntu (the most popular Linux distribution)
- Restart your computer if needed

## Step 3: Set Up Ubuntu

After restart:
1. Search for "Ubuntu" in the Windows Start menu
2. Open it — you'll see a black terminal window
3. Create a username and password when prompted
4. Remember these — you'll use them for installations

## Step 4: Install Required Tools

In the Ubuntu terminal, run these commands one at a time:

### Update package list
```bash
sudo apt update && sudo apt upgrade -y
```

### Install git (version control)
```bash
sudo apt install -y git
git --version
```

### Install Node.js (JavaScript runtime)
```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt install -y nodejs
node --version
npm --version
```

### Install Python 3
```bash
sudo apt install -y python3 python3-pip python3-venv
python3 --version
pip3 --version
```

### Install jq (JSON processor)
```bash
sudo apt install -y jq
jq --version
```

### Install Docker (optional for now)
```bash
sudo apt install -y docker.io
sudo usermod -aG docker $USER
```
> Note: Log out and back in for Docker group changes to take effect.

## Step 5: Verify Everything

Run the environment detection script:
```bash
cd ~/promptly-app
bash skills/environment-setup/scripts/detect-environment.sh
```

You should see a JSON report showing all installed tools.

## Troubleshooting

### "wsl is not recognized"
- Your Windows version might not support WSL
- You need Windows 10 version 2004+ or Windows 11
- Update Windows: Settings → Update & Security → Windows Update

### "Permission denied" when installing
- Use `sudo` before the command
- Enter your Ubuntu password when prompted (characters won't show — just type and press Enter)

### Ubuntu terminal closes immediately
- Open it from the Start menu (not via quick launch)
- It should stay open while running commands