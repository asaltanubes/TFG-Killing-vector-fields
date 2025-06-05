import numpy as np
import matplotlib.pyplot as plt

# def runge_kutta_4(f, x0, y0, x_final, h):
#     """
#     Método de Runge-Kutta de orden 4 para resolver EDOs de la forma dy/dx = f(x, y)

#     Parámetros:
#         f       : función que representa la derivada (dy/dx = f(x, y))
#         x0      : valor inicial de x
#         y0      : valor inicial de y
#         x_final : valor final de x (hasta dónde se quiere resolver)
#         h       : tamaño de paso

#     Retorna:
#         xs      : lista de valores de x
#         ys      : lista de valores correspondientes de y
#     """
#     xs = [x0]
#     ys = [y0]

#     x = x0
#     y = y0

#     while x < x_final:
#         if x + h > x_final:
#             h = x_final - x  # ajustar último paso para no pasar el límite



#         k1 = h * f(x, y)
#         k2 = h * f(x + h / 2, y + k1 / 2)
#         k3 = h * f(x + h / 2, y + k2 / 2)
#         k4 = h * f(x + h, y + k3)

#         y += (k1 + 2*k2 + 2*k3 + k4) / 6
#         x += h

#         xs.append(x)
#         ys.append(y)

    # return xs, ys

def euler_method(f, x0, y0, yp0, x0_max, h):
    xx = []
    yy = []
    x = x0
    y = y0
    yp = yp0
    xx.append(x)
    yy.append(y)
    while x<x0_max:
        if x+h > x0_max:
            h = x0_max-x
        yp = f(x, y, yp)
        x = x+h
        y = y + yp*h
        xx.append(x)
        yy.append(y)

    return (xx, yy)
        
        
            


def metric(x):
    t, r, theta, phi = x
    return np.array([-(1-1/r), (1-1/r)**-1, r**2, r**2*np.sin(theta)**2])

def update_function(y0, u0, step):
    cmetric = metric(y0)
    E = u0[0]*cmetric[0] 
    L = u0[3]*cmetric[3]

    print(E) 
    
    def inner(tau, y, yp):
        nmetric = metric(y[0:4])    
        ut = E/nmetric[0]
        uphi =  L/nmetric[3]
        r = y[1]
        
        ur_last = yp[1]
        urn = ur_last + 1/2 * (1/r**2 + (2/r**3 - 3/r**4)*L**2)*step
        ur = np.sign(urn)*np.sqrt((1-E*ut-L*uphi)/nmetric[1])

        
        
        return np.array([ut, ur, 0, uphi])

    return inner

# rr = []
# tt = []
# solver = RK45(update_function([0, 10, np.pi/2, 0], [1, 0, 0, 0], 0.1), 0, [0, 10, np.pi/2, 0, 0, 0.1], 100, max_step=0.1, first_step=0.1)

# res = None

# for _ in range(10000):
#     state = solver.y
#     tt.append(state[0])
#     rr.append(state[1])

#     res = solver.step()


y0 = [0, 10, np.pi/2, 0]
yp0 = [1, -0.001, 0, 0]
h = 0.1
xx, yy = euler_method(update_function(y0, yp0, h), 0, y0, yp0, 1000, h)

rr = [i[1] for i in yy]
tt = [i[0] for i in yy]


# print(res)
plt.plot(tt, rr)
plt.show()