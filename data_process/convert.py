import fileinput
s=['left','right']
for ss in s:    
    a=[]
    b=[]
    i=0
    with fileinput.input(ss+'.txt') as f:
        for line in f:
            if not line[0].isdigit():
                continue
            s=line.split(': ')
            s[1]=s[1][:-1]
            a.append(int(s[0]))
            b.append(float(s[1]))
            i+=1
    g=open(ss+'_p.txt','w')
    g.write(str(a))
    g.write('\n')
    g.write(str(b))
    g.close