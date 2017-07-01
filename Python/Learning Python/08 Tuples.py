# Tuples
# Learning Python
# 2015-05-02    PV

t=1,2,3
u=(4,5,6)

print(t)
print(t[0])

print(u)

# Tuples are immutable
#t[0]=2     # TypeError: 'tuple' object does not support item assignment

# Tuple concatenation, similar to lists and strings
print(t+u)

# Multiple assignation using tuples
a,b,c=t
# a,b=t     # ValueError: too many values to unpack (expected 2)
d,e=10,11

# Return multiple values
def min_max(list):
    list.sort()
    return list[0], list[-1]    # Negative index start from end

l = [5,1,2,4,7,5,9,6,2,3,5,4,6,2,4]
print(l)
min,max=min_max(l)
print(min,max)
print(l)                # l has been globally sorted

