#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

PACKAGES=(
    zsh
    nvim
)

echo "[+] Dotfiles: $DOTFILES"

if ! command -v stow >/dev/null 2>&1; then
    echo "[+] GNU Stow is not installed."

    if command -v apt-get >/dev/null 2>&1; then
        echo "[+] Installing GNU Stow..."
        sudo apt-get update
        sudo apt-get install -y stow
    else
        echo "[!] apt-get not found."
        echo "[!] Install GNU Stow manually, then run this script again."
        exit 1
    fi
fi

for package in "${PACKAGES[@]}"; do
    if [[ ! -d "$DOTFILES/$package" ]]; then
        echo "[!] Missing Stow package: $package" >&2
        exit 1
    fi
done

# Ensure ~/.config exists so Stow does not need to replace it
# with a symlink when deploying the first configuration package.
mkdir -p "$HOME/.config"

cd "$DOTFILES"

echo "[+] Deploying packages:"
printf '    - %s\n' "${PACKAGES[@]}"

stow --restow "${PACKAGES[@]}"

echo "[+] Dotfiles deployment complete."
