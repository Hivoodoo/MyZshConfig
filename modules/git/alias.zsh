#
# Defines Git aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Settings
#
#

# Log
zstyle -s ':prezto:module:git:log:medium' format '_git_log_medium_format' \
  || _git_log_medium_format='%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
zstyle -s ':prezto:module:git:log:oneline' format '_git_log_oneline_format' \
  || _git_log_oneline_format='%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
zstyle -s ':prezto:module:git:log:brief' format '_git_log_brief_format' \
  || _git_log_brief_format='%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'

_git_log_oyhy_format='%C(bold)Commit:%C(reset) %C(green)%h%C(bold) by:%C(reset) %C(cyan)%an %C(bold)%C(blue)(%ar)%C(reset) %C(red)%d%n%+B'


# Status
zstyle -s ':prezto:module:git:status:ignore' submodules '_git_status_ignore_submodules' \
  || _git_status_ignore_submodules='none'

#
# Aliases
#

################################ Git ################################
alias g='git'

################ Branch (b) ################
alias gb='git branch'
alias gbc='git checkout -b'
alias gbl='git branch -v'
# git branch --verbose show local AND remote.
alias gbL='git branch -av'

# git branch delete a merged one.
alias gbx='git branch -d'

# git branch force delete.
alias gbX='git branch -D'

# git branch move or rename
alias gbm='git branch -m'

# git branch force move.
alias gbM='git branch -M'

# git show-branch.
alias gbs='git show-branch'

# git show-branch local AND remote.
alias gbS='git show-branch -a'

################ Commit (c) ################
alias gc='git commit'
alias gcv='git commit --verbose'
# alias gca='git commit --verbose --all'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcO='git checkout --patch'
alias gca='git commit --amend'
alias gcb='git checkout'
# alias gcF='git commit --verbose --amend'
alias gcp='git cherry-pick --ff'
# alias gcP='git cherry-pick --no-commit'
# alias gcr='git revert'
alias gcR='git reset "HEAD^"'
alias gcs='git show'
# alias gcl='git-commit-lost'

# Conflict (C)
# alias gCl='git status | sed -n "s/^.*both [a-z]*ed: *//p"'
# alias gCa='git add $(gCl)'
# alias gCe='git mergetool $(gCl)'
# alias gCo='git checkout --ours --'
# alias gCO='gCo $(gCl)'
# alias gCt='git checkout --theirs --'
# alias gCT='gCt $(gCl)'

# Data (d)
# alias gd='git ls-files'
# alias gdc='git ls-files --cached'
# alias gdx='git ls-files --deleted'
# alias gdm='git ls-files --modified'
# alias gdu='git ls-files --other --exclude-standard'
# alias gdk='git ls-files --killed'
# alias gdi='git status --porcelain --short --ignored | sed -n "s/^!! //p"'

################ Fetch (f) ################
alias gf='git fetch'
alias gfr='git fetch --recurse-submodules'
alias gfc='git clone'
alias gfm='git pull'
# alias gfr='git pull --rebase'

# Grep (g)
# alias gg='git grep'
# alias ggi='git grep --ignore-case'
# alias ggl='git grep --files-with-matches'
# alias ggL='git grep --files-without-matches'
# alias ggv='git grep --invert-match'
# alias ggw='git grep --word-regexp'

################ Index (i) ################
alias gia='git add'
# alias giA='git add --patch'
alias giu='git add --update'
alias gid='git diff --no-ext-diff --cached'
alias giD='git diff --no-ext-diff --cached --word-diff'
alias gir='git reset -- '
# alias giR='git reset --patch'
alias gix='git rm -r --cached'
alias giX='git rm -rf --cached'


################ Log (l) ################
alias gl='git log --topo-order --graph --pretty=format:${_git_log_oyhy_format}'
alias gls='git log --topo-order --graph --stat --pretty=format:${_git_log_oyhy_format}'
alias gld='git log --topo-order --stat --patch --full-diff --pretty=format:${_git_log_oyhy_format}'
alias glg='git log --topo-order --all --graph --pretty=format:${_git_log_oyhy_format}'
alias glb='git log --topo-order --pretty=format:${_git_log_brief_format}'
alias glc='git shortlog --summary --numbered'

# Merge (m)
# alias gm='git merge'
# alias gmC='git merge --no-commit'
# alias gmF='git merge --no-ff'
# alias gma='git merge --abort'
# alias gmt='git mergetool'

# Push (p)
alias gp='git push'
# alias gpf='git push --force'
# alias gpa='git push --all'
# alias gpA='git push --all && git push --tags'
# alias gpt='git push --tags'
# alias gpc='git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
# alias gpp='git pull origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'

# Rebase (r)
# alias gr='git rebase'
# alias gra='git rebase --abort'
# alias grc='git rebase --continue'
# alias gri='git rebase --interactive'
# alias grs='git rebase --skip'

# Remote (R)
# alias gR='git remote'
alias gRl='git remote --verbose'
alias gRa='git remote add'
alias gRx='git remote rm'
alias gRm='git remote rename'
# alias gRu='git remote update'
# alias gRp='git remote prune'
alias gRs='git remote show'
# alias gRb='git-hub-browse'
function gRpx {
    git remote set-url ${1} --push no-push
}

# using (s) causes frequently mistyping.
# Stash (st)
# alias gs='git stash'
# alias gsta='git stash apply'
# alias gstx='git stash drop'
# alias gsX='git-stash-clear-interactive'
# alias gstl='git stash list'
# alias gsL='git-stash-dropped'
# alias gstd='git stash show --patch --stat'
# alias gsp='git stash pop'
# alias gsr='git-stash-recover'
# alias gsts='git stash save --include-untracked'
# alias gsS='git stash save --patch --no-keep-index'
# alias gstw='git stash save --include-untracked --keep-index'

# Submodule (S)
alias gS='git submodule'
alias gSa='git submodule add'
# alias gSf='git submodule foreach'
alias gSi='git submodule init'
alias gSI='git submodule update --init --recursive'
alias gSl='git submodule status'
# alias gSm='git-submodule-move'
# alias gSs='git submodule sync'
# alias gSu='git submodule foreach git pull origin master'
# alias gSx='git-submodule-remove'

################ Working Copy (w) ################
alias gs='git status --ignore-submodules=${_git_status_ignore_submodules} --short'
## because I often mistype gws as gs.
alias gsgs='command gs "$@"'
## this is the real gs which is ghostscript
alias gws='git status --ignore-submodules=${_git_status_ignore_submodules} --short'
alias gwss='git status --ignore-submodules=${_git_status_ignore_submodules} --short --untracked-files=no'
alias gwS='git status --ignore-submodules=${_git_status_ignore_submodules}'
alias gwd='git diff' #--no-ext-diff'
alias gwD='git diff --word-diff'
alias gwr='git checkout --'
alias gwR='git reset --hard'
# alias gwc='git clean -n'
# alias gwC='git clean -f'
# alias gwx='git rm -r'
# alias gwX='git rm -rf'

