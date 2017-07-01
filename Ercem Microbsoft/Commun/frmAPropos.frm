VERSION 5.00
Begin VB.Form frmAPropos 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "A propos de…"
   ClientHeight    =   2910
   ClientLeft      =   1740
   ClientTop       =   2055
   ClientWidth     =   6660
   Icon            =   "frmAPropos.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   194
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   444
   ShowInTaskbar   =   0   'False
   Begin VB.Timer tim 
      Enabled         =   0   'False
      Interval        =   50
      Left            =   5700
      Top             =   780
   End
   Begin VB.CommandButton btnOK 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   2580
      TabIndex        =   3
      Top             =   2520
      Width           =   1350
   End
   Begin VB.PictureBox Image1 
      Height          =   1350
      Left            =   120
      Picture         =   "frmAPropos.frx":0442
      ScaleHeight     =   86
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   71
      TabIndex        =   6
      Top             =   120
      Width           =   1125
   End
   Begin VB.Label lblPays 
      AutoSize        =   -1  'True
      Caption         =   "Pays :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   4680
      TabIndex        =   20
      Top             =   1080
      Width           =   585
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   1
      X1              =   100
      X2              =   440
      Y1              =   108
      Y2              =   108
   End
   Begin VB.Label lblMicro 
      AutoSize        =   -1  'True
      Caption         =   "PC :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   1500
      TabIndex        =   19
      Top             =   1695
      Width           =   375
   End
   Begin VB.Label lblUtilisateur 
      AutoSize        =   -1  'True
      Caption         =   "User :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   1500
      TabIndex        =   18
      Top             =   1935
      Width           =   525
   End
   Begin VB.Label lblDomaine 
      AutoSize        =   -1  'True
      Caption         =   "Domain :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   1500
      TabIndex        =   17
      Top             =   2175
      Width           =   795
   End
   Begin VB.Label txtMicro 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   2355
      TabIndex        =   16
      Top             =   1695
      Width           =   60
   End
   Begin VB.Label txtUtilisateur 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   2355
      TabIndex        =   15
      Top             =   1935
      Width           =   60
   End
   Begin VB.Label txtDomaine 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   2355
      TabIndex        =   14
      Top             =   2175
      Width           =   60
   End
   Begin VB.Label lblOSPlatform 
      AutoSize        =   -1  'True
      Caption         =   "OS Platform :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   4695
      TabIndex        =   13
      Top             =   1695
      Width           =   1170
   End
   Begin VB.Label lblOSMM 
      AutoSize        =   -1  'True
      Caption         =   "OS Maj.Min :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   4695
      TabIndex        =   12
      Top             =   1935
      Width           =   1095
   End
   Begin VB.Label lblOSVersion 
      AutoSize        =   -1  'True
      Caption         =   "OS Version :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   4695
      TabIndex        =   11
      Top             =   2175
      Width           =   1095
   End
   Begin VB.Label txtOSPlatform 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   5895
      TabIndex        =   10
      Top             =   1695
      Width           =   60
   End
   Begin VB.Label txtOSMM 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   5895
      TabIndex        =   9
      Top             =   1935
      Width           =   60
   End
   Begin VB.Label txtOSVersion 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   195
      Left            =   5895
      TabIndex        =   8
      Top             =   2175
      Width           =   60
   End
   Begin VB.Label lblRab 
      AutoSize        =   -1  'True
      Caption         =   "Rab"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   1500
      TabIndex        =   7
      Top             =   1320
      Width           =   360
   End
   Begin VB.Image imgAuteur 
      Height          =   1890
      Left            =   -120
      Picture         =   "frmAPropos.frx":4D14
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
   End
   Begin VB.Label lblProtocole 
      AutoSize        =   -1  'True
      Caption         =   "Protocole :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   1500
      TabIndex        =   0
      Top             =   1080
      Width           =   1020
   End
   Begin VB.Label lblDémon 
      AutoSize        =   -1  'True
      Caption         =   "Démon :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   1500
      TabIndex        =   5
      Top             =   840
      Width           =   795
   End
   Begin VB.Label lblBuild 
      AutoSize        =   -1  'True
      Caption         =   "Build :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   1500
      TabIndex        =   4
      Top             =   600
      Width           =   585
   End
   Begin VB.Label lblCopyright 
      AutoSize        =   -1  'True
      Caption         =   "(c) 1996-2000  SILLIKER / P.VIOLENT"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   1500
      TabIndex        =   2
      Top             =   300
      Width           =   3480
   End
   Begin VB.Label lblTitre 
      AutoSize        =   -1  'True
      Caption         =   "Microb'Soft - xxx"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   1500
      TabIndex        =   1
      Top             =   60
      Width           =   1695
   End
