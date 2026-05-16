#!/usr/bin/env bash
set -Eeuo pipefail

# Verify Setup Script
# Checks if all prerequisites are met and reports gaps.

echo "=== Environment Verification ==="
echo ""

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

PASS=0
FAIL=0
WARN=0

check_tool() {
  local tool="$1"
  local required="${2:-true}"
  
  if command -v "$tool" &>/dev/null; then
    local version
    case "$tool" in
      git)      version=$(git --version 2>/dev/null | grep -oP '[\d\.]+' | head -1) ;;
      node)     version=$(node --version 2>/dev/null | grep -oP '[\d\.]+' | head -1) ;;
      npm)      version=$(npm --version 2>/dev/null | grep -oP '[\d\.]+' | head -1) ;;
      python3)  version=$(python3 --version 2>/dev/null | grep -oP '[\d\.]+' | head -1) ;;
      docker)   version=$(docker --version 2>/dev/null | grep -oP '[\d\.]+' | head -1) ;;
      jq)       version=$(jq --version 2>/dev/null | grep -oP '[\d\.]+' | head -1) ;;
      code)     version="installed" ;;
      npx)      version="linked" ;;
      *)        version="installed" ;;
    esac
    echo -e "${GREEN}✓${NC} $tool: $version"
    PASS=$((PASS + 1))
  else
    if [[ "$required" == "true" ]]; then
      echo -e "${RED}✗${NC} $tool: NOT INSTALLED (required)"
      FAIL=$((FAIL + 1))
    else
      echo -e "${YELLOW}⚠${NC} $tool: NOT INSTALLED (optional)"
      WARN=$((WARN + 1))
    fi
  fi
}

echo "--- Required Tools ---"
check_tool "git" true
check_tool "node" true
check_tool "python3" true

echo ""
echo "--- Optional Tools ---"
check_tool "docker" false
check_tool "jq" true
check_tool "code" false

echo ""
echo "--- Git Configuration ---"
if [[ -n "$(git config --global user.name 2>/dev/null)" ]]; then
  echo -e "${GREEN}✓${NC} Git user.name configured"
  PASS=$((PASS + 1))
else
  echo -e "${RED}✗${NC} Git user.name NOT configured"
  FAIL=$((FAIL + 1))
fi

if [[ -n "$(git config --global user.email 2>/dev/null)" ]]; then
  echo -e "${GREEN}✓${NC} Git user.email configured"
  PASS=$((PASS + 1))
else
  echo -e "${RED}✗${NC} Git user.email NOT configured"
  FAIL=$((FAIL + 1))
fi

echo ""
echo "--- API Configuration ---"
if [[ -f ".env" ]] && grep -q "AI_API_KEY" .env 2>/dev/null; then
  echo -e "${GREEN}✓${NC} API key configured in .env"
  PASS=$((PASS + 1))
else
  echo -e "${YELLOW}⚠${NC} API key NOT configured (required for Cline)"
  WARN=$((WARN + 1))
fi

echo ""
echo "=== Summary ==="
echo "Passed:   $PASS"
echo "Failed:   $FAIL"
echo "Warnings: $WARN"
echo ""

if [[ $FAIL -gt 0 ]]; then
  echo -e "${RED}Setup incomplete. Please install missing tools.${NC}"
  exit 1
elif [[ $WARN -gt 0 ]]; then
  echo -e "${YELLOW}Setup ready, but some items need attention.${NC}"
  exit 0
else
  echo -e "${GREEN}All checks passed! You're ready to develop.${NC}"
  exit 0
fi