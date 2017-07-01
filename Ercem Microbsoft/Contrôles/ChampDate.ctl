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
Attribute VB_Description = "TextEdit sp�cialis� dans la saisie d'une date, et saisie assist�e de ABSENCE (#1/1/80#)"
' ChampDate
' Contr�le sp�cialis� dans la saisie d'une date
' Affiche la date 1/1/1980 comme "ABSENCE"
'  3/09/1997 PV
' 24/10/1997 PV G�n�re l'�v�nement change
' 29/10/1997 PV Pas de saisie assist�e "Absence" si le champ est locked
' 19/04/1998 PV Liste variable de dates � saisie assist�e (prop. SaisieAssist�e)
' 18/03/1999 PV DateSaisie propri�t� par d�faut (enfin !)
'  6/11/2001 PV dMax pass� de 2002 � 2004


Option Explicit

' Ev�nements
Event Click()
Event DblClick()
Event Change()
Event KeyDown(KeyCode As Integer, Shift As Integer)
Event KeyPress(KeyAscii As Integer)
Event KeyUp(KeyCode As Integer, Shift As Integer)
Event MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
Event MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Event MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)

' Bornes de vraisemblance absolues, � voir...
Private Const dMin As Date = #1/1/1986#
Private Const dMax As Date = #1/1/2004#

' Saisie assist�e
Dim sSaisieAssist�e As String
Dim iNbAssist As Integer
Dim sLibell�SA() As String
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
  SaisieAssist�e = PropBag.ReadProperty("SaisieAssist�e", "ABSENCE=1/1/1980")
'  If bShiftPressed Then
'    MsgBox "txtDate = " & txtDate & vbCrLf & _
'           "txtDate.BackColor = " & Hex(txtDate.BackColor) & vbCrLf & _
'           "txtDate.Enabled = " & txtDate.Enabled & vbCrLf & _
'           "txtDate.Locked = " & txtDate.Locked & vbCrLf & _
'           "SaisieAssist�e = " & SaisieAssist�e
'  End If
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("DateSaisie", txtDate.Text, "")
  Call PropBag.WriteProperty("Font", txtDate.Font, Ambient.Font)
  Call PropBag.WriteProperty("BackColor", txtDate.BackColor, &H80000005)
  Call PropBag.WriteProperty("Enabled", txtDate.Enabled, True)
  Call PropBag.WriteProperty("Locked", txtDate.Locked, False)
  Call PropBag.WriteProperty("SaisieAssist�e", SaisieAssist�e, "ABSENCE=1/1/1980")
End Sub


' ====================================================================
' Saisie assist�e

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
        If UCase(tNew) = Left(sLibell�SA(i), Len(tNew)) Then
          iNb = iNb + 1
          iRang = i
        End If
      Next
      
      If iNb = 1 Then   ' Seule une combinaison co�ncide
        Dim ss As Integer
        ss = Len(tNew)
        tNew = tNew + Mid(sLibell�SA(iRang), Len(tNew) + 1)
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
  Dim bAssist� As Boolean, i As Integer
  bAssist� = False
  For i = 1 To iNbAssist
    If UCase(txtDate) = UCase(sLibell�SA(i)) Then
      bAssist� = True
      Exit For
    End If
  Next
    
  If txtDate = "" Or bAssist� Then
    txtDate.ForeColor = &H80000008
    Exit Sub
  End If
  
  Dim dTemp As Date
  dTemp = dD�codeDate(txtDate)
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
Attribute DateSaisie.VB_Description = "Acc�s � la date d�cod�e, ou ERR si la saisie est incorrecte"
Attribute DateSaisie.VB_UserMemId = 0
  If txtDate = "" Then
    DateSaisie = ""
  Else
    Dim i As Integer
    For i = 1 To iNbAssist
      If UCase(txtDate) = UCase(sLibell�SA(i)) Then
        DateSaisie = dDateSA(i)
        Exit Property
      End If
    Next

    Dim dTemp As Date
    dTemp = dD�codeDate(txtDate)
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
      If UCase(vNewValue) = UCase(sLibell�SA(i)) Then
        txtDate = UCase(vNewValue)
        txtDate.ForeColor = &H80000008
        Exit Property
      End If
    Next
    
    If IsDate(vNewValue) Then
      For i = 1 To iNbAssist
        If CDate(vNewValue) = dDateSA(i) Then
          txtDate = UCase(sLibell�SA(i))
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


' D�code une date avec un format en entr�e souple
' Retourne #1/1/1900# en cas d'erreur
Private Function dD�codeDate(sDate As String) As Date
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
  dD�codeDate = dTemp
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
Attribute BackColor.VB_Description = "Renvoie ou d�finit la couleur d'arri�re-plan utilis�e pour afficher le texte et les graphiques d'un objet."
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
Attribute BorderStyle.VB_Description = "Renvoie ou d�finit le style de la bordure d'un objet."
Attribute BorderStyle.VB_UserMemId = -504
  BorderStyle = txtDate.BorderStyle
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtDate,txtDate,-1,Enabled
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Renvoie ou d�finit une valeur qui d�termine si un objet peut r�pondre � des �v�nements g�n�r�s par l'utilisateur."
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
Attribute Locked.VB_Description = "D�termine si un contr�le peut �tre �dit�."
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



Public Property Get SaisieAssist�e() As String
Attribute SaisieAssist�e.VB_Description = "S�rie de groupes TEXTE=date s�par�s par des ; pour permettre une saisie texte de dates sp�ciales"
  SaisieAssist�e = sSaisieAssist�e
End Property

Public Property Let SaisieAssist�e(ByVal New_SaisieAssist�e As String)
  sSaisieAssist�e = New_SaisieAssist�e
  PropertyChanged "SaisieAssist�e"
  
  ' D�codage
  Dim iPos As Integer, iPos2 As Integer
  
  ' Comptage des ;
  If New_SaisieAssist�e = "" Then
    iNbAssist = 0
    Exit Property
  End If
  
  iNbAssist = 1
  iPos = 0
  Do
    iPos2 = InStr(iPos + 1, sSaisieAssist�e, ";")
    If iPos2 = 0 Then Exit Do
    iNbAssist = iNbAssist + 1
    iPos = iPos2
  Loop
  
  ReDim sLibell�SA(1 To iNbAssist)
  ReDim dDateSA(1 To iNbAssist)
  
  Dim iNb As Integer
  iNb = 0
  Do
    If New_SaisieAssist�e = "" Then Exit Do
    iNb = iNb + 1
    iPos = InStr2(1, New_SaisieAssist�e, ";")
    iPos2 = InStr(New_SaisieAssist�e, "=")
    Debug.Assert iPos2 > 0
    sLibell�SA(iNb) = Left(New_SaisieAssist�e, iPos2 - 1)
    dDateSA(iNb) = CDate(Mid(New_SaisieAssist�e, iPos2 + 1, iPos - iPos2 - 1))
    New_SaisieAssist�e = Mid(New_SaisieAssist�e, iPos + 1)
  Loop
  Debug.Assert iNb = iNbAssist
End Property



' =====================================================================
' Propagation des �v�nements

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

' Ev�nement KeyPress trait� plus haut
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


