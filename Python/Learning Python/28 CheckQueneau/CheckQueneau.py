# CheckQueneau
# 2017-12-31 PV

"""
Dans le livre, pas dans les mp3
['Négativités', 'Passé indéfini', 'Permutations', 'Epenthèse', 'Par devant par derrière']

Dans les mp3, pas dans le livre
['Négativites', 'Ignorance', 'Passe Indéfini', 'Ode', 'Epenthèses', 'Par devant par derriere', 'Macaronique']
"""

import os

# Dans le livre
list1 = ["Notations", "En partie double", "Litotes", "Métaphoriquement", "Rétrograde", "Surprises", "Rêve", "Pronostication", "Synchyses", "L'arc-en-ciel",
"Logo-rallye", "Hésitations", "Précisions", "Le côté subjectif", "Autre subjectivité", "Récit", "Composition de mots", "Négativités", "Animisme", "Anagrammes",
"Distinguo", "Homéotéleutes", "Lettre officielle", "Prière d'insérer", "Onomatopées", "Analyse logique", "Insistance", "Passé indéfini", "Présent", "Passé simple",
"Imparfait", "Alexandrins", "Polyptotes", "Aphérèses", "Apocopes", "Syncopes", "Moi je", "Exclamations", "Alors", "Ampoulé",
"Vulgaire", "Interrogatoire", "Comédie", "Apartés", "Paréchèses", "Fantomatique", "Philosophique", "Apostrophe", "Maladroit", "Désinvolte",
"Partial", "Sonnet", "Olfactif", "Gustatif", "Tactile", "Visuel", "Auditif", "Télégraphique", "Permutations", "Permutations de lettres",
"Permutations de mots", "Hellénismes", "Ensembliste", "Définitionnel", "Tanka", "Vers libres", "Translation", "Lipogramme", "Anglicisme", "Prosthèses",
"Epenthèse", "Paragoges", "Parties du discours", "Métathèses", "Par devant par derrière", "Noms propres", "Loucherbem", "Javanais", "Antonymique", "Homophonique",
"Italianismes", "Poor lay Zanglay", "Contre-petteries", "Botanique", "Médical", "Injurieux", "Gastronomique", "Zoologique", "Impuissant", "Modern style",
"Probabiliste", "Portrait", "Géométrique", "Paysan", "Interjections", "Précieux", "Inattendu"]

# Dans les mp3
path = "C:\Music2GD\A_Trier\Exercices de style de Raymond Queneau"
# s.split(" - ")[2] transforms "Exercices de style - 61 - Permutations de lettres" into "Permutations de lettres"
list2 = [os.path.splitext(f)[0].split(" - ")[2] for f in os.listdir(path) if os.path.isfile(os.path.join(path, f))]

list1notin2 = [x for x in list1 if x not in list2]
list2notin1 = [x for x in list2 if x not in list1]

print("Dans le livre, pas dans les mp3")
print(list1notin2)
print()
print("Dans les mp3, pas dans le livre")
print(list2notin1)
