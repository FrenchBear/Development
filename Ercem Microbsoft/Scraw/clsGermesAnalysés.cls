VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "GermesRecherchés"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Collection standard d'objets GermeRecherché"
' classe GermesRecherchés
' Collection standard d'objets GermeRecherché
' 6/09/97 PV
' 5/12/00 PV  Prix et devise dans Add

Option Explicit

' variable locale pour la collection
Private mCol As Collection

Private Function ZA(x) As Variant
  If x = 0 Then
    ZA = sGetIntlLib("CO099", "ABSENCE")
  ElseIf x = -1 Then
    ZA = "-"
  Else
    ZA = x
  End If
End Function


Public Function Add(iGerme As Integer, sUnité As String, m As Double, s As Double, sMéthode As String, bOrigineCritère As Boolean, dPrix As Variant, cDevise As String, Optional sKey As String) As GermeRecherché
    'créer un nouvel objet
    Dim objNewMember As GermeRecherché
    Set objNewMember = New GermeRecherché

    'définir les propriétés passées dans la méthode
    objNewMember.iGerme = iGerme
    objNewMember.sUnité = sUnité
    objNewMember.m = ZA(m)
    objNewMember.s = s
    objNewMember.sMéthode = sMéthode
    objNewMember.sRésultat = ""
    objNewMember.bOrigineCritère = bOrigineCritère
    objNewMember.dPrix = dPrix
    objNewMember.cDevise = cDevise
    objNewMember.cEtatLabo = ""
    objNewMember.bGermeModifié = False
    

    If Len(sKey) = 0 Then
        mCol.Add objNewMember
    Else
        mCol.Add objNewMember, sKey
    End If

    ' Renvoie l'objet créé
    Set Add = objNewMember
    Set objNewMember = Nothing
End Function


Public Function AddGermeRecherché(g As GermeRecherché, Optional sKey As String) As GermeRecherché
    If Len(sKey) = 0 Then
        mCol.Add g
    Else
        mCol.Add g, sKey
    End If

    ' Renvoie l'objet créé
    Set AddGermeRecherché = g
End Function


' Procédure par défaut
Public Property Get Item(vntIndexKey As Variant) As GermeRecherché
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

