Attribute VB_Name = "mCustomDraw_472"
'
' Brad Martinez http://www.mvps.org
'
' Set the following conditional compilation constant accordingly in the
' Make tab of the project Properties dialog box:
'
'  WIN32_IE < 768   (&H300, or not defined): don't use custom draw
'  WIN32_IE = 768   (&H300): include only the IE3 definitions of custom draw
'  WIN32_IE = 1024 (&H400)  include both the IE3 and IE4 definitions of custom draw

#If (WIN32_IE >= &H300) Then   ' or 768, (defined for the whole mod)

Option Explicit

Private Type RECT   ' rct
  Left As Long
  Top As Long
  Right As Long
  Bottom As Long
End Type

' ==================================================================
' NM_CUSTOMDRAW notification message

' The header, listview, rebar, toolbar, tooltip, trackbar, treeview common controls send
' the NM_CUSTOMDRAW notification message to notify their parent windows about
' drawing operations. This notificaiton is sent in the form of a WM_NOTIFY message:

Public Const NM_FIRST = -0&                ' (0U-  0U)       '  generic to all controls
Public Const NM_CUSTOMDRAW = (NM_FIRST - 12)

' The value your application can return depends on the current drawing stage. The
' dwDrawStage member of the associated NMCUSTOMDRAW structure holds a
' value that specifies the drawing stage. You must return one of the following values.

Public Enum CD_ReturnFlags

  ' -------------------------------------------------------------------------------------
  ' When dwDrawStage equals CDDS_PREPAINT:

  ' The control will draw itself. It will not send any additional NM_CUSTOMDRAW
  ' messages for this paint cycle.
  CDRF_DODEFAULT = &H0

  ' The control will notify the parent after painting an item.
  CDRF_NOTIFYPOSTPAINT = &H10

  ' The control will notify the parent of any item-related drawing operations. It will send
  ' NM_CUSTOMDRAW notification messages before and after drawing items.
  CDRF_NOTIFYITEMDRAW = &H20

  ' The control will notify the parent after erasing an item.
  CDRF_NOTIFYPOSTERASE = &H40

  ' The control will notify the parent when an item will be erased. It will send
  ' NM_CUSTOMDRAW notification messages before and after erasing items.
  ' no longer supported???!!!
  CDRF_NOTIFYITEMERASE = &H80

  ' -------------------------------------------------------------------------------------
  ' When dwDrawStage equals CDDS_ITEMPREPAINT:
  
  ' Your application specified a new font for the item; the control will use the new font.
  CDRF_NEWFONT = &H2

  ' Your application drew the item manually. The control will not draw the item.
  CDRF_SKIPDEFAULT = &H4

#If (WIN32_IE >= &H400) Then
  ' The control will notify the parent when a list view subitem is being drawn.
  ' (same as CDRF_NOTIFYITEMDRAW, we can distinguish by context)
  CDRF_NOTIFYSUBITEMDRAW = &H20
#End If

End Enum   ' CD_ReturnFlags

' ==================================================================
' NMCUSTOMDRAW structure

' Used directly by the rebar, trackbar, header and IE3 toolbar controls.
' The tooltip, listview, treeview and IE4 toolbar indirectly use this structure
' as the first member of their own control specific CustomDraw structures.

Public Type NMCUSTOMDRAW   ' nmcd
  ' An NMHDR structure that contains information about this notification message.
  hdr As NMHDR
  
  ' Specifies the current drawing stage. This value is one of the values below:
  dwDrawStage As CD_DrawStage
  
  ' The handle to the control's device context. Use this HDC to perform any GDI functions.
  hdc As Long
  
  ' A RECT structure that describes the bounding rectangle of the area being drawn.
  rc As RECT
  
  ' The item number. This value is control specific, using the item-referencing
  ' convention for that control. Additionally, trackbar controls use the values below
  ' to identify portions of control.
  dwItemSpec As Long
  
  ' Specifies the current item state. This value is a combination of the flags below.
  uItemState As CD_ItemState
  
  ' Application-defined item data.
  lItemlParam As Long
     
End Type
    
' -------------------------------------------------------------------------------------
'  NMCUSTOMDRAW.dwDrawStage flags:

Public Enum CD_DrawStage

  '  Values under &H10000 are reserved for Global Drawstage Values.
  
  ' Before the painting cycle begins
  CDDS_PREPAINT = &H1

  ' After the painting cycle is complete
  CDDS_POSTPAINT = &H2

  ' Before the erasing cycle begins
  CDDS_PREERASE = &H3

  ' After the erasing cycle is complete
  CDDS_POSTERASE = &H4

  ' The &H10000 bit means it's an Item-Specific Drawstage Value
  
  ' Indicates that the dwItemSpec, uItemState, and lItemParam members are valid.
  CDDS_ITEM = &H10000

  ' Before an item is drawn
  CDDS_ITEMPREPAINT = (CDDS_ITEM Or CDDS_PREPAINT)

  ' After an item has been drawn
  CDDS_ITEMPOSTPAINT = (CDDS_ITEM Or CDDS_POSTPAINT)

  ' Before an item is erased
  CDDS_ITEMPREERASE = (CDDS_ITEM Or CDDS_PREERASE)

  ' After an item has been erased
  CDDS_ITEMPOSTERASE = (CDDS_ITEM Or CDDS_POSTERASE)

