function y --wraps yazi
    set tmp (mktemp -t 'yazi-cwd.XXXXXX')
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        __zoxide_cd_internal -- "$cwd"
    end
    rm -f -- "$tmp"
end

