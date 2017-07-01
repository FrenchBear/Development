VERSION 5.00
Object = "{CF7901E8-F65A-11D3-AA42-000629C16DEA}#1.4#0"; "MDIActiveX6.ocx"
Begin VB.Form Form1 
   Caption         =   "EURO Calculator"
   ClientHeight    =   3990
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   6585
   Icon            =   "Test.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   3990
   ScaleWidth      =   6585
   Visible         =   0   'False
   Begin MDIinActiveX6.MDIActiveX MDIActiveX1 
      Left            =   4680
      Top             =   300
      _ExtentX        =   847
      _ExtentY        =   794
      BorderStyle     =   0
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Size smaler"
      Height          =   330
      Left            =   2295
      TabIndex        =   8
      Top             =   1215
      Width           =   1635
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Size Bigger"
      Height          =   330
      Left            =   315
      TabIndex        =   7
      Top             =   1215
      Width           =   1635
   End
   Begin VB.CommandButton Command3 
      Caption         =   "E&xit EURO Calculator"
      Height          =   375
      Left            =   315
      TabIndex        =   5
      Top             =   1665
      Width           =   3615
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Change &Caption"
      Height          =   330
      Left            =   2295
      TabIndex        =   4
      Top             =   765
      Width           =   1635
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Change &Icon"
      Height          =   330
      Left            =   315
      TabIndex        =   3
      Top             =   765
      Width           =   1635
   End
   Begin VB.PictureBox Picture1 
      Height          =   330
      Left            =   3465
      Picture         =   "Test.frx":0442
      ScaleHeight     =   270
      ScaleWidth      =   270
      TabIndex        =   2
      Top             =   90
      Visible         =   0   'False
      Width           =   330
   End
   Begin VB.TextBox Text1 
      Height          =   330
      Left            =   810
      TabIndex        =   0
      Text            =   "100.00"
      Top             =   90
      Width           =   2130
   End
   Begin VB.Label Label3 
      Caption         =   "MinSizeX = 4200 Twips     MaxSizeX = 5500 Twips    MinSizeY = 3300 Twips     MaxSizeY = 4500 Twips"
      ForeColor       =   &H000000C0&
      Height          =   465
      Left            =   180
      TabIndex        =   9
      Top             =   2655
      Width           =   4020
   End
   Begin VB.Label Label2 
      Caption         =   "This form was create into an ActiveX-DLL and has its own menu!"
      ForeColor       =   &H000000C0&
      Height          =   465
      Left            =   180
      TabIndex        =   6
      Top             =   2160
      Width           =   4065
   End
   Begin VB.Label Label1 
      Caption         =   "Value"
      Height          =   240
      Left            =   180
      TabIndex        =   1
      Top             =   135
      Width           =   600
   End
   Begin VB.Menu Active 
      Caption         =   "&ActiveX-DLL"
      Begin VB.Menu Laden 
         Caption         =   "&Load"
         Shortcut        =   ^L
      End
      Begin VB.Menu löschen 
         Caption         =   "&Close"
         Shortcut        =   ^S
      End
      Begin VB.Menu Editor 
         Caption         =   "&Editor"
      End
      Begin VB.Menu mvbcontrols 
         Caption         =   "&VB Controls"
      End
      Begin VB.Menu trennung 
         Caption         =   "-"
      End
      Begin VB.Menu Normal 
         Caption         =   "Normal VB MDIChild"
      End
      Begin VB.Menu mMDIChildMenu 
         Caption         =   "MDIChild with menu"
      End
   End
   Begin VB.Menu umrechnen 
      Caption         =   "&Calculate"
      Begin VB.Menu ats 
         Caption         =   "into ATS"
         Shortcut        =   {F11}
      End
      Begin VB.Menu EURO 
         Caption         =   "Into EURO"
         Shortcut        =   {F12}
      End
   End
   Begin VB.Menu Fenster 
      Caption         =   "&Window"
      WindowList      =   -1  'True
      Begin VB.Menu Cascade 
         Caption         =   "Cascade"
         Shortcut        =   {F5}
      End
      Begin VB.Menu Tile 
         Caption         =   "Tile"
         Shortcut        =   {F6}
      End
      Begin VB.Menu Ausblenden 
         Caption         =   "Hide"
      End
      Begin VB.Menu showall 
         Caption         =   "Show all"
      End
      Begin VB.Menu dummy 
         Caption         =   "-"
      End
      Begin VB.Menu felder 
         Caption         =   "Clear EURO field"
      End
   End
   Begin VB.Menu Hilfe 
      Caption         =   "&Help"
      Begin VB.Menu About 
         Caption         =   "About"
         Shortcut        =   {F1}
      End
      Begin VB.Menu copyright 
         Caption         =   "Copyright"
      End
      Begin VB.Menu VersionOCX 
         Caption         =   "Version OCX"
      End
      Begin VB.Menu VersionDLL 
         Caption         =   "Version DLL"
      End
   End
   Begin VB.Menu Test 
      Caption         =   "New in 1.0.&4"
      Begin VB.Menu MinButton 
         Caption         =   "MinButton"
         Checked         =   -1  'True
      End
      Begin VB.Menu MaxButton 
         Caption         =   "MaxButton"
         Checked         =   -1  'True
      End
      Begin VB.Menu Optionsize 
         Caption         =   "OptionSize"
         Checked         =   -1  'True
      End
      Begin VB.Menu OptionMove 
         Caption         =   "OptionMove"
         Checked         =   -1  'True
      End
      Begin VB.Menu OptionClose 
         Caption         =   "OptionClose"
         Checked         =   -1  'True
      End
      Begin VB.Menu AddMenuItem 
         Caption         =   "Move"
      End
   End
   Begin VB.Menu new106 
      Caption         =   "New in 1.0.&6"
      Begin VB.Menu mWindowTop 
         Caption         =   "Window Top"
      End
      Begin VB.Menu mWindowleft 
         Caption         =   "Window Left"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Sub initMenuIcon()
