# Git Setup Guide

## What is Git?

Git is like a "save point" system for your project. Every time you make progress, you can "save" your work. If something breaks, you can "load" a previous save. It also keeps track of WHO made each change — super helpful for teams!

## Step 1: Check if Git is Installed

Open your terminal and run:
```bash
git --version
```

If you see a version number (like `git version 2.43.0`), Git is already installed! Skip to Step 2.

## Step 2: Install Git

### Windows (via WSL)
```bash
sudo apt install -y git
```

### Linux
```bash
sudo apt install -y git    # Ubuntu/Debian
sudo dnf install -y git    # Fedora/RHEL
sudo pacman -S git         # Arch
```

### macOS
```bash
brew install git
```

## Step 3: Configure Git

Run these commands to set your name and email (replace with your own):

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Verify the configuration:
```bash
git config --global --list
```

## Step 4: (Optional) Set Up SSH Keys for GitHub

SSH keys let you connect to GitHub securely without typing your password every time.

### Generate an SSH Key

```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```

Press Enter to accept the default location. Then enter a passphrase (optional — just press Enter twice to skip).

### Add SSH Key to GitHub

1. Copy the key to your clipboard:
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```
2. Copy the output (it starts with `ssh-ed25519...`)
3. Go to https://github.com/settings/keys
4. Click "New SSH key"
5. Paste the key and click "Add SSH key"

## Step 5: Test Git

```bash
git config --list
echo "Git is working! You're all set."
```

## Troubleshooting

### "git: command not found"
- Git is not installed. Run the installation commands above.

### "fatal: unable to access..."
- Your Git configuration might be incomplete. Run the configuration commands in Step 3.

### SSH connection refused
- Make sure you've added your SSH key to GitHub.
- Try `ssh -T git@github.com` to test the connection.