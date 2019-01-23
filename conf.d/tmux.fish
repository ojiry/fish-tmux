if not command -s tmux > /dev/null
    echo "tmux: command not found. See https://tmux.github.io/"
    exit 1
end

function __tmux_rename_window_on_hook -e fish_prompt -s CONT -v PWD
    __tmux_rename_window
end
