# GitHub Setup Guide

## What is GitHub?

GitHub is like a cloud storage for your code. Think of it as a "cloud save" for your project — your code is stored online so you can:
- Access it from any computer
- Never lose your work
- Share it with others
- Track changes over time

## Step 1: Create a GitHub Account

1. Go to https://github.com
2. Click "Sign up"
3. Enter your email address
4. Create a password (make it strong!)
5. Choose a username (this will be your public identity)
6. Click "Continue" through the setup questions (you can skip these)
7. Check your email for a confirmation link and click it

## Step 2: Verify Your Email

Check your email inbox (and spam folder) for a message from GitHub. Click the verification link inside.

## Step 3: Create Your First Repository

1. Log in to GitHub
2. Click the "+" icon in the top right corner
3. Select "New repository"
4. Give it a name (e.g., "my-first-app")
5. Keep it "Public" (so others can see and learn from your code)
6. Click "Create repository"

## Step 4: Connect Git to GitHub

### Option A: Using SSH (Recommended)

1. Generate an SSH key (if you don't have one):
   ```bash
   ssh-keygen -t ed25519 -C "your.email@example.com"
   ```
2. Copy the public key:
   ```bash
   cat ~/.ssh/id_ed25519.pub
   ```
3. Go to https://github.com/settings/keys
4. Click "New SSH key"
5. Give it a title (e.g., "My Laptop")
6. Paste the key and click "Add SSH key"

### Option B: Using GitHub CLI

```bash
# Install GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update && sudo apt install -y gh

# Authenticate
gh auth login
```

## Step 5: Connect Your Local Project

After setting up your repository on GitHub, connect your local project:

```bash
cd ~/myprojects/your-project
git init
git add .
git commit -m "Initial project setup"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main
```

Replace `YOUR_USERNAME` and `YOUR_REPO` with your actual GitHub username and repository name.

## Troubleshooting

### "Permission denied (publickey)"
- You need to add your SSH key to GitHub (see Option A above)

### "remote: Repository not found"
- Check that your repository name is correct
- Make sure you're using the right URL

### "fatal: not a git repository"
- You might be in the wrong directory
- Run `cd ~/myprojects/your-project` and try again