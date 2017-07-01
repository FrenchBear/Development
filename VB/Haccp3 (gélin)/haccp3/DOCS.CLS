VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Documents"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'classe de collection de documents
Private colDocuments As New Collection

Public Function Copy() As Documents

Dim Copie As New Documents
Dim i As Integer

    For i = 1 To colDocuments.Count
        Copie.Add colDocuments.Item(i).Fichier, colDocuments.Item(i).Titre
    Next
    Set Copy = Copie
    
End Function

Public Sub clear()
    While colDocuments.Count
        colDocuments.Remove 1
    Wend
End Sub

Public Sub Save(ByVal stream As Object)

Dim i As Integer
Dim n As Integer
Dim chInfo As String

    chInfo = colDocuments.Count
    n = Val(chInfo)
    stream.PutString chInfo, VarType(chInfo), False
    For i = 1 To n
        colDocuments(i).Save stream
    Next
    stream.Flush STG_DEFAULT
    
End Sub

Public Sub Load(ByVal stream As Object)

Dim chInfo As String
Dim n As Integer
Dim NewDocument As Document
Dim i As Integer

    Me.clear
    stream.GetString chInfo
    n = Val(chInfo)
    For i = 1 To n
        Set NewDocument = New Document
        NewDocument.Load stream
        colDocuments.Add NewDocument   'ajoute à la collection
    Next

End Sub



Public Function Add(ByVal Fichier As String, ByVal Titre As String) As Document

Dim dNew As New Document

    With dNew
        .Titre = Titre
        .Fichier = Fichier
    End With
    On Error Resume Next
    colDocuments.Add dNew   'ajoute à la collection
    Set Add = dNew
    
End Function



Public Function Count() As Long
    Count = colDocuments.Count
End Function

Public Function Item(ByVal i As Integer) As Document
    Set Item = colDocuments.Item(i)
End Function

Public Sub Delete(ByVal i As Integer)
    colDocuments.Remove i
End Sub



