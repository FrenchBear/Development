Attribute VB_Name = "modInstanceToWnd"
' modInstanceToWnd
' Convert a PID returned by Shell into a hWnd
' 2009-01-09 FPVI
' From http://www.vb-helper.com/howto_pid_to_hwnd.html

Option Explicit

Private Const GW_HWNDNEXT = 2

Private Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hWnd As Long, lpdwProcessId As Long) As Long
Private Declare Function GetParent Lib "user32" (ByVal hWnd As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As Long, ByVal lpWindowName As Long) As Long
Private Declare Function GetWindow Lib "user32" (ByVal hWnd As Long, ByVal wCmd As Long) As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal cch As Long) As Long

' Return the window handle for an instance handle.
Public Function InstanceToWnd(ByVal target_pid As Long) As Long
Dim test_hwnd As Long
Dim test_pid As Long
Dim test_thread_id As Long

    ' Get the first window handle.
    test_hwnd = FindWindow(ByVal 0&, ByVal 0&)

    ' Loop until we find the target or we run out
    ' of windows.
    Do While test_hwnd <> 0
        ' See if this window has a parent. If not,
        ' it is a top-level window.
        If GetParent(test_hwnd) = 0 Then
            ' This is a top-level window. See if
            ' it has the target instance handle.
            test_thread_id = _
                GetWindowThreadProcessId(test_hwnd, test_pid)

            If test_pid = target_pid Then
                ' This is the target.
                InstanceToWnd = test_hwnd
                Exit Do
            End If
        End If

        ' Examine the next window.
        test_hwnd = GetWindow(test_hwnd, GW_HWNDNEXT)
    Loop
End Function



Public Function GetWindowCaption(ByVal hWnd As Long) As String
    Dim buf As String
    Dim buf_len As Long
    
    ' Display the program's caption.
    buf = Space$(256)
    buf_len = GetWindowText(hWnd, buf, Len(buf))
    buf = Left$(buf, buf_len)

    GetWindowCaption = buf
End Function
