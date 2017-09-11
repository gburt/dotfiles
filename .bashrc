
# Aliases
alias g='git'
alias gd='git diff'
alias gdm='git diff master'
alias gdd='git diff HEAD'
alias gs='git status'
alias gc='git commit'
alias gco='git checkout'
alias gl='git log --color --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset" --abbrev-commit'
alias gp='git rev-parse --abbrev-ref HEAD | xargs git pull'
alias gpu='git rev-parse --abbrev-ref HEAD | xargs git push'
alias gpr='git rev-parse --abbrev-ref HEAD | awk '\''{print "master.."$1}'\'' | xargs hub compare'

alias vimrc='vi ~/.vimrc'
alias zshrc='vi ~/.zshrc'

# Bash Prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Use vi
export EDITOR=vim
export GIT_EDITOR=vim
export VISUAL=vim
alias vi='vim'
