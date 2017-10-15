
########################################################################
# Source bashrc
[ -r $HOME/.bashrc ] && source $HOME/.bashrc

########################################################################
# Paths

# Add locally installed "global" npm packages to PATH
export PATH="$HOME/.npm-packages/bin:$PATH"
export MANPATH=":$HOME/.npm-packages/share/man"

########################################################################
# Aliases

alias grep='grep --exclude="*.min.*" --exclude-dir=node_modules'

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

# Common locations
alias vimrc='vi ~/dotfiles/.vimrc'
alias profile='vi ~/.bash_profile'
alias home='cd ~'
alias sandbox='cd $HOME/go/src/github.com/DevotedHealth/core/sandbox/$USER'
alias backend='cd $HOME/go/src/github.com/DevotedHealth/core/backend'
alias frontend='cd $HOME/go/src/github.com/DevotedHealth/core/frontend/admin'

########################################################################
# Bash

# Prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$ "
# export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Bash Completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	source /usr/share/bash-completion/bash_completion

########################################################################
# Vi

export EDITOR=vim
export GIT_EDITOR=vim
export VISUAL=vim
alias vi='vim'

########################################################################
# Tmux

# If not in a tmux session, attach or create a tmux session
if [ -z "$TMUX" ]; then
	tmux attach -t work || tmux new-session -s work
fi
