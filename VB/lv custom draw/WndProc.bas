Attribute VB_Name = "mWndProc"
Option Explicit
'
' Brad Martinez http://www.mvps.org
'
Public g_fNewDraw As Boolean
Public g_crl16(15) As Long
Public g_IFonts(15) As IFont

' ========================================================

Public Enum CBoolean
  CFalse = 0
  CTrue = 1
End Enum

Public Type RECT   ' rct
  Left As Long
  Top As Long
  Right As Long
  Bottom As Long
End Type

Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hgdiobj As Long) As Long
Declare Function GetClientRect Lib "user32" (ByVal hWnd As Long, lpRect As RECT) As Long
Declare Function MoveWindow Lib "user32" (ByVal hWnd As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal bRepaint As CBoolean) As Long
Declare Function InvalidateRect Lib "user32" (ByVal hWnd As Long, lpRect As Any, ByVal bErase As CBoolean) As Long

Public Const WM_SETREDRAW = &HB

Declare Function SendMessage Lib "user32" Alias "SendMessageA" _
                            (ByVal hWnd As Long, _
                            ByVal wMsg As Long, _
                            ByVal wParam As Long, _
                            lParam As Any) As Long   ' <---

Public Const LVM_FIRST = &H1000
Public Const LVM_SETCOLUMNWIDTH = (LVM_FIRST + 30)

' ========================================================

' Code was written in and formatted for 8pt MS San Serif

' The NMHDR structure contains information about a notification message. The pointer
' to this structure is specified as the lParam member of the WM_NOTIFY message.
Public Type NMHDR
  hwndFrom As Long   ' Window handle of control sending message
  idFrom As Long        ' Identifier of control sending message
  code  As Long          ' Specifies the notification code
End Type

Private Const WM_NOTIFY = &H4E
Private Const WM_DESTROY = &H2

Private Declare Function GetProp Lib "user32" Alias "GetPropA" (ByVal hWnd As Long, ByVal lpString As String) As Long
Private Declare Function SetProp Lib "user32" Alias "SetPropA" (ByVal hWnd As Long, ByVal lpString As String, ByVal hData As Long) As Long
Private Declare Function RemoveProp Lib "user32" Alias "RemovePropA" (ByVal hWnd As Long, ByVal lpString As String) As Long

Declare Sub MoveMemory Lib "kernel32" Alias "RtlMoveMemory" (pDest As Any, pSource As Any, ByVal dwLength As Long)

Public Enum GWL_nIndex
  GWL_WNDPROC = (-4)
'  GWL_HWNDPARENT = (-8)
  GWL_ID = (-12)
  GWL_STYLE = (-16)
  GWL_EXSTYLE = (-20)
'  GWL_USERDATA = (-21)
End Enum

Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As GWL_nIndex) As Long
Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As GWL_nIndex, ByVal dwNewLong As Long) As Long

Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function DefWindowProc Lib "user32" Alias "DefWindowProcA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

Private Const OLDWNDPROC = "OldWndProc"
Private Const OBJECTPTR = "ObjectPtr"

#If DEBUGWINDOWPROC Then
  ' maintains a WindowProcHook reference for each subclassed window.
  ' the window's handle is the collection item's key string.
  Private m_colWPHooks As New Collection
#End If
'

Public Function SubClass(hWnd As Long, _
                                         lpfnNew As Long, _
                                         Optional objNotify As Object = Nothing) As Boolean
  Dim lpfnOld As Long
  Dim fSuccess As Boolean
  On Error GoTo Out
  
  If GetProp(hWnd, OLDWNDPROC) Then
    SubClass = True
    Exit Function
  End If
  
#If (DEBUGWINDOWPROC = 0) Then
    lpfnOld = SetWindowLong(hWnd, GWL_WNDPROC, lpfnNew)

#Else
    Dim objWPHook As WindowProcHook
    
    Set objWPHook = CreateWindowProcHook
    m_colWPHooks.Add objWPHook, CStr(hWnd)
    
    With objWPHook
      Call .SetMainProc(lpfnNew)
      lpfnOld = SetWindowLong(hWnd, GWL_WNDPROC, .ProcAddress)
      Call .SetDebugProc(lpfnOld)
    End With

#End If
  
  If lpfnOld Then
    fSuccess = SetProp(hWnd, OLDWNDPROC, lpfnOld)
    If (objNotify Is Nothing) = False Then
      fSuccess = fSuccess And SetProp(hWnd, OBJECTPTR, ObjPtr(objNotify))
    End If
  End If
  
Out:
  If fSuccess Then
    SubClass = True
  
  Else
    If lpfnOld Then Call SetWindowLong(hWnd, GWL_WNDPROC, lpfnOld)
    MsgBox "Error subclassing window &H" & Hex(hWnd) & vbCrLf & vbCrLf & _
                  "Err# " & Err.Number & ": " & Err.Description, vbExclamation
  End If
  
