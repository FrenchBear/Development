# Functions.py
# Simple example of functions
# 2015-05-02    PV

# Simple recursive function
def fact(n):
    if n<2:
        return 1
    else:
        return n*fact(n-1)

# A function can have no return
def test():
    print(fact(10))

# Do not forget parentheses to call a functon
test()
