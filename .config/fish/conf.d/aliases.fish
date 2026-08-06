# Personal aliases migrated from ~/.zshrc
alias ld lazydocker
alias lg lazygit

# Git shortcuts migrated from the oh-my-zsh git plugin (the common subset).
# fish abbreviations expand in place when you hit space/enter, so you still
# see the real command. Remove any you don't want, or the whole file.
abbr -a g git
abbr -a ga git add
abbr -a gaa git add --all
abbr -a gapa git add --patch
abbr -a gb git branch
abbr -a gba git branch -a
abbr -a gbd git branch -d
abbr -a gc git commit -v
abbr -a gc! git commit -v --amend
abbr -a gca git commit -v -a
abbr -a gcam git commit -a -m
abbr -a gcmsg git commit -m
abbr -a gco git checkout
abbr -a gcb git checkout -b
abbr -a gcp git cherry-pick
abbr -a gd git diff
abbr -a gds git diff --staged
abbr -a gf git fetch
abbr -a gfa git fetch --all --prune
abbr -a gl git pull
abbr -a glog git log --oneline --decorate --graph
abbr -a gloga git log --oneline --decorate --graph --all
abbr -a gm git merge
abbr -a gp git push
abbr -a gpf git push --force-with-lease
abbr -a gpf! git push --force
abbr -a gr git remote
abbr -a grv git remote -v
abbr -a grb git rebase
abbr -a grbi git rebase -i
abbr -a grbc git rebase --continue
abbr -a grba git rebase --abort
abbr -a grh git reset
abbr -a grhh git reset --hard
abbr -a gst git status
abbr -a gss git status -s
abbr -a gsta git stash push
abbr -a gstp git stash pop
abbr -a gstl git stash list
abbr -a gsw git switch
abbr -a gswc git switch -c

# Dynamic ones (need the repo's main branch name at run time)
function gcm --description "git checkout main branch"
    git checkout (git_main_branch) $argv
end
function grbm --description "git rebase onto main branch"
    git rebase (git_main_branch) $argv
end
function gpsup --description "git push and set upstream to current branch"
    git push --set-upstream origin (git branch --show-current) $argv
end
