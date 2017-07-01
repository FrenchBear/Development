VERSION 5.00
Object = "{5B033ECF-098E-11D1-A4B2-444553540000}#1.0#0"; "Subclass.ocx"
Begin VB.Form Form1 
   Caption         =   "Drop Files On Me"
   ClientHeight    =   3390
   ClientLeft      =   1095
   ClientTop       =   1485
   ClientWidth     =   3615
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3390
   ScaleWidth      =   3615
   Begin SubclassCtl.Subclass Subclass1 
      Left            =   120
      Top             =   2760
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin VB.ListBox List1 
      Height          =   2205
      Left            =   90
      Sorted          =   -1  'True
      TabIndex        =   0
      Top             =   360
      Width           =   3405
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "No Files Dropped Yet"
      Height          =   195
      Left            =   90
      TabIndex        =   1
      Top             =   135
      Width           =   1515
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'DropFile - Subclassing Demonstration Program
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
'
'Special thanks to Karl Peterson who wrote the original code on which
'this example was based.
Option Explicit

Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Sub DragAcceptFiles Lib "shell32.dll" (ByVal hwnd As Long, ByVal fAccept As Long)
Private Declare Sub DragFinish Lib "shell32.dll" (ByVal hDrop As Long)
Private Declare Function DragQueryFile Lib "shell32.dll" Alias "DragQueryFileA" (ByVal hDrop As Long, ByVal iFile As Long, ByVal lpszFile As String, ByVal cch As Long) As Long

'Windows constants to alter window style
Private Const GWL_EXSTYLE = (-20)
Private Const WS_EX_ACCEPTFILES = &H10&

'Message indicating file drop
Private Const WM_DROPFILES = &H233

Private Sub Form_Load()
    'Prepare form to accept dropped files
    AcceptDrops hwnd
    'Setup Subclass control
    Subclass1.hwnd = hwnd
    Subclass1.Messages(WM_DROPFILES) = True
End Sub

Private Sub Form_Resize()
    'Resize Listbox to fit form
    If WindowState <> 1 Then    'Not minimized
        List1.Move List1.Left, List1.Top, ScaleWidth - 2 * List1.Left, ScaleHeight - List1.Top - List1.Left
    End If
End Sub

Private Sub Subclass1_WndProc(Msg As Long, wParam As Long, lParam As Long, Result As Long)
    Dim i As Long, nLen As Long, nFiles As Long
    Dim Buffer As String

    'Always test which message was recieved
    If Msg = WM_DROPFILES Then
        'Set up buffer to recieve filenames, then
        'retrieve number of files dropped by passing
        '&hFFFFFFFF as the file number.
        Buffer = Space$(128)
        nFiles = DragQueryFile(wParam, -1, Buffer, Len(Buffer))
        'Clear list box and reset label
        List1.Clear
        Label1 = CStr(nFiles) & " File(s) Dropped:"
        'Add name of each dropped file to listbox
        For i = 0 To (nFiles - 1)
            nLen = DragQueryFile(wParam, i, Buffer, Len(Buffer))
            List1.AddItem Left$(Buffer, nLen)
        Next i
        List1.ListIndex = 0
        'Tell system we're done.
        Call DragFinish(wParam)
        Result = 0
    End If
End Sub

Private Sub AcceptDrops(hwnd As Long)
    Dim Style As Long

    'Set to accept dropped files from File Manager
    Style = GetWindowLong(hwnd, GWL_EXSTYLE)
    Style = SetWindowLong(hwnd, GWL_EXSTYLE, Style Or WS_EX_ACCEPTFILES)
    'Notify system we want to accept dropped files
    DragAcceptFiles hwnd, True
End Sub

