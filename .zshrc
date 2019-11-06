USERNAME=cp055428

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/$USERNAME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="mh"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(

)

source $ZSH/oh-my-zsh.sh

RPROMPT='$(git_prompt_info)%D{%Y.%m.%d}-%D{%H:%M:%S}'

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa_work"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

. `brew --prefix`/etc/profile.d/z.sh

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/usr/local/sbin:$PATH"

function commits_since() {
  $(`git cherry $1 | wc -l`)
}

function squash_to() {
  num_commits=`commits_since $1`
  git rebase -i HEAD~$num_commits
}

function npm-v() {
  npm view $1 versions --json
}

function lhp() {
  out="$(myip)"":$1"
  echo $out | pbcopy
  echo "copying local ip and port:\n"$out
}

#eval $(keychain --eval id_rsa_work id_rsa_personal)
#{ eval `ssh-agent`; ssh-add -A; } &>/dev/null

eval "$(ssh-agent -s)" &>/dev/null
ssh-add -K ~/.ssh/id_rsa_work &>/dev/null

# ALIASES
alias please="sudo"
alias brupdate="brew update; brew outdated; brew upgrade; brew doctor; brew cleanup"
alias npm-list-globals="npm list -g --depth=0"
alias clean-ss="rm ~/Desktop/Screen\ Shot*"
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias updatem="gem update & brupdate & upgrade_oh_my_zsh"
alias y="yarn"
alias n="npm"
alias b="bundle"
alias be="b exec"
alias bi='bundle install --jobs 3 --path vendor/bundle'
alias bi1='bundle _1.17.3_ install --jobs 3 --path vendor/bundle'
alias nr="npm run"
alias ni="npm install"
alias rmrf="rm -rf"
alias rmf="rm -f"
alias nuke-universe="rm -rf node_modules && rm -f yarn.lock package-lock.json"
alias nu="nuke-universe"
alias fuck-mcafee="sudo launchctl unload /Library/LaunchDaemons/com.mcafee.* && sudo pkill -15 VShield"
alias g="git"
alias cra="npx create-react-app"
alias fix-audio="sudo pkill coreaudiod"

# git alias
alias gs="git status"
alias gc-.="git checkout -- ."

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
# export LIBRARY_PATH=/usr/local/lib
# export PATH=$PATH:/usr/local/mysql/bin

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export PATH="$PATH:/Users/$USERNAME/.yarn/bin"
export PATH="$PATH:/usr/local/bin/python3"
export PATH="$PATH:/usr/local/bin/svn"

source /Users/$USERNAME/.rvm/scripts/rvm
