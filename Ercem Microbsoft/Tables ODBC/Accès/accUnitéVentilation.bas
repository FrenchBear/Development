Attribute VB_Name = "accUnitéVentilation"
' accUnitéVentilation
' Accès aux Unités de ventilation et gestion d'un cache
' 12/02/98 PV
' 12/08/1999 PV Chargement différé de la collection

Option Explicit

Private m_colUnitéVentilation As New Collection


Public Function colUnitéVentilation() As Collection
  If m_colUnitéVentilation.Count = 0 Then ChargeUnitésVentilation
  Set colUnitéVentilation = m_colUnitéVentilation
End Function

Sub ChargeUnitésVentilation()
  Dim cUnitéVentilation As New BDCurseur
  Dim u As New UnitéVentilation
  
  EffaceCollection m_colUnitéVentilation
  
  cUnitéVentilation.OpenCurseur "select uv_numuv,uv_code,uv_titre,timestamp from uvent order by uv_numuv"
  While Not cUnitéVentilation.EOF
    u.uv_numuv = cUnitéVentilation!uv_numuv
    u.uv_code = cUnitéVentilation!uv_code
    u.uv_titre = cUnitéVentilation!uv_titre
    u.timestamp = cUnitéVentilation!timestamp
    m_colUnitéVentilation.Add u.Copie, "V" & u.uv_numuv
    cUnitéVentilation.MoveNext
  Wend
  cUnitéVentilation.CloseCurseur
End Sub


Function sNomUnitéVentilation(sNum As Variant) As String
  If IsNull(sNum) Then
    sNomUnitéVentilation = ""
  Else
    On Error Resume Next
    sNomUnitéVentilation = m_colUnitéVentilation("V" & Trim(sNum)).uv_titre
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomUnitéVentilation = ""
  End If
End Function

