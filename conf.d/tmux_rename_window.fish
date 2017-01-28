if not command -s tmux > /dev/null
    echo "tmux: command not found. See https://tmux.github.io/"
    exit 1
end

function __tmux_rename_window_on_hook --on-event fish_prompt --on-variable PWD
    tmux_rename_window
end
