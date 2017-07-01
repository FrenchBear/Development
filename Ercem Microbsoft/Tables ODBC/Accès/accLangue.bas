Attribute VB_Name = "accLangue"
' accLangue
' Module d'accès aux codes langue
' 11/05/1999 PV
' 12/08/1999 PV Chargement différé de la collection

Option Explicit

Private m_colLangue As New Collection


Public Function colLangue() As Collection
  If m_colLangue.Count = 0 Then ChargeLangues
  Set colLangue = m_colLangue
End Function

Private Sub ChargeLangues()
  Dim cLangue As New BDCurseur
  Dim l As Langue
  
  ' En cas de changement de système, on efface la liste
  EffaceCollection m_colLangue
  
  cLangue.OpenCurseur "select lan_code,lan_langue from langue order by lan_code"
  While Not cLangue.EOF
    Set l = New Langue
    l.lan_code = cLangue!lan_code
    l.lan_langue = cLangue!lan_langue
    m_colLangue.Add l, l.lan_code
    cLangue.MoveNext
  Wend
  cLangue.CloseCurseur
End Sub
