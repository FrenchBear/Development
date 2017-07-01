Attribute VB_Name = "accRayon"
' accRayon
' Module d'accès aux codes rayon
' 11/05/1999 PV
' 12/08/1999 PV Chargement différé de la collection

Option Explicit

Private m_colRayon As New Collection
Private bSansRayons As Boolean

Public Function colRayon() As Collection
  If m_colRayon.Count = 0 And Not bSansRayons Then ChargeRayons
  Set colRayon = m_colRayon
End Function

Private Sub ChargeRayons()
  Dim cRayon As New BDCurseur
  Dim r As Rayon
  
  ' En cas de changement de système, on efface la liste
  EffaceCollection m_colRayon
  
  On Error Resume Next
  cRayon.OpenCurseur "select ray_indice,ray_libelle from rayon order by ray_indice"
  If Err Then
    bSansRayons = True
    Exit Sub
  End If
  While Not cRayon.EOF
    Set r = New Rayon
    r.ray_indice = cRayon!ray_indice
    r.ray_libelle = cRayon!ray_libelle
    m_colRayon.Add r, r.ray_indice
    cRayon.MoveNext
  Wend
  cRayon.CloseCurseur
End Sub

