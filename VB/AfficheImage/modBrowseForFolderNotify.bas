Attribute VB_Name = "Module1"
Option Explicit


Const WM_USER = &H400

Const BFFM_INITIALIZED = 1  ' Indicates the browse dialog box has finished initializing. The lParam parameter is NULL.
Const BFFM_SELCHANGED = 2   ' Indicates the selection has changed. The lParam parameter contains the address of the item identifier list for the newly selected folder.

Const BFFM_SETSTATUSTEXTA As Long = (WM_USER + 100)
Const BFFM_ENABLEOK As Long = (WM_USER + 101)
Const BFFM_SETSELECTIONA As Long = (WM_USER + 102)
Const BFFM_SETSELECTIONW As Long = (WM_USER + 103)
Const BFFM_SETSTATUSTEXTW As Long = (WM_USER + 104)

Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long


Public Function BrowseNotify(ByVal hwnd As Long, ByVal uMsg As Long, ByVal lParam As Long, ByVal lpData As Long) As Long
  Select Case uMsg
    Case BFFM_INITIALIZED:
      Dim s As String
      s = "D:\pic\x\pic"
      SendMessage hwnd, BFFM_SETSELECTIONA, 1&, ByVal s
      BrowseNotify = 1
    
    Case Else:
      BrowseNotify = 0
  End Select
  
End Function
