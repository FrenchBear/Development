VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Libell�Ercem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Mod�lise un enregistrement (en fran�ais) de la table libercem"
' Classe Libell�Ercem
' Mod�lise un enregistrement (en fran�ais) de la table libercem
'  2/09/1997 PV
' 19/01/1999 PV ler_classe --> ler_application; ler_numler integer --> string
' 20/01/1999 PV Cache sans cl�

Option Explicit

Public ler_numler As String       ' N� du Libell�Ercem
Public ler_libelle As String      ' Libell�

Function Copie() As Libell�Ercem
  Dim k As New Libell�Ercem
  With k
    .ler_numler = ler_numler
    .ler_libelle = ler_libelle
  End With
  Set Copie = k
End Function

Sub DiskWrite(iNumFic As Integer)
  Write #iNumFic, ler_numler
  Write #iNumFic, ler_libelle
End Sub

Sub DiskRead(iNumFic As Integer)
  Input #iNumFic, ler_numler
  Line Input #iNumFic, ler_libelle
  ler_libelle = Subst(Mid(ler_libelle, 2, Len(ler_libelle) - 2), """""", """")
End Sub
