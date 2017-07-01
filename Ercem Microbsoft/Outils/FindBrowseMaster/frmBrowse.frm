VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmBrowse 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Find Browse Master"
   ClientHeight    =   4620
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5160
   Icon            =   "frmBrowse.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4620
   ScaleWidth      =   5160
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ListView lvHosts 
      Height          =   3795
      Left            =   60
      TabIndex        =   2
      Top             =   480
      Width           =   4995
      _ExtentX        =   8811
      _ExtentY        =   6694
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Host"
         Object.Width           =   2293
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "St"
         Object.Width           =   882
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Description"
         Object.Width           =   4939
      EndProperty
   End
   Begin VB.CommandButton btnBrowse 
      Caption         =   "&Browse"
      Height          =   375
      Left            =   60
      TabIndex        =   1
      Top             =   60
      Width           =   1155
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   0
      Top             =   4305
      Width           =   5160
      _ExtentX        =   9102
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
      EndProperty
   End
End
Attribute VB_Name = "frmBrowse"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' FindBrowseMaster
' 6/2/00 PV

Option Explicit


Private Sub btnBrowse_Click()
  Dim x As ListItem
  Dim sFichierDir As String
  
  sFichierDir = Environ("TMP")
  If sFichierDir = "" Then sFichierDir = "c:\"
  If Right(sFichierDir, 1) <> "\" Then sFichierDir = sFichierDir & "\"
  sFichierDir = sFichierDir & "fbm.txt"
  
  btnBrowse.Enabled = False
  lvHosts.ListItems.Clear
  
  ' 1ère partie, on crée la liste des hosts
  Dim t As Single
  t = Timer
  
  sbStatus.SimpleText = "Analyse du workgroup"
  sbStatus.Refresh
  
  ShellWait "command.com /c net view /workgroup:silliker >" & sFichierDir
  
  sbStatus.SimpleText = "Récupération de la liste des hosts"
  sbStatus.Refresh
  
  Dim sLigne As String
  Open sFichierDir For Input As #1
  Do Until EOF(1)
    Line Input #1, sLigne
    If Left(sLigne, 2) = "\\" Then
      Set x = lvHosts.ListItems.Add
      x.Text = RTrim(Left(sLigne, 23))
      x.SubItems(1) = "?"
      x.SubItems(2) = Mid(sLigne, 23)
    End If
  Loop
  Close #1
    
  
  ' 2ème partie, analyse NetBIOS Remote Machine Name Table
  Dim sHost As String
  Dim bTrouvé As Boolean
  For Each x In lvHosts.ListItems
    
    sHost = Mid(x.Text, 3)
    sbStatus.SimpleText = "Test host " & sHost
    sbStatus.Refresh
    
    x.SubItems(1) = "¿"
    ShellWait "command.com /c nbtstat -a " & sHost & " >" & sFichierDir
    
    bTrouvé = False
    Open sFichierDir For Input As #1
    Do Until EOF(1)
      Line Input #1, sLigne
      If InStr(sLigne, "__MSBROWSE__") <> 0 Then
        bTrouvé = True
        Exit Do
      End If
    Loop
    Close #1
    If bTrouvé Then
      x.SubItems(1) = "BM"
      x.ListSubItems(1).ForeColor = RGB(128, 0, 0)
      x.ListSubItems(1).Bold = True
    Else
      x.SubItems(1) = ""
    End If
  Next
  
  
  t = Timer - t
  sbStatus.SimpleText = "Prêt (t=" & Format(t, "0.0") & "s)"
  sbStatus.Refresh

  Kill sFichierDir
  btnBrowse.Enabled = True
End Sub

