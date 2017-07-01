VERSION 5.00
Begin VB.UserControl LigneFT 
   BackColor       =   &H00C0C000&
   ClientHeight    =   690
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9150
   DataBindingBehavior=   2  'DataConsumer
   ScaleHeight     =   690
   ScaleWidth      =   9150
   Begin VB.Label txtVal 
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Index           =   204
      Left            =   5700
      TabIndex        =   11
      Top             =   360
      Width           =   435
   End
   Begin VB.Label txtVal 
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Index           =   104
      Left            =   5700
      TabIndex        =   10
      Top             =   60
      Width           =   435
   End
   Begin VB.Line Line1 
      Index           =   3
      X1              =   5640
      X2              =   5640
      Y1              =   0
      Y2              =   660
   End
   Begin VB.Label txtVal 
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Index           =   203
      Left            =   5160
      TabIndex        =   9
      Top             =   360
      Width           =   435
   End
   Begin VB.Label txtVal 
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Index           =   103
      Left            =   5160
      TabIndex        =   8
      Top             =   60
      Width           =   435
   End
   Begin VB.Line Line1 
      Index           =   2
      X1              =   5100
      X2              =   5100
      Y1              =   0
      Y2              =   660
   End
   Begin VB.Label txtVal 
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Index           =   202
      Left            =   4620
      TabIndex        =   7
      Top             =   360
      Width           =   435
   End
   Begin VB.Label txtVal 
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Index           =   102
      Left            =   4620
      TabIndex        =   6
      Top             =   60
      Width           =   435
   End
   Begin VB.Line Line1 
      Index           =   1
      X1              =   4560
      X2              =   4560
      Y1              =   0
      Y2              =   660
   End
   Begin VB.Label txtVal 
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Index           =   201
      Left            =   4080
      TabIndex        =   5
      Top             =   360
      Width           =   435
   End
   Begin VB.Label txtVal 
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Index           =   101
      Left            =   4080
      TabIndex        =   4
      Top             =   60
      Width           =   435
   End
   Begin VB.Label txtVariocolor 
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Left            =   1140
      TabIndex        =   3
      Top             =   60
      Width           =   1035
   End
   Begin VB.Label txtNomEtb 
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Left            =   1140
      TabIndex        =   2
      Top             =   360
      Width           =   2835
   End
   Begin VB.Label txtPréfixe 
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Left            =   60
      TabIndex        =   1
      Top             =   360
      Width           =   1035
   End
   Begin VB.Label txtNumEtb 
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   555
   End
   Begin VB.Line Line1 
      Index           =   0
      X1              =   4020
      X2              =   4020
      Y1              =   0
      Y2              =   660
   End
End
Attribute VB_Name = "LigneFT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'Valeurs de propriétés par défaut:
Const m_def_BackColor = 0
Const m_def_ForeColor = 0
Const m_def_Enabled = 0
Const m_def_BackStyle = 0
Const m_def_BorderStyle = 0
'Variables de propriétés:
Dim m_BackColor As Long
Dim m_ForeColor As Long
Dim m_Enabled As Boolean
Dim m_Font As Font
Dim m_BackStyle As Integer
Dim m_BorderStyle As Integer

