
def SplitTName(TName):
    p = TName.find("<")
    if p<0:
        return (TName, "")
    return (TName[:p], TName[p+1:len(TName)-p+1])

"""
print(SplitTName("IntBase"))
print(SplitTName("DA<IntBase>"))
print(SplitTName("DA<DA<IntBase>>"))
print(SplitTName("DA<DA<DA<IntBase>>>"))

('IntBase', '')
('DA', 'IntBase')
('DA', 'DA<IntBase>')
('DA', 'DA<DA<IntBase>>')
"""
