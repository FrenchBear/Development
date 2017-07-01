VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Donnees"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'classe de collection de données
Private colDonnées As New Collection

Public Function AddDonnée(ByVal Titre As String, ByVal Commentaire As String, Optional Critique As Variant) As Donnee

Dim dNew As New Donnee

    If IsMissing(Critique) Then
        Critique = False
    End If
    
    With dNew
        .Titre = Titre
        .Commentaire = Commentaire
    End With
    On Error Resume Next
    colDonnées.Add dNew
    Set AddDonnée = dNew
    
End Function



Public Sub clear()
    While colDonnées.Count
        colDonnées.Remove 1
    Wend
End Sub

Public Function Count() As Long
    Count = colDonnées.Count
End Function

Public Function Item(ByVal i As Variant) As Donnee
    Set Item = colDonnées.Item(i)
End Function

Public Sub Delete(ByVal i As Variant)
    colDonnées.Remove i
End Sub


Public Sub Save(ByVal stream As Object)

Dim i As Integer
Dim n As Integer
Dim chInfo As String

    chInfo = colDonnées.Count
    n = Val(chInfo)
    stream.PutString chInfo, VarType(chInfo), False
    For i = 1 To n
        colDonnées(i).Save stream
    Next
    stream.Flush STG_DEFAULT

End Sub