'Déclarations d'événements:
Event OLEStartDrag(Data As DataObject, AllowedEffects As Long)
Attribute OLEStartDrag.VB_Description = "Se produit lorsqu'une opération glisser-déplacer OLE est initialisée manuellement ou automatiquement."
Event OLESetData(Data As DataObject, DataFormat As Integer)
Attribute OLESetData.VB_Description = "Se produit au contrôle source d'une opération glisser-déplacer OLE lorsque la cible du déplacement requiert des données qui n'étaient pas fournies à l'objet DataObject durant l'événement OLEDragStart."
Event OLEGiveFeedback(Effect As Long, DefaultCursors As Boolean)
Attribute OLEGiveFeedback.VB_Description = "Se produit au contrôle source d'une opération glisser-déplacer OLE lorsque le curseur de la souris doit être modifié."
Event OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
Attribute OLEDragOver.VB_Description = "Se produit lorsque la souris est déplacée au-dessus du contrôle au cours d'une opération glisser-déplacer OLE, si une des propriétés OLEDropMode est définie à Manual."
Event OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
Attribute OLEDragDrop.VB_Description = "Se produit lorsque des données sont déposées sur un contrôle à l'aide d'une opération glisser-déplacer OLE, alors que OLEDropMode a la valeur Manual."
Event OLECompleteDrag(Effect As Long)
Attribute OLECompleteDrag.VB_Description = "Se produit au contrôle source d'une opération glisser-déplacer OLE après la fin ou l'annulation d'un glisser-déplacer manuel ou automatique."
Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single) 'MappingInfo=UserControl,UserControl,-1,MouseDown
Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single) 'MappingInfo=UserControl,UserControl,-1,MouseMove
Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single) 'MappingInfo=UserControl,UserControl,-1,MouseUp
Event Click()
Attribute Click.VB_Description = "Se produit lorsque l'utilisateur appuie sur un bouton de la souris puis le relâche au-dessus d'un objet."
Event DblClick()
Attribute DblClick.VB_Description = "Se produit lorsque l'utilisateur appuie sur un bouton de la souris et le relâche puis appuie à nouveau dessus avant de le relâcher au-dessus d'un objet."
Event KeyDown(KeyCode As Integer, Shift As Integer)
Attribute KeyDown.VB_Description = "Se produit lorsque l'utilisateur appuie sur une touche alors qu'un objet a le focus."
Event KeyPress(KeyAscii As Integer)
Attribute KeyPress.VB_Description = "Se produit lorsque l'utilisateur appuie sur une touche ANSI puis la relâche ."
Event KeyUp(KeyCode As Integer, Shift As Integer)
Attribute KeyUp.VB_Description = "Se produit lorsque l'utilisateur relâche une touche alors qu'un objet a le focus."




'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MemberInfo=8,0,0,0
Public Property Get BackColor() As Long
Attribute BackColor.VB_Description = "Renvoie ou définit la couleur d'arrière-plan utilisée pour afficher le texte et les graphiques d'un objet."
  BackColor = m_BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As Long)
  m_BackColor = New_BackColor
  PropertyChanged "BackColor"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MemberInfo=8,0,0,0
Public Property Get ForeColor() As Long
Attribute ForeColor.VB_Description = "Renvoie ou définit la couleur de premier plan utilisée pour afficher le texte et les graphiques d'un objet."
  ForeColor = m_ForeColor
End Property

Public Property Let ForeColor(ByVal New_ForeColor As Long)
  m_ForeColor = New_ForeColor
  PropertyChanged "ForeColor"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MemberInfo=0,0,0,0
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Renvoie ou définit une valeur qui détermine si un objet peut répondre à des événements générés par l'utilisateur."
  Enabled = m_Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  m_Enabled = New_Enabled
  PropertyChanged "Enabled"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MemberInfo=6,0,0,0
Public Property Get Font() As Font
Attribute Font.VB_Description = "Renvoie un objet Font."
Attribute Font.VB_UserMemId = -512
  Set Font = m_Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set m_Font = New_Font
  PropertyChanged "Font"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MemberInfo=7,0,0,0
Public Property Get BackStyle() As Integer
Attribute BackStyle.VB_Description = "Indique si un contrôle Label ou l'arrière-plan d'un contrôle Shape sont transparent ou opaque."
  BackStyle = m_BackStyle
End Property

Public Property Let BackStyle(ByVal New_BackStyle As Integer)
  m_BackStyle = New_BackStyle
  PropertyChanged "BackStyle"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MemberInfo=7,0,0,0
Public Property Get BorderStyle() As Integer
Attribute BorderStyle.VB_Description = "Renvoie ou définit le style de la bordure d'un objet."
  BorderStyle = m_BorderStyle
End Property

