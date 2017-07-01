VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "File"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion d'une file (FIFO) d'objets de type variant"
Attribute VB_Ext_KEY = "SavedWithClassBuilder" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
' Module de classe File
' Gestion d'une file (FIFO) d'objets de type variant
' 28/04/96 PV
' 17/03/97 PV Méthodes Reinit et Count
'  3/06/98 PV Chien de garde à 45 secondes
' 16/12/98 PV Chien de garde à 3 minutes
' 31/08/01 PV Chien de garde paramétrable, et mis à 5 min par défaut
' 28/11/01 PV Optmimisation: si cléExtraction=cléInsertion, retoiur à 0, évite le pb de dépassement 32767 insertions
'
' La file est stockée dans une collection. La clé des éléments
' est de la forme K0, K1, K2…

Option Explicit

Private Buffer As New Collection
Private CléInsertion As Integer, CléExtraction As Integer

Private Const iDélaiGardeDéfaut As Integer = 5 * 60
Private iDélaiGarde As Integer


Private Sub Class_Initialize()
  CléInsertion = 0
  CléExtraction = 0
  iDélaiGarde = iDélaiGardeDéfaut
End Sub

Public Sub DéfinitDélaiGarde(ByVal iNouveauDélai As Integer)
  iDélaiGarde = iNouveauDélai
End Sub

Sub Reinit()
  Class_Initialize
  While Buffer.count > 0
    Buffer.Remove 1
  Wend
End Sub

' Ajoute un élément à la fin de la file
Sub Add(Item)
  Buffer.Add Item, "K" & CléInsertion
  CléInsertion = CléInsertion + 1
End Sub

' Retire 'élément en tête de file
Function Extrait() As Variant
  Dim t0 As Single
  ' Boucle tant que la file et vide et qu'il y a une fenêtre chargée
  t0 = Timer
  Do While CléInsertion = CléExtraction And Timer - t0 < iDélaiGarde ' 3 min de chien de garde
    DoEvents
    If Forms.count = 0 Then End
  Loop
  If Timer - t0 >= iDélaiGarde Then
    Extrait = sANSItoOEM(sGetIntlLib("CO083", "!Pas de réponse du système unix après trois minutes d'attente, sortie par le chien de garde."))
    Exit Function
  End If
  Extrait = Buffer("K" & CléExtraction)
  Buffer.Remove "K" & CléExtraction
  CléExtraction = CléExtraction + 1
  If CléExtraction = CléInsertion Then
    CléInsertion = 0
    CléExtraction = 0
  End If
End Function

Function count() As Integer
  count = CléInsertion - CléExtraction
End Function
