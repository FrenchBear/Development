Attribute VB_Name = "accSecr�tariat"
' accSecr�tariat
' Acc�s aux secr�tariats et gestion d'un cache en m�moire
'  8/11/01 PV

Option Explicit

Private m_colSecr�tariat As New Collection


Public Function colSecr�tariat() As Collection
  If m_colSecr�tariat.Count = 0 Then ChargeSecr�tariats
  Set colSecr�tariat = m_colSecr�tariat
End Function

Private Sub ChargeSecr�tariats()
  Dim cSecr�tariat As New BDCurseur
  Dim s As New Secr�tariat
  
  ' En cas de changement de Secr�tariat, on efface la liste
  EffaceCollection m_colSecr�tariat
  
  cSecr�tariat.OpenCurseur "select sec_secretariat,sec_systeme,sec_libelle from secretariat order by sec_secretariat"
  While Not cSecr�tariat.EOF
    s.sec_secretariat = cSecr�tariat!sec_secretariat
    s.sec_systeme = cSecr�tariat!sec_systeme
    s.sec_libelle = cSecr�tariat!sec_libelle
    m_colSecr�tariat.Add s.Copie, s.sec_secretariat
    cSecr�tariat.MoveNext
  Wend
  cSecr�tariat.CloseCurseur
End Sub


Function sNomSecr�tariat(cLettreSys As Variant) As String
  If IsNull(cLettreSys) Then
    sNomSecr�tariat = ""
  Else
    On Error Resume Next
    sNomSecr�tariat = colSecr�tariat(cLettreSys).sec_libelle
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomSecr�tariat = ""
  End If
End Function

