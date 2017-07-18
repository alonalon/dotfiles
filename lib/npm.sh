#!/usr/bin/env bash
main() {
	declare -a PACKAGES=(
		david
		generator-nm
		yo
		xo
	)

	npm install --global "${PACKAGES[@]}"
}

main
