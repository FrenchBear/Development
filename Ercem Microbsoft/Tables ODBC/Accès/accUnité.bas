Attribute VB_Name = "accUnité"
' accUnité
' Accès aux unités et gestion d'un cache
' 19/01/98 PV
' 12/08/1999 PV Chargement différé de la collection
' 22/08/2001 PV EffaceCacheUnités

Option Explicit

Private m_colUnité As New Collection


Public Function colUnité() As Collection
  If m_colUnité.Count = 0 Then ChargeUnités
  Set colUnité = m_colUnité
End Function

Public Sub EffaceCacheUnités()
  Set m_colUnité = Nothing
End Sub

Private Sub ChargeUnités()
  Dim cUnité As New BDCurseur
  Dim u As New Unité
  
  EffaceCollection m_colUnité
  
  cUnité.OpenCurseur "select uni_numunite,uni_code,uni_type,uni_titre,uni_adr1,uni_adr2,uni_adr3,uni_telfax,uni_uvent,uni_msgid,uni_web,timestamp from unite where uni_numunite>0 and not uni_numunite between 310 and 399 order by uni_numunite"
  While Not cUnité.EOF
    u.uni_numunite = cUnité!uni_numunite
    u.uni_code = cUnité!uni_code
    u.uni_type = NV(cUnité!uni_type)
    u.uni_titre = cUnité!uni_titre
    u.uni_adr1 = NV(cUnité!uni_adr1)
    u.uni_adr2 = NV(cUnité!uni_adr2)
    u.uni_adr3 = NV(cUnité!uni_adr3)
    u.uni_telfax = NV(cUnité!uni_telfax)
    u.uni_uvent = cUnité!uni_uvent
    u.uni_msgid = cUnité!uni_msgid
    u.uni_web = NV(cUnité!uni_web)
    u.timestamp = cUnité!timestamp
    m_colUnité.Add u.Copie, "U" & u.uni_numunite
    cUnité.MoveNext
  Wend
  cUnité.CloseCurseur
End Sub


Function sNomUnité(sNum As Variant) As String
  If IsNull(sNum) Then
    sNomUnité = ""
  Else
    On Error Resume Next
    sNomUnité = colUnité("U" & Trim(sNum)).uni_titre
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomUnité = ""
  End If
End Function


Function sCodeUnité(sNum As Variant) As String
  If IsNull(sNum) Then
    sCodeUnité = ""
  Else
    On Error Resume Next
    sCodeUnité = colUnité("U" & Trim(sNum)).uni_code
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sCodeUnité = ""
  End If
End Function

