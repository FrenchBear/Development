VERSION 5.00
Begin VB.Form frmOwnMnu 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Owner-Draw Menu - Release 4"
   ClientHeight    =   4920
   ClientLeft      =   1785
   ClientTop       =   1950
   ClientWidth     =   6000
   ClipControls    =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4920
   ScaleWidth      =   6000
   Begin VB.CommandButton cmdPicMnu 
      Caption         =   "Subclass Menu"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   4440
      Picture         =   "frmOwnMnu.frx":0000
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   3600
      Width           =   1455
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   25
      Left            =   2760
      Top             =   4440
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   24
      Left            =   2400
      Picture         =   "frmOwnMnu.frx":0102
      Top             =   4440
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   23
      Left            =   2160
      Top             =   4440
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   22
      Left            =   1920
      Picture         =   "frmOwnMnu.frx":0444
      Top             =   4440
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   21
      Left            =   1680
      Picture         =   "frmOwnMnu.frx":0786
      Top             =   4440
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   20
      Left            =   1320
      Top             =   4440
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   19
      Left            =   840
      Picture         =   "frmOwnMnu.frx":0AC8
      Top             =   4440
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   18
      Left            =   600
      Picture         =   "frmOwnMnu.frx":0E0A
      Top             =   4440
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   17
      Left            =   360
      Picture         =   "frmOwnMnu.frx":114C
      Top             =   4440
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   16
      Left            =   120
      Picture         =   "frmOwnMnu.frx":148E
      Top             =   4440
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   15
      Left            =   3720
      Top             =   4080
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   14
      Left            =   3480
      Top             =   4080
      Width           =   240
   End
   Begin VB.Label lbl2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Visual Basic Thunder"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   240
      Index           =   3
      Left            =   1200
      MouseIcon       =   "frmOwnMnu.frx":17D0
      MousePointer    =   99  'Custom
      TabIndex        =   6
      Top             =   3240
      Width           =   1905
   End
   Begin VB.Label lbl2 
      Caption         =   $"frmOwnMnu.frx":1922
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Index           =   2
      Left            =   120
      TabIndex        =   5
      Top             =   2520
      Width           =   5775
   End
   Begin VB.Label lbl2 
      Caption         =   $"frmOwnMnu.frx":19FD
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Index           =   1
      Left            =   120
      TabIndex        =   4
      Top             =   1590
      Width           =   5775
   End
   Begin VB.Label lbl2 
      Caption         =   $"frmOwnMnu.frx":1AA6
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Index           =   0
      Left            =   120
      TabIndex        =   3
      Top             =   600
      Width           =   5775
   End
   Begin VB.Label lbl1 
      Caption         =   "Author's Comments:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   240
      Width           =   4935
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   13
      Left            =   3240
      Picture         =   "frmOwnMnu.frx":1B7E
      Top             =   4080
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   12
      Left            =   3000
      Picture         =   "frmOwnMnu.frx":1C80
      Top             =   4080
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   11
      Left            =   2760
      Picture         =   "frmOwnMnu.frx":1D82
      Top             =   4080
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   255
      Index           =   10
      Left            =   2520
      Top             =   4080
      Width           =   255
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   9
      Left            =   2280
      Picture         =   "frmOwnMnu.frx":1E84
      Top             =   4080
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   255
      Index           =   8
      Left            =   2040
      Top             =   4080
      Width           =   255
   End
   Begin VB.Image img 
      Height          =   255
      Index           =   7
      Left            =   1800
      Top             =   4080
      Width           =   255
   End
   Begin VB.Image img 
      Height          =   255
      Index           =   6
      Left            =   1560
      Top             =   4080
      Width           =   255
   End
   Begin VB.Image img 
      Height          =   255
      Index           =   5
      Left            =   1320
      Top             =   4080
      Width           =   255
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   4
      Left            =   1080
      Picture         =   "frmOwnMnu.frx":21C6
      Top             =   4080
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   3
      Left            =   840
      Picture         =   "frmOwnMnu.frx":22C8
      Top             =   4080
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   240
      Index           =   2
      Left            =   600
      Picture         =   "frmOwnMnu.frx":23CA
      Top             =   4080
      Width           =   240
   End
   Begin VB.Image img 
      Height          =   255
      Index           =   1
      Left            =   360
      Top             =   4080
      Width           =   255
   End
   Begin VB.Image img 
      Height          =   255
      Index           =   0
      Left            =   120
      Top             =   4080
      Width           =   255
   End
   Begin VB.Label lblNum 
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   3600
      Width           =   4215
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuNew 
         Caption         =   "&New"
      End
      Begin VB.Menu mnuOpen 
         Caption         =   "&Open"
      End
      Begin VB.Menu mnuSave 
         Caption         =   "&Save"
      End
      Begin VB.Menu mnuSaveAs 
         Caption         =   "Save &As..."
      End
      Begin VB.Menu sep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "&Edit"
      Begin VB.Menu mnuUndo 
         Caption         =   "&Undo"
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuCut 
         Caption         =   "Cu&t"
      End
      Begin VB.Menu mnuCopy 
         Caption         =   "&Copy"
      End
      Begin VB.Menu mnuPaste 
         Caption         =   "&Paste"
      End
      Begin VB.Menu sep3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuBookmarks 
         Caption         =   "&Bookmarks"
         Begin VB.Menu mnuToggle 
            Caption         =   "Toggle Bookmark"
         End
         Begin VB.Menu mnuNext 
            Caption         =   "Next Bookmark"
         End
         Begin VB.Menu mnuPrevious 
            Caption         =   "Previous Bookmark"
         End
         Begin VB.Menu mnuClearAll 
            Caption         =   "Clear All Bookmarks"
         End
      End
   End
   Begin VB.Menu mnuView 
      Caption         =   "&View"
      Begin VB.Menu mnuCode 
         Caption         =   "&Code"
      End
      Begin VB.Menu mnuObject 
         Caption         =   "&Object"
      End
      Begin VB.Menu sep4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuBrowser 
         Caption         =   "Object &Browser"
      End
   End
