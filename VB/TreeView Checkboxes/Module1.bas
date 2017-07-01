Attribute VB_Name = "Module1"
Option Explicit
'
' Brad Martinez, http://www.mvps.org/ccrp/
'

' The are the indices of the treeview's checkbox state images
' when the treeview's TVS_CHECKBOXES style bit is set.
Public Const IIL_UNCHECKED = 1
Public Const IIL_CHECKED = 2

Public Const GWL_STYLE = (-16)

Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long

Declare Function SendMessage Lib "user32" Alias "SendMessageA" _
                            (ByVal hwnd As Long, _
                            ByVal wMsg As Long, _
                            wParam As Any, _
                            lParam As Any) As Long   ' <---

Public Type POINTAPI   ' pt
  x As Long
  y As Long
End Type

Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Declare Function ScreenToClient Lib "user32" (ByVal hwnd As Long, lpPoint As POINTAPI) As Long
Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer

' ===========================================================================
' treeview definitions defined in Commctrl.h at:
' http://premium.microsoft.com/msdn/library/sdkdoc/c67_4c8m.htm

' style
Public Const TVS_CHECKBOXES = &H100   ' >= IE3

Public Type TVITEM   ' was TV_ITEM
  mask As Long
  hItem As Long
  state As Long
  stateMask As Long
  pszText As String   ' Long   ' pointer
  cchTextMax As Long
  iImage As Long
  iSelectedImage As Long
  cChildren As Long
  lParam As Long
End Type

' TVITEM.mask flags
Public Const TVIF_TEXT = &H1
Public Const TVIF_STATE = &H8
Public Const TVIF_HANDLE = &H10

' TVITEM.state bit value
Public Const TVIS_STATEIMAGEMASK = &HF000

Public Type TVHITTESTINFO   ' was TV_HITTESTINFO
  pt As POINTAPI
  flags As Long
  hItem As Long
End Type

' TVHITTESTINFO.flags value
Public Const TVHT_ONITEMSTATEICON = &H40

' User-defined as the maximun treeview item text length.
' If an items text exceeds this value when calling GetTVItemText
' there could be problems...
Public Const MAX_ITEM = 256

' messages
Public Const TV_FIRST = &H1100
Public Const TVM_GETNEXTITEM = (TV_FIRST + 10)
Public Const TVM_GETITEM = (TV_FIRST + 12)
Public Const TVM_SETITEM = (TV_FIRST + 13)
Public Const TVM_HITTEST = (TV_FIRST + 17)

' TVM_GETNEXTITEM wParam values
Public Enum TVGN_Flags
    TVGN_ROOT = &H0
    TVGN_NEXT = &H1
    TVGN_PREVIOUS = &H2
    TVGN_PARENT = &H3
    TVGN_CHILD = &H4
    TVGN_FIRSTVISIBLE = &H5
    TVGN_NEXTVISIBLE = &H6
    TVGN_PREVIOUSVISIBLE = &H7
    TVGN_DROPHILITE = &H8
    TVGN_CARET = &H9
#If (WIN32_IE >= &H400) Then   ' >= Comctl32.dll v4.71
    TVGN_LASTVISIBLE = &HA
#End If
End Enum
'

' Determines if the current state image of the specified treeview
' item is set to the checked checkbox image index.

'   hwndTV      - treeview's window handle
'   hItem          - item's handle whose checkbox state is to be to returned

' Return True if the item's state immage is set to the
' checked checkbox index, returns False otherwise.

Public Function IsTVItemChecked(hwndTV As Long, _
                                                       hItem As Long) As Boolean
  Dim tvi As TVITEM

  ' Initialize the struct and get the item's state value.
  ' (TVIF_HANDLE does not need to be specified, it's use is implied...)
  tvi.mask = TVIF_HANDLE Or TVIF_STATE
  tvi.hItem = hItem
  tvi.stateMask = TVIS_STATEIMAGEMASK
  Call TreeView_GetItem(hwndTV, tvi)

