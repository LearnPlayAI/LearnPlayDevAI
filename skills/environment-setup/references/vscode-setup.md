# VS Code Setup Guide

## What is VS Code?

VS Code (Visual Studio Code) is a free code editor made by Microsoft. Think of it like a word processor, but for code — it helps you write, edit, and organize files with helpful features like syntax highlighting and auto-completion.

## Step 1: Download VS Code

Go to: https://code.visualstudio.com/

Click the big blue **Download** button.

## Step 2: Install VS Code

### Windows
1. Run the downloaded `.exe` file
2. Click "Yes" when asked if you want to allow changes
3. Click "Next" through the installer (default settings are fine)
4. Click "Install"
5. Click "Finish"

### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install -y wget gnupg apt-transport-https
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [ signed-by=/etc/apt/keyrings/packages.microsoft.gpg ] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
sudo apt update
sudo apt install -y code
```

### macOS
1. Open the downloaded `.zip` file
2. Drag VS Code to your Applications folder
3. Open Applications and double-click VS Code

## Step 3: Recommended Extensions

In VS Code, click the Extensions icon on the left sidebar (or press `Ctrl+Shift+X`).

Search for and install these extensions:

### Essential Extensions
1. **Cline** — Your AI coding assistant (the one who will guide you!)
2. **GitLens** — See who changed what in your code (helps with team projects)
3. **ESLint** — Catches JavaScript/TypeScript errors early
4. **Prettier** — Automatically formats your code nicely

> Note: The Cline extension is the most important one — it's your AI partner!

## Step 4: First Time Setup

1. Open VS Code
2. Click "File" → "Open Folder"
3. Navigate to your project folder (where you cloned the template)
4. Click "Open"

That's it! You're ready to start coding with Cline.

## Troubleshooting

### VS Code won't open
- Try restarting your computer
- Check if you have enough disk space
- Make sure you downloaded the right version for your OS

### Extensions won't install
- Check your internet connection
- Try restarting VS Code
- Make sure you're connected to the internet