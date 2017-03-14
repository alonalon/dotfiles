# PATH helper, if exists, prepend, no duplication
prepend_path() {
    if [[ -d $1 ]] && [[ ! $PATH =~ "(^|:)$1(:|$)" ]]; then
        export PATH=$1:$PATH
    fi
}

# PATH helper, if exists, append, no duplication
append_path() {
    if [[ -d $1 ]] && [[ ! $PATH =~ "(^|:)$1(:|$)" ]]; then
        export PATH=$PATH:$1
    fi
}