VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   Caption         =   "Project1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   915
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox picSplitter 
      BackColor       =   &H00808080&
      BorderStyle     =   0  'None
      FillColor       =   &H00808080&
      Height          =   4800
      Left            =   5400
      ScaleHeight     =   2090.126
      ScaleMode       =   0  'User
      ScaleWidth      =   780
      TabIndex        =   7
      Top             =   705
      Visible         =   0   'False
      Width           =   72
   End
   Begin ComctlLib.TreeView tvTreeView 
      Height          =   4800
      Left            =   0
      TabIndex        =   6
      Top             =   705
      Width           =   2016
      _ExtentX        =   3545
      _ExtentY        =   8467
      _Version        =   393217
      PathSeparator   =   ""
      Style           =   7
      Appearance      =   1
   End
   Begin ComctlLib.ListView lvListView 
      Height          =   4800
      Left            =   2052
      TabIndex        =   5
      Top             =   705
      Width           =   3216
      _ExtentX        =   5662
      _ExtentY        =   8467
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.PictureBox picTitles 
      Align           =   1  'Align Top
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   300
      Left            =   0
      ScaleHeight     =   300
      ScaleWidth      =   4680
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   420
      Width           =   4680
      Begin VB.Label lblTitle 
         BorderStyle     =   1  'Fixed Single
         Caption         =   " ListView:"
         Height          =   270
         Index           =   1
         Left            =   2078
         TabIndex        =   4
         Tag             =   " ListView:"
         Top             =   12
         Width           =   3216
      End
      Begin VB.Label lblTitle 
         BorderStyle     =   1  'Fixed Single
         Caption         =   " TreeView:"
         Height          =   270
         Index           =   0
         Left            =   0
         TabIndex        =   3
         Tag             =   " TreeView:"
         Top             =   12
         Width           =   2016
      End
   End
   Begin ComctlLib.Toolbar tbToolBar 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   4680
      _ExtentX        =   8255
      _ExtentY        =   741
      ButtonWidth     =   609
      Appearance      =   1
      ImageList       =   "imlToolbarIcons"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   15
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Back"
            Object.ToolTipText     =   "Back"
            ImageKey        =   "Back"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Forward"
            Object.ToolTipText     =   "Forward"
            ImageKey        =   "Forward"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Cut"
            Object.ToolTipText     =   "Cut"
            ImageKey        =   "Cut"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Copy"
            Object.ToolTipText     =   "Copy"
            ImageKey        =   "Copy"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Paste"
            Object.ToolTipText     =   "Paste"
            ImageKey        =   "Paste"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Delete"
            Object.ToolTipText     =   "Delete"
            ImageKey        =   "Delete"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Properties"
            Object.ToolTipText     =   "Properties"
            ImageKey        =   "Properties"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "View Large Icons"
            Object.ToolTipText     =   "View Large Icons"
            ImageKey        =   "View Large Icons"
            Style           =   2
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "View Small Icons"
            Object.ToolTipText     =   "View Small Icons"
            ImageKey        =   "View Small Icons"
            Style           =   2
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "View List"
            Object.ToolTipText     =   "View List"
            ImageKey        =   "View List"
            Style           =   2
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "View Details"
            Object.ToolTipText     =   "View Details"
            ImageKey        =   "View Details"
            Style           =   2
         EndProperty
      EndProperty
   End
   Begin ComctlLib.StatusBar sbStatusBar 
      Align           =   2  'Align Bottom
      Height          =   270
      Left            =   0
      TabIndex        =   0
      Top             =   2925
      Width           =   4680
      _ExtentX        =   8255
      _ExtentY        =   476
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   2619
            Text            =   "Status"
            TextSave        =   "Status"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            AutoSize        =   2
            TextSave        =   "27/08/98"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            AutoSize        =   2
            TextSave        =   "00:44"
         EndProperty
      EndProperty
   End
   Begin MSComDlg.CommonDialog dlgCommonDialog 
      Left            =   1740
      Top             =   1350
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin ComctlLib.ImageList imlToolbarIcons 
      Left            =   1740
      Top             =   1350
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   11
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0000
            Key             =   "Back"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0112
            Key             =   "Forward"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0224
            Key             =   "Cut"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0336
            Key             =   "Copy"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0448
            Key             =   "Paste"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":055A
            Key             =   "Delete"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":066C
            Key             =   "Properties"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":077E
            Key             =   "View Large Icons"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0890
            Key             =   "View Small Icons"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":09A2
            Key             =   "View List"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0AB4
            Key             =   "View Details"
         EndProperty
      EndProperty
   End
   Begin VB.Image imgSplitter 
      Height          =   4788
      Left            =   1965
      MousePointer    =   9  'Size W E
      Top             =   705
      Width           =   150
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileOpen 
         Caption         =   "&Open..."
      End
      Begin VB.Menu mnuFileFind 
         Caption         =   "&Find"
      End
      Begin VB.Menu mnuFileBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileSendTo 
         Caption         =   "Sen&d to"
      End
      Begin VB.Menu mnuFileBar1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileNew 
         Caption         =   "&New"
         Shortcut        =   ^N
      End
      Begin VB.Menu mnuFileBar2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileDelete 
         Caption         =   "&Delete"
      End
      Begin VB.Menu mnuFileRename 
         Caption         =   "Rena&me"
      End
      Begin VB.Menu mnuFileProperties 
         Caption         =   "Propert&ies"
      End
      Begin VB.Menu mnuFileBar3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileMRU 
         Caption         =   ""
         Index           =   1
         Visible         =   0   'False
      End
      Begin VB.Menu mnuFileMRU 
         Caption         =   ""
         Index           =   2
         Visible         =   0   'False
      End
      Begin VB.Menu mnuFileMRU 
         Caption         =   ""
         Index           =   3
         Visible         =   0   'False
      End
      Begin VB.Menu mnuFileBar4 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuFileBar5 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileClose 
         Caption         =   "&Close"
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "&Edit"
      Begin VB.Menu mnuEditUndo 
         Caption         =   "&Undo"
      End
      Begin VB.Menu mnuEditBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEditCut 
         Caption         =   "Cu&t"
         Shortcut        =   ^X
      End
      Begin VB.Menu mnuEditCopy 
         Caption         =   "&Copy"
         Shortcut        =   ^C
      End
      Begin VB.Menu mnuEditPaste 
         Caption         =   "&Paste"
         Shortcut        =   ^V
      End
      Begin VB.Menu mnuEditPasteSpecial 
         Caption         =   "Paste &Special..."
      End
      Begin VB.Menu mnuEditBar1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEditSelectAll 
         Caption         =   "Select &All"
         Shortcut        =   ^A
      End
      Begin VB.Menu mnuEditInvertSelection 
         Caption         =   "&Invert Selection"
      End
   End
   Begin VB.Menu mnuView 
      Caption         =   "&View"
      Begin VB.Menu mnuViewToolbar 
         Caption         =   "&Toolbar"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuViewStatusBar 
         Caption         =   "Status &Bar"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuViewBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuListViewMode 
         Caption         =   "Lar&ge Icons"
         Index           =   0
      End
      Begin VB.Menu mnuListViewMode 
         Caption         =   "S&mall Icons"
         Index           =   1
      End
      Begin VB.Menu mnuListViewMode 
         Caption         =   "&List"
         Index           =   2
      End
      Begin VB.Menu mnuListViewMode 
         Caption         =   "&Details"
         Index           =   3
      End
      Begin VB.Menu mnuViewBar1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuViewArrangeIcons 
         Caption         =   "Arrange &Icons"
      End
      Begin VB.Menu mnuViewBar2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuViewRefresh 
         Caption         =   "&Refresh"
      End
      Begin VB.Menu mnuViewOptions 
         Caption         =   "&Options..."
      End
      Begin VB.Menu mnuViewWebBrowser 
         Caption         =   "&Web Browser"
      End
   End
   Begin VB.Menu mnuData 
      Caption         =   "&Data"
      Begin VB.Menu mnuDataADOC_MD 
         Caption         =   "ADOC_MD"
      End
      Begin VB.Menu mnuDataADOC_SR 
         Caption         =   "ADOC_SR"
      End
      Begin VB.Menu mnuDataADODC_MD 
         Caption         =   "ADODC_MD"
      End
      Begin VB.Menu mnuDataADODC_SR 
         Caption         =   "ADODC_SR"
      End
      Begin VB.Menu mnuDataClass_MD 
         Caption         =   "Class_MD"
      End
      Begin VB.Menu mnuDataClass_SR 
         Caption         =   "Class_SR"
      End
   End
   Begin VB.Menu mnuTools 
      Caption         =   "&Tools"
      Begin VB.Menu mnuToolsOptions 
         Caption         =   "&Options..."
      End
   End
   Begin VB.Menu mnuWindow 
      Caption         =   "&Window"
      WindowList      =   -1  'True
      Begin VB.Menu mnuWindowNewWindow 
         Caption         =   "&New Window"
      End
      Begin VB.Menu mnuWindowBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWindowCascade 
         Caption         =   "&Cascade"
      End
      Begin VB.Menu mnuWindowTileHorizontal 
         Caption         =   "Tile &Horizontal"
      End
      Begin VB.Menu mnuWindowTileVertical 
         Caption         =   "Tile &Vertical"
      End
      Begin VB.Menu mnuWindowArrangeIcons 
         Caption         =   "&Arrange Icons"
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "&Help"
      Begin VB.Menu mnuHelpContents 
         Caption         =   "&Contents"
      End
      Begin VB.Menu mnuHelpSearchForHelpOn 
         Caption         =   "&Search For Help On..."
      End
      Begin VB.Menu mnuHelpBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuHelpAbout 
         Caption         =   "&About "
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const NAME_COLUMN = 0
Const TYPE_COLUMN = 1
Const SIZE_COLUMN = 2
Const DATE_COLUMN = 3
Private Declare Function OSWinHelp% Lib "user32" Alias "WinHelpA" (ByVal hwnd&, ByVal HelpFile$, ByVal wCommand%, dwData As Any)
  
