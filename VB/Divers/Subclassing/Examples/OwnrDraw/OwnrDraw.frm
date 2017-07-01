VERSION 5.00
Object = "{5B033ECF-098E-11D1-A4B2-444553540000}#1.0#0"; "SUBCLASS.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin SubclassCtl.Subclass Subclass1 
      Left            =   1560
      Top             =   120
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin VB.PictureBox picColor 
      Height          =   975
      Left            =   120
      ScaleHeight     =   915
      ScaleWidth      =   1155
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuColor 
      Caption         =   "&Color"
      Begin VB.Menu mnuColors 
         Caption         =   "<black>"
         Index           =   0
      End
      Begin VB.Menu mnuColors 
         Caption         =   "<blue>"
         Index           =   1
      End
      Begin VB.Menu mnuColors 
         Caption         =   "<green>"
         Index           =   2
      End
      Begin VB.Menu mnuColors 
         Caption         =   "<cyan>"
         Index           =   3
      End
      Begin VB.Menu mnuColors 
         Caption         =   "<red>"
         Index           =   4
      End
      Begin VB.Menu mnuColors 
         Caption         =   "<magenta>"
         Index           =   5
      End
      Begin VB.Menu mnuColors 
         Caption         =   "<yellow>"
         Index           =   6
      End
      Begin VB.Menu mnuColors 
         Caption         =   "<white>"
         Index           =   7
      End
      Begin VB.Menu mnuColorSep10 
         Caption         =   "-"
      End
      Begin VB.Menu mnuColorDefault 
         Caption         =   "&Default"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'OwnrDraw - Subclassing Demonstration Program
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

'Windows data types
Private Type RECT
    left As Long
    top As Long
    right As Long
    bottom As Long
End Type

Private Type DRAWITEMSTRUCT
    CtlType As Long
    CtlID As Long
    itemID As Long
    itemAction As Long
    itemState As Long
    hwndItem As Long
    hdc As Long
    rcItem As RECT
    itemData As Long
End Type

Private Type MEASUREITEMSTRUCT
    CtlType As Long
    CtlID As Long
    itemID As Long
    itemWidth As Long
    itemHeight As Long
    itemData As Long
End Type

' Windows declarations
Private Declare Function GetMenu Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetSubMenu Lib "user32" (ByVal hMenu As Long, ByVal nPos As Long) As Long
Private Declare Function ModifyMenu Lib "user32" Alias "ModifyMenuA" (ByVal hMenu As Long, ByVal nPosition As Long, ByVal wFlags As Long, ByVal wIDNewItem As Long, ByVal nValue As Any) As Long
Private Declare Function GetMenuItemID Lib "user32" (ByVal hMenu As Long, ByVal nPos As Long) As Long
Private Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function Rectangle Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function InflateRect Lib "user32" (lpRect As RECT, ByVal x As Long, ByVal y As Long) As Long
Private Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
Private Declare Function GetSystemMetrics Lib "user32" (ByVal nIndex As Long) As Long
Private Declare Sub CopyMemory Lib "Kernel32" Alias "RtlMoveMemory" (lpDest As Any, lpSource As Any, ByVal nCount As Long)

'Windows constants
Private Const ODS_SELECTED = &H1
Private Const COLOR_MENU = 4
Private Const COLOR_WINDOW = 5
Private Const COLOR_HIGHLIGHT = 13
Private Const MF_OWNERDRAW = &H100
Private Const MF_BYCOMMAND = &H0
Private Const SM_CYMENU = 15
Private Const WM_DRAWITEM = &H2B
Private Const WM_MEASUREITEM = &H2C

Private Sub Form_Load()
    Dim hMenu As Long
    Dim i As Long, j As Long

    'Get handle to "Colors" menu
    hMenu = GetMenu(Me.hwnd)
    hMenu = GetSubMenu(hMenu, 1)
    'Modify commands to be owner-draw and to contain color info
    For i = 0 To 7
        'Get menu ID
        j = GetMenuItemID(hMenu, i)
        'Modify menu item (command ID is maintained)
        j = ModifyMenu(hMenu, j, MF_BYCOMMAND Or MF_OWNERDRAW, j, QBColor(8 + i))
    Next i
    'Setup Subclass
    Subclass1.hwnd = hwnd
    Subclass1.Messages(WM_DRAWITEM) = True
    Subclass1.Messages(WM_MEASUREITEM) = True
End Sub

Private Sub Form_Resize()
    'Size color panel to fill client area
    picColor.Move 0, 0, ScaleWidth, ScaleHeight
End Sub

Private Sub mnuColorDefault_Click()
    'Set background color
    picColor.BackColor = BackColor
End Sub

Private Sub mnuColors_Click(Index As Integer)
    'Set background color
    picColor.BackColor = QBColor(8 + Index)
End Sub

Private Sub mnuFileExit_Click()
    Unload Me
End Sub

Private Sub Subclass1_WndProc(Msg As Long, wParam As Long, lParam As Long, Result As Long)
    Dim tmp As Long, rc As RECT
    Dim hBrush As Long, hOldBrush As Long
    Dim DrawInfo As DRAWITEMSTRUCT
    Dim MeasureInfo As MEASUREITEMSTRUCT

    Select Case Msg

        Case WM_DRAWITEM
            If wParam = 0 Then  'If sent by menu
                'Copy DRAWINFOSTRUCT data to local variable
                CopyMemory DrawInfo, ByVal lParam, Len(DrawInfo)
                'Paint area around color bar
                If DrawInfo.itemState And ODS_SELECTED Then
                    hBrush = CreateSolidBrush(GetSysColor(COLOR_HIGHLIGHT))
                Else
                    hBrush = CreateSolidBrush(GetSysColor(COLOR_MENU))
                End If
                rc = DrawInfo.rcItem
                FillRect DrawInfo.hdc, rc, hBrush
                DeleteObject hBrush
                'Paint color bar
                tmp = (rc.bottom - rc.top) / 5
                InflateRect rc, -tmp, -tmp
                hBrush = CreateSolidBrush(DrawInfo.itemData)
                hOldBrush = SelectObject(DrawInfo.hdc, hBrush)
                Rectangle DrawInfo.hdc, rc.left, rc.top, rc.right, rc.bottom
                SelectObject DrawInfo.hdc, hOldBrush
                DeleteObject hBrush
            End If

        Case WM_MEASUREITEM
            'Copy MEASUREITEMSTRUCT to local variable
            CopyMemory MeasureInfo, ByVal lParam, Len(MeasureInfo)
            'Tell Windows how big our owner-draw items are
            MeasureInfo.itemWidth = 70
            MeasureInfo.itemHeight = GetSystemMetrics(SM_CYMENU)
            'Copy MEASUREITEMSTRUCT data back to Windows
            CopyMemory ByVal lParam, MeasureInfo, Len(MeasureInfo)

        Case Else
            'Allow default message processing
            Result = Subclass1.CallWndProc(Msg, wParam, lParam)
    End Select
End Sub

