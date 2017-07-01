Attribute VB_Name = "modCacheGrilles"
' modCacheGrilles
' Gestion de caches spécialisés pour les grilles, pour optimiser l'accès BD
' 24/11/1999 NC

Option Explicit

' Caches
Private colTitre As New Collection        ' Titre de la grille, clé="T" & n° grille


' ================================================================================
' Titre de la grille

Public Function sGetTitreGrille(ByVal iTitre As Long, ByVal cLangue As String) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetTitreGrille = colTitre(cLangue & iTitre)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  s = BDCurseurExpress("select tit_titre1 from titgri where tit_numgri=" & iTitre & " and tit_langue='" & cLangue & "'")
  'If s = "" Then s = sLibelléInexistant
  colTitre.Add s, cLangue & iTitre   ' On conserve le résultat
  sGetTitreGrille = s
End Function
