# Python Machine Learning Tutorial
# iris4.py - Naive Bayes en séparant les données en jeu d'apprentissage et jeu de tests
# 2018-02-19    PV

# Classification Naive Bayes qui suppose que chaque classe est construite à partir d'une distribution Gaussienne alignée.
# Elle n'impose pas de définir d'hyperparamètres et est très rapide.

print("iris4 - Naive Bayes en séparant les données en jeu d'apprentissage et jeu de tests")

from sklearn import datasets

import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np

import seaborn as sns
import pandas as pd


iris = datasets.load_iris()
target = iris.target
data = iris.data

# Le module model_selection de Scikit-Learn propose des fonctions pour séparer le jeu de données du jeu de tests
from sklearn.model_selection import train_test_split # version 0.18.1
# split the data with 50% in each set
data_test = train_test_split(data, target, random_state=0, train_size=0.5)
data_train, data_test, target_train, target_test = data_test


# Création du classifieur
from sklearn.naive_bayes import GaussianNB
clf = GaussianNB()

# Apprentissage
clf.fit(data_train, target_train)
GaussianNB(priors=None)

# Prédiction
result = clf.predict(data_test)
#print(result)

# Qualité de prédiction, plus avancé
from sklearn.metrics import accuracy_score
print("accuracy_score:", accuracy_score(result, target_test))

# Matrice de confusion
from sklearn.metrics import confusion_matrix
conf = confusion_matrix(target_test, result)
print(conf)

# Heatmap Seaborn
sns.heatmap(conf, square=True, annot=True, cbar=False
            , xticklabels=list(iris.target_names)
            , yticklabels=list(iris.target_names))
plt.xlabel('valeurs prédites')
plt.ylabel('valeurs réelles')

