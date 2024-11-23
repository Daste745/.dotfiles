#!/bin/bash

set -ex
set -o pipefail

_postInstall() {
    local -r user="$1"
    local -r home="/home/$user"

    echo "Doing post-install setup for $user ($home)"

    pacman -Sy
    pacman -S --noconfirm --needed \
        fish git git-crypt vim make stow tmux htop wget zip unzip \
        fastfetch gnu-netcat tree httpie jq fzf zoxide hyperfine difftastic grep ripgrep tokei dust

    # Graphical apps
    pacman -S --noconfirm --needed alacritty gimp libreoffice-fresh

    # Docker
    pacman -S --noconfirm --needed docker docker-buildx docker-compose 
    usermod -aG docker "$user"
    systemctl enable docker.service

    # Dotfiles
    git clone https://github.com/Daste745/.dotfiles.git "$home/.dotfiles"
    chown -R "$user:$user" "$home/.dotfiles"
    # TODO)) Install dotfiles:
    # - Decrypt secrets
    # - make stow
}

case "$1" in
    --iso-conf* | online | offline | community) ;;  # No longer supported
    *) _postInstall "$1" ;;
esac

