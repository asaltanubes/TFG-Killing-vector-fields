import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import RK45

rs = 1
mu = rs/2
c=1

def edo(tt, xxdxx):
    t, r, phi, tdot, rdot, phidot = xxdxx
    
    factor = 1-2*mu/r
    tddot = -2*mu/r**2*rdot*tdot/factor;
    rddot = factor*(-mu/r**2*c**2*tdot**2 + mu/(r-2*mu)**2*rdot**2 + r*phidot**2);
    phiddot = -2*rdot*phidot/r;

    return np.array([tdot, rdot, phidot, tddot, rddot, phiddot])

res = RK45(edo, 0, [0, 10, 0, np.sqrt(1/(1-rs/10)), 0, 0], 100)

tt = []
xx = []

tt.append(res.t)
xx.append(res.y)
while tt[-1] <100:
    try:
        res.step()
        tt.append(res.t)
        xx.append(res.y)
    except RuntimeError:
        break
    
xx = np.array(xx).T
print(xx.shape)
plt.plot(tt, xx[1, :])
plt.plot(xx[0, :], 0*xx[1, :] +1 )
plt.show()