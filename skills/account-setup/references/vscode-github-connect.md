# Connect VS Code to GitHub

## What Does This Do?

This lets VS Code talk to GitHub so you can save your code online. Think of it like linking your game console to your online gaming account — it lets you save progress to the cloud!

## Option 1: Using VS Code's Built-in Git (Easiest)

### Step 1: Open the Source Control Panel

1. In VS Code, click the "Source Control" icon on the left sidebar (it looks like a branch)
2. Or press `Ctrl+Shift+G`

### Step 2: Sign in to GitHub

1. Click "Sign in to GitHub" at the top of the Source Control panel
2. A browser window will open
3. Log in to your GitHub account
4. Click "Authorize" to give VS Code permission
5. Go back to VS Code — you should see your GitHub username

### Step 3: Make Your First Commit

1. In the Source Control panel, type a message like "Initial setup"
2. Click the checkmark button to save
3. Click "Publish Branch" to push to GitHub

## Option 2: Using Git Commands

If you prefer the terminal:

```bash
# Navigate to your project
cd ~/myprojects/your-project

# Check the status
git status

# Add all files
git add .

# Save with a message
git commit -m "Initial project setup"

# Push to GitHub
git push -u origin main
```

## Option 3: Using GitHub Desktop

GitHub Desktop is a visual app that makes GitHub easy:

1. Download from https://desktop.github.com
2. Install and open it
3. Sign in with your GitHub account
4. Click "Add an Existing Repository"
5. Select your project folder
6. Click "Publish Repository"

## Verifying the Connection

### Check if Connected

```bash
# This should show your GitHub username
git remote -v
```

### Try a Test Push

```bash
git push origin main
```

If it works without errors, you're connected!

## Troubleshooting

### "Authentication failed"
- Make sure you signed in correctly
- Try signing out and signing back in
- Check that you have a GitHub account

### "Permission denied"
- Make sure your repository exists on GitHub
- Check that you're using the correct URL
- If using SSH, make sure your SSH key is added to GitHub