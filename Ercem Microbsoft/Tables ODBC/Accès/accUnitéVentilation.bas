Attribute VB_Name = "accUnitÚVentilation"
' accUnitÚVentilation
' AccŔs aux UnitÚs de ventilation et gestion d'un cache
' 12/02/98 PV
' 12/08/1999 PV Chargement diffÚrÚ de la collection

Option Explicit

Private m_colUnitÚVentilation As New Collection


Public Function colUnitÚVentilation() As Collection
  If m_colUnitÚVentilation.Count = 0 Then ChargeUnitÚsVentilation
  Set colUnitÚVentilation = m_colUnitÚVentilation
End Function

Sub ChargeUnitÚsVentilation()
  Dim cUnitÚVentilation As New BDCurseur
  Dim u As New UnitÚVentilation
  
  EffaceCollection m_colUnitÚVentilation
  
  cUnitÚVentilation.OpenCurseur "select uv_numuv,uv_code,uv_titre,timestamp from uvent order by uv_numuv"
  While Not cUnitÚVentilation.EOF
    u.uv_numuv = cUnitÚVentilation!uv_numuv
    u.uv_code = cUnitÚVentilation!uv_code
    u.uv_titre = cUnitÚVentilation!uv_titre
    u.timestamp = cUnitÚVentilation!timestamp
    m_colUnitÚVentilation.Add u.Copie, "V" & u.uv_numuv
    cUnitÚVentilation.MoveNext
  Wend
  cUnitÚVentilation.CloseCurseur
End Sub


Function sNomUnitÚVentilation(sNum As Variant) As String
  If IsNull(sNum) Then
    sNomUnitÚVentilation = ""
  Else
    On Error Resume Next
    sNomUnitÚVentilation = m_colUnitÚVentilation("V" & Trim(sNum)).uv_titre
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomUnitÚVentilation = ""
  End If
End Function

