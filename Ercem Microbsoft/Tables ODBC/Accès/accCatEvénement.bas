Attribute VB_Name = "accCatEvénement"
' accCatEvénement
' Accès aux enregistrements de CatEvénement et gestion d'un cache
' 15/04/1998 PV
' 12/04/1999 PV  cev_dependmilieu


Option Explicit

Public colCatEvénements As New Collection

Sub ChargeCatEvénements()
  Dim cCatEvénement As New BDCurseur
  Dim e As New CatEvénement
  
  ' En cas de changement de système, on efface la liste
  While colCatEvénements.Count > 0
    colCatEvénements.Remove 1
  Wend

  
  cCatEvénement.OpenCurseur "select cev_evenement,cev_libelle,cev_dependmilieu,timestamp from catevenement"
  While Not cCatEvénement.EOF
    e.cev_evenement = cCatEvénement!cev_evenement
    e.cev_libelle = cCatEvénement!cev_libelle
    e.cev_dependmilieu = cCatEvénement!cev_dependmilieu = "O"   ' Conv str -> bool
    e.timestamp = cCatEvénement!timestamp

    colCatEvénements.Add e.Copie, e.cev_evenement
    cCatEvénement.MoveNext
  Wend
  cCatEvénement.CloseCurseur
End Sub


Function sNomCatEvénement(e As Variant) As String
  If IsNull(e) Then
    sNomCatEvénement = ""
  Else
    On Error Resume Next
    sNomCatEvénement = colCatEvénements(e).cev_libelle
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomCatEvénement = ""
  End If
End Function
