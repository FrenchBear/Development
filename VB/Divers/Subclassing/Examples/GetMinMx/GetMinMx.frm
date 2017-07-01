VERSION 5.00
Object = "{5B033ECF-098E-11D1-A4B2-444553540000}#1.0#0"; "Subclass.ocx"
Begin VB.Form Form1 
   Caption         =   "Limit Window Size Demo"
   ClientHeight    =   3165
   ClientLeft      =   1350
   ClientTop       =   1770
   ClientWidth     =   4740
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3165
   ScaleWidth      =   4740
   Begin SubclassCtl.Subclass Subclass1 
      Left            =   120
      Top             =   120
      _ExtentX        =   741
      _ExtentY        =   741
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'GetMinMx - Subclassing Demonstration Program
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
Private Declare Sub CopyMemory Lib "KERNEL32" Alias "RtlMoveMemory" (lpDest As Any, lpSource As Any, ByVal nCount As Long)

'Windows constants
Private Const WM_GETMINMAXINFO = &H24

'Windows data types
Private Type POINTAPI
    x As Long
    y As Long
End Type

Private Type MINMAXINFO
    ptReserved As POINTAPI
    ptMaxSize As POINTAPI
    ptMaxPosition As POINTAPI
    ptMinTrackSize As POINTAPI
    ptMaxTrackSize As POINTAPI
End Type

Private Sub Form_Load()
   'Setup Subclass
   Subclass1.hWnd = Me.hWnd
   Subclass1.Messages(WM_GETMINMAXINFO) = True
End Sub

Private Sub Subclass1_WndProc(Msg As Long, wParam As Long, lParam As Long, Result As Long)
    Dim MinMax As MINMAXINFO

    If Msg = WM_GETMINMAXINFO Then
        'Copy to our local MinMax variable
        CopyMemory MinMax, ByVal lParam, Len(MinMax)
        'Set minimum/maximum tracking size
        MinMax.ptMinTrackSize.x = 150
        MinMax.ptMinTrackSize.y = 150
        MinMax.ptMaxTrackSize.x = 400
        MinMax.ptMaxTrackSize.y = 400
        'Copy data back to Windows
        CopyMemory ByVal lParam, MinMax, Len(MinMax)
        Result = 0
    End If
End Sub
