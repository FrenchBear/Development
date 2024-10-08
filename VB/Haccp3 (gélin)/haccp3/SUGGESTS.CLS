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

Public Function Add(ByVal Libell� As String, ByVal Description As String, ByVal Index As Long, ByVal Ajout�e As Integer, ByVal Effac�e As Integer, ByVal Remplac�e As Integer) As Suggestion

Dim suggNew As New Suggestion

    With suggNew
        .Libell� = Libell�
        .Description = Description
        .Ajout�e = Ajout�e
        .Effac�e = Effac�e
        .Remplac�e = Remplac�e
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


Public Function Replace(ByVal Libell� As String, ByVal Description As String, ByVal Index As Long, ByVal Ajout�e As Integer, ByVal Effac�e As Integer, ByVal Remplac�e As Integer)

Dim Suggestion As Suggestion
    
    Set Suggestion = colSuggestions.Item(Index)
    If Not Suggestion.Remplac�e Then
        Suggestion.OldLibell� = Suggestion.Libell�
        Suggestion.OldDescription = Suggestion.Description
    End If
    Suggestion.Libell� = Libell�
    Suggestion.Description = Description
    Suggestion.Remplac�e = Remplac�e
    
End Function
Public Function Count() As Long
    Count = colSuggestions.Count
End Function


Public Sub Delete(ByVal Index As Long, ByVal AppelDepuisHacMod As Integer)
    
    If Not AppelDepuisHacMod Then
        'effacement depuis HACCP
        If colSuggestions.Item(Index).Ajout�e Then
            'les suggestions ajout�e depuis HACCP sont effac�es
            colSuggestions.Remove Index
        Else
            'les suggestions d'orginie sont marqu�es effac�es
            colSuggestions.Item(Index).Effac�e = True
        End If
    Else
        'effacement depuis le gestionnaire de module: on efface aussi bien les
        'suggestions d'origine que celles ajout�es depuis le programme HACCP
        colSuggestions.Remove Index
    End If
    
End Sub


Public Function Item(ByVal Index As Variant) As Suggestion
    Set Item = colSuggestions.Item(Index)
End Function


