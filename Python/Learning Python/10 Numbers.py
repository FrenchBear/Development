# Numbers
# Learning Python
# 2015-05-02    PV

import math

print(abs(-12.3))
print(round(math.pi, 4))
print(100%23)               # Mod
print(complex(3,4))
print(abs(complex(3,4)))    # Modulus

print(bin(146))
print(hex(146))

print(math.factorial(10))
print(math.sin(math.pi/4))
# print(math.log(-1))       # ValueError: math domain error
# print(math.sqrt(-2))      # ValueError: math domain error

v=56.96124843
print(math.pow(v,v))        # 9.999999886000934e+99

print(int(math.sqrt(1000))) # 31
print(float(7))             # 7.0


# Bitwise operators
# ~ x       Returns the complement of x - the number you get by switching each 1 for a 0 and each 0 for a 1. This is the same as -x - 1.
# x & y     Does a "bitwise and". Each bit of the output is 1 if the corresponding bit of x AND of y is 1, otherwise it's 0.
# x | y     Does a "bitwise or". Each bit of the output is 0 if the corresponding bit of x AND of y is 0, otherwise it's 1.
# x ^ y     Does a "bitwise exclusive or". Each bit of the output is the same as the corresponding bit in x if that bit in y is 0, and it's the complement of the bit in x if that bit in y is 1.
# x << y    Returns x with the bits shifted to the left by y places (and new bits on the right-hand-side are zeros). This is the same as multiplying x by 2**y.
# x >> y    Returns x with the bits shifted to the right by y places. This is the same as //'ing x by 2**y.

