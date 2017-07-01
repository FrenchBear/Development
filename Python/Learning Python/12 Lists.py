# Lists
# Learning Python
# 2015-05-02    PV

a=['a','b','c']
del(a[1:2])
print(a)            # ['a', 'c']

a=['a','b','c']
a.append('a')
print(a)            # ['a', 'b', 'c', 'a']
a+=['e','f']
print(a)            # ['a', 'b', 'c', 'd', 'e', 'f']

print(a.count('b')) # 1

print(a.index('e')) # 4

a=['a','b','c']
x=a.pop(1)          # 'b'
print(a)            # ['a', 'c']
a.insert(1, 'B')
print(a)            # ['a', 'B', 'c']

a=['a','b']+['c','a']
a.remove('a')       # remove first occurence
print(a)            # ['b', 'c', 'a']

a.reverse()
print(a)            # ['a', 'c', 'b']
a.sort()
print(a)            # ['a', 'b', 'c']



