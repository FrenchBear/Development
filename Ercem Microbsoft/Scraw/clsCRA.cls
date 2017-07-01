VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "RA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Compte-Rendu d'Analyse: Implantation VB de la classe CRA générique de la bibliothèque C litcra"
' Classe RA
' Rapport d'Analyse: Implantation VB de la classe générique de la bibliothèque C litcra
'  4/09/1997 PV
' 13/10/1997 PV Fin de la sous-structure InfoAnalyse
' 14/10/1997 PV Structure compatible avec la biblio libcra v8
' 22/12/1997 PV dDateDebAnPrévue dans le champ datefinan
' 23/07/1998 PV Nouvelle structure RA
'  7/08/1998 PV InterventionOpérateur
' 15/10/1998 PV cCorrection
' 17/12/1998 PV Type de produit t1..t5; DLC2; Code famille
'  6/01/1999 PV Date de déconditionnement
' 18/11/1999 PV champ hClé2 pour LitCritère (alertes Sodexho)
' 28/11/2000 PV Propriété Get iNbBoîtes
'  3/12/2000 PV +sClasseDoc, dDateFinAn , iUTot, iUTotI, iUTotS, iUEnC, iUEnCI, iUEnCS, dPrix, cDevise, iHeureRécep, dDateRécepCli, sModèle, cStatusModif



Option Explicit


' Mode des données
Public iMode As eModeEdition      ' meCréation, meModification, meModificationRestreinte ou meVisualisation
Public iModeGermes As eModeGermes ' mgNonLu, mgLu
Public iModeBoîtes As eModeBoîtes ' mbNonLu, mbProblème, mbLu


' Tête de RA
Public sRef As String               ' Référence d'analyse
Public iNumSérie                    ' N° de la série de rattachement, à NULL ou -1 sans série/série annulée
Public iNumFRT                      ' N° de FRT
Public iIndiceEch As Long           ' Indice échantillon pour tubes IDEC
Public iRangEchSérie                ' Rang de l'échantillon dans la série (null en PC)
Public cEtatEch As String           ' Etat échantillon IDEC
Public dDateValEch                  ' Timestamp validation ech IDEC
Public iTraitéPar                   ' Échantillon traité par IDEC n° xxx
Public sCodeBarre                   ' Code barre scanné

Public sOptionsEdition As String    ' Options d'édition
Public sOptionsLabo As String       ' Options d'analyse

Public sClasseDoc As String         ' Classe de document (associé au critère)
 

' Plannings
Public dDateTour
Public hPers
Public hCp

' Client
Public sEtb As String               ' N° d'établissement, ou 0 (à créer)
Public iSec
Public iDrg
Public iDna
Public iGrp

Public sNomEtb As String
Public sPréfixeEtb As String
Public sRue As String
Public sLoc As String
Public sCPost As String
Public sBdist As String
Public cEtbProprio As String
Public sNomSec As String

Public iCodeCli                     ' Au moment de la saisie du RA
Public sInfoCli As String           ' idem

' Critère
Public sCritère                     ' Critère d'analyse
Public hVerCrit                     ' Version du critère
Public cMMéthode                    ' Métaméthode d'analyse
Public sTitreCritère As String      ' Libellé du critère
Public sCritèreInfo                 ' Critère du fichier produit
Public iRevivification
Public hClé2                        ' Utilisé pour les alertes Sodexho
Public sModèle
Public cStatusModif                 ' Status de modification, 1 car

' Produit
Public iPro
Public sNomPro
Public sCplNom
Public sObs
Public t1, t2, t3, t4, t5           ' Type de produit

' Prélèvement
Public hCadrePrél                   ' Cadre de prélèvement
Public hSecteurPrél                   ' Stade de prélèvement

Public dDatePrél                    ' Date de prélèvement
Public hHeurePrél                   ' Heure de prélèvement

Public dTemp
Public dTamb
Public dTrec

Public dDatePrép                    ' Date de préparation
Public hHeurePrép                   ' Heure de préparation

Public sDLC2                        ' DLC secondaire (texte)
Public sDateRetrait                 ' Pas une date !

Public hInterventionOpérateur       ' Intervention opérateur
Public hNiveauÉlaboration           ' Niveau d'élaboration
Public hÉtatPhysique                ' État physique
Public hÉtatDivision                ' État de division
Public hContenant                   ' Contenant
Public hCondit                      ' Mode de conditionnement / Conditionnement
Public hTechnologieFabrication      ' Technologie de fabrication
Public hLieuPrél                    ' Lieu de prélèvement (anc. cond de prél)
Public hCondPrél                    ' Conditions de prélèvement (nouvelles)

Public iFab
Public sNomFab

Public iDis
Public sNomDis

Public sCodeFab
Public sCodeEmb
Public sIdlot                       ' Identification de lot
Public sCodeArt                     ' Code article
Public sCodeFamille                 ' Code famille

Public dDateFab
Public dDateLivr
Public dDateCond                    ' Conditionnement
Public dDateDécond                  ' Déconditionnement
Public sDlc                         ' Pas une date
Public sDluo                        ' Pas une date
Public dDateRécepCli

Public hAspect                      ' Aspect de l'écrantillon
Public dDateRécep
Public hHeureRécep

Public hCPrin
Public hConcl
Public hConclInfo
Public hCPrinInfo

Public cCofrac                      ' O/N, si forcé o/n
Public bConclTrafiquée              ' Conclusion de l'informatique altérée

Public sRef0                        ' Référence d'origine / référence client

Public sMarque                      ' Marque
Public sUv                          ' Unité de vente


' Labo
Public dDateDebAnPrévue             ' Date prévue de début d'analyse (datefinan dans la base)
Public dDateDebAn                   ' Date à laquelle l'analyse a débuté
Public dDateFinAn                   ' Date de fin d'analyse
 
Public cLieuAn
Public cEtatLabo

Public bIncohérent
Public bIE
Public bFax
Public bEchCongelé                  ' Vrai si l'échantillon est congelé par le labo

Public hCodeTech

' SL (partie haute)
Public cEtatPH
Public hOperSaisPH
Public dDateSaisPH
Public hOperValPH
Public dDateValPH

Public hIngVal

Public hOperSaisLabo
Public dDateSaisLabo
Public hOperValLabo0
Public dDateValLabo0
Public hOperValLabo
Public dDateValLabo

Public dDateRécepInfo
Public dDateImpression

Public cLangue

Public sRemarques                   ' Remarques labo
Public sTxtConcl                    ' Texte de conclusion "décomprimé"
Public cCorrection                  ' à O si corrections effectuées (mis à O lors d'une dévalidation)
Public dTimeStamp
Public dDateCra

Public iSignatureInfo               ' Check-sum de l'enregistrement

' Rab, peuvent contenir NULL
Public iInfo1
Public sInfo2

' Unités
Public iUTot, iUTotI, iUTotS
Public iUEnC, iUEnCI, iUEnCS

' Facturation
Public dPrix
Public cDevise As String


' Germes
Public cGermes As GermesRecherchés  ' Liste des germes recherchés



Public Property Get iNbBoîtes() As Integer
  Dim g As GermeRecherché
  Dim n As Integer
  n = 0
  For Each g In cGermes
    n = n + g.cBoîtes.Count
  Next
  iNbBoîtes = n
End Property
