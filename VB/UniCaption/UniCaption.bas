Attribute VB_Name = "UniCaption"
Private Declare Function DefWindowProcW Lib "user32" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Sub PutMem4 Lib "msvbvm60" (Destination As Any, Value As Any)
Private Declare Function SysAllocStringLen Lib "oleaut32" (ByVal OleStr As Long, ByVal bLen As Long) As Long

Private Const WM_GETTEXT = &HD
Private Const WM_GETTEXTLENGTH = &HE
Private Const WM_SETTEXT = &HC

Public Function GetCaptionW(ByVal hWnd As Long) As String
    Dim lngLen As Long, lngPtr As Long
    lngLen = DefWindowProcW(hWnd, WM_GETTEXTLENGTH, 0, ByVal 0)
    If lngLen Then
        lngPtr = SysAllocStringLen(0, lngLen)
        PutMem4 ByVal VarPtr(CaptionW), ByVal lngPtr
        DefWindowProcW hWnd, WM_GETTEXT, lngLen + 1, ByVal lngPtr
    End If
End Function

Public Sub SetCaptionW(ByVal hWnd As Long, ByRef NewValue As String)
    DefWindowProcW hWnd, WM_SETTEXT, 0, ByVal StrPtr(NewValue)
End Sub

