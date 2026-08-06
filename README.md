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
| Navigation  | [zoxide](https://github.com/ajeetdsouza/zoxide)   | cd-based fuzzy nav |
| File pager  | [bat](https://github.com/sharkdp/bat)             | cat               |
| AI TUI      | [opencode](https://opencode.ai)                   | —                 |

Toolchain: Homebrew, Volta (Node), Go toolchain, OrbStack (Docker).
All wired up in `~/.config/fish/config.fish` (see below). Font: **JetBrainsMono
Nerd Font** (13pt).

### Look & feel

- Terminal (OneHalfDark palette), background image + blending:
  `~/.config/ghostty/config`
- Prompt: Catppuccin Mocha powerline preset in starship
  (`~/.config/starship.toml`), with `cmd_duration.show_notifications = false`
  — the macOS notification call blocked the prompt ~2s after any >45s command
- opencode theme: `.config/opencode/themes/onehalfdark-transparent.json`
  (transparent chat pane, opaque dialogs), selected via `tui.json`

### Shell speed

- `~/.gitconfig` (not committed) enables git perf settings globally, so the
  `git status` starship runs on every prompt is ~50ms even in huge repos.
  The fsmonitor daemon auto-starts per repo on the first git command:

  ```sh
  git config --global core.fsmonitor true
  git config --global core.untrackedCache true
  ```

### Aliases

`fish/conf.d/aliases.fish` carries `ld`/`lg` (lazydocker/lazygit) plus the
common oh-my-zsh git-plugin shortcuts (`gst`, `gco`, `gcb`, `gp`, `glog`, …)
as fish abbreviations. `gcm`/`grbm`/`gpsup` are functions that detect the
repo's main branch via `fish/functions/git_main_branch.fish`.

`zoxide` (loaded in `config.fish`) provides `z` (smart `cd` that learns your
favorites), `zi` (interactive picker) and `zq`/`zoxide` (direct query).

`bat` replaces `cat` (`alias cat bat` in `aliases.fish`), using the `OneHalfDark`
theme set in `config.fish` to match Ghostty; auto-toggles line numbers off for
pipes/redirects.

## Layout

```
.config/
├── ghostty/config                 # colors, font, lofi background image
├── fish/
│   ├── config.fish                # brew, PATH, volta, pnpm, orbstack, zoxide, starship, bat
│   ├── conf.d/aliases.fish        # ld/lg + omz-style git abbreviations
│   └── functions/git_main_branch.fish
├── starship.toml                  # Catppuccin Mocha prompt
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
brew install fish starship opencode zoxide bat
brew install --cask ghostty

# 2. Deploy configs (mirror structure matches $HOME)
#    cp -r .config/* ~/.config/   (or symlink individual files)
cp .config/ghostty/config ~/.config/ghostty/config
cp .config/fish/config.fish ~/.config/fish/config.fish
mkdir -p ~/.config/fish/conf.d ~/.config/fish/functions
cp .config/fish/conf.d/aliases.fish ~/.config/fish/conf.d/
cp .config/fish/functions/git_main_branch.fish ~/.config/fish/functions/
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
