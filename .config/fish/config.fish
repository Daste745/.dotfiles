# Global environment variables
set -x EDITOR vim
set -x GOPATH ~/.local/go


function activate_mise
    # TODO)) Remove this once rtx is replaced by mise on all machines
    if which mise > /dev/null
        set -f MISE_CMD mise
    end
    if which rtx > /dev/null
        set -f MISE_CMD rtx
    end

    if test -z "$MISE_CMD"
        echo "[dotfiles] mise or rtx not found, skipping activation"
        return
    end

    # `mise activate` takes a few ms, so cache its output to save some time
    set -f MISE_CACHE_DIR ~/.cache/mise
    set -f MISE_CACHE_FILE "$MISE_CACHE_DIR/activate.fish"
    if not test -e "$MISE_CACHE_FILE"
        mkdir -p "$MISE_CACHE_DIR"
        $MISE_CMD activate --status fish > "$MISE_CACHE_FILE"
    end
    source "$MISE_CACHE_FILE"
end


if status is-login
    activate_mise
    zoxide init fish | source
end


if status is-interactive
    source ~/.config/fish/aliases.fish

    # Edit the command buffer in $EDITOR with Ctrl+X
    bind --mode insert \cX 'edit_command_buffer'
end


# Load OS-specific configurations
source ~/.config/fish/wsl.fish
source ~/.config/fish/macos.fish
