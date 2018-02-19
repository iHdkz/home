#/usr/bin/env python

class Prompt(object): 
	import re
	import sys

	re_parser = {	"color"	: re.compile(r'<(([a-zA-Z]+)(;|))+>'),
			"attrib": re.compile('\{([a-zA-Z\_\-]+)\}')
			}
	
	clrs = {	"reset"		:  0, "default"		: 39,
			"black"  	: 30, "red"	 	: 31,
			"green"	 	: 32, "yellow" 		: 33,
			"blue"	 	: 34, "magenta"		: 35,
			"cyan"	 	: 36, "grayLight"  	: 37,
			"grayDark"   	: 90, "redLight"  	: 91,
			"greenLight" 	: 92, "yellowLight"	: 93,
			"blueLight"	: 94, "magentaLight"	: 95,
			"cyanLight"	: 96, "white"		: 97
			}
	
	@classmethod
	def __ctrl_gen(cls, m):
		tags=m.group(0)[1:-1]
		ps=';'.join([str(cls.clrs[it]) for it in tags.split(",")])
		return '\001\033[%sm\002' % ps

	@classmethod
	def cprint(cls, text):
		return cls.re_parser["color"].sub(cls.__ctrl_gen, text)

	@classmethod
	def set_ps1(cls, pformat):
		cls.sys.ps1=cls.cprint(pformat)

        def __init__(self, pformat): self.prompt_format = pformat
	def __str__(self): return self.cprint(self.prompt_format)
	def __del__(self): del re, sys
	pass

