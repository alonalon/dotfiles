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

#Reload alias
alias reload!='. ~/.zshrc'

# OSX specific aliases
alias showFiles='defaults write com.apple.finder AppleShowAllFiles TRUE;killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles FALSE;killall Finder'
