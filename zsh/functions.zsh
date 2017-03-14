#!/bin/bash

# Create a new directory and enter it
md() {
	mkdir -p "$@" && cd "$@"
}

# List globally installed npm packages

npmls() {
	npm ls -gp | awk -F/ '/node_modules/ && !/node_modules.*node_modules/ {print $NF}'
}