import numpy as np

s=['left','right']
for j in s:
    f=open(j+'_p.txt','r')
    a=eval(f.readline())
    b=eval(f.readline())
    f.close()
    p=np.polyfit(a,b,1)
    print(p)