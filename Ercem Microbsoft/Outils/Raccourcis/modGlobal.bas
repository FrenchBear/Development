Attribute VB_Name = "modGlobal"
' modGlobal
' D�clarations globales re raccourcis
' 31/08/1998 PV
' 24/02/2000 PV   R�cup�ration de la locale
'  7/04/2000 PV   Trace d�taill�e
'  7/09/2000 PV   GetSystemDefaultLCID  ->  GetSystemDefaultLangID
' 26/10/2000 PV   S�paration de LangueSyst�me
' 12/11/2001 PV   sExplorateurWindows


Option Explicit

Public Const sNomApp As String = "Raccourcis"

Public sExplorateurWindows As String    ' Nom "Explorateur Windows" localis�


Public Sub Trace(ByVal sMessage As String)
  With frmRaccourcis.lstTrace
    .AddItem sMessage
    .ListIndex = .ListCount - 1
    .Refresh
  End With
End Sub

Public Sub TraceD�taill�e(ByVal sMessage As String)
  If frmRaccourcis.chkTrace = vbChecked Then Trace sMessage
End Sub

