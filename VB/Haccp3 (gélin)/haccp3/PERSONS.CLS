VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Personnes"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'classe de collection de personnes
Private colPersons As New Collection

Public Function Copy() As Personnes

Dim Copie As New Personnes
Dim i As Integer

    For i = 1 To colPersons.Count
        Copie.Add colPersons.Item(i).Nom, colPersons.Item(i).Fonction
    Next
    Set Copy = Copie
    
End Function
Public Function Add(ByVal Nom As String, ByVal Fonction As String) As Personne

Dim pNew As New Personne

    With pNew
        .Nom = Nom
        .Fonction = Fonction
    End With
    colPersons.Add pNew 'ajoute à la collection
    Set Add = pNew
    
End Function





Public Sub clear()
    While colPersons.Count
        colPersons.Remove 1
    Wend
End Sub

Public Function Count() As Long
    Count = colPersons.Count
End Function

Public Function Item(ByVal i As Integer) As Personne
    Set Item = colPersons.Item(i)
End Function

Public Sub Delete(ByVal i As Integer)
    colPersons.Remove i
End Sub



Public Sub Load(ByVal stream As Object)

Dim chInfo As String
Dim n As Integer
Dim NewPersonne As Personne
Dim i As Integer

    Me.clear
    stream.GetString chInfo
    n = Val(chInfo)
    For i = 1 To n
        Set NewPersonne = New Personne
        NewPersonne.Load stream
        colPersons.Add NewPersonne
    Next

End Sub

Public Sub Save(ByVal stream As Object)

Dim chInfo As String
Dim n As Integer
Dim i As Integer
    
    n = Me.Count
    chInfo = n
    stream.PutString chInfo, VarType(chInfo), False
    For i = 1 To n
        colPersons(i).Save stream
    Next
    stream.Flush STG_DEFAULT

End Sub


