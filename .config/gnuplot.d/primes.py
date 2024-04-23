#!/usr/bin/env python

def sieve(n):
    ps = [True]*n
    it = 1
    while it * it < n:
        it = it + 1
        if not ps[it]: continue
        jt = 2
        while it * jt < n:
            ps[it*jt] = False
            jt = jt + 1
    return ps

if __name__ == '__main__':
    ps = sieve(1000000)
    for ix, p in enumerate(ps):
        if p: print(ix) 
