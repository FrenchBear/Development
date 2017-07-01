VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmImprimeStats 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Impression de stats"
   ClientHeight    =   4785
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmImprimeStats.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4785
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog dlg 
      Left            =   2400
      Top             =   480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComCtl2.UpDown UpDown1 
      Height          =   315
      Left            =   1320
      TabIndex        =   5
      Top             =   540
      Width           =   240
      _ExtentX        =   423
      _ExtentY        =   556
      _Version        =   393216
      BuddyControl    =   "txtNbEx"
      BuddyDispid     =   196610
      OrigLeft        =   1320
      OrigTop         =   540
      OrigRight       =   1560
      OrigBottom      =   855
      SyncBuddy       =   -1  'True
      BuddyProperty   =   0
      Enabled         =   -1  'True
   End
   Begin VB.CommandButton btnExplorer 
      Caption         =   "…"
      Height          =   315
      Left            =   4320
      TabIndex        =   2
      Top             =   128
      Width           =   315
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   19
      Top             =   4470
      Width           =   4680
      _ExtentX        =   8255
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.TextBox txtNbEx 
      Height          =   315
      Left            =   960
      TabIndex        =   4
      Text            =   "1"
      Top             =   540
      Width           =   360
   End
   Begin VB.CommandButton btnAPropos 
      Caption         =   "A &propos…"
      Height          =   375
      Left            =   3300
      TabIndex        =   18
      Top             =   4020
      Width           =   1215
   End
   Begin VB.CommandButton btnQuitter 
      Cancel          =   -1  'True
      Caption         =   "&Quitter"
      Height          =   375
      Left            =   1500
      TabIndex        =   17
      Top             =   4020
      Width           =   1215
   End
   Begin VB.CommandButton btnImprimer 
      Caption         =   "&Imprimer"
      Default         =   -1  'True
      Height          =   375
      Left            =   120
      TabIndex        =   16
      Top             =   4020
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Imprimante Unix"
      Height          =   2655
      Left            =   120
      TabIndex        =   6
      Top             =   1020
      Width           =   4395
      Begin VB.OptionButton optImpr 
         Caption         =   "\\massy1\laser&mars.c"
         Height          =   210
         Index           =   7
         Left            =   120
         TabIndex        =   13
         Top             =   1740
         Width           =   2475
      End
      Begin VB.OptionButton optImpr 
         Caption         =   "\\massy1\lasermas&3.c"
         Height          =   210
         Index           =   6
         Left            =   120
         TabIndex        =   12
         Top             =   1500
         Width           =   2475
      End
      Begin VB.TextBox txtAutre 
         Height          =   315
         Left            =   1140
         TabIndex        =   15
         Top             =   2220
         Width           =   3135
      End
      Begin VB.OptionButton optImpr 
         Caption         =   "A&utre :"
         Height          =   210
         Index           =   0
         Left            =   120
         TabIndex        =   14
         Top             =   2280
         Width           =   1035
      End
      Begin VB.OptionButton optImpr 
         Caption         =   "\\massy1\lasermas&2.c"
         Height          =   210
         Index           =   5
         Left            =   120
         TabIndex        =   11
         Top             =   1260
         Width           =   2475
      End
      Begin VB.OptionButton optImpr 
         Caption         =   "\\massy1\lasermas&1.c"
         Height          =   210
         Index           =   4
         Left            =   120
         TabIndex        =   10
         Top             =   1020
         Width           =   2475
      End
      Begin VB.OptionButton optImpr 
         Caption         =   "\\grenoble\laser&glop.c"
         Height          =   210
         Index           =   3
         Left            =   120
         TabIndex        =   9
         Top             =   780
         Width           =   2475
      End
      Begin VB.OptionButton optImpr 
         Caption         =   "\\grenoble\laser&aix.c"
         Height          =   210
         Index           =   2
         Left            =   120
         TabIndex        =   8
         Top             =   540
         Width           =   2475
      End
      Begin VB.OptionButton optImpr 
         Caption         =   "\\serveur\laser&ec.c"
         Height          =   210
         Index           =   1
         Left            =   120
         TabIndex        =   7
         Top             =   300
         Width           =   2475
      End
   End
   Begin VB.TextBox txtFichier 
      Height          =   315
      Left            =   960
      TabIndex        =   1
      Top             =   120
      Width           =   3255
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "&Nb ex :"
      Height          =   210
      Left            =   120
      TabIndex        =   3
      Top             =   600
      Width           =   675
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Fichier :"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   735
   End
End
Attribute VB_Name = "frmImprimeStats"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ImprimeStats
' Programme d'impression de stats Unix depuis Windows
' 16/01/1998 PV
' 17/01/1998 PV   Copie via FileCopy et plus shell "command /c copy"
' 21/01/1998 PV   Suffixes .dat et .imp autorisés
' 11/06/1998 PV   laserglop, lasermas3, lasermars
' 17/02/2000 PV   Version VB6; vienne --> massy1

