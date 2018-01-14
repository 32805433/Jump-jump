import matplotlib.pyplot as plt

plt.xlim(0,240)
plt.ylim(0,1.1)
f=open('left_p.txt','r')
line=f.read()
a,b=map(eval,line.split('\n'))
plt.plot(a,b)
plt.show()