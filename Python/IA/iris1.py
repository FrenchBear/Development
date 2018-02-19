# Python Machine Learning Tutorial
# iris1.py - Data vizualisation using matplotlib
# 2018-02-19    PV

print("iris1 - Data vizualisation using matplotlib")

from sklearn import datasets

import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np


iris = datasets.load_iris()

target = iris.target
data = iris.data

fig = plt.figure(figsize=(8, 4))
fig.subplots_adjust(hspace=0.4, wspace=0.4)
ax1 = plt.subplot(1,2,1)
clist = ['violet', 'yellow', 'blue']
colors = [clist[c] for c in iris.target]
ax1.scatter(data[:, 0], data[:, 1], c=colors)
plt.xlabel('Longueur du sepal (cm)')
plt.ylabel('Largueur du sepal (cm)')
ax2 = plt.subplot(1,2,2)
ax2.scatter(data[:, 2], data[:, 3], color=colors)
plt.xlabel('Longueur du petal (cm)')
plt.ylabel('Largueur du petal (cm)')

# Légende
for ind, s in enumerate(iris.target_names):
    plt.scatter([], [], label=s, color=clist[ind])

plt.legend(scatterpoints=1, frameon=False, labelspacing=1, bbox_to_anchor=(1.8, .5) , loc="center right", title='Espèces')
plt.plot()
plt.show()

