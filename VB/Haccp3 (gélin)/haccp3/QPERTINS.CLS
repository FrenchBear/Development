VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "QuestPertinences"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'classe de collection de questions pour le questionnaire de pertinence du danger
Private colQuestions As New Collection

Public Function Add(ByVal Id As String, ByVal Question As String, ByVal RéponseOui As String, ByVal RéponseNon As String) As QuestPertinence

Dim qNew As New QuestPertinence

    With qNew
        .Id = Id
        .Question = Question
        .RéponseOui = RéponseOui
        .RéponseNon = RéponseNon
    End With
    On Error Resume Next
    colQuestions.Add qNew, Id
    If Err Then
        If Err = 457 Then
            MsgBox "Cette identificateur de question existe déjà. Choisissez-en un autre.", MB_ICONEXCLAMATION, NomApplication
        Else
            ErreurSystemeBox Error$, MB_ICONEXCLAMATION, "QuestPertinences|Add"
        End If
        On Error GoTo 0
        Exit Function
    End If
    On Error GoTo 0
    Set Add = qNew
    
End Function



Public Function Count() As Long
    Count = colQuestions.Count
End Function

Public Function Item(ByVal Id As Variant) As QuestPertinence
    Set Item = colQuestions.Item(Id)
End Function

Public Sub Delete(ByVal Id As String)
    colQuestions.Remove Id
End Sub



