Attribute VB_Name = "accUnit�Ventilation"
' accUnit�Ventilation
' Acc�s aux Unit�s de ventilation et gestion d'un cache
' 12/02/98 PV
' 12/08/1999 PV Chargement diff�r� de la collection

Option Explicit

Private m_colUnit�Ventilation As New Collection


Public Function colUnit�Ventilation() As Collection
  If m_colUnit�Ventilation.Count = 0 Then ChargeUnit�sVentilation
  Set colUnit�Ventilation = m_colUnit�Ventilation
End Function

Sub ChargeUnit�sVentilation()
  Dim cUnit�Ventilation As New BDCurseur
  Dim u As New Unit�Ventilation
  
  EffaceCollection m_colUnit�Ventilation
  
  cUnit�Ventilation.OpenCurseur "select uv_numuv,uv_code,uv_titre,timestamp from uvent order by uv_numuv"
  While Not cUnit�Ventilation.EOF
    u.uv_numuv = cUnit�Ventilation!uv_numuv
    u.uv_code = cUnit�Ventilation!uv_code
    u.uv_titre = cUnit�Ventilation!uv_titre
    u.timestamp = cUnit�Ventilation!timestamp
    m_colUnit�Ventilation.Add u.Copie, "V" & u.uv_numuv
    cUnit�Ventilation.MoveNext
  Wend
  cUnit�Ventilation.CloseCurseur
End Sub


Function sNomUnit�Ventilation(sNum As Variant) As String
  If IsNull(sNum) Then
    sNomUnit�Ventilation = ""
  Else
    On Error Resume Next
    sNomUnit�Ventilation = m_colUnit�Ventilation("V" & Trim(sNum)).uv_titre
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomUnit�Ventilation = ""
  End If
End Function

