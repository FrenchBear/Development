Attribute VB_Name = "QuickGDI"
Option Explicit
DefLng A-Z

Dim m_hDC As Long

Public Type POINTAPI
        x As Long
        y As Long
End Type
Public Type RECT
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type
'Font structs
'Type LOGFONT
'        lfHeight As Long
'        lfWidth As Long
'        lfEscapement As Long
'        lfOrientation As Long
'        lfWeight As Long
'        lfItalic As Byte
'        lfUnderline As Byte
'        lfStrikeOut As Byte
'        lfCharSet As Byte
'        lfOutPrecision As Byte
'        lfClipPrecision As Byte
'        lfQuality As Byte
'        lfPitchAndFamily As Byte
'        lfFaceName(LF_FACESIZE) As Byte
'End Type
'Type NONCLIENTMETRICS
'        cbSize As Long
'        iBorderWidth As Long
'        iScrollWidth As Long
'        iScrollHeight As Long
'        iCaptionWidth As Long
'        iCaptionHeight As Long
'        lfCaptionFont As LOGFONT
'        iSMCaptionWidth As Long
'        iSMCaptionHeight As Long
'        lfSMCaptionFont As LOGFONT
'        iMenuWidth As Long
'        iMenuHeight As Long
'        lfMenuFont As LOGFONT
'        lfStatusFont As LOGFONT
'        lfMessageFont As LOGFONT
'End Type
'Private Const SPI_GETNONCLIENTMETRICS = 41
'Private Const SPI_SETNONCLIENTMETRICS = 42
'Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As Any, ByVal fuWinIni As Long) As Long

Declare Function BitBlt Lib "GDI32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal XSrc As Long, ByVal YSrc As Long, ByVal dwRop As Long) As Long
Global Const SRCCOPY = &HCC0020
Global Const SRCINVERT = &H660046
Global Const SRCAND = &H8800C6
Global Const SRCPAINT = &HEE0086
Global Const DSTINVERT = 55

Private Declare Function GetTextColor Lib "GDI32" (ByVal hdc As Long) As Long
Private Declare Function SetTextColor Lib "GDI32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Private Declare Function TextOut Lib "GDI32" Alias "TextOutA" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
Declare Function SetBkColor Lib "GDI32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Declare Function SetBkMode Lib "GDI32" (ByVal hdc As Long, ByVal nBkMode As Long) As Long
Global Const NEWTRANSPARENT = 3  '  use with SetBkMode()

Private Declare Function GetTextFace Lib "GDI32" Alias "GetTextFaceA" (ByVal hdc As Long, ByVal nCount As Long, ByVal lpFacename As String) As Long

Private Declare Function CreatePen Lib "GDI32" (ByVal nPenStyle As Long, ByVal nWidth As Long, ByVal crColor As Long) As Long
Declare Function CreateSolidBrush Lib "GDI32" (ByVal crColor As Long) As Long
Private Declare Function MoveToEx Lib "GDI32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, lpPoint As POINTAPI) As Long
Private Declare Function LineTo Lib "GDI32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long
Private Declare Function InvertRect Lib "user32" (ByVal hdc As Long, lpRect As RECT) As Long
Private Declare Function Rectangle Lib "GDI32" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long

Private Declare Function GetStockObject Lib "GDI32" (ByVal nIndex As Integer) As Long
Declare Function SelectObject Lib "GDI32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Declare Function DeleteObject Lib "GDI32" (ByVal hObject As Long) As Integer
Dim CurObj As Long
Public Const NULL_BRUSH = 5
Public Enum StockObjects
   soWHITE_BRUSH = 0
   soLTGRAY_BRUSH = 1
   soGRAY_BRUSH = 2
   soDKGRAY_BRUSH = 3
   soBLACK_BRUSH = 4
   soNULL_BRUSH = 5
   soHOLLOW_BRUSH = NULL_BRUSH
   soWHITE_PEN = 6
   soBLACK_PEN = 7
   soNULL_PEN = 8
   soOEM_FIXED_FONT = 10
   soANSI_FIXED_FONT = 11
   soANSI_VAR_FONT = 12
   soSYSTEM_FONT = 13
   soDEVICE_DEFAULT_FONT = 14
   soDEFAULT_PALETTE = 15
   soSYSTEM_FIXED_FONT = 16
   soSTOCK_LAST = 16
End Enum
Private Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Integer

Private Declare Function GetSysColor Lib "user32" (ByVal nIndex As Integer) As Long
Private Declare Sub SetSysColors Lib "user32" (ByVal nChanges As Integer, lpSysColor As Integer, lpColorValues As Long)
Public Enum ColConst
ActiveBorder = 10
ActiveCaption = 2
ADJ_MAX = 100
ADJ_MIN = -100 'shorts
APPWORKSPACE = 12
Background = 1
BTNFACE = 15
BTNHIGHLIGHT = 20
BTNSHADOW = 16
BTNTEXT = 18
CAPTIONTEXT = 9
GRAYTEXT = 17
HIGHLIGHT = 13
HIGHLIGHTTEXT = 14
INACTIVEBORDER = 11
INACTIVECAPTION = 3
INACTIVECAPTIONTEXT = 19
Menu = 4
MENUTEXT = 7
SCROLLBAR = 0
WINDOW = 5
WINDOWFRAME = 6
WINDOWTEXT = 8
End Enum
Public Property Get SysColor(ByVal Index As ColConst) As Long

SysColor = GetSysColor(Index)

End Property

Public Property Let SysColor(ByVal Index As ColConst, ByVal NewCol As Long)

Call SetSysColors(1, ByVal Index, NewCol)

End Property

Public Property Get TargethDC() As Long

TargethDC = m_hDC

End Property

Public Property Let TargethDC(ByVal vNewValue As Long)

'The hDC to draw to when performing operations
'from this module's subroutines.
m_hDC = vNewValue

End Property

Public Sub DrawRect(ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long)

If m_hDC = 0 Then Exit Sub

Call Rectangle(m_hDC, X1, Y1, X2, Y2)

End Sub

Public Function GetPen(ByVal nWidth As Long, ByVal Clr As Long) As Long

GetPen = CreatePen(0, nWidth, Clr)

End Function

Public Sub ThreedBox(ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long, Optional Sunken As Boolean = False)

'Draw a raised box around the specified
'coordinates.

If m_hDC = 0 Then Exit Sub

Dim CurPen As Long, OldPen As Long
Dim dm As POINTAPI

If Sunken = False Then
    CurPen = GetPen(1, SysColor(BTNHIGHLIGHT))
Else
    CurPen = GetPen(1, SysColor(BTNSHADOW))
End If
OldPen = SelectObject(m_hDC, CurPen)
'FirstLightLine
MoveToEx m_hDC, X1, Y2, dm
LineTo m_hDC, X1, Y1
'SecondLightLine
LineTo m_hDC, X2, Y1

SelectObject m_hDC, OldPen
DeleteObject CurPen
If Sunken = False Then
    CurPen = GetPen(1, SysColor(BTNSHADOW))
Else
    CurPen = GetPen(1, SysColor(BTNHIGHLIGHT))
End If
OldPen = SelectObject(m_hDC, CurPen)
'FirstDarkLine
MoveToEx m_hDC, X2, Y1, dm
LineTo m_hDC, X2, Y2
'SecondDarkLine
LineTo m_hDC, X1, Y2

SelectObject m_hDC, OldPen
DeleteObject CurPen

End Sub

Public Function hPrint(ByVal x As Long, ByVal y As Long, ByVal hStr As String, ByVal Clr As Long) As Long

If m_hDC = 0 Then Exit Function

'Equivalent to setting a form's property
'FontTransparent = True
SetBkMode m_hDC, NEWTRANSPARENT

Dim OT As Long
OT = GetTextColor(m_hDC)
SetTextColor m_hDC, Clr
'Print the text
hPrint = TextOut(m_hDC, x, y, hStr, Len(hStr))
'Restore old text color
SetTextColor m_hDC, OT

End Function

Public Function Stock(ByVal Obj As StockObjects) As Long

Stock = GetStockObject(Obj)

End Function

