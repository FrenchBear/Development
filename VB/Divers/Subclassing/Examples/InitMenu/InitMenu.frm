VERSION 5.00
Object = "{5B033ECF-098E-11D1-A4B2-444553540000}#1.0#0"; "Subclass.ocx"
Begin VB.Form Form1 
   Caption         =   "Set Menu Caption"
   ClientHeight    =   1860
   ClientLeft      =   1245
   ClientTop       =   2055
   ClientWidth     =   5205
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1860
   ScaleWidth      =   5205
   Begin SubclassCtl.Subclass Subclass1 
      Left            =   240
      Top             =   1200
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Text            =   "Enter text here and open File menu"
      Top             =   600
      Width           =   4935
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileText 
         Caption         =   "<...>"
      End
      Begin VB.Menu mnuFileSep10 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFileExit 
         Caption         =   "E&xit"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'InitMenu - Subclassing Demonstration Program
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

'Windows constant
Const WM_INITMENUPOPUP = &H117

Private Sub Form_Load()
   'Setup Subclass
   Subclass1.hWnd = Me.hWnd
   Subclass1.Messages(WM_INITMENUPOPUP) = True
End Sub

Private Sub mnuFileExit_Click()
    Unload Me
End Sub

Private Sub mnuFileText_Click()
    Dim Msg As String

    Msg = "This program shows how to change the text of"
    Msg = Msg & " a menu item at run-time. Note that you"
    Msg = Msg & " can do this with straight VB in response"
    Msg = Msg & " to the mnuFile_Click event. However,"
    Msg = Msg & " doing it that way, the text will get cut"
    Msg = Msg & " off if it is longer than the currently"
    Msg = Msg & " longest menu item." & Chr$(13) & Chr$(10)
    Msg = Msg & Chr$(13) & Chr$(10)
    Msg = Msg & "Trapping WM_INITPOPUPMENU lets you set"
    Msg = Msg & " menu text before Windows determines the"
    Msg = Msg & " width of the menu."
    MsgBox Msg
End Sub

Private Sub Subclass1_WndProc(Msg As Long, wParam As Long, lParam As Long, Result As Long)
    If Msg = WM_INITMENUPOPUP Then
        'Update menu text if index = 0 (File menu)
        If (lParam And &HFFFF&) = 0 Then
            mnuFileText.Caption = Text1
            Result = 0
        End If
    End If
End Sub
