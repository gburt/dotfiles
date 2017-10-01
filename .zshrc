########################################################################
# Paths

# Add locally installed "global" npm packages to PATH
export PATH="$HOME/.npm-packages/bin:$PATH"
export MANPATH=":$HOME/.npm-packages/share/man"

# Go Path
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

# Node Path
export PATH="$PATH:/usr/local/node-v8.4.0-linux-x64/bin"
export EDITOR=vim

########################################################################
# User Settings

# so all our users' 'docker-compose up' don't stomp on each other
export COMPOSE_PROJECT_NAME="\$USER"

# Grep
alias grep='grep --color=auto --exclude="*.min.*" --exclude-dir=node_modules'
export GREP_COLOR='3;33'

# Language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

########################################################################
# Aliases

# Common locations
alias vimrc='vi ~/dotfiles/.vimrc'
alias zshrc='vi ~/dotfiles/.zshrc'
alias home='cd ~'
alias love='cd $HOME/go/src/github.com/DevotedHealth/core/'
alias sandbox='cd $HOME/go/src/github.com/DevotedHealth/core/sandbox/$USER'
alias backend='cd $HOME/go/src/github.com/DevotedHealth/core/backend'
alias frontend='cd $HOME/go/src/github.com/DevotedHealth/core/frontend/admin'

# Directory
alias ..='cd ..'
alias mkdir='mkdir -p'

# Git
alias g='git'
alias gd='git diff'
alias gdm='git diff master'
alias gdd='git diff HEAD'
alias gds='git diff --staged'
alias gs='git status'
alias gc='git commit'
alias gco='git checkout'
alias gl='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset" --abbrev-commit'
alias gp='git rev-parse --abbrev-ref HEAD | xargs git pull'
alias gpu='git rev-parse --abbrev-ref HEAD | xargs git push'
alias gpr='git rev-parse --abbrev-ref HEAD | awk '\''{print "master.."$1}'\'' | xargs hub compare'

########################################################################
# Zsh

# General
setopt no_beep                           # don't beep on error

# Directories
setopt auto_cd                           # cd without typing cd

# History
setopt append_history                    # Shared history between shells
setopt extended_history                  # History includes timestamp & duration           
setopt hist_ignore_all_dups              # Ignore all dups, not just previous cmd
setopt hist_ignore_space                 # Ignore cmds that start with ' '
setopt hist_reduce_blanks                # Whitespace cleanup in history
setopt hist_verify                       # Require enter before running history cmd
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Keybindings
# Take the common emacs ones then use vi bindings
bindkey "^K"      kill-whole-line                      # ctrl-k
bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^A"      beginning-of-line                    # ctrl-a  
bindkey "^E"      end-of-line                          # ctrl-e
bindkey "[B"      history-search-forward               # down arrow
bindkey "[A"      history-search-backward              # up arrow
bindkey "^D"      delete-char                          # ctrl-d
bindkey "^F"      forward-char                         # ctrl-f
bindkey "^B"      backward-char                        # ctrl-b
bindkey -v   # Default to standard vi bindings, regardless of editor string

# Prompt
autoload colors; colors
setopt prompt_subst


ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

git_dirty() {
	if ! command git diff-index --quiet HEAD 2> /dev/null; then
		echo "*"
	fi
}

git_status() {
	local git_branch="$(git_branch)"
	if [ -n "$git_branch" ]; then
		echo "%{$fg[yellow]%}${git_branch}$(git_dirty) %{$reset_color%}"
	fi
}

PROMPT='$(git_status)%{$fg[cyan]%}%~% %(?.%{$fg[white]%}.%{$fg[red]%}) ❯ %{$reset_color%}'

########################################################################
# Vi

export EDITOR=vim
export GIT_EDITOR=vim
export VISUAL=vim
alias vi='vim'


########################################################################
# Plugins

# Zsh Autocomplete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

########################################################################
# Tmux

# If not in a tmux session, attach or create a tmux session
if [ -z "$TMUX" ]; then
	tmux attach -t work || tmux new-session -s work
fi
