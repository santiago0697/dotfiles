function git_main_branch --description "Detect the repo's main branch name (main/master/...)"
    command git rev-parse --git-dir &>/dev/null; or return
    for ref in refs/heads/main refs/heads/master refs/heads/trunk refs/remotes/origin/main refs/remotes/origin/master
        if command git show-ref -q --verify $ref
            string split -r -m1 / $ref | tail -n1
            return
        end
    end
    echo master
end
