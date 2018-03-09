#!/usr/bin/env bash
install_packages() {
	declare -a PACKAGES=(
		coreutils
		findutils
		git
		gnu-sed --with-default-names
		moreutils
		wget --with-iri
		zsh
		zsh-syntax-highlighting
	)

	brew install "${PACKAGES[@]}"
}

main() {
	# Update Homebrew
	brew update

	# Upgrade packages
	brew upgrade

	# Install packages
	install_packages

	# Remove outdated versions
	brew cleanup
}

main