Public Property Let BorderStyle(ByVal New_BorderStyle As Integer)
  m_BorderStyle = New_BorderStyle
  PropertyChanged "BorderStyle"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MemberInfo=5
Public Sub Refresh()
Attribute Refresh.VB_Description = "Force un nouvel affichage complet d'un objet."
   
End Sub


Private Sub UserControl_GotFocus()
'  shpFocus.FillColor = &H8000000D
  Beep
End Sub

Private Sub UserControl_LostFocus()
'  shpFocus.FillColor = &H8000000F
End Sub


'Initialiser les propriétés pour le contrôle utilisateur
Private Sub UserControl_InitProperties()
  m_BackColor = m_def_BackColor
  m_ForeColor = m_def_ForeColor
  m_Enabled = m_def_Enabled
  Set m_Font = Ambient.Font
  m_BackStyle = m_def_BackStyle
  m_BorderStyle = m_def_BorderStyle
End Sub



Private Sub UserControl_OLECompleteDrag(Effect As Long)
  RaiseEvent OLECompleteDrag(Effect)
End Sub

Private Sub UserControl_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  RaiseEvent OLEDragDrop(Data, Effect, Button, Shift, X, Y)
End Sub

Private Sub UserControl_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
  RaiseEvent OLEDragOver(Data, Effect, Button, Shift, X, Y, State)
End Sub

Private Sub UserControl_OLEGiveFeedback(Effect As Long, DefaultCursors As Boolean)
  RaiseEvent OLEGiveFeedback(Effect, DefaultCursors)
End Sub

Private Sub UserControl_OLESetData(Data As DataObject, DataFormat As Integer)
  RaiseEvent OLESetData(Data, DataFormat)
End Sub

Private Sub UserControl_OLEStartDrag(Data As DataObject, AllowedEffects As Long)
  RaiseEvent OLEStartDrag(Data, AllowedEffects)
End Sub



'Charger les valeurs des propriétés à partir du stockage
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)

  m_BackColor = PropBag.ReadProperty("BackColor", m_def_BackColor)
  m_ForeColor = PropBag.ReadProperty("ForeColor", m_def_ForeColor)
  m_Enabled = PropBag.ReadProperty("Enabled", m_def_Enabled)
  Set m_Font = PropBag.ReadProperty("Font", Ambient.Font)
  m_BackStyle = PropBag.ReadProperty("BackStyle", m_def_BackStyle)
  m_BorderStyle = PropBag.ReadProperty("BorderStyle", m_def_BorderStyle)
  txtNumEtb.Caption = PropBag.ReadProperty("NumEtb", "")
  txtPréfixe.Caption = PropBag.ReadProperty("Préfixe", "")
  txtNomEtb.Caption = PropBag.ReadProperty("NomEtb", "")
  UserControl.OLEDropMode = PropBag.ReadProperty("OLEDropMode", 0)
  txtNumEtb.Caption = PropBag.ReadProperty("NumEtb", "")
  txtPréfixe.Caption = PropBag.ReadProperty("Préfixe", "")
  txtNomEtb.Caption = PropBag.ReadProperty("NomEtb", "")
  txtVariocolor.Caption = PropBag.ReadProperty("Variocolor", "")
  txtVal(101).Caption = PropBag.ReadProperty("t101", "")
  txtVal(102).Caption = PropBag.ReadProperty("t102", "")
  txtVal(103).Caption = PropBag.ReadProperty("t103", "")
  txtVal(104).Caption = PropBag.ReadProperty("t104", "")
  txtVal(201).Caption = PropBag.ReadProperty("t201", "")
  txtVal(202).Caption = PropBag.ReadProperty("t202", "")
  txtVal(203).Caption = PropBag.ReadProperty("t203", "")
  txtVal(204).Caption = PropBag.ReadProperty("t204", "")
End Sub

