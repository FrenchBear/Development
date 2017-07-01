VERSION 5.00
Begin VB.Form frmNFT 
   Caption         =   "Une fiche tournée"
   ClientHeight    =   5445
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8820
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   5445
   ScaleWidth      =   8820
   Begin VB.TextBox txtFiche 
      Height          =   315
      Left            =   1500
      MaxLength       =   6
      TabIndex        =   9
      Top             =   60
      Width           =   855
   End
   Begin VB.TextBox txtComment 
      Height          =   315
      Left            =   1500
      MaxLength       =   65
      TabIndex        =   8
      Top             =   1140
      Width           =   7275
   End
   Begin VB.TextBox txtTournée 
      Height          =   315
      Left            =   1500
      MaxLength       =   65
      TabIndex        =   7
      Top             =   780
      Width           =   7275
   End
   Begin VB.TextBox txtRégion 
      Height          =   315
      Left            =   1500
      MaxLength       =   65
      TabIndex        =   6
      Top             =   420
      Width           =   7275
   End
   Begin FichesTournée.LigneFT lftTotal 
      Height          =   855
      Left            =   360
      TabIndex        =   3
      Top             =   4500
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   1508
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.PictureBox picFrame 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3015
      Left            =   60
      OLEDropMode     =   1  'Manual
      ScaleHeight     =   2955
      ScaleWidth      =   7995
      TabIndex        =   0
      Top             =   1560
      Width           =   8055
      Begin VB.VScrollBar VSscroll 
         Height          =   2715
         Left            =   7620
         TabIndex        =   2
         Top             =   180
         Width           =   255
      End
      Begin VB.PictureBox picGrilleMobile 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1935
         Left            =   60
         OLEDropMode     =   1  'Manual
         ScaleHeight     =   1875
         ScaleWidth      =   7275
         TabIndex        =   1
         Top             =   420
         Width           =   7335
         Begin FichesTournée.LigneFT lft 
            Height          =   975
            Index           =   0
            Left            =   120
            TabIndex        =   4
            Top             =   180
            Visible         =   0   'False
            Width           =   6975
            _ExtentX        =   12303
            _ExtentY        =   1720
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            OLEDropMode     =   1
         End
      End
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Région :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   12
      Top             =   480
      Width           =   780
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Tournée :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   11
      Top             =   840
      Width           =   915
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Commentaire :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   10
      Top             =   1200
      Width           =   1395
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Fiche :"
      Height          =   210
      Left            =   60
      TabIndex        =   5
      Top             =   120
      Width           =   615
   End
End
Attribute VB_Name = "frmNFT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmNFT
' Nouvelles Fiches Tournée
' 10/08/99 PV

Option Explicit

Private sNumFT As String

Dim bMouseDown As Boolean, bDnD As Boolean
Dim x0 As Single, y0 As Single

Dim iNbLignes As Integer


Private Sub lft_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
  bMouseDown = True
  bDnD = False
  x0 = X
  y0 = Y
End Sub

Private Sub lft_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
  If bMouseDown And Not bDnD Then
    If Abs(X - x0) > 100 Or Abs(Y - y0) > 100 Then
      bDnD = True
      sFTSource = sNumFT
      Set lftSource = lft(Index)
      lft(Index).OLEDrag
    End If
  End If
End Sub

Private Sub lft_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
  bMouseDown = False
End Sub


Private Sub lft_OLEStartDrag(Index As Integer, Data As DataObject, AllowedEffects As Long)
  Data.Clear
  Data.SetData Index, vbCFText
  AllowedEffects = 3
End Sub



' ===========================================================================
' Administration de la feuille

Private Sub Form_Load()
  picGrilleMobile.Move 0, 0
End Sub


