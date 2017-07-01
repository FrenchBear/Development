VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Dangers"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'classe de collection de dangers
Private colDangers As New Collection

Public Function zAddDanger(ByVal idDanger As String, ByVal Nature As String, ByVal Spécificité As String, ByVal Pertinence As Integer, ByVal Documents As Documents) As Danger

Dim dNew As New Danger

    With dNew
        .id = idDanger
        .Nature = Nature
        .Spécificité = Spécificité
        .Pertinence = Pertinence
        .colDocuments = Documents
    End With
    colDangers.Add dNew
    Set zAddDanger = dNew
    
End Function



Public Function Count() As Long
    Count = colDangers.Count
End Function

Public Function Item(ByVal i As Integer) As Danger
    Set Item = colDangers.Item(i)
End Function

Public Sub Delete(ByVal i As Integer)
    colDangers.Remove i
End Sub



