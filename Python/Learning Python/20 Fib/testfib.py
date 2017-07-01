# Fibonacci series and other tests
# To test PTVS 2.2 on VS 2015
# 2015-07-25    PV


import fibo
from fibo import fib

f500 = fibo.fib2(500)
print(f500)

print(fib.__doc__)          # fib is directly loaded in symbol table



t = """Les temps changent, la pub aussi. Mais vous souvenez-vous comme c'était avant?
On les croirait extraites du magazine Hara-Kiri. Et pourtant, elles sont toutes authentiques, ce ne sont pas des parodies. Ce sont des réclames, des publicités, pour vendre du savon, des cigarettes, des voitures, des pulls... Que des produits grand public dont les budgets étaient gérés par des agences importantes et qui essayaient de coller à l'air du temps. 
Cette seconde édition s'attache à l'image de la femme dans la grande saga publicitaire. Quelquefois surréalistes, très souvent machistes, parfois purement vulgaires, ces pubs expriment mieux que tout essai l'époque dans lesquelles elles ont été imaginées.
Ce livre est une compilation d'images d'un passé, proche ou lointain, le constat d'une certaine naïveté face à la consommation galopante, et le cynisme des publicitaires qui n'ont pas hésité à exposer la femme sous toutes ses coutures et sans aucune honte. Le résultat? Juste incroyable, pitoyable et...révoltant! Regardez et riez (ou pleurez) sans modération.
"""
f = [(l, t.count(l)) for l in set(t.lower()) if l not in '\n']
d = {l: t.count(l) for l in set(t.lower()) if l not in '\n'}

f.sort(key = lambda x: x[1], reverse=True)
print(f)

# Sorting a dictionary in one line: items returns a list of tupes, then sorted sorts by default by the 1st of the tuple which is the key (letter)
print(sorted(d.items()))

d2 = dict(f)        # Can create a dictionary from a list of tuples
print(d2==d)        # True, comparison of the content by value

# Draw histogram
mf = f[0][1]        # Maximum frequency
for p in f:
    if p[1]>1: print(p[0], '*'*(100*p[1]//mf))

# Can iterate over keys and values at the same time
knights = {'gallahad': 'the pure', 'robin': 'the brave'}
for k, v in knights.items():
    print(k, v)
# Enumerate returns index and value
for i, (k, v) in enumerate(knights.items()):
    print(i, k, v)

# zip combines elements from two enumerables
questions = ['name', 'quest', 'favorite color']
answers = ['lancelot', 'the holy grail', 'blue']
print(list(zip(questions, answers)))        # [('name', 'lancelot'), ('quest', 'the holy grail'), ('favorite color', 'blue')]
