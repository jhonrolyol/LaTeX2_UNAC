from numpy import sin, cos
import numpy as np
import matplotlib.pyplot as plt
import scipy.integrate as integrate
# Constantes utilizadas
G=9.81
R=0.045
M=0.19
H=0.15
I1=0.0026
I3=0.0001
def derivs(state, t):
 dydx = np.zeros_like(state)
 dydx[0] = state[1]
 dydx[1]=(I3*state[3]*state[0]*np.cos(state[2])+I3*state[3]*state[5]-2*I1*state[3]*state[0]*np.cos(state[2]))/(I1*np.sin(state[2]))
 dydx[2] = state[3]
 dydx[3]=(state[1]**2)*state[3]*np.sin(state[2])*np.cos(state[2])-(I3/I1)*((state[1]**2)*state[3]*np.sin(state[2])*np.cos(state[2])+state[1]*state[3]*state[5]*np.sin(state[2]))+state[3]*((M*G*H*np.sin(state[2]))/(I1))
 dydx[4] = state[5]
 dydx[5]=state[3]*state[0]*np.sin(state[2])-((I3*state[3]*state[0]*np.cos(state[2])+I3*state[3]*state[5]-2*I1*state[3]*state[0]*np.cos(state[2]))/(I1*np.sin(state[2])))*np.cos(state[2])
 return dydx
dt = 0.0001
t = np.arange(0.0, 5, dt)

# th1, th2, th3 son los angulos de Euler iniciales (grados)
# w1, w2, w3 son las velocidades angulares iniciales (grados por segundo)
th1=0.001
w1=0.001
th2=0.001
w2=0.001
th3=0.001
w3=0.001
# Condiciones iniciales
state = np.radians([th1,w1,th2,w2,th3,w3])
y = integrate.odeint(derivs, state, t)

# Energia total del sistema
E=(I1*(y[:,1]*np.sin(y[:,2])**2+y[:,3]**2))/2+(I3*((y[:,1]**2)*((np.cos([y[:,2]]))**2)+(y[:,5]**2)+2*y[:,1]*y[:,5]*np.cos(y[:,2])))/(2)+M*G*H*np.cos(y[:,2])

plt.subplot(2,2,1)
plt.plot(t,y[:, 4],'-c')
plt.grid()
plt.xlabel('t')
plt.ylabel('Phi')
plt.title('Phi(t) vs tiempo')
plt.subplot(2,2,2)
plt.plot(t,y[:, 5],'-r')
plt.grid()
plt.xlabel('t')
plt.ylabel('ww3')
plt.title('Velocidad angular vs tiempo')
plt.subplot(2,2,3)
plt.plot(y[:, 4],y[:, 5],'-y')
plt.grid()
plt.xlabel('Phi')
plt.ylabel('ww3')
plt.title('Velocidad angular vs Angulo')
plt.subplot(2,2,4)
plt.plot(t,E,'-c')
plt.grid()
plt.xlabel('t')
plt.ylabel('E')
plt.title('Energia vs tiempo')


plt.tight_layout()
plt.show()