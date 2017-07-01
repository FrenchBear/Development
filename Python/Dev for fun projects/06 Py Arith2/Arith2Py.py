# Arith2Py.py
# Generics in Python, Double Arithmetic example
#
# Note that since Python provides integer operation in multiprecision out of box,
# this example is a bit silly...
#
# 2017-01-26    PV

import random
import time

# Breaks a generic type TName such as "DA<DA<IntBase>>" into outer type DA and
# inner type DA<IntBase>
def SplitTName(TName):
    p = TName.find("<")
    if p < 0:
        return (TName, "")
    if TName[-1] != ">":
        raise Exception(f"Invalid typename {TName} in SplitTName")
    return (TName[:p], TName[p + 1:len(TName) - p + 1])

# Returns number of digits in a generic such as DA<DA<IntBase>>: IntBase is 4
# digits,
# and each encapsulation in DA<> multiplies digits by 2
def ComputeDigits(TName):
    if TName == "IntBase":
        return 4
    else:
        (T, subT) = SplitTName(TName)
        if T == "DA":
            return 2 * ComputeDigits(subT)
        else:
            raise Exception("Unknown type in ComputeDigits")

# Simple base class providing support for Plus and Mult on 4 digits
class IntBase:
    digits = 4
    k = 10000
    TName = "dummy"

    # TName is a parameter even if it's useless here since DA and IntBase
    # must have exactly the same signatures, DA is calling recursively
    # methods on DA and IntBase from the same code
    def __init__(self, TName, s=None):
        if s is None:
            # Default constructor
            self.val = 0
        elif isinstance(s, str):
            # String constructor
            if len(s) <= self.digits:
                self.val = int(s)
            else:
                raise Exception(f"Too many digits in IntBase constructor, got {len(s)} while max is {self.digits}")
        elif isinstance(s, int):
            # Integer constructor
            if s<self.k:
                self.val = s
            else:
                raise Exception(f"Parameter s too large in IntBase constructor, got {s} while max is {self.k-1}")
        elif isinstance(s, IntBase):
            # Copy constructor
            self.val = s.val
        else:
            raise Exception(f"Unsupported parameter type in IntBase constructor, got {type(s)} while only int, str and IntBase are accepted")

    def IsZero(self):
        return self.val == 0

    def ToString(self):
        return str(self.val)

    def ToStringWithLeadingZeros(self):
        return str(self.val + self.k)[1:]

    # Convenient method to print two IntBase at the same time
    def ToString2(self, other):
        if self.IsZero():
            return other.ToString()
        else:
            return self.ToString() + other.ToStringWithLeadingZeros()

    # Addition of multiple IntBase
    def Plus(self, *args, **kwargs):
        x = self.val
        for item in args:
            x += item.val
        return (IntBase("dummy", x // self.k), IntBase("dummy", x % self.k))

    # Multiplication of two IntBase
    def Mult(self, other):
        x = self.val * other.val
        return (IntBase("dummy", x // self.k), IntBase("dummy", x % self.k))

# DoubleArithmetic generic, Python version
# Half-length typename is passed into TName.
class DA:
    def __init__(self, TName, s = None):
        self.TName = TName

        if isinstance(s, DA):
            # Copy constructor first, since we already have some info
            # available from copied element without computation
            self.digits = s.digits
            self.T = s.T
            self.subT = s.subT
        else:
            (self.T, self.subT) = SplitTName(TName)
            dhalf = ComputeDigits(TName)
            self.digits = 2 * dhalf

            if s is None:
                # Default constructor
                self.high = eval(self.T)(self.subT)
                self.low = eval(self.T)(self.subT)
            elif isinstance(s, str):
                # String constructor
                if len(s) <= dhalf:
                    self.high = eval(self.T)(self.subT)
                    self.low = eval(self.T)(self.subT, s)
                elif len(s) <= self.digits:
                    self.high = eval(self.T)(self.subT, s[0:len(s) - dhalf])
                    self.low = eval(self.T)(self.subT, s[len(s) - dhalf:])
                else:
                    raise Exception(f"Too many digits in DA constructor, got {len(s)} while max is {self.digits}")
            elif isinstance(s, tuple):
                # Tuple constructor = 2 items of child class
                # In this case, we copy references instead of constructing a copy, that's safe
                # in this context since it's only called from locally constructed variables
                # Anyway, at the lowest level IntBase.Plus returns a value and not a ref
                self.high = s[0]
                self.low = s[1]
            else:
                raise Exception(f"Unsupported parameter type in DA constructor, got {type(s)} while only str or tuple is accepted")

    def Plus(self, *args, **kwargs):
        h = self.high
        l = self.low
        #ovh = eval(self.T)(self.subT)      # Initialization not needed
        ovl = eval(self.T)(self.subT)
        for item in args:
            (ov1, l) = l.Plus(item.low)
            (ov2, h) = h.Plus(item.high, ov1)
            (ovh, ovl) = ovl.Plus(ov2)

        return (DA(self.TName, (ovh, ovl)), DA(self.TName, (h, l)))

    def Mult(self, other):
        (lowH, lowL) = self.low.Mult(other.low)
        (t1h, t1l) = self.high.Mult(other.low)
        (t2h, t2l) = self.low.Mult(other.high)
        (highH, highL) = self.high.Mult(other.high)

        (ov1, lowH) = lowH.Plus(t1l, t2l)
        (ov2, highL) = highL.Plus(t1h, t2h, ov1)
        (_, highH) = highH.Plus(ov2)

        return (DA(self.TName, (highH, highL)), DA(self.TName, (lowH, lowL)))

    def IsZero(self):
        return self.high.IsZero() and self.low.IsZero()

    def ToString(self):
        if self.high.IsZero():
            return self.low.ToString()
        else:
            return self.high.ToString() + self.low.ToStringWithLeadingZeros()

    def ToStringWithLeadingZeros(self):
        return self.high.ToStringWithLeadingZeros() + self.low.ToStringWithLeadingZeros()

    def ToString2(self, other):
        if self.IsZero():
            return other.ToString()
        else:
            return self.ToString() + other.ToStringWithLeadingZeros()

def GetRandomNumber(n):
    r = ""
    while n > 0:
        r += str(random.randrange(10000,20000))[1:]
        n -= 4
    return r

def Test(TName):
    digits = ComputeDigits(TName)
    (T, subT) = SplitTName(TName)
    astr = GetRandomNumber(digits)
    bstr = GetRandomNumber(digits)
    tstart = time.time()    # Stopwatch start
    a = eval(T)(subT, astr)
    b = eval(T)(subT, bstr)
    print()
    print(f"Test {TName}, digits={digits}")
    print(f"a{digits} = {a.ToString()}")
    print(f"b{digits} = {b.ToString()}")
    (sh, sl) = a.Plus(b)
    sstr = sh.ToString2(sl)
    print(f"a{digits}+b{digits} = {sstr}")
    (ph, pl) = a.Mult(b)
    pstr = ph.ToString2(pl)
    print(f"a{digits}.b{digits} = {pstr}")
    duration = time.time()-tstart

    tstart = time.time()
    schkstr = str(int(astr) + int(bstr))
    pchkstr = str(int(astr) * int(bstr))
    durchk = time.time()-tstart
    
    print("Verif: Plus " + ("Ok" if schkstr == sstr else "Error") + ",  Mult " + ("Ok" if pchkstr == pstr else "Error"))
    print('Elapsed: '+str(int(round(duration, 3)*1000))+' ms,  Check: '+str(int(round(durchk, 3)*1000))+' ms')

a4 = IntBase("dummy", "1234")
b4 = IntBase("dummy", "8766")
print("a4 = ", a4.ToString())
print("b4 = ", b4.ToString())
(s4h, s4l) = a4.Plus(b4)
print("a4+b4 = ", s4h.ToString2(s4l))
(p4h, p4l) = a4.Mult(b4)
print("a4.b4 = ", p4h.ToString2(p4l))

"""
print()
a8 = DA("IntBase", "12345678")
print("a8 = ", a8.ToString())
b8 = DA("IntBase", "87654321")
print("b8 = ", b8.ToString())
(s8h, s8l) = a8.Plus(b8)
print("a8+b8 = ", s8h.ToString2(s8l))
(t8h, t8l) = DA.Plus(a8, b8)        # Actually this also calls a8.Plus(b8) !!!
print("a8+b8 = ", DA.ToString2(t8h, t8l))
"""

Test("IntBase")                 # 4
Test("DA<IntBase>")             # 8
Test("DA<DA<IntBase>>")         # 16
Test("DA<DA<DA<IntBase>>>")     # 32
Test("DA<DA<DA<DA<IntBase>>>>")                 # 64
Test("DA<DA<DA<DA<DA<IntBase>>>>>")             # 128
Test("DA<DA<DA<DA<DA<DA<IntBase>>>>>>")         # 256
Test("DA<DA<DA<DA<DA<DA<DA<IntBase>>>>>>>")     # 512
Test("DA<DA<DA<DA<DA<DA<DA<DA<IntBase>>>>>>>>") # 1024

