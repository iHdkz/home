#
# Numeric Invaders for ZSH
#
zle -N invader
zle -N game_invader

function zle_widget_attention
{
	if ! zle ; then
		echo Type M-x game_invader
		exit 2
	fi
}

function gameline
{
	LBUFFER=$1
	RBUFFER=$2
	zle -R
}


function input_key
{
	if read -k 1 -t $timeout_sec ; then
		case "$REPLY" in
			m) mc=$[(++mc)% $#mchars]
				LBUFFER=$mchars[$[mc+1]]
				;;
			,) invader-shoot $mc $LBUFFER
				((pts+=$?))
				;;
			q) LBUFFER='' RBUFFER=''
				zle -M bye
				exit 0
				;;
		esac
	fi
}

function update
{
	if [[ $SECONDS -gt $timeout_sec ]] ; then
		local new_invader
		if ((invader_sum > 0 && invader_sum%10 == 0)) ; then
			new_invader=$mchars[-1]
			invader_sum=0
			((invs--))
		else
			new_invader=$mchars[$[RANDOM%$#mchars]]
			((invs--))
		fi
		SECONDS=0
	fi
	invader_ufo=$invader_ufo[$[-($invader_ufo-1)],-1]$new_invader
	gameline $LBUFFER "$invader_ufo | invs=${invs}:${hits}/$definvs:$pts - $invader_sum"
}

function clear_judgement
{
	if [[ $hits -gt $definvs ]] ; then
		gameline '' " Cleared!! Bonus $bonus points!"
		((pts+=bonus))
		return 0
	fi
	if [[ $invader_ufo[1] != ' ' ]] ; then
		gameline '' " You lose !! Penalty $bonus points."
		((pts-=bonus))
		return 0
	fi
}

function game_invader
{
	zle_widget_attention

	local mchars='0123456789n'

	local invader_ufo='                  '
	local invader_sum=0
	local definvs=26
	local invs=0
	local hits=0
	
	local -F SECONDS=0.0
	local timeout_sec=1.0
	while true ; do
		input_key
		update
		if clear_judgement ; then
			break
		fi
	done
	sleep 3
	eval $state
	zle -M "Game over ... $((pts+0))points"
}
function invader
{
	if ! zle ; then
		echo Type M-x invader
		return 2
	fi
	local state="RBUFFER=${RBUFFER:q} LBUFFER=${LBUFFER:q} MARK=${MARK:q}"
	local invader_ufo='                  '
	local invader_sum=0
	local definvs=26
	local invs=0
	local hits=0
	local mc=0 bonus=500
	local mchars='0123456789n'
	local -ZR 5 pts=0
	invs=$definvs
	LBUFFER=$mchars[$mc]

	local -F SECONDS=0.0
	local timeout_sec=1.0
	while true ; do
		if read -k 1 -t $timeout_sec ; then
			case "$REPLY" in
				m) mc=$[(++mc)% $#mchars]
					LBUFFER=$mchars[$[mc+1]]
					;;
				,) invader-shoot $mc $LBUFFER
					((pts+=$?))
					;;
				q) LBUFFER='' RBUFFER=''
					zle -M bye
					return 0
					;;
			esac
		fi
		update

		# Check successful end of the game
		if [[ $hits -gt $definvs ]] ; then
			LBUFFER='' RBUFFER=" Cleared!! Bonus $bonus points!"
			((pts+=bonus))
			break
		fi
		if [[ $invader_ufo[1] != ' ' ]] ; then
			LBUFFER='' RBUFFER=" You lose !! Penalty $bonus points."
			((pts-=bonus))
			break
		fi
	done
	zle -R
	sleep 3
	eval $state
	zle -M "Game over ... $((pts+0))points"
}

function invader-shoot
{
	local n="$1" ch="$2" rc=0
	local i rb="$invader_ufo"
	for ((i=1; i <= $#rb; i++)) ; do
		if [[ $rb[i] == $ch ]] ; then
			rb=' '$rb[1,$[i-1]]$rb[$[i+1],-1]
			((hits++))
			case $n in
				[0-9])
					rc=$[i*10]
					((invader_sum+=n))
					;;
				*)
					rc=300
					;;
			esac
			break
		fi
	done
	invader_ufo=$rb
	return $rc
}


