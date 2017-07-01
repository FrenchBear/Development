VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Object = "{CF7901E8-F65A-11D3-AA42-000629C16DEA}#1.4#0"; "MDIActiveX6.ocx"
Begin VB.MDIForm MDIForm1 
   BackColor       =   &H8000000C&
   Caption         =   "MDIActiveX Demo Programm"
   ClientHeight    =   6645
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   10200
   Icon            =   "MDIForm1.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   Begin MDIinActiveX6.MDIActiveX MDIActiveX1 
      Left            =   300
      Top             =   840
      _ExtentX        =   847
      _ExtentY        =   794
      BorderStyle     =   0
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   615
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10200
      _ExtentX        =   17992
      _ExtentY        =   1085
      ButtonWidth     =   1244
      ButtonHeight    =   926
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   4
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Euro"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Editor"
            ImageIndex      =   3
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Controls"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "VB-Child"
            ImageIndex      =   5
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   420
      Left            =   0
      TabIndex        =   1
      Top             =   6225
      Width           =   10200
      _ExtentX        =   17992
      _ExtentY        =   741
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   960
      Top             =   840
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   15
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":0442
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":0984
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":0EC6
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":1408
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIForm1.frx":194A
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Menu Active 
      Caption         =   "&ActiveX-DLL"
      Begin VB.Menu Laden 
         Caption         =   "&Load"
         Shortcut        =   ^L
      End
      Begin VB.Menu mloadi 
         Caption         =   "Load invisible"
      End
      Begin VB.Menu Löschen 
         Caption         =   "&Close"
         Shortcut        =   ^S
      End
      Begin VB.Menu editor 
         Caption         =   "&Editor"
      End
      Begin VB.Menu mVBControls 
         Caption         =   "&VB Controls"
      End
      Begin VB.Menu trennung 
         Caption         =   "-"
      End
      Begin VB.Menu Normal 
         Caption         =   "Normal VB MDIChild"
      End
      Begin VB.Menu mMDIChildMenu 
         Caption         =   "MDIChild withMenu"
      End
      Begin VB.Menu dummyx 
         Caption         =   "-"
      End
      Begin VB.Menu Beenden 
         Caption         =   "E&xit"
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
      Begin VB.Menu del 
         Caption         =   "Clear EURO Field"
      End
   End
   Begin VB.Menu Hilfe 
      Caption         =   "Help"
      Begin VB.Menu About 
         Caption         =   "About"
         Shortcut        =   {F1}
      End
      Begin VB.Menu Copyright 
         Caption         =   "Copyright"
      End
      Begin VB.Menu Version 
         Caption         =   "Version"
      End
   End
   Begin VB.Menu Test 
      Caption         =   "New in 1.0.4"
      Begin VB.Menu MinimizeBox 
         Caption         =   "MinimizeBox (MDIParent)"
         Checked         =   -1  'True
      End
      Begin VB.Menu MaximizeBox 
         Caption         =   "MaximizeBox (MDIParent)"
         Checked         =   -1  'True
      End
      Begin VB.Menu OptionMove 
         Caption         =   "OptionMove (MDIParent)"
         Checked         =   -1  'True
      End
      Begin VB.Menu OptionClose 
         Caption         =   "OptionClose (MDIParent)"
         Checked         =   -1  'True
      End
   End
   Begin VB.Menu new106 
      Caption         =   "New in 1.0.6"
      Begin VB.Menu mWindowTop 
         Caption         =   "WindowTop"
      End
      Begin VB.Menu mWindowLeft 
         Caption         =   "WindowLeft"
      End
   End
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' ----------------------------------------------------------- '
'                                                             '
' Demo Programm zum MDIActiveX.ocx Control                    '
'                                                             '
' Copyright (c)2000/2001 by Michael Wallner                   '
' http://www.wallner-software.com                             '
' mailto:mdiactivex@wallner-software.com                      '
'                                                             '
' ----------------------------------------------------------- '
'                                                             '
' Benötigt: MDIActiveX.ocx Version 1.0.6 oder höher           '
'                                                             '
' ----------------------------------------------------------- '

Public Sub LadeEditor()
Dim Editor As TesteActiveXS.TestMDIActiveX

 
   Set Editor = New TesteActiveXS.TestMDIActiveX
   Editor.ShowForm2

End Sub

Public Sub LadeControls()
Dim Editor As TesteActiveXS.TestMDIActiveX
 
   Set Editor = New TesteActiveXS.TestMDIActiveX
   Editor.ShowForm3

End Sub


Public Sub LadeRechner()
Dim Rechner As TesteActiveXS.TestMDIActiveX
 
   Set Rechner = New TesteActiveXS.TestMDIActiveX
   Rechner.ShowForm1