End Function

Public Function UnSubClass(hWnd As Long) As Boolean
  Dim lpfnOld As Long
  
  lpfnOld = GetProp(hWnd, OLDWNDPROC)
  If lpfnOld Then
    
    If SetWindowLong(hWnd, GWL_WNDPROC, lpfnOld) Then
      Call RemoveProp(hWnd, OLDWNDPROC)
      Call RemoveProp(hWnd, OBJECTPTR)

#If DEBUGWINDOWPROC Then
      ' remove the WindowProcHook reference from the collection
      m_colWPHooks.Remove CStr(hWnd)
#End If
      
      UnSubClass = True
    
    End If   ' SetWindowLong
  End If   ' lpfnOld

End Function

' Returns the specified object reference stored in the subclassed
' window's OBJECTPTR window property.
' The object reference is valid for only as long as the calling proc holds it.

Public Function GetObj(hWnd As Long) As Object
  Dim Obj As Object
  Dim pObj As Long
  pObj = GetProp(hWnd, OBJECTPTR)
  If pObj Then
    MoveMemory Obj, pObj, 4
    Set GetObj = Obj
    MoveMemory Obj, 0&, 4
  End If
End Function

Public Function WndProc(ByVal hWnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

  Select Case uMsg
    
    ' ======================================================
    Case WM_NOTIFY
      Static lvcd As NMLVCUSTOMDRAW
      
      MoveMemory lvcd, ByVal lParam, Len(lvcd)   ' every structs' member is a Long
      Select Case lvcd.nmcd.hdr.code
        
#If (WIN32_IE >= &H300) Then
  
        Case NM_CUSTOMDRAW
          Static iElement As Long
          
'Debug.Print "&H" & Hex(lvcd.nmcd.dwDrawStage)

          Select Case lvcd.nmcd.dwDrawStage
          
            ' ====================================================
            Case CDDS_PREPAINT
              ' Tell the listview we want CDDS_ITEMPREPAINT for each item
              WndProc = CDRF_NOTIFYITEMDRAW
              Exit Function
  
            ' ====================================================
            Case CDDS_ITEMPREPAINT
              If g_fNewDraw Then
                iElement = lvcd.nmcd.dwItemSpec And &HF
              Else
                iElement = ((lvcd.nmcd.dwItemSpec * 4) - 1) And &HF
              End If
              
              Call SelectObject(lvcd.nmcd.hdc, g_IFonts(iElement).hFont)
              lvcd.clrText = g_crl16(iElement)
              lvcd.clrTextBk = g_crl16(15 - iElement)
              MoveMemory ByVal lParam, lvcd, Len(lvcd)
              ' Tell the listview we want (CDDS_ITEMPREPAINT Or CDDS_SUBITEM)
              ' for each item's subitems, and that we changed the item's font.
              WndProc = CDRF_NOTIFYSUBITEMDRAW Or CDRF_NEWFONT
              Exit Function
  
            ' ====================================================
            Case (CDDS_ITEMPREPAINT Or CDDS_SUBITEM)
              If g_fNewDraw Then
                iElement = (lvcd.nmcd.dwItemSpec + (lvcd.iSubItem + 1)) And &HF
              Else
                iElement = (((lvcd.nmcd.dwItemSpec * 4) - 1) + (lvcd.iSubItem + 1)) And &HF
              End If
'Debug.Print iElement; g_IFonts(iElement).Name
              
              Call SelectObject(lvcd.nmcd.hdc, g_IFonts(iElement).hFont)
              lvcd.clrText = g_crl16(iElement)
              lvcd.clrTextBk = g_crl16(15 - iElement)
              MoveMemory ByVal lParam, lvcd, Len(lvcd)
              ' Tell the listview that we changed the subitem's font.
              WndProc = CDRF_NEWFONT
              Exit Function
              
          End Select   ' lvcd.nmcd.dwDrawStage
          
#End If   ' (WIN32_IE >= &H300)
      
      End Select   ' nmh.code
                
    ' ======================================================
    ' Unsubclass the window.
    
    Case WM_DESTROY
      ' OLDWNDPROC will be gone after UnSubClass is called!
      Call CallWindowProc(GetProp(hWnd, OLDWNDPROC), hWnd, uMsg, wParam, lParam)
      Call UnSubClass(hWnd)
      Exit Function
      
  End Select   ' uMsg
  
  WndProc = CallWindowProc(GetProp(hWnd, OLDWNDPROC), hWnd, uMsg, wParam, lParam)
  
End Function
 
Public Function ListView_SetColumnWidth(hWnd As Long, iCol As Long, cx As Long) As Boolean
  ListView_SetColumnWidth = SendMessage(hWnd, LVM_SETCOLUMNWIDTH, ByVal iCol, ByVal cx) ' MAKELPARAM(cx, 0))
End Function
