VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Bo�tes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion standard d'une collection d'objets bo�te"
' Classe bo�tes
' Gestion standard d'une collection d'objets bo�te
' 6/9/97 PV

Option Explicit

'variable locale pour la collection
Private mCol As Collection

Public Function Add(boi_milieu As Integer, boi_dilution As Integer, boi_quantite As Variant, boi_facteur As Long, boi_numboite As Integer, boi_typemarquage As Integer, boi_typeboite As Integer, boi_legende As String, Optional sKey As String) As Bo�te
  'cr�er un nouvel objet
  Dim objNewMember As Bo�te
  Set objNewMember = New Bo�te

  'd�finir les propri�t�s pass�es dans la m�thode
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


  'renvoy� l'objet cr��
  Set Add = objNewMember
  Set objNewMember = Nothing
End Function


Public Function AddBo�te(objNewMember As Bo�te, Optional sKey As String) As Bo�te
  If Len(sKey) = 0 Then
      mCol.Add objNewMember
  Else
      mCol.Add objNewMember, sKey
  End If

  'renvoy� l'objet cr��
  Set AddBo�te = objNewMember
End Function


' Proc�dure par d�faut
Public Property Get Item(vntIndexKey As Variant) As Bo�te
Attribute Item.VB_UserMemId = 0
    'utilis�e pour faire r�f�rence � un �l�ment de la collection
    'vntIndexKey contient l'index ou la cl�, elle est donc
    'd�clar�e comme un Variant
    'Syntaxe: Set toto = x.Item(xyz) oo Set toto = x.Item(5)
  Set Item = mCol(vntIndexKey)
End Property



Public Property Get Count() As Long
    'utilis�e lors de l'extraction du nombre d'�l�ments dans
    'la collection. Syntaxe: Debug.Print x.Count
    Count = mCol.Count
End Property


Public Sub Remove(vntIndexKey As Variant)
    'utilis�e pour la suppression d'un �l�ment de la collection
    'vntIndexKey contient l'index ou la cl�, elle est donc
    'd�clar�e comme un Variant
    'Syntaxe: x.Remove(xyz)


    mCol.Remove vntIndexKey
End Sub


Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
    'cette propri�t� vous permet d'�num�rer cette
    'collection avec la syntaxe For�Each
    Set NewEnum = mCol.[_NewEnum]
End Property


Private Sub Class_Initialize()
    'cr�e la collection lors de la cr�ation de cette classe
    Set mCol = New Collection
End Sub


Private Sub Class_Terminate()
    'd�truit la collection lorsque cette classe est termin�e
    Set mCol = Nothing
End Sub

