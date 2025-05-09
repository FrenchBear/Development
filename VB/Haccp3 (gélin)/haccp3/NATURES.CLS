VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Natures"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'classe de collection de suggestions
Private colNatures As New Collection

Public Function Add(ByVal Libell� As String, Optional Before As Variant) As Nature

Dim natNew As New Nature

    With natNew
        .Libell� = Libell�
    End With
    On Error Resume Next
    If IsMissing(Before) Then
        colNatures.Add natNew, Libell�
    Else
        colNatures.Add natNew, Libell�, Before
    End If
    If Err Then
        If Err = 457 Then
            MsgBox "Cette nature existe d�j�.", MB_ICONEXCLAMATION, NomApplication
        Else
            ErreurSystemeBox Error$, MB_ICONEXCLAMATION, "Natures|Add"
        End If
        On Error GoTo 0
        Exit Function
    End If
    On Error GoTo 0
    Set Add = natNew
    
End Function




Public Function Count() As Long
    Count = colNatures.Count
End Function

Public Function Item(ByVal Libell� As Variant) As Nature
    Set Item = colNatures.Item(Libell�)
End Function

Public Sub Delete(ByVal Libell� As String)
    colNatures.Remove Libell�
End Sub



