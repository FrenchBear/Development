# 17 FunctionDefinitions
# Learning Python, explore function definitions
# 2015-06-28    PV

# just for functools.reduce
import functools


def f2(f):
    return 42

# A function decorator binds the result of the decoration function to the
# function name
@f2
def func(): pass

# Output is 42
print('function decoration')
print(func)


# No function overloading in Python!
"""
def max(a,b): return a if a>=b else b
def max(a,b,c): return max(max(a,b),c)
print(max(4,2))
print(max(4,2,12))
"""


# All extra calling parameters are stored in b as a tuple
def single_star(a, *b):
    print(a)
    print(b)

print('\nSingle Star parameter')
single_star(1,2,'Hello',('a', 'b'),['c', 'd'], 3.0j)


# All extra calling parameters are stored in b as a dictionary, but call must use named parameters
def double_star(a, **b):
    print(a)
    print(b)

print('\nDouble Star parameter')
# Note that last argument is a named parameter for a
double_star(int1=1, int2=2, str='Hello', tup=('a', 'b'), lis=['c', 3.4], a=3.0j)


# Starred expression when calling functions
print('\nStarred extression')
single_star(*range(6))
double_star(3, **{'Pierre':50, 'Claude':59, 'Jacques':46})

# Annotations
def annot(a: "First parameter", b: 42) -> "test function":
    print(annot.__annotations__)
    print(a, b)

print('\nAnnotations')
annot(3.0-2.0j, ['Hello', 42])


# Embedded functions
def sum(*a):
    total1 = 0
    total2 = 0

    def accumulate(v):
        nonlocal total1
        total1 += v

    for x in a: 
        accumulate(x)
        total2 += x

    return total1, total2

print('\nEmbedded functions')
print(sum(1,2,3,4,5,6,7,8,9,10))


# Lambdas
def filterfunc(x):
    return x % 3 == 0
mult3 = filter(filterfunc, [1, 2, 3, 4, 5, 6, 7, 8, 9])
mult3 = [x for x in [1, 2, 3, 4, 5, 6, 7, 8, 9] if x % 3 == 0]
mult3 = range(3,10,3)

# Note that direct tuple or list multiplication is not allowed:can't multiply sequence by non-int of type 'float'
# And [1,2,3]*2 = [1,2,3,1,2,3]
celsius = [39.2, 36.5, 37.3, 37.8]
fahrenheit = map(lambda x: (float(9)/5)*x + 32, celsius)

print('\nFilter')
print(list(filter(lambda x: x % 3 == 0, [1, 2, 3, 4, 5, 6, 7, 8, 9])))

print('\nMap')
a = [1,2,3,4]
b = [17,12,11,10]
c = [-1,-4,5,9]
print(list(map(lambda x,y:x+y, a,b)))
# [18, 14, 14, 14]
print(list(map(lambda x,y,z:x+y+z, a,b,c)))
# [17, 10, 19, 23]
print(list(map(lambda x,y,z:x+y-z, a,b,c)))
# [19, 18, 9, 5]

# Reduce is not part of main namespace since Python 3
print('\nReduce')
print(functools.reduce(lambda x,y: x+y, [47,11,42,13]))


print('\nSwap function')
def swap(a,b): return (b,a)
a=3; b=5
print((a,b))
(a,b) = swap(a,b)
print((a,b))
a,b = b,a
print((a,b))


print('\nFibonacci')
def fib():
    a = 1
    b = 1
    while a<100:
        yield a
        a,b = b,a+b

print(list(fib()))

