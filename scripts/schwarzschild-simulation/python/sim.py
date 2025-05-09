import numpy as np
from scipy.integrate import RK45
import matplotlib.pyplot as plt

def metric(x):
    t, r, theta, phi = x
    return np.array([-(1-1/r), (1-1/r)**-1, r**2, r**2*np.sin(theta)**2])

def update_function(y0, u0):
    cmetric = metric(y0)
    E = u0[0]*cmetric[0] 
    L = u0[3]*cmetric[3]

    print(E) 
    
    def inner(tau, y):
        nmetric = metric(y[0:4])    
        ut = E/nmetric[0]
        uphi =   L/nmetric[3]
        
        return np.array([ut, -np.sqrt((1-E*ut-L*uphi)/nmetric[1]), 0, uphi])

    return inner

rr = []
tt = []
solver = RK45(update_function([0, 10, np.pi/2, 0], [1, 0, 0, 0]), 0, [0, 10, np.pi/2, 0], 100, max_step=0.1, first_step=0.1)
res = None

for _ in range(10000):
    state = solver.y
    tt.append(state[0])
    rr.append(state[1])

    res = solver.step()



print(res)
plt.plot(tt, rr)
plt.show()