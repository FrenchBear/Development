VERSION 5.00
Begin VB.UserControl ChampHeure 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   ToolboxBitmap   =   "ChampHeure.ctx":0000
   Begin VB.TextBox txtHeure 
      Height          =   495
      Left            =   480
      TabIndex        =   0
      Top             =   540
      Width           =   1215
   End
End
Attribute VB_Name = "ChampHeure"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "TextEdit spécialisé dans la saisie d'une heure"
' ChampHeure
' Contrôle spécialisé dans la saisie d'une heure
'  3/09/97 PV
' 24/10/97 PV Génère l'événement change

Option Explicit

' Evénements
Event Click()
Event DblClick()
Event Change()
Event KeyDown(KeyCode As Integer, Shift As Integer)
Event KeyPress(KeyAscii As Integer)
Event KeyUp(KeyCode As Integer, Shift As Integer)
Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)


' ====================================================================

Private Sub UserControl_InitProperties()
  Set txtHeure.Font = UserControl.Ambient.Font
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  txtHeure.Text = PropBag.ReadProperty("HeureSaisie", "")
  Set txtHeure.Font = PropBag.ReadProperty("Font", Ambient.Font)
  txtHeure.BackColor = PropBag.ReadProperty("BackColor", &H80000005)
  txtHeure.Enabled = PropBag.ReadProperty("Enabled", True)
  txtHeure.Locked = PropBag.ReadProperty("Locked", False)
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("HeureSaisie", txtHeure.Text, "")
  Call PropBag.WriteProperty("Font", txtHeure.Font, Ambient.Font)
  Call PropBag.WriteProperty("BackColor", txtHeure.BackColor, &H80000005)
  Call PropBag.WriteProperty("Enabled", txtHeure.Enabled, True)
  Call PropBag.WriteProperty("Locked", txtHeure.Locked, False)
End Sub

' ====================================================================

Private Sub txtHeure_GotFocus()
  txtHeure.ForeColor = 0
End Sub

Private Sub txtHeure_LostFocus()
  If txtHeure = "" Then
    txtHeure.ForeColor = 0
  ElseIf IsHeure(txtHeure) Then
    Dim hTemp As Integer
    hTemp = hDecodeHeure(txtHeure)
    txtHeure = Format(hTemp \ 100) & ":" & Format(hTemp Mod 100, "00")
    txtHeure.ForeColor = 0
  Else
    txtHeure.ForeColor = &HFF
  End If
End Sub

Public Sub SetFocus()
  txtHeure.SetFocus
End Sub

Private Sub UserControl_Resize()
  txtHeure.Move 0, 0, UserControl.Width, UserControl.Height
End Sub

Public Property Get HeureSaisie() As Variant
  If txtHeure = "" Then
    HeureSaisie = ""
  Else
    Dim hTemp As Integer
    hTemp = hDecodeHeure(txtHeure)
    If hTemp < 0 Then
      HeureSaisie = "ERR"
    Else
      HeureSaisie = hTemp
    End If
  End If
End Property


Public Property Let HeureSaisie(ByVal vNewValue As Variant)
  If VarType(vNewValue) = vbNull Then
    txtHeure = ""
    txtHeure.ForeColor = &H80000008
  ElseIf vNewValue = "" Then
    txtHeure = ""
    txtHeure.ForeColor = &H80000008
  ElseIf IsHeure(vNewValue) Then
    Dim hTemp As Integer
    hTemp = hDecodeHeure(vNewValue)
    txtHeure = Format(hTemp \ 100) & ":" & Format(hTemp Mod 100, "00")
    txtHeure.ForeColor = &H80000008
  Else
    txtHeure = vNewValue
    txtHeure.ForeColor = &HFF
  End If
  PropertyChanged "HeureSaisie"
End Property


Private Function IsHeure(ByVal sHeure As String) As Boolean
  IsHeure = hDecodeHeure(sHeure) >= 0
End Function