Option Explicit

Const sNomApp As String = "Imprime stats"

Private Sub btnAPropos_Click()
  MsgBox "Imprime stats" & vbCrLf & "Programme d'impression de stats Unix depuis Windows" & vbCrLf & vbCrLf & "Version 1.1.0 du 17/02/2000", vbInformation, sNomApp
End Sub

Private Sub btnImprimer_Click()
  If txtFichier = "" Then
    MsgBox "Précisez un nom de fichier à imprimer !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  If LCase(Right(txtFichier, 4)) <> ".imp" And LCase(Right(txtFichier, 4)) <> ".dat" Then
    MsgBox "Le nom du fichier à imprimer doit se terminer par '.imp' ou '.dat' !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  If Not bExist(txtFichier) Then
    MsgBox "Fichier '" & txtFichier & "' inexistant ou inaccessible !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  If Not IsNumeric(txtNbEx) Then
    MsgBox "Nombre d'exemplaires incorrect !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  Dim iNbEx As Integer
  iNbEx = CInt(txtNbEx)
  If iNbEx < 1 Or iNbEx > 10 Then
    MsgBox "Le nombre d'exemplaires doit être compris entre 1 et 10 !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  Dim sDest As String
  Dim i As Integer
  
  If optImpr(0).Value Then
    sDest = txtAutre
  Else
    For i = 1 To 7
      If optImpr(i).Value Then
        sDest = optImpr(i).Caption
        i = InStr(sDest, "&")
        If i > 0 Then sDest = Left(sDest, i - 1) & Mid(sDest, i + 1)
        Exit For
      End If
    Next
  End If
  If sDest = "" Then
    MsgBox "Choisissez une imprimante !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  btnImprimer.Enabled = False
  btnQuitter.Enabled = False
  Screen.MousePointer = vbHourglass
  For i = 1 To iNbEx
    On Error Resume Next
    FileCopy txtFichier, sDest
    If Err Then
      frmMsgBox2.MsgBox2 "Échec lors de la copie" & vbCrLf & vbCrLf & "Err=" & Err & ": " & Error, vbExclamation, sNomApp, "http://www.silliker/bibdocs/impstat.htm#pbauto"
      Exit For
    End If
    Sleep 1
  Next
  Screen.MousePointer = vbDefault
  btnImprimer.Enabled = True
  btnQuitter.Enabled = True
End Sub

Private Sub btnExplorer_GotFocus()
  sbStatus.SimpleText = "Rechercher un fichier"
End Sub

Private Sub btnImprimer_GotFocus()
  sbStatus.SimpleText = "Lancer l'impression"
End Sub

Private Sub btnQuitter_GotFocus()
  sbStatus.SimpleText = "Quitter le programme"
End Sub

Private Sub btnAPropos_GotFocus()
  sbStatus.SimpleText = "Informations sur le programme"
End Sub

Private Sub btnQuitter_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  txtFichier = Command
  txtFichier.SelLength = 99
  
  txtAutre.Enabled = False
  txtAutre.BackColor = &H8000000F
End Sub

Private Sub optImpr_Click(Index As Integer)
  If optImpr(0).Value Then
    txtAutre.Enabled = True
    txtAutre.BackColor = &H80000005
  Else
    txtAutre.Enabled = False
    txtAutre.BackColor = &H8000000F
  End If
End Sub

Private Sub txtAutre_GotFocus()
  sbStatus.SimpleText = "Chemin d'accès à l'imprimante"
End Sub

Private Sub txtFichier_GotFocus()
  AutoSelect txtFichier
  sbStatus.SimpleText = "Nom du fichier .imp à imprimer"
End Sub

Private Sub txtNbEx_GotFocus()
  AutoSelect txtNbEx
  sbStatus.SimpleText = "Nombre d'exemplaires"
End Sub

Private Sub optImpr_GotFocus(Index As Integer)
  If Index = 0 Then
    sbStatus.SimpleText = "Imprimante à définir"
  Else
    sbStatus.SimpleText = "Imprimante prédéfinie"
  End If
End Sub


Private Sub btnExplorer_Click()
  dlg.DefaultExt = "IMP"
  dlg.DialogTitle = "Ouvrir un fichier d'impression"
  dlg.FileName = ""
  dlg.Filter = "Fichier impression (*.IMP)|*.IMP"
  dlg.FilterIndex = 1
  dlg.Flags = cdlOFNFileMustExist Or cdlOFNHideReadOnly
  dlg.CancelError = True
  
  On Error Resume Next
  dlg.Action = 1
  If Err Then Exit Sub
  On Error GoTo 0
    
  If dlg.FileName <> "" Then txtFichier = dlg.FileName
End Sub

