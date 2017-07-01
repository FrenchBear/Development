VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "Suggestions"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit

'classe de collection de suggestions
Private colSuggestions As New Collection

Public Function Add(ByVal Libellé As String, ByVal Description As String, ByVal Index As Long, ByVal Ajoutée As Integer, ByVal Effacée As Integer, ByVal Remplacée As Integer) As Suggestion

Dim suggNew As New Suggestion

    With suggNew
        .Libellé = Libellé
        .Description = Description
        .Ajoutée = Ajoutée
        .Effacée = Effacée
        .Remplacée = Remplacée
    End With
    If colSuggestions.Count = 0 Then
        colSuggestions.Add suggNew
    ElseIf colSuggestions.Count < Index Then
        colSuggestions.Add suggNew, After:=colSuggestions.Count
    Else
        colSuggestions.Add suggNew, before:=Index
    End If
    Set Add = suggNew
    
End Function


Public Function Replace(ByVal Libellé As String, ByVal Description As String, ByVal Index As Long, ByVal Ajoutée As Integer, ByVal Effacée As Integer, ByVal Remplacée As Integer)

Dim Suggestion As Suggestion
    
    Set Suggestion = colSuggestions.Item(Index)
    If Not Suggestion.Remplacée Then
        Suggestion.OldLibellé = Suggestion.Libellé
        Suggestion.OldDescription = Suggestion.Description
    End If
    Suggestion.Libellé = Libellé
    Suggestion.Description = Description
    Suggestion.Remplacée = Remplacée
    
End Function
Public Function Count() As Long
    Count = colSuggestions.Count
End Function


Public Sub Delete(ByVal Index As Long, ByVal AppelDepuisHacMod As Integer)
    
    If Not AppelDepuisHacMod Then
        'effacement depuis HACCP
        If colSuggestions.Item(Index).Ajoutée Then
            'les suggestions ajoutée depuis HACCP sont effacées
            colSuggestions.Remove Index
        Else
            'les suggestions d'orginie sont marquées effacées
            colSuggestions.Item(Index).Effacée = True
        End If
    Else
        'effacement depuis le gestionnaire de module: on efface aussi bien les
        'suggestions d'origine que celles ajoutées depuis le programme HACCP
        colSuggestions.Remove Index
    End If
    
End Sub


Public Function Item(ByVal Index As Variant) As Suggestion
    Set Item = colSuggestions.Item(Index)
End Function