On Error Resume Next
  With Me.MDIActiveX1.MDIForm.PopMenu1
     .SubClassMenu Me
'     .ImageList = Me.ilsIcons
     .ItemIcon("Laden") = 75
     .ItemIcon("editor") = 41
     .ItemIcon("Löschen") = 33
  End With
End Sub
Private Sub About_Click()
  MsgBox "EURO Rechner 1.0"
End Sub

Private Sub AddMenuItem_Click()
   Me.MDIActiveX1.Move 200, 200, 9000, 4000
End Sub

Private Sub ats_Click()
  MsgBox "Value in ATS = " & Val(Me.Text1) * 13.7603
  Me.Text1 = ""
End Sub

Private Sub Ausblenden_Click()
  Me.Hide
End Sub

Private Sub Cascade_Click()
'Zugriff auf die MDIForm!
  Me.MDIActiveX1.MDIForm.Arrange vbCascade
End Sub

Private Sub Command1_Click()
  Me.Icon = Me.Picture1.Picture
End Sub

Private Sub Command2_Click()
  Me.Caption = "EURO Calculator / " & Now
End Sub

Private Sub Command3_Click()
  Unload Me
End Sub

Private Sub Command4_Click()
  Me.Width = Me.Width * 1.3
  Me.Height = Me.Height * 1.3
End Sub

Private Sub Command5_Click()
  Me.Width = Me.Width * 0.8
  Me.Height = Me.Height * 0.8
  
End Sub

Private Sub copyright_Click()
  MsgBox Me.MDIActiveX1.copyright
End Sub

Private Sub Editor_Click()
  
  Me.MDIActiveX1.MDIForm.LadeEditor
 
End Sub

Private Sub EURO_Click()
  MsgBox "Value in EURO = " & Val(Me.Text1) / 13.7603
  Me.Text1 = ""
End Sub

Private Sub felder_Click()
  Me.MDIActiveX1.MDIForm.enumChild
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
'Seit Version 1.0.2 unnötig!
'need not to do this in Version 1.0.2
''z.B. Strg+F6 verarbeiten....
'
'   Me.MDIActiveX1.EvalKeyDown KeyCode, Shift
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
'Sollte im Textfeld etwas stehen, so nachfragen!
'if there is something in text1 --> ask
  If Me.Text1 <> "" Then
    If MsgBox("Do you realy want to close?", vbYesNo, "EURO Calculator") <> vbYes Then
      Cancel = True
    End If
  End If
  
End Sub

Private Sub Laden_Click()
'Eine Public Sub in MDIForm1 aufrufen..
'Call a Public Sub of MDIForm1
  Me.MDIActiveX1.MDIForm.LadeRechner
End Sub

Private Sub Löschen_Click()
'Eine Public Sub in MDIForm1 aufrufen..
'Call a Public Sub of MDIForm1
  Me.MDIActiveX1.MDIForm.Entladen
End Sub

Private Sub MaxButton_Click()
  Me.MDIActiveX1.MaxButton = Not Me.MDIActiveX1.MaxButton
  Me.Controls("MaxButton").Checked = Me.MDIActiveX1.MaxButton
End Sub

Private Sub MDIActiveX1_FormLoad()
'  Me.MDIActiveX1.WindowState = 2
End Sub

Private Sub MinButton_Click()
  Me.MDIActiveX1.MinButton = Not Me.MDIActiveX1.MinButton
  Me.Controls("MinButton").Checked = Me.MDIActiveX1.MinButton
End Sub

Private Sub mMDIChildMenu_Click()
  Me.MDIActiveX1.MDIForm.LadeMenu
End Sub

Private Sub mvbcontrols_Click()
  Me.MDIActiveX1.MDIForm.ladecontrols
End Sub

Private Sub mWindowleft_Click()
  MsgBox "X-Position: " & Me.MDIActiveX1.WindowLeft
End Sub

Private Sub mWindowTop_Click()
  MsgBox "Y-Position: " & Me.MDIActiveX1.WindowTop
End Sub

Private Sub Normal_Click()
'Eine Public Sub in MDIForm1 aufrufen..
'Call a Public Sub of MDIForm1
  Me.MDIActiveX1.MDIForm.LadeNormal
End Sub

Private Sub OptionClose_Click()
  Me.MDIActiveX1.OptionClose = Not Me.MDIActiveX1.OptionClose
  OptionClose.Checked = Me.MDIActiveX1.OptionClose
End Sub

Private Sub OptionMove_Click()
   Me.MDIActiveX1.OptionMove = Not Me.MDIActiveX1.OptionMove
   OptionMove.Checked = Me.MDIActiveX1.OptionMove
End Sub

Private Sub Optionsize_Click()
  Me.MDIActiveX1.Optionsize = Not (Me.MDIActiveX1.Optionsize)
  Optionsize.Checked = Me.MDIActiveX1.Optionsize
End Sub

Private Sub showall_Click()
  Me.MDIActiveX1.MDIForm.ShowWindows
End Sub

Private Sub Tile_Click()
'Zugriff auf die MDIForm!
  Me.MDIActiveX1.MDIForm.Arrange vbTileHorizontal
End Sub

Private Sub VersionDLL_Click()
'Eigene Menüpunkte
'Menus only in this form
  MsgBox "EURO Calculator Version " & App.Major & "." & App.Minor & "." & App.Revision
End Sub

Private Sub VersionOCX_Click()
  MsgBox "MDIActiveX.ocx Version " & Me.MDIActiveX1.Version
End Sub
