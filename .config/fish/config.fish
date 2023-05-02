set -x EDITOR vim
set -x GOPATH ~/.local/go


function last_history_item
	echo $history[1]
end


if status is-interactive
	rtx activate fish | source

	abbr md mkdir
	abbr takeown sudo chown $(whoami):$(whoami)
	abbr e "xdg-open >/dev/null 2>/dev/null ."
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
	abbr dots 'git --git-dir ~/.dotfiles --work-tree ~'
end

