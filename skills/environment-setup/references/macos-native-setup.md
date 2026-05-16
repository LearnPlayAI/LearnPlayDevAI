# macOS Setup Guide

## What You Need

- macOS (any version from the last 3 years)
- Terminal app (already installed on macOS)

## Step 1: Install Homebrew

Homebrew is the package manager for macOS. Run this in Terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the on-screen instructions. You'll see a message telling you to run a command — copy and paste it into Terminal.

Verify Homebrew is installed:
```bash
brew --version
```

## Step 2: Install Required Tools

### Install git (version control)
```bash
brew install git
git --version
```

### Install Node.js (JavaScript runtime)
```bash
brew install node
node --version
npm --version
```

### Install Python 3
```bash
brew install python3
python3 --version
pip3 --version
```

### Install jq (JSON processor)
```bash
brew install jq
jq --version
```

### Install Docker (optional for now)
```bash
brew install --cask docker
```
> After installing, open Docker from Applications. It will run in your menu bar.

## Step 3: Verify Everything

Run the environment detection script:
```bash
cd ~/promptly-app
bash skills/environment-setup/scripts/detect-environment.sh
```

## Troubleshooting

### "brew: command not found"
- Homebrew didn't install correctly
- Run the install command again
- Restart Terminal and try again

### Permission errors
- Don't use `sudo` with Homebrew — it can break things
- Run `brew doctor` to check for issues