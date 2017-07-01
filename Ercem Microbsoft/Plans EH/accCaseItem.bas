Attribute VB_Name = "accCaseItem"
' Module accCaseItem
' Fonctions de gestion des objets CaseItem
' 24/04/1998 PV

Option Explicit

Function CréeCase(sNumLoc, X As Single, Y As Single) As Integer
  Dim i As Integer, j As Integer
  i = 1
  Do
    On Error Resume Next
    j = frmEditeur.picCase(i).Index
    If Err Then Exit Do
    i = i + 1
  Loop
  On Error GoTo 0
  Load frmEditeur.picCase(i)
  
  With frmEditeur.picCase(i)
    .Tag = NV(sNumLoc)
    .Move X, Y
    .ZOrder 0
    .Visible = True
  End With
  
  CréeCase = i
End Function


Sub EffaceCases()
  Dim c As PictureBox
  For Each c In frmEditeur.picCase
    If c.Index > 0 Then Unload c
  Next
End Sub


Sub DéplaceCase(i As Integer, X As Single, Y As Single)
  With frmEditeur.picCase(i)
    .ZOrder 0
    .Move X, Y
  End With
End Sub

Sub Désactive(i As Integer)
  frmEditeur.txtIndice = ""
  frmEditeur.txtItem = ""
  frmEditeur.picCase(i).BackColor = &HFFC0C0
End Sub

Sub Active(i As Integer)
  frmEditeur.txtIndice = i
  frmEditeur.txtItem = frmEditeur.picCase(i).Tag
  frmEditeur.picCase(i).BackColor = &H80C0FF
End Sub


Function sNumLoc(i As Integer)
  sNumLoc = frmEditeur.picCase(i).Tag
End Function

Sub SetNumLoc(i As Integer, sNumLoc As String)
  frmEditeur.picCase(i).Tag = sNumLoc
  frmEditeur.txtItem = sNumLoc
End Sub

Sub SupprimeCase(i As Integer)
  Désactive i
  Unload frmEditeur.picCase(i)
End Sub

