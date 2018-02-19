# Python Machine Learning Tutorial
# iris3.py - Naive Bayes
# 2018-02-19    PV

# Classification Naive Bayes qui suppose que chaque classe est construite à partir d'une distribution Gaussienne alignée.
# Elle n'impose pas de définir d'hyperparamètres et est très rapide.

print("iris3 - Naive Bayes")

from sklearn import datasets

import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np

import seaborn as sns
import pandas as pd


iris = datasets.load_iris()
target = iris.target
data = iris.data

# Création du classifieur
from sklearn.naive_bayes import GaussianNB
clf = GaussianNB()

# Apprentissage
clf.fit(data, target)
GaussianNB(priors=None)

# Prédiction
result = clf.predict(data)
print(result)

# Qualité de la prédiction (simple)
print(result-target)

errors = sum(result != target) # 6 erreurs sur 150 mesures
print("Nb erreurs:", errors)
print("Pourcentage de prédiction juste:", (150-errors)*100/150) # 96 % de réussite

# Qualité de prédiction, plus avancé
from sklearn.metrics import accuracy_score
print("accuracy_score:", accuracy_score(result, target))

# Matrice de confusion
from sklearn.metrics import confusion_matrix
conf = confusion_matrix(target, result)
print(conf)

# Heatmap Seaborn
sns.heatmap(conf, square=True, annot=True, cbar=False
            , xticklabels=list(iris.target_names)
            , yticklabels=list(iris.target_names))
plt.xlabel('valeurs prédites')
plt.ylabel('valeurs réelles')
#plt.show()

# Variante avec la fonction matshow de matplotlib
plt.matshow(conf, cmap='rainbow')
plt.show()

