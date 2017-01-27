function tmux_rename_window -e fish_prompt -v PWD
    if not command tmux info > /dev/null ^ /dev/null
        return 1
    end

    if github_is_repo
        command tmux rename-window (github_repository_name)
    else if git_is_repo
        command tmux rename-window (basename git_repository_name)
    else
        command tmux rename-window (basename $SHELL)
    end
end
