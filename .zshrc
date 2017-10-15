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
export COMPOSE_PROJECT_NAME="$USER"

# Grep
alias grep='grep --color=auto --exclude="*.min.*" --exclude-dir=node_modules'
export GREP_COLOR='3;33'

# Language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

########################################################################
# Aliases

# Named Directories
hash -d love=$HOME/go/src/github.com/DevotedHealth/core

# Common locations
alias vimrc='vi ~/dotfiles/.vimrc'
alias zshrc='vi ~/dotfiles/.zshrc'
alias home='cd ~'
alias dotfiles='cd ~/dotfiles'
alias love='cd ~love'
alias sandbox='cd ~love/sandbox/$USER'
alias backend='cd ~love/backend'
alias frontend='cd ~love/frontend/admin'
alias setup='cd ~love/aws-infrastructure/account-dev/user-setup'


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
alias gpo='git push origin'
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
bindkey "^Y"      kill-whole-line                      # ctrl-k but taken by pane movement
bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^A"      beginning-of-line                    # ctrl-a  
bindkey "^E"      end-of-line                          # ctrl-e
bindkey "^D"      delete-char                          # ctrl-d
bindkey "^F"      forward-char                         # ctrl-f
bindkey "^B"      backward-char                        # ctrl-b
bindkey -v   # Default to standard vi bindings, regardless of editor string

# Prompt
autoload colors; colors
setopt prompt_subst

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

# set VIMODE according to the current mode (default “[i]”)
VIMODE='[i]'
function zle-keymap-select {
	VIMODE="${${KEYMAP/vicmd/[n]}/(main|viins)/[i]}"
	zle reset-prompt
}
zle -N zle-keymap-select
export KEYTIMEOUT=1

PROMPT='${VIMODE} $(git_status)%{$fg[cyan]%}%~% %(?.%{$fg[white]%}.%{$fg[red]%}) ❯ %{$reset_color%}'

########################################################################
# Vi

export EDITOR=vim
export GIT_EDITOR=vim
export VISUAL=vim
alias vi='vim'


########################################################################
# Plugins

# Syntax Highlighting - must be installed before history substring
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Autocomplete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # Case insensitive tab completion

# History Substring Search
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down




########################################################################
# Tmux

# If not in a tmux or screen session
if [ -z "$TMUX" ] && [ -z "$STY" ] && [ $TERM != "screen" ]; then

	# Set up a file for tmux to pick up my ssh agent
	if [ -n "$SSH_AUTH_SOCK" ]; then
		ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
	fi

	# Start tmux (if they have a .tmux.conf) or screen (default)
	if [ -e "$HOME/.tmux.conf" ]; then 
		tmux attach -t work || tmux new-session -s work
	else
		screen -dRRS work
	fi
fi

