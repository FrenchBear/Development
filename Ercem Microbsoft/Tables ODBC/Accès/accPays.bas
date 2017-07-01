Attribute VB_Name = "accPays"
' accPays
' Accès aux pays
' 12/03/1999 PV
' 12/08/1999 PV Chargement différé de la collection

Option Explicit

Private m_colPays As New Collection


Public Function colPays() As Collection
  If m_colPays.Count = 0 Then ChargePays
  Set colPays = m_colPays
End Function

Public Sub PaysARecharger()
  EffaceCollection m_colPays
End Sub

Private Sub ChargePays()
  Dim cPays As New BDCurseur
  Dim p As New Pays
  
  EffaceCollection m_colPays
  
  cPays.OpenCurseur "select pay_pays,pay_libelle from pays order by pay_pays"
  While Not cPays.EOF
    p.pay_pays = cPays!pay_pays
    p.pay_libelle = cPays!pay_libelle
    m_colPays.Add p.Copie, "P" & p.pay_pays
    cPays.MoveNext
  Wend
  cPays.CloseCurseur
End Sub


Function sNomPays(sNum As Variant) As String
  If IsNull(sNum) Then
    sNomPays = ""
  Else
    On Error Resume Next
    sNomPays = colPays("P" & Trim(sNum)).pay_libelle
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomPays = ""
  End If
End Function

