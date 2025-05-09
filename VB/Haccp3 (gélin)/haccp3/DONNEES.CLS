VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Donnees"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'classe de collection de donn�es
Private colDonn�es As New Collection

Public Function AddDonn�e(ByVal Titre As String, ByVal Commentaire As String, Optional Critique As Variant) As Donnee

Dim dNew As New Donnee

    If IsMissing(Critique) Then
        Critique = False
    End If
    
    With dNew
        .Titre = Titre
        .Commentaire = Commentaire
    End With
    On Error Resume Next
    colDonn�es.Add dNew
    Set AddDonn�e = dNew
    
End Function



Public Sub clear()
    While colDonn�es.Count
        colDonn�es.Remove 1
    Wend
End Sub

Public Function Count() As Long
    Count = colDonn�es.Count
End Function

Public Function Item(ByVal i As Variant) As Donnee
    Set Item = colDonn�es.Item(i)
End Function

Public Sub Delete(ByVal i As Variant)
    colDonn�es.Remove i
End Sub


Public Sub Save(ByVal stream As Object)

Dim i As Integer
Dim n As Integer
Dim chInfo As String

    chInfo = colDonn�es.Count
    n = Val(chInfo)
    stream.PutString chInfo, VarType(chInfo), False
    For i = 1 To n
        colDonn�es(i).Save stream
    Next
    stream.Flush STG_DEFAULT

End Sub


