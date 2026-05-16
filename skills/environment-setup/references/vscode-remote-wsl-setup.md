# VS Code Remote WSL Setup

## What is VS Code Remote - WSL?

VS Code Remote - WSL lets you use VS Code inside your WSL Linux environment. Instead of editing files on the Windows side (`/mnt/c/`), you connect VS Code directly to the WSL filesystem.

**Why does this matter?**

| Without Remote WSL | With Remote WSL |
|---|---|
| Files are on Windows (`/mnt/c/projects/`) | Files are inside WSL (`/home/user/projects/`) |
| Linux tools don't work properly | Linux tools work perfectly |
| File operations are slow (10-100x) | File operations are fast |
| Terminal runs in Windows | Terminal runs in WSL |
| npm install, make, docker may fail | Everything works as expected |

**Think of it like this:** Without Remote WSL, you're trying to cook in a French kitchen using American tools. With Remote WSL, you're actually IN the French kitchen with the right tools.

---

## Step 1: Install the Remote - WSL Extension

1. In VS Code, click the **Extensions** icon on the left sidebar (looks like 4 squares)
2. Type `Remote - WSL` in the search box
3. Find **Remote - WSL** by Microsoft
4. Click **Install**

You should see a green indicator in the bottom-left corner that says **`WSL: Ubuntu`** (or your distro name).

---

## Step 2: Open a WSL Window

After installing the extension, you need to open your project inside WSL:

### Option A: Command Palette (Easiest)

1. Press `Ctrl+Shift+P` to open the Command Palette
2. Type: `Remote-WSL`
3. Select **`Remote-WSL: New Window`**
4. A new VS Code window will open connected to WSL

### Option B: Status Bar

1. Look at the bottom-left corner of VS Code
2. Click the green icon that says **`WSL: Ubuntu`** (or similar)
3. Select **`New WSL Window...`**

---

## Step 3: Clone Your Project Inside WSL

Once you have a WSL window open, your terminal is already inside WSL. Clone your project there:

```bash
# Navigate to your home directory (not /mnt/c/)
cd ~

# Clone your project repository
git clone https://github.com/LearnPlayAI/LearnPlayDevAI.git

# Go into the project
cd LearnPlayDevAI
```

**Important:** Never work inside `/mnt/c/` — always work inside your WSL home directory (`/home/username/`).

---

## Step 4: Install Tools Inside WSL

In the WSL terminal (inside the project folder), install the required tools:

```bash
# Update package list
sudo apt update

# Install required tools
sudo apt install -y git nodejs python3 python3-pip python3-venv jq

# Verify installations
node --version
npm --version
python3 --version
git --version
```

---

## Step 5: Reopen Folder in WSL (If Already Opened)

If you already have a folder opened in VS Code (on Windows), switch it to WSL:

1. Press `Ctrl+K Ctrl+O` (or go to **File** → **Open Folder**)
2. In the left sidebar, click **`WSL: Ubuntu`**
3. Navigate to your project folder (e.g., `~/promptly-app`)
4. Click **Select Folder**
5. Click **Reopen in WSL** when prompted

---

## Step 6: Verify WSL Connection

At the bottom-left of the new VS Code window, you should see:

```
<<< WSL: Ubuntu >>>
```

Click it to see WSL connection details. You should see:

- **OS:** Linux
- **Distribution:** Ubuntu
- **Kernel:** WSL Linux kernel version
- **Architecture:** x86_64 or aarch64

---

## Troubleshooting

### "Remote - WSL extension not showing up"

1. Make sure you installed the correct extension: **Remote - WSL** by Microsoft
2. Reload VS Code: `Ctrl+Shift+P` → **Developer: Reload Window**
3. Make sure WSL is installed: `wsl --list --verbose` in PowerShell

### "WSL: Ubuntu" doesn't appear in status bar

1. Check that WSL is installed: `wsl --install -d Ubuntu` (in PowerShell as Administrator)
2. Restart VS Code completely
3. Make sure you have an Ubuntu distribution installed: `wsl --list --verbose`

### "Permission denied" when accessing files

You're trying to access WSL files from Windows VS Code (not WSL VS Code). Close the Windows VS Code window and open a new WSL window following Step 2 above.

### "Terminal is running in sh instead of bash"

WSL uses `bash` by default. If it shows `sh`, change it:
1. In the terminal, click the dropdown arrow → **Select Default Profile**
2. Choose **bash**

### "Project files appear empty after switching to WSL"

Your files are still on the Windows side. Clone the repository again inside WSL:
```bash
cd ~
git clone https://github.com/LearnPlayAI/LearnPlayDevAI.git
```

---

## Quick Reference

| Action | Command / Shortcut |
|--------|-------------------|
| Open WSL new window | `Ctrl+Shift+P` → "Remote-WSL: New Window" |
| Switch to WSL | Click green `WSL: Ubuntu` in bottom-left |
| Reopen folder in WSL | `Ctrl+K Ctrl+O` → Select WSL folder |
| Check WSL status | Click `WSL: Ubuntu` in bottom-left |
| Open WSL terminal | `Ctrl+` (backtick) — should be bash |
| List WSL distros | `wsl --list --verbose` (in PowerShell) |
| Set default WSL | `wsl --setdefault Ubuntu` (in PowerShell) |