Attribute VB_Name = "modCache"
' modCache
' Gestion de caches divers en m�moire, pour optimiser l'acc�s BD
' Module � part et pas int�gr� dans les feuilles de fa�on � ce que le cache soit
' commun � toutes les instances de feuilles
' 17/08/1999 PV
' 25/08/1999 PV Cas des syst�mes sans table feu (ex: massy1)
' 21/09/1999 PV Fin du cache des types (g�r� � part, cache recordset permanent)
' 30/12/1999 PV N� de groupement alphanum�rique
'  8/09/2000 PV Gestion des tarifs
' 16/09/2000 PV Flags globaux indiquant l'absence d'une table


Option Explicit

' Caches
Private colCrit�re As New Collection        ' Titre du crit�re, cl�=crit�re
Private colTitreGrille As New Collection    ' Titre de grille, cl�="T" & n� grille
Private colTitreSc�nario As New Collection  ' Titre de sc�nario, cl�="T" & n� grille & "/" & n� sc�nario
Private colNomSecteur As New Collection     ' Nom du secteur, cl�="S" & n� secteur
Private colNomGroupement As New Collection  ' Nom du groupement, cl�="G" & n� groupement
Private colNomTarif As New Collection       ' Nom du tarif, cl�="T" & n� tarif
Private colTitreFEU As New Collection       ' Titre de la FEU, cl�="F" & n� FEU
Private colTitreFME As New Collection       ' Titre de la FEU, cl�="F" & n� FEU


' Flags indiquant qu'une table n'existe pas dans la base courante
Public bSansCrit�re As Boolean
Public bSansTitreGrille As Boolean
Public bSansTitreSc�nario As Boolean
Public bSansGroupement As Boolean
Public bSansSecteur As Boolean
Public bSansTarif As Boolean
Public bSansFEU As Boolean
Public bSansFME As Boolean



' ================================================================================
' Crit�res

Public Function sGetCrit�re(ByVal sCrit As String) As String
  If sCrit = "" Then
    sGetCrit�re = ""
    Exit Function
  End If
  If bSansCrit�re Then GoTo SansCrit�re
  
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetCrit�re = colCrit�re(sCrit)
  If Err = 0 Then Exit Function
  
  ' Puis � d�faut dans la base
  On Error GoTo SansCrit�re
  Dim s As String
  s = BDCurseurExpress("select cri_titre1 from critere where cri_critere='" & sCrit & "'")
  colCrit�re.Add s, sCrit   ' On conserve le r�sultat
  sGetCrit�re = s
  Exit Function
  
SansCrit�re:
  bSansCrit�re = True
  sGetCrit�re = "*** Table critere inaccessible"
End Function


' ================================================================================
' EH: titres de grilles et sc�narios

Public Function sGetTitreGrille(ByVal sNum As String) As String
  If sNum = "" Then
    sGetTitreGrille = ""
    Exit Function
  End If
  If bSansTitreGrille Then GoTo SansTitreGrille
  
  Dim iNum As Integer
  iNum = Val(sNum)
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetTitreGrille = colTitreGrille("T" & iNum)
  If Err = 0 Then Exit Function
  
  ' Puis � d�faut dans la base
  On Error GoTo SansTitreGrille
  Dim s As String
  s = BDCurseurExpress("select tit_titre1 from titgri where tit_langue='" & cSyst�meLang & "' and tit_numgri=" & iNum)
  On Error GoTo 0
  colTitreGrille.Add s, "T" & iNum   ' On conserve le r�sultat
  sGetTitreGrille = s
  Exit Function
  
SansTitreGrille:
  bSansTitreGrille = True
  sGetTitreGrille = "*** Table titgri inaccessible"
End Function


Public Function sGetTitreSc�nario(ByVal sNumGrille As String, ByVal sNumSc�nario As String) As String
  If sNumGrille = "" Or sNumSc�nario = "" Then
    sGetTitreSc�nario = ""
    Exit Function
  End If
  If bSansTitreSc�nario Then GoTo SansTitreSc�nario
  
  Dim iNumGrille As Integer, iNumSc�nario As Integer
  iNumGrille = Val(sNumGrille)
  iNumSc�nario = Val(sNumSc�nario)
  
  Dim sKey As String
  sKey = "T" & iNumGrille & "/" & iNumSc�nario
  
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetTitreSc�nario = colTitreSc�nario(sKey)
  If Err = 0 Then Exit Function
  
  ' Puis � d�faut dans la base
  On Error GoTo SansTitreSc�nario
  Dim s As String
  s = BDCurseurExpress("select sce_titre from scenario where sce_numgri=" & iNumGrille & " and sce_scenario=" & iNumSc�nario)
  On Error GoTo 0
  colTitreSc�nario.Add s, sKey   ' On conserve le r�sultat
  sGetTitreSc�nario = s
  Exit Function
  
