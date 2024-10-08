# Dotfiles

Collection of configuration files for my personal and work setups.

Components:
- Fish shell with custom functions, abbreviations and per-OS configurations
- Tmux with custom keybindings, status bar and plugins
- Basic vim configuration
- Git aliases and per-directory configurations (work, school, etc.)
- Zed editor configuration and vim-centric keymap

## Installing Dotfiles On a Clean System

- Install [GNU stow](https://www.gnu.org/software/stow/)
- Clone the repo to a directory in `$HOME`, e.g. `~/.dotfiles`
- Change directory into the repository: `cd .dotfiles`
- Run `make stow`

## Adding New Files

- Copy the file with its full directory into `~/.dotfiles`
- Run `make adopt` - this should symlink the file to the correct location
- Add the file to git

## TODO

- Add a script to install all the necessary packages for a new system
  - GNU stow
  - fish shell
  - tmux
  - vim
  - mise
