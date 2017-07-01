# Parité Multiplication
# Cacule la proportion de multiplications paires et impaires
# Résultat, sur 100 multiplications de [0..9]x[0..9], 75 se terminent par uun chffre pair, 25 par un chiffre impair
# 2015-09-26   PV

# Avec listcomp
m = [str(x*y)[-1] for x in range(10) for y in range(10)]    # Liste des derniers chiffres des multiplcations [0..9]x[0..9]
f=[0]*10            # Initialise la table des fréquences des derniers chiffres à 0
for d in m:
    f[int(d)]+=1    # Replissage de la table des fréquences
se=sum(f[0::2])     # Nombre de multiplications se finissant par un chiffre pair
so=sum(f[1::2])     # Nombre de multiplications se finissant par un chiffre impair
print(f)
print('Pair', se, '   Impair', so)


# Avec genexp
f=[0]*10
for d in (str(x*y)[-1] for x in range(10) for y in range(10)):
    f[int(d)]+=1
se,so=sum(f[0::2]),sum(f[1::2])
print(f)
print('Pair', se, '   Impair', so)
