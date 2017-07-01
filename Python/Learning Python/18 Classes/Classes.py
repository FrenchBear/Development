# 18 Classes
# Learning Python, playing with classes
# 2015-07-14    PV

class animal:
    def __new__(self, name):
        self.name = name

    def Name(self):
        return self.name

a = animal('King Kong')
print(a.Name())
