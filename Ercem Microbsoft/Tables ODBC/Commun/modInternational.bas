Attribute VB_Name = "modInternational"
' modInternational
' Gestion de l'internationalisation pour les applis ODBC
' 19/01/1999 PV
' 11/07/2000 PV Utilisation réelle

Option Explicit

Public cLangage As String         ' Langue courante de l'interface


Public Const sFormatDate As String = "dd/mm/yyyy"   ' En attendant une gestion complète

' Initialisation élémentaire de l'international
Public Sub IntlInit()
  cLangage = GetSetting(App.EXEName, "Options", "Langue", cSystèmeLang)
  
  ' On en profite pour contrôler si VB6SP4 est installé
  frmAbout.CtrlVB6SP4
End Sub


Public Sub IntlChangelangue(cNouveauLangage As String)
  If cNouveauLangage <> cLangage Then
    cLangage = cNouveauLangage
    If cLangage <> "-" Then    ' Volapük
      SaveSetting App.EXEName, "Options", "Langue", cNouveauLangage
    End If
    
    On Error Resume Next
    Dim F As Form
    For Each F In Forms
      F.Internationalisation
    Next
    Err.Clear
  End If
End Sub


Public Sub IntlSélectionneLangage()
  frmInternational.Show vbModal
End Sub

Public Function sIntlLib(ByVal sLib As String) As String
  Dim p As Integer, q As Integer
  sLib = "%%" & sLib & "%%"
  p = InStr(1, sLib, "%%" & cLangage & ":")
  If p > 0 Then
    q = InStr(p + 2, sLib, "%%")
    sIntlLib = Subst(Subst(Mid(sLib, p + 4, q - p - 4), "|", vbCrLf), "\t", vbTab)
  End If
  ' Par défaut, chaîne vide
End Function


Sub SetLib(ByRef o As Object, sProp As String, ByVal sTrad As String)
  On Error Resume Next
  If cLangage = "-" Then
    CallByName o, sProp, VbLet, o.Name
  Else
    sTrad = sIntlLib(sTrad)
    If sTrad <> "" Then CallByName o, sProp, VbLet, sTrad
  End If
  If Err Then
    MsgBox "Erreur interne: échec au SetLib" & vbCrLf & vbCrLf & o.Name & "." & sProp & "=""" & sTrad & """" & vbCrLf & Err.Number & ": " & Err.Description & vbCrLf & vbCrLf & "Prévenez le Service Informatique !", vbExclamation, App.Title
  End If
  On Error GoTo 0
End Sub


' -----------------------------------------------------------------------------------------
' Routines internationales de service

Public Function AvertissementLectureFichierComplet() As VbMsgBoxResult
  Dim sQuest As String
  
  sQuest = sIntlLib("F:Attention, vous allez lire tous les enregistrements.|Confirmez-vous cette opération ?%%" & _
                    "A:Warning, you're about to read all records of the file.|Are you sure ?")
  AvertissementLectureFichierComplet = MsgBox(sQuest, vbYesNo + vbQuestion, App.Title)
End Function

Public Sub intlMessageErreurEtat()
  MessageErreurStandard sIntlLib("F:Échec lors de l'état.%%A:Failure during report.")
End Sub