SansTitreSc�nario:
  bSansTitreSc�nario = True
  sGetTitreSc�nario = "*** Table scenario inaccessible"
End Function


' ================================================================================
' Secteurs

Public Function sGetNomSecteur(ByVal sNum As String) As String
  If sNum = "" Then
    sGetNomSecteur = ""
    Exit Function
  End If
  If bSansSecteur Then GoTo SansSecteur
  
  Dim iNum As Long
  iNum = Val(sNum)
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetNomSecteur = colNomSecteur("S" & iNum)
  If Err = 0 Then Exit Function
  
  ' Puis � d�faut dans la base
  On Error GoTo SansSecteur
  Dim s As String
  s = BDCurseurExpress("select sec_nom from secteur where sec_numsec=" & iNum)
  colNomSecteur.Add s, "S" & iNum   ' On conserve le r�sultat
  sGetNomSecteur = s
  Exit Function
  
SansSecteur:
  bSansSecteur = True
  sGetNomSecteur = "*** Table secteur inaccessible"
End Function


' ================================================================================
' Groupements

Public Function sGetNomGroupement(ByVal sNum As String) As String
  If sNum = "" Then
    sGetNomGroupement = ""
    Exit Function
  End If
  If bSansGroupement Then GoTo SansGroupement
  
'  ' Groupements sp�ciaux...
'  If IsNumeric(sNum) Then
'    Dim ng As Long
'    ng = sNum
'    If ng >= 1000 And ng <= 1999 Then
'      sGetNomGroupement = "GROUPE DE FACTURATION FIMEBIO n�" & ng - 1000
'      Exit Function
'    End If
'  End If
  
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetNomGroupement = colNomGroupement("G" & sNum)
  If Err = 0 Then Exit Function
  
  ' Puis � d�faut dans la base
  On Error GoTo SansGroupement
  Dim s As String
  s = BDCurseurExpress("select grf_nom from groupement where grf_numgrf='" & sNum & "'")
  colNomGroupement.Add s, "G" & sNum   ' On conserve le r�sultat
  sGetNomGroupement = s
  Exit Function
  
SansGroupement:
  bSansGroupement = True
  sGetNomGroupement = "*** Table groupement inaccessible"
End Function


' ================================================================================
' Tarifs

Public Function sGetNomTarif(ByVal sNum As String) As String
  If sNum = "" Then
    sGetNomTarif = ""
    Exit Function
  End If
  If bSansTarif Then GoTo SansTarif
  
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetNomTarif = colNomTarif("T" & sNum)
  If Err = 0 Then Exit Function
  
  ' Puis � d�faut dans la base
  On Error GoTo SansTarif
  Dim s As String
  s = BDCurseurExpress("select tar_libelle from tarif where tar_numtarif=" & Val(sNum))
  colNomTarif.Add s, "T" & sNum   ' On conserve le r�sultat
  sGetNomTarif = s
  Exit Function
  
SansTarif:
  bSansTarif = True
  sGetNomTarif = "*** Table tarif inaccessible"
End Function


' ================================================================================
' FEU

Public Function sGetTitreFEU(ByVal sNum As String) As String
  If sNum = "" Then
    sGetTitreFEU = ""
    Exit Function
  End If
  If bSansFEU Then GoTo SansFEU
  
  Dim iNum As Integer
  iNum = Val(sNum)
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetTitreFEU = colTitreFEU("F" & iNum)
  If Err = 0 Then Exit Function
  
  ' Puis � d�faut dans la base
  On Error GoTo SansFEU
  Dim s As String
  s = BDCurseurExpress("select feu_titre from feu where feu_numfeu=" & iNum)
  On Error GoTo 0
  colTitreFEU.Add s, "F" & iNum   ' On conserve le r�sultat
  sGetTitreFEU = s
  Exit Function
  
SansFEU:
  bSansFEU = True
  sGetTitreFEU = "*** Table feu inaccessible"
End Function


' ================================================================================
' FME

Public Function sGetTitreFME(ByVal sNum As String) As String
  If sNum = "" Then
    sGetTitreFME = ""
    Exit Function
  End If
  If bSansFME Then GoTo SansFME
  
  Dim iNum As Integer
  iNum = Val(sNum)
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetTitreFME = colTitreFME("F" & iNum)
  If Err = 0 Then Exit Function
  
  ' Puis � d�faut dans la base
  On Error GoTo SansFME
  Dim s As String
  s = BDCurseurExpress("select fme_titre from fme where fme_numfme=" & iNum)
  colTitreFME.Add s, "F" & iNum   ' On conserve le r�sultat
  sGetTitreFME = s
  Exit Function
  
SansFME:
  bSansFME = True
  sGetTitreFME = "*** Table fme inaccessible"
End Function

