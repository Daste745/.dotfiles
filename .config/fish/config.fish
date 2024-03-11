# Create an ssh auth sock tunnel with Windows' OpenSSH
if not ss -axn | grep -q $SSH_AUTH_SOCK
    rm -f $SSH_AUTH_SOCK
    socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"/usr/local/bin/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork & 
    disown (pidof socat)
end

# Global environment variables
set -x EDITOR vim
set -x GOPATH ~/.local/go

function last_history_item
	echo $history[1]
end

if status is-login
	# pyenv init --path | source
	rtx activate fish | source
end

if status is-interactive
	# pyenv init - | source
	rtx activate fish | source

	abbr md mkdir
	abbr takeown sudo chown -v $(whoami):$(whoami)
	abbr e "explorer.exe ."
	abbr !! --position anywhere --function last_history_item

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

	# Docker
	abbr dc docker compose
	abbr dcu docker compose up -d
	abbr dcd docker compose down
	abbr dcl docker compose logs
	abbr dcp docker compose ps
	abbr dcr docker compose run

	# Dotfiles
	# abbr dots 'git --git-dir ~/.dotfiles --work-tree ~'
end


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
