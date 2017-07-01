Attribute VB_Name = "modCacheCat�gorie"
' modCacheCat�gorie
' Gestion de caches sp�cialis�s pour l'acc�s au jeu de cat�gorie
' 18/10/1999 NC

Option Explicit

' Caches

Private colJeu As New Collection         ' Nom du jeu de cat�gorie , cl�="J" & n�jeu
Private colCat�gorie As New Collection   ' Nom de la cat�gorie, cl�="C" & n�cat�gorie

' ===============================================================================
' Cache des jeux

Public Function sGetJeu(ByVal sJeu As String) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetJeu = colJeu("J" & sJeu)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis � d�faut dans la base
  Dim s As String
  s = BDCurseurExpress("select jeu_libelle from jeucat where jeu_indice='" & sJeu & "'")
  If Left(s, 1) = "!" Then s = s & " [*** Jeu obsol�te non mis � jour avec les nouveaux types ***]"
  colJeu.Add s, "J" & sJeu   ' On conserve le r�sultat
  sGetJeu = s
End Function

Public Sub PurgeCacheJeu(ByVal sJeu As Integer)
  On Error Resume Next
  colJeu.Remove "J" & sJeu
End Sub

' ===============================================================================
' Cache des cat�gories

' Version NC !!!!
Public Function sGetCat�gorie(ByVal sJeu As String, ByVal sCat As String) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetCat�gorie = colCat�gorie("C" & sJeu & "/" & sCat)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis � d�faut dans la base
  Dim s As String
  's = BDCurseurExpress("select ncat_libelle from nouvcat where ncat_indice='" & sCat & "'")
  s = BDCurseurExpress("select ncat_libelle from nouvcat where ncat_jeu='" & sJeu & "' and ncat_indice='" & sCat & "'")
  colCat�gorie.Add s, "C" & sJeu & "/" & sCat  ' On conserve le r�sultat
  sGetCat�gorie = s
End Function

Public Sub PurgeCacheCat�gorie(ByVal sJeu As Integer, ByVal sCat As Integer)
  On Error Resume Next
  colCat�gorie.Remove "C" & sJeu & "/" & sCat
End Sub

