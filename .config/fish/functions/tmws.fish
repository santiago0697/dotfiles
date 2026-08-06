function tmws --description "Switch or create a tmux workspace (session); create groups tabs per directory"
    command -q tmux; or return 1
    command -q fzf; or return 1

    set opts --height 40% --prompt "workspace: " --header "pick a workspace, or choose ▼ new ▼ to create one"

    # Existing sessions + an explicit create entry
    set items (tmux list-sessions -F '#S' 2>/dev/null)
    set choice (printf '%s\n' $items '▸  new workspace' | fzf $opts)

    if test -z "$choice"
        return
    end

    if test "$choice" = "▸  new workspace"
        set name (basename (pwd) | string replace -a ' ' '-')
    else
        set name "$choice"
    end

    if tmux has-session -t "$name" 2>/dev/null
        tmux attach -t "$name"
    else
        tmux new-session -d -s "$name" -c (pwd)
        tmux attach -t "$name"
    end
end