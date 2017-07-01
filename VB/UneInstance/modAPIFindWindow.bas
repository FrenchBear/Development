Attribute VB_Name = "modAPIFindWindow"
' modAPIFindWindow
' Finds a Window on its caption with a Like pattern
' 07/22/2004 PV

Option Explicit


Private Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function EnumWindows Lib "user32" (ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long

Private m_TargetString As String
Private m_TargetHwnd As Long


' Find a window with a title containing target_string
' and return its hWnd.
Public Function FindWindowByPartialTitle(ByVal target_string As String) As Long
    m_TargetString = target_string
    m_TargetHwnd = 0

    ' Enumerate windows.
    EnumWindows AddressOf EnumCallback, 0

    ' Return the hWnd found (if any).
    FindWindowByPartialTitle = m_TargetHwnd
End Function


' Check a returned task to see if it's the one we want.
Public Function EnumCallback(ByVal app_hWnd As Long, ByVal param As Long) As Long
    Dim buf As String
    Dim title As String
    Dim Length As Long

    ' Get the window's title.
    Length = GetWindowTextLength(app_hWnd)
    buf = Space$(Length + 1)
    Length = GetWindowText(app_hWnd, buf, Length + 1)
    title = Left$(buf, Length)

    ' See if the title contains the target string.
    If title Like m_TargetString Then
        ' This is the one we want.
        m_TargetHwnd = app_hWnd

        ' Stop searching.
        EnumCallback = 0
    Else
        ' Continue searching.
        EnumCallback = 1
    End If
End Function

