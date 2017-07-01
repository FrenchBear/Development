VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "Suggestion"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit
'classe d'objet suggestion

'une suggestion est une chaine de caractères
'et un flag indiquant qu'elle a été ajoutée depuis HACCP


'propriétés
Private chLibellé As String
Private chDescription As String
Private chOldLibellé As String
Private chOldDescription As String
Private iAjoutée As Integer
Private iEffacée As Integer
Private iRemplacée As Integer

Public Property Get Description() As String
    
    Description = chDescription

End Property

Public Property Get OldDescription() As String
    
    OldDescription = chOldDescription

End Property


Public Property Get Libellé() As String
    
    Libellé = chLibellé

End Property

Public Property Get OldLibellé() As String
    
    OldLibellé = chOldLibellé

End Property


Public Property Get Ajoutée() As Integer
    
    Ajoutée = iAjoutée

End Property


Public Property Get Effacée() As Integer
    
    Effacée = iEffacée

End Property



Public Property Get Remplacée() As Integer
    
    Remplacée = iRemplacée

End Property




Public Property Let Description(ByVal Description As String)

    chDescription = Description

End Property




Public Property Let OldDescription(ByVal Description As String)

    chOldDescription = Description

End Property





Public Property Let Libellé(ByVal Libellé As String)

    chLibellé = Libellé

End Property




Public Property Let OldLibellé(ByVal Libellé As String)

    chOldLibellé = Libellé

End Property





Public Property Let Ajoutée(ByVal Ajoutée As Integer)

    iAjoutée = Ajoutée

End Property





Public Property Let Effacée(ByVal Effacée As Integer)

    iEffacée = Effacée

End Property






Public Property Let Remplacée(ByVal Remplacée As Integer)

    iRemplacée = Remplacée

End Property







