Attribute VB_Name = "modListeChaînée"
' modListeChaînée
' Gestion d'une liste chaînée en VB
' 28/1/98

Option Explicit

Public Type MyNode  ' This is the node info
    Parent As Long
    FirstChild As Long
    Prev As Long
    Next As Long
    Text As String
End Type

Public MyList() As MyNode  ' Array to hold the nodes

Private FirstFree As Long ' Index to the first available node
Private MyListCount As Long ' dimension of MyList

Public Function AddNode(Parent As Long, Text As String) As Long
    AddNode = AllocateNode
    With MyList(AddNode)
        .Parent = Parent    ' Set parent node index and text
        .Text = Text
        If .Parent Then       ' If this is not the root node...
            .Next = MyList(.Parent).FirstChild ' make this node the first child
            MyList(.Parent).FirstChild = AddNode
            If .Next Then ' If there is a sibling tell him about us
                MyList(.Next).Prev = AddNode
            End If
        End If
    End With
End Function

Public Function RemoveNode(index As Long)
    With MyList(index)
        Do Until .FirstChild = 0    ' Destroy our children :-(
            RemoveNode .FirstChild
        Loop
        If .Prev Then   ' If we are not the first child...
            MyList(.Prev).Next = .Next ' remove us from the link
        Else ' yes, we are the first child,
            If .Parent Then ' If we are not the root node...
                MyList(.Parent).FirstChild = .Next ' make the next sibling the first child
            End If
        End If
        If .Next Then 'if there is a next sibling...
            MyList(.Next).Prev = .Prev ' remove us from the link
        End If
    End With
    FreeNode index ' Make this node available
End Function

Public Function FreeNode(index As Long)
    MyList(index).Next = FirstFree ' link this node
    FirstFree = index ' Make the node available for reuse
End Function

Public Function AllocateNode() As Long
    If FirstFree = 0 Then ' If there are no free nodes then..
        MyListCount = MyListCount + 1 ' expand the array
        AllocateNode = MyListCount
        ReDim Preserve MyList(MyListCount)
    Else ' yes, there is an available node
        AllocateNode = FirstFree ' use it
        FirstFree = MyList(AllocateNode).Next ' make the next node the first available
    End If
    With MyList(AllocateNode) ' initialize the structure
        .FirstChild = 0
        .Prev = 0
        .Next = 0
        .Text = ""
    End With
End Function

