Attribute VB_Name = "accSecrétariat"
' accSecrétariat
' Accès aux secrétariats et gestion d'un cache en mémoire
'  8/11/01 PV

Option Explicit

Private m_colSecrétariat As New Collection


Public Function colSecrétariat() As Collection
  If m_colSecrétariat.Count = 0 Then ChargeSecrétariats
  Set colSecrétariat = m_colSecrétariat
End Function

Private Sub ChargeSecrétariats()
  Dim cSecrétariat As New BDCurseur
  Dim s As New Secrétariat
  
  ' En cas de changement de Secrétariat, on efface la liste
  EffaceCollection m_colSecrétariat
  
  cSecrétariat.OpenCurseur "select sec_secretariat,sec_systeme,sec_libelle from secretariat order by sec_secretariat"
  While Not cSecrétariat.EOF
    s.sec_secretariat = cSecrétariat!sec_secretariat
    s.sec_systeme = cSecrétariat!sec_systeme
    s.sec_libelle = cSecrétariat!sec_libelle
    m_colSecrétariat.Add s.Copie, s.sec_secretariat
    cSecrétariat.MoveNext
  Wend
  cSecrétariat.CloseCurseur
End Sub


Function sNomSecrétariat(cLettreSys As Variant) As String
  If IsNull(cLettreSys) Then
    sNomSecrétariat = ""
  Else
    On Error Resume Next
    sNomSecrétariat = colSecrétariat(cLettreSys).sec_libelle
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomSecrétariat = ""
  End If
End Function