End
Attribute VB_Name = "frmAPropos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Boîte à propos générique pour les clients Microb'Soft"
' frmAPropos
' Boîte à propos générique pour les clients Microb'Soft
' octobre 96 PV
'  2/09/1997 Version générique
' 19/08/1998 Musique
' 19/10/1998 Agent
' 27/01/1999 NC Internationalisation
'  2/11/1999 PV lblRab / sInfoRab
' 19/11/2001 PV Pays


Option Explicit

Private Declare Function sndPlaySound Lib "winmm.dll" Alias "sndPlaySoundA" (ByVal lpszSoundName As String, ByVal uFlags As Long) As Long

Const SND_SYNC = &H0
Const SND_ASYNC = &H1
Const SND_NODEFAULT = &H2
Const SND_LOOP = &H8
Const SND_NOSTOP = &H10
Const SND_USUAL = SND_ASYNC And SND_NODEFAULT

Const autopace = 8

Private iFrame As Integer

Private Sub Form_Activate()
  Refresh
  sndPlaySound App.Path & "\gong.wav", 0
End Sub

Sub Form_Click()
End Sub


Private Sub btnOK_Click()
  tim.Enabled = False
  Unload Me
End Sub

Private Sub Form_Load()
  Internationalisation
  
  Move (Screen.Width - Width) \ 2, (Screen.height - height) \ 2
  lblTitre = sNomApp
  
  Dim sMsg As String
  sMsg = sGetIntlLib("APsBuild", "Version %1")
  lblBuild = sprintf(sMsg, App.Major & "." & App.Minor & "." & App.Revision)
  sMsg = sGetIntlLib("APsDémon", "Démon %1 sur le système Unix %2")
  lblDémon = sprintf(sMsg, sVersionDémon, cSystèmeCA)
  sMsg = sGetIntlLib("APsProtocole", "Protocole %1/%2")
  lblProtocole = sprintf(sMsg, iNumProto, iRelProto)
  lblRab = sInfosRab
  sMsg = sGetIntlLib("APsPays", "Pays %1")
  lblPays = sprintf(sMsg, iSystèmePays)
  
  Dim s As New SysInfo
  txtUtilisateur = s.UserName
  txtDomaine = s.Domain & IIf(s.LMLogon, " (Val)", "")
  txtMicro = s.ComputerName
  txtOSPlatform = s.OSPlatform
  txtOSMM = s.OSMajorVersion & "." & s.OSMinorVersion
  txtOSVersion = s.OSVersion
End Sub

Private Sub Image1_Click()
  If Not tim.Enabled Then
    tim.Enabled = True
    iFrame = 1
  End If
End Sub

Private Sub tim_Timer()
  iFrame = iFrame + 2
  If iFrame > Image1.height Then
    tim.Enabled = False
    Exit Sub
  End If
  
  Image1.PaintPicture imgAuteur.Picture, 0, iFrame - Image1.height, Image1.Width, Image1.height
End Sub



Public Sub AProposAgent()
  Dim AgentX As Object
  Dim Character As Object
  
  On Error GoTo pb
  If AgentX Is Nothing Then
    Set AgentX = CreateObject("Agent.Control.2")
    AgentX.Connected = True
    On Error GoTo 0
    Select Case Rnd
      Case Is < 0.33: AgentX.Characters.Load "CharacterID", "Genie.acs"
      Case Is < 0.66: AgentX.Characters.Load "CharacterID", "Merlin.acs"
      Case Else: AgentX.Characters.Load "CharacterID", "Peedy.acs"
    End Select
    Set Character = AgentX.Characters("CharacterID")
    Character.Left = (Me.Left + 3450) / Screen.TwipsPerPixelX
    Character.Top = (Me.Top + 900) / Screen.TwipsPerPixelY
    Character.Balloon.Style = Character.Balloon.Style And (Not autopace)
  End If
  
  Dim r As Object
  Character.Show
  Set r = Character.think("Version " & App.Major & "." & App.Minor & "." & App.Revision)
  Do
    DoEvents
  Loop Until r.Status = 0
  Sleep 2000
  Set r = Character.Hide
  Do
    DoEvents
  Loop Until r.Status = 0
  Exit Sub

pb:
  MsgBox2i "CO070", Err, Err.Description
  'MsgBox "Problème au chargement de l'agent" & vbCrLf & "Err=" & Err & ": " & Err.Description, vbExclamation, sNomApp
End Sub



'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "APCaption"
  SetLib btnOK, "Caption", "btnOK"
  SetLib lblCopyright, "Caption", "APCopyright"
  AjusteControle lblBuild
  AjusteControle lblDémon
  AjusteControle lblProtocole
  AjusteControle lblPays
End Sub

