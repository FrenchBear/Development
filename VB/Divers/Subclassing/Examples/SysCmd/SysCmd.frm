VERSION 5.00
Object = "{5B033ECF-098E-11D1-A4B2-444553540000}#1.0#0"; "Subclass.ocx"
Begin VB.Form Form1 
   Caption         =   "System Command Demo"
   ClientHeight    =   3255
   ClientLeft      =   1410
   ClientTop       =   2220
   ClientWidth     =   6060
   ForeColor       =   &H80000008&
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3255
   ScaleWidth      =   6060
   Begin SubclassCtl.Subclass Subclass1 
      Left            =   360
      Top             =   840
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin VB.Label Label1 
      Caption         =   "About command added to control menu."
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   2895
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'SysCmd - Subclassing Demonstration Program
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
Private Declare Function GetSystemMenu Lib "user32" (ByVal hwnd As Long, ByVal bRevert As Long) As Long
Private Declare Function AppendMenu Lib "user32" Alias "AppendMenuA" (ByVal hMenu As Long, ByVal wFlags As Long, ByVal wIDNewItem As Long, ByVal lpNewItem As String) As Long

'Windows constants
Private Const WM_SYSCOMMAND = &H112
Private Const MF_STRING = &H0
Private Const MF_SEPARATOR = &H800

'ID for new About command (must be < &HF000)
Private Const IDM_ABOUT = 10

Private Sub Form_Load()
    Dim i As Long, hMenu As Long

    'Add "About..." command to system menu
    hMenu = GetSystemMenu(Me.hwnd, False)
    i = AppendMenu(hMenu, MF_SEPARATOR, 0, 0&)
    i = AppendMenu(hMenu, MF_STRING, IDM_ABOUT, "&About...")
    'Setup Subclass
    Subclass1.hwnd = Me.hwnd
    Subclass1.Messages(WM_SYSCOMMAND) = True
End Sub

Private Sub Subclass1_WndProc(Msg As Long, wParam As Long, lParam As Long, Result As Long)
    'Look for WM_SYSCOMMAND message with About command
    If Msg = WM_SYSCOMMAND Then
        If wParam = IDM_ABOUT Then
            Subclass1.AboutBox
            Exit Sub
        End If
    End If
    'Pass along to default handler if message not processed
    Result = Subclass1.CallWndProc(Msg, wParam, lParam)
End Sub
