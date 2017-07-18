#!/usr/bin/env bash

cmd_exists() {
	if [[ $(type -P $1) ]]; then
		return 0
	fi

	return 1
}

log() {
	printf "%s\n" "$@"
}

log_warning() {
	printf "$(tput setaf 136)⚠ %s$(tput sgr0)\n" "$@"
}

seek_confirmation() {
	printf "\n"
	log_warning "$@ (y/n)"
	read -n 1
	printf "\n"
}

is_confirmed() {
	if [[ "$REPLY" =~ ^[Yy]$ ]]; then
		return 0
	fi

	return 1
}

ask_for_sudo() {
	sudo -v &> /dev/null

	while true; do
		sudo -n true
		sleep 60
		kill -0 "$$" || exit
	done &> /dev/null &
}
