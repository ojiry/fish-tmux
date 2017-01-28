function tmux_rename_window
    if not command tmux info > /dev/null ^ /dev/null
        return 1
    end

    if github_is_repo
        command tmux rename-window (github_repository_name)
    else if git_is_repo
        command tmux rename-window (basename (git_repository_root))
    else
        command tmux rename-window (basename $SHELL)
    end
end
