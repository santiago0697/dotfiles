# Homebrew (replaces .zprofile: eval "$(brew shellenv)")
/opt/homebrew/bin/brew shellenv fish | source

# PATH (replaces .zshrc go/local paths + /etc/paths.d/go)
fish_add_path $HOME/.local/bin /usr/local/go/bin $HOME/go/bin

# Volta — Node.js toolchain (replaces .zshenv)
set -gx VOLTA_HOME $HOME/.volta
fish_add_path $VOLTA_HOME/bin

# OrbStack (docker CLI integration)
if test -f ~/.orbstack/shell/init2.fish
    source ~/.orbstack/shell/init2.fish
end

# Starship prompt
if status is-interactive
    starship init fish | source
end
