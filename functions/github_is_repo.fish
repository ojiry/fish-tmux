function github_is_repo -d "Test if the current directory is a GitHub repository"
    if not command git rev-parse --git-dir > /dev/null ^ /dev/null
        return 1
    end

    if not command git config --get remote.origin.url | grep github.com > /dev/null ^ /dev/null
        return 1
    end
end
