VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.UserControl BDCheck 
   ClientHeight    =   345
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   945
   ScaleHeight     =   345
   ScaleWidth      =   945
   ToolboxBitmap   =   "BDCheck.ctx":0000
   Begin MSWLess.WLText txtCheck 
      Height          =   285
      Left            =   60
      TabIndex        =   0
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   503
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      Appearance      =   1
   End
End
Attribute VB_Name = "BDCheck"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' BDCheck
' Check box spécialisée pour l'accès BD
' Fonctionne comme un champ texte O/N
'  8/07/1999 PV
'  5/11/1999 PV DataField mémorisé
' 29/11/1999 PV Propriétés enabled et locked gérées proprement et dans le PropertyBag
' 20/03/2000 PV Retour du champ texte O/N, reprise complète, ForceTextBoxCase


Option Explicit

'Déclarations d'événements:
Event Click() 'MappingInfo=txtCheck,txtCheck,-1,Click
Event DblClick() 'MappingInfo=txtCheck,txtCheck,-1,DblClick
Event KeyDown(KeyCode As Integer, Shift As Integer) 'MappingInfo=txtCheck,txtCheck,-1,KeyDown
Event KeyPress(KeyAscii As Integer) 'MappingInfo=txtCheck,txtCheck,-1,KeyPress
Event KeyUp(KeyCode As Integer, Shift As Integer) 'MappingInfo=txtCheck,txtCheck,-1,KeyUp
Event MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single) 'MappingInfo=txtCheck,txtCheck,-1,MouseDown
Event MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single) 'MappingInfo=txtCheck,txtCheck,-1,MouseMove
Event MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single) 'MappingInfo=txtCheck,txtCheck,-1,MouseUp


Private sOui As String
Private sNon As String
Private sDataField As String


Private Sub UserControl_Initialize()
  sOui = UCase(Left(Format(True, "Yes/No"), 1))
  sNon = UCase(Left(Format(False, "Yes/No"), 1))
'  sOui = "S"
'  sNon = "N"
End Sub

Private Sub UserControl_Resize()
  txtCheck.Move 0, 0
  UserControl.Width = txtCheck.Width
  UserControl.height = txtCheck.height
End Sub


'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtCheck,txtCheck,-1,BackColor
Public Property Get BackColor() As OLE_COLOR
  BackColor = txtCheck.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  txtCheck.BackColor() = New_BackColor
  PropertyChanged "BackColor"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtCheck,txtCheck,-1,ForeColor
Public Property Get ForeColor() As OLE_COLOR
  ForeColor = txtCheck.ForeColor
End Property

Public Property Let ForeColor(ByVal New_ForeColor As OLE_COLOR)
  txtCheck.ForeColor() = New_ForeColor
  PropertyChanged "ForeColor"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtCheck,txtCheck,-1,Enabled
Public Property Get Enabled() As Boolean
  Enabled = txtCheck.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  txtCheck.Enabled() = New_Enabled
  PropertyChanged "Enabled"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtCheck,txtCheck,-1,Font
Public Property Get Font() As Font
  Set Font = txtCheck.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set txtCheck.Font = New_Font
  PropertyChanged "Font"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtCheck,txtCheck,-1,BorderStyle
Public Property Get BorderStyle() As Integer
  BorderStyle = txtCheck.BorderStyle
End Property

Public Property Let BorderStyle(ByVal New_BorderStyle As Integer)
  txtCheck.BorderStyle() = New_BorderStyle
  PropertyChanged "BorderStyle"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtCheck,txtCheck,-1,Refresh
Public Sub Refresh()
  txtCheck.Refresh
End Sub

Private Sub txtCheck_Click()
  RaiseEvent Click
End Sub

Private Sub txtCheck_DblClick()
  RaiseEvent DblClick
End Sub

Private Sub txtCheck_KeyDown(KeyCode As Integer, Shift As Integer)
  RaiseEvent KeyDown(KeyCode, Shift)
End Sub

Private Sub txtCheck_KeyPress(KeyAscii As Integer)
  RaiseEvent KeyPress(KeyAscii)
End Sub

Private Sub txtCheck_KeyUp(KeyCode As Integer, Shift As Integer)
  RaiseEvent KeyUp(KeyCode, Shift)
End Sub

Private Sub txtCheck_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  RaiseEvent MouseDown(Button, Shift, x, y)
End Sub

Private Sub txtCheck_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
  RaiseEvent MouseMove(Button, Shift, x, y)
End Sub

