#!/bin/bash

set -exu
set -o pipefail

_postInstall() {
    local -r user="$1"
    local -r home="/home/$user"

    echo "Doing post-install setup for $user ($home)"

    pacman -Sy
    pacman -S --noconfirm --needed \
        fish git git-crypt vim make stow tmux htop wget zip unzip grep \
        fastfetch gnu-netcat tree httpie jq fzf wakatime zoxide hyperfine difftastic ripgrep tokei dust croc tailscale syncthing \
        postgresql-libs python-libtmux

    # Graphical apps
    pacman -S --noconfirm --needed alacritty gimp libreoffice-fresh zed code obsidian bitwarden nextcloud-client

    # Docker
    pacman -S --noconfirm --needed docker docker-buildx docker-compose 
    usermod -aG docker "$user"
    systemctl enable docker.service

    # Syncthing
    # https://github.com/syncthing/syncthing/tree/main/etc/linux-desktop
    local -r applications="$home/.local/share/applications"
    mkdir -p "$applications"
    wget https://raw.githubusercontent.com/syncthing/syncthing/refs/heads/main/etc/linux-desktop/syncthing-start.desktop -O "$applications/syncthing-start.desktop"
    wget https://raw.githubusercontent.com/syncthing/syncthing/refs/heads/main/etc/linux-desktop/syncthing-ui.desktop -O "$applications/syncthing-ui.desktop"
    chown -R "$user:$user" "$home/.local/share/applications"
    mkdir -p "$home/.config/autostart"
    cp "$applications/syncthing-start.desktop" "$home/.config/autostart"
    chown -R "$user:$user" "$home/.config/autostart"

    # Dotfiles
    rm -rfv "$home/.config/fish"  # Remove default fish config directory to avoid conflicts with .dotfiles
    su --login "$user" -c ' \
        git clone https://github.com/Daste745/.dotfiles.git .dotfiles \
        && cd .dotfiles \
        && ./install'
    # TODO)) Decrypt encrypted files

    chsh -s /usr/bin/fish "$user"

    # mise
    # https://mise.jdx.dev/installing-mise.html#https-mise-run
    su --login "$user" -c " \
        curl https://mise.run | sh \
        && fish_add_path $home/.local/bin"
}

case "$1" in
    --iso-conf* | online | offline | community) ;;  # No longer supported
    *) _postInstall "$1" ;;
esac

