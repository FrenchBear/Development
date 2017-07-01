Attribute VB_Name = "accSection"
' accSection
' Module d'acc�s aux sections
' Pour l'instant les sections ne sont pas stock�es dans la base
' 05/05/1998 PV
' 12/08/1999 PV Chargement diff�r� de la collection

Option Explicit

Private m_colSection As New Collection


Public Function colSection() As Collection
  If m_colSection.Count = 0 Then ChargeSections
  Set colSection = m_colSection
End Function

Private Sub ChargeSections()
  EffaceCollection m_colSection
  
  AjouteSection "REC", "R�ception �chantillons"
  AjouteSection "PSM", "Pr�paration de solutions m�res"
  AjouteSection "DE", "Dilution-ensemencement"
  AjouteSection "PM", "Pr�paration de milieux"
  AjouteSection "LEC", "Lecture"
  AjouteSection "VAL", "Validation des r�sultats"
  AjouteSection "PAT", "Pathog�nes"
  AjouteSection "RM", "R�partition milieux / �tuvage"
  AjouteSection "MS", "Microbiologie sp�ciale"
  AjouteSection "SL", "Secr�tariat labo"
  AjouteSection "XXX", "Autre section"
End Sub


Private Sub AjouteSection(sCode As String, sLibell� As String)
  Dim s As Section
  Set s = New Section
  s.sec_code = sCode
  s.sec_libelle = sLibell�
  m_colSection.Add s, "S" & UCase(sCode)
End Sub

