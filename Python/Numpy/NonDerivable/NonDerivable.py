
# Courbe continue mais non dérivable
# 2018-03-06    PV

import numpy as np
import matplotlib.pyplot as plt

def courbe(xmin, xmax, ymin, ymax, level):
    if level==0:
        return np.array([xmin, xmax]), np.array([ymin, ymax])

    xmid = (xmin+xmax)/2.0
    ymid = ymin + (ymax-ymin)/4.0

    xleft, yleft = courbe(xmin, xmid, ymin, ymid, level-1)
    xright, yright = courbe(xmid, xmax, ymid, ymax, level-1)
    return np.append(xleft , xright[1:]), np.append(yleft, yright[1:])


for i in range(10):
    x, y = courbe(0.0, 1.0, 0.0, 1.0, i)
    plt.plot(x,y, label=str(i))
    plt.legend()

plt.title("Courbe continue mais dérivable nulle part (à la limite)")
plt.show()