End
Attribute VB_Name = "frmOwnMnu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
DefLng A-Z

'=====================================================
'OwnMenu.vbp
'Author: Ben Baird
'Comments: This code is yet unfinished - response
'           to keypresses are still not supported.
'           But, what I do provide here is a start on
'           getting owner-draw menus to work in your
'           applications. This version is very much
'           improved over the previous three -
'           it is now easier to customize, not to
'           mention it now supports multiple top-level
'           menus.
'=====================================================

Dim pnt As PaintEffects

Dim MyFont As Long
Dim OldFont As Long

Dim wlOldProc As Long

Dim Caps(2 To 25) As String
Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (pDest As Any, pSource As Any, ByVal ByteLen As Long)

'In General Declarations...
Private Declare Function ShellExecute Lib _
"shell32.dll" Alias "ShellExecuteA" _
(ByVal hWnd As Long, _
ByVal lpOperation As String, _
ByVal lpFile As String, _
ByVal lpParameters As String, _
ByVal lpDirectory As String, _
ByVal nShowCmd As Long) As Long
Const SW_SHOW = 1

Private Function HiWord(LongIn As Long) As Integer
   HiWord = (LongIn And &HFFFF0000) \ &H10000
End Function
'In a module or form:
Public Sub Navigate(frm As Form, ByVal NavTo As String)
  Dim hBrowse As Long
  hBrowse = ShellExecute(frm.hWnd, "open", NavTo, "", "", SW_SHOW)
End Sub

Private Function LoWord(LongIn As Long) As Integer
   If (LongIn And &HFFFF&) > &H7FFF Then
      LoWord = (LongIn And &HFFFF&) - &H10000
   Else
      LoWord = LongIn And &HFFFF&
   End If
End Function
Private Sub cmdPicMnu_Click()

If wlOldProc <> 0 Then Exit Sub

Dim i As Integer

MenuItems.MenuForm = Me
'Start with File menu
MenuItems.SubMenu = 0
For i = 0 To 5
    MenuItems.MenuID = i
    OwnerDrawMenu (i + 2)
