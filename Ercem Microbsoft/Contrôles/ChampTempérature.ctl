VERSION 5.00
Begin VB.UserControl ChampTempérature 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   ToolboxBitmap   =   "ChampTempérature.ctx":0000
   Begin VB.TextBox txtTempérature 
      Height          =   495
      Left            =   480
      TabIndex        =   0
      Top             =   540
      Width           =   1215
   End
End
Attribute VB_Name = "ChampTempérature"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "TextEdit spécialisé dans la saisie d'une température"
' ChampTempérature
' Contrôle spécialisé dans la saisie d'une température
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
Event MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
Event MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
Event MouseUp(Button As Integer, Shift As Integer, x As Single, Y As Single)


Private Const tMin As Single = -40
Private Const tMax As Single = 200


Private Sub txtTempérature_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc(".") Then
    KeyAscii = Asc(",")
  End If
  RaiseEvent KeyPress(KeyAscii)
End Sub

' ====================================================================

Private Sub UserControl_InitProperties()
  Set txtTempérature.Font = UserControl.Ambient.Font
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  txtTempérature.Text = PropBag.ReadProperty("Température", "")
  Set txtTempérature.Font = PropBag.ReadProperty("Font", Ambient.Font)
  txtTempérature.BackColor = PropBag.ReadProperty("BackColor", &H80000005)
  txtTempérature.Enabled = PropBag.ReadProperty("Enabled", True)
  txtTempérature.Locked = PropBag.ReadProperty("Locked", False)
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("Température", txtTempérature.Text, "")
  Call PropBag.WriteProperty("Font", txtTempérature.Font, Ambient.Font)
  Call PropBag.WriteProperty("BackColor", txtTempérature.BackColor, &H80000005)
  Call PropBag.WriteProperty("Enabled", txtTempérature.Enabled, True)
  Call PropBag.WriteProperty("Locked", txtTempérature.Locked, False)
End Sub

' ====================================================================

Private Sub txtTempérature_GotFocus()
  txtTempérature.ForeColor = 0
End Sub

Private Sub txtTempérature_LostFocus()
  If txtTempérature = "" Then
    txtTempérature.ForeColor = 0
    Exit Sub
  End If

  If IsNumeric(txtTempérature) Then
    If txtTempérature >= tMin And txtTempérature <= tMax Then
      txtTempérature.ForeColor = 0
      Exit Sub
    End If
  End If
  txtTempérature.ForeColor = &HFF
End Sub

Public Sub SetFocus()
  txtTempérature.SetFocus
End Sub


Private Sub UserControl_Resize()
  txtTempérature.Move 0, 0, UserControl.Width, UserControl.Height
End Sub

Public Property Get Température() As Variant
  If txtTempérature = "" Then
    Température = ""
  ElseIf IsNumeric(txtTempérature) Then
    If txtTempérature >= tMin And txtTempérature <= tMax Then
      Température = txtTempérature
    Else
      Température = "ERR"
    End If
  Else
    Température = "ERR"
  End If
End Property


Public Property Let Température(ByVal vNewValue As Variant)
  If IsNull(vNewValue) Then
    txtTempérature = ""
    txtTempérature.ForeColor = &H80000008
  ElseIf vNewValue = "" Or IsNumeric(vNewValue) Then
    txtTempérature = vNewValue
    txtTempérature.ForeColor = &H80000008
  Else
    txtTempérature = vNewValue
    txtTempérature.ForeColor = &HFF
  End If
  PropertyChanged "Température"
End Property



'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtTempérature,txtTempérature,-1,Font
Public Property Get Font() As Font
Attribute Font.VB_Description = "Renvoie un objet Font."
Attribute Font.VB_UserMemId = -512
  Set Font = txtTempérature.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set txtTempérature.Font = New_Font
  PropertyChanged "Font"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtTempérature,txtTempérature,-1,BackColor
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Renvoie ou définit la couleur d'arrière-plan utilisée pour afficher le texte et les graphiques d'un objet."
Attribute BackColor.VB_UserMemId = -501
  BackColor = txtTempérature.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  txtTempérature.BackColor() = New_BackColor
  PropertyChanged "BackColor"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtTempérature,txtTempérature,-1,BorderStyle
Public Property Get BorderStyle() As Integer
Attribute BorderStyle.VB_Description = "Renvoie ou définit le style de la bordure d'un objet."
Attribute BorderStyle.VB_UserMemId = -504
  BorderStyle = txtTempérature.BorderStyle
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtTempérature,txtTempérature,-1,Enabled
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Renvoie ou définit une valeur qui détermine si un objet peut répondre à des événements générés par l'utilisateur."
Attribute Enabled.VB_UserMemId = -514
  Enabled = txtTempérature.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  txtTempérature.Enabled() = New_Enabled
  PropertyChanged "Enabled"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtTempérature,txtTempérature,-1,Locked
Public Property Get Locked() As Boolean
Attribute Locked.VB_Description = "Détermine si un contrôle peut être édité."
  Locked = txtTempérature.Locked
End Property

Public Property Let Locked(ByVal New_Locked As Boolean)
  txtTempérature.Locked() = New_Locked
  PropertyChanged "Locked"
End Property


Public Property Get SelStart() As Integer
  SelStart = txtTempérature.SelStart
End Property

Public Property Let SelStart(ByVal New_SelStart As Integer)
  txtTempérature.SelStart() = New_SelStart
  PropertyChanged "SelStart"
End Property

Public Property Get SelLength() As Integer
  SelLength = txtTempérature.SelLength
End Property

Public Property Let SelLength(ByVal New_SelLength As Integer)
  txtTempérature.SelLength() = New_SelLength
  PropertyChanged "SelLength"
End Property


' =====================================================================
' Propagation des événements

Private Sub txtTempérature_Click()
  RaiseEvent Click
End Sub

Private Sub txtTempérature_DblClick()
  RaiseEvent DblClick
End Sub

Private Sub txtTempérature_Change()
  RaiseEvent Change
End Sub

Private Sub txtTempérature_KeyDown(KeyCode As Integer, Shift As Integer)
  RaiseEvent KeyDown(KeyCode, Shift)
End Sub

' Evénement traité plus haut
'Private Sub txtTempérature_KeyPress(KeyAscii As Integer)
'  RaiseEvent KeyPress(KeyAscii)
'End Sub

Private Sub txtTempérature_KeyUp(KeyCode As Integer, Shift As Integer)
  RaiseEvent KeyUp(KeyCode, Shift)
End Sub

Private Sub txtTempérature_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
  RaiseEvent MouseDown(Button, Shift, x, Y)
End Sub

Private Sub txtTempérature_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
  RaiseEvent MouseMove(Button, Shift, x, Y)
End Sub

Private Sub txtTempérature_MouseUp(Button As Integer, Shift As Integer, x As Single, Y As Single)
  RaiseEvent MouseUp(Button, Shift, x, Y)
End Sub


