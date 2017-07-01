Option Explicit

Global gRef As String, gNometb As String
Global gNumEtb As Long, gNbAB As Variant, gNbGE As Variant
Global gDate As String, gNomAssistant As String

Dim bFin As Integer

Sub ChangeFeuille (f As Form, Index As Integer)
  Dim g As Form
  Select Case Index
    Case 0: Set g = frmPlanning
    Case 2: Set g = frmProduits
    Case 3: Set g = frmCritères
    Case 4: Set g = frmCatégories
    Case 5: Set g = frmConditionnements
    Case 6: Set g = frmConditionsPrélèvement
    Case 7: Set g = frmFabricants
    Case 8: Set g = frmDistributeurs
    'case 9: frmLibellésStandard.show
    Case Else: MsgBox "Feuille non encore implantée !": Exit Sub
  End Select
  If Not f Is g Then g.Show : f.Hide
End Sub

Sub CtrlKDate (KeyAscii As Integer)
  If InStr("0123456789/", Chr(KeyAscii)) = 0 Then KeyAscii = 0
End Sub

Function getConditionnement (c As Integer) As String
  setConditionnement c
  'Stop
  getConditionnement = Mid(frmConditionnements!lstConditionnements, 4)
End Function

Function getConditionsPrélèvement (c As Integer) As String
  setConditionsPrélèvement c
  getConditionsPrélèvement = Mid(frmConditionsPrélèvement!lstConditionsPrélèvement, 4)
End Function

Sub InitFont (c As Control)
  On Error Resume Next
  c.FontName = "Fixedsys"
  If Err Then c.FontName = "8514fix"
  On Error GoTo 0
End Sub

Sub InitForm (f As Form, c As Control)
  InitFont c
  c = " Chargement en cours… "
  f.WindowState = 2 ' Agrandi
End Sub

Sub InitSel (c As Control)
  c.SelStart = 0
  c.SelLength = 999
  c.Tag = c
End Sub

Sub OteAccents (s As String)
  Dim p As Integer
  s = LCase(UCase(s))
  Do
    p = InStr(s, "ç")
    If p = 0 Then Exit Do
    Mid(s, p, 1) = "c"
  Loop
End Sub

Sub Quitter ()
  If bFin Then Exit Sub
  bFin = True
  Unload frmPlanning
  Unload frmFichePrélèvement

  Unload frmProduits
  Unload frmCritères
  Unload frmCatégories
  Unload frmConditionnements
  Unload frmConditionsPrélèvement
  Unload frmFabricants
  Unload frmDistributeurs
  
  End
End Sub

Sub setCatégorie (c As Integer)
  setCtrlNum2c frmCatégories!lstCatégories, c
End Sub

Sub setConditionnement (c As Integer)
  setCtrlNum2c frmConditionnements!lstConditionnements, c
End Sub

Sub setConditionsPrélèvement (c As Integer)
  setCtrlNum2c frmConditionsPrélèvement!lstConditionsPrélèvement, c
End Sub

Sub setCtrlNum2c (l As ComboBox, c As Integer)
  Dim a, b, p, v As Integer
  a = 0
  b = l.ListCount

  Do
    p = (a + b) / 2
    v = Val(l.List(p))
    If c = v Then
      l.ListIndex = p
      Exit Sub
    End If
    If b - a <= 1 Then l.ListIndex = -1: Exit Sub
    If v > c Then b = p Else a = p
  Loop
End Sub

Sub ValideDate (ctrl As Control)
  Dim dp As Variant
  Dim s As String, c As String
  Dim p As Integer
  s = ctrl

  dp = ctrl
  If IsDate(dp) Then
    ctrl = Format(dp, "dd/mm/yyyy")
    If ctrl <> s Then frmFichePrélèvement!bModif = 1
    Exit Sub
  End If
  If dp = "" Then Exit Sub

  Dim j As Integer, m As Integer, a As Integer
  j = Day(Date)
  m = Month(Date)
  a = Year(Date)
  
  p = 1
  c = Mid(ctrl, p, 1)
  If c >= "0" And c <= "9" Then
    j = Val(c)
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If
  If c >= "0" And c <= "9" Then
    j = j * 10 + Val(c)
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If
  If c = "/" Then
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If
  If c >= "0" And c <= "9" Then
    m = Val(c)
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If
  If c >= "0" And c <= "9" Then
    m = m * 10 + Val(c)
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If
  If c = "/" Then
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If
  If c >= "0" And c <= "9" Then
    a = Val(c)
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If
  If c >= "0" And c <= "9" Then
    a = a * 10 + Val(c)
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If
  If c >= "0" And c <= "9" Then
    a = a * 10 + Val(c)
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If
  If c >= "0" And c <= "9" Then
    a = a * 10 + Val(c)
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If

  ctrl = DateSerial(a, m, j)
  If ctrl <> s Then frmFichePrélèvement!bModif = 1
End Sub

Sub ValideHeure (ctrl As Control)
  Dim s As String, c As String
  Dim p As Integer
  s = ctrl

  Dim h As Integer, m As Integer
  h = Hour(Now)
  m = Minute(Now)
  
  p = 1
  c = Mid(ctrl, p, 1)
  If c >= "0" And c <= "9" Then
    h = Val(c)
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If
  If c >= "0" And c <= "9" Then
    h = h * 10 + Val(c)
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If
  If c = ":" Then
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If
  If c >= "0" And c <= "9" Then
    m = Val(c)
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If
  If c >= "0" And c <= "9" Then
    m = m * 10 + Val(c)
    p = p + 1
    c = Mid(ctrl, p, 1)
  End If

  ctrl = Format(h, "##") & ":" & Format(m, "00")
  If ctrl <> s Then frmFichePrélèvement!bModif = 1

End Sub