#If (WIN32_IE >= &H400) Then
  ' Flag combined with CDDS_ITEMPREPAINT or CDDS_ITEMPOSTPAINT if a
  ' subitem is being drawn. This will only be set if CDRF_NOTIFYSUBITEMDRAW
  ' is returned from CDDS_PREPAINT.
  CDDS_SUBITEM = &H20000
#End If

End Enum   ' CD_DrawStage

' -------------------------------------------------------------------------------------
' NMCUSTOMDRAW.itemState flags:

Public Enum CD_ItemState
  CDIS_SELECTED = &H1    ' The item is selected.
  CDIS_GRAYED = &H2        ' The item is grayed.
  CDIS_DISABLED = &H4     ' The item is disabled.
  CDIS_CHECKED = &H8      ' The item is checked.
  CDIS_FOCUS = &H10         ' The item is in focus.
  CDIS_DEFAULT = &H20     ' The item is in its default state.
  CDIS_HOT = &H40              ' The item is currently under the pointer ("hot").
  CDIS_MARKED = &H80      ' The item is marked. The meaning of this is up to the implementation.
  CDIS_INDETERMINATE = &H100   ' The item is in an indeterminate state.
End Enum

' ==================================================================
' Tooltip

Public Type NMTTCUSTOMDRAW
  
  ' NMCUSTOMDRAW structure that contains general Custom Draw information.
  nmcd As NMCUSTOMDRAW
  
  ' UINT value specifying how ToolTip text will be formatted when it is displayed.
  ' This value is passed to the DrawText function internally. All values for the
  ' uFormat parameter of DrawText are valid.
  uDrawFlags As Long

End Type

' ==================================================================
' Listview

Public Type NMLVCUSTOMDRAW
  
  ' NMCUSTOMDRAW structure that contains general Custom Draw information.
  nmcd As NMCUSTOMDRAW
  
  ' A COLORREF value representing the color that will be used to display text
  ' foreground in the list view control.
  clrText As Long
  
  ' A COLORREF value representing the color that will be used to display text
  ' background in the list view control.
  clrTextBk As Long

#If (WIN32_IE >= &H400) Then
  ' Index of the subitem that is being drawn. If the main item is being drawn,
  ' this member will be zero.
  iSubItem As Long
#End If

End Type

' ==================================================================
' Treeview

Public Type NMTVCUSTOMDRAW
  
  ' NMCUSTOMDRAW structure that contains general Custom Draw information.
  nmcd As NMCUSTOMDRAW
  
  ' A COLORREF value representing the color that will be used to display text
  ' foreground in the tree view control.
  clrText As Long
  
  ' A COLORREF value representing the color that will be used to display text
  ' background in the tree view control.
  clrTextBk As Long

#If (WIN32_IE >= &H400) Then
  ' Zero-based level of the item being drawn. The root item is at level zero, a child
  ' of the root item is at level one, and so on.
  iLevel As Long
#End If

End Type

' ==================================================================
' Trackbar

'  NMCUSTOMDRAW.dwItemSpec flags:

' Identifies the increment tic marks that appear along the edge of the trackbar control.
Public Const TBCD_TICS = &H1

' Identifies the trackbar control's thumb marker. This is the portion of the control that
' the user moves.
Public Const TBCD_THUMB = &H2

' Identifies the channel that the trackbar control's thumb marker slides along.
Public Const TBCD_CHANNEL = &H3

' ==================================================================
' Toolbar

#If (WIN32_IE >= &H400) Then

Public Type NMTBCUSTOMDRAW
  nmcd As NMCUSTOMDRAW
  hbrMonoDither As Long
  hbrLines As Long                ' For drawing lines on buttons
  hpenLines As Long             ' For drawing lines on buttons

  clrText As Long                  ' Color of text
  clrMark As Long                 ' Color of text bk when marked. (only if TBSTATE_MARKED)
  clrTextHighlight As Long    ' Color of text when highlighted
  clrBtnFace As Long            ' Background of the button
  clrBtnHighlight As Long      ' 3D highlight
  clrHighlightHotTrack As Long  ' In conjunction with fHighlightHotTrack will cause button to highlight like a menu
  rcText As RECT                       ' Rect for text

  nStringBkMode As Long
  nHLStringBkMode As Long
End Type

'  Toolbar custom draw return flags
Public Const TBCDRF_NOEDGES = &H10000                    ' Don't draw button edges
Public Const TBCDRF_HILITEHOTTRACK = &H20000       ' Use color of the button bk when hottracked
Public Const TBCDRF_NOOFFSET = &H40000                   ' Don't offset button if pressed
Public Const TBCDRF_NOMARK = &H80000                       ' Don't draw default highlight of image/text for TBSTATE_MARKED
Public Const TBCDRF_NOETCHEDEFFECT = &H100000   ' Don't draw etched effect for disabled items
'
#End If  ' (WIN32_IE >= &H400)   ' (Toolbar)
'
#End If   ' (WIN32_IE >= &H300)   ' (from top of mod)
