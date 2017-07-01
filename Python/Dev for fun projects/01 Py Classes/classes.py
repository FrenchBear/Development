# classes.py
# Exemple playing with Python classes
# 2015-05-06    PV

from circle import circle

c = circle(3.0, 4.0, 5.0)
print("Surface:" , round(c.surface(),2))

class ellipse(circle):
    """A variation over circle"""

    def __init__(self, x, y, rx, ry):
        super().__init__(x, y, rx)          # Don't pass self in this case!
        self.ry = ry

    def surface(self):
        return super().surface() / self.r * self.ry

# Ellipse half of the surface of the previous circle
e = ellipse(3.0, 4.0, 5.0, 2.5)
print("Surface:", round(e.surface(),2))

