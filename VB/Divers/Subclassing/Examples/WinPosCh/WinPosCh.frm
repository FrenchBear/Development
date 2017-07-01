VERSION 5.00
Object = "{5B033ECF-098E-11D1-A4B2-444553540000}#1.0#0"; "Subclass.ocx"
Begin VB.Form Form1 
   Caption         =   "Unmovable Window"
   ClientHeight    =   1380
   ClientLeft      =   1230
   ClientTop       =   2415
   ClientWidth     =   6495
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1380
   ScaleWidth      =   6495
   Begin SubclassCtl.Subclass Subclass1 
      Left            =   120
      Top             =   120
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Just try to move or size me!"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   360
      Width           =   6255
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'WinPosCh - Subclassing Demonstration Program
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

'Windows declarations
Private Declare Sub CopyMemory Lib "Kernel32" Alias "RtlMoveMemory" (lpDest As Any, lpSource As Any, ByVal nCount As Long)

'Windows constants
Private Const WM_WINDOWPOSCHANGING = &H46
Private Const SWP_NOSIZE = &H1
Private Const SWP_NOMOVE = &H2

'Windows data types
Private Type WINDOWPOS
    hWnd As Long
    hWndInsertAfter As Long
    x As Long
    y As Long
    cx As Long
    cy As Long
    flags As Long
End Type

Private Sub Form_Load()
    'Setup Subclass control
    Subclass1.hWnd = Me.hWnd
    Subclass1.Messages(WM_WINDOWPOSCHANGING) = True
End Sub

Private Sub Subclass1_WndProc(Msg As Long, wParam As Long, lParam As Long, Result As Long)
    Dim WinPosition As WINDOWPOS

    If Msg = WM_WINDOWPOSCHANGING Then
        ' Copy data to our local variable
        CopyMemory WinPosition, ByVal lParam, Len(WinPosition)
        ' Tell Windows to ignore new position
        WinPosition.flags = WinPosition.flags Or SWP_NOMOVE Or SWP_NOSIZE
        ' Copy data back to Windows
        CopyMemory ByVal lParam, WinPosition, Len(WinPosition)
        Result = 0
    End If
End Sub

