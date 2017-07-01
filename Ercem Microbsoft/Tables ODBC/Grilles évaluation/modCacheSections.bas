Attribute VB_Name = "modCacheSections"
' modCacheSections
' Gestion de cache des titres de section
' 27/12/1999 PV


Option Explicit

' Caches
Private colTh�me As New Collection         ' cl�=lettre de la section
Private colSecteur As New Collection       ' cl�=lettre de la section + n�secteur
Private colRubrique As New Collection      ' cl�=lettre de la section + n�secteur + "." + n�rubrique
Private colSousRub As New Collection       ' cl�=lettre de la section + n�secteur + "." + n�rubrique + "." + n�SousRub


Public Const sTh�meInexistant As String = "*** Th�me inexistant !"
Public Const sSecteurInexistant As String = "*** Secteur inexistant !"
Public Const sRubriqueInexistante As String = "*** Rubrique inexistante !"
Public Const sSousRubInexistante As String = "*** Sous-rubrique inexistante !"


' ================================================================================
' Th�mes

Public Function sGetTh�me(ByVal sTh�me As String) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetTh�me = colTh�me(sTh�me)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis � d�faut dans la base
  Dim s As String
  On Error Resume Next
  s = BDCurseurExpress("select ts_titre from titsec where ts_theme='" & sTh�me & "' and ts_secteur=0 and ts_rubrique=0 and ts_sousrub=0")
  On Error GoTo 0
  If s = "" Then s = sTh�meInexistant
  colTh�me.Add s, sTh�me   ' On conserve le r�sultat
  sGetTh�me = s
End Function


Public Sub PurgeCacheTh�mes(ByVal sTh�me As String)
  On Error Resume Next
  colTh�me.Remove sTh�me
End Sub


' ================================================================================
' Secteurs

Public Function sGetSecteur(ByVal sTh�me As String, iSecteur As Integer) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetSecteur = colSecteur(sTh�me & iSecteur)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis � d�faut dans la base
  Dim s As String
  s = BDCurseurExpress("select ts_titre from titsec where ts_theme='" & sTh�me & "' and ts_secteur=" & iSecteur & " and ts_rubrique=0 and ts_sousrub=0")
  If s = "" Then s = sSecteurInexistant
  colSecteur.Add s, sTh�me & iSecteur   ' On conserve le r�sultat
  sGetSecteur = s
End Function


Public Sub PurgeCacheSecteurs(ByVal sTh�me As String, iSecteur As Integer)
  On Error Resume Next
  colSecteur.Remove sTh�me & iSecteur
End Sub


' ================================================================================
' Rubriques

Public Function sGetRubrique(ByVal sTh�me As String, iSecteur As Integer, iRubrique As Integer) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetRubrique = colRubrique(sTh�me & iSecteur & "." & iRubrique)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis � d�faut dans la base
  Dim s As String
  s = BDCurseurExpress("select ts_titre from titsec where ts_theme='" & sTh�me & "' and ts_secteur=" & iSecteur & " and ts_rubrique=" & iRubrique & " and ts_sousrub=0")
  If s = "" Then s = sRubriqueInexistante
  colRubrique.Add s, sTh�me & iSecteur & "." & iRubrique   ' On conserve le r�sultat
  sGetRubrique = s
End Function


Public Sub PurgeCacheRubriques(ByVal sTh�me As String, iSecteur As Integer, iRubrique As Integer)
  On Error Resume Next
  colRubrique.Remove sTh�me & iSecteur & "." & iRubrique
End Sub


' ================================================================================
' Sous-rubriques

Public Function sGetSousRub(ByVal sTh�me As String, iSecteur As Integer, iRubrique As Integer, iSousRub As Integer) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetSousRub = colSousRub(sTh�me & iSecteur & "." & iRubrique & "." & iSousRub)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis � d�faut dans la base
  Dim s As String
  s = BDCurseurExpress("select ts_titre from titsec where ts_theme='" & sTh�me & "' and ts_secteur=" & iSecteur & " and ts_rubrique=" & iRubrique & " and ts_sousrub=" & iSousRub)
  If s = "" Then s = sSousRubInexistante
  colSousRub.Add s, sTh�me & iSecteur & "." & iRubrique & "." & iSousRub   ' On conserve le r�sultat
  sGetSousRub = s
End Function


Public Sub PurgeCacheSousRubs(ByVal sTh�me As String, iSecteur As Integer, iRubrique As Integer, iSousRub As Integer)
  On Error Resume Next
  colSousRub.Remove sTh�me & iSecteur & "." & iRubrique & "." & iSousRub
End Sub