Private Sub Form_Resize()
  If ScaleWidth < 1000 Or ScaleHeight < 1000 Then Exit Sub
  
  lftTotal.Move 0, ScaleHeight - lftTotal.Height, ScaleWidth
  
  picGrilleMobile.Height = iNbLignes * (lft(0).Height + 40)
  
  picFrame.Move 1, 1560, ScaleWidth - 2, ScaleHeight - 60 * Screen.TwipsPerPixelY - 1560
  picGrilleMobile.Width = picFrame.ScaleWidth - VSscroll.Width - 8 * 15
  VSscroll.Move picFrame.ScaleWidth - VSscroll.Width, 0, VSscroll.Width, picFrame.ScaleHeight
'  VSscroll_Scroll

  If picGrilleMobile.Height < picFrame.Height Then
    VSscroll.Value = 0
    VSscroll.Enabled = False
  Else
    VSscroll.Enabled = True
    VSscroll.Max = (picGrilleMobile.Height - picFrame.Height) / (Screen.TwipsPerPixelY * 10)
  End If
  
  VSscroll_Scroll
End Sub

Private Sub Form_Paint()
  Line (0, 0)-Step(ScaleWidth, 0), vbButtonShadow
  Line (0, 1)-Step(ScaleWidth, 0), vb3DHighlight
End Sub


' Scroll

Private Sub VSscroll_Change()
  VSscroll_Scroll
End Sub

Private Sub VSscroll_Scroll()
  picGrilleMobile.Top = -VSscroll.Value * Screen.TwipsPerPixelY * 10
End Sub



' =======================================================================
' Drag'n'drop

Private Sub OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  If sFTSource = sNumFT Then
    Effect = vbDropEffectNone
    Exit Sub
  End If
  
  If (Shift And 2) = 2 Then   ' Ctrl
    Effect = vbDropEffectCopy
  Else
    Effect = vbDropEffectMove
  End If
  
  ' Récupération des données à proprement parler
'$$
End Sub

Private Sub OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
  If State = vbOver Then
    If sFTSource = sNumFT Then
      Effect = vbDropEffectNone
      Exit Sub
    End If
    
    If (Shift And 2) = 2 Then   ' Ctrl
      Effect = vbDropEffectCopy
    Else
      Effect = vbDropEffectMove
    End If
  End If
End Sub

Private Sub picFrame_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
  OLEDragOver Data, Effect, Button, Shift, X, Y, State
End Sub

Private Sub picFrame_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub


Private Sub picGrilleMobile_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
  OLEDragOver Data, Effect, Button, Shift, X, Y, State
End Sub

Private Sub picGrilleMobile_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub


Private Sub lft_OLEDragOver(Index As Integer, Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
  OLEDragOver Data, Effect, Button, Shift, X, Y, State
End Sub

Private Sub lft_OLEDragDrop(Index As Integer, Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub



' ===========================================================================
' Interface d'accès

Public Property Get ft_fiche() As String
  ft_fiche = sNumFT
End Property

Public Property Let ft_fiche(ByVal vNewValue As String)
  sNumFT = vNewValue
  txtFiche = vNewValue
  Caption = "Fiche tournée " & vNewValue
End Property


Public Property Get ft_région() As String
  ft_région = txtRégion
End Property

Public Property Let ft_région(ByVal vNewValue As String)
  txtRégion = vNewValue
End Property


Public Property Get ft_tournée() As String
  ft_tournée = txtTournée
End Property

Public Property Let ft_tournée(ByVal vNewValue As String)
  txtTournée = vNewValue
End Property


Public Property Get ft_comment() As String
  ft_comment = txtComment
End Property

Public Property Let ft_comment(ByVal vNewValue As String)
  txtComment = vNewValue
End Property




Public Sub AjouteDétail(iNumEtb As Long, sVariocolor As String, sPréfixe As String, sNomEtb As String)
  iNbLignes = iNbLignes + 1
  Load lft(iNbLignes)
  
  With lft(iNbLignes)
    .Move 0, (iNbLignes - 1) * (lft(0).Height + 40)
    .NumEtb = iNumEtb
    .Préfixe = sPréfixe
    .NomEtb = sNomEtb
    .Visible = True
  End With
  picGrilleMobile.Height = iNbLignes * (lft(0).Height + 40)

End Sub
