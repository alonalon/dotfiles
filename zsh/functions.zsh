#!/bin/bash

# Create a new directory and enter it
md() {
	mkdir -p "$@" && cd "$@"
}

# List globally installed npm packages
npmls() {
	npm list -g --depth 0
}

# `c` with no arguments opens the current directory in VSCode, otherwise opens the given location
function c() {
	if [ $# -eq 0 ]; then
		code .;
	else
		code "$@";
	fi;
}


# `o` with no arguments opens the current directory, otherwise opens the given location
function o() {
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}