Dim mbMoving As Boolean
Const sglSplitLimit = 500

Private Sub Form_Load()
  Me.Left = GetSetting(App.Title, "Settings", "MainLeft", 1000)
  Me.Top = GetSetting(App.Title, "Settings", "MainTop", 1000)
  Me.Width = GetSetting(App.Title, "Settings", "MainWidth", 6500)
  Me.Height = GetSetting(App.Title, "Settings", "MainHeight", 6500)
End Sub

Private Sub Form_Paint()
  lvListView.View = Val(GetSetting(App.Title, "Settings", "ViewMode", "0"))
  Select Case lvListView.View
    Case lvwIcon
      tbToolBar.Buttons(LISTVIEW_MODE0).Value = tbrPressed
    Case lvwSmallIcon
      tbToolBar.Buttons(LISTVIEW_MODE1).Value = tbrPressed
    Case lvwList
      tbToolBar.Buttons(LISTVIEW_MODE2).Value = tbrPressed
    Case lvwReport
      tbToolBar.Buttons(LISTVIEW_MODE3).Value = tbrPressed
  End Select
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Dim i As Integer

  'close all sub forms
  For i = Forms.Count - 1 To 1 Step -1
    Unload Forms(i)
  Next
  If Me.WindowState <> vbMinimized Then
    SaveSetting App.Title, "Settings", "MainLeft", Me.Left
    SaveSetting App.Title, "Settings", "MainTop", Me.Top
    SaveSetting App.Title, "Settings", "MainWidth", Me.Width
    SaveSetting App.Title, "Settings", "MainHeight", Me.Height
  End If
  SaveSetting App.Title, "Settings", "ViewMode", lvListView.View
