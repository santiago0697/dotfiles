# dotfiles

Personal macOS configuration. Mirrors the live config of `~` / `~/.config`
1-to-1, so every file can be copied (or symlinked) straight into place.

## Stack

Modern, speed-oriented stack (2026):

| Layer       | Tool                                              | Replaces          |
| ----------- | ------------------------------------------------- | ----------------- |
| Terminal    | [Ghostty](https://ghostty.org)                    | iTerm2            |
| Shell       | [fish](https://fishshell.com)                     | zsh               |
| Prompt      | [starship](https://starship.rs)                   | Oh My Zsh + p10k  |
| AI TUI      | [opencode](https://opencode.ai)                   | —                 |

Toolchain: Homebrew, Volta (Node), Go toolchain, OrbStack (Docker).
All wired up in `~/.config/fish/config.fish` (replaces `.zprofile` /
`.zshenv` / `/etc/paths.d`). Font: **MesloLGS NF** (13pt).

### Look & feel

Everything uses a OneHalfDark palette, so the terminal, the prompt and the
opencode TUI all blend together:

- Terminal colors, background image + blending: `~/.config/ghostty/config`
- Powerlevel10k "rainbow" recreation in starship: `~/.config/starship.toml`
  (segments: blue directory block, green git block, right side node/go/python)
- opencode theme: `.config/opencode/themes/onehalfdark-transparent.json`
  (transparent chat pane, opaque dialogs), selected via `tui.json`

## Layout

```
.config/
├── ghostty/config                 # colors, font, lofi background image
├── fish/
│   ├── config.fish                # brew, PATH, volta, orbstack, starship init
│   └── functions/fish_right_prompt.fish
├── starship.toml                  # left/right prompt definitions
└── opencode/
    ├── tui.json                   # theme selection
    └── themes/onehalfdark-transparent.json
lofi-wp.png                        # background image (repo root, 7.9 MB)
```

> `~/.config/opencode/opencode.jsonc` (MCP server config) is intentionally **not
> committed** — it contains personal access tokens. Copy it manually or use env
> vars. The theme files above are safe.

> Ghostty config references the image by absolute path
> (`/Users/santiago/Pictures/lofi-wp.png`); a copy is kept at the repo root.
> Adjust the path when deploying to another machine.

## Setup

```sh
# 1. Install the tools
brew install fish starship opencode
brew install --cask ghostty

# 2. Deploy configs (mirror structure matches $HOME)
#    cp -r .config/* ~/.config/   (or symlink individual files)
cp .config/ghostty/config ~/.config/ghostty/config
cp .config/fish/config.fish ~/.config/fish/config.fish
cp .config/fish/functions/fish_right_prompt.fish ~/.config/fish/functions/
cp .config/starship.toml ~/.config/starship.toml
mkdir -p ~/.config/opencode/themes
cp .config/opencode/tui.json ~/.config/opencode/
cp .config/opencode/themes/onehalfdark-transparent.json ~/.config/opencode/themes/

# 3. Set fish as default shell
#    Add /opt/homebrew/bin/fish to /etc/shells, then:
chsh -s /opt/homebrew/bin/fish

# 4. Install the font (MesloLGS NF) and copy lofi-wp.png to your Pictures dir
```

## Branches

- `master` — active Ghostty + fish + starship + opencode stack
- `legacy/zsh-iTerm2` — deprecated iTerm2 / zsh / Oh My Zsh / Powerlevel10k /
  tmux configuration (kept for reference and rollback)
