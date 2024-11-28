function last_history_item
	echo $history[1]
end

function activate_venv
    for venv_dir in "venv" ".venv"
        if test -d "$venv_dir" -a -f "$venv_dir/bin/activate.fish"
            echo "source $venv_dir/bin/activate.fish"
            return
        end
    end
    echo "# No venv found"
end

# Misc. aliases
## Last command, like !! in bash and zsh
abbr !! --position anywhere --function last_history_item
abbr md mkdir
abbr takeown sudo chown -v $(whoami):$(whoami)
abbr e open .
## Shortcut to the dotfiles directory
abbr dots z ~/.dotfiles
# Activate a python virtual environment
abbr acv --function activate_venv

# Add verbose and interactive by default
abbr cp cp -vi
abbr mv mv -vi
abbr rm rm -vi
abbr rmdir rmdir -v
abbr chmod chmod -v

# Git
## Common
abbr gs git status
abbr gc git commit
abbr gca git commit --amend
abbr gl git lg
abbr gst git stash
## add
abbr ga git add
abbr gap git add --patch
## restore
abbr gres git restore
abbr grp git restore --patch
## push
abbr gp git push
abbr gpo git push origin @
## rebase
abbr gr git rebase
abbr gri git rebase -i
abbr grc git rebase --continue
abbr gra git rebase --abort
## diff
abbr gd git diff
abbr gdc git diff --cached
abbr gbs git branch-summary
abbr gbd git branch-diff
abbr gbm git branch-migrations

# Docker
abbr dc docker compose
abbr dcu docker compose up -d
abbr dcd docker compose down
abbr dcl docker compose logs
abbr dcp docker compose ps
abbr dcr docker compose run
abbr dcw docker compose watch

# Tmux
abbr tn tmux new-session
abbr tl tmux ls
abbr ta tmux attach
