function github_repository_name -d "Get the :username/:repository_name of the current github repository"
    if not github_is_repo
        return 1
    end

    command git config --get remote.origin.url | sed 's/^.*github\.com[:\/]\(.*\)$/\1/' | sed 's/\.git//'
end
