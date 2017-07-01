Attribute VB_Name = "modInternational"
' modInternational
' Gestion de l'internationalisation
' 19/01/1999 PV

Option Explicit

Public cLangage As String         ' Langue courante de l'interface
Private colDef As New Collection  ' Libellés pas défaut


' Initialisation élémentaire de l'international
Public Sub IntlInit()
  cLangage = GetSetting(sApplicationGlobale, "Options", "Langue", "F")
  bInitLibellésErcem 1           ' Ne lit que le cache
End Sub


Public Sub IntlChangelangue(cNouveauLangage As String)
  If cNouveauLangage <> cLangage Then
    cLangage = cNouveauLangage
    If cLangage <> "-" Then    ' Volapük
      SaveSetting sApplicationGlobale, "Options", "Langue", cNouveauLangage
      If frmTCP.GetState = 0 Then
        bInitLibellésErcem 1
      Else
        bIntlInitCache
      End If
    End If
    
    On Error Resume Next
    Dim f As Form
    For Each f In Forms
      f.Internationalisation
    Next
  End If
End Sub


Public Sub IntlSélectionneLangage()
  frmInternational.Show vbModal
End Sub


' Met à jour le cache en mode connecté
' Retour vrai si les données ont été mises à jour
Public Function bIntlInitCache() As Boolean
  bIntlInitCache = bInitLibellésErcem(2)          ' Met à jour le cache et la mémoire si nécessaire
End Function


Function sGetIntlLib(sName As String, sDefaut As String) As String
  If cLangage = "-" Then
    sGetIntlLib = sName
  Else
    sGetIntlLib = Subst(sLibelléErcem(sName, sDefaut), "|", vbCrLf)
  End If
End Function


Public Sub AjusteControle(c)
  c.Font.Size = 8
End Sub


Sub SetLib(ByRef o As Object, sProp As String, sName As String)
  On Error Resume Next
  Dim s As String
  s = colDef(sName)
  If Err Then
    Err.Clear
    colDef.Add CStr(CallByName(o, sProp, VbGet)), sName
    If Err Then
      'MsgBox2i "CR283", o.Name, sProp, sName, Err.Number, Err.Description
      ' Ne pas traduire
      MsgBox "Erreur interne: échec au SetLib" & vbCrLf & vbCrLf & o.Name & "." & sProp & "=""" & sName & """" & vbCrLf & Err.Number & ": " & Err.Description & vbCrLf & vbCrLf & "Prévenez le service informatique !", vbExclamation, sNomApp
    End If
  End If
  On Error GoTo 0
  If TypeOf o Is Label Or TypeOf o Is CommandButton Or TypeOf o Is Frame Or TypeOf o Is CheckBox Or TypeOf o Is OptionButton Then
    AjusteControle o
  End If
  
  On Error Resume Next
  If cLangage = "-" Then
    CallByName o, sProp, VbLet, sName
  Else
    CallByName o, sProp, VbLet, Subst(sLibelléErcem(sName, colDef(sName)), "|", vbCrLf)
  End If
  If Err Then
    MsgBox2i "CR284", o.Name, sProp, sName, Err.Number, Err.Description
    'MsgBox "Erreur interne: échec au SetLib" & vbCrLf & vbCrLf & o.Name & "." & sProp & "=""" & sName & """" & vbCrLf & Err.Number & ": " & Err.Description & vbCrLf & vbCrLf & "Prévenez le service informatique !", vbExclamation, sNomApp
  End If
  On Error GoTo 0
End Sub
