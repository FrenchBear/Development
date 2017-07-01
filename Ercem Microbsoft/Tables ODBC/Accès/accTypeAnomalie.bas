Attribute VB_Name = "accTypeAnomalie"
' accTypeAnomalie
' Accès aux types d'anomalies prédéfinis
' 05/05/1998 PV
' 29/05/1998 PV Passage en BD
' 16/04/1999 PV Tri lors de la lecture
' 12/08/1999 PV Chargement différé de la collection


Option Explicit

Private m_colTypeAnomalie As New Collection


Public Function colTypeAnomalie() As Collection
  If m_colTypeAnomalie.Count = 0 Then ChargeTypesAnomalies
  Set colTypeAnomalie = m_colTypeAnomalie
End Function

Private Sub ChargeTypesAnomalies()
  EffaceCollection m_colTypeAnomalie
  
  Dim cTA As New BDCurseur
  Dim t As New TypeAnomalie
  
  cTA.OpenCurseur "select tan_section,tan_code,tan_libelle from typeanomalie order by tan_section,tan_code"
  While Not cTA.EOF
    t.ta_section = cTA!tan_section
    t.ta_code = cTA!tan_code
    t.ta_libelle = cTA!tan_libelle
    m_colTypeAnomalie.Add t.Copie, t.ta_section & t.ta_code
    cTA.MoveNext
  Wend
  cTA.CloseCurseur
End Sub