Next
'Next comes Edit menu...
MenuItems.SubMenu = 1
For i = 0 To 6 '7 To 13
    MenuItems.MenuID = i
    OwnerDrawMenu (i + 2)
Next
'Then the Bookmarks menu (under Edit)
SetTopMenu MenuItems.SubMenu
MenuItems.SubMenu = 6
For i = 0 To 3 '16 To 19
    MenuItems.MenuID = i
    OwnerDrawMenu (i + 2)
Next
'Finally, the View menu
MenuItems.MenuForm = Me
MenuItems.SubMenu = 2
For i = 0 To 3
    MenuItems.MenuID = i
    OwnerDrawMenu (i + 2)
Next

wlOldProc = SetWindowLong(hWnd, GWL_WNDPROC, AddressOf OwnMenuProc)

End Sub

Private Sub Form_Load()

Move (Screen.Width - Width) \ 2, (Screen.Height - Height) \ 2

Set pnt = New PaintEffects

Caps(2) = "New"
Caps(3) = "Open"
Caps(4) = "Save"
Caps(5) = "Save As..."
Caps(6) = ""
Caps(7) = "Exit"

Caps(9) = "Undo"
Caps(10) = ""
Caps(11) = "Cut"
Caps(12) = "Copy"
Caps(13) = "Paste"
Caps(15) = "Bookmarks"

Caps(16) = "Toggle Bookmark"
Caps(17) = "Next Bookmark"
Caps(18) = "Previous Bookmark"
Caps(19) = "Clear All Bookmarks"

Caps(21) = "Code"
Caps(22) = "Object"
Caps(23) = ""
Caps(24) = "Object Browser"

End Sub

Private Sub Form_Unload(Cancel As Integer)

If wlOldProc <> 0 Then
    SetWindowLong hWnd, GWL_WNDPROC, wlOldProc
End If

Set pnt = Nothing

'Destroy the font object created in
'the form's window procedure.
Call DeleteObject(MyFont)

End Sub

Private Sub lbl2_Click(Index As Integer)

If Index = 3 Then
 Navigate Me, "http://www.cyberhighway.com/~psy/vbthunder/"
End If

End Sub

Private Sub mnuExit_Click()

Unload Me

End Sub

