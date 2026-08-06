# Homebrew (replaces .zprofile: eval "$(brew shellenv)")
/opt/homebrew/bin/brew shellenv fish | source

# PATH (replaces .zshrc go/local paths + /etc/paths.d/go)
fish_add_path $HOME/.local/bin /usr/local/go/bin $HOME/go/bin

# Volta — Node.js toolchain (replaces .zshenv)
set -gx VOLTA_HOME $HOME/.volta
fish_add_path $VOLTA_HOME/bin

# Editor (replaces .zshrc EDITOR/VISUAL)
set -gx EDITOR nvim
set -gx VISUAL nvim

# pnpm (replaces .zshrc PNPM_HOME block)
set -gx PNPM_HOME $HOME/Library/pnpm
fish_add_path $PNPM_HOME

# Neovim install (replaces .zshrc ~/nvim/bin path)
fish_add_path $HOME/nvim/bin

# OrbStack (docker CLI integration)
if test -f ~/.orbstack/shell/init2.fish
    source ~/.orbstack/shell/init2.fish
end

# Starship prompt
if status is-interactive
    starship init fish | source
end

# zoxide — smart cd (z/zoxide, replaces cd-based fuzzy navigation)
if command -v zoxide >/dev/null
    zoxide init fish | source
end

# bat — cat replacement with syntax highlighting (OneHalfDark theme to match Ghostty)
if command -v bat >/dev/null
    set -gx BAT_THEME OneHalfDark
end

# fzf — fuzzy finder (Ctrl-T files, Ctrl-R history, Alt-C dirs) with OneHalfDark colors
if command -v fzf >/dev/null
    fzf --fish | source
    set -gx FZF_DEFAULT_OPTS "--color=bg:#282c34,fg:#dcdfe4,hl:#61afef,fg+:azure,hl+:blue,info:#98c379,marker:#c678dd,prompt:#61afef,spinner:#61afef,header:#dcdfe4,pointer:#c678dd,selected-bg:#474e5d,gutter:#282c34,border:#4c4c4c --height 40% --layout=reverse --border"
end