End Sub

Public Sub LadeNormal()
Dim f As Form
  
  Set f = New MDIChild
  f.Show

End Sub

Public Sub LadeMenu()
Dim f As MDIChildMenu

   Set f = New MDIChildMenu
   f.Show
   
End Sub

Public Sub Entladen()
Dim f As Form
On Error Resume Next
  
    Set f = Me.MDIActiveX1.ActiveForm
    Unload f

End Sub

Public Sub ShowAbout()
  MsgBox "MDIActiveX.ocx Demo Programm" & vbCrLf & "(c)2000 Michael Wallner"
End Sub

Public Sub enumChild()
Debug.Print "enum Child!"
Dim f As Form

    For Each f In Me.MDIActiveX1.Forms
      Debug.Print f.Caption
      If Left(f.Caption, 4) = "EURO" Then
        On Error Resume Next
        f.Text1.Text = ""
        On Error GoTo 0
      End If
    Next
End Sub

Public Sub ShowWindows()
Dim f As Form
On Error Resume Next
 
    For Each f In Me.MDIActiveX1.Forms
      f.Show
    Next
    
    For Each f In Forms
      If f.MDIChild Then
        f.Show
      End If
    Next
    
End Sub

Private Sub About_Click()
  MsgBox "MDIActiveX Demo Version 1.1"
End Sub

Private Sub Ausblenden_Click()
On Error Resume Next
  Me.MDIActiveX1.ActiveForm.Hide
End Sub

Private Sub Beenden_Click()
  Unload Me
End Sub

Private Sub Cascade_Click()
   Me.Arrange vbCascade
End Sub

Private Sub copyright_Click()
  MsgBox Me.MDIActiveX1.copyright
End Sub

Private Sub del_Click()
  Me.enumChild
End Sub

Private Sub Editor_Click()
  Me.LadeEditor
End Sub

Private Sub Laden_Click()
  LadeRechner
End Sub


Private Sub Löschen_Click()
  Entladen
End Sub

Private Sub MaximizeBox_Click()
  Me.MDIActiveX1.MaxButton = Not Me.MDIActiveX1.MaxButton
  Me.MaximizeBox.Checked = Me.MDIActiveX1.MaxButton
End Sub

Private Sub MDIForm_Load()
'  With Me.PopMenu1
'     .SubClassMenu Me
'     .ImageList = Me.ilsIcons
'     .ItemIcon("Laden") = 75
'     .ItemIcon("editor") = 41
'     .ItemIcon("Löschen") = 33
'  End With

End Sub

Private Sub mloadi_Click()
Dim f As MDIChildMenu
  
  Set f = New MDIChildMenu
  
  MsgBox "Form " & f.Caption & " load invisible" & vbCrLf & "Use Window/Show All to show!"
  
End Sub

Private Sub mMDIChildMenu_Click()
  Me.LadeMenu
End Sub

Private Sub MinimizeBox_Click()
  Me.MDIActiveX1.MinButton = Not Me.MDIActiveX1.MinButton
  Me.MinimizeBox.Checked = Me.MDIActiveX1.MinButton
End Sub

Private Sub mVBControls_Click()
   LadeControls
End Sub

Private Sub mWindowLeft_Click()
  MsgBox "X-Position: " & Me.MDIActiveX1.WindowLeft

End Sub

Private Sub mWindowTop_Click()
  MsgBox "Y-Position: " & Me.MDIActiveX1.WindowTop
  
End Sub

Private Sub Normal_Click()
  LadeNormal
End Sub

Private Sub OptionClose_Click()
  Me.MDIActiveX1.OptionClose = Not Me.MDIActiveX1.OptionClose
  Me.OptionClose.Checked = Me.MDIActiveX1.OptionClose
End Sub

Private Sub OptionMove_Click()
  Me.MDIActiveX1.OptionMove = Not Me.MDIActiveX1.OptionMove
  Me.OptionMove.Checked = Me.MDIActiveX1.OptionMove
End Sub

Private Sub PopMenu1_NewMDIMenu()
On Error Resume Next
   Me.MDIActiveX1.ActiveForm.initmenuicon
   
End Sub

Private Sub showall_Click()
  Me.ShowWindows
End Sub

Private Sub Tile_Click()
  Me.Arrange vbTileHorizontal
End Sub


Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Index
    Case 1: Me.LadeRechner
    Case 2: Me.LadeEditor
    Case 3: Me.LadeControls
    Case 4: Me.LadeNormal
  End Select
End Sub

Private Sub Version_Click()
  MsgBox "MDIActiveX.ocx Version " & Me.MDIActiveX1.Version
End Sub


