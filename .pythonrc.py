# -*- encoding: utf-8 -*-
# Python Startup Script
import readline
import rlcompleter

# turn on the completer
if 'libedit' in readline.__doc__:
	readline.parse_and_bind("bind ^I rl_complete")
else:
	readline.parse_and_bind("tab: complete")

# display histories
#histfile = os.path.join(os.environ['HOME'], '.history.py')

try:
    readline.read_history_file()
except IOError:
    pass

import sys
import datetime
import atexit
readline.add_history("#_" + sys.version.split(" ")[0] + \
                     "_" + str(datetime.datetime.now()))
atexit.register(readline.write_history_file)

if sys.version_info >= (3, 0): sys.ps1 = "]]> "

del rlcompleter
del readline
del atexit
del datetime
del sys

# gnuplot.py
#from Gnuplot import Gnuplot
#from numpy import *
#from scipy import *
