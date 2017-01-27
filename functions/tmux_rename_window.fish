function tmux_rename_window -e fish_prompt -v PWD
    if tmux info > /dev/null ^ /dev/null
        tmux rename-window (github_repository_name)
    end
end
