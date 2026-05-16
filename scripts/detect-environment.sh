#!/usr/bin/env bash
set -Eeuo pipefail

# Environment Detection Script
# Outputs a JSON report of the user's development environment.
# Used by Cline to determine the correct guidance for setup.

# Detect operating system
detect_os() {
  local os
  os=$(uname -s)
  case "$os" in
    Linux*)  echo "linux" ;;
    Darwin*) echo "macos" ;;
    *MSW*|*MINGW*|*CYGWIN*) echo "windows" ;;
    *)       echo "unknown" ;;
  esac
}

# Detect if running in WSL
detect_wsl() {
  if [[ -f /proc/version ]] && grep -qi microsoft /proc/version 2>/dev/null; then
    echo "wsl"
  else
    echo ""
  fi
}

# Detect WSL distro name
detect_wsl_distro() {
  if [[ -f /proc/version ]] && grep -qi microsoft /proc/version 2>/dev/null; then
    cat /proc/version 2>/dev/null | grep -oiP '[A-Za-z]+-[0-9]+\.[0-9]+' | head -1 || echo ""
  else
    echo ""
  fi
}

# Detect shell
detect_shell() {
  local shell_name
  shell_name=$(basename "$SHELL" 2>/dev/null || echo "unknown")
  case "$shell_name" in
    bash)  echo "bash" ;;
    zsh)   echo "zsh" ;;
    pwsh|powershell) echo "powershell" ;;
    *)     echo "$shell_name" ;;
  esac
}

# Check if a command exists and return its version
check_tool() {
  local tool="$1"
  if command -v "$tool" &>/dev/null; then
    local version
    case "$tool" in
      git)      version=$(git --version 2>/dev/null | grep -oP '[\d\.]+' | head -1) ;;
      node)     version=$(node --version 2>/dev/null | grep -oP '[\d\.]+' | head -1) ;;
      npm)      version=$(npm --version 2>/dev/null | grep -oP '[\d\.]+' | head -1) ;;
      python3)  version=$(python3 --version 2>/dev/null | grep -oP '[\d\.]+' | head -1) ;;
      docker)   version=$(docker --version 2>/dev/null | grep -oP '[\d\.]+' | head -1) ;;
      jq)       version=$(jq --version 2>/dev/null | grep -oP '[\d\.]+' | head -1) ;;
      curl)     version=$(curl --version 2>/dev/null | grep -oP '[\d\.]+' | head -1) ;;
      pip3)     version=$(pip3 --version 2>/dev/null | grep -oP '[\d\.]+' | head -1) ;;
      npx)      version="included with node" ;;
      code)     version="editor" ;;
      *)        version="installed" ;;
    esac
    echo "$version"
  else
    echo ""
  fi
}

# Check if VS Code is installed
check_vscode() {
  if command -v code &>/dev/null; then
    echo "true"
  else
    echo "false"
  fi
}

# Check if running inside VS Code Remote/WSL
detect_vscode_context() {
  if [[ -n "${VSCODE_IPC_HOOK}" ]]; then
    echo "remote"
  elif [[ -n "${WSL_DISTRO_NAME}" ]]; then
    echo "wsl"
  else
    echo "local"
  fi
}

# Main detection
OS=$(detect_os)
WSL=$(detect_wsl)
WSL_DISTRO="$detect_wsl_distro"
SHELL_TYPE=$(detect_shell)

# Check tools
GIT_VERSION=$(check_tool "git")
NODE_VERSION=$(check_tool "node")
NPM_VERSION=$(check_tool "npm")
PYTHON_VERSION=$(check_tool "python3")
DOCKER_VERSION=$(check_tool "docker")
JQ_VERSION=$(check_tool "jq")
CURL_VERSION=$(check_tool "curl")
PIP_VERSION=$(check_tool "pip3")

# Check VS Code
VSCODE_INSTALLED=$(check_vscode)

# Output JSON report
cat <<EOF
{
  "os": "${OS}",
  "subsystem": "${WSL}",
  "wsl_distro": "${WSL_DISTRO}",
  "shell": "${SHELL_TYPE}",
  "vscode_context": "local",
  "vscode_installed": ${VSCODE_INSTALLED},
  "tools": {
    "git": "${GIT_VERSION}",
    "node": "${NODE_VERSION}",
    "npm": "${NPM_VERSION}",
    "python3": "${PYTHON_VERSION}",
    "docker": "${DOCKER_VERSION}",
    "jq": "${JQ_VERSION}",
    "curl": "${CURL_VERSION}",
    "pip3": "${PIP_VERSION}"
  },
  "missing_tools": [
EOF

# List missing tools
FIRST=true
for tool in git node python3 docker jq; do
  case "$tool" in
    git)      VER="$GIT_VERSION" ;;
    node)     VER="$NODE_VERSION" ;;
    python3)  VER="$PYTHON_VERSION" ;;
    docker)   VER="$DOCKER_VERSION" ;;
    jq)       VER="$JQ_VERSION" ;;
  esac
  if [[ -z "$VER" || "$VER" == "installed" ]]; then
    if [[ "$tool" == "docker" ]]; then
      # Docker is optional, don't list as missing
      continue
    fi
    if [[ "$FIRST" == "true" ]]; then
      FIRST=false
      echo "      \"$tool\""
    else
      echo "      ,\"$tool\""
    fi
  fi
done

cat <<EOF
  ],
  "ready_for_development": $(
    if [[ -n "$GIT_VERSION" && -n "$NODE_VERSION" && -n "$PYTHON_VERSION" ]]; then
      echo "true"
    else
      echo "false"
    fi
  )
}
EOF