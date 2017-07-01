Attribute VB_Name = "modMouseTrack"
' modMouseTrack
' Support for mouse tracking (MouseLeave and Hover evenrs)
' 2005-12-14 FPVI

Option Explicit

Public Const WM_MOUSEHOVER = &H2A1&
Public Const WM_MOUSELEAVE = &H2A3&

Public Const TME_HOVER = &H1&
Public Const TME_LEAVE = &H2&
Public Const TME_QUERY = &H40000000
Public Const TME_CANCEL = &H80000000

Public Const HOVER_DEFAULT = &HFFFFFFFF

Public Const MK_LBUTTON = &H1&
Public Const MK_RBUTTON = &H2&
Public Const MK_SHIFT = &H4&
Public Const MK_CONTROL = &H8&
Public Const MK_MBUTTON = &H10&

Public Type tagTRACKMOUSEEVENT
    cbSize As Long
    dwFlags As Long
    hwndTrack As Long
    dwHoverTime As Long
End Type

Public Declare Function TrackMouseEvent Lib "user32" (lpEventTrack As tagTRACKMOUSEEVENT) As Long

