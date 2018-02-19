# Python Machine Learning Tutorial
# iris2.py - Data vizualisation using Seaborn
# 2018-02-19    PV

print("iris2 - Data vizualisation using Seaborn")

from sklearn import datasets

import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np

import seaborn as sns
import pandas as pd

iris = datasets.load_iris()
target = iris.target
data = iris.data

sns.set()
df = pd.DataFrame(data, columns=iris['feature_names'] )
df['target'] = target
df['label'] = df.apply(lambda x: iris['target_names'][int(x.target)], axis=1)
df.head()
sns.pairplot(df, hue='label', vars=iris['feature_names'], size=2)
plt.show()