End Sub

Private Sub mnuDataClass_SR_Click()
  Dim f As New Class_SR
  f.Show
End Sub

Private Sub mnuDataClass_MD_Click()
  Dim f As New Class_MD
  f.Show
End Sub

Private Sub mnuDataADODC_SR_Click()
  Dim f As New ADODC_SR
  f.Show
End Sub

Private Sub mnuDataADODC_MD_Click()
  Dim f As New ADODC_MD
  f.Show
End Sub

Private Sub mnuDataADOC_SR_Click()
  Dim f As New ADOC_SR
  f.Show
End Sub

Private Sub mnuDataADOC_MD_Click()
  Dim f As New ADOC_MD
  f.Show
End Sub


Private Sub Form_Resize()
  On Error Resume Next
  If Me.Width < 3000 Then Me.Width = 3000
  SizeControls imgSplitter.Left
End Sub

Private Sub imgSplitter_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  With imgSplitter
    picSplitter.Move .Left, .Top, .Width \ 2, .Height - 20
  End With
  picSplitter.Visible = True
  mbMoving = True
End Sub

Private Sub imgSplitter_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Dim sglPos As Single
  
  If mbMoving Then
    sglPos = X + imgSplitter.Left
    If sglPos < sglSplitLimit Then
      picSplitter.Left = sglSplitLimit
    ElseIf sglPos > Me.Width - sglSplitLimit Then
      picSplitter.Left = Me.Width - sglSplitLimit
    Else
      picSplitter.Left = sglPos
    End If
  End If
End Sub

Private Sub imgSplitter_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  SizeControls picSplitter.Left
  picSplitter.Visible = False
  mbMoving = False
End Sub

Private Sub TreeView1_DragDrop(Source As Control, X As Single, Y As Single)
  If Source = imgSplitter Then
    SizeControls X
  End If
End Sub

