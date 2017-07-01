VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmConfigUnix 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Configuration système Unix"
   ClientHeight    =   1890
   ClientLeft      =   1155
   ClientTop       =   3390
   ClientWidth     =   6315
   Icon            =   "frmUnix.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   126
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   421
   ShowInTaskbar   =   0   'False
   Begin VB.ComboBox cboSystèmes 
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
      Left            =   1620
      TabIndex        =   1
      Tag             =   "Choisissez dans la liste le système Unix qui gère les données."
      Text            =   "cboSystèmes"
      Top             =   120
      Width           =   2835
   End
   Begin VB.CommandButton btnOK 
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
      Left            =   4860
      TabIndex        =   2
      Top             =   120
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
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
      Left            =   4860
      TabIndex        =   3
      Top             =   525
      Width           =   1350
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
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
      Left            =   4860
      TabIndex        =   4
      Top             =   1080
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   5
      Top             =   1575
      Width           =   6315
      _ExtentX        =   11139
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblSysUnix 
      AutoSize        =   -1  'True
      Caption         =   "&Système Unix :"
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
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   1410
   End
End
Attribute VB_Name = "frmConfigUnix"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille de choix du système Unix auquel est connecté le système"
' frmConfigUnix
' Feuille de choix du système Unix auquel est connecté le système
' 17/03/97 PV Autres systèmes
' 14/10/98 PV Si shift est enfoncé, on demande le nom du système Unix
' 25/01/1999 PV Internationalisation


Option Explicit

Private Sub btnAide_Click()
  Aide "frmconfu"
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnOk_Click()
  If cboSystèmes <> sSystèmeDistant Then
    sSystèmeDistant = cboSystèmes
  End If
  ' On ne mémorise pas le système distant tant que la connexion n'a pas réussi
  Unload Me
End Sub

Public Sub MémoriseSystèmeDistant()
  SaveSetting sApplicationGlobale, "Communications", "SystèmeDistant", sSystèmeDistant
End Sub

Private Sub cboSystèmes_DblClick()
  btnOk_Click
End Sub


Private Sub Form_Load()
  Internationalisation
  
  Select Case cLangage
    Case "F"
      cboSystèmes.AddItem "serveur"
      cboSystèmes.AddItem "grenoble"
      cboSystèmes.AddItem "massy1"
      cboSystèmes.AddItem "microbe"
      cboSystèmes.AddItem "hagar"
      cboSystèmes.AddItem "co2"
      cboSystèmes.AddItem "osny"
      cboSystèmes.AddItem "tripoli"
      cboSystèmes.AddItem "lyon"
      cboSystèmes.AddItem "brux"
    
    Case "I"
      cboSystèmes.AddItem "bergamo"
  
    Case "H"
      cboSystèmes.AddItem "brux"
  
    Case "A"
      cboSystèmes.AddItem "kilt"
  End Select
  
  If sSystèmeDistant = "" Then
    Dim sIP As String
    sIP = frmTCP.TCP.LocalIP
    sIP = Left(sIP, InStrRev(sIP, ".") - 1)
    Select Case sIP
      Case "200.200.200": sSystèmeDistant = "grenoble"
      Case "200.200.201": sSystèmeDistant = "co2"
      Case "200.200.202": sSystèmeDistant = "massy1"
      Case "200.200.203": sSystèmeDistant = "osny"
      Case "200.200.204": sSystèmeDistant = "tripoli"
      Case "200.200.210": sSystèmeDistant = "microbe"
      Case "200.200.220": sSystèmeDistant = "lyon"
      Case "200.200.222": sSystèmeDistant = "hagar"
      Case "200.200.230": sSystèmeDistant = "bergamo"
      Case "200.200.240": sSystèmeDistant = "brux"
      Case "172.16.140":  sSystèmeDistant = "kilt"
    End Select
  End If
  
  cboSystèmes.ListIndex = -1
  Dim i As Integer
  For i = 0 To cboSystèmes.ListCount - 1
    If cboSystèmes.List(i) = sSystèmeDistant Then
      cboSystèmes.ListIndex = i
      Exit For
    End If
  Next
  
  If cboSystèmes.ListIndex = -1 Then
    cboSystèmes.AddItem sSystèmeDistant
    cboSystèmes.ListIndex = cboSystèmes.ListCount - 1
  End If
End Sub


Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub


Public Sub InitSystème()
  If Not bShiftPressed Then sSystèmeDistant = GetSetting(sApplicationGlobale, "Communications", "SystèmeDistant", "")
  If sSystèmeDistant = "" Then Show vbModal
End Sub



Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  
  On Error GoTo FinGotFocus
  ActiveControl.SelStart = 0
  ActiveControl.SelLength = 100
FinGotFocus:

End Sub

Private Sub cboSystèmes_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub



' ============================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "UNCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib lblSysUnix, "Caption", "UNlblSysUnix"
  SetLib cboSystèmes, "Tag", "UNcboSystèmes.tag"
End Sub
