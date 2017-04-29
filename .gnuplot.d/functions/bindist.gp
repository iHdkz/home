#
if(exists("__FUNC_C") == 0) call "functions/C.gp";

bindist(n,r,p)=C(n,r)*(p**r)*((1.0-p)**(n-r));
__FUNC_bindist = "imported";

print "import bindist(n : int, r : int, p) function.";
