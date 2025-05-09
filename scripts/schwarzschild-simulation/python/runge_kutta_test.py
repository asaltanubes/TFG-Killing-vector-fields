from scipy.integrate import RK45

solver = RK45(lambda t, x: x, 0, [1], 10, first_step=1, max_step=1, vectorized=True)

for _ in range(100):
    print(solver.step())
    print(f"t: {solver.t} --> {solver.y}")
