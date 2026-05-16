# Install VS Code Guide

## What is VS Code?

VS Code (Visual Studio Code) is a free program that helps you write and organize code. Think of it like a word processor for programmers — it has features like:
- Syntax highlighting (colors make code easier to read)
- Auto-completion (suggests code as you type)
- Built-in terminal (run commands without leaving the app)

## Windows Installation

1. Download VS Code: https://code.visualstudio.com/
2. Double-click the downloaded file
3. Click "Next" through the installer (accept defaults)
4. Click "Install"
5. Click "Finish"
6. Open VS Code

## Linux Installation (Ubuntu/Debian)

Open your terminal and run:

```bash
sudo apt update
sudo apt install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [ signed-by=/etc/apt/keyrings/packages.microsoft.gpg ] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
sudo apt update
sudo apt install -y code
```

## macOS Installation

1. Download VS Code: https://code.visualstudio.com/
2. Open the downloaded `.zip` file
3. Drag VS Code to your Applications folder
4. Open Applications and double-click VS Code

## Verify Installation

After installing, open VS Code and you should see the home screen. If you see it, congratulations — VS Code is installed!

## Troubleshooting

### VS Code won't open
- Try restarting your computer
- Make sure you downloaded the right version for your OS
- Check that you have enough disk space

### "Permission denied" during Linux install
- Make sure you use `sudo` for the installation commands
- Enter your password when prompted (characters won't show — just type and press Enter)