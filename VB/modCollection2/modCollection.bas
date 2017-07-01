Attribute VB_Name = "modCollection"
' modCollection
' getCollectionOfKeys returns a collection contaning keys of a given VBA Collection
' 2006-02-16    FPVI    First Version
' 2006-09-21    FPVI    Return a collection rather than an array for a better intergration in eLIMS Framework
'
' From http://groups.google.com/group/microsoft.public.vb.general.discussion/msg/9c1848641a464adf

Option Explicit

Type CollectionData
   Unk0(0 To 2) As Long
   Unk1 As Long
   ElementCount As Long
   Unk2 As Long
   PtrFirstElement As Long
   PtrLastElement As Long
   Unk3 As Long
   Unk4 As Long
   Unk5 As Long
End Type

Type CollectionElement
   Data As Variant
   Key As Long
   PtrPrev As Long
   PtrNext As Long
   Unk0 As Long
   Unk1 As Long
   Unk2 As Long
End Type

Private Declare Sub MoveMemory Lib "kernel32" Alias "RtlMoveMemory" (A As Any, B As Any, ByVal C As Long)
Private Declare Function lstrlenW Lib "kernel32" (ByVal lpString As Any) As Long

' Returns a collection contaning keys of a given VBA Collection
Public Function getCollectionOfKeys(ByVal Col As Collection) As Collection
Attribute getCollectionOfKeys.VB_Description = "Returns a collection contaning keys of a given VBA Collection"
    Dim lIdx As Long
    Dim tColl As CollectionData
    Dim tColElem As CollectionElement
    Dim colKeys As Collection

    Set colKeys = New Collection
    If Col.Count > 0 Then
        MoveMemory tColl, ByVal ObjPtr(Col), LenB(tColl)                    ' Get the collection data
        tColElem.PtrNext = tColl.PtrFirstElement                            ' Get the pointer to the first element
        For lIdx = 1 To tColl.ElementCount
            MoveMemory tColElem, ByVal tColElem.PtrNext, LenB(tColElem)     ' Get the item data
            colKeys.Add pvPtr2Str(tColElem.Key)                          ' Copy the key to the array
        Next
    End If
    
    Set getCollectionOfKeys = colKeys
End Function

Private Function pvPtr2Str(lpszA As Long) As String
   pvPtr2Str = String$(lstrlenW(lpszA), 0)
   MoveMemory ByVal StrPtr(pvPtr2Str), ByVal lpszA, lstrlenW(lpszA) * 2
End Function

