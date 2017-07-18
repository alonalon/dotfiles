#!/bin/bash
load_file() {
	source "./lib/$1.sh" || exit 1
}

install_antigen() {
	curl -L git.io/antigen > ~/.dotfiles/zsh/antigen.zsh
}

install_brew() {
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	load_file "brew"
}

link_files() {
	DOT_FILES=(
		'shell/hushlogin'
		'shell/zshrc'
		'git/gitconfig'
		'git/gitignore'
		'git/gitinclude'
		'git/gitattributes'
	)

	for file in ${DOT_FILES[@]}
	do
		src="$(pwd)/$file"
		dest="${HOME}/.$(printf "%s" "$file" | sed "s/.*\/\(.*\)/\1/g")"
		ln -s "${src}" "${dest}"
		echo "${src} symlinked to: ${dest}"
	done
}

main() {
	# Load utils
	load_file "utils"

	# Ask for sudo permissions
	ask_for_sudo

	seek_confirmation "Do you want to install antigen?"

	if is_confirmed; then
		log "Installing antigen for you..."
		install_antigen
	else
		log "Skipped installing antigen"
	fi

	if ! cmd_exists "brew"; then
		log "Installing homebrew for you..."
		install_brew
	fi

	# Add zsh to list of shells & set default
	if ! cmd_exists "zsh"; then
		log "Add zsh to list of shells & set as default"
		sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"
		sudo chsh -s /usr/local/bin/zsh
	fi

	seek_confirmation "Do you want to set osxdefaults?"

	if is_confirmed; then
		load_file "osxdefaults"
	else
		log "Skipped installing npm packages"
	fi

	# Install npm packages
	seek_confirmation "Do you want to install npm packages?"

	if is_confirmed; then
		load_file "npm"
	else
		log "Skipped installing npm packages"
	fi

	if cmd_exists "npm"; then
		mkdir -p "${HOME}/.npm-packages"
		npm config set prefix "${HOME}/.npm-packages"
	fi

	# Link files
	seek_confirmation "Warning: this will overwrite your current dotfiles. Continue?"

	if is_confirmed; then
		link_files
	else
		exit
	fi
}

main
