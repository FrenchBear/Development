# introot
# Calculate a square root approximation using integers and subtractions only
# 2015-09-02    FPVI
#
# Optimisations:
# - Precalculate large sums of odd numbers (for instance up to 1e6, 2e6, 3e6... to speed up the beginning)
# - Since s = 2*r+1, no need to increment both variables in the loop

"""
Idea of algorithm:
(Du boulier à la révolution numérique, Algorithmes et informatique (2010) - Vicenç Torra, page 95):

À partir de la machine de Maurel, les calculatrices introduisirent les racines
carrées en plus des opérations arithmétiques de base. L'opération racine carrée se
basait sur le développement suivant pour le carré :
1 + 3 + 5 + ... + (2x—1) = x²
Étant donné un nombre n qui est un carré parfait ; la racine carrée de n peut
être obtenue au moyen de la soustraction successive de 1, 3, 5... jusqu'à arriver au
nombre zéro.Le nombre de soustractions réalisées correspond à la racine carrée du
nombre. Par exemple, si nous prenons la racine carrée de 100, on soustrait 1,3,5,7,
9,11,13,15,17,19 ;comme on soustrait 10 nombres, la racine carrée de 100 est 10.
Lorsque n n'est pas un carré parfait, la dernière soustraction donne un nombre
négatif. Le nombre de soustractions est une approximation de la racine carrée.
Pour avoirles décimales, on peut multiplier par des puissances de 100 pour chaque
décimale que l'on souhaite obtenir. Par exemple, en multipliant 2 par 100 pour
calculer la racine carrée de 200, on obtient une décimale. Autrement dit,
1 + 3 + 5 + 7 + 9 + 11 + 13 + 15 + 17 + 19 + 21 + 23 + 25 + 27
= 196 < 200 < 225
= 1 + 3 + 5 + 7 + 9 + 11 + 13 + 15 + 17 + 19 + 21 + 23 + 25 + 27 + 29.
Nous observons 14 additions dans la première expression et 15 dans la seconde.
La racine carrée de 200 se situe donc entre 14 et 15, et celle de 2 entre 1,4 et 1,5.
"""


n = 2           # Starting number
k = 100000      # Multiplication factor, 10^n to get n decimals
f = n*k**2      # Scaled starting number, ready sur subtractions

s = 1
r = 0       

while f>0:
    f -= s
    s += 2
    r += 1

if f==0:
    print("Exact root found: sqrt({0}) = {1}".format(n, r/k))
else:
    print("Approximate root found:")
    print("{0} < sqrt({1}) < {2}".format((r-1)/k,n,r/k))

