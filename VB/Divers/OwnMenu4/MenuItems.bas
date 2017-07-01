Attribute VB_Name = "MenuItems"
Option Explicit
DefLng A-Z

Dim hMenu As Long
Dim hSubMenu As Long
Dim mnuID As Long

Dim m_Form As frmOwnMnu

Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Const GWL_WNDPROC = (-4)

Private Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type
Type MENUITEMINFO
    cbSize As Long
    fMask As Long
    fType As Long
    fState As Long
    wID As Long
    hSubMenu As Long
    hbmpChecked As Long
    hbmpUnchecked As Long
    dwItemData As Long
    dwTypeData As String
    cch As Long
End Type
Global Const MIIM_STATE = &H1
Global Const MIIM_ID = &H2
Global Const MIIM_SUBMENU = &H4
Global Const MIIM_CHECKMARKS = &H8
Global Const MIIM_TYPE = &H10
Global Const MIIM_DATA = &H20

Type MEASUREITEMSTRUCT
        CtlType As Long
        CtlID As Long
        itemID As Long
        itemWidth As Long
        itemHeight As Long
        ItemData As Long
End Type
Type DRAWITEMSTRUCT
        CtlType As Long
        CtlID As Long
        itemID As Long
        itemAction As Long
        itemState As Long
        hwndItem As Long
        hdc As Long
        rcItem As RECT
        ItemData As Long
End Type

'Private Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hDC As Long, ByVal lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long
'private Declare Function DrawTextEx Lib "user32" Alias "DrawTextExA" (ByVal hDC As Long, ByVal lpsz As String, ByVal n As Long, lpRect As RECT, ByVal un As Long, lpDrawTextParams As DRAWTEXTPARAMS) As Long

Declare Function GetMenu Lib "user32" (ByVal hWnd As Long) As Long
Declare Function GetSubMenu Lib "user32" (ByVal hMenu As Long, ByVal nPos As Long) As Long
Private Declare Function GetMenuItemID Lib "user32" (ByVal hMenu As Long, ByVal nPos As Long) As Long

'Private Declare Function MenuItemFromPoint Lib "user32" (ByVal hWnd As Long, ByVal hMenu As Long, ByVal ptScreen As POINTAPI) As Long
Private Declare Function ModifyMenu Lib "user32" Alias "ModifyMenuA" (ByVal hMenu As Long, ByVal nPosition As Long, ByVal wFlags As Long, ByVal wIDNewItem As Long, ByVal lpString As Long) As Long
Private Declare Function ModifyStringMenu Lib "user32" Alias "ModifyMenuA" (ByVal hMenu As Long, ByVal nPosition As Long, ByVal wFlags As Long, ByVal wIDNewItem As Long, ByVal lpString As String) As Long

Private Declare Function GetMenuDefaultItem Lib "user32" (ByVal hMenu As Long, ByVal fByPos As Long, ByVal gmdiFlags As Long) As Long
Private Declare Function GetMenuItemCount Lib "user32" (ByVal hMenu As Long) As Long
Declare Function GetMenuItemInfo Lib "user32" Alias "GetMenuItemInfoA" (ByVal hMenu As Long, ByVal uItem As Long, ByVal ByPosition As Long, lpMenuItemInfo As MENUITEMINFO) As Boolean
'Private Declare Function GetMenuItemRect Lib "user32" (ByVal hWnd As Long, ByVal hMenu As Long, ByVal uItem As Long, lprcItem As RECT) As Boolean
Private Declare Function GetMenuState Lib "user32" (ByVal hMenu As Long, ByVal wID As Long, ByVal wFlags As Long) As Long
Private Declare Function GetMenuString Lib "user32" Alias "GetMenuStringA" (ByVal hMenu As Long, ByVal wIDItem As Long, ByVal lpString As String, ByVal nMaxCount As Long, ByVal wFlag As Long) As Long
Declare Function SetMenu Lib "user32" (ByVal hWnd As Long, ByVal hMenu As Long) As Long
Private Declare Function SetMenuDefaultItem Lib "user32" (ByVal hMenu As Long, ByVal uItem As Long, ByVal fByPos As Long) As Boolean
Private Declare Function SetMenuItemBitmaps Lib "user32" (ByVal hMenu As Long, ByVal nPosition As Long, ByVal wFlags As Long, ByVal hBitmapUnchecked As Long, ByVal hBitmapChecked As Long) As Long
Private Declare Function SetMenuItemInfo Lib "user32" Alias "SetMenuItemInfoA" (ByVal hMenu As Long, ByVal un As Long, ByVal bool As Boolean, lpcMenuItemInfo As MENUITEMINFO) As Boolean