Sub SizeControls(X As Single)
  On Error Resume Next
  
  'set the width
  If X < 1500 Then X = 1500
  If X > (Me.Width - 1500) Then X = Me.Width - 1500
  tvTreeView.Width = X
  imgSplitter.Left = X
  lvListView.Left = X + 40
  lvListView.Width = Me.Width - (tvTreeView.Width + 140)
  lblTitle(0).Width = tvTreeView.Width
  lblTitle(1).Left = lvListView.Left + 20
  lblTitle(1).Width = lvListView.Width - 40

  'set the top
  
  If tbToolBar.Visible Then
    tvTreeView.Top = tbToolBar.Height + picTitles.Height
  Else
    tvTreeView.Top = picTitles.Height
  End If

  lvListView.Top = tvTreeView.Top
  
  'set the height
  If sbStatusBar.Visible Then
    tvTreeView.Height = Me.ScaleHeight - (picTitles.Top + picTitles.Height + sbStatusBar.Height)
  Else
    tvTreeView.Height = Me.ScaleHeight - (picTitles.Top + picTitles.Height)
  End If
  
  lvListView.Height = tvTreeView.Height
  imgSplitter.Top = tvTreeView.Top
  imgSplitter.Height = tvTreeView.Height
End Sub

Private Sub tbToolBar_ButtonClick(ByVal Button As ComctlLib.Button)
  On Error Resume Next
  Select Case Button.Key
    Case "Back"
      'ToDo: Add 'Back' button code.
      MsgBox "Add 'Back' button code."
    Case "Forward"
      'ToDo: Add 'Forward' button code.
      MsgBox "Add 'Forward' button code."
    Case "Cut"
      mnuEditCut_Click
    Case "Copy"
      mnuEditCopy_Click
    Case "Paste"
      mnuEditPaste_Click
    Case "Delete"
      mnuFileDelete_Click
    Case "Properties"
      mnuFileProperties_Click
    Case "View Large Icons"
      lvListView.View = lvwIcon
    Case "View Small Icons"
      lvListView.View = lvwSmallIcon
    Case "View List"
      lvListView.View = lvwList
    Case "View Details"
      lvListView.View = lvwReport
  End Select
End Sub

Private Sub mnuHelpAbout_Click()
  frmAbout.Show vbModal, Me
End Sub

Private Sub mnuHelpSearchForHelpOn_Click()
  Dim nRet As Integer

  'if there is no helpfile for this project display a message to the user
  'you can set the HelpFile for your application in the
  'Project Properties dialog
  If Len(App.HelpFile) = 0 Then
    MsgBox "Unable to display Help Contents. There is no Help associated with this project.", vbInformation, Me.Caption
  Else
    On Error Resume Next
    nRet = OSWinHelp(Me.hwnd, App.HelpFile, 261, 0)
    If Err Then
      MsgBox Err.Description
    End If
  End If

End Sub

Private Sub mnuHelpContents_Click()
  Dim nRet As Integer

  'if there is no helpfile for this project display a message to the user
  'you can set the HelpFile for your application in the
  'Project Properties dialog
  If Len(App.HelpFile) = 0 Then
    MsgBox "Unable to display Help Contents. There is no Help associated with this project.", vbInformation, Me.Caption
  Else
    On Error Resume Next
    nRet = OSWinHelp(Me.hwnd, App.HelpFile, 3, 0)
    If Err Then
      MsgBox Err.Description
    End If
  End If

End Sub


Private Sub mnuWindowArrangeIcons_Click()
  'ToDo: Add 'mnuWindowArrangeIcons_Click' code.
  MsgBox "Add 'mnuWindowArrangeIcons_Click' code."
End Sub

Private Sub mnuWindowTileVertical_Click()
  'ToDo: Add 'mnuWindowTileVertical_Click' code.
  MsgBox "Add 'mnuWindowTileVertical_Click' code."
End Sub

Private Sub mnuWindowTileHorizontal_Click()
  'ToDo: Add 'mnuWindowTileHorizontal_Click' code.
  MsgBox "Add 'mnuWindowTileHorizontal_Click' code."
End Sub

Private Sub mnuWindowCascade_Click()
  'ToDo: Add 'mnuWindowCascade_Click' code.
  MsgBox "Add 'mnuWindowCascade_Click' code."
End Sub

Private Sub mnuWindowNewWindow_Click()
  'ToDo: Add 'mnuWindowNewWindow_Click' code.
  MsgBox "Add 'mnuWindowNewWindow_Click' code."
End Sub

Private Sub mnuToolsOptions_Click()
  frmOptions.Show vbModal, Me
End Sub

Private Sub mnuViewWebBrowser_Click()
  Dim frmB As New frmBrowser
  frmB.StartingAddress = "http://www.microsoft.com"
  frmB.Show
