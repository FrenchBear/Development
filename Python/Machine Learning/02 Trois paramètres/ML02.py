# ML02 Trois paramètres
# Tests sur le machine learning
# Génération d'une population bimodale pour s'entraîner avec les tests de
# scikit-learn
# 2018-02-20 PV

import random
import numpy as np

import sklearn
from sklearn.naive_bayes import GaussianNB

import matplotlib.pyplot as plt
import matplotlib as mpl

import seaborn as sns
import pandas as pd



# Stats
# Hommes Poids x̄=72.2kg σ=10.6kg Taille x̄=175cm σ=7.2cm
# Femmes Poids x̄=60.6kg σ=10.8kg Taille x̄=164cm σ=6.2cm
profils = []
profils.append((72.2, 10.6, 175, 7.2, 2.6, 1.0))    # Homme à cheveux courts
profils.append((75.5, 9.3, 180, 8.2, 12.3, 6.0))    # Homme à cheveux longs
profils.append((60.6, 10.8, 164, 6.2, 5.8, 3.0))    # Femme à cheveux courts
profils.append((61.0, 10.0, 163, 5.8, 25.8, 13.0))  # Femme à cheveux longs
samples = 50


print("Début de la génération")

random.seed(123)

data = np.empty((len(profils) * samples, 3))
target = np.empty(len(profils) * samples, dtype=int)

n = 0
for ip, p in enumerate(profils):
    for i in range(samples):
        data[n, 0] = round(random.gauss(p[0], p[1]), 1)
        data[n, 1] = round(random.gauss(p[2], p[3]), 1)
        data[n, 2] = round(random.gauss(p[4], p[5]), 1)
        target[n] = ip
        n += 1

target_names = np.empty(4, dtype='<U10')
target_names[0] = 'H c courts'
target_names[1] = 'H c longs'
target_names[2] = 'F c courts'
target_names[3] = 'F c longs'

b = sklearn.utils.Bunch()
b['DESCR'] = "Poids, tailles et longueur de cheveux d'un échantillon d'hommes et de femmes à cheveux courts et cheveux longs"
b['data'] = data
b['feature_names'] = ['Poids (kg)', 'Taille (cm)', 'Cheveux (cm)']
b['target'] = target
b['target_names'] = target_names

"""
print("DESCR: ", b.DESCR)
print("data: ", b.data)
print("feature_names: ", b.feature_names)
print("target: ", b.target)
print("target_names: ", b.target_names)
"""

print("Séparation train/test")

from sklearn.model_selection import train_test_split
# split the data with 50% in each set
data_train, data_test, target_train, target_test = train_test_split(data, target, random_state=0, train_size=0.5, test_size=0.5)

"""
print("Représentation Seaborn")

sns.set()
df = pd.DataFrame(data, columns=b['feature_names'])
df['target'] = target
df['label'] = df.apply(lambda x: b['target_names'][int(x.target)], axis=1)
df.head()
sns.pairplot(df, hue='label', vars=b['feature_names'], size=2)
"""

print("Aprentissage et prédiction")

# Apprentissage
clf = GaussianNB()
clf.fit(data_train, target_train)
GaussianNB(priors=None)

# Prédiction
result = clf.predict(data_test)

# Qualité de prédiction
from sklearn.metrics import accuracy_score
print("accuracy_score:", accuracy_score(result, target_test))

# Matrice de confusion
from sklearn.metrics import confusion_matrix
conf = confusion_matrix(target_test, result)
print(conf)


print("Carte de décision")

# Nous recherchons les valeurs min/max de poids et taille
x_min, x_max = data[:, 0].min() - 1, data[:, 0].max() + 1
y_min, y_max = data[:, 1].min() - 1, data[:, 1].max() + 1

# Le tableau x contient la liste des poids pour la carte comprises entre les min/max observés, step h
h = 2
x = np.arange(x_min, x_max, h)
y = np.arange(y_min, y_max, h)
print("poids min, poids max, taille min, taille max:", x_min, x_max, y_min, y_max)
#print("x: ", x)
#print("y: ", y)

# Nous allons maintenant créer une matrice contenant toutes les points situés
# entre les valeurs minimales et maximales des poids et tailles.
# La fonction meshgrid permet d'obtenir une grille de coordonnées pour
# les valeurs des points comprises entre x_min, x_max et y_min, y_max
xx, yy = np.meshgrid(x, y)
#print("xx:", xx)
#print("yy:", yy)
# Le tableau xx contient les différentes poids répétées autant de fois que nous avons de mesures
# Inversement, le tableau yy, contient l'ensemble des tailles répétées autant de fois qu'il y a de mesures

# ravel aplatit un tableau à n dimensions en 1 tableau d'une dimension
# zip génère quant-à-elle une liste de n-uplets constituée des éléments
# du même rang de chaque liste reçue en paramètre
data_samples = list(zip(xx.ravel(), yy.ravel()))

# Visualisons le contenu du jeu de données généré
#print("jeu de données généré:", data_samples[:10])

# Ces couples de points ne sont autres que des mesures de personnes imaginaires
# comprises entre les valeurs min/max connues.
# Le but étant de déterminer leur classification pour voir l'extension des territoires
# de chacune d'elle, telle que classée par l'ordinateur
# Nous pouvons maintenant afficher ces personnes telles que l'algorithme les
# évaluerait si nous les mesurerions

# On réanalyse uniquement sur les deux premières colonnes
clf2 = GaussianNB()
clf2.fit(data[:, :2], target)

Z = clf2.predict(data_samples)

fig = plt.figure(1, figsize=(8, 4))
fig.subplots_adjust(hspace=0.4, wspace=0.4)
ax1 = plt.subplot(1,2,1)

colors = ['violet', 'yellow', 'red', 'green']
C = [colors[x] for x in Z]

ax1.scatter(xx.ravel(), yy.ravel(), c=C)
plt.xlim(xx.min() - .1, xx.max() + .1)
plt.ylim(yy.min() - .1, yy.max() + .1)
plt.xlabel('Poids (kg)')
plt.ylabel('Taille (cm)')

# Légende
for ind, s in enumerate(b.target_names):
    plt.scatter([], [], label=s, color=colors[ind])
plt.legend(scatterpoints=1, frameon=False, labelspacing=1, bbox_to_anchor=(1.8, .5) , loc="center right", title='Catégorie')


# Affichons le limites avec pcolormesh
plt.figure(2)
plt.pcolormesh(xx, yy, Z.reshape(xx.shape)) # Affiche les déductions en couleurs pour les couples x,y
# Plot also the training points
colors = ['violet', 'yellow', 'red', 'green']
C = [colors[x] for x in target]
plt.scatter(data[:, 0], data[:, 1], c=C)
plt.xlim(xx.min(), xx.max())
plt.ylim(yy.min(), yy.max())
plt.xlabel('Poids (kg)')
plt.ylabel('Taille (cm)')



plt.show()
