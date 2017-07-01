VERSION 4.00
Begin VB.Form frmBegin 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "#"
   ClientHeight    =   3540
   ClientLeft      =   1740
   ClientTop       =   1416
   ClientWidth     =   7548
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   0
      weight          =   700
      size            =   7.8
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   Height          =   3912
   Icon            =   "BEGIN.frx":0000
   Left            =   1692
   LinkMode        =   1  'Source
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3540
   ScaleWidth      =   7548
   Top             =   1092
   Width           =   7644
   Begin VB.PictureBox picInstallContainer 
      AutoRedraw      =   -1  'True
      BorderStyle     =   0  'None
      Height          =   1080
      Left            =   330
      ScaleHeight     =   90
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   98
      TabIndex        =   7
      Top             =   510
      Width           =   1170
      Begin VB.PictureBox picInstall 
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         Height          =   720
         Left            =   75
         Picture         =   "BEGIN.frx":0442
         ScaleHeight     =   60
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   64
         TabIndex        =   0
         Top             =   75
         Width           =   768
      End
   End
   Begin VB.Frame fraDir 
      Caption         =   "#"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   400
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   660
      Left            =   135
      TabIndex        =   5
      Top             =   2010
      Width           =   7296
      Begin VB.CommandButton cmdChDir 
         Caption         =   "#"
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   400
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   390
         Left            =   4905
         TabIndex        =   1
         Top             =   195
         Width           =   2310
      End
      Begin VB.Label lblDestDir 
         Caption         =   "#"
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   400
            size            =   7.8
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   135
         TabIndex        =   6
         Top             =   300
         Width           =   4440
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "#"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   400
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   420
      Left            =   2610
      TabIndex        =   2
      Top             =   3030
      Width           =   2205
   End
   Begin VB.Line linTopOfExitButtonIfNoDestDir 
      Visible         =   0   'False
      X1              =   2670
      X2              =   4725
      Y1              =   2280
      Y2              =   2280
   End
   Begin VB.Label lblInstallMsg 
      AutoSize        =   -1  'True
      Caption         =   "*"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   400
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   1725
      TabIndex        =   4
      Top             =   915
      Width           =   5565
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblBegin 
      AutoSize        =   -1  'True
      Caption         =   "#"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   400
         size            =   7.8
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   192
      Left            =   288
      TabIndex        =   3
      Top             =   132
      Width           =   6456
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "frmBegin"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit
Option Compare Text

' Constantes/types pour un "bouton image simulé.
Const x3DLineWidth = 1 ' "Largeur" des "lignes" en surbrillances/ombrés.
Const y3DLineWidth = x3DLineWidth
Const pbXDeltaMouseDown = x3DLineWidth
Const pbYDeltaMouseDown = y3DLineWidth

Private fMouseDown As Boolean

Private Sub cmdChDir_Click()
    ShowPathDialog gstrDIR_DEST

    If gfRetVal = gintRET_CONT Then
        lblDestDir.Caption = gstrDestDir
        PicButtonSetFocus picInstall, True, True
    End If
End Sub

Private Sub cmdExit_Click()
    ExitSetup Me, gintRET_EXIT
End Sub

Private Sub picInstall_Click()
    If IsValidDestDir() = True Then
        Unload Me
    End If
End Sub

Private Sub Form_Load()
    fraDir.Caption = ResolveResString(resFRMDIRECTORY)
    cmdChDir.Caption = ResolveResString(resBTNCHGDIR)
    cmdExit.Caption = ResolveResString(resBTNEXIT)
    lblBegin.Caption = ResolveResString(resLBLBEGIN)
    
    Caption = gstrTitle
    lblInstallMsg.Caption = ResolveResString(IIf(gfForceUseDefDest, resSPECNODEST, resSPECDEST), "|1", gstrAppName)
    lblDestDir.Caption = gstrDestDir

    If gfForceUseDefDest Then
        ' Il est préférable d'utiliser le répertoire de destination par défaut,
        ' et donc l'utilisateur n'a pas la possibilité de le changer.
        fraDir.Visible = False
        
        ' Comble l'espace libre de cette feuille en déplacent le bouton Quitter à l'endroit
        ' où est le cadre, et en ajustant la taille de la feuille en conséquense.
        Dim yAdjust As Integer
        yAdjust = cmdExit.Top - linTopOfExitButtonIfNoDestDir.y1
        cmdExit.Top = cmdExit.Top - yAdjust
        Height = Height - yAdjust
        
        EtchedLine Me, fraDir.Left, cmdExit.Top - cmdExit.Height \ 2, fraDir.Width
    Else
        EtchedLine Me, fraDir.Left, cmdExit.Top - cmdExit.Height \ 2, fraDir.Width
    End If
    
    PicButtonInit picInstall
    
    CenterForm Me
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    If UnloadMode <> 1 Then
        ExitSetup Me, gintRET_EXIT
        Cancel = 1
    End If
End Sub

Private Sub picInstall_GotFocus()
    PicButtonSetFocus picInstall, True, True
End Sub

Private Sub picInstall_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeySpace And Not fPicButtonDown(picInstall) Then
        picInstall.Tag = "1" ' Définit un indicateur comme quoi le bouton est en position "basse".
        PicButtonMouseDn picInstall, picInstallContainer
    ElseIf KeyCode = vbKeyEscape And fPicButtonDown(picInstall) Then
        ' Le bouton annulé a été pressé.
        picInstall.Tag = ""
        PicButtonMouseUp picInstall, picInstallContainer
    End If
End Sub