'Debug.Print "&H" & Hex(tvi.state)

  ' We have to test to see if the treeview's checked state image *is*
  ' set since the logical And test on the unchecked image (1) will
  ' evaluate to True when either checkbox image is set...
  IsTVItemChecked = (tvi.state And INDEXTOSTATEIMAGEMASK(IIL_CHECKED))
  
End Function

' Determines if the current state image of the item under the specified
' point (if any) is set to the checked checkbox image index.

'   hwndTV      - treeview's window handle
'   x, y             - treeview coordinates in which to retrieve the item from

' Return True if the item's state immage is set to the
' checked checkbox index, returns False otherwise.

Public Function IsTVItemCheckedFromClick(hwndTV As Long, _
                                                                      x As Long, _
                                                                      y As Long) As Boolean
  Dim tvhti As TVHITTESTINFO
  Dim fChecked As Boolean
    
  tvhti.pt.x = x
  tvhti.pt.y = y
  If TreeView_HitTest(hwndTV, tvhti) Then   ' rtns an hItem also
    
    fChecked = IsTVItemChecked(hwndTV, tvhti.hItem)
    
    ' Since we retrieved the item's handle from a treeeview coordinate as a
    ' result of a NodeClick event (or MouseUp event, both are invoked from
    ' an NM_CLICK notification), if this coordinate is within the area of the
    ' item's state icon, then the item's checkbox image is *in the process* of
    ' being toggled, but *not yet* toggled. So we'll toggle the return value
    ' reflecting the soon to be actual state value.
    If (tvhti.flags And TVHT_ONITEMSTATEICON) Then fChecked = Not fChecked
    
    IsTVItemCheckedFromClick = fChecked
  
  End If
  
End Function

' Set the specified checkbox state for the specified item.
' Returns True if successful, returns False otherwise.

'   hwndTV      - treeview's window handle
'   hItem          - item's handle whose checkbox state is to be to set
'   fCheck       - If True, sets the checkbox state to the checked image,
'                       if False, sets the unchecked image.

Public Function SetTVItemCheckImage(hwndTV As Long, _
                                                               hItem As Long, _
                                                               fCheck As Boolean) As Boolean
  Dim tvi As TVITEM
  
  tvi.mask = TVIF_HANDLE Or TVIF_STATE
  tvi.hItem = hItem
  tvi.stateMask = TVIS_STATEIMAGEMASK
  
  If fCheck Then
    tvi.state = INDEXTOSTATEIMAGEMASK(IIL_CHECKED)
  Else
    tvi.state = INDEXTOSTATEIMAGEMASK(IIL_UNCHECKED)
  End If
  
  SetTVItemCheckImage = TreeView_SetItem(hwndTV, tvi)
  
End Function

' Returns the text of the specified treeview item if successful,
' returns an empty string otherwise.

'   hwndTV      - treeview's window handle
'   hItem          - item's handle whose text is to be to returned
'   cbItem        - length of the specified item's text.

Public Function GetTVItemText(hwndTV As Long, _
                                                  hItem As Long, _
                                                  Optional cbItem As Long = MAX_ITEM) As String
  Dim tvi As TVITEM
  tvi.mask = TVIF_TEXT
  tvi.hItem = hItem
  tvi.pszText = String$(cbItem, 0)
  tvi.cchTextMax = cbItem
  If TreeView_GetItem(hwndTV, tvi) Then
    GetTVItemText = GetStrFromBufferA(tvi.pszText)
  End If
End Function

' Returns the string before first null char encountered (if any) from an ANSII string.

Public Function GetStrFromBufferA(sz As String) As String
  If InStr(sz, vbNullChar) Then
    GetStrFromBufferA = Left$(sz, InStr(sz, vbNullChar) - 1)
  Else
    ' If sz had no null char, the Left$ function
    ' above would return a zero length string ("").
    GetStrFromBufferA = sz
  End If
End Function

' If successful, returns the treeview item handle represented by
' the specified Node, returns 0 otherwise.

Public Function GetTVItemFromNode(hwndTV As Long, _
                                                            nod As Node) As Long
  Dim nodeCur As Node
  Dim asNodes() As String
  Dim nNodes As Integer
  Dim i As Integer
  Dim hitemParent As Long
  Dim hItem As Long
  
  Set nodeCur = nod
  
  ' Cache the node and all of it's parent node's text in the array
  Do While (nodeCur Is Nothing) = False
    nNodes = nNodes + 1
    ReDim Preserve asNodes(nNodes)
    asNodes(nNodes) = nodeCur.Text
    Set nodeCur = nodeCur.Parent
  Loop

  ' Get the hItem of the first root in the treeview, it will be the first parent
  hitemParent = TreeView_GetRoot(hwndTV)
  If hitemParent Then
    
    ' Walk through the cached node text from the root to the
    ' specified node (backwards throught the array).
    Do While nNodes
      ' Get the hItem of the current node
      hItem = FindTVItemFromText(hwndTV, hitemParent, asNodes(nNodes))
      If hItem Then
        ' Make the the current parent's first child item the new parent
        hitemParent = TreeView_GetChild(hwndTV, hItem)
      Else
        Exit Function
      End If
      nNodes = nNodes - 1
    Loop
  
    GetTVItemFromNode = hItem
    
  End If   ' hitemParent
  
End Function

' Returns the first encountered item handle whose text label
' matches the specified text. *Is case sensitive*.

'   hwndTV      - treeview's window handle
'   hitemChild   - first sibling item's handle in which to search
'   sItem          - specified item's text we're looking for.

' If the text represented by sItem is found, it's hItem is returned,
' otherwise 0 is returned.

Public Function FindTVItemFromText(hwndTV As Long, _
                                                           ByVal hitemChild As Long, _
                                                           sItem As String) As Long
  
  ' Can't find the hItem of an item with no text...
  If Len(sItem) = 0 Then Exit Function
    
  Do While hitemChild
    
    ' If the current slibling's item label matches our target text, we're done.
    If GetTVItemText(hwndTV, hitemChild, MAX_ITEM) = sItem Then
      FindTVItemFromText = hitemChild
      Exit Function
    End If
    
    ' Keep going while we have subsequent sibling items
    hitemChild = TreeView_GetNextSibling(hwndTV, hitemChild)
  
  Loop
  
End Function

' ===========================================================================
' Treeview macros defined in Commctrl.h

' Determines the location of the specified point relative to the client area of a tree-view control.
' Returns the handle to the tree-view item that occupies the specified point or NULL if no item
' occupies the point.

Public Function TreeView_HitTest(hwnd As Long, lpht As TVHITTESTINFO) As Long
  TreeView_HitTest = SendMessage(hwnd, TVM_HITTEST, ByVal 0, lpht)
End Function

' Retrieves some or all of a tree-view item's attributes.
' Returns TRUE if successful or FALSE otherwise.

Public Function TreeView_GetItem(hwnd As Long, pitem As TVITEM) As Boolean
  TreeView_GetItem = SendMessage(hwnd, TVM_GETITEM, 0, pitem)
End Function

' Sets some or all of a tree-view item's attributes.
' Old docs say returns zero if successful or - 1 otherwise.
' New docs say returns TRUE if successful, or FALSE otherwise

Public Function TreeView_SetItem(hwnd As Long, pitem As TVITEM) As Boolean
  TreeView_SetItem = SendMessage(hwnd, TVM_SETITEM, 0, pitem)
End Function

' Prepares the index of a state image so that a tree view control or list
' view control can use the index to retrieve the state image for an item.
' Rtns the one-based index of the state image shifted left twelve bits.
' A common control utility macro.

