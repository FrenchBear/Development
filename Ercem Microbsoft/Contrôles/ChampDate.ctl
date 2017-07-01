VERSION 5.00
Begin VB.UserControl ChampDate 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   ToolboxBitmap   =   "ChampDate.ctx":0000
   Begin VB.TextBox txtDate 
      Height          =   495
      Left            =   480
      TabIndex        =   0
      Top             =   540
      Width           =   1215
   End
End
Attribute VB_Name = "ChampDate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "TextEdit spécialisé dans la saisie d'une date, et saisie assistée de ABSENCE (#1/1/80#)"
' ChampDate
' Contrôle spécialisé dans la saisie d'une date
' Affiche la date 1/1/1980 comme "ABSENCE"
'  3/09/1997 PV
' 24/10/1997 PV Génère l'événement change
' 29/10/1997 PV Pas de saisie assistée "Absence" si le champ est locked
' 19/04/1998 PV Liste variable de dates à saisie assistée (prop. SaisieAssistée)
' 18/03/1999 PV DateSaisie propriété par défaut (enfin !)
'  6/11/2001 PV dMax passé de 2002 à 2004


Option Explicit

' Evénements
Event Click()
Event DblClick()
Event Change()
Event KeyDown(KeyCode As Integer, Shift As Integer)
Event KeyPress(KeyAscii As Integer)
Event KeyUp(KeyCode As Integer, Shift As Integer)
Event MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
Event MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Event MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)

' Bornes de vraisemblance absolues, à voir...
Private Const dMin As Date = #1/1/1986#
Private Const dMax As Date = #1/1/2004#

' Saisie assistée
Dim sSaisieAssistée As String
Dim iNbAssist As Integer
Dim sLibelléSA() As String
Dim dDateSA() As String

' ====================================================================

Private Sub UserControl_InitProperties()
  Set txtDate.Font = UserControl.Ambient.Font
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  txtDate.Text = PropBag.ReadProperty("DateSaisie", "")
  Set txtDate.Font = PropBag.ReadProperty("Font", Ambient.Font)
  txtDate.BackColor = PropBag.ReadProperty("BackColor", &H80000005)
  txtDate.Enabled = PropBag.ReadProperty("Enabled", True)
  txtDate.Locked = PropBag.ReadProperty("Locked", False)
  SaisieAssistée = PropBag.ReadProperty("SaisieAssistée", "ABSENCE=1/1/1980")
'  If bShiftPressed Then
'    MsgBox "txtDate = " & txtDate & vbCrLf & _
'           "txtDate.BackColor = " & Hex(txtDate.BackColor) & vbCrLf & _
'           "txtDate.Enabled = " & txtDate.Enabled & vbCrLf & _
'           "txtDate.Locked = " & txtDate.Locked & vbCrLf & _
'           "SaisieAssistée = " & SaisieAssistée
'  End If
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("DateSaisie", txtDate.Text, "")
  Call PropBag.WriteProperty("Font", txtDate.Font, Ambient.Font)
  Call PropBag.WriteProperty("BackColor", txtDate.BackColor, &H80000005)
  Call PropBag.WriteProperty("Enabled", txtDate.Enabled, True)
  Call PropBag.WriteProperty("Locked", txtDate.Locked, False)
  Call PropBag.WriteProperty("SaisieAssistée", SaisieAssistée, "ABSENCE=1/1/1980")
End Sub


' ====================================================================
' Saisie assistée

Private Sub txtDate_KeyPress(KeyAscii As Integer)
  If KeyAscii >= 32 And KeyAscii <> 127 Then
    If txtDate.Locked Then
      KeyAscii = 0
      Exit Sub
    End If
    If txtDate.SelStart + txtDate.SelLength = Len(txtDate) Then
      Dim tNew As String
      tNew = Left(txtDate, txtDate.SelStart) & Chr(KeyAscii) & Mid(txtDate, txtDate.SelStart + txtDate.SelLength + 1)
      
      Dim i As Integer, iNb As Integer, iRang As Integer
      For i = 1 To iNbAssist
        If UCase(tNew) = Left(sLibelléSA(i), Len(tNew)) Then
          iNb = iNb + 1
          iRang = i
        End If
      Next
      
      If iNb = 1 Then   ' Seule une combinaison coïncide
        Dim ss As Integer
        ss = Len(tNew)
        tNew = tNew + Mid(sLibelléSA(iRang), Len(tNew) + 1)
        txtDate = tNew
        txtDate.SelStart = ss
        txtDate.SelLength = 99
        KeyAscii = 0
      End If
    End If
  End If
  RaiseEvent KeyPress(KeyAscii)
End Sub

Private Sub txtDate_GotFocus()
  txtDate.ForeColor = 0
End Sub

