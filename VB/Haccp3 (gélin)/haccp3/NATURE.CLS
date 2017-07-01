VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "Nature"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit
'classe d'objet nature

'une nature est
'- une chaine de caractères
'- une collection de spécificités


'propriétés
Private chLibellé As String
Public Spécificités As New Specificites


Public Function AddSpécificité(ByVal Libellé As String) As Nature
Attribute AddSpécificité.VB_Description = "Ajoute une spécificité à la nature"

    AddSpécificité = Spécificités.Add(Libellé)
    
End Function




Public Function CountSpécificités() As Long
    CountSpécificités = Spécificités.Count
End Function



Public Sub DeleteSpécificité(ByVal Index As Long)
    Spécificités.Delete Index
End Sub



Public Property Get Libellé() As String
    
    Libellé = chLibellé

End Property

Public Property Let Libellé(ByVal Libellé As String)

    chLibellé = Libellé

End Property






Private Sub Class_Terminate()

    Set Spécificités = Nothing
    
End Sub


