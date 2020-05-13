#/usr/bin/env tclsh

proc gp { cmds } {
	gnuplot -de $cmds
}
proc pt { str } {
	puts $str
}

pt $argv1