Private Sub txtCheck_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  RaiseEvent MouseUp(Button, Shift, x, y)
End Sub

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtCheck,txtCheck,-1,Text
Public Property Get Text() As String
Attribute Text.VB_UserMemId = 0
  Dim s As String, i As Integer
  s = UCase(txtCheck.Text)
  For i = 1 To Len(s)
    If Mid(s, i, 1) = sOui Then
      Mid(s, i, 1) = "O"
    ElseIf Mid(s, i, 1) = sNon Then
      Mid(s, i, 1) = "N"
    End If
  Next
  Text = s
End Property

Public Property Let Text(ByVal New_Text As String)
  Dim i As Integer
  For i = 1 To Len(New_Text)
    If UCase(Mid(New_Text, i, 1)) = "O" Then
      Mid(New_Text, i, 1) = sOui
    ElseIf UCase(Mid(New_Text, i, 1)) = "N" Then
      Mid(New_Text, i, 1) = sNon
    End If
  Next
  txtCheck.Text() = New_Text
  PropertyChanged "Text"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtCheck,txtCheck,-1,Locked
Public Property Get Locked() As Boolean
  Locked = txtCheck.Locked
End Property

Public Property Let Locked(ByVal New_Locked As Boolean)
  txtCheck.Locked() = New_Locked
  PropertyChanged "Locked"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtCheck,txtCheck,-1,MaxLength
Public Property Get MaxLength() As Long
  MaxLength = txtCheck.MaxLength
End Property

Public Property Let MaxLength(ByVal New_MaxLength As Long)
  txtCheck.MaxLength() = New_MaxLength
  PropertyChanged "MaxLength"
End Property



Public Property Get DataField() As String
  DataField = sDataField
End Property

Public Property Let DataField(ByVal New_Text As String)
  sDataField = New_Text
  PropertyChanged "DataField"
End Property



'Charger les valeurs des propriétés à partir du stockage
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  txtCheck.BackColor = PropBag.ReadProperty("BackColor", &H80000005)
  txtCheck.ForeColor = PropBag.ReadProperty("ForeColor", &H80000008)
  txtCheck.Enabled = PropBag.ReadProperty("Enabled", True)
  Set txtCheck.Font = PropBag.ReadProperty("Font", Ambient.Font)
  txtCheck.BorderStyle = PropBag.ReadProperty("BorderStyle", 1)
  txtCheck.Text = PropBag.ReadProperty("Text", "")
  txtCheck.Locked = PropBag.ReadProperty("Locked", False)
  txtCheck.MaxLength = PropBag.ReadProperty("MaxLength", 0)
  sDataField = PropBag.ReadProperty("DataField", "")
  txtCheck.SelLength = PropBag.ReadProperty("SelLength", 0)
  txtCheck.SelStart = PropBag.ReadProperty("SelStart", 0)
End Sub

'Écrire les valeurs des propriétés dans le stockage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("BackColor", txtCheck.BackColor, &H80000005)
  Call PropBag.WriteProperty("ForeColor", txtCheck.ForeColor, &H80000008)
  Call PropBag.WriteProperty("Enabled", txtCheck.Enabled, True)
  Call PropBag.WriteProperty("Font", txtCheck.Font, Ambient.Font)
  Call PropBag.WriteProperty("BorderStyle", txtCheck.BorderStyle, 1)
  Call PropBag.WriteProperty("Text", txtCheck.Text, "")
  Call PropBag.WriteProperty("Locked", txtCheck.Locked, False)
  Call PropBag.WriteProperty("MaxLength", txtCheck.MaxLength, 0)
  PropBag.WriteProperty "DataField", sDataField, ""
  Call PropBag.WriteProperty("SelLength", txtCheck.SelLength, 0)
  Call PropBag.WriteProperty("SelStart", txtCheck.SelStart, 0)
End Sub


'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtCheck,txtCheck,-1,SelLength
Public Property Get SelLength() As Long
Attribute SelLength.VB_Description = "Renvoie ou définit le nombre des caractères sélectionnés."
  SelLength = txtCheck.SelLength
End Property

Public Property Let SelLength(ByVal New_SelLength As Long)
  txtCheck.SelLength() = New_SelLength
  PropertyChanged "SelLength"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtCheck,txtCheck,-1,SelStart
Public Property Get SelStart() As Long
Attribute SelStart.VB_Description = "Renvoie ou définit le point de départ du texte sélectionné."
  SelStart = txtCheck.SelStart
End Property

Public Property Let SelStart(ByVal New_SelStart As Long)
  txtCheck.SelStart() = New_SelStart
  PropertyChanged "SelStart"
End Property



Public Sub ForceTextBoxCase(Optional ConvertCase As Integer)
  VBLib.ForceTextBoxCase txtCheck, ConvertCase
End Sub