Public Function MsgProc(ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

'This procedure is called because we've subclassed
'this form. We will catch DRAWITEM and MEASUREITEM
'messages and pass the rest of them on.

'Various structs we'll need
Dim MeasureInfo As MEASUREITEMSTRUCT
Dim DrawInfo As DRAWITEMSTRUCT
Dim mii As MENUITEMINFO
'Set later for separator flag:
Dim IsSep As Boolean
'Our custom brush and the old one
Dim hBr As Long, hOldBr As Long
'Our custom pen and the old one
Dim hPen As Long, hOldPen As Long
'The text color of the menu items
Dim lTextColor As Long
'Now much to bump the menu's selection
'rectangle over
Dim iRectOffset As Integer

If wMsg = WM_DRAWITEM Then
    If wParam = 0 Then 'It was sent by the menu
        'Get DRAWINFOSTRUCT -- copy it to our
        'empty structure from the pointer in lParam
        Call CopyMem(DrawInfo, ByVal lParam, LenB(DrawInfo))
        IsSep = IsSeparator(DrawInfo.itemID)

        '===Set the menu font through its hDC...===
        MyFont = SendMessage(Me.hWnd, WM_GETFONT, 0&, 0&)
        OldFont = SelectObject(DrawInfo.hdc, MyFont)
        'We draw the item based on Un/Selected:
        If DrawInfo.itemState = ODS_SELECTED Then
            hBr = CreateSolidBrush(SysColor(HIGHLIGHT))
            hPen = GetPen(1, SysColor(HIGHLIGHT))
            lTextColor = SysColor(HIGHLIGHTTEXT)
        Else
            hBr = CreateSolidBrush(SysColor(Menu))
            hPen = GetPen(1, SysColor(Menu))
            lTextColor = SysColor(MENUTEXT)
        End If
        'We're going to draw on the menu
        QuickGDI.TargethDC = DrawInfo.hdc
        'Select our new, correctly colored objects:
        hOldBr = SelectObject(DrawInfo.hdc, hBr)
        hOldPen = SelectObject(DrawInfo.hdc, hPen)
        With DrawInfo.rcItem
            If DrawInfo.itemState <> ODS_SELECTED Then
                'Clear the space where the image is
                QuickGDI.DrawRect .Left, .Top, 22, .Bottom
            End If
            'Check to see if the menu item is one of the ones
            'with a picture. If so, then we need to move the
            'edge of the drawing rectangle a little to the
            'left to make room for the image.
            iRectOffset = IIf(img(DrawInfo.itemID).Picture <> 0, 23, 0)
            '6 is the index of the separator bar:
            If Not IsSep Then
                'Draw the rectangle onto the item's space
                QuickGDI.DrawRect .Left + iRectOffset, .Top, .Right, .Bottom
                'Print the item's text (held in the Caps() array)
                hPrint .Left + 25, .Top + 3, Caps(DrawInfo.itemID), lTextColor
            End If
        End With
        'Select the old objects into the menu's DC
        Call SelectObject(DrawInfo.hdc, hOldBr)
        Call SelectObject(DrawInfo.hdc, hOldPen)
        'Delete the ones we created
        Call DeleteObject(hBr)
        Call DeleteObject(hPen)
        With DrawInfo
            'If the item had an image:
            '2 = New, 3 = Open, 4 = Save
            If img(.itemID).Picture.handle <> 0 Then
                'Call BitBlt(.hdc, 4, .rcItem.Top + 2, 16, 16, MnuPics.hdc, Btns(.itemID).Left, 0, vbSrcCopy)
                pnt.PaintTransparentStdPic .hdc, 4, .rcItem.Top + 2, 16, 16, img(.itemID).Picture, 0, 0, &HC0C0C0
                'If this item is selected, draw a raised
                'box around the image
                If DrawInfo.itemState = ODS_SELECTED Then
                    ThreedBox 1, .rcItem.Top, 21, .rcItem.Bottom - 1
                End If
            End If
            'Again, 6 is the separator:
            If IsSep Then
                'Draw the special separator bar
                ThreedBox .rcItem.Left, .rcItem.Top + 2, .rcItem.Right - 1, .rcItem.Bottom - 2, True
            End If
        End With
    End If
    'Don't pass this message on:
    MsgProc = False
    Exit Function

ElseIf wMsg = WM_MEASUREITEM Then
    'Get the MEASUREITEM struct from the pointer
    Call CopyMem(MeasureInfo, ByVal lParam, Len(MeasureInfo))
    'IsSep = IsSeparator(MeasureInfo.itemID)
    IsSep = IsSeparator(MeasureInfo.itemID)
    'Tell Windows how big our items are.
    MeasureInfo.itemWidth = 120
    'If the item being measured is the separator
    'bar, the height should be 5 pixels, 18 if
    'otherwise...
    MeasureInfo.itemHeight = IIf(IsSep, 5, 20)
    'Return the information back to Windows
    Call CopyMem(ByVal lParam, MeasureInfo, Len(MeasureInfo))
    'Don't pass this message on:
    'msg1.InvokeProc = False
    MsgProc = False
    Exit Function
ElseIf wMsg = WM_MENUSELECT Then
    lblNum.Caption = LoWord(wParam) & ", (" & HiWord(wParam) & ")"

ElseIf wMsg = WM_COMMAND Then

End If

'We didn't handle this message,
'pass it on to the next WndProc
MsgProc = CallWindowProc(wlOldProc, hWnd, wMsg, wParam, lParam)

End Function

Public Function IsSeparator(ByVal IID As Integer) As Boolean

Dim mii As MENUITEMINFO
mii.cbSize = Len(mii)
mii.fMask = MIIM_TYPE
mii.wID = IID
GetMenuItemInfo GetMenu(hWnd), IID, False, mii
IsSeparator = ((mii.fType And MFT_SEPARATOR) = MFT_SEPARATOR)

End Function

