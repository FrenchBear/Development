Attribute VB_Name = "accUnit�"
' accUnit�
' Acc�s aux unit�s et gestion d'un cache
' 19/01/98 PV
' 12/08/1999 PV Chargement diff�r� de la collection
' 22/08/2001 PV EffaceCacheUnit�s

Option Explicit

Private m_colUnit� As New Collection


Public Function colUnit�() As Collection
  If m_colUnit�.Count = 0 Then ChargeUnit�s
  Set colUnit� = m_colUnit�
End Function

Public Sub EffaceCacheUnit�s()
  Set m_colUnit� = Nothing
End Sub

Private Sub ChargeUnit�s()
  Dim cUnit� As New BDCurseur
  Dim u As New Unit�
  
  EffaceCollection m_colUnit�
  
  cUnit�.OpenCurseur "select uni_numunite,uni_code,uni_type,uni_titre,uni_adr1,uni_adr2,uni_adr3,uni_telfax,uni_uvent,uni_msgid,uni_web,timestamp from unite where uni_numunite>0 and not uni_numunite between 310 and 399 order by uni_numunite"
  While Not cUnit�.EOF
    u.uni_numunite = cUnit�!uni_numunite
    u.uni_code = cUnit�!uni_code
    u.uni_type = NV(cUnit�!uni_type)
    u.uni_titre = cUnit�!uni_titre
    u.uni_adr1 = NV(cUnit�!uni_adr1)
    u.uni_adr2 = NV(cUnit�!uni_adr2)
    u.uni_adr3 = NV(cUnit�!uni_adr3)
    u.uni_telfax = NV(cUnit�!uni_telfax)
    u.uni_uvent = cUnit�!uni_uvent
    u.uni_msgid = cUnit�!uni_msgid
    u.uni_web = NV(cUnit�!uni_web)
    u.timestamp = cUnit�!timestamp
    m_colUnit�.Add u.Copie, "U" & u.uni_numunite
    cUnit�.MoveNext
  Wend
  cUnit�.CloseCurseur
End Sub


Function sNomUnit�(sNum As Variant) As String
  If IsNull(sNum) Then
    sNomUnit� = ""
  Else
    On Error Resume Next
    sNomUnit� = colUnit�("U" & Trim(sNum)).uni_titre
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomUnit� = ""
  End If
End Function


Function sCodeUnit�(sNum As Variant) As String
  If IsNull(sNum) Then
    sCodeUnit� = ""
  Else
    On Error Resume Next
    sCodeUnit� = colUnit�("U" & Trim(sNum)).uni_code
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sCodeUnit� = ""
  End If
End Function

