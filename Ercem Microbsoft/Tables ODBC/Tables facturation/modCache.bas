Attribute VB_Name = "modCacheEtablissement"
' modCache
' Gestion de caches divers en m�moire, pour optimiser l'acc�s BD
' Module � part et pas int�gr� dans les feuilles de fa�on � ce que le cache soit
' commun � toutes les instances de feuilles
' 17/08/1999 PV

Option Explicit

' Caches
Private colCrit�re As New Collection        ' Titre du crit�re, cl�=crit�re
Private colLibntype As New Collection       ' Titre du type, cl�=t1.t2.t3.t4.t5
Private colTitreGrille As New Collection    ' Titre de grille, cl�="T" & n� grille
Private colTitreSc�nario As New Collection  ' Titre de sc�nario, cl�="T" & n� grille & "/" & n� sc�nario
Private colNomSecteur As New Collection     ' Nom du secteur, cl�="S" & n� secteur
Private colNomGroupement As New Collection  ' Nom du Groupement, cl�="G" & n� Groupement
Private colTitreFEU As New Collection       ' Titre de la FEU, cl�="F" & n� FEU
Private colTitreFME As New Collection       ' Titre de la FEU, cl�="F" & n� FEU


Dim bSansGrilles As Boolean
Dim bSansTableScenario As Boolean

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
' Types

Public Function sGetLibntype(ByVal sT1 As String, ByVal sT2 As String, ByVal sT3 As String, ByVal sT4 As String, ByVal sT5 As String) As String
  Dim sKey As String
  
  sKey = sT1 & "." & sT2 & "." & sT3 & "." & sT4 & "." & sT5
  On Error Resume Next
  sGetLibntype = colLibntype(sKey)
  If Err = 0 Then Exit Function
  On Error GoTo 0
  
  Dim s As String
  s = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & sT1 & " and lnt_t2=" & sT2 & " and lnt_t3=" & sT3 & " and lnt_t4=" & sT4 & " and lnt_t5=" & sT5)
  colLibntype.Add s, sKey
  sGetLibntype = s
End Function

Public Sub EffaceCacheLibntype(ByVal sT1 As String, ByVal sT2 As String, ByVal sT3 As String, ByVal sT4 As String, ByVal sT5 As String)
  Dim sKey As String
  
  sKey = sT1 & "." & sT2 & "." & sT3 & "." & sT4 & "." & sT5
  On Error Resume Next
  colLibntype.Remove sKey
End Sub


' ================================================================================
' EH: titres de grilles et sc�narios

Public Function sGetTitreGrille(ByVal sNum As String) As String
  If bSansGrilles Or sNum = "" Then
    sGetTitreGrille = ""
    Exit Function
  End If
  
  Dim iNum As Integer
  iNum = Val(sNum)
  ' On cherche d'abord dans le cache
  On Error Resume Next
  sGetTitreGrille = colTitreGrille("T" & iNum)
  If Err = 0 Then Exit Function
  ' Puis � d�faut dans la base
  Dim s As String
  
  s = BDCurseurExpress("select tit_titre1 from titgri where tit_langue='" & cSyst�meLang & "' and tit_numgri=" & iNum)
  If Err Then
    bSansGrilles = True
    sGetTitreGrille = ""
    Exit Function
  End If
  On Error GoTo 0
  colTitreGrille.Add s, "T" & iNum   ' On conserve le r�sultat
  sGetTitreGrille = s
End Function


Public Function sGetTitreSc�nario(ByVal sNumGrille As String, ByVal sNumSc�nario As String) As String
  If bSansTableScenario Or sNumGrille = "" Or sNumSc�nario = "" Then
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
  On Error GoTo SansTableScenario
  s = BDCurseurExpress("select sce_titre from scenario where sce_numgri=" & iNumGrille & " and sce_scenario=" & iNumSc�nario)
  colTitreSc�nario.Add s, sKey   ' On conserve le r�sultat
  sGetTitreSc�nario = s
  Exit Function
  
SansTableScenario:
  bSansTableScenario = True
  Resume Next
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
  s = BDCurseurExpress("select grf_nom from Groupement where grf_numgrf=" & iNum)
  colNomGroupement.Add s, "G" & iNum   ' On conserve le r�sultat
  sGetNomGroupement = s
End Function


' ================================================================================
' FEU

Public Function sGetTitreFEU(ByVal sNum As String) As String
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
  s = BDCurseurExpress("select feu_titre from feu where feu_numfeu=" & iNum)
  colTitreFEU.Add s, "F" & iNum   ' On conserve le r�sultat
  sGetTitreFEU = s
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


