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

install_node() {
	if ! cmd_exists "node"; then
		log "Installing Node.js…"
		curl -Ls http://git.io/n-install | N_PREFIX=${HOME}/.n bash -s -- -y latest
	fi

	if cmd_exists "npm"; then
		mkdir -p "${HOME}/.npm-packages"
		npm config set prefix "${HOME}/.npm-packages"
	fi
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
		ln -fs "${src}" "${dest}"
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

	seek_confirmation "Do you want to install node?"

	if is_confirmed; then
		install_node
	fi

	# Add zsh to list of shells & set default
	seek_confirmation "Do you want to set zsh as default shell"
	
	if is_confirmed "zsh"; then
		log "Add zsh to list of shells & set as default"
		sudo sh -c "echo "$(which zsh)" >> /etc/shells"
		sudo chsh -s $(which zsh)
	fi

	seek_confirmation "Do you want to set macosdefaults?"

	if is_confirmed; then
		./bin/macosdefaults
	else
		log "Skipped setting macosdefaults"
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
