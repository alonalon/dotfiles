# General
# Editor
export EDITOR="code --wait"

# Path to n
export N_PREFIX="${HOME}/.n"

# Path to npm packages
export NPM_PACKAGES="${HOME}/.npm-packages"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH

# Add `~/.npm-packages/share/man` to the `$MANPATH`
export MANPATH="${NPM_PACKAGES}/share/man:$(manpath)"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# Prepend paths
declare -a DIRS=(
	"/usr/local/bin"
	"/usr/local/sbin"
	"${N_PREFIX}/bin"
	"${NPM_PACKAGES}/bin"
	"${HOME}/bin"
)

for x in "${DIRS[@]}"; do
	[[ -d "$x" ]] && PATH="${x}:${PATH}"
done

unset DIRS
export PATH
