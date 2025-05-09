VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Journee"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Classe de gestion d'une joun�e de planning"
' Journ�e
' Classe de gestion d'une joun�e de planning
' 21/07/1996 PV
' 13/04/1998 PV   Heures et km, classe compl�te
' 18/03/1999 PV   Lettres @A du marqueur de cl�ture
' 21/09/2000 PV   Cl�ture -> Validation; iValidation

Option Explicit

Public dDatePlan As Date
Public sLettres As String
Public iHeureD�but
Public iHeureFin
Public iKmD�but
Public iKmFin

' 0: Pas valid�
' 1: Partiellement valid�
' 2: Totalement valid�
Public iValidation As Integer


Public Property Get sNomPersonne() As String
  If sLettres = "@A" Then
    sNomPersonne = "Marqueur de cl�ture"
    Exit Function
  End If
  
  Dim u As Utilisateur
  Set u = UtiParLettres(sLettres)
  If u Is Nothing Then
    sNomPersonne = "Utilisateur inconnu"
  Else
    sNomPersonne = u.uti_nom
  End If
End Property

