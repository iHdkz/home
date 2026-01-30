#!/usr/bin/zsh

export FZF_TMUX="1"
export FZF_TMUX_OPTS="-p 50%"
export FZF_CTRL_R_OPTS="--reverse --preview 'echo {}' --preview-window=border-sharp,down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_COMMAND="rg --files --hidden 2> /dev/null --follow --glob '!.git/*'"
export FZF_DEFAULT_OPTS="--ansi --no-separator --no-scrollbar --reverse --border=none --color=base16"
#--color=bg+:#1c1e26,bg:#1c1e26,spinner:#ee64ac,hl:#e95678 \
#--color=fg:#d8d8d8,header:#e95678,info:#e95678,pointer:#ee64ac,input-fg:#ee64ac \
#--color=marker:#ee64ac,fg+:#d5d8da,prompt:#e9d6d8,hl+:#e95678"
export FZF_CTRL_T_COMMAND="rg --files --hidden 2> /dev/null --follow --glob '!.git/*'"
export FZF_CTRL_T_OPTS="--preview 'bat  --color=always --style=plain --line-range :100 {}' --preview-window=border-sharp,right:60%"
export FZF_ALT_C_COMMAND="fd -t d --hidden"
export FZF_ALT_C_OPTS="--preview 'eza {} -h -T -F --no-user --no-time --no-filesize --no-permissions --long | head -200' --preview-window=border-sharp,hidden:right:60% --bind '?:toggle-preview'"
export RUNEWIDTH_EASTASIAN=0
#
bindkey -r "^T"
bindkey "^R" fzf-history-widget
bindkey "^O" fzf-file-widget


fvi() {
        IFS=$'\n' files=($(fzf --height 50% --preview 'bat --color=always --style=plain {}' --preview-window=border-sharp,right:60% --query="$1" --multi --select-1 --exit-0))
        echo $files
        [[ -n "$files" ]] && ${EDITOR} "${files[@]}"
    }
fman() {
        \man -k . | fzf --height 50% -q "$1" --prompt='man> ' --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man | col -bx | bat -l man -p --color always' --preview-window=border-sharp,right:60% --bind '?:toggle-preview' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always'"
