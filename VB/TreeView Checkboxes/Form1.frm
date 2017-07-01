VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.2#0"; "COMCTL32.OCX"
Begin VB.Form Form1 
   Caption         =   "TV checkboxes demo"
   ClientHeight    =   5055
   ClientLeft      =   2190
   ClientTop       =   2805
   ClientWidth     =   7635
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   5055
   ScaleWidth      =   7635
   Begin VB.CommandButton cmdCheckedNodes 
      Caption         =   "Show checked Nodes"
      Height          =   405
      Left            =   4080
      TabIndex        =   6
      Top             =   2070
      Width           =   2100
   End
   Begin VB.ListBox List1 
      Height          =   2205
      Left            =   4080
      TabIndex        =   7
      Top             =   2520
      Width           =   3135
   End
   Begin VB.CommandButton cmdUncheckChildren 
      Caption         =   "Uncheck children"
      Height          =   405
      Left            =   5700
      TabIndex        =   5
      Top             =   1470
      Width           =   1500
   End
   Begin VB.CommandButton cmdCheckChildren 
      Caption         =   "Check children"
      Height          =   405
      Left            =   4080
      TabIndex        =   4
      Top             =   1470
      Width           =   1500
   End
   Begin VB.OptionButton optNodeClick 
      Caption         =   "User TreeView NodeClick event"
      Height          =   315
      Left            =   4020
      TabIndex        =   2
      Top             =   660
      Value           =   -1  'True
      Width           =   2955
   End
   Begin VB.OptionButton optMouseUp 
      Caption         =   "User TreeView MouseUp event"
      Height          =   315
      Left            =   4020
      TabIndex        =   3
      Top             =   1050
      Width           =   2955
   End
   Begin ComctlLib.TreeView TreeView1 
      Height          =   4395
      Left            =   420
      TabIndex        =   0
      Top             =   330
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   7752
      _Version        =   327682
      Indentation     =   353
      Style           =   7
      ImageList       =   "ImageList1"
      Appearance      =   1
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   270
      Left            =   4020
      TabIndex        =   1
      Top             =   360
      Width           =   3105
   End
   Begin ComctlLib.ImageList ImageList1 
      Left            =   7020
      Top             =   150
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   3
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Form1.frx":0000
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Form1.frx":031A
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "Form1.frx":0634
            Key             =   ""
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' Demonstrates how to add treeview checkboxes, and how to both
' set and retrieve a specific node's check state through code.
'
' Brad Martinez, http://www.mvps.org/ccrp/
'

Private m_hwndTV As Long
'

Private Sub Form_Load()
  Dim Node1 As Node
  Dim Node2 As Node
  Dim Node3 As Node
  Dim i As Integer
  Dim j As Integer
  Dim k As Integer
  
  ' For some convenience...
  TreeView1.HideSelection = False
  TreeView1.LabelEdit = tvwManual
  TreeView1.LineStyle = tvwRootLines
  m_hwndTV = TreeView1.hwnd
  
  ' Tell the treeview to use checkboxes.
  AddTVCheckboxes
  
  ' Fill up the treeview...
  For i = 1 To 3
    Set Node1 = TreeView1.Nodes.Add(, tvwLast, , "Root" & i, 1)
    For j = 1 To 4
      Set Node2 = TreeView1.Nodes.Add(Node1.Index, tvwChild, , "Root" & i & "Child" & j, 2)
      For k = 1 To 4
        Set Node3 = TreeView1.Nodes.Add(Node2.Index, tvwChild, , "GrandChild" & (16 * (i - 1)) + (4 * (j - 1)) + k, 3)
      Next
    Next
  
    Node1.Expanded = True
  Next
  
  ' Set Label1 with the first root Node's text and check state
  ' (a NodeClick event is not generated even though the first
  ' node in the TV is selected when the TV first appears).
  Call ShowSelectedNode(TreeView1.Nodes(1), False)
  
  ' Show the nodes that are checked.
  Call cmdCheckedNodes_Click
  
End Sub

Private Function AddTVCheckboxes() As Boolean
  Dim dwStyle As Long
  dwStyle = GetWindowLong(m_hwndTV, GWL_STYLE)
  If dwStyle Then
    AddTVCheckboxes = CBool(SetWindowLong(m_hwndTV, _
                                                                            GWL_STYLE, _
                                                                            dwStyle Or TVS_CHECKBOXES))
  End If
End Function

Private Sub ShowSelectedNode(sNode As String, fIsChecked As Boolean)
  If fIsChecked Then
    Label1 = sNode & " is checked"
  Else
    Label1 = sNode & " is unchecked"
  End If
End Sub

' The only way to determine if a Node is checked or not is by sending the
' treeview a TVM_GETITEM message and retrieving the Node's checked
' state. In order to send this message, we must have the treeview item handle
' of the Node. The easiest way to obtain the Node's item handle is by sending
' the treeview a TVM_HITTEST message with the coordinates of the mouse
' when the left button is released.

Private Sub TreeView1_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  Dim nodeSel As Node
  Dim fChecked As Boolean
  
  If optMouseUp Then
    If Button = vbLeftButton Then
        
      ' Get the left clicked node
      Set nodeSel = TreeView1.HitTest(x, y)
      If (nodeSel Is Nothing) = False Then
            
        fChecked = IsTVItemCheckedFromClick(m_hwndTV, _
                                                                        x / Screen.TwipsPerPixelX, _
                                                                        y / Screen.TwipsPerPixelY)
        
        Call ShowSelectedNode(nodeSel.Text, fChecked)
            
      End If   ' (nodeSel Is Nothing) = False
    End If   ' Button = vbLeftButton
  End If   ' optMouseUp

