VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.2#0"; "COMCTL32.OCX"
Object = "{5B033ECF-098E-11D1-A4B2-444553540000}#1.0#0"; "Subclass.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3180
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4755
   LinkTopic       =   "Form1"
   ScaleHeight     =   3180
   ScaleWidth      =   4755
   StartUpPosition =   3  'Windows Default
   Begin SubclassCtl.Subclass Subclass1 
      Left            =   360
      Top             =   360
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin ComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   0
      Top             =   2865
      Width           =   4755
      _ExtentX        =   8387
      _ExtentY        =   556
      SimpleText      =   ""
      _Version        =   327680
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            AutoSize        =   1
            Object.Width           =   7964
            TextSave        =   ""
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MouseIcon       =   "MenuSel.frx":0000
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "&Edit"
      Begin VB.Menu mnuEditCut 
         Caption         =   "Cu&t"
      End
      Begin VB.Menu mnuEditCopy 
         Caption         =   "&Copy"
      End
      Begin VB.Menu mnuEditPaste 
         Caption         =   "&Paste"
      End
      Begin VB.Menu mnuEditDelete 
         Caption         =   "&Delete"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'MenuSel - Subclassing Demonstration Program
'Copyright (c) 1997 SoftCircuits Programming (R)
'Redistributed by Permission.
'
'This example program demonstrates use of the Subclass OCX control.
'See Examples.txt for information specific to this example.
'
'The accompanying files may be distributed on the condition that they
'are distributed in full and unchanged, and that no fee is charged for
'such distribution with the exception of reasonable shipping and media
'charges. In addition, the code in these example programs may be
'incorporated into your own programs and the resulting programs may be
'distributed without payment of royalties.
'
'This example program was provided by:
' SoftCircuits Programming
' http://www.softcircuits.com
' P.O. Box 16262
' Irvine, CA 92623
Option Explicit

'This message is sent by windows when a menu command is highlighted
Private Const WM_MENUSELECT = &H11F

'System menu constants
Private Const SC_RESTORE = &HF120&
Private Const SC_MOVE = &HF010&
Private Const SC_SIZE = &HF000&
Private Const SC_MINIMIZE = &HF020&
Private Const SC_MAXIMIZE = &HF030&
Private Const SC_CLOSE = &HF060&

'Program Subclass object on form load
Private Sub Form_Load()
    Subclass1.hWnd = Form1.hWnd
    Subclass1.Messages(WM_MENUSELECT) = True
End Sub

'Terminate program
Private Sub mnuFileExit_Click()
    Unload Me
End Sub

'Subclass callback
Private Sub Subclass1_WndProc(Msg As Long, wParam As Long, lParam As Long, Result As Long)
    Dim Status As String

    If Msg = WM_MENUSELECT Then     'Only message for this demo
        Select Case wParam And &HFFFF&
            '0 = No menu
            'The following values are defined by Visual Basic
            'They always start from 1 and increment through each menu item
            '1 = File menu
            Case 2
                Status = "Exit this program"
            '3 = Edit menu
            Case 4
                Status = "Cut the selected items to the clipboard and delete them"
            Case 5
                Status = "Copy the selected items to the clipboard"
            Case 6
                Status = "Paste the contents of the clipboard to the current location"
            Case 7
                Status = "Delete the selected items"
            'The following prompts correspond to system menu commands
            Case SC_RESTORE
                Status = "Restore window to normal position and size"
            Case SC_MOVE
                Status = "Move the window using the keyboard"
            Case SC_SIZE
                Status = "Size the window using the keyboard"
            Case SC_MINIMIZE
                Status = "Minimize the window"
            Case SC_MAXIMIZE
                Status = "Maximize the window"
            Case SC_CLOSE
                Status = "Close this window and terminate this program"
            Case Else
                Status = ""
        End Select
        StatusBar1.Panels(1) = Status
    End If
    'Unless you are overriding the default behavior, it's
    'good practice to call the original window procedure
    Result = Subclass1.CallWndProc(Msg, wParam, lParam)
End Sub
