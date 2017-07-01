# circle.py
# Exemple of root class for inheritence
# 2015-05-06    PV

import math

class circle(object):
    """This is a test root class, to build an inheritence tree"""

    def __init__(self):
        #self.x = 0.0
        #self.y = 0.0
        #self.r = 1.0
        self.__init__(self, 0.0, 0.0, 1.0)

    def __init__(self, x, y, r):
        self.x = x
        self.y = y
        self.r = r

    def surface(self):
        return math.pi*self.r*self.r

