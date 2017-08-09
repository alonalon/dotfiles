#!/bin/bash

# Create a new directory and enter it
md() {
	mkdir -p "$@" && cd "$@"
}

# List globally installed npm packages
npmls() {
	npm ls -gp | awk -F/ '/node_modules/ && !/node_modules.*node_modules/ {print $NF}'
}

# `s` with no arguments opens the current directory in Sublime Text, otherwise opens the given location
function s() {
	if [ $# -eq 0 ]; then
		subl .;
	else
		subl "$@";
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
