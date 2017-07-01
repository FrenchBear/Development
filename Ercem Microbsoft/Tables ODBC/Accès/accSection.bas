Attribute VB_Name = "accSection"
' accSection
' Module d'accès aux sections
' Pour l'instant les sections ne sont pas stockées dans la base
' 05/05/1998 PV
' 12/08/1999 PV Chargement différé de la collection

Option Explicit

Private m_colSection As New Collection


Public Function colSection() As Collection
  If m_colSection.Count = 0 Then ChargeSections
  Set colSection = m_colSection
End Function

Private Sub ChargeSections()
  EffaceCollection m_colSection
  
  AjouteSection "REC", "Réception échantillons"
  AjouteSection "PSM", "Préparation de solutions mères"
  AjouteSection "DE", "Dilution-ensemencement"
  AjouteSection "PM", "Préparation de milieux"
  AjouteSection "LEC", "Lecture"
  AjouteSection "VAL", "Validation des résultats"
  AjouteSection "PAT", "Pathogènes"
  AjouteSection "RM", "Répartition milieux / Étuvage"
  AjouteSection "MS", "Microbiologie spéciale"
  AjouteSection "SL", "Secrétariat labo"
  AjouteSection "XXX", "Autre section"
End Sub


Private Sub AjouteSection(sCode As String, sLibellé As String)
  Dim s As Section
  Set s = New Section
  s.sec_code = sCode
  s.sec_libelle = sLibellé
  m_colSection.Add s, "S" & UCase(sCode)
End Sub

