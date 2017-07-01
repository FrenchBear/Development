Attribute VB_Name = "accParamètre"
' accParamètre
' Module d'accès aux paramètres
' 4/1/00 PV

Option Explicit


Private m_colParamètre As New Collection


Public Function colParamètre() As Collection
  If m_colParamètre.Count = 0 Then ChargeParamètre
  Set colParamètre = m_colParamètre
End Function

Public Sub ParamètreARecharger()
  EffaceCollection m_colParamètre
End Sub

Private Sub ChargeParamètre()
  Dim cParamètre As New BDCurseur
  Dim p As New Paramètre
  
  SetStatus "Chargement des paramètres en mémoire"
  EffaceCollection m_colParamètre
  cParamètre.OpenCurseur "select ger_indice,ger_libelle,ger_abrege from germe where ger_langue='F' order by ger_indice"
  While Not cParamètre.EOF
    p.ger_indice = cParamètre!ger_indice
    p.ger_libelle = cParamètre!ger_libelle
    p.ger_abrege = NV(cParamètre!ger_abrege)
    m_colParamètre.Add p.Copie, "P" & p.ger_indice
    cParamètre.MoveNext
  Wend
  cParamètre.CloseCurseur
  SetStatus
End Sub


Public Function sNomParamètre(sNum As Variant) As String
  If IsNull(sNum) Then
    sNomParamètre = ""
  Else
    On Error Resume Next
    sNomParamètre = colParamètre("P" & Trim(sNum)).ger_libelle
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomParamètre = ""
  End If
End Function


Public Function sAbregéParamètre(sNum As Variant) As String
  If IsNull(sNum) Then
    sAbregéParamètre = ""
  Else
    On Error Resume Next
    sAbregéParamètre = colParamètre("P" & Trim(sNum)).ger_abrege
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sAbregéParamètre = ""
  End If
End Function

