function tmpdir
    set dirname "/tmp/$(random 1000000 9009999)"

    mkdir -pv "$dirname"

    # Copy .mise.toml or .rtx.toml if they exist
    for file in '.mise.toml' '.rtx.toml'
        if test -f "$HOME/$file"
            cp -v "$HOME/$file" "$dirname"
            break
        end
    end

    cd "$dirname"
end
