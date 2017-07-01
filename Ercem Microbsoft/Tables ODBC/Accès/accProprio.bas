Attribute VB_Name = "accProprio"
' accProprio
' Module d'accès aux codes propriétaires
' 11/05/1999 PV
' 12/08/1999 PV Chargement différé de la collection

Option Explicit

Private m_colProprio As New Collection


Public Function colProprio() As Collection
  If m_colProprio.Count = 0 Then ChargeProprios
  Set colProprio = m_colProprio
End Function

Private Sub ChargeProprios()
  Dim cProprio As New BDCurseur
  Dim p As Proprio

  ' En cas de changement de système, on efface la liste
  EffaceCollection m_colProprio

  cProprio.OpenCurseur "select * from proprio"  ' order by pr_proprio"
  While Not cProprio.EOF
    Set p = New Proprio
    p.pr_proprio = cProprio!pr_proprio
    p.pr_nom = cProprio!pr_nom
    m_colProprio.Add p, p.pr_proprio
    cProprio.MoveNext
  Wend
  cProprio.CloseCurseur
End Sub

