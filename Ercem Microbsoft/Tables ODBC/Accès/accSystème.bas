Attribute VB_Name = "accSystème"
' accSystème
' Accès aux systèmes et gestion d'un cache
' 19/01/98 PV
' 12/08/1999 PV Chargement différé de la collection

Option Explicit

Private m_colSystème As New Collection


Public Function colSystème() As Collection
  If m_colSystème.Count = 0 Then ChargeSystèmes
  Set colSystème = m_colSystème
End Function

Private Sub ChargeSystèmes()
  Dim cSystème As New BDCurseur
  Dim s As New Système
  
  ' En cas de changement de système, on efface la liste
  EffaceCollection m_colSystème
  
  cSystème.OpenCurseur "select sys_systeme,sys_nom,sys_description,sys_balsite,sys_adrlabo1,timestamp from systeme order by sys_systeme"
  While Not cSystème.EOF
    s.sys_systeme = cSystème!sys_systeme
    s.sys_nom = cSystème!sys_nom
    s.sys_description = cSystème!sys_description
    s.sys_balsite = cSystème!sys_balsite
    s.sys_adrlabo1 = cSystème!sys_adrlabo1
    s.timestamp = cSystème!timestamp
    m_colSystème.Add s.Copie, s.sys_systeme
    cSystème.MoveNext
  Wend
  cSystème.CloseCurseur
End Sub


Function sNomSystème(cLettreSys As Variant) As String
  If IsNull(cLettreSys) Then
    sNomSystème = ""
  Else
    On Error Resume Next
    sNomSystème = colSystème(cLettreSys).sys_nom
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomSystème = ""
  End If
End Function

