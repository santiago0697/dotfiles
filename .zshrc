# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam1

#setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
#HISTSIZE=1000
#SAVEHIST=1000
#HISTFILE=~/.zsh_history

# Use modern completion system
#autoload -Uz compinit
#compinit

#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true

#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Enable prompt functions
setopt PROMPT_SUBST

# Directory movement
alias cdh="cd $HOME"
alias cdw="cd $HOME/workspace"
alias ..="cd .."

# Directory listing
alias ll="ls -la"

# Edit commonfiles
alias hosts="sudo -E vim /etc/hosts"
alias nvimrc="vim ~/.config/nvim/init.vim"
alias zshrc="vim ~/.zshrc"
alias zimrc="vim ~/.zimrc"
alias tmuxconf="vim ~/.tmux.conf"

# Git aliases
alias gs="git status -sb"
#alias gd="git diff"
# alias gc="git commit"
alias gck="git checkout"

# SSH Connections
alias sshxdebug="ssh -R 9021:localhost:9021 psscorrea@dev21.efectoled.com"
alias sshdev="ssh psscorrea@dev21.efectoled.com"
alias sshtest="ssh prsmcsltest@dev50.efectoled.com"

# Functions
function gd {
	preview="git diff $@ --color=always -- {-1}"
	git diff $@ --name-only | fzf -m --ansi --preview $preview
	return true
}

function docker_list {
	containers=$(docker ps | awk '{if (NR!=1) print $1 ": " $(NF)}')
	echo "Containers"
	echo $containers
}

#function git_prompt_info {
#	inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
#
#	if [ "$inside_git_repo" ]; then
#		current_branch=$(git branch --show-current)
#		print -P "(%{%F{yellow}%}$current_branch%{%f%})"
#	else
#		echo ""
#	fi
#}

#function prompt_exit_code {
#	local EXIT="$?"
#
#	if [ $EXIT -eq 0 ]; then
#		echo -n green
#	else
#		echo -n red
#	fi
#}

#_dir_movement_fzf() {
#	dir=$(find * -maxdepth 0 -type d -print | fzf-tmux)
#	cd "$dir"
#}

#_reverse_search() {
#	local selected_command=$(fc -rl 1 | awk '{$1="";print substr($0,2)}' | fzf-tmux)
#	LBUFFER=$selected_command
#}


# Key bindings
# zle -N _dir_movement_fzf
# bindkey '^h' _dir_movement_fzf

# zle -N _reverse_search
# bindkey '^r' _reverse_search

# Prompt
# PROMPT='%B%F{$(prompt_exit_code)}%n@%M:%f%b %F{blue}%~%f $(git_prompt_info)$ '
