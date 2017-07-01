Attribute VB_Name = "accRubVentilation"
' accRubVentilation
' Accès aux rubriques de ventilation
'  9/08/1999 PV

Option Explicit

Private m_colRubVentilation As New Collection


Public Function colRubVentilation() As Collection
  If m_colRubVentilation.Count = 0 Then ChargeRubVentilation
  Set colRubVentilation = m_colRubVentilation
End Function

Public Sub RubVentilationARecharger()
  EffaceCollection m_colRubVentilation
End Sub

Private Sub ChargeRubVentilation()
  Dim cRubVentilation As New BDCurseur
  Dim v As New RubVentilation
  
  EffaceCollection m_colRubVentilation
  
  cRubVentilation.OpenCurseur "select ruv_numruv,ruv_libelle from rubvent order by ruv_numruv"
  While Not cRubVentilation.EOF
    v.ruv_numruv = cRubVentilation!ruv_numruv
    v.ruv_libelle = cRubVentilation!ruv_libelle
    m_colRubVentilation.Add v.Copie, "V" & v.ruv_numruv
    cRubVentilation.MoveNext
  Wend
  cRubVentilation.CloseCurseur
End Sub


Function sNomRubVentilation(sNum As Variant) As String
  If IsNull(sNum) Then
    sNomRubVentilation = ""
  Else
    On Error Resume Next
    sNomRubVentilation = m_colRubVentilation("V" & Trim(sNum)).ruv_libelle
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomRubVentilation = ""
  End If
End Function

