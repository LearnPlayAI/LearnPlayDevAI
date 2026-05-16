# Linux Native Setup Guide

## For Ubuntu/Debian Users

### Step 1: Update Package List

```bash
sudo apt update && sudo apt upgrade -y
```

### Step 2: Install Required Tools

#### Install git (version control)
```bash
sudo apt install -y git
git --version
```

#### Install Node.js (JavaScript runtime)
```bash
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt install -y nodejs
node --version
npm --version
```

#### Install Python 3
```bash
sudo apt install -y python3 python3-pip python3-venv
python3 --version
pip3 --version
```

#### Install jq (JSON processor)
```bash
sudo apt install -y jq
jq --version
```

#### Install Docker (optional for now)
```bash
sudo apt install -y docker.io
sudo usermod -aG docker $USER
```
> Note: Log out and back in for Docker group changes to take effect.

### Step 3: Verify Everything

Run the environment detection script:
```bash
cd ~/promptly-app
bash skills/environment-setup/scripts/detect-environment.sh
```

## For Fedora/RHEL Users

Replace `apt` with `dnf`:
```bash
sudo dnf update -y
sudo dnf install -y git nodejs python3 jq
```

## For Arch/Linux Users

Replace `apt` with `pacman`:
```bash
sudo pacman -Syu
sudo pacman -S git nodejs python jq
```

## Troubleshooting

### "command not found"
- The tool might not be installed yet
- Check the installation commands above
- Try running `which <command>` to see if it's installed