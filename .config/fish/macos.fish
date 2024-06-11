function activate_brew
    set -f homebrew_cache_dir ~/.cache/brew
    set -f homebrew_cache_file "$homebrew_cache_dir/activate.fish"
    if not test -e "$homebrew_cache_file"
        mkdir -p "$homebrew_cache_dir"
        /opt/homebrew/bin/brew shellenv > "$homebrew_cache_file"
    end
    source "$homebrew_cache_file"
end


if status is-login
    if test -x /opt/homebrew/bin/brew
        activate_brew
    end
end
