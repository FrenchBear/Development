Attribute VB_Name = "accTypePrestation"
' accTypePrestation
' Accès aux types de prestation et gestion d'un cache
'  5/05/1998 PV
' 12/08/1999 PV Chargement différé de la collection

Option Explicit

Private m_colTypePrestation As New Collection


Public Function colTypePrestation() As Collection
  If m_colTypePrestation.Count = 0 Then ChargeTypesPrestation
  Set colTypePrestation = m_colTypePrestation
End Function

Private Sub ChargeTypesPrestation()
  Dim cTypePrestation As New BDCurseur
  Dim s As New TypePrestation
  
  ' En cas de changement de système, on efface la liste
  EffaceCollection m_colTypePrestation
  
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cTypePrestation.OpenCurseur "select tp_type,tp_libelle,timestamp from typeprestation order by tp_type"
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de l'accès aux types de prestation." & vbCrLf & vbCrLf & "Erreur " & iErr & ": " & sErr, vbCritical, App.Title
    EmergencyExit
  End If
  
  While Not cTypePrestation.EOF
    s.tp_type = cTypePrestation!tp_type
    s.tp_libelle = cTypePrestation!tp_libelle
    s.timestamp = cTypePrestation!timestamp
    m_colTypePrestation.Add s.Copie, "T" & s.tp_type
    cTypePrestation.MoveNext
  Wend
  cTypePrestation.CloseCurseur
End Sub


Function sNomTypePrestation(iType As Integer) As String
'  If IsNull(cLettreSys) Then
'    sNomTypePrestation = ""
'  Else
    On Error Resume Next
    sNomTypePrestation = m_colTypePrestation("T" & iType).tp_libelle
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomTypePrestation = ""
'  End If
End Function

