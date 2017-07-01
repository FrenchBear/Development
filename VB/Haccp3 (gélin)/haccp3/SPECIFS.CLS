VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Specificites"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'classe de collection de spécificités
Private colSpécificités As New Collection

Public Function Add(ByVal Libellé As String, Optional KeyBefore As Variant) As Specificite

Dim specNew As New Specificite

    With specNew
        .Libellé = Libellé
    End With
    On Error Resume Next
    If IsMissing(KeyBefore) Then
        colSpécificités.Add specNew, Libellé
    Else
        colSpécificités.Add specNew, Libellé, Before:=KeyBefore
    End If
    If Err Then
        If Err = 457 Then
            MsgBox "Cette spécificité existe déjà. Choisissez-en une autre.", MB_ICONEXCLAMATION, NomApplication
        Else
            ErreurSystemeBox Error$, MB_ICONEXCLAMATION, "Spécificités|Add"
        End If
        On Error GoTo 0
        Exit Function
    End If
    On Error GoTo 0
    Set Add = specNew
    
End Function




Public Function Count() As Long
    Count = colSpécificités.Count
End Function


Public Sub Delete(ByVal Libellé As String)
    colSpécificités.Remove Libellé
End Sub




Public Function Item(ByVal Libellé As Variant) As Specificite
    Set Item = colSpécificités.Item(Libellé)
End Function