Private Const MF_APPEND = &H100&
Private Const MF_BITMAP = &H4&
Private Const MF_BYCOMMAND = &H0&
Private Const MF_BYPOSITION = &H400&
Private Const MF_CALLBACKS = &H8000000
Private Const MF_CHANGE = &H80&
Private Const MF_CHECKED = &H8&
Private Const MF_CONV = &H40000000
Private Const MF_DELETE = &H200&
Private Const MF_DISABLED = &H2&
Private Const MF_ENABLED = &H0&
Private Const MF_END = &H80
Private Const MF_ERRORS = &H10000000
Private Const MF_GRAYED = &H1&
Private Const MF_HELP = &H4000&
Private Const MF_HILITE = &H80&
Private Const MF_HSZ_INFO = &H1000000
Private Const MF_INSERT = &H0&
Private Const MF_LINKS = &H20000000
Private Const MF_MASK = &HFF000000
Private Const MF_MENUBARBREAK = &H20&
Private Const MF_MENUBREAK = &H40&
Private Const MF_MOUSESELECT = &H8000&
Private Const MF_OWNERDRAW = &H100&
Private Const MF_POPUP = &H10&
Private Const MF_POSTMSGS = &H4000000
Private Const MF_REMOVE = &H1000&
Private Const MF_SENDMSGS = &H2000000
Private Const MF_SEPARATOR = &H800&
Private Const MF_STRING = &H0&
Private Const MF_SYSMENU = &H2000&
Private Const MF_UNCHECKED = &H0&
Private Const MF_UNHILITE = &H0&
Private Const MF_USECHECKBITMAPS = &H200&

Global Const MFT_STRING = MF_STRING
Global Const MFT_BITMAP = MF_BITMAP
Global Const MFT_MENUBARBREAK = MF_MENUBARBREAK
Global Const MFT_MENUBREAK = MF_MENUBREAK
Global Const MFT_OWNERDRAW = MF_OWNERDRAW
Global Const MFT_RADIOCHECK = &H200
Global Const MFT_SEPARATOR = MF_SEPARATOR
Global Const MFT_RIGHTORDER = &H2000

Global Const ODS_CHECKED = &H8
Global Const ODS_DISABLED = &H4
Global Const ODS_FOCUS = &H10
Global Const ODS_GRAYED = &H2
Global Const ODS_SELECTED = &H1

Public Property Get MenuForm() As frmOwnMnu

Set MenuForm = m_Form

End Property

Public Property Let MenuForm(ByVal vNewValue As frmOwnMnu)

Set m_Form = vNewValue
hMenu = GetMenu(m_Form.hWnd)

End Property

Public Property Get SubMenu() As Long

SubMenu = hSubMenu

End Property

Public Property Let SubMenu(ByVal vNewValue As Long)

hSubMenu = GetSubMenu(hMenu, vNewValue)

End Property

Public Property Get MenuID() As Long

MenuID = mnuID

End Property

Public Property Let MenuID(ByVal vNewValue As Long)

mnuID = GetMenuItemID(hSubMenu, vNewValue)

End Property


Public Sub OwnerDrawMenu(ByVal ItemData As Long)

'Change the menu's style to owner-draw. You must
'now subclass the form that this menu is on so
'you can respond to the WM_MEASUREITEM and WM_DRAWITEM
'messages.
Dim mii As MENUITEMINFO
mii.cbSize = Len(mii)
mii.fMask = MIIM_TYPE
GetMenuItemInfo hSubMenu, MenuID, False, mii
If ((mii.fType And MF_SEPARATOR) = MF_SEPARATOR) Then
    '*Preserve* separator style...
    Call ModifyMenu(hSubMenu, MenuID, MF_BYCOMMAND Or MF_OWNERDRAW Or MF_SEPARATOR, MenuID, ItemData)
Else
    Call ModifyMenu(hSubMenu, MenuID, MF_BYCOMMAND Or MF_OWNERDRAW, MenuID, ItemData)
End If

End Sub

Public Function GetString(ByVal mID As Long) As String

Dim tmpStr As String * 100
Call GetMenuString(hSubMenu, mID, tmpStr, 100, 0&)

GetString = VBA.Trim$(tmpStr)

End Function

Public Sub OwnToplevel(ByVal ItemData As Long)

Call ModifyMenu(hMenu, MenuID, MF_BYCOMMAND Or MF_OWNERDRAW, MenuID, ItemData)

End Sub

Public Function OwnMenuProc(ByVal hWnd As Long, _
ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

OwnMenuProc = frmOwnMnu.MsgProc(hWnd, wMsg, wParam, lParam)

End Function

Public Sub SetTopMenu(NewMnu As Long)

hMenu = NewMnu

End Sub