Public Function INDEXTOSTATEIMAGEMASK(iState As Long) As Long
' #define INDEXTOSTATEIMAGEMASK(i) ((i) << 12)
  INDEXTOSTATEIMAGEMASK = iState * (2 ^ 12)
End Function

' TreeView_GetNextItem

' Retrieves the tree-view item that bears the specified relationship to a specified item.
' Returns the handle to the item if successful or 0 otherwise.

Public Function TreeView_GetNextItem(hwnd As Long, hItem As Long, flag As Long) As Long
  TreeView_GetNextItem = SendMessage(hwnd, TVM_GETNEXTITEM, ByVal flag, ByVal hItem)
End Function

' Retrieves the first child item. The hitem parameter must be NULL.
' Returns the handle to the item if successful or 0 otherwise.

Public Function TreeView_GetChild(hwnd As Long, hItem As Long) As Long
  TreeView_GetChild = TreeView_GetNextItem(hwnd, hItem, TVGN_CHILD)
End Function

' Retrieves the next sibling item.
' Returns the handle to the item if successful or 0 otherwise.

Public Function TreeView_GetNextSibling(hwnd As Long, hItem As Long) As Long
  TreeView_GetNextSibling = TreeView_GetNextItem(hwnd, hItem, TVGN_NEXT)
End Function

' Retrieves the previous sibling item.
' Returns the handle to the item if successful or 0 otherwise.

Public Function TreeView_GetPrevSibling(hwnd As Long, hItem As Long) As Long
  TreeView_GetPrevSibling = TreeView_GetNextItem(hwnd, hItem, TVGN_PREVIOUS)
End Function

' Retrieves the parent of the specified item.
' Returns the handle to the item if successful or 0 otherwise.

Public Function TreeView_GetParent(hwnd As Long, hItem As Long) As Long
  TreeView_GetParent = TreeView_GetNextItem(hwnd, hItem, TVGN_PARENT)
End Function

' Retrieves the first visible item.
' Returns the handle to the item if successful or 0 otherwise.

Public Function TreeView_GetFirstVisible(hwnd As Long) As Long
  TreeView_GetFirstVisible = TreeView_GetNextItem(hwnd, 0, TVGN_FIRSTVISIBLE)
End Function

' Retrieves the next visible item that follows the specified item. The specified item must be visible.
' Use the TVM_GETITEMRECT message to determine whether an item is visible.
' Returns the handle to the item if successful or 0 otherwise.

Public Function TreeView_GetNextVisible(hwnd As Long, hItem As Long) As Long
  TreeView_GetNextVisible = TreeView_GetNextItem(hwnd, hItem, TVGN_NEXTVISIBLE)
End Function

' Retrieves the first visible item that precedes the specified item. The specified item must be visible.
' Use the TVM_GETITEMRECT message to determine whether an item is visible.
' Returns the handle to the item if successful or 0 otherwise.

Public Function TreeView_GetPrevVisible(hwnd As Long, hItem As Long) As Long
  TreeView_GetPrevVisible = TreeView_GetNextItem(hwnd, hItem, TVGN_PREVIOUSVISIBLE)
End Function

' Retrieves the currently selected item.
' Returns the handle to the item if successful or 0 otherwise.

Public Function TreeView_GetSelection(hwnd As Long) As Long
  TreeView_GetSelection = TreeView_GetNextItem(hwnd, 0, TVGN_CARET)
End Function

' Retrieves the item that is the target of a drag-and-drop operation.
' Returns the handle to the item if successful or 0 otherwise.

Public Function TreeView_GetDropHilight(hwnd As Long) As Long
  TreeView_GetDropHilight = TreeView_GetNextItem(hwnd, 0, TVGN_DROPHILITE)
End Function

' Retrieves the topmost or very first item of the tree-view control.
' Returns the handle to the item if successful or 0 otherwise.

Public Function TreeView_GetRoot(hwnd As Long) As Long
  TreeView_GetRoot = TreeView_GetNextItem(hwnd, 0, TVGN_ROOT)
End Function
