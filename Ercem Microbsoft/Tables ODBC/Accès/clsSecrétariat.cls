VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Secr�tariat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe Secr�tariat
' G�re les secr�tariats d'�dition
'  8/11/2001 PV

Option Explicit

Public sec_secretariat As String      ' Lettre du Secr�tariat
Public sec_systeme As String          ' Code du syst�me informatique de rattachement
Public sec_libelle As String          ' Description en clair

' Duplique un objet Secr�tariat
Function Copie() As Secr�tariat
  Dim k As New Secr�tariat
  With k
    .sec_secretariat = sec_secretariat
    .sec_systeme = sec_systeme
    .sec_libelle = sec_libelle
  End With
  Set Copie = k
End Function