'Écrire les valeurs des propriétés dans le stockage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)

  Call PropBag.WriteProperty("BackColor", m_BackColor, m_def_BackColor)
  Call PropBag.WriteProperty("ForeColor", m_ForeColor, m_def_ForeColor)
  Call PropBag.WriteProperty("Enabled", m_Enabled, m_def_Enabled)
  Call PropBag.WriteProperty("Font", m_Font, Ambient.Font)
  Call PropBag.WriteProperty("BackStyle", m_BackStyle, m_def_BackStyle)
  Call PropBag.WriteProperty("BorderStyle", m_BorderStyle, m_def_BorderStyle)
  Call PropBag.WriteProperty("NumEtb", txtNumEtb.Caption, "")
  Call PropBag.WriteProperty("Préfixe", txtPréfixe.Caption, "")
  Call PropBag.WriteProperty("NomEtb", txtNomEtb.Caption, "")
  Call PropBag.WriteProperty("OLEDropMode", UserControl.OLEDropMode, 0)
  Call PropBag.WriteProperty("NumEtb", txtNumEtb.Caption, "")
  Call PropBag.WriteProperty("Préfixe", txtPréfixe.Caption, "")
  Call PropBag.WriteProperty("NomEtb", txtNomEtb.Caption, "")
  Call PropBag.WriteProperty("Variocolor", txtVariocolor.Caption, "")
  Call PropBag.WriteProperty("t101", txtVal(101).Caption, "")
  Call PropBag.WriteProperty("t102", txtVal(102).Caption, "")
  Call PropBag.WriteProperty("t103", txtVal(103).Caption, "")
  Call PropBag.WriteProperty("t104", txtVal(104).Caption, "")
  Call PropBag.WriteProperty("t201", txtVal(201).Caption, "")
  Call PropBag.WriteProperty("t202", txtVal(202).Caption, "")
  Call PropBag.WriteProperty("t203", txtVal(203).Caption, "")
  Call PropBag.WriteProperty("t204", txtVal(204).Caption, "")
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  RaiseEvent MouseDown(Button, Shift, X, Y)
End Sub

Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  RaiseEvent MouseMove(Button, Shift, X, Y)
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  RaiseEvent MouseUp(Button, Shift, X, Y)
End Sub


'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MemberInfo=5
Public Sub OLEDrag()
Attribute OLEDrag.VB_Description = "Initie un événement OLE glisser-déplacer avec comme source le contrôle donné."
  UserControl.OLEDrag
End Sub

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=UserControl,UserControl,-1,OLEDropMode
Public Property Get OLEDropMode() As Integer
Attribute OLEDropMode.VB_Description = "Renvoie ou définit si cet objet peut agir comme une cible de l'opération de déplacement OLE."
  OLEDropMode = UserControl.OLEDropMode
End Property

Public Property Let OLEDropMode(ByVal New_OLEDropMode As Integer)
  UserControl.OLEDropMode() = New_OLEDropMode
  PropertyChanged "OLEDropMode"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtNumEtb,txtNumEtb,-1,Caption
Public Property Get NumEtb() As String
Attribute NumEtb.VB_Description = "Renvoie ou définit le texte affiché dans la barre de titre d'un objet ou sous l'icône d'un objet."
  NumEtb = txtNumEtb.Caption
End Property

Public Property Let NumEtb(ByVal New_NumEtb As String)
  txtNumEtb.Caption() = New_NumEtb
  PropertyChanged "NumEtb"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtPréfixe,txtPréfixe,-1,Caption
Public Property Get Préfixe() As String
Attribute Préfixe.VB_Description = "Renvoie ou définit le texte affiché dans la barre de titre d'un objet ou sous l'icône d'un objet."
  Préfixe = txtPréfixe.Caption
End Property

Public Property Let Préfixe(ByVal New_Préfixe As String)
  txtPréfixe.Caption() = New_Préfixe
  PropertyChanged "Préfixe"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtNomEtb,txtNomEtb,-1,Caption
Public Property Get NomEtb() As String
Attribute NomEtb.VB_Description = "Renvoie ou définit le texte affiché dans la barre de titre d'un objet ou sous l'icône d'un objet."
  NomEtb = txtNomEtb.Caption
End Property

