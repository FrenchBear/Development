VERSION 5.00
Object = "*\A..\SYSTRAY.VBP"
Begin VB.Form frmTestSysTray 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Test SysTray Control Sample"
   ClientHeight    =   2190
   ClientLeft      =   2460
   ClientTop       =   2925
   ClientWidth     =   3870
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   146
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   258
   ShowInTaskbar   =   0   'False
   Begin SysTrayCtl.cSysTray cSysTray1 
      Left            =   3360
      Top             =   1680
      _ExtentX        =   900
      _ExtentY        =   900
      InTray          =   0   'False
      TrayIcon        =   "TestSysT.frx":0000
      TrayTip         =   "VB 5 - SysTray Control."
   End
   Begin VB.Menu mFile 
      Caption         =   "&File"
      Begin VB.Menu mShow 
         Caption         =   "Show"
         Checked         =   -1  'True
      End
      Begin VB.Menu m_1 
         Caption         =   "-"
      End
      Begin VB.Menu mExit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mView 
      Caption         =   "&View"
      Begin VB.Menu mLargeIcons 
         Caption         =   "Lar&ge Icons"
         Checked         =   -1  'True
      End
      Begin VB.Menu mSmallIcons 
         Caption         =   "S&mall Icons"
      End
      Begin VB.Menu mList 
         Caption         =   "&List"
      End
      Begin VB.Menu mDetails 
         Caption         =   "&Details"
      End
      Begin VB.Menu m_2 
         Caption         =   "-"
      End
      Begin VB.Menu mTransparent 
         Caption         =   "Background Text Transparent"
      End
   End
   Begin VB.Menu mHelp 
      Caption         =   "&Help"
      Begin VB.Menu mHelpAbout 
         Caption         =   "&About SysTray Control"
      End
   End
End
Attribute VB_Name = "frmTestSysTray"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ------------------------------------------------------------------------
'      Copyright © 1997 Microsoft Corporation.  All rights reserved.
'
' You have a royalty-free right to use, modify, reproduce and distribute
' the Sample Application Files (and/or any modified version) in any way
' you find useful, provided that you agree that Microsoft has no warranty,
' obligations or liability for any Sample Application Files.
' ------------------------------------------------------------------------
Option Explicit
'------------------------------------------------------------
Private Sub cSysTray1_MouseUp(Button As Integer, Id As Long)
'------------------------------------------------------------
    ' SetForegroundWindow and PostMessage (WM_USER) must wrap all popup menu's _
      in order to work correctely with the Notification Icons… _
      (* see KB article Q1357888 for more info *)
    SetForegroundWindow Me.hwnd                     ' Set current window as ForegroundWindow
    
    Select Case Button                              ' Track mouse clicks…
    Case vbRightButton
        Me.PopupMenu mView, vbPopupMenuRightButton  ' Popup memu…
    Case vbLeftButton
        Me.PopupMenu mFile, vbPopupMenuRightButton  ' Popup menu…
    End Select
    
    PostMessage Me.hwnd, WM_USER, 0&, 0&            ' Update form…
'------------------------------------------------------------
End Sub
'------------------------------------------------------------

'------------------------------------------------------------
Private Sub Form_Load()
'------------------------------------------------------------
    cSysTray1.InTray = True
'------------------------------------------------------------
End Sub
'------------------------------------------------------------

'------------------------------------------------------------
Private Sub Form_Unload(Cancel As Integer)
'------------------------------------------------------------
    TextBackGroundTransparent False
    ChangeExplorerListViewStyle LVS_ICON
'------------------------------------------------------------
End Sub
'------------------------------------------------------------

'------------------------------------------------------------
Private Sub mExit_Click()
'------------------------------------------------------------
    PostMessage Me.hwnd, WM_CLOSE, 0&, 0&           ' Close window(Unload Me will GPF)
'------------------------------------------------------------
End Sub
'------------------------------------------------------------

'------------------------------------------------------------
Private Sub mLargeIcons_Click()
'------------------------------------------------------------
    mLargeIcons.Checked = True
    mSmallIcons.Checked = False
    mList.Checked = False
    mDetails.Checked = False
    ChangeExplorerListViewStyle LVS_ICON
'------------------------------------------------------------
End Sub
'------------------------------------------------------------

'------------------------------------------------------------
Private Sub mSmallIcons_Click()
'------------------------------------------------------------
    mLargeIcons.Checked = False
    mSmallIcons.Checked = True
    mList.Checked = False
    mDetails.Checked = False
    ChangeExplorerListViewStyle LVS_SMALLICON
'------------------------------------------------------------
End Sub
'------------------------------------------------------------

'------------------------------------------------------------
Private Sub mList_Click()
'------------------------------------------------------------
    mLargeIcons.Checked = False
    mSmallIcons.Checked = False
    mList.Checked = True
    mDetails.Checked = False
    ChangeExplorerListViewStyle LVS_LIST
'------------------------------------------------------------
End Sub
'------------------------------------------------------------

'------------------------------------------------------------
Private Sub mDetails_Click()
'------------------------------------------------------------
    mLargeIcons.Checked = False
    mSmallIcons.Checked = False
    mList.Checked = False
    mDetails.Checked = True
    ChangeExplorerListViewStyle LVS_REPORT
'------------------------------------------------------------
End Sub
'------------------------------------------------------------

'------------------------------------------------------------
Private Sub mShow_Click()
'------------------------------------------------------------
    Me.Visible = Not Me.Visible
    mShow.Checked = Me.Visible
'------------------------------------------------------------
End Sub
'------------------------------------------------------------

'------------------------------------------------------------
Private Sub mHelpAbout_Click()
'------------------------------------------------------------
    MsgBox "This is an example of a VB 5 Built Control"
'------------------------------------------------------------
End Sub
'------------------------------------------------------------

'------------------------------------------------------------
Private Sub mTransparent_Click()
'------------------------------------------------------------
    With mTransparent
        .Checked = Not .Checked
        TextBackGroundTransparent .Checked
    End With
'------------------------------------------------------------
End Sub
'------------------------------------------------------------
