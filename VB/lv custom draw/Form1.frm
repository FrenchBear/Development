VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.2#0"; "Comctl32.ocx"
Begin VB.Form Form1 
   Caption         =   "VB ListView Custom Draw demo"
   ClientHeight    =   6150
   ClientLeft      =   2235
   ClientTop       =   2055
   ClientWidth     =   6630
   ClipControls    =   0   'False
   LinkTopic       =   "Form1"
   ScaleHeight     =   6150
   ScaleWidth      =   6630
   Begin ComctlLib.ListView ListView1 
      Height          =   3825
      Left            =   540
      TabIndex        =   1
      Top             =   480
      Width           =   5415
      _ExtentX        =   9551
      _ExtentY        =   6747
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   327680
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin ComctlLib.ImageList ImageList2 
      Left            =   4500
      Top             =   5100
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   327680
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   3480
      Top             =   5130
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   327680
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   375
      Index           =   0
      Left            =   900
      TabIndex        =   0
      Top             =   5100
      Width           =   1455
   End
   Begin VB.Menu mnuView 
      Caption         =   "&View"
      Begin VB.Menu mnuViewLargeIcons 
         Caption         =   "Lar&ge Icons"
      End
      Begin VB.Menu mnuViewSmallIcons 
         Caption         =   "S&mall Icons"
      End
      Begin VB.Menu mnuViewList 
         Caption         =   "&List"
      End
      Begin VB.Menu mnuViewReport 
         Caption         =   "&Detatils"
      End
   End
   Begin VB.Menu mnuCD 
      Caption         =   "&Custom Draw"
      Begin VB.Menu mnuCDNewDraw 
         Caption         =   "&New Draw"
      End
      Begin VB.Menu mnuCDOff 
         Caption         =   "&Off"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'
' Brad Martinez http://www.mvps.org
'
' Demonstrates how to do Custom Draw with the VB ListView.
'
' ========================================================
' This project uses subclassing, and utilizes the services of the "Debug
' Object for AddressOf Subclassing" ActiveX server, Dbgwproc.dll, which
' allows unencumbered code execution when stepping through code in
' the VB IDE. This server is freely distributable and can be obtained from
' Microsoft at http://msdn.microsoft.com/vbasic/downloads/controls.asp.

' Set the conditional compilation argument:   DEBUGWINDOWPROC = 1
' in the project properties dialog/Make tab to enable the server's services.
' ========================================================
'
Private m_hwndLV As Long   ' ListView1.hWnd
'

Private Sub Form_Load()
  Dim dwStyle As Long
  Dim i As Long
  Dim item As ListItem
  
  ' Set the Form's ScaleMode to pixels for column resizing in Form_Resize
  ScaleMode = vbPixels
  
  ' Load up the global color array with the 16 basic colors
  For i = 0 To 15: g_crl16(i) = QBColor(i): Next
  
  ' Load up the IFont array with a bunch of fonts of different styles.
  Label1(0).Visible = False
  For i = 0 To 15
    With Label1(i).Font
      .Name = Screen.Fonts(i)
      .Size = 10
      .Bold = (i Mod 3) = 0
      .Italic = ((i + 1) Mod 3) = 0
      .Underline = ((i + 2) Mod 3) = 0
'Debug.Print .Bold; .Italic; .Underline
    End With
    
    Set g_IFonts(i) = Label1(i).Font
    Load Label1(i + 1)
  Next
  
  ' Initialize the ImageLists
  With ImageList1
    .ImageHeight = 32
    .ImageWidth = 32
    .ListImages.Add Picture:=Icon
  End With
  
  With ImageList2
    .ImageHeight = 16
    .ImageWidth = 16
    .ListImages.Add Picture:=Icon
  End With
  
  ' Initialize the ListView
  With ListView1
    .Font.Size = 10
    .Icons = ImageList1
    .SmallIcons = ImageList2
    .MultiSelect = True
    m_hwndLV = .hWnd
    
    For i = 1 To 4
      .ColumnHeaders.Add Text:="column" & i
    Next
    
    For i = 0 To &H3F
      Set item = .ListItems.Add(, , "item" & i, 1, 1)
      item.SubItems(1) = i * 10
      item.SubItems(2) = i * 100
      item.SubItems(3) = i * 1000
    Next
  End With
  
  mnuViewReport_Click

  ' Subclass the Form so we can process the NM_CUSTOMDRAW
  ' notification message sent from the ListView.
  Call SubClass(hWnd, AddressOf WndProc)
  
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Call UnSubClass(hWnd)
  Erase g_crl16
  Erase g_IFonts