Private Sub picInstall_KeyUp(KeyCode As Integer, Shift As Integer)
    If KeyCode = vbKeySpace And fPicButtonDown(picInstall) Then
        picInstall.Tag = ""
        PicButtonMouseUp picInstall, picInstallContainer
        picInstall_Click
    End If
End Sub

Private Sub picInstall_LostFocus()
    PicButtonSetFocus picInstall, False, True
End Sub

Private Sub picInstall_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Not fPicButtonDown(picInstall) Then
        picInstall.Tag = "1"
        fMouseDown = True
        PicButtonMouseDn picInstall, picInstallContainer
    End If
End Sub

Private Sub picInstall_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If fMouseDown Then
        ' Détermine si la souris a été déplacée à l'intérieur ou à l'extérieur du bouton,
        ' et déplace la bouton en haut ou en bas en conséquence.
        If fPicButtonDown(picInstall) Then
            If Not PtOverControl(picInstall, X + picInstall.Left, Y + picInstall.Top) Then
                ' La sourie à juste été déplacé à l'extérieur du bouton.
                picInstall.Tag = ""
                PicButtonMouseUp picInstall, picInstallContainer
            End If
        Else
            If PtOverControl(picInstall, X + picInstall.Left, Y + picInstall.Top) Then
                ' La sourie à juste été déplacé à l'intérieur du bouton.
                picInstall.Tag = "1"
                PicButtonMouseDn picInstall, picInstallContainer
            End If
        End If
    End If
End Sub

Private Sub picInstall_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If fPicButtonDown(picInstall) Then
        picInstall.Tag = ""
        PicButtonMouseUp picInstall, picInstallContainer
        fMouseDown = False
    Else
        picInstall.Tag = ""
        fMouseDown = False
    End If
End Sub

Private Sub PicButtonMouseDn(pic As PictureBox, picContainer As PictureBox)
    PicButtonSetFocus pic, True, False
    PicButtonOutline pic, picContainer, pic.Left + 1, pic.Top + 1
    pic.Move pic.Left + 1, pic.Top + 1
End Sub

Private Sub PicButtonMouseUp(pic As PictureBox, picContainer As PictureBox)
    PicButtonOutline pic, picContainer, pic.Left - 1, pic.Top - 1
    pic.Move pic.Left - 1, pic.Top - 1
End Sub

Private Sub PicButtonInit(pic As PictureBox)
    pic.Tag = "" ' Indique the le bouton n'est pas actuellement pressé.
    
    PicButtonSetFocus pic, False, True
End Sub

Private Sub PicButtonOutline(pic As PictureBox, picContainer As PictureBox, ByVal Left As Integer, ByVal Top As Integer)
    Dim x1 As Integer, x2 As Integer, y1 As Integer, y2 As Integer
    
    With picContainer
        .Cls
        If ActiveControl Is pic Then ' A it le focus ?
            ' Desinne une ligne noire autour du bouton.
            picContainer.Line (Left - 3, Top - 3)-Step(pic.Width + 2 * 3, pic.Height + 2 * 3), vb3DDKShadow, B
    
            x1 = Left - 1
            x2 = Left + pic.Width + 1
            y1 = Top - 1
            y2 = Top + pic.Height + 1
        Else
            x1 = Left
            x2 = Left + pic.Width
            y1 = Top
            y2 = Top + pic.Height
        End If
    
        If fPicButtonDown(pic) Then
            ' Dessine une ligne d'ombre sombre autour du bouton.
            picContainer.Line (x1 - 1, y1 - 1)-(x2 + 1, y2 + 1), vb3DShadow, B
        Else
            ' Dessine des lignes d'ombre sombre à droite et en bas du bord externe.
            picContainer.Line (x1 - 1, y2 + 1)-(x2 + 1, y2 + 1), vb3DDKShadow
            picContainer.Line (x2 + 1, y2 + 1)-(x2 + 1, y1 - 1), vb3DDKShadow
            
            ' Dessine des lignes d'ombre moins sombre à droite et en bas du bord interne.
            picContainer.Line (x1, y2)-(x2, y2), vb3DShadow
            picContainer.Line (x2, y2)-(x2, y1), vb3DShadow
            
            ' Dessine des ligne de surbrillance (blanc) à gauche et en haut du bord externe.
            picContainer.Line (x1 - 1, y2 + 1)-(x1 - 1, y1 - 1), vb3DHighlight
            picContainer.Line (x1 - 1, y1 - 1)-(x2 + 1, y1 - 1), vb3DHighlight
        End If
    End With
End Sub

Private Sub PicButtonSetFocus(pic As PictureBox, ByVal fFocus As Boolean, ByVal fRedraw As Boolean)
    If fFocus Then
        pic.SetFocus
    End If
    
    If fRedraw Then
        PicButtonOutline pic, picInstallContainer, pic.Left, pic.Top
    End If
    
    If fFocus Then
        Dim c As Control
        
        For Each c In Controls
            If TypeOf c Is CommandButton Then
                c.Default = False
            End If
        Next c
    End If
End Sub

Private Function PtOverControl(c As Control, ByVal X As Integer, ByVal Y As Integer) As Boolean
    If _
      X >= c.Left _
      And X < c.Left + c.Width _
      And Y >= c.Top _
      And Y < c.Top + c.Height _
    Then
        PtOverControl = True
    Else
        PtOverControl = False
    End If
End Function

Private Function fPicButtonDown(pic As PictureBox)
    fPicButtonDown = (pic.Tag <> "")
End Function

Private Sub picInstallContainer_GotFocus()
    picInstall.SetFocus
End Sub
