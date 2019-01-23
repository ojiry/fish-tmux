function __is_git_repo
    if not command git rev-parse --git-dir > /dev/null 2>/dev/null
        return 1
    end
end

function __is_github_repo
    if not __is_git_repo
        return 1
    end

    if not command git config --get remote.origin.url | grep github.com > /dev/null 2>/dev/null
        return 1
    end
end

function __github_repo_name
    command git config --get remote.origin.url | sed 's/^.*github\.com[:\/]\(.*\)$/\1/' | sed 's/\.git//'
end

function __tmux_rename_window
    if not command tmux info > /dev/null ^ /dev/null
        return 1
    end

    if __is_github_repo
        command tmux rename-window (__github_repo_name)
    else if __is_git_repo
        command tmux rename-window (basename (command git rev-parse --show-toplevel))
    else
        command tmux rename-window (basename $SHELL)
    end
end
