VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "EtapesDangers"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'classe de collection de étapes/dangers
Private colSujetsDangers As New Collection

Public Function Add(ByVal Sujet As String, ByVal Danger As String, ByVal TypeDanger As String, ByVal Criticité As Integer, Optional R1 As Variant, Optional R2 As Variant, Optional R3 As Variant, Optional R4 As Variant, Optional R5 As Variant, Optional R6 As Variant, Optional R7 As Variant, Optional R8 As Variant) As SujetDanger

Dim dNew As New SujetDanger

    With dNew
        .Sujet = Sujet
        .Danger = Danger
        .TypeDanger = TypeDanger
        .Criticité = Criticité
        .R1 = R1
        .R2 = R2
        .R3 = R3
        .R4 = R4
        .R5 = R5
        .R6 = R6
        .R7 = R7
        .R8 = R8
    End With
    colSujetsDangers.Add dNew
    Set Add = dNew
    
End Function



Public Function Count() As Long
    Count = colSujetsDangers.Count
End Function

Public Function Item(ByVal i As Variant) As SujetDanger
    Set Item = colSujetsDangers.Item(i)
End Function

Public Sub Delete(ByVal i As Variant)
    colSujetsDangers.Remove i
End Sub



