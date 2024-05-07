umask 022

HISTFILE=${HOME}/.zhistory
HISTSIZE=1000
#SAVEHIST=50
setopt hist_ignore_dups hist_expire_dups_first
setopt auto_pushd notify no_beep
setopt auto_menu magic_equal_subst

PROMPT="%F{cyan}%(!|#|>)%(!|#|>)%f "
PROMPT2="%F{cyan}--%f "
RPROMPT="%{%(?|%F{white}|%F{red})%}X%f"
RPROMPT=${RPROMPT}[${SSH_CLIENT:+"%F{blue}remote:%f"}"%F{magenta}%(3~|%-1~/.../%1~|%~)%f"]

#cdpath=( ~ )
manpath=(/usr/pkg/man $MANPATH)
fpath=(${HOME}/.config/etc $fpath)
autoload -Uz conf.sh	&& conf.sh
autoload -U  incr.zsh	&& incr.zsh
autoload -Uz compinit #	&& compinit -u
autoload -Uz colors	&& colors

#function hooking.
autoload -Uz add-zsh-hook
add-zsh-hook preexec	__default_color
add-zsh-hook chpwd	__and_ls
add-zsh-hook chpwd	__pwd_title

function __default_color { print -nR ${reset_color} ; }
function __and_ls { [[ $(\ls -1 |\wc -l) -le 50 ]] && ls || echo "${fg[green]}many files exist" ; }
function __pwd_title { [[ $TERM != "screen" ]] && set_title $(abbrev_pwd) ; }
#title "$(pwd | sed "s#^$HOME#\~#;s#^\(\~*/[^/]*/\).*\(/[^/]*\)#\1...\2#")"

if [[ -z $TMUX && $- == *l* ]]; then
	TMUXID="`tmux list-sessions`"
	if [[ -z "$TMUXID" ]]; then
		tmux new-session -s main
	fi
	CREATE_NEW_SESSION="Create New Session"
	TMUXID="$TMUXID\n${CREATE_NEW_SESSION}:"
	TMUXID="`echo $TMUXID | fzf | cut -d: -f1`"
	if [[ "$TMUXID" = "${CREATE_NEW_SESSION}" ]]; then
		tmux new-session -s main
	else
		tmux attach-session -t "$TMUXID"
	fi
fi

source "$HOME/.config/venvpy/3.9/bin/activate" 

