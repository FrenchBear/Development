Attribute VB_Name = "modCache"
' modCache
' Gestion de caches divers en m�moire, pour optimiser l'acc�s BD
' Module � part et pas int�gr� dans les feuilles de fa�on � ce que le cache soit
' commun � toutes les instances de feuilles
' 17/08/1999 PV
' 25/08/1999 PV Cas des syst�mes sans table feu (ex: massy1)
' 21/09/1999 PV Fin du cache des types (g�r� � part, cache recordset permanent)


Option Explicit

' Caches
Private colCrit�re As New Collection        ' Titre du crit�re, cl�=crit�re
Private colTitreGrille As New Collection    ' Titre de grille, cl�="T" & n� grille
Private colTitreSc�nario As New Collection  ' Titre de sc�nario, cl�="T" & n� grille & "/" & n� sc�nario
Private colNomSecteur As New Collection     ' Nom du secteur, cl�="S" & n� secteur
Private colNomGroupement As New Collection  ' Nom du groupement, cl�="G" & n� groupement
Private colTitreFEU As New Collection       ' Titre de la FEU, cl�="F" & n� FEU
Private colTitreFME As New Collection       ' Titre de la FEU, cl�="F" & n� FEU


' ================================================================================
' Crit�res

Public Function sGetCrit�re(ByVal sCrit As String) As String
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetCrit�re = colCrit�re(sCrit)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  ' Puis � d�faut dans la base
  Dim s As String
  s = BDCurseurExpress("select cri_titre1 from critere where cri_critere='" & sCrit & "'")
  colCrit�re.Add s, sCrit   ' On conserve le r�sultat
  sGetCrit�re = s
End Function


' ================================================================================
' EH: titres de grilles et sc�narios

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
  ' Puis � d�faut dans la base
  Dim s As String
  On Error Resume Next
  s = BDCurseurExpress("select tit_titre1 from titgri where tit_langue='" & cSyst�meLang & "' and tit_numgri=" & iNum)
  If Err Then s = "*** Pas de table titgri dans la base"
  On Error GoTo 0
  colTitreGrille.Add s, "T" & iNum   ' On conserve le r�sultat
  sGetTitreGrille = s
End Function


Public Function sGetTitreSc�nario(ByVal sNumGrille As String, ByVal sNumSc�nario As String) As String
  If sNumGrille = "" Or sNumSc�nario = "" Then
    sGetTitreSc�nario = ""
    Exit Function
  End If
  
  Dim iNumGrille As Integer, iNumSc�nario As Integer
  iNumGrille = Val(sNumGrille)
  iNumSc�nario = Val(sNumSc�nario)
  
  Dim sKey As String
  sKey = "T" & iNumGrille & "/" & iNumSc�nario
  
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetTitreSc�nario = colTitreSc�nario(sKey)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  
  ' Puis � d�faut dans la base
  Dim s As String
  On Error Resume Next
  s = BDCurseurExpress("select sce_titre from scenario where sce_numgri=" & iNumGrille & " and sce_scenario=" & iNumSc�nario)
  If Err Then s = "*** Pas de table sc�nario dans la base"
  On Error GoTo 0
  colTitreSc�nario.Add s, sKey   ' On conserve le r�sultat
  sGetTitreSc�nario = s
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
  ' Puis � d�faut dans la base
  Dim s As String
  s = BDCurseurExpress("select sec_nom from secteur where sec_numsec=" & iNum)
  colNomSecteur.Add s, "S" & iNum   ' On conserve le r�sultat
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
  ' Puis � d�faut dans la base
  Dim s As String
  s = BDCurseurExpress("select grf_nom from groupement where grf_numgrf=" & iNum)
  colNomGroupement.Add s, "G" & iNum   ' On conserve le r�sultat
  sGetNomGroupement = s
End Function


' ================================================================================
' FEU

Public Function sGetTitreFEU(ByVal sNum As String) As String
  Static bTableFEUabsente As Boolean
  
Restart:
  If bTableFEUabsente Then
    sGetTitreFEU = "*** Pas de table feu dans la base de donn�es"
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
  ' Puis � d�faut dans la base
  Dim s As String
  On Error Resume Next
  s = BDCurseurExpress("select feu_titre from feu where feu_numfeu=" & iNum)
  If Err <> 0 Then
    bTableFEUabsente = True
    GoTo Restart    ' Ok, on peut faire mieux, mais j'ai pas envie...
  Else
    On Error GoTo 0
    colTitreFEU.Add s, "F" & iNum   ' On conserve le r�sultat
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
  ' Puis � d�faut dans la base
  Dim s As String
  s = BDCurseurExpress("select fme_titre from fme where fme_numfme=" & iNum)
  colTitreFME.Add s, "F" & iNum   ' On conserve le r�sultat
  sGetTitreFME = s
End Function

