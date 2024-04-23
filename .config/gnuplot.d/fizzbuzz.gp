#!/usr/bin/env gnuplot -persist -dc

do for [it=1:100] {
	print it, it%3 == 0 ? "fizz" : "buzz"
}