End Sub

' We could do things a bit differently here and obtain the treeview item
' handle of the Node with the GetTVItemFromNode call, and pass the
' handle directly to the IsTVItemChecked proc. But since we don't
' determine if this event was invoked due to a checkbox click (toggling
' the Node's checkbox state), IsTVItemChecked will not return an accuate
' value.

Private Sub TreeView1_NodeClick(ByVal Node As ComctlLib.Node)
  Dim fChecked As Boolean
  Dim hItem As Long
  Dim pt As POINTAPI
  
  If optNodeClick Then
    ' If this event was invoked from a left mouse button click
    ' (if the left mouse button was depressed when the NM_CLICK
    ' message was received by the treeview's parent window).
    If GetAsyncKeyState(vbKeyLButton) Then
      
' *** This will produce inaccurate results if the checkbox was clicked ***
'      hItem = GetTVItemFromNode(m_hwndTV, Node)
'      If hItem Then
'        fChecked = IsTVItemChecked(m_hwndTV, hItem)
'        Call ShowSelectedNode(Node.Text, fChecked)
'      End If
      
      ' Get the current cursor pos in screen coords, convert
      ' it to trevview coords, and get the check state.
      Call GetCursorPos(pt)
      Call ScreenToClient(m_hwndTV, pt)
      fChecked = IsTVItemCheckedFromClick(m_hwndTV, pt.x, pt.y)

      Call ShowSelectedNode(Node.Text, fChecked)
    
    End If   ' GetAsyncKeyState
  End If   ' optNodeClick
  
End Sub

Private Sub cmdCheckChildren_Click()
  Call SetCheckboxesOfNodeChildren(TreeView1.SelectedItem, True)
End Sub

Private Sub cmdUncheckChildren_Click()
  Call SetCheckboxesOfNodeChildren(TreeView1.SelectedItem, False)
End Sub
  
' Recurses through the specified parent node's children nodes,
' setting each node's checkbox state per the fCheck flag.

Private Sub SetCheckboxesOfNodeChildren(nodeParent As Node, _
                                                                      fCheck As Boolean)
  Dim nodeChild As Node
  Dim hItem As Long
    
  ' Get the parent node's first child node.
  Set nodeChild = nodeParent.Child
  
  ' Keep going while we have a child node.
  Do While (nodeChild Is Nothing) = False
    
    ' Get the hItem of the current child node and set it's checkbox state.
    hItem = GetTVItemFromNode(m_hwndTV, nodeChild)
    If hItem Then
      Call SetTVItemCheckImage(m_hwndTV, hItem, fCheck)
    End If
    
    ' If the current child node has child nodes of it's own, call this proc again
    ' recursively, making the current child node the new parent node.
    If (nodeChild.Child Is Nothing) = False Then
      Call SetCheckboxesOfNodeChildren(nodeChild, fCheck)
    End If
    
    ' Get the current child node's next sibling.
    Set nodeChild = nodeChild.Next
  Loop

End Sub

' Adds the text of each checked node in the treeview to List1.

' List1 can just as easily be loaded with all of the treeview's
' checked nodes directly in LoadCheckedNodes, but we'll do
' a little more work and load a collection instead, allowing
' each individual checked node to be operated on as needed...

Private Sub cmdCheckedNodes_Click()
  Dim colCheckedNodes As New Collection
  Dim nodeChecked As Node
  
  List1.Clear
  DoEvents
  MousePointer = 11
  
  ' Clear the collection
  Set colCheckedNodes = Nothing
 
  ' Load the collection with all of the checked nodes in the treeview.
  Call LoadCheckedNodes(TreeView1.Nodes(1), colCheckedNodes)
  
  ' Add the text of each checked node to the listbox.
  If colCheckedNodes.Count Then
    For Each nodeChecked In colCheckedNodes
      List1.AddItem nodeChecked.Text
    Next
  Else
    List1.AddItem "<no nodes are checked>"
  End If
  
  MousePointer = 0

End Sub
  
' Recursively loads the specified collection with the specifed checked
' node, all of it's checked siblings, and all checked children of the siblings.

Private Sub LoadCheckedNodes(nodeSibling As Node, _
                                                     colCheckedNodes As Collection)
  Dim hItem As Long
    
  ' Keep going while we have a sibling node.
  Do While (nodeSibling Is Nothing) = False
    
    ' Get the hItem of the current sibling node and add the node
    ' to the listbox if the node is checked.
    hItem = GetTVItemFromNode(m_hwndTV, nodeSibling)
    If hItem Then
      If IsTVItemChecked(m_hwndTV, hItem) Then
        colCheckedNodes.Add nodeSibling
      End If
    End If
    
    ' If the current sibling node has child nodes of it's own, call this
    ' proc again recursively, making the first child of the current
    ' sibling node the new first sibling node.
    If (nodeSibling.Child Is Nothing) = False Then
      Call LoadCheckedNodes(nodeSibling.Child, colCheckedNodes)
    End If
    
    ' Get the current sibling node's next sibling
    Set nodeSibling = nodeSibling.Next
  Loop

End Sub
