# Dotfiles


## Installing Dotfiles On a Clean System

- Install [GNU stow](https://www.gnu.org/software/stow/)
- Clone the repo to a directory in `$HOME`, e.g. `~/.dotfiles`
- Change directory into the repository: `cd .dotfiles`
- Run `make stow`

## Adding New Files

- Copy the file with its full directory into `~/.dotfiles`
- Run `make adopt` - this should symlink the file to the correct location
- Add the file to git

