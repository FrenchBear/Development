VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Boîtes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion standard d'une collection d'objets boîte"
' Classe boîtes
' Gestion standard d'une collection d'objets boîte
' 6/9/97 PV

Option Explicit

'variable locale pour la collection
Private mCol As Collection

Public Function Add(boi_milieu As Integer, boi_dilution As Integer, boi_quantite As Variant, boi_facteur As Long, boi_numboite As Integer, boi_typemarquage As Integer, boi_typeboite As Integer, boi_legende As String, Optional sKey As String) As Boîte
  'créer un nouvel objet
  Dim objNewMember As Boîte
  Set objNewMember = New Boîte

  'définir les propriétés passées dans la méthode
  objNewMember.boi_milieu = boi_milieu
  objNewMember.boi_dilution = boi_dilution
  objNewMember.boi_quantite = boi_quantite
  objNewMember.boi_facteur = boi_facteur
  objNewMember.boi_numboite = boi_numboite
  objNewMember.boi_typemarquage = boi_typemarquage
  objNewMember.boi_typeboite = boi_typeboite
  objNewMember.boi_legende = boi_legende
  
  objNewMember.boi_etatboite = ""
  objNewMember.boi_idboite = ""
  objNewMember.boi_tslecture = Null
  objNewMember.boi_operlecture = Null
  objNewMember.boi_denombrement = ""

  If Len(sKey) = 0 Then
      mCol.Add objNewMember
  Else
      mCol.Add objNewMember, sKey
  End If


  'renvoyé l'objet créé
  Set Add = objNewMember
  Set objNewMember = Nothing
End Function


Public Function AddBoîte(objNewMember As Boîte, Optional sKey As String) As Boîte
  If Len(sKey) = 0 Then
      mCol.Add objNewMember
  Else
      mCol.Add objNewMember, sKey
  End If

  'renvoyé l'objet créé
  Set AddBoîte = objNewMember
End Function


' Procédure par défaut
Public Property Get Item(vntIndexKey As Variant) As Boîte
Attribute Item.VB_UserMemId = 0
    'utilisée pour faire référence à un élément de la collection
    'vntIndexKey contient l'index ou la clé, elle est donc
    'déclarée comme un Variant
    'Syntaxe: Set toto = x.Item(xyz) oo Set toto = x.Item(5)
  Set Item = mCol(vntIndexKey)
End Property



Public Property Get Count() As Long
    'utilisée lors de l'extraction du nombre d'éléments dans
    'la collection. Syntaxe: Debug.Print x.Count
    Count = mCol.Count
End Property


Public Sub Remove(vntIndexKey As Variant)
    'utilisée pour la suppression d'un élément de la collection
    'vntIndexKey contient l'index ou la clé, elle est donc
    'déclarée comme un Variant
    'Syntaxe: x.Remove(xyz)


    mCol.Remove vntIndexKey
End Sub


Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
    'cette propriété vous permet d'énumérer cette
    'collection avec la syntaxe For…Each
    Set NewEnum = mCol.[_NewEnum]
End Property


Private Sub Class_Initialize()
    'crée la collection lors de la création de cette classe
    Set mCol = New Collection
End Sub


Private Sub Class_Terminate()
    'détruit la collection lorsque cette classe est terminée
    Set mCol = Nothing
End Sub

