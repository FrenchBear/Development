# Python Machine Learning Tutorial
# iris5.py - Naive Bayes, Affichage des territoires de classification
# pour toutes les combinaisons de longueurs et largeurs de sépales connues
# 2018-02-19    PV

# Classification Naive Bayes qui suppose que chaque classe est construite à partir d'une distribution Gaussienne alignée.
# Elle n'impose pas de définir d'hyperparamètres et est très rapide.

print("iris5 - Naive Bayes, Affichage des territoires de classification l*L sépales")

from sklearn import datasets

import matplotlib.pyplot as plt
import matplotlib as mpl
import numpy as np

import seaborn as sns
import pandas as pd


# On ne conserve que les longueurs/largeurs des sépales
iris = datasets.load_iris()
data = iris.data[:, :2]
target = iris.target

# Création du classifieur
from sklearn.naive_bayes import GaussianNB
clf = GaussianNB()

# Apprentissage
clf.fit(data, target)
h = .15

# Nous recherchons les valeurs min/max de longueurs/largeurs des sépales
x_min, x_max = data[:, 0].min() - 1, data[:, 0].max() + 1
y_min, y_max = data[:, 1].min() - 1, data[:, 1].max() + 1

# Le tableau x contient la liste des longueurs des sépales qui seront utilisées
# pour les tests de classification, comprises entre les min/max observés
x = np.arange(x_min, x_max, h)
y = np.arange(y_min, y_max, h)
print("x_min, x_max, y_min, y_max:", x_min, x_max, y_min, y_max)

# Nous allons maintenant créer une matrice contenant toutes les points situés
# entre les valeurs minimales et maximales des longueurs et largeurs des sépales.
# La fonction meshgrid permet d'obtenir une grille de coordonnées pour
# les valeurs des points comprises entre x_min, x_max et y_min, y_max
xx, yy = np.meshgrid(x, y)
# Le tableau xx contient les différentes longueurs répétées autant de fois
# que nous avons de mesures pour les largeurs
# Inversement, le tableau yy, contient chaque largeur répétée autant de fois
# qu'il y a de mesures différentes des longueurs

# ravel aplatit un tableau à n dimensions en 1 tableau d'une dimension
# zip génère quant-à-elle une liste de n-uplets constituée des éléments
# du même rang de chaque liste reçue en paramètre
data_samples = list(zip(xx.ravel(), yy.ravel()))

# Visualisons le contenu du jeu de données généré
print("jeu de données généré:", data_samples[:10])

# Ces couples de points ne sont autres que des mesures de fleurs imaginaires
# comprises entre les valeurs min/max connues.
# Le but étant de déterminer leur espèce pour voir l'extension des territoires
# de chacune d'elle, telle que classée par l'ordinateur
# Nous pouvons maintenant afficher les espèces telles que l'algorithme les
# évaluerait si nous les mesurerions dans la nature

Z = clf.predict(data_samples)
plt.figure(1)
colors = ['violet', 'yellow', 'red']
C = [colors[x] for x in Z]

plt.scatter(xx.ravel(), yy.ravel(), c=C)
plt.xlim(xx.min() - .1, xx.max() + .1)
plt.ylim(yy.min() - .1, yy.max() + .1)
plt.xlabel('Longueur du sepal (cm)')
plt.ylabel('Largueur du sepal (cm)')
#plt.show()

# Cette image, n'est autre que votre clef de détermination: Imprimez-là et
# partez identifier les fleurs sur le terrain: mesurez les longueurs/largeurs
# de sépales, recherchez-les sur le graphique, la couleur du point vous donne
# l'espèce!


# Affichons le limites avec pcolormesh
plt.figure(2)
plt.pcolormesh(xx, yy, Z.reshape(xx.shape)) # Affiche les déductions en couleurs pour les couples x,y
# Plot also the training points
colors = ['violet', 'yellow', 'red']
C = [colors[x] for x in target]
plt.scatter(data[:, 0], data[:, 1], c=C)
plt.xlim(xx.min(), xx.max())
plt.ylim(yy.min(), yy.max())
plt.xlabel('Longueur du sepal (cm)')
plt.ylabel('Largueur du sepal (cm)');
plt.show()