Private Sub txtDate_LostFocus()
  Dim bAssisté As Boolean, i As Integer
  bAssisté = False
  For i = 1 To iNbAssist
    If UCase(txtDate) = UCase(sLibelléSA(i)) Then
      bAssisté = True
      Exit For
    End If
  Next
    
  If txtDate = "" Or bAssisté Then
    txtDate.ForeColor = &H80000008
    Exit Sub
  End If
  
  Dim dTemp As Date
  dTemp = dDécodeDate(txtDate)
  If dTemp <> #1/1/1900# Then
    txtDate = Format(dTemp, "short date")
    txtDate.ForeColor = &H80000008
  Else
    txtDate.ForeColor = &HFF
  End If
End Sub

Public Sub SetFocus()
  txtDate.SetFocus
End Sub

Private Sub UserControl_Resize()
  txtDate.Move 0, 0, UserControl.Width, UserControl.height
End Sub

Public Property Get DateSaisie() As Variant
Attribute DateSaisie.VB_Description = "Accès à la date décodée, ou ERR si la saisie est incorrecte"
Attribute DateSaisie.VB_UserMemId = 0
  If txtDate = "" Then
    DateSaisie = ""
  Else
    Dim i As Integer
    For i = 1 To iNbAssist
      If UCase(txtDate) = UCase(sLibelléSA(i)) Then
        DateSaisie = dDateSA(i)
        Exit Property
      End If
    Next

    Dim dTemp As Date
    dTemp = dDécodeDate(txtDate)
    If dTemp = #1/1/1900# Then
      DateSaisie = "ERR"
    Else
      DateSaisie = dTemp
    End If
  End If
End Property


Public Property Let DateSaisie(ByVal vNewValue As Variant)
  PropertyChanged "DateSaisie"
  
  If IsNull(vNewValue) Then
    txtDate = ""
    txtDate.ForeColor = &H80000008
  ElseIf vNewValue = "" Then
    txtDate = UCase(vNewValue)
    txtDate.ForeColor = &H80000008
  Else
    Dim i As Integer
    For i = 1 To iNbAssist
      If UCase(vNewValue) = UCase(sLibelléSA(i)) Then
        txtDate = UCase(vNewValue)
        txtDate.ForeColor = &H80000008
        Exit Property
      End If
    Next
    
    If IsDate(vNewValue) Then
      For i = 1 To iNbAssist
        If CDate(vNewValue) = dDateSA(i) Then
          txtDate = UCase(sLibelléSA(i))
          txtDate.ForeColor = &H80000008
          Exit Property
        End If
      Next
      txtDate = Format(vNewValue, "short date")
      txtDate.ForeColor = &H80000008
    Else
      txtDate = vNewValue
      txtDate.ForeColor = &HFF
    End If
  End If
End Property



Private Function IsDateCompacte(sDate As String) As Boolean
  If Len(sDate) <> 4 And Len(sDate) <> 6 And Len(sDate) <> 8 Then
    IsDateCompacte = False
    Exit Function
  End If
  Dim i As Integer
  For i = 1 To Len(sDate)
    If Mid(sDate, i, 1) < "0" Or Mid(sDate, i, 1) > "9" Then
      IsDateCompacte = False
      Exit Function
    End If
  Next
  If Val(Left(sDate, 2)) < 1 Or Val(Left(sDate, 2)) > 31 Or Val(Mid(sDate, 3, 2)) < 1 Or Val(Mid(sDate, 3, 2)) > 12 Then
    IsDateCompacte = False
  Else
    IsDateCompacte = IsDate(Left(sDate, 2) & "/" & Mid(sDate, 3, 2) & "/" & IIf(Len(sDate) > 4, Mid(sDate, 5), Year(Now)))
  End If
End Function


' Décode une date avec un format en entrée souple
' Retourne #1/1/1900# en cas d'erreur
Private Function dDécodeDate(sDate As String) As Date
  Dim dTemp As Date
  
  If IsDate(sDate) Then
    dTemp = CDate(sDate)
  ElseIf IsDateCompacte(sDate) Then
    dTemp = CDate(Left(sDate, 2) & "/" & Mid(sDate, 3, 2) & "/" & IIf(Len(sDate) > 4, Mid(sDate, 5), Year(Now)))
  Else
    dTemp = #1/1/1900#
  End If
  
  If dTemp <> #1/1/1900# And (dTemp < dMin Or dTemp > dMax) Then
    dTemp = #1/1/1900#
  End If
  dDécodeDate = dTemp
End Function


