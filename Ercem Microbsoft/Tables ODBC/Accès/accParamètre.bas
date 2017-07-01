Attribute VB_Name = "accParam�tre"
' accParam�tre
' Module d'acc�s aux param�tres
' 4/1/00 PV

Option Explicit


Private m_colParam�tre As New Collection


Public Function colParam�tre() As Collection
  If m_colParam�tre.Count = 0 Then ChargeParam�tre
  Set colParam�tre = m_colParam�tre
End Function

Public Sub Param�treARecharger()
  EffaceCollection m_colParam�tre
End Sub

Private Sub ChargeParam�tre()
  Dim cParam�tre As New BDCurseur
  Dim p As New Param�tre
  
  SetStatus "Chargement des param�tres en m�moire"
  EffaceCollection m_colParam�tre
  cParam�tre.OpenCurseur "select ger_indice,ger_libelle,ger_abrege from germe where ger_langue='F' order by ger_indice"
  While Not cParam�tre.EOF
    p.ger_indice = cParam�tre!ger_indice
    p.ger_libelle = cParam�tre!ger_libelle
    p.ger_abrege = NV(cParam�tre!ger_abrege)
    m_colParam�tre.Add p.Copie, "P" & p.ger_indice
    cParam�tre.MoveNext
  Wend
  cParam�tre.CloseCurseur
  SetStatus
End Sub


Public Function sNomParam�tre(sNum As Variant) As String
  If IsNull(sNum) Then
    sNomParam�tre = ""
  Else
    On Error Resume Next
    sNomParam�tre = colParam�tre("P" & Trim(sNum)).ger_libelle
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomParam�tre = ""
  End If
End Function


Public Function sAbreg�Param�tre(sNum As Variant) As String
  If IsNull(sNum) Then
    sAbreg�Param�tre = ""
  Else
    On Error Resume Next
    sAbreg�Param�tre = colParam�tre("P" & Trim(sNum)).ger_abrege
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sAbreg�Param�tre = ""
  End If
End Function

