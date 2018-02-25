# numpychart2
# Learning numpy and graphics in Python, using fromfunction
# 2018-02-25 PV

import numpy as np
import matplotlib.pyplot as plt
from numpy import pi

s = 100
z = np.fromfunction(lambda x,y: np.cos(x/s*2*pi)*np.cos(y/s*2*pi), (s,s))
# Note that because of implementation, using math.sin or math.cos instead of np version raises an error
#  
plt.imshow(z, cmap=plt.cm.gray)
plt.show()