'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtDate,txtDate,-1,Font
Public Property Get Font() As Font
Attribute Font.VB_Description = "Renvoie un objet Font."
Attribute Font.VB_UserMemId = -512
  Set Font = txtDate.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set txtDate.Font = New_Font
  PropertyChanged "Font"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtDate,txtDate,-1,BackColor
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Renvoie ou définit la couleur d'arrière-plan utilisée pour afficher le texte et les graphiques d'un objet."
Attribute BackColor.VB_UserMemId = -501
  BackColor = txtDate.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  txtDate.BackColor() = New_BackColor
  PropertyChanged "BackColor"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtDate,txtDate,-1,BorderStyle
Public Property Get BorderStyle() As Integer
Attribute BorderStyle.VB_Description = "Renvoie ou définit le style de la bordure d'un objet."
Attribute BorderStyle.VB_UserMemId = -504
  BorderStyle = txtDate.BorderStyle
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtDate,txtDate,-1,Enabled
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Renvoie ou définit une valeur qui détermine si un objet peut répondre à des événements générés par l'utilisateur."
Attribute Enabled.VB_UserMemId = -514
  Enabled = txtDate.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  txtDate.Enabled() = New_Enabled
  PropertyChanged "Enabled"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtDate,txtDate,-1,Locked
Public Property Get Locked() As Boolean
Attribute Locked.VB_Description = "Détermine si un contrôle peut être édité."
  Locked = txtDate.Locked
End Property

Public Property Let Locked(ByVal New_Locked As Boolean)
  txtDate.Locked() = New_Locked
  PropertyChanged "Locked"
End Property


Public Property Get SelStart() As Integer
  SelStart = txtDate.SelStart
End Property

Public Property Let SelStart(ByVal New_SelStart As Integer)
  txtDate.SelStart() = New_SelStart
  PropertyChanged "SelStart"
End Property

Public Property Get SelLength() As Integer
  SelLength = txtDate.SelLength
End Property

Public Property Let SelLength(ByVal New_SelLength As Integer)
  txtDate.SelLength() = New_SelLength
  PropertyChanged "SelLength"
End Property



Public Property Get SaisieAssistée() As String
Attribute SaisieAssistée.VB_Description = "Série de groupes TEXTE=date séparés par des ; pour permettre une saisie texte de dates spéciales"
  SaisieAssistée = sSaisieAssistée
End Property

Public Property Let SaisieAssistée(ByVal New_SaisieAssistée As String)
  sSaisieAssistée = New_SaisieAssistée
  PropertyChanged "SaisieAssistée"
  
  ' Décodage
  Dim iPos As Integer, iPos2 As Integer
  
  ' Comptage des ;
  If New_SaisieAssistée = "" Then
    iNbAssist = 0
    Exit Property
  End If
  
  iNbAssist = 1
  iPos = 0
  Do
    iPos2 = InStr(iPos + 1, sSaisieAssistée, ";")
    If iPos2 = 0 Then Exit Do
    iNbAssist = iNbAssist + 1
    iPos = iPos2
  Loop
  
  ReDim sLibelléSA(1 To iNbAssist)
  ReDim dDateSA(1 To iNbAssist)
  
  Dim iNb As Integer
  iNb = 0
  Do
    If New_SaisieAssistée = "" Then Exit Do
    iNb = iNb + 1
    iPos = InStr2(1, New_SaisieAssistée, ";")
    iPos2 = InStr(New_SaisieAssistée, "=")
    Debug.Assert iPos2 > 0
    sLibelléSA(iNb) = Left(New_SaisieAssistée, iPos2 - 1)
    dDateSA(iNb) = CDate(Mid(New_SaisieAssistée, iPos2 + 1, iPos - iPos2 - 1))
    New_SaisieAssistée = Mid(New_SaisieAssistée, iPos + 1)
  Loop
  Debug.Assert iNb = iNbAssist
End Property



' =====================================================================
' Propagation des événements

Private Sub txtDate_Click()
  RaiseEvent Click
End Sub

Private Sub txtDate_DblClick()
  RaiseEvent DblClick
End Sub

Private Sub txtDate_Change()
  RaiseEvent Change
End Sub

Private Sub txtDate_KeyDown(KeyCode As Integer, Shift As Integer)
  RaiseEvent KeyDown(KeyCode, Shift)
End Sub

' Evénement KeyPress traité plus haut
'Private Sub txtDate_KeyPress(KeyAscii As Integer)
'  RaiseEvent KeyPress(KeyAscii)
'End Sub

Private Sub txtDate_KeyUp(KeyCode As Integer, Shift As Integer)
  RaiseEvent KeyUp(KeyCode, Shift)
End Sub

Private Sub txtDate_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  RaiseEvent MouseDown(Button, Shift, x, y)
End Sub

Private Sub txtDate_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
  RaiseEvent MouseMove(Button, Shift, x, y)
End Sub

Private Sub txtDate_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  RaiseEvent MouseUp(Button, Shift, x, y)
End Sub


