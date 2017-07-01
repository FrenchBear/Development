Attribute VB_Name = "accCatEv�nement"
' accCatEv�nement
' Acc�s aux enregistrements de CatEv�nement et gestion d'un cache
' 15/04/1998 PV
' 12/04/1999 PV  cev_dependmilieu


Option Explicit

Public colCatEv�nements As New Collection

Sub ChargeCatEv�nements()
  Dim cCatEv�nement As New BDCurseur
  Dim e As New CatEv�nement
  
  ' En cas de changement de syst�me, on efface la liste
  While colCatEv�nements.Count > 0
    colCatEv�nements.Remove 1
  Wend

  
  cCatEv�nement.OpenCurseur "select cev_evenement,cev_libelle,cev_dependmilieu,timestamp from catevenement"
  While Not cCatEv�nement.EOF
    e.cev_evenement = cCatEv�nement!cev_evenement
    e.cev_libelle = cCatEv�nement!cev_libelle
    e.cev_dependmilieu = cCatEv�nement!cev_dependmilieu = "O"   ' Conv str -> bool
    e.timestamp = cCatEv�nement!timestamp

    colCatEv�nements.Add e.Copie, e.cev_evenement
    cCatEv�nement.MoveNext
  Wend
  cCatEv�nement.CloseCurseur
End Sub


Function sNomCatEv�nement(e As Variant) As String
  If IsNull(e) Then
    sNomCatEv�nement = ""
  Else
    On Error Resume Next
    sNomCatEv�nement = colCatEv�nements(e).cev_libelle
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomCatEv�nement = ""
  End If
End Function
