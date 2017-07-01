VERSION 5.00
Begin VB.UserControl ChampTemp�rature 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   ToolboxBitmap   =   "ChampTemp�rature.ctx":0000
   Begin VB.TextBox txtTemp�rature 
      Height          =   495
      Left            =   480
      TabIndex        =   0
      Top             =   540
      Width           =   1215
   End
End
Attribute VB_Name = "ChampTemp�rature"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "TextEdit sp�cialis� dans la saisie d'une temp�rature"
' ChampTemp�rature
' Contr�le sp�cialis� dans la saisie d'une temp�rature
'  3/09/97 PV
' 24/10/97 PV G�n�re l'�v�nement change

Option Explicit

' Ev�nements
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


Private Sub txtTemp�rature_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc(".") Then
    KeyAscii = Asc(",")
  End If
  RaiseEvent KeyPress(KeyAscii)
End Sub

' ====================================================================

Private Sub UserControl_InitProperties()
  Set txtTemp�rature.Font = UserControl.Ambient.Font
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  txtTemp�rature.Text = PropBag.ReadProperty("Temp�rature", "")
  Set txtTemp�rature.Font = PropBag.ReadProperty("Font", Ambient.Font)
  txtTemp�rature.BackColor = PropBag.ReadProperty("BackColor", &H80000005)
  txtTemp�rature.Enabled = PropBag.ReadProperty("Enabled", True)
  txtTemp�rature.Locked = PropBag.ReadProperty("Locked", False)
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("Temp�rature", txtTemp�rature.Text, "")
  Call PropBag.WriteProperty("Font", txtTemp�rature.Font, Ambient.Font)
  Call PropBag.WriteProperty("BackColor", txtTemp�rature.BackColor, &H80000005)
  Call PropBag.WriteProperty("Enabled", txtTemp�rature.Enabled, True)
  Call PropBag.WriteProperty("Locked", txtTemp�rature.Locked, False)
End Sub

' ====================================================================

Private Sub txtTemp�rature_GotFocus()
  txtTemp�rature.ForeColor = 0
End Sub

Private Sub txtTemp�rature_LostFocus()
  If txtTemp�rature = "" Then
    txtTemp�rature.ForeColor = 0
    Exit Sub
  End If

  If IsNumeric(txtTemp�rature) Then
    If txtTemp�rature >= tMin And txtTemp�rature <= tMax Then
      txtTemp�rature.ForeColor = 0
      Exit Sub
    End If
  End If
  txtTemp�rature.ForeColor = &HFF
End Sub

Public Sub SetFocus()
  txtTemp�rature.SetFocus
End Sub


Private Sub UserControl_Resize()
  txtTemp�rature.Move 0, 0, UserControl.Width, UserControl.Height
End Sub

Public Property Get Temp�rature() As Variant
  If txtTemp�rature = "" Then
    Temp�rature = ""
  ElseIf IsNumeric(txtTemp�rature) Then
    If txtTemp�rature >= tMin And txtTemp�rature <= tMax Then
      Temp�rature = txtTemp�rature
    Else
      Temp�rature = "ERR"
    End If
  Else
    Temp�rature = "ERR"
  End If
End Property


Public Property Let Temp�rature(ByVal vNewValue As Variant)
  If IsNull(vNewValue) Then
    txtTemp�rature = ""
    txtTemp�rature.ForeColor = &H80000008
  ElseIf vNewValue = "" Or IsNumeric(vNewValue) Then
    txtTemp�rature = vNewValue
    txtTemp�rature.ForeColor = &H80000008
  Else
    txtTemp�rature = vNewValue
    txtTemp�rature.ForeColor = &HFF
  End If
  PropertyChanged "Temp�rature"
End Property



'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtTemp�rature,txtTemp�rature,-1,Font
Public Property Get Font() As Font
Attribute Font.VB_Description = "Renvoie un objet Font."
Attribute Font.VB_UserMemId = -512
  Set Font = txtTemp�rature.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set txtTemp�rature.Font = New_Font
  PropertyChanged "Font"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtTemp�rature,txtTemp�rature,-1,BackColor
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Renvoie ou d�finit la couleur d'arri�re-plan utilis�e pour afficher le texte et les graphiques d'un objet."
Attribute BackColor.VB_UserMemId = -501
  BackColor = txtTemp�rature.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  txtTemp�rature.BackColor() = New_BackColor
  PropertyChanged "BackColor"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtTemp�rature,txtTemp�rature,-1,BorderStyle
Public Property Get BorderStyle() As Integer
Attribute BorderStyle.VB_Description = "Renvoie ou d�finit le style de la bordure d'un objet."
Attribute BorderStyle.VB_UserMemId = -504
  BorderStyle = txtTemp�rature.BorderStyle
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtTemp�rature,txtTemp�rature,-1,Enabled
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Renvoie ou d�finit une valeur qui d�termine si un objet peut r�pondre � des �v�nements g�n�r�s par l'utilisateur."
Attribute Enabled.VB_UserMemId = -514
  Enabled = txtTemp�rature.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  txtTemp�rature.Enabled() = New_Enabled
  PropertyChanged "Enabled"
End Property

'ATTENTION! NE PAS SUPPRIMER OU MODIFIER LES LIGNES DE COMMENTAIRES QUI SUIVENT!
'MappingInfo=txtTemp�rature,txtTemp�rature,-1,Locked
Public Property Get Locked() As Boolean
Attribute Locked.VB_Description = "D�termine si un contr�le peut �tre �dit�."
  Locked = txtTemp�rature.Locked
End Property

Public Property Let Locked(ByVal New_Locked As Boolean)
  txtTemp�rature.Locked() = New_Locked
  PropertyChanged "Locked"
End Property


Public Property Get SelStart() As Integer
  SelStart = txtTemp�rature.SelStart
End Property

Public Property Let SelStart(ByVal New_SelStart As Integer)
  txtTemp�rature.SelStart() = New_SelStart
  PropertyChanged "SelStart"
End Property

Public Property Get SelLength() As Integer
  SelLength = txtTemp�rature.SelLength
End Property

Public Property Let SelLength(ByVal New_SelLength As Integer)
  txtTemp�rature.SelLength() = New_SelLength
  PropertyChanged "SelLength"
End Property


' =====================================================================
' Propagation des �v�nements

Private Sub txtTemp�rature_Click()
  RaiseEvent Click
End Sub

Private Sub txtTemp�rature_DblClick()
  RaiseEvent DblClick
End Sub

Private Sub txtTemp�rature_Change()
  RaiseEvent Change
End Sub

Private Sub txtTemp�rature_KeyDown(KeyCode As Integer, Shift As Integer)
  RaiseEvent KeyDown(KeyCode, Shift)
End Sub

' Ev�nement trait� plus haut
'Private Sub txtTemp�rature_KeyPress(KeyAscii As Integer)
'  RaiseEvent KeyPress(KeyAscii)
'End Sub

Private Sub txtTemp�rature_KeyUp(KeyCode As Integer, Shift As Integer)
  RaiseEvent KeyUp(KeyCode, Shift)
End Sub

Private Sub txtTemp�rature_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
  RaiseEvent MouseDown(Button, Shift, x, Y)
End Sub

Private Sub txtTemp�rature_MouseMove(Button As Integer, Shift As Integer, x As Single, Y As Single)
  RaiseEvent MouseMove(Button, Shift, x, Y)
End Sub

Private Sub txtTemp�rature_MouseUp(Button As Integer, Shift As Integer, x As Single, Y As Single)
  RaiseEvent MouseUp(Button, Shift, x, Y)
End Sub


