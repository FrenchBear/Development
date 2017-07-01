Attribute VB_Name = "modCacheCatégorie"
' modCacheCatégorie
' Gestion de caches spécialisés pour l'accès au jeu de catégorie
' 18/10/1999 NC

Option Explicit

' Caches

Private colJeu As New Collection         ' Nom du jeu de catégorie , clé="J" & n°jeu
Private colCatégorie As New Collection   ' Nom de la catégorie, clé="C" & n°catégorie

' ===============================================================================
' Cache des jeux

Public Function sGetJeu(ByVal sJeu As String) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetJeu = colJeu("J" & sJeu)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  s = BDCurseurExpress("select jeu_libelle from jeucat where jeu_indice='" & sJeu & "'")
  If Left(s, 1) = "!" Then s = s & " [*** Jeu obsolète non mis à jour avec les nouveaux types ***]"
  colJeu.Add s, "J" & sJeu   ' On conserve le résultat
  sGetJeu = s
End Function

Public Sub PurgeCacheJeu(ByVal sJeu As Integer)
  On Error Resume Next
  colJeu.Remove "J" & sJeu
End Sub

' ===============================================================================
' Cache des catégories

' Version NC !!!!
Public Function sGetCatégorie(ByVal sJeu As String, ByVal sCat As String) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetCatégorie = colCatégorie("C" & sJeu & "/" & sCat)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  's = BDCurseurExpress("select ncat_libelle from nouvcat where ncat_indice='" & sCat & "'")
  s = BDCurseurExpress("select ncat_libelle from nouvcat where ncat_jeu='" & sJeu & "' and ncat_indice='" & sCat & "'")
  colCatégorie.Add s, "C" & sJeu & "/" & sCat  ' On conserve le résultat
  sGetCatégorie = s
End Function

Public Sub PurgeCacheCatégorie(ByVal sJeu As Integer, ByVal sCat As Integer)
  On Error Resume Next
  colCatégorie.Remove "C" & sJeu & "/" & sCat
End Sub

