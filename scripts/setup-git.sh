#!/usr/bin/env bash
set -Eeuo pipefail

# Git Configuration Setup Script
# Interactive script to help users configure Git credentials.

echo "=== Git Configuration Setup ==="
echo ""
echo "This will set up your Git name and email."
echo "These are used to identify you in code commits."
echo ""

# Prompt for name
read -p "Enter your full name: " GIT_NAME
if [[ -z "$GIT_NAME" ]]; then
  echo "Name cannot be empty."
  exit 1
fi

# Prompt for email
read -p "Enter your email address: " GIT_EMAIL
if [[ -z "$GIT_EMAIL" ]]; then
  echo "Email cannot be empty."
  exit 1
fi

# Set git config
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

echo ""
echo "Git configured successfully!"
echo "  Name:  $GIT_NAME"
echo "  Email: $GIT_EMAIL"
echo ""
echo "You can change these later by running this script again."