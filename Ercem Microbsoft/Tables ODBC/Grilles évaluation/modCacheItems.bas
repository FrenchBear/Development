Attribute VB_Name = "modCacheItems"
' modCacheItems
' Gestion de caches spécialisés pour les grilles, pour optimiser l'accès BD
' 17/11/1999 NC
' 13/12/1999 PV Purge du cache
' 15/01/2000 PV Fonction sGetItemGrilleNumloc

Option Explicit

' Caches
Private colItem As New Collection         ' Libellé de l'item, clé="I" & n°item

Public Const sLibelléInexistant As String = "*** Item inexistant !"


' ================================================================================
' Items

' Accès de base par numit
Public Function sGetItem(ByVal iNumit As Long, ByVal cLangue As String) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetItem = colItem(cLangue & iNumit)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  s = BDCurseurExpress("select it_libelle from items where it_numit=" & iNumit & " and it_langue='" & cLangue & "'")
  If s = "" Then s = sLibelléInexistant
  colItem.Add s, cLangue & iNumit   ' On conserve le résultat
  sGetItem = s
End Function

' Accès via n°grille+n°local
Public Function sGetItemGrilleNumloc(ByVal iGrille As Integer, ByVal sNumloc As String, ByVal cLangue As String) As String
  Dim iNumit As Long
  iNumit = BDCurseurExpress("select cg_numit from corgri where cg_numgri=" & sFormToSQL(iGrille, BDTYPESMALLINT) & " and cg_numloc=" & sFormToSQL(sNumloc, BDTypeCHAR))
  If iNumit = 0 Then
    sGetItemGrilleNumloc = ""
  Else
    sGetItemGrilleNumloc = sGetItem(iNumit, cLangue)
  End If
End Function



Public Sub PurgeCacheItems(ByVal iItem As Long, ByVal cLangue As String)
  On Error Resume Next
  colItem.Remove cLangue & iItem
End Sub


Public Function sFormateItem(ByVal sLibelléItem As String, ByVal sNiveau As String) As String
  Dim sEspaces As String
  Select Case sNiveau
    Case 1: sEspaces = ""
    Case 2: sEspaces = "  "
    Case 3: sEspaces = "    "
    Case 4: sEspaces = "      "
  End Select

  sFormateItem = sEspaces & sLibelléItem
End Function
