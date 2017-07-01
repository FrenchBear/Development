# copy
# Test of a copy constructor

class C:
    def __init__(self, x):
        print(type(x))
        self.x = x

    def print(self):
        print(self.x)

    def Copy(self):
        return C(self.x)


a = C(5)
b = a.Copy()

a.print()
b.print()

a.x = 12

a.print()
b.print()

p = C((a, b))