End Sub

Private Sub Form_Resize()
  Static rc As RECT
  Static cxPrev As Long
  
  ' If we don't turn the ListView's painting of while resizing columns,
  ' the ListView will generate unnecessary NM_CUSTOMDRAW
  ' messages that slows the resizing down dramatically.
  Call SendMessage(m_hwndLV, WM_SETREDRAW, 0, 0)
  
  ' Size the lListView
  Call MoveWindow(m_hwndLV, 0, 0, ScaleWidth, ScaleHeight, CTrue)
  
  ' Resize the columns only if the ListView's width has changed.
  Call GetClientRect(m_hwndLV, rc)
  If (cxPrev <> rc.Right) Then
    
    ' Save the ListView's previous width.
    cxPrev = rc.Right
    
    ' See: "FIX: Problem with ListView's ColumnHeader Width Property"
    ' http://support.microsoft.com/support/kb/articles/q179/9/88.asp
    ' and: "HOWTO: Set the Column Width of Columns in a ListView Control"
    ' http://support.microsoft.com/support/kb/articles/q147/6/66.asp
    Call ListView_SetColumnWidth(m_hwndLV, 0, rc.Right \ 4)
    Call ListView_SetColumnWidth(m_hwndLV, 1, rc.Right \ 4)
    Call ListView_SetColumnWidth(m_hwndLV, 2, rc.Right \ 4)
    Call ListView_SetColumnWidth(m_hwndLV, 3, rc.Right - ((rc.Right \ 4) * 3))
    
    ' Now tell the ListView to generate a NM_CUSTOMDRAW
    ' for all items after painting is turned back on.
    Call InvalidateRect(m_hwndLV, ByVal 0&, CFalse)
  End If
  
  Call SendMessage(m_hwndLV, WM_SETREDRAW, 1, 0)
  
End Sub

Private Sub mnuCDNewDraw_Click()
  g_fNewDraw = Not g_fNewDraw
  ListView1.Refresh
End Sub

Private Sub mnuCDOff_Click()
  mnuCDOff.Checked = Not mnuCDOff.Checked
  If mnuCDOff.Checked Then
    Call UnSubClass(hWnd)
  Else
    Call SubClass(hWnd, AddressOf WndProc)
  End If
  ListView1.Refresh
End Sub

' ==========================================
' View menu

Private Sub mnuViewLargeIcons_Click()
  Call SwitchView(lvwIcon)
End Sub

Private Sub mnuViewSmallIcons_Click()
  Call SwitchView(lvwSmallIcon)
End Sub

Private Sub mnuViewList_Click()
  Call SwitchView(lvwList)
End Sub

Private Sub mnuViewReport_Click()
  Call SwitchView(lvwReport)
End Sub

Private Sub SwitchView(dwNewView As ListViewConstants)
  
  ListView1.View = dwNewView
  ' A bug: http://support.microsoft.com/support/kb/articles/q143/4/06.asp
  ListView1.Arrange = lvwAutoTop
  
  mnuViewLargeIcons.Checked = (dwNewView = lvwIcon)
  mnuViewSmallIcons.Checked = (dwNewView = lvwSmallIcon)
  mnuViewList.Checked = (dwNewView = lvwList)
  mnuViewReport.Checked = (dwNewView = lvwReport)

End Sub
