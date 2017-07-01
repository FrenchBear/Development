Attribute VB_Name = "accSyst�me"
' accSyst�me
' Acc�s aux syst�mes et gestion d'un cache
' 19/01/98 PV
' 12/08/1999 PV Chargement diff�r� de la collection

Option Explicit

Private m_colSyst�me As New Collection


Public Function colSyst�me() As Collection
  If m_colSyst�me.Count = 0 Then ChargeSyst�mes
  Set colSyst�me = m_colSyst�me
End Function

Private Sub ChargeSyst�mes()
  Dim cSyst�me As New BDCurseur
  Dim s As New Syst�me
  
  ' En cas de changement de syst�me, on efface la liste
  EffaceCollection m_colSyst�me
  
  cSyst�me.OpenCurseur "select sys_systeme,sys_nom,sys_description,sys_balsite,sys_adrlabo1,timestamp from systeme order by sys_systeme"
  While Not cSyst�me.EOF
    s.sys_systeme = cSyst�me!sys_systeme
    s.sys_nom = cSyst�me!sys_nom
    s.sys_description = cSyst�me!sys_description
    s.sys_balsite = cSyst�me!sys_balsite
    s.sys_adrlabo1 = cSyst�me!sys_adrlabo1
    s.timestamp = cSyst�me!timestamp
    m_colSyst�me.Add s.Copie, s.sys_systeme
    cSyst�me.MoveNext
  Wend
  cSyst�me.CloseCurseur
End Sub


Function sNomSyst�me(cLettreSys As Variant) As String
  If IsNull(cLettreSys) Then
    sNomSyst�me = ""
  Else
    On Error Resume Next
    sNomSyst�me = colSyst�me(cLettreSys).sys_nom
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomSyst�me = ""
  End If
End Function

