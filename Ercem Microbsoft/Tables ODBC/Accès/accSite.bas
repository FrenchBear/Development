Attribute VB_Name = "accSite"
' accSite
' Accès aux sites
' 13/01/2000 PV
'  3/02/2000 PV Lecture du site 998 (sans site)


Option Explicit

Private m_colSite As New Collection


Public Function colSite() As Collection
  If m_colSite.Count = 0 Then ChargeSite
  Set colSite = m_colSite
End Function

Public Sub SiteARecharger()
  EffaceCollection m_colSite
End Sub

Private Sub ChargeSite()
  Dim cSite As New BDCurseur
  Dim p As New Site
  
  EffaceCollection m_colSite
  
  cSite.OpenCurseur "select sit_numsite,sit_libelle from site where sit_numsite between 200 and 299 or sit_numsite>=998 order by sit_numsite"
  While Not cSite.EOF
    p.sit_numsite = cSite!sit_numsite
    p.sit_libelle = cSite!sit_libelle
    m_colSite.Add p.Copie, "S" & p.sit_numsite
    cSite.MoveNext
  Wend
  cSite.CloseCurseur
End Sub


Function sNomSite(sNum As Variant) As String
  If IsNull(sNum) Then
    sNomSite = ""
  Else
    On Error Resume Next
    sNomSite = colSite("S" & Trim(sNum)).sit_libelle
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomSite = ""
  End If
End Function

