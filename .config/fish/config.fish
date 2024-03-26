# WSL-only config
if test -n "$WSL_DISTRO_NAME"
    if test -x "$(which socat 2>/dev/null)"
        # Create an ssh auth sock tunnel with Windows' OpenSSH
        if not ss -axn | grep -q $SSH_AUTH_SOCK
            rm -f $SSH_AUTH_SOCK
            socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"/usr/local/bin/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &
            disown (pidof socat)
        end
    end
end


# Global environment variables
set -x EDITOR vim
set -x GOPATH ~/.local/go


function last_history_item
	echo $history[1]
end


function activate_rtx
    # rtx activate takes a few ms, so cache its output to save some time.
    if not test -e ~/.cache/rtx/activate.fish
        rtx activate --status fish > ~/.cache/rtx/activate.fish
    end
    source ~/.cache/rtx/activate.fish
end


if status is-login
    activate_rtx
end


if status is-interactive
    activate_rtx
    zoxide init fish | source

    # Misc. aliases
    ## Last command, like in bash and zsh
	abbr !! --position anywhere --function last_history_item
	abbr md mkdir
	abbr takeown sudo chown -v $(whoami):$(whoami)
	abbr e xdg-open .
    ## Shortcut to the dotfiles directory
    abbr dots cd ~/.dotfiles

    # Add verbose and interactive by default
	abbr cp cp -vi
	abbr mv mv -vi
	abbr rm rm -vi
	abbr rmdir rmdir -v
	abbr chmod chmod -v

	# Git
	abbr gs git status
	abbr ga git add
	abbr gap git add --patch
	abbr gc git commit
	abbr gd git diff
	abbr gdc git diff --cached
	abbr gl git lg
	abbr gp git push
	abbr gst git stash
	abbr gres git restore
    abbr gr git rebase
    abbr gri git rebase -i
    abbr grc git rebase --continue

	# Docker
	abbr dc docker compose
	abbr dcu docker compose up -d
	abbr dcd docker compose down
	abbr dcl docker compose logs
	abbr dcp docker compose ps
	abbr dcr docker compose run
    
    # Tmux
    abbr tl tmux ls
    abbr ta tmux attach
end


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

