Attribute VB_Name = "modGlobal"
' modGlobal
' Déclarations globales re raccourcis
' 31/08/1998 PV
' 24/02/2000 PV   Récupération de la locale
'  7/04/2000 PV   Trace détaillée
'  7/09/2000 PV   GetSystemDefaultLCID  ->  GetSystemDefaultLangID
' 26/10/2000 PV   Séparation de LangueSystème
' 12/11/2001 PV   sExplorateurWindows


Option Explicit

Public Const sNomApp As String = "Raccourcis"

Public sExplorateurWindows As String    ' Nom "Explorateur Windows" localisé


Public Sub Trace(ByVal sMessage As String)
  With frmRaccourcis.lstTrace
    .AddItem sMessage
    .ListIndex = .ListCount - 1
    .Refresh
  End With
End Sub

Public Sub TraceDétaillée(ByVal sMessage As String)
  If frmRaccourcis.chkTrace = vbChecked Then Trace sMessage
End Sub

