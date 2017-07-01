Attribute VB_Name = "modCacheSections"
' modCacheSections
' Gestion de cache des titres de section
' 27/12/1999 PV


Option Explicit

' Caches
Private colThème As New Collection         ' clé=lettre de la section
Private colSecteur As New Collection       ' clé=lettre de la section + n°secteur
Private colRubrique As New Collection      ' clé=lettre de la section + n°secteur + "." + n°rubrique
Private colSousRub As New Collection       ' clé=lettre de la section + n°secteur + "." + n°rubrique + "." + n°SousRub


Public Const sThèmeInexistant As String = "*** Thème inexistant !"
Public Const sSecteurInexistant As String = "*** Secteur inexistant !"
Public Const sRubriqueInexistante As String = "*** Rubrique inexistante !"
Public Const sSousRubInexistante As String = "*** Sous-rubrique inexistante !"


' ================================================================================
' Thèmes

Public Function sGetThème(ByVal sThème As String) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetThème = colThème(sThème)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  On Error Resume Next
  s = BDCurseurExpress("select ts_titre from titsec where ts_theme='" & sThème & "' and ts_secteur=0 and ts_rubrique=0 and ts_sousrub=0")
  On Error GoTo 0
  If s = "" Then s = sThèmeInexistant
  colThème.Add s, sThème   ' On conserve le résultat
  sGetThème = s
End Function


Public Sub PurgeCacheThèmes(ByVal sThème As String)
  On Error Resume Next
  colThème.Remove sThème
End Sub


' ================================================================================
' Secteurs

Public Function sGetSecteur(ByVal sThème As String, iSecteur As Integer) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetSecteur = colSecteur(sThème & iSecteur)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  s = BDCurseurExpress("select ts_titre from titsec where ts_theme='" & sThème & "' and ts_secteur=" & iSecteur & " and ts_rubrique=0 and ts_sousrub=0")
  If s = "" Then s = sSecteurInexistant
  colSecteur.Add s, sThème & iSecteur   ' On conserve le résultat
  sGetSecteur = s
End Function


Public Sub PurgeCacheSecteurs(ByVal sThème As String, iSecteur As Integer)
  On Error Resume Next
  colSecteur.Remove sThème & iSecteur
End Sub


' ================================================================================
' Rubriques

Public Function sGetRubrique(ByVal sThème As String, iSecteur As Integer, iRubrique As Integer) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetRubrique = colRubrique(sThème & iSecteur & "." & iRubrique)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  s = BDCurseurExpress("select ts_titre from titsec where ts_theme='" & sThème & "' and ts_secteur=" & iSecteur & " and ts_rubrique=" & iRubrique & " and ts_sousrub=0")
  If s = "" Then s = sRubriqueInexistante
  colRubrique.Add s, sThème & iSecteur & "." & iRubrique   ' On conserve le résultat
  sGetRubrique = s
End Function


Public Sub PurgeCacheRubriques(ByVal sThème As String, iSecteur As Integer, iRubrique As Integer)
  On Error Resume Next
  colRubrique.Remove sThème & iSecteur & "." & iRubrique
End Sub


' ================================================================================
' Sous-rubriques

Public Function sGetSousRub(ByVal sThème As String, iSecteur As Integer, iRubrique As Integer, iSousRub As Integer) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetSousRub = colSousRub(sThème & iSecteur & "." & iRubrique & "." & iSousRub)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  s = BDCurseurExpress("select ts_titre from titsec where ts_theme='" & sThème & "' and ts_secteur=" & iSecteur & " and ts_rubrique=" & iRubrique & " and ts_sousrub=" & iSousRub)
  If s = "" Then s = sSousRubInexistante
  colSousRub.Add s, sThème & iSecteur & "." & iRubrique & "." & iSousRub   ' On conserve le résultat
  sGetSousRub = s
End Function


Public Sub PurgeCacheSousRubs(ByVal sThème As String, iSecteur As Integer, iRubrique As Integer, iSousRub As Integer)
  On Error Resume Next
  colSousRub.Remove sThème & iSecteur & "." & iRubrique & "." & iSousRub
End Sub

