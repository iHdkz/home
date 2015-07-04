builtin typeset -A abbreb_dict

function expand-abbreb_dict() {
if (( CURSOR > 1 )) && [[ "$PREBUFFER" == "" && "$BUFFER[CURSOR]" != " "&& "$BUFFER[CURSOR-1]" != " " ]] ; then
    local left
    local prefix
    left=$(echo -nE "$LBUFFER" | sed -e "s/[_a-zA-Z0-9]*$//")
    prefix=$(echo -nE "$LBUFFER" | sed -e "s/.*[^_a-zA-Z0-9]\([_a-zA-Z0-9]*\)$/\1/")
    zle self-insert
    LBUFFER=$left${abbreb_dict[$prefix]:-$prefix}" "
else
    zle self-insert
fi
}

function galias() {
    abbreb_dict[${argv[1]%%'='*}]="${argv#*=}"
}

galias nl="/dev/null"
galias ot="2>&1"
galias bd="&"
galias an="&&"
galias nt="||"
galias lc="| cat"
galias lg="| grep"
galias le="| less"
galias lt="| tee"
galias tx="tar -xvf"
galias tzx="tar -xvzf"
galias tjx="tar -xvjf"
galias tzc="tar -cvzf"
galias tjc="tar -cvjf"
galias rmf="rm -f"
galias rmrf="rm -rf"
galias cl="cl /nologo /EHsc"
galias clw="cl /nologo /EHsc /Wall"
galias csc="csc /nologo"
