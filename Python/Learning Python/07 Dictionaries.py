# Dictionaries
# Learning Python
# 2015-05-02    PV

dic={'Pierre':50, 'Claude':59, 'Jacques':46}

print(dic)
print(dic.values())             # View, vrap into list() to make a list
print(dic.keys())               # Idem
print(list(dic))                # ['Claude', 'Pierre', 'Jacques'] = keys

# Access by index
# print(dic[0])                 # Invalid
print(list(dic.values())[0])    # Working, but since dictionaries don't keep order, element 0 is Claude!

dic['Pierre']+=1                # Dictionaries are mutable
print(dic['Pierre'])

# print(dic['pierre'])          # Err, case-sensitive

print(len(dic))                 # 3

del(dic['Jacques'])
print(dic)                      # {'Claude': 59, 'Pierre': 51}

print('Pierre' in dic)          # True
print('Jacques' in dic)         # False

print(dic.get('Pierre', 20))    # 51
print(dic.get('Jqcques', 20))   # 20


dic.clear()
print(len(dic))                 # 0

# Usa a dictionary as a sparse matrix, key is a tuple
Matrix = {}
Matrix[1,2] = 15
print(Matrix[1,2])
print(Matrix)                   # {(1, 2): 15}

