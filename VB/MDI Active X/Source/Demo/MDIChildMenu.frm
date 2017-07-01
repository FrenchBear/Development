VERSION 5.00
Object = "{CF7901E8-F65A-11D3-AA42-000629C16DEA}#1.4#0"; "MDIActiveX6.ocx"
Begin VB.Form MDIChildMenu 
   Caption         =   "MDIForm with menu in main application"
   ClientHeight    =   1665
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   4980
   Icon            =   "MDIChildMenu.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   1665
   ScaleWidth      =   4980
   Visible         =   0   'False
   Begin MDIinActiveX6.MDIActiveX MDIActiveX1 
      Left            =   4440
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   794
      BorderStyle     =   0
   End
   Begin VB.Label Label1 
      Caption         =   $"MDIChildMenu.frx":0442
      ForeColor       =   &H000000C0&
      Height          =   1215
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   4335
   End
   Begin VB.Menu Active 
      Caption         =   "ActiveX-DLL"
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
      Begin VB.Menu trennung 
         Caption         =   "-"
      End
      Begin VB.Menu Normal 
         Caption         =   "Normal VB MDIChild"
      End
   End
   Begin VB.Menu OwnMEnu 
      Caption         =   "OwnMenu"
      Begin VB.Menu Info 
         Caption         =   "Info"
      End
   End
   Begin VB.Menu Fenster 
      Caption         =   "Window"
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
      Caption         =   "Help"
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
      Caption         =   "New in 1.0.4"
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
End
Attribute VB_Name = "MDIChildMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub About_Click()
  MsgBox "EURO Rechner 1.0"
End Sub

Private Sub AddMenuItem_Click()
   Me.MDIActiveX1.Move 200, 200, 9000, 4000
End Sub

Private Sub Ausblenden_Click()
  Me.Hide
End Sub

Private Sub Cascade_Click()
'Zugriff auf die MDIForm!
  Me.MDIActiveX1.MDIForm.Arrange vbCascade
End Sub

Private Sub copyright_Click()
  MsgBox Me.MDIActiveX1.copyright
End Sub

Private Sub Editor_Click()
  MDIForm1.LadeEditor
End Sub

Private Sub felder_Click()
  Me.MDIActiveX1.MDIForm.enumChild
End Sub

Private Sub Form_Activate()
  Debug.Print "ActiveX in App Activate"
End Sub

Private Sub Form_Deactivate()
  Debug.Print "ActiveX in App Deactivate"
End Sub

Private Sub Info_Click()
  MsgBox "Don't use VB MDIChild Forms if You want to create MDIChild Forms with menu in the main application" & vbCrLf & "Use a standard VB-Form with the MDIActiveX Control!", vbInformation
End Sub

Private Sub Laden_Click()
'Eine Public Sub in MDIForm1 aufrufen..
'Call a Public Sub of MDIForm1
MDIForm1.LadeRechner
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

Private Sub Normal_Click()
'Eine Public Sub in MDIForm1 aufrufen..
'Call a Public Sub of MDIForm1
  MDIForm1.LadeNormal
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
