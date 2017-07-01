Attribute VB_Name = "accM�thode"
' accM�thode
' Module d'acc�s aux M�thodes
' 4/1/00 PV

Option Explicit


Private m_colM�thode As New Collection


Public Function colM�thode() As Collection
  If m_colM�thode.Count = 0 Then ChargeM�thode
  Set colM�thode = m_colM�thode
End Function

Public Sub M�thodeARecharger()
  EffaceCollection m_colM�thode
End Sub

Private Sub ChargeM�thode()
  Dim cM�thode As New BDCurseur
  Dim p As New M�thode
  
  SetStatus "Chargement des m�thodes en m�moire"
  EffaceCollection m_colM�thode
  cM�thode.OpenCurseur "select met_germe,met_methode,met_libelle from methode"
  While Not cM�thode.EOF
    p.met_libelle = NV(cM�thode!met_libelle)
    m_colM�thode.Add p.Copie, "M" & cM�thode!met_germe & "," & cM�thode!met_methode
    cM�thode.MoveNext
  Wend
  cM�thode.CloseCurseur
  SetStatus
End Sub


Public Function sNomM�thode(iParam�tre As Integer, sM�thode As String) As String
  On Error Resume Next
  sNomM�thode = colM�thode("M" & iParam�tre & "," & sM�thode).met_libelle
  If Err = 0 And sNomM�thode <> "" Then Exit Function
  On Error GoTo 0
  
  Select Case sM�thode
    Case "*":   sNomM�thode = "Toutes m�thodes"
    Case "a":   sNomM�thode = "M�thode AFNOR"
    Case "s":   sNomM�thode = "M�thode SILLIKER"
    Case Else:  sNomM�thode = "M�thode " & sM�thode
  End Select
End Function

