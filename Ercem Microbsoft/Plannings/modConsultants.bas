Attribute VB_Name = "modConsultants"
' modConsultants
' Fonctions concernant les consultants
' 19/01/1999 PV

Option Explicit

Private colTypePrestation As New Collection
Private colActivité As New Collection


Private Sub AjouteTypePrestation(iType As Integer, sLibellé As String)
  Dim tp As New TypePrestation
  tp.tp_type = iType
  tp.tp_libelle = sLibellé
  colTypePrestation.Add tp, "T" & iType
End Sub

Private Sub AjouteActivité(iType As Integer, sLibellé As String)
  Dim sa As New Activité
  sa.sa_secteur = iType
  sa.sa_libelle = sLibellé
  colActivité.Add sa, "A" & iType
End Sub


Public Sub InitInfoConsultants()
  AjouteTypePrestation 0, "Autres"
  AjouteTypePrestation 100, "Audits hygiène / méthodes"
  AjouteTypePrestation 101, "Audits Fournisseurs"
  AjouteTypePrestation 200, "HACCP"
  AjouteTypePrestation 300, "Assurance qualité"
  AjouteTypePrestation 400, "Audit - Diagnostic AQ"
  AjouteTypePrestation 500, "Guides de Bonnes Pratiques d'Hygiène + Application HACCP"
  AjouteTypePrestation 600, "Formation"
  AjouteTypePrestation 601, "Formation Formateur"
  AjouteTypePrestation 700, "Ingénierie"
  AjouteTypePrestation 800, "Dossiers Techniques Sanitaires"
  AjouteTypePrestation 801, "Dossier de demande d'agrément CEE"
  AjouteTypePrestation 900, "Étude de stabilité"
  
  AjouteActivité 0, "Autres"
  AjouteActivité 100, "GMS"
  AjouteActivité 200, "Entreposage - Distribution"
  AjouteActivité 300, "Restauration divers"
  AjouteActivité 301, "Restauration rapide"
  AjouteActivité 302, "Restauration collective"
  AjouteActivité 303, "Restauration hôtelière"
  AjouteActivité 304, "Restauration santé"
  AjouteActivité 305, "Restauration commerciale"
  AjouteActivité 306, "Restauration scolaire"
  AjouteActivité 307, "Restauration sociale"
  AjouteActivité 308, "Restauration catering"
  AjouteActivité 400, "Industrie divers"
  AjouteActivité 401, "Industrie viande"
  AjouteActivité 402, "Industrie charcuterie"
  AjouteActivité 403, "Industrie pâtisserie - glaces"
  AjouteActivité 404, "Industrie boulangerie - viennoiserie"
  AjouteActivité 405, "Industrie biscuiterie - pâtisserie industrielle"
  AjouteActivité 406, "Industrie traiteur - plats cuisinés"
  AjouteActivité 407, "Industrie produits de la pêche"
  AjouteActivité 408, "Industrie produits laitiers"
  AjouteActivité 409, "Industrie fromages"
  AjouteActivité 410, "Industrie conserves"
  AjouteActivité 411, "Industrie fruits et légumes"
  AjouteActivité 412, "Industrie confiserie - chocolat - confitures"
  AjouteActivité 413, "Industrie pâtisserie charcutière"
  AjouteActivité 414, "Industrie boissons"
  AjouteActivité 415, "Industrie ovoproduits"
  AjouteActivité 416, "Industrie sandwiches"
  AjouteActivité 417, "Industrie surgelés"
  AjouteActivité 418, "Industrie volaille"
End Sub

' Chargement des combos pour les consultants
Public Sub RemplitTypePrestation(bdc As BDCombo)
  Dim tp As TypePrestation
  
  For Each tp In colTypePrestation
    bdc.AddItem tp.tp_type, tp.tp_libelle
  Next
End Sub

Public Sub RemplitActivité(bdc As BDCombo)
  Dim sa As Activité
  
  For Each sa In colActivité
    bdc.AddItem sa.sa_secteur, sa.sa_libelle
  Next
End Sub


Private Function sLibelléTypePrestation(ByVal iTypePrest As Integer) As String
  On Error Resume Next
  sLibelléTypePrestation = colTypePrestation("T" & iTypePrest).tp_libelle
  If Err Then sLibelléTypePrestation = "???"
End Function

Public Function sNoEtLibelléTypePrestation(vTypePrest) As String
  If IsNull(vTypePrest) Then
    sNoEtLibelléTypePrestation = ""
    Exit Function
  End If
  
  sNoEtLibelléTypePrestation = vTypePrest & ": " & sLibelléTypePrestation(vTypePrest)
End Function


Private Function sLibelléActivité(ByVal iActivité As Integer) As String
  On Error Resume Next
  sLibelléActivité = colActivité("A" & iActivité).sa_libelle
  If Err Then sLibelléActivité = "???"
End Function

Public Function sNoEtLibelléActivité(vActivité) As String
  If IsNull(vActivité) Then
    sNoEtLibelléActivité = ""
    Exit Function
  End If
  
  sNoEtLibelléActivité = vActivité & ": " & sLibelléActivité(vActivité)
End Function
