Attribute VB_Name = "modSuperSéries"
' modSuperSéries
' Outils de gestion des superséries
' 25/08/1998 PV
'  2/09/1998 PV DessineTiming

Option Explicit


' Remplit un label avec le code du jour courant
Public Sub SetLabelJourSS(lblJour As Label)
  Select Case Weekday(Now)
    Case vbMonday:    lblJour = "Lu"
    Case vbTuesday:   lblJour = "Ma"
    Case vbWednesday: lblJour = "Me"
    Case vbThursday:  lblJour = "Je"
    Case vbFriday:    lblJour = "Ve"
    Case vbSaturday:  lblJour = "Sa"
    Case vbSunday:    lblJour = "Di"
  End Select
End Sub


' Retourne un n° de supersérie en fonction de l'heure
Private Function iNumSS(n As Date) As Integer
  Dim iSS As Integer        ' N° de SS calculé
  iSS = (Hour(n) * 60 + Minute(n) - (9 * 60 - 20) - 1 + 10 * (Hour(n) > 13 Or Hour(n) = 13 And Minute(n) > 10)) \ 20 + 1
  If iSS < 1 Then iSS = 1   ' Garde-fou de sécurité
  
  iNumSS = iSS
End Function


Public Function tTransfertSS(iNumSS As Integer) As Integer
  Dim t As Integer
  t = 9 * 60 - 20 + 20 * (iNumSS - 1)
  If iNumSS >= 15 Then t = t + 10
  tTransfertSS = t
End Function

Public Sub SetNoSSDéfaut(txtNumSS As TextBox, Optional iOffset As Integer = 0)
  Dim iSS As Integer
  iSS = iNumSS(Now) + iOffset
  If iSS < 0 Then iSS = 0
  txtNumSS = iSS
End Sub


Public Function bCheckNoSS(txtNumSS) As Boolean
  bCheckNoSS = False
  If Not IsNumeric(txtNumSS) Then
    MsgBox "Le n° de supersérie doit être un nombre entre 1 et 36.", vbExclamation, App.Title
    If TypeOf txtNumSS Is TextBox Then txtNumSS.SetFocus
    Exit Function
  End If
  
    
  If txtNumSS < 0 Or txtNumSS > 36 Or Val(txtNumSS) <> Int(txtNumSS) Then
    MsgBox "Le n° de supersérie doit être un nombre compris entre 0 et 36.", vbExclamation, App.Title
    If TypeOf txtNumSS Is TextBox Then txtNumSS.SetFocus
    Exit Function
  End If
  bCheckNoSS = True
End Function




' Effectue un dessin des superséries dans le temps
Public Sub DessineTiming(p As PictureBox, l As Label)
  Dim tNow As Integer, t0 As Integer, lastt0 As Integer
  Dim sTime As String, sSérie As String
  Dim iSérie As Integer
  Dim n As Date
  Dim iSS As Integer
  
  n = BDTime
  iSS = iNumSS(n)
  tNow = Hour(n) * 60 + Minute(n)
  
  p.Cls
  p.DrawWidth = 2
  
  p.Scale (tNow - 40, 4)-(tNow + 40, -12)
  p.Line (9 * 60 - 20, 0)-(23 * 60, 0)
  t0 = 8 * 60 + 40
  While t0 <= 23 * 60
    p.Line (t0, 1)-Step(0, -2)
    sTime = Format(TimeSerial(t0 \ 60, t0 Mod 60, 0), "hh:mm")
    p.CurrentX = t0 - p.TextWidth(sTime) / 2
    p.CurrentY = 4
    p.Print sTime;
    
    If lastt0 > 0 Then
      p.Line (lastt0 + 1, -1)-(t0 - 1, -3.5), IIf(iSérie = iSS, RGB(220, 220, 255), RGB(160, 160, 180)), BF
      sSérie = Format(iSérie)
      p.CurrentX = (t0 + lastt0) / 2 - p.TextWidth(sSérie) / 2
      p.CurrentY = -1
      p.Print sSérie
    End If
    
    iSérie = iSérie + 1
    lastt0 = t0
    t0 = t0 + 20
    If t0 = 13 * 60 + 20 Then t0 = t0 + 10
  Wend
  
  p.DrawWidth = 3
  p.Line (tNow, 1)-Step(0, -2), RGB(255, 0, 0)
  
  Dim tRest As Integer
  tRest = tTransfertSS(iSS + 1) - tNow
  l.Caption = "Il est " & Format(TimeSerial(tNow \ 60, tNow Mod 60, 0), "hh:mm") & ", il reste " & tRest & " minute" & s(tRest) & " avant le transfert de la supersérie " & iSS & "."
  l.ForeColor = IIf(tRest <= 5, RGB(128, 0, 0), 0)
  l.FontBold = IIf(tRest <= 5, RGB(128, 0, 0), 0)
End Sub




' Rattache une série à une supersérie
Public Sub RattacheSérie(ByVal iNumSérie As Long, ByVal iNumSS As Integer)
  Dim CSS As New BDCurseur
  
  CSS.OpenCurseur "select ser_numserie,ser_superserie from c_serielabo where ser_numserie=" & iNumSérie
'$$ Cas où il n'y a aucun enregistrement sélectionné
  CSS.Edit
  CSS!ser_superserie = iNumSS
  CSS.Update
  CSS.CloseCurseur
End Sub

