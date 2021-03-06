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
' 17/03/97 PV M�thodes Reinit et Count
'  3/06/98 PV Chien de garde � 45 secondes
' 16/12/98 PV Chien de garde � 3 minutes
' 31/08/01 PV Chien de garde param�trable, et mis � 5 min par d�faut
' 28/11/01 PV Optmimisation: si cl�Extraction=cl�Insertion, retoiur � 0, �vite le pb de d�passement 32767 insertions
'
' La file est stock�e dans une collection. La cl� des �l�ments
' est de la forme K0, K1, K2�

Option Explicit

Private Buffer As New Collection
Private Cl�Insertion As Integer, Cl�Extraction As Integer

Private Const iD�laiGardeD�faut As Integer = 5 * 60
Private iD�laiGarde As Integer


Private Sub Class_Initialize()
  Cl�Insertion = 0
  Cl�Extraction = 0
  iD�laiGarde = iD�laiGardeD�faut
End Sub

Public Sub D�finitD�laiGarde(ByVal iNouveauD�lai As Integer)
  iD�laiGarde = iNouveauD�lai
End Sub

Sub Reinit()
  Class_Initialize
  While Buffer.count > 0
    Buffer.Remove 1
  Wend
End Sub

' Ajoute un �l�ment � la fin de la file
Sub Add(Item)
  Buffer.Add Item, "K" & Cl�Insertion
  Cl�Insertion = Cl�Insertion + 1
End Sub

' Retire '�l�ment en t�te de file
Function Extrait() As Variant
  Dim t0 As Single
  ' Boucle tant que la file et vide et qu'il y a une fen�tre charg�e
  t0 = Timer
  Do While Cl�Insertion = Cl�Extraction And Timer - t0 < iD�laiGarde ' 3 min de chien de garde
    DoEvents
    If Forms.count = 0 Then End
  Loop
  If Timer - t0 >= iD�laiGarde Then
    Extrait = sANSItoOEM(sGetIntlLib("CO083", "!Pas de r�ponse du syst�me unix apr�s trois minutes d'attente, sortie par le chien de garde."))
    Exit Function
  End If
  Extrait = Buffer("K" & Cl�Extraction)
  Buffer.Remove "K" & Cl�Extraction
  Cl�Extraction = Cl�Extraction + 1
  If Cl�Extraction = Cl�Insertion Then
    Cl�Insertion = 0
    Cl�Extraction = 0
  End If
End Function

Function count() As Integer
  count = Cl�Insertion - Cl�Extraction
End Function