End Sub

Private Sub mnuViewOptions_Click()
  frmOptions.Show vbModal, Me
End Sub

Private Sub mnuViewRefresh_Click()
  'ToDo: Add 'mnuViewRefresh_Click' code.
  MsgBox "Add 'mnuViewRefresh_Click' code."
End Sub


Private Sub mnuVAIByDate_Click()
  'ToDo: Add 'mnuVAIByDate_Click' code.
'  lvListView.SortKey = DATE_COLUMN
End Sub

Private Sub mnuVAIByName_Click()
  'ToDo: Add 'mnuVAIByName_Click' code.
'  lvListView.SortKey = NAME_COLUMN
End Sub

Private Sub mnuVAIBySize_Click()
  'ToDo: Add 'mnuVAIBySize_Click' code.
'  lvListView.SortKey = SIZE_COLUMN
End Sub

Private Sub mnuVAIByType_Click()
  'ToDo: Add 'mnuVAIByType_Click' code.
'  lvListView.SortKey = TYPE_COLUMN
End Sub

Private Sub mnuViewStatusBar_Click()
  mnuViewStatusBar.Checked = Not mnuViewStatusBar.Checked
  sbStatusBar.Visible = mnuViewStatusBar.Checked
  SizeControls imgSplitter.Left
End Sub

Private Sub mnuViewToolbar_Click()
  mnuViewToolbar.Checked = Not mnuViewToolbar.Checked
  tbToolBar.Visible = mnuViewToolbar.Checked
  SizeControls imgSplitter.Left
End Sub

Private Sub mnuEditInvertSelection_Click()
  'ToDo: Add 'mnuEditInvertSelection_Click' code.
  MsgBox "Add 'mnuEditInvertSelection_Click' code."
End Sub

Private Sub mnuEditSelectAll_Click()
  'ToDo: Add 'mnuEditSelectAll_Click' code.
  MsgBox "Add 'mnuEditSelectAll_Click' code."
End Sub

Private Sub mnuEditPasteSpecial_Click()
  'ToDo: Add 'mnuEditPasteSpecial_Click' code.
  MsgBox "Add 'mnuEditPasteSpecial_Click' code."
End Sub

Private Sub mnuEditPaste_Click()
  'ToDo: Add 'mnuEditPaste_Click' code.
  MsgBox "Add 'mnuEditPaste_Click' code."
End Sub

Private Sub mnuEditCopy_Click()
  'ToDo: Add 'mnuEditCopy_Click' code.
  MsgBox "Add 'mnuEditCopy_Click' code."
End Sub

Private Sub mnuEditCut_Click()
  'ToDo: Add 'mnuEditCut_Click' code.
  MsgBox "Add 'mnuEditCut_Click' code."
End Sub

Private Sub mnuEditUndo_Click()
  'ToDo: Add 'mnuEditUndo_Click' code.
  MsgBox "Add 'mnuEditUndo_Click' code."
End Sub

Private Sub mnuFileClose_Click()
  'unload the form
  Unload Me

End Sub

Private Sub mnuFileProperties_Click()
  'ToDo: Add 'mnuFileProperties_Click' code.
  MsgBox "Add 'mnuFileProperties_Click' code."
End Sub

Private Sub mnuFileRename_Click()
  'ToDo: Add 'mnuFileRename_Click' code.
  MsgBox "Add 'mnuFileRename_Click' code."
End Sub

Private Sub mnuFileDelete_Click()
  'ToDo: Add 'mnuFileDelete_Click' code.
  MsgBox "Add 'mnuFileDelete_Click' code."
End Sub

Private Sub mnuFileNew_Click()
  'ToDo: Add 'mnuFileNew_Click' code.
  MsgBox "Add 'mnuFileNew_Click' code."
End Sub

Private Sub mnuFileSendTo_Click()
  'ToDo: Add 'mnuFileSendTo_Click' code.
  MsgBox "Add 'mnuFileSendTo_Click' code."
End Sub

Private Sub mnuFileFind_Click()
  'ToDo: Add 'mnuFileFind_Click' code.
  MsgBox "Add 'mnuFileFind_Click' code."
End Sub


Private Sub mnuFileOpen_Click()
  Dim sFile As String

  With dlgCommonDialog
    .DialogTitle = "Open"
    .CancelError = False
    'ToDo: set the flags and attributes of the common dialog control
    .Filter = "All Files (*.*)|*.*"
    .ShowOpen
    If Len(.FileName) = 0 Then
      Exit Sub
    End If
    sFile = .FileName
  End With
  'ToDo: add code to process the opened file

End Sub

