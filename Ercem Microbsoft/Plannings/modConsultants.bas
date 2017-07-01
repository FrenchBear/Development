Attribute VB_Name = "modConsultants"
' modConsultants
' Fonctions concernant les consultants
' 19/01/1999 PV

Option Explicit

Private colTypePrestation As New Collection
Private colActivit� As New Collection


Private Sub AjouteTypePrestation(iType As Integer, sLibell� As String)
  Dim tp As New TypePrestation
  tp.tp_type = iType
  tp.tp_libelle = sLibell�
  colTypePrestation.Add tp, "T" & iType
End Sub

Private Sub AjouteActivit�(iType As Integer, sLibell� As String)
  Dim sa As New Activit�
  sa.sa_secteur = iType
  sa.sa_libelle = sLibell�
  colActivit�.Add sa, "A" & iType
End Sub


Public Sub InitInfoConsultants()
  AjouteTypePrestation 0, "Autres"
  AjouteTypePrestation 100, "Audits hygi�ne / m�thodes"
  AjouteTypePrestation 101, "Audits Fournisseurs"
  AjouteTypePrestation 200, "HACCP"
  AjouteTypePrestation 300, "Assurance qualit�"
  AjouteTypePrestation 400, "Audit - Diagnostic AQ"
  AjouteTypePrestation 500, "Guides de Bonnes Pratiques d'Hygi�ne + Application HACCP"
  AjouteTypePrestation 600, "Formation"
  AjouteTypePrestation 601, "Formation Formateur"
  AjouteTypePrestation 700, "Ing�nierie"
  AjouteTypePrestation 800, "Dossiers Techniques Sanitaires"
  AjouteTypePrestation 801, "Dossier de demande d'agr�ment CEE"
  AjouteTypePrestation 900, "�tude de stabilit�"
  
  AjouteActivit� 0, "Autres"
  AjouteActivit� 100, "GMS"
  AjouteActivit� 200, "Entreposage - Distribution"
  AjouteActivit� 300, "Restauration divers"
  AjouteActivit� 301, "Restauration rapide"
  AjouteActivit� 302, "Restauration collective"
  AjouteActivit� 303, "Restauration h�teli�re"
  AjouteActivit� 304, "Restauration sant�"
  AjouteActivit� 305, "Restauration commerciale"
  AjouteActivit� 306, "Restauration scolaire"
  AjouteActivit� 307, "Restauration sociale"
  AjouteActivit� 308, "Restauration catering"
  AjouteActivit� 400, "Industrie divers"
  AjouteActivit� 401, "Industrie viande"
  AjouteActivit� 402, "Industrie charcuterie"
  AjouteActivit� 403, "Industrie p�tisserie - glaces"
  AjouteActivit� 404, "Industrie boulangerie - viennoiserie"
  AjouteActivit� 405, "Industrie biscuiterie - p�tisserie industrielle"
  AjouteActivit� 406, "Industrie traiteur - plats cuisin�s"
  AjouteActivit� 407, "Industrie produits de la p�che"
  AjouteActivit� 408, "Industrie produits laitiers"
  AjouteActivit� 409, "Industrie fromages"
  AjouteActivit� 410, "Industrie conserves"
  AjouteActivit� 411, "Industrie fruits et l�gumes"
  AjouteActivit� 412, "Industrie confiserie - chocolat - confitures"
  AjouteActivit� 413, "Industrie p�tisserie charcuti�re"
  AjouteActivit� 414, "Industrie boissons"
  AjouteActivit� 415, "Industrie ovoproduits"
  AjouteActivit� 416, "Industrie sandwiches"
  AjouteActivit� 417, "Industrie surgel�s"
  AjouteActivit� 418, "Industrie volaille"
End Sub

' Chargement des combos pour les consultants
Public Sub RemplitTypePrestation(bdc As BDCombo)
  Dim tp As TypePrestation
  
  For Each tp In colTypePrestation
    bdc.AddItem tp.tp_type, tp.tp_libelle
  Next
End Sub

Public Sub RemplitActivit�(bdc As BDCombo)
  Dim sa As Activit�
  
  For Each sa In colActivit�
    bdc.AddItem sa.sa_secteur, sa.sa_libelle
  Next
End Sub


Private Function sLibell�TypePrestation(ByVal iTypePrest As Integer) As String
  On Error Resume Next
  sLibell�TypePrestation = colTypePrestation("T" & iTypePrest).tp_libelle
  If Err Then sLibell�TypePrestation = "???"
End Function

Public Function sNoEtLibell�TypePrestation(vTypePrest) As String
  If IsNull(vTypePrest) Then
    sNoEtLibell�TypePrestation = ""
    Exit Function
  End If
  
  sNoEtLibell�TypePrestation = vTypePrest & ": " & sLibell�TypePrestation(vTypePrest)
End Function


Private Function sLibell�Activit�(ByVal iActivit� As Integer) As String
  On Error Resume Next
  sLibell�Activit� = colActivit�("A" & iActivit�).sa_libelle
  If Err Then sLibell�Activit� = "???"
End Function

Public Function sNoEtLibell�Activit�(vActivit�) As String
  If IsNull(vActivit�) Then
    sNoEtLibell�Activit� = ""
    Exit Function
  End If
  
  sNoEtLibell�Activit� = vActivit� & ": " & sLibell�Activit�(vActivit�)
End Function
