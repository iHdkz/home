#	stty erase $(tput kbs)
#}

zle -N self-insert self-insert-incr
zle -N vi-backward-delete-char-incr
zle -N expand-or-complete-prefix-incr
zle -N vi-cmd-mode-incr

bindkey -M viins '^[' vi-cmd-mode-incr
bindkey -M viins '^h' vi-backward-delete-char-incr
bindkey -M viins '^?' vi-backward-delete-char-incr
bindkey -M viins '^i' expand-or-complete-prefix-incr
bindkey -M viins '^n' expand-or-complete-prefix-incr

#
buffer_org=""
buffer_prd=""
cursor_org="0"
cursor_prd="0"

function limit-completion
{
	if ((compstate[nmatches] <= 1)); then
		zle -M ""
	elif ((compstate[list_lines] > 6)); then
		compstate[list]=""
		zle -M "too many matches."
	fi
}

function show-prediction
{
	if ((PENDING == 0 && CURSOR > 1)) && [[ "$PREBUFFER" == "" && "$BUFFER[CURSOR]" != " " ]]; then
		cursor_org="$CURSOR"
		buffer_org="$BUFFER"
		comppostfuncs=(limit-completion)

		zle complete-word

		cursor_prd="$CURSOR"
		buffer_prd="$BUFFER"
		if [[ "$buffer_org[1,cursor_org]" != "$buffer_prd[1,cursor_org]" ]]; then
			BUFFER="$buffer_org"
			CURSOR="$cursor_org"
			buffer_org=""
			buffer_prd=""
			cursor_org="0"
			cursor_prd="0"
		else
			CURSOR="$cursor_org"
			echo -n "\e[32m" # tput AF 2
		fi
	else
		zle -M ""
	fi
}

function remove-prediction
{
	if [[ "$BUFFER" == "$buffer_prd" ]] && ((CURSOR == cursor_org)); then
		BUFFER="$buffer_org"
	fi
	buffer_org=""
	buffer_prd=""
	cursor_org="0"
	cursor_prd="0"
}

function vi-cmd-mode-incr
{
	remove-prediction
	zle vi-cmd-mode
}

function self-insert-incr
{
	remove-prediction
	if zle .self-insert; then
		show-prediction
	fi
}

function vi-backward-delete-char-incr
{
	remove-prediction
	if zle vi-backward-delete-char; then
		show-prediction
	fi
}

function expand-or-complete-prefix-incr
{
	if [[ "$BUFFER" == "$buffer_prd" && "$CURSOR" == "$cursor_org" && "$buffer_prd" != "$buffer_org" ]]; then
		CURSOR="$cursor_prd"
		buffer_org=""
		buffer_prd=""
		cursor_org="0"
		cursor_prd="0"
		#show-prediction
		comppostfuncs=(limit-completion)
		zle list-choices
	else
		remove-prediction
		if zle expand-or-complete-prefix; then
		    #show-prediction
		fi

	fi
}

