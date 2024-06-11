function __open
    xdg-open $argv
end

if not command -q open
    alias open=__open
end
