```
$ git clone https://github.com/alonalon/dotfiles .dotfiles
```

```
# Run setup script
$ /path/to/install/setup.sh
```

```
# Add N prefix in zshrc to get node working
export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo)
```

Creates a antigen.zsh file in `.dotfiles/zsh/`
