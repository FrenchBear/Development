Attribute VB_Name = "accRubFacturation"
' accRubFacturation
' Accès aux rubriques de ventilation
'  9/08/1999 PV

Option Explicit

Private m_colRubFacturation As New Collection


Public Function colRubFacturation() As Collection
  If m_colRubFacturation.Count = 0 Then ChargeRubFacturation
  Set colRubFacturation = m_colRubFacturation
End Function

Public Sub RubFacturationARecharger()
  EffaceCollection m_colRubFacturation
End Sub

Private Sub ChargeRubFacturation()
  Dim cRubFacturation As New BDCurseur
  Dim v As New RubFacturation
  
  EffaceCollection m_colRubFacturation
  
  cRubFacturation.OpenCurseur "select ruf_numruf,ruf_libelle from rubfac"
  While Not cRubFacturation.EOF
    v.ruf_numruf = cRubFacturation!ruf_numruf
    v.ruf_libelle = cRubFacturation!ruf_libelle
    m_colRubFacturation.Add v.Copie, "V" & v.ruf_numruf
    cRubFacturation.MoveNext
  Wend
  cRubFacturation.CloseCurseur
End Sub


Function sNomRubFacturation(sNum As Variant) As String
  If IsNull(sNum) Then
    sNomRubFacturation = ""
  Else
    On Error Resume Next
    sNomRubFacturation = m_colRubFacturation("V" & Trim(sNum)).ruf_libelle
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomRubFacturation = ""
  End If
End Function


