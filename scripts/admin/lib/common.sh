#!/usr/bin/env bash
# Shared helpers for admin scripts

check_docker() {
    if ! command -v docker &> /dev/null; then
        echo "ERROR: docker is not installed"
        exit 1
    fi
}

check_compose() {
    if ! docker compose version &> /dev/null; then
        echo "ERROR: docker compose is not available"
        exit 1
    fi
}

confirm_action() {
    local msg="$1"
    read -rp "${msg} (y/N): " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo "Aborted"
        exit 0
    fi
}
