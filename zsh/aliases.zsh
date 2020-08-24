# Quick navigation aliases
alias d='cd ~/Dev/'
alias w='cd ~/Dev/Work'
alias dot='cd ~/.dotfiles/'
alias h='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias la='ls -a'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Reload alias
alias reload!='. ~/.zshrc'

# Git Aliases
alias g="git"
alias gb="git branch"
alias gbr="git br"
alias gc="git c"
alias gca="git ca"
alias gd="git d"
alias gdi="git di"
alias gl="git l"
alias gls="git ls"
alias go="git go"
alias gp="git p"
alias gpo="git po"
alias gr="git gr"
alias gra="git gra"
alias gs="git s"

# OSX specific aliases
alias showFiles='defaults write com.apple.finder AppleShowAllFiles TRUE;killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles FALSE;killall Finder'
