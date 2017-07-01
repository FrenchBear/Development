VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Document"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe document
' Modélise un document général du gestionnaire de documents
' 01/02/1999 PV

Option Explicit

Public doc_serial       As Long         ' Si null (à cause du outer), on génère un pseudo-serial interne négatif
Public doc_classe       'As String      ' Type de document
Public doc_refdoc       'As String
Public doc_plasysteme   'As String
Public doc_plaserial    'As Long
Public docZ_lettres     'As String      ' utile ?
Public docZ_plairef     'As Long        ' utile ?
Public doc_titre        'As String
Public doc_etat         'As String
Public doc_assval
Public doc_opervallabo
Public doc_tsvallabo
Public doc_horsdelai
Public timestamp        'As Date

Private p_doc_oper(0 To 8) As Variant
Private p_doc_ts(0 To 8)   As Variant

' Champs satellites
Public pla_systeme As String
Public pla_serial As Long
Public pla_etb As Long
Public pla_dateplan As Date
Public pla_lettres As String
Public pla_iref As Long
Public etb_prefixe As String
Public etb_nom As String
Public nbex                     ' Peut être NULL



Public Property Get doc_oper(Index As Integer) As Variant
  doc_oper = p_doc_oper(Index)
End Property

Public Property Let doc_oper(Index As Integer, ByVal vNewValue As Variant)
  p_doc_oper(Index) = vNewValue
End Property


Public Property Get doc_ts(Index As Integer) As Variant
  doc_ts = p_doc_ts(Index)
End Property

Public Property Let doc_ts(Index As Integer, ByVal vNewValue As Variant)
  p_doc_ts(Index) = vNewValue
End Property


' Clé alphanumérique unique pour TreeViews et collections
Public Property Get Key() As String
  Key = "D" & doc_serial
End Property



' Constructeur copie, puisque le VB ne le fournit pas par défaut…
Function Copie() As Document
  Dim d As New Document
  With d
    .doc_serial = doc_serial
    .doc_classe = doc_classe
    .doc_refdoc = doc_refdoc
    .doc_plasysteme = doc_plasysteme
    .doc_plaserial = doc_plaserial
    .docZ_lettres = docZ_lettres
    .docZ_plairef = docZ_plairef
    .doc_titre = doc_titre
    .doc_etat = doc_etat
    .doc_assval = doc_assval
    .doc_opervallabo = doc_opervallabo
    .doc_tsvallabo = doc_tsvallabo
    .doc_horsdelai = doc_horsdelai
    .timestamp = timestamp

    Dim i As Integer
    For i = 0 To 8
     .doc_oper(i) = p_doc_oper(i)   ' ½ triche… en l'absence de l'attribut friend en VB identique à celui du C++
     .doc_ts(i) = p_doc_ts(i)
    Next

    .pla_systeme = pla_systeme
    .pla_serial = pla_serial
    .pla_etb = pla_etb
    .pla_dateplan = pla_dateplan
    .pla_lettres = pla_lettres
    .pla_iref = pla_iref
    .etb_prefixe = etb_prefixe
    .etb_nom = etb_nom
    .nbex = nbex
  End With
  Set Copie = d
End Function


' ======================================================================
' Fonctions génériques de manipulation

Public Sub ShellVisualisation()
  colClasseDocument(doc_classe).ShellDoc_Visualisation Me
End Sub

Public Function bShellCréation(sNRef As String) As Boolean
  bShellCréation = colClasseDocument(doc_classe).ShellDoc_bShellCréation(Me, sNRef)
End Function

Public Function bShellSaisie(sNTitre As String, iOperContrôle As Integer, sNRef As String, bRestreint As Boolean) As Boolean
  bShellSaisie = colClasseDocument(doc_classe).ShellDoc_bShellSaisie(Me, sNTitre, iOperContrôle, sNRef, bRestreint)
End Function
