# Dotfiles

Collection of configuration files for my personal and work setups.

I'm focusing on portability of all configs and an as simple as possible setup.

Components:
- Fish shell with custom functions, abbreviations and per-OS configurations
- Tmux with custom keybindings, status bar and plugins
- Basic vim configuration
- Git aliases and per-directory configurations (work, school, etc.)
- Zed editor configuration and vim-centric keymap
- Simple alacritty configuration
- Skhd cofiguration for global keyboard shortcuts on MacOS
- KDE Plasma configs for some apps (used on EndeavourOS)
- Encrypted secrets using [git-crypt](https://www.agwa.name/projects/git-crypt/)
- Install scripts for EndeavourOS and devcontainers

## Installing Dotfiles On a Clean System

Required packages:
- [git-crypt](https://www.agwa.name/projects/git-crypt/) - decrypting secret files
- [GNU stow](https://www.gnu.org/software/stow/) - symlinking dotfiles to $HOME
- [make](https://www.gnu.org/software/make/) (not neccesarily needed, but nice to have)

1. Clone the repo to a directory in `$HOME`, e.g. `~/.dotfiles`
2. Change directory into the repository: `cd .dotfiles`
3. Decrypt files: `git crypt unlock` or `git crypt unlock /path/to/symmetric/key`
4. Create symlinks to all config files: `make stow`

## Adding New Files

1. Copy the file with its full directory structure into `~/.dotfiles`
2. Run `make adopt` - this should symlink the file to the correct location
3. Add the file to git

## Adding New Encrypted Files

1. Add the file as an entry in `.gitattributes` using `filter=git-crypt diff=git-crypt`
2. Add `.gitattributes` to git
3. Copy the file with its full directory structure into `~/.dotfiles`
4. Make sure the file was encrypted: `git crypt status` (should be listed as "encrypted")
5. Run `make adopt` - this should symlink the file to the correct location
6. Add the file to git

## TODO

- Add some background job to check if the dotfiles are up to date (git fetch and a shell hook/prompt?)
- Add configuration for servers
- Windows support (mainly for powershell profile)
