# GitHub SSH Setup Guide

## What is SSH?

SSH (Secure Shell) is a way to connect to GitHub securely without typing your username and password every time. Think of it like a special key that lets your computer talk to GitHub securely.

## Step 1: Check if You Already Have an SSH Key

Open your terminal and run:
```bash
ls ~/.ssh
```

If you see files like `id_ed25519` or `id_rsa`, you already have a key! Skip to Step 3.

If you see "No such file or directory," continue to Step 2.

## Step 2: Generate a New SSH Key

Run this command:
```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```

Replace `your.email@example.com` with your actual email.

You'll see prompts:
- **"Enter file in which to save the key"** — Just press Enter (accepts the default)
- **"Enter passphrase"** — Press Enter twice (skip passphrase for now, easier for beginners)

## Step 3: Add Your SSH Key to GitHub

### Copy the Key

Run:
```bash
cat ~/.ssh/id_ed25519.pub
```

This will print a long line starting with `ssh-ed25519...`. Copy the ENTIRE line.

### Add to GitHub

1. Go to https://github.com/settings/keys
2. Click **"New SSH key"**
3. Give it a title like "My Laptop"
4. Paste your key into the "Key" field
5. Click **"Add SSH key"**

## Step 4: Test the Connection

Run:
```bash
ssh -T git@github.com
```

You might see:
```
Hi USERNAME! You've successfully authenticated, but GitHub does not provide shell access.
```

If you see your username, congratulations — it's working!

## Step 5: Use SSH with Git

When cloning repositories, use the SSH URL:
```bash
git clone git@github.com:YOUR_USERNAME/YOUR_REPO.git
```

Instead of the HTTPS URL:
```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
```

## Troubleshooting

### "Host key verification failed"
- Run: `ssh-keyscan -H github.com >> ~/.ssh/known_hosts`

### "Permission denied (publickey)"
- Make sure you copied the entire SSH key
- Make sure you added it to GitHub
- Try: `ssh-add ~/.ssh/id_ed25519`

### "Could not open a connection to host"
- Check your internet connection
- Try again later

## Alternative: Using HTTPS with Git Credential Helper

If SSH is too complicated, you can use HTTPS instead:

```bash
git config --global credential.helper store
```

This saves your GitHub credentials so you don't have to type them every time.

When you next push to GitHub, you'll be prompted for your username and a personal access token.