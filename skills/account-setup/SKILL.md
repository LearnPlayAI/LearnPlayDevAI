---
name: account-setup
description: Guide users through setting up GitHub accounts, API keys, and version control connections. Use when the user needs help creating a GitHub account, connecting VS Code to GitHub, requesting an AI API key, or setting up git credentials.
---

# Account Setup Skill

## Purpose

Guide COMPLETE NON-TECHNICAL USERS through setting up the accounts and credentials they need for development:
1. GitHub account and repository creation
2. AI API key request and configuration
3. Git credential setup

## Core workflow

1. Check what accounts are already configured
2. Guide account creation for missing accounts
3. Guide credential setup for each account
4. Test connections and verify setup
5. Update `memory-bank/techContext.md` with configured accounts

## Account Checklist

| Account | Purpose | Required |
|---------|---------|----------|
| GitHub | Code hosting, version control | Yes |
| AI API Key | Connect to AI model | Yes |
| Docker Hub | Container registry (optional for now) | No |

## Step 1: Check GitHub Connection

Run:
```bash
git config --global user.name
git config --global user.email
ssh -T git@github.com 2>&1 | head -1
```

If GitHub is not connected, follow the workflow in `references/github-setup.md`.

## Step 2: Check API Key Configuration

Check if `.env` file exists with API key:
```bash
if [ -f .env ] && grep -q "AI_API_KEY" .env; then
  echo "API_KEY_CONFIGURED=true"
else
  echo "API_KEY_CONFIGURED=false"
fi
```

If API key is not configured:
1. Guide user to email jan@learnplay.co.za (template in `templates/api-key-request.txt`)
2. Help user create `.env` file with their key
3. Test the API connection

## Step 3: Guide API Key Request

Use the template in `templates/api-key-request.txt` to help the user draft their email.

## Step 4: Configure API Key

Help the user create a `.env` file:
```bash
AI_API_KEY=their_key_here
```

Test the connection:
```bash
curl -s -H "Authorization: Bearer $AI_API_KEY" \
  https://ai.learnplay.co.za/v1/models | jq .
```

## Step 5: Guide GitHub Repo Creation

After accounts are set up, guide the user through:
1. Creating a new repository on GitHub
2. Connecting it to their local project
3. Making their first commit

Reference: `references/vscode-github-connect.md`

## Important Notes

- Guide ONE account setup at a time
- Always confirm success before proceeding
- Explain what each account is used for
- Provide the email template for API key requests
- Never store API keys in git-tracked files