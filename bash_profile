export PATH="/usr/local/bin:$PATH"
# Colorize the Terminal
export CLICOLOR=1;

# Git tab completion
source ~/git-completion.bash

# Display git branch
# function parse_git_branch() {
#   [ -d .git ] || return 1
#   git_status="$(git status 2> /dev/null)"
#   branch_pattern="^# On branch ([^${IFS}]*)"
#   remote_pattern="# Your branch is (.*) of"
#   diverge_pattern="# Your branch and (.*) have diverged"
#   if [[ ! ${git_status}} =~ "working directory clean" ]]; then
#     state="*"
#   fi
 
#   # add an else if or two here if you want to get more specific
#   if [[ ${git_status} =~ ${remote_pattern} ]]; then
#     if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
#       remote="↑"
#     else
#       remote="↓"
#     fi
#   fi
#   if [[ ${git_status} =~ ${diverge_pattern} ]]; then
#     remote="↕"
#   fi
#   if [[ ${git_status} =~ ${branch_pattern} ]]; then
#     branch=${BASH_REMATCH[1]}
#     echo " [${branch}${state}${remote}]"
#   fi
# }
function parse_git_dirty() {
	[[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}

function parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

# ============================================================================
# KEYBOARD CONFIG
# ============================================================================
# Disable press-and-hold for keys in favor of key repeat
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
# defaults write NSGlobalDomain KeyRepeat -int 0
# ============================================================================

export PS1='\[\033[0;32m\]\w\[\033[0m\][$(parse_git_branch)]$ '
export PATH=$PATH:/usr/local/Cellar/android-sdk/22.6.2/tools:/usr/local/Cellar/android-sdk/22.6.2/platform-tools:$HOME
export ANDROID_HOME=$HOME/DevTools/AndroidDev/sdk

alias ls='ls -aFhlG'
alias clean_dbs='rake db:drop && rake db:create:all && rake db:migrate && rake db:test:prepare'
alias find_here='grep -RnisI'
alias be='bundle exec'
alias ssh='/Users/aantillon/ssh-ident/ssh-ident'
alias launch_redis='redis-server /usr/local/etc/redis.conf'
alias my_ip='curl wtfismyip.com/json'
alias launch_server='python -m SimpleHTTPServer'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export DEVELOPMENT_LOANHERO_DATABASE_URL="localhost"
export DEVELOPMENT_LOANHERO_DATABASE_NAME="loanhero_dev"
export DEVELOPMENT_LOANHERO_DATABASE_USERNAME="loanhero"
export DEVELOPMENT_LOANHERO_DATABASE_PASSWORD="password"
export TEST_LOANHERO_DATABASE_URL="localhost"
export TEST_LOANHERO_DATABASE_NAME="loanhero_test"
export TEST_LOANHERO_DATABASE_USERNAME="loanhero"
export TEST_LOANHERO_DATABASE_PASSWORD="password"