' Décode une Heure avec un format en entrée souple
' Retour >=0 si heure 0k, <0 en cas d'errreur
' 15:30 est retourné en 1530
Private Function hDecodeHeure(ByVal sHeure As String) As Integer
  Dim h As Integer, m As Integer

  If IsNumeric(sHeure) Then
    If Len(sHeure) > 4 Then
      h = -1
    Else
      If Len(sHeure) <= 2 Then
        h = Val(sHeure)
        m = 0
      Else
        m = Val(Right(sHeure, 2))
        h = Val(Left(sHeure, Len(sHeure) - 2))
      End If
    End If
  Else
    Dim p As Integer
    p = InStr(sHeure, ":")
    If p = 0 Then
      hDecodeHeure = -1
      Exit Function
    End If
    h = Val(Left(sHeure, p - 1))
    m = Val(Mid(sHeure, p + 1))
  End If
  
  If h < 0 Or h > 23 Or m < 0 Or m > 59 Then
    hDecodeHeure = -1
    Exit Function
  End If
    
  hDecodeHeure = 100 * h + m
End Function

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtHeure,txtHeure,-1,Font
Public Property Get Font() As Font
Attribute Font.VB_Description = "Renvoie un objet Font."
Attribute Font.VB_UserMemId = -512
  Set Font = txtHeure.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set txtHeure.Font = New_Font
  PropertyChanged "Font"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtHeure,txtHeure,-1,BackColor
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Renvoie ou définit la couleur d'arrière-plan utilisée pour afficher le texte et les graphiques d'un objet."
Attribute BackColor.VB_UserMemId = -501
  BackColor = txtHeure.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  txtHeure.BackColor() = New_BackColor
  PropertyChanged "BackColor"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtHeure,txtHeure,-1,BorderStyle
Public Property Get BorderStyle() As Integer
Attribute BorderStyle.VB_Description = "Renvoie ou définit le style de la bordure d'un objet."
Attribute BorderStyle.VB_UserMemId = -504
  BorderStyle = txtHeure.BorderStyle
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtHeure,txtHeure,-1,Enabled
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Renvoie ou définit une valeur qui détermine si un objet peut répondre à des événements générés par l'utilisateur."
Attribute Enabled.VB_UserMemId = -514
  Enabled = txtHeure.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  txtHeure.Enabled() = New_Enabled
  PropertyChanged "Enabled"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtHeure,txtHeure,-1,Locked
Public Property Get Locked() As Boolean
Attribute Locked.VB_Description = "Détermine si un contrôle peut être édité."
  Locked = txtHeure.Locked
End Property

Public Property Let Locked(ByVal New_Locked As Boolean)
  txtHeure.Locked() = New_Locked
  PropertyChanged "Locked"
End Property


Public Property Get SelStart() As Integer
  SelStart = txtHeure.SelStart
End Property

Public Property Let SelStart(ByVal New_SelStart As Integer)
  txtHeure.SelStart() = New_SelStart
  PropertyChanged "SelStart"
End Property

Public Property Get SelLength() As Integer
  SelLength = txtHeure.SelLength
End Property

Public Property Let SelLength(ByVal New_SelLength As Integer)
  txtHeure.SelLength() = New_SelLength
  PropertyChanged "SelLength"
End Property


' =====================================================================
' Propagation des événements

Private Sub txtHeure_Click()
  RaiseEvent Click
End Sub

Private Sub txtHeure_DblClick()
  RaiseEvent DblClick
End Sub

Private Sub txtHeure_Change()
  RaiseEvent Change
End Sub

Private Sub txtHeure_KeyDown(KeyCode As Integer, Shift As Integer)
  RaiseEvent KeyDown(KeyCode, Shift)
End Sub

Private Sub txtHeure_KeyPress(KeyAscii As Integer)
  RaiseEvent KeyPress(KeyAscii)
End Sub

Private Sub txtHeure_KeyUp(KeyCode As Integer, Shift As Integer)
  RaiseEvent KeyUp(KeyCode, Shift)
End Sub

Private Sub txtHeure_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  RaiseEvent MouseDown(Button, Shift, X, Y)
End Sub

Private Sub txtHeure_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  RaiseEvent MouseMove(Button, Shift, X, Y)
End Sub

Private Sub txtHeure_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  RaiseEvent MouseUp(Button, Shift, X, Y)
End Sub


