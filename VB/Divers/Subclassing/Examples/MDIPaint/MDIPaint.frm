VERSION 5.00
Object = "{5B033ECF-098E-11D1-A4B2-444553540000}#1.0#0"; "Subclass.ocx"
Begin VB.MDIForm MDIForm1 
   Appearance      =   0  'Flat
   BackColor       =   &H8000000C&
   Caption         =   "MDI Background Demo"
   ClientHeight    =   4635
   ClientLeft      =   1095
   ClientTop       =   1485
   ClientWidth     =   6945
   LinkTopic       =   "MDIForm1"
   Begin VB.PictureBox Picture1 
      Align           =   1  'Align Top
      BorderStyle     =   0  'None
      Height          =   1335
      Left            =   0
      ScaleHeight     =   1335
      ScaleWidth      =   6945
      TabIndex        =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   6945
      Begin SubclassCtl.Subclass Subclass1 
         Left            =   5520
         Top             =   120
         _ExtentX        =   741
         _ExtentY        =   741
      End
      Begin VB.PictureBox Picture2 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1065
         Left            =   120
         Picture         =   "MDIPaint.frx":0000
         ScaleHeight     =   1065
         ScaleWidth      =   5265
         TabIndex        =   1
         Top             =   120
         Width           =   5265
      End
   End
End
Attribute VB_Name = "MDIForm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'MDIPaint - Subclassing Demonstration Program
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

'Standard rectangle structure
Private Type RECT
   left As Long
   top As Long
   right As Long
   bottom As Long
End Type

'Win API declarations
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function GetWindow Lib "user32" (ByVal hWnd As Long, ByVal wCmd As Long) As Long
Private Declare Function GetClientRect Lib "user32" (ByVal hWnd As Long, lpRect As RECT) As Long
Private Declare Function GetDC Lib "user32" (ByVal hWnd As Long) As Long
Private Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hDC As Long) As Long
Private Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hDC As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Private Declare Function ReleaseDC Lib "user32" (ByVal hWnd As Long, ByVal hDC As Long) As Long
Private Declare Function DeleteDC Lib "gdi32" (ByVal hDC As Long) As Long
Private Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hDC As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Private Declare Function FillRect Lib "user32" (ByVal hDC As Long, lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long

'Win API constants
Private Const SRCCOPY = &HCC0020
Private Const GW_CHILD = 5
Private Const COLOR_APPWORKSPACE = 12
Private Const WM_ERASEBKGND = &H14
Private Const WM_PAINT = &HF

Private Sub MDIForm_Load()
    Dim i As Long, frm As Form

    'Setup Subclass control
    Subclass1.hWnd = GetWindow(hWnd, GW_CHILD)
    Subclass1.Messages(WM_PAINT) = True
    Subclass1.Messages(WM_ERASEBKGND) = True
    'Position form to use most of screen
    Move Screen.Width * 0.15, Screen.Height * 0.15, Screen.Width * 0.7, Screen.Height * 0.7
    'Place a few children out in the client space
    For i = 1 To 6
        Set frm = New Form1
        frm.Caption = frm.Caption & CStr(i)
    Next i
End Sub

Private Sub MDIForm_Resize()
    'Arrange child windows
    Arrange vbArrangeIcons
    'Force repaint to keep image centered (won't happen if no newly-exposed areas
    SendMessage GetWindow(hWnd, GW_CHILD), WM_PAINT, 0, ByVal 0&
End Sub

Private Sub Subclass1_WndProc(Msg As Long, wParam As Long, lParam As Long, nResult As Long)
    Select Case Msg
        Case WM_PAINT
            'Allow default paint of child windows, etc.
            nResult = Subclass1.CallWndProc(Msg, wParam, lParam)
            'Paint MDI client area with bitmap image
            PaintMDIClient Picture2
        Case WM_ERASEBKGND
            'Return non-zero to indicate we do "erase".
            'No need to invoke default window procedure.
            nResult = 1
    End Select
End Sub

Private Sub PaintMDIClient(Src As PictureBox)
    Dim hWnd As Long, hDC As Long, hMemDC As Long
    Dim rcSource As RECT, rcDest As RECT
    Dim hBmp As Long, hOldBmp As Long
    Dim hBrush As Long
    Dim xDest As Long, yDest As Long

    'Get DC for MDI client space
    hWnd = GetWindow(Me.hWnd, GW_CHILD)
    hDC = GetDC(hWnd)
    'Get source and destination rectangles
    GetClientRect Src.hWnd, rcSource
    GetClientRect hWnd, rcDest
    'Create memory bitmap to hold image
    hMemDC = CreateCompatibleDC(hDC)
    hBmp = CreateCompatibleBitmap(hDC, rcSource.right, rcSource.bottom)
    hOldBmp = SelectObject(hMemDC, hBmp)
    'Load source image into memory bitmap
    BitBlt hMemDC, 0, 0, rcSource.right, rcSource.bottom, Src.hDC, 0, 0, SRCCOPY
    'Paint window background
    hBrush = CreateSolidBrush(GetSysColor(COLOR_APPWORKSPACE))
    FillRect hDC, rcDest, hBrush
    DeleteObject hBrush
    'Calculate centered
    xDest = (rcDest.right - rcSource.right) \ 2
    yDest = (rcDest.bottom - rcSource.bottom) \ 2
    'Copy bitmap to window
    BitBlt hDC, xDest, yDest, rcSource.right, rcSource.bottom, hMemDC, 0, 0, SRCCOPY
    'Clean up
    SelectObject hMemDC, hOldBmp
    DeleteObject hBmp
    DeleteDC hMemDC
    ReleaseDC hWnd, hDC
End Sub
