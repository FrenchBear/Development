VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "GermesRecherch�s"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Collection standard d'objets GermeRecherch�"
' classe GermesRecherch�s
' Collection standard d'objets GermeRecherch�
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


Public Function Add(iGerme As Integer, sUnit� As String, m As Double, s As Double, sM�thode As String, bOrigineCrit�re As Boolean, dPrix As Variant, cDevise As String, Optional sKey As String) As GermeRecherch�
    'cr�er un nouvel objet
    Dim objNewMember As GermeRecherch�
    Set objNewMember = New GermeRecherch�

    'd�finir les propri�t�s pass�es dans la m�thode
    objNewMember.iGerme = iGerme
    objNewMember.sUnit� = sUnit�
    objNewMember.m = ZA(m)
    objNewMember.s = s
    objNewMember.sM�thode = sM�thode
    objNewMember.sR�sultat = ""
    objNewMember.bOrigineCrit�re = bOrigineCrit�re
    objNewMember.dPrix = dPrix
    objNewMember.cDevise = cDevise
    objNewMember.cEtatLabo = ""
    objNewMember.bGermeModifi� = False
    

    If Len(sKey) = 0 Then
        mCol.Add objNewMember
    Else
        mCol.Add objNewMember, sKey
    End If

    ' Renvoie l'objet cr��
    Set Add = objNewMember
    Set objNewMember = Nothing
End Function


Public Function AddGermeRecherch�(g As GermeRecherch�, Optional sKey As String) As GermeRecherch�
    If Len(sKey) = 0 Then
        mCol.Add g
    Else
        mCol.Add g, sKey
    End If

    ' Renvoie l'objet cr��
    Set AddGermeRecherch� = g
End Function


' Proc�dure par d�faut
Public Property Get Item(vntIndexKey As Variant) As GermeRecherch�
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

