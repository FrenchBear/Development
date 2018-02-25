# numpychart1
# Learning numpy and graphics in Python
# 2018-02-24 PV

import numpy as np
import matplotlib.pyplot as plt
from numpy import pi

points = np.linspace(-pi, pi, 100)

xs, ys = np.meshgrid(points, points)
# 4 graphs
z1 = np.cos(np.sqrt(xs ** 2 + ys ** 2))
z2 = np.cos(xs) * np.cos(ys)
z3 = np.cos(xs) + np.cos(ys)
z4 = np.cos(xs + ys)

z = np.vstack((np.hstack((z1, z2)), np.hstack((z3, z4))))

plt.imshow(z, cmap=plt.cm.gray)
plt.show()
