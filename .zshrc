umask 022

HISTFILE=${HOME}/.zhistory
HISTSIZE=10000
SAVEHIST=10000

#cdpath=( ~ )
manpath=(/usr/pkg/man $MANPATH)

fpath=(${HOME}/.local/functions $fpath)
autoload -Uz conf.sh	&& conf.sh
autoload -Uz iab.zsh	&& iab.zsh
autoload -Uz compinit #	&& compinit
autoload -U  incr.zsh	&& incr.zsh

#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

PROMPT="%F{cyan}%(!.#.>)%(!.#.>)%f "
PROMPT2="%F{cyan}--%f "
RPROMPT="%{%(?.%F{white}.%F{red})%}X%f["${SSH_CLIENT:+"%F{blue}remote:%f"}
RPROMPT=$RPROMPT"%F{magenta}%(3~,%-1~/.../%1~,%~)%f]"

#function hookings.
autoload -Uz colors ; autoload -Uz func.zsh	&& func.zsh
autoload -Uz add-zsh-hook
add-zsh-hook preexec	__default_color
add-zsh-hook chpwd	__and_ls
add-zsh-hook chpwd	__pwd_title

