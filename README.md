# Dotfiles

Collection of configuration files for my personal and work setups.

Components:
- Fish shell with custom functions, abbreviations and per-OS configurations
- Tmux with custom keybindings, status bar and plugins
- Basic vim configuration
- Git aliases and per-directory configurations (work, school, etc.)
- Zed editor configuration and vim-centric keymap
- Simple alacritty configuration
- Skhd cofiguration for global keyboard shortcuts on MacOS
- Encrypted secrets using [git-crypt](https://www.agwa.name/projects/git-crypt/)

## Installing Dotfiles On a Clean System

1. Install [GNU stow](https://www.gnu.org/software/stow/)
2. Clone the repo to a directory in `$HOME`, e.g. `~/.dotfiles`
3. Change directory into the repository: `cd .dotfiles`
4. Install [git-crypt](https://www.agwa.name/projects/git-crypt/)
5. Decrypt files: `git-crypt unlock /path/to/key`
6. Create symlinks to all config files: `make stow`

## Adding New Files

1. Copy the file with its full directory into `~/.dotfiles`
2. Run `make adopt` - this should symlink the file to the correct location
3. Add the file to git

## Adding New **Encrypted** Files

1. Add the file as an entry in `.gitattributes` using `filter=git-crypt diff=git-crypt`
2. Add `.gitattributes` to git
3. Follow steps 2-3 from [Adding New Files](#adding-new-files)

## TODO

- Make it easier and faster to boostrap dotfiles on a new system
- Add a script to install all the necessary packages for a new system
  - GNU stow
  - fish shell
  - tmux
  - vim
  - mise
  - ...
- Store secrets
- Add some background job to check if the dotfiles are up to date
- Add configuration for servers
