# ML01 Taille et poids
# Tests sur le machine learning
# Génération d'une population bimodale pour s'entraîner avec les tests de scikit-learn
# 2018-02-20    PV

import random
import sklearn
import numpy
from sklearn.naive_bayes import GaussianNB

import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np

import seaborn as sns
import pandas as pd



# Stats
# Hommes   Poids x̄=72.2kg σ=10.6kg    Taille x̄=175cm  σ=7.2cm
# Femmes   Poids x̄=60.6kg σ=10.8kg    Taille x̄=164cm  σ=6.2cm

male_weight_average = 72.2
male_weight_stddev = 10.6
male_height_average = 175
male_height_stddev = 7.2

female_weight_average = 60.6
female_weight_stddev = 10.8
female_height_average = 164
female_height_stddev = 6.2

random.seed(123)

data = numpy.empty((100, 2))
target = numpy.empty(100, dtype=np.int16)

for i in range(50):
    data[i, 0] = round(random.gauss(male_weight_average, male_weight_stddev), 1)
    data[i, 1] = round(random.gauss(male_height_average, male_height_stddev), 1)
    data[50+i, 0] = round(random.gauss(female_weight_average, female_weight_stddev), 1)
    data[50+i, 1] = round(random.gauss(female_height_average, female_height_stddev), 1)
    target[i] = 0
    target[50+i] = 1

target_names = numpy.empty(2, dtype='<U10')
target_names[0] = 'Homme'
target_names[1] = 'Femme'

b = sklearn.utils.Bunch()
b['DESCR'] = "Poids et tailles d'un échantillon d'hommes et de femmes"
b['data'] = data
b['feature_names'] = ['Poids (kg)', 'Taille (cm)']
b['target'] = target
b['target_names'] = target_names


sns.set()
df = pd.DataFrame(data, columns=b['feature_names'] )
df['target'] = target
df['label'] = df.apply(lambda x: b['target_names'][int(x.target)], axis=1)
df.head()
sns.pairplot(df, hue='label', vars=b['feature_names'], size=2)


# Apprentissage
clf = GaussianNB()
clf.fit(data, target)
GaussianNB(priors=None)

# Prédiction
result = clf.predict(data)

# Qualité de prédiction
from sklearn.metrics import accuracy_score
print("accuracy_score:", accuracy_score(result, target))

# Matrice de confusion
from sklearn.metrics import confusion_matrix
conf = confusion_matrix(target, result)
print(conf)

plt.show()
