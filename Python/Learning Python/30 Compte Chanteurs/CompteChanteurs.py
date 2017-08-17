
# Compte le nomber de chansons par chanteur dans un dossier
# 2017-08-17    PV

import os, re

source = r"C:\Temp\Work\Chansons Intl\_Divers"
list = [f for f in os.listdir(source) if os.path.isfile(os.path.join(source, f))]


accent_tabin =  u'àâäéèêëîïôöûüùÿç'
accent_tabout = u'aaaeeeeiioouuuyc'
accent_tabin = [ord(char) for char in accent_tabin]
accent_table = dict(zip(accent_tabin, accent_tabout))
def LowerNoAccent(s):
    return s.lower().translate(accent_table)


dicChanteurs = {}
for f in list:
    match = re.search(r'^(.*) - (.*)\.mp3', f, re.IGNORECASE)
    if match:
        chanteur = LowerNoAccent(match.groups(0)[0])
        if chanteur in dicChanteurs:
            dicChanteurs[chanteur].append(f)
        else:
            dicChanteurs[chanteur] = [f]
    else:
        print("No match: "+f)

lkn = []
for k in dicChanteurs.keys():
    lkn.append((k, len(dicChanteurs[k])))
    if len(dicChanteurs[k])>=4:
        print(k)
#lkn.sort(key=lambda kn: kn[1])
#print(lkn)

