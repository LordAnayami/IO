//#---- utworzenie termu "sredni" zmiennej w Spyder
//#---- lingwistycznej "wzrost"
import numpy as np
import matplotlib.pyplot as plt
wzrost=np.zeros((2,71))
for i in range(0,71):
 x=150+i
 wzrost[0,i]=x
 if x>=155 and x<=165:
 sredni=(x-155)/(165-155)
 elif x>165 and x<175:
 sredni=1
 elif x>=175 and x<=185:
 sredni=(185-x)/(185-175)
 else:
 sredni=0
 wzrost[1,i] = sredni
#---- graficzna prezentacja termu "sredni"
plt.plot(wzrost[0,:],wzrost[1,:],'r')
plt.axis([150,220,0,1.2])
plt.xlabel('wzrost [cm]')
plt.ylabel('u(wzrost)')
