Attribute VB_Name = "accMéthode"
' accMéthode
' Module d'accès aux Méthodes
' 4/1/00 PV

Option Explicit


Private m_colMéthode As New Collection


Public Function colMéthode() As Collection
  If m_colMéthode.Count = 0 Then ChargeMéthode
  Set colMéthode = m_colMéthode
End Function

Public Sub MéthodeARecharger()
  EffaceCollection m_colMéthode
End Sub

Private Sub ChargeMéthode()
  Dim cMéthode As New BDCurseur
  Dim p As New Méthode
  
  SetStatus "Chargement des méthodes en mémoire"
  EffaceCollection m_colMéthode
  cMéthode.OpenCurseur "select met_germe,met_methode,met_libelle from methode"
  While Not cMéthode.EOF
    p.met_libelle = NV(cMéthode!met_libelle)
    m_colMéthode.Add p.Copie, "M" & cMéthode!met_germe & "," & cMéthode!met_methode
    cMéthode.MoveNext
  Wend
  cMéthode.CloseCurseur
  SetStatus
End Sub


Public Function sNomMéthode(iParamètre As Integer, sMéthode As String) As String
  On Error Resume Next
  sNomMéthode = colMéthode("M" & iParamètre & "," & sMéthode).met_libelle
  If Err = 0 And sNomMéthode <> "" Then Exit Function
  On Error GoTo 0
  
  Select Case sMéthode
    Case "*":   sNomMéthode = "Toutes méthodes"
    Case "a":   sNomMéthode = "Méthode AFNOR"
    Case "s":   sNomMéthode = "Méthode SILLIKER"
    Case Else:  sNomMéthode = "Méthode " & sMéthode
  End Select
End Function

