function copy_mise_config
    set dirname $argv[1]

    if which mise &> /dev/null
        set mise_cmd mise
    end
    if which rtx &> /dev/null
        set mise_cmd rtx
    end

    # Copy ~/.mise.toml or ~/.rtx.toml if it exists
    if test -f "$HOME/.$mise_cmd.toml"
        cp -v "$HOME/.$mise_cmd.toml" "$dirname"
        $mise_cmd trust "$dirname/.$mise_cmd.toml"
        return
    end

    # Copy ~/.config/mise/config.toml or ~/.config/rtx/config.toml if it exists
    if test -f "$HOME/.config/$mise_cmd/config.toml"
        cp -v "$HOME/.config/$mise_cmd/config.toml" "$dirname/.$mise_cmd.toml"
        $mise_cmd trust "$dirname/.$mise_cmd.toml"
        return
    end
end

function copy_envrc
    set dirname $argv[1]

    if test -e "$HOME/.envrc"
        cp -v "$HOME/.envrc" "$dirname"
    end

    direnv allow "$dirname/.envrc"
end


function tmpdir
    set dirname "/tmp/$(random 1000000 9009999)"

    mkdir -pv "$dirname"

    copy_mise_config "$dirname"
    copy_envrc "$dirname"

    cd "$dirname"
end
