Attribute VB_Name = "modCache"
' modCache
' Gestion de caches divers en mémoire, pour optimiser l'accès BD
' Module à part et pas intégré dans les feuilles de façon à ce que le cache soit
' commun à toutes les instances de feuilles
' 17/08/1999 PV
' 25/08/1999 PV Cas des systèmes sans table feu (ex: massy1)
' 21/09/1999 PV Fin du cache des types (géré à part, cache recordset permanent)


Option Explicit

' Caches
Private colCritère As New Collection        ' Titre du critère, clé=critère
Private colTitreGrille As New Collection    ' Titre de grille, clé="T" & n° grille
Private colTitreScénario As New Collection  ' Titre de scénario, clé="T" & n° grille & "/" & n° scénario
Private colNomSecteur As New Collection     ' Nom du secteur, clé="S" & n° secteur
Private colNomGroupement As New Collection  ' Nom du groupement, clé="G" & n° groupement
Private colTitreFEU As New Collection       ' Titre de la FEU, clé="F" & n° FEU
Private colTitreFME As New Collection       ' Titre de la FEU, clé="F" & n° FEU


' ================================================================================
' Critères

Public Function sGetCritère(ByVal sCrit As String) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetCritère = colCritère(sCrit)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  s = BDCurseurExpress("select cri_titre1 from critere where cri_critere='" & sCrit & "'")
  colCritère.Add s, sCrit   ' On conserve le résultat
  sGetCritère = s
End Function


' ================================================================================
' EH: titres de grilles et scénarios

Public Function sGetTitreGrille(ByVal sNum As String) As String
  If sNum = "" Then
    sGetTitreGrille = ""
    Exit Function
  End If
  
  Dim iNum As Integer
  iNum = Val(sNum)
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetTitreGrille = colTitreGrille("T" & iNum)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  On Error Resume Next
  s = BDCurseurExpress("select tit_titre1 from titgri where tit_langue='" & cSystèmeLang & "' and tit_numgri=" & iNum)
  If Err Then s = "*** Pas de table titgri dans la base"
  On Error GoTo 0
  colTitreGrille.Add s, "T" & iNum   ' On conserve le résultat
  sGetTitreGrille = s
End Function


Public Function sGetTitreScénario(ByVal sNumGrille As String, ByVal sNumScénario As String) As String
  If sNumGrille = "" Or sNumScénario = "" Then
    sGetTitreScénario = ""
    Exit Function
  End If
  
  Dim iNumGrille As Integer, iNumScénario As Integer
  iNumGrille = Val(sNumGrille)
  iNumScénario = Val(sNumScénario)
  
  Dim sKey As String
  sKey = "T" & iNumGrille & "/" & iNumScénario
  
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetTitreScénario = colTitreScénario(sKey)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  
  ' Puis à défaut dans la base
  Dim s As String
  On Error Resume Next
  s = BDCurseurExpress("select sce_titre from scenario where sce_numgri=" & iNumGrille & " and sce_scenario=" & iNumScénario)
  If Err Then s = "*** Pas de table scénario dans la base"
  On Error GoTo 0
  colTitreScénario.Add s, sKey   ' On conserve le résultat
  sGetTitreScénario = s
End Function


' ================================================================================
' Secteurs

Public Function sGetNomSecteur(ByVal sNum As String) As String
  If sNum = "" Then
    sGetNomSecteur = ""
    Exit Function
  End If
  
  Dim iNum As Long
  iNum = Val(sNum)
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetNomSecteur = colNomSecteur("S" & iNum)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  s = BDCurseurExpress("select sec_nom from secteur where sec_numsec=" & iNum)
  colNomSecteur.Add s, "S" & iNum   ' On conserve le résultat
  sGetNomSecteur = s
End Function


' ================================================================================
' Groupements

Public Function sGetNomGroupement(ByVal sNum As String) As String
  If sNum = "" Then
    sGetNomGroupement = ""
    Exit Function
  End If
  
  Dim iNum As Long
  iNum = Val(sNum)
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetNomGroupement = colNomGroupement("G" & iNum)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  s = BDCurseurExpress("select grf_nom from groupement where grf_numgrf=" & iNum)
  colNomGroupement.Add s, "G" & iNum   ' On conserve le résultat
  sGetNomGroupement = s
End Function


' ================================================================================
' FEU

Public Function sGetTitreFEU(ByVal sNum As String) As String
  Static bTableFEUabsente As Boolean
  
Restart:
  If bTableFEUabsente Then
    sGetTitreFEU = "*** Pas de table feu dans la base de données"
    Exit Function
  End If
  
  If sNum = "" Then
    sGetTitreFEU = ""
    Exit Function
  End If
  
  Dim iNum As Integer
  iNum = Val(sNum)
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetTitreFEU = colTitreFEU("F" & iNum)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  On Error Resume Next
  s = BDCurseurExpress("select feu_titre from feu where feu_numfeu=" & iNum)
  If Err <> 0 Then
    bTableFEUabsente = True
    GoTo Restart    ' Ok, on peut faire mieux, mais j'ai pas envie...
  Else
    On Error GoTo 0
    colTitreFEU.Add s, "F" & iNum   ' On conserve le résultat
    sGetTitreFEU = s
  End If
End Function


' ================================================================================
' FME

Public Function sGetTitreFME(ByVal sNum As String) As String
  If sNum = "" Then
    sGetTitreFME = ""
    Exit Function
  End If
  
  Dim iNum As Integer
  iNum = Val(sNum)
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetTitreFME = colTitreFME("F" & iNum)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis à défaut dans la base
  Dim s As String
  s = BDCurseurExpress("select fme_titre from fme where fme_numfme=" & iNum)
  colTitreFME.Add s, "F" & iNum   ' On conserve le résultat
  sGetTitreFME = s
End Function