Public Property Let NomEtb(ByVal New_NomEtb As String)
  txtNomEtb.Caption() = New_NomEtb
  PropertyChanged "NomEtb"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtVariocolor,txtVariocolor,-1,Caption
Public Property Get Variocolor() As String
Attribute Variocolor.VB_Description = "Renvoie ou définit le texte affiché dans la barre de titre d'un objet ou sous l'icône d'un objet."
  Variocolor = txtVariocolor.Caption
End Property

Public Property Let Variocolor(ByVal New_Variocolor As String)
  txtVariocolor.Caption() = New_Variocolor
  PropertyChanged "Variocolor"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtVal(101),txtVal,101,Caption
Public Property Get t101() As String
Attribute t101.VB_Description = "Renvoie ou définit le texte affiché dans la barre de titre d'un objet ou sous l'icône d'un objet."
  t101 = txtVal(101).Caption
End Property

Public Property Let t101(ByVal New_t101 As String)
  txtVal(101).Caption() = New_t101
  PropertyChanged "t101"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtVal(102),txtVal,102,Caption
Public Property Get t102() As String
Attribute t102.VB_Description = "Renvoie ou définit le texte affiché dans la barre de titre d'un objet ou sous l'icône d'un objet."
  t102 = txtVal(102).Caption
End Property

Public Property Let t102(ByVal New_t102 As String)
  txtVal(102).Caption() = New_t102
  PropertyChanged "t102"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtVal(103),txtVal,103,Caption
Public Property Get t103() As String
Attribute t103.VB_Description = "Renvoie ou définit le texte affiché dans la barre de titre d'un objet ou sous l'icône d'un objet."
  t103 = txtVal(103).Caption
End Property

Public Property Let t103(ByVal New_t103 As String)
  txtVal(103).Caption() = New_t103
  PropertyChanged "t103"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtVal(104),txtVal,104,Caption
Public Property Get t104() As String
Attribute t104.VB_Description = "Renvoie ou définit le texte affiché dans la barre de titre d'un objet ou sous l'icône d'un objet."
  t104 = txtVal(104).Caption
End Property

Public Property Let t104(ByVal New_t104 As String)
  txtVal(104).Caption() = New_t104
  PropertyChanged "t104"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtVal(201),txtVal,201,Caption
Public Property Get t201() As String
Attribute t201.VB_Description = "Renvoie ou définit le texte affiché dans la barre de titre d'un objet ou sous l'icône d'un objet."
  t201 = txtVal(201).Caption
End Property

Public Property Let t201(ByVal New_t201 As String)
  txtVal(201).Caption() = New_t201
  PropertyChanged "t201"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtVal(202),txtVal,202,Caption
Public Property Get t202() As String
Attribute t202.VB_Description = "Renvoie ou définit le texte affiché dans la barre de titre d'un objet ou sous l'icône d'un objet."
  t202 = txtVal(202).Caption
End Property

Public Property Let t202(ByVal New_t202 As String)
  txtVal(202).Caption() = New_t202
  PropertyChanged "t202"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtVal(203),txtVal,203,Caption
Public Property Get t203() As String
Attribute t203.VB_Description = "Renvoie ou définit le texte affiché dans la barre de titre d'un objet ou sous l'icône d'un objet."
  t203 = txtVal(203).Caption
End Property

Public Property Let t203(ByVal New_t203 As String)
  txtVal(203).Caption() = New_t203
  PropertyChanged "t203"
End Property

'ATTENTION! NE SUPPRIMEZ PAS OU NE MODIFIEZ PAS LES LIGNES COMMENTÉES SUIVANTES!
'MappingInfo=txtVal(204),txtVal,204,Caption
Public Property Get t204() As String
Attribute t204.VB_Description = "Renvoie ou définit le texte affiché dans la barre de titre d'un objet ou sous l'icône d'un objet."
  t204 = txtVal(204).Caption
End Property

Public Property Let t204(ByVal New_t204 As String)
  txtVal(204).Caption() = New_t204
  PropertyChanged "t204"
End Property

