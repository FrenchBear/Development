VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "Suggestion"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit
'classe d'objet suggestion

'une suggestion est une chaine de caract�res
'et un flag indiquant qu'elle a �t� ajout�e depuis HACCP


'propri�t�s
Private chLibell� As String
Private chDescription As String
Private chOldLibell� As String
Private chOldDescription As String
Private iAjout�e As Integer
Private iEffac�e As Integer
Private iRemplac�e As Integer

Public Property Get Description() As String
    
    Description = chDescription

End Property

Public Property Get OldDescription() As String
    
    OldDescription = chOldDescription

End Property


Public Property Get Libell�() As String
    
    Libell� = chLibell�

End Property

Public Property Get OldLibell�() As String
    
    OldLibell� = chOldLibell�

End Property


Public Property Get Ajout�e() As Integer
    
    Ajout�e = iAjout�e

End Property


Public Property Get Effac�e() As Integer
    
    Effac�e = iEffac�e

End Property



Public Property Get Remplac�e() As Integer
    
    Remplac�e = iRemplac�e

End Property




Public Property Let Description(ByVal Description As String)

    chDescription = Description

End Property




Public Property Let OldDescription(ByVal Description As String)

    chOldDescription = Description

End Property





Public Property Let Libell�(ByVal Libell� As String)

    chLibell� = Libell�

End Property




Public Property Let OldLibell�(ByVal Libell� As String)

    chOldLibell� = Libell�

End Property





Public Property Let Ajout�e(ByVal Ajout�e As Integer)

    iAjout�e = Ajout�e

End Property





Public Property Let Effac�e(ByVal Effac�e As Integer)

    iEffac�e = Effac�e

End Property






Public Property Let Remplac�e(ByVal Remplac�e As Integer)

    iRemplac�e = Remplac�e

End Property







