Attribute VB_Name = "modMiseAJourErcemToSilliker"
' modMiseAJour
' Assure la transformation Ercem --> Silliker
'  3/10/99 PV
' 22/04/00 PV MAJZ automatique

Option Explicit

Private sTrace As String

Sub Trace(sMsg As String)
  If sTrace <> "" Then sTrace = sTrace & vbCrLf
  sTrace = sTrace & sMsg
End Sub

Sub TraceDétaillée(sMsg As String)
  Trace sMsg
End Sub


Public Sub MiseAJourErcemToSilliker()

  ' Messagerie, News: énumération des comptes
  Dim sClés As String
  On Error Resume Next
  sClés = EnumèreClésRegistry("HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager\Accounts")
  
  If Err = 0 Then
    On Error GoTo 0
    sClés = sClés & vbCrLf
    Dim p As Integer
    Do
      p = InStr(sClés, vbCrLf)
      If p = 0 Then Exit Do
      UnCompteDeMessagerie Left(sClés, p - 1)
      sClés = Mid(sClés, p + 2)
    Loop
  End If
  On Error GoTo 0
  
  ' Internet Explorer
  Dim sHome As String
  sHome = RécupèreValeurRegistry("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page", "REG_SZ")
  If InStr(1, sHome, "ercem.com", vbTextCompare) <> 0 Then
    DéfinitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page", "http://www.silliker"
    Trace "IE Home --> http://www.silliker"
  End If
  
  If sTrace <> "" Then
    MsgBox "Mise à jour automatique Ercem --> Silliker" & vbCrLf & vbCrLf & sTrace, vbInformation
  End If
  
  Exit Sub
  
Problème:
  MsgBox "Erreur " & Err.Number & " (" & Err.Source & "):" & vbCrLf & vbCrLf & Err.Description, vbCritical, App.Title

End Sub


Sub UnCompteDeMessagerie(sCompte As String)
  Dim sValeurs As String
  sValeurs = EnumèreValeursRegistry("HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager\Accounts\" & sCompte)
  sValeurs = sValeurs & vbCrLf
  Dim p As Integer
  Do
    p = InStr(sValeurs, vbCrLf)
    If p = 0 Then Exit Do
    UneValeurDeCompteDeMessagerie sCompte, Left(sValeurs, p - 1)
    sValeurs = Mid(sValeurs, p + 2)
  Loop
End Sub


Sub UneValeurDeCompteDeMessagerie(sCompte As String, sCléValeur As String)
  If InStr(1, sCléValeur, "ercem.com", vbTextCompare) <> 0 Then
    Dim sClé As String, sValeur As String
    Dim sNouvelleValeur As String
    Dim p As Integer
    p = InStr(sCléValeur, "=")
    sClé = Left(sCléValeur, p - 1)
    sValeur = Mid(sCléValeur, p + 1)
    sNouvelleValeur = Replace(sValeur, "ercem.com", "silliker", , , vbTextCompare)
    DéfinitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager\Accounts\" & sCompte, sClé, sNouvelleValeur
    Trace sCompte & ": " & sValeur & " --> " & sNouvelleValeur
  End If
End Sub

