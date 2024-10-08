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
Attribute VB_Description = "Compte-Rendu d'Analyse: Implantation VB de la classe CRA g�n�rique de la biblioth�que C litcra"
' Classe RA
' Rapport d'Analyse: Implantation VB de la classe g�n�rique de la biblioth�que C litcra
'  4/09/1997 PV
' 13/10/1997 PV Fin de la sous-structure InfoAnalyse
' 14/10/1997 PV Structure compatible avec la biblio libcra v8
' 22/12/1997 PV dDateDebAnPr�vue dans le champ datefinan
' 23/07/1998 PV Nouvelle structure RA
'  7/08/1998 PV InterventionOp�rateur
' 15/10/1998 PV cCorrection
' 17/12/1998 PV Type de produit t1..t5; DLC2; Code famille
'  6/01/1999 PV Date de d�conditionnement
' 18/11/1999 PV champ hCl�2 pour LitCrit�re (alertes Sodexho)
' 28/11/2000 PV Propri�t� Get iNbBo�tes
'  3/12/2000 PV +sClasseDoc, dDateFinAn , iUTot, iUTotI, iUTotS, iUEnC, iUEnCI, iUEnCS, dPrix, cDevise, iHeureR�cep, dDateR�cepCli, sMod�le, cStatusModif



Option Explicit


' Mode des donn�es
Public iMode As eModeEdition      ' meCr�ation, meModification, meModificationRestreinte ou meVisualisation
Public iModeGermes As eModeGermes ' mgNonLu, mgLu
Public iModeBo�tes As eModeBo�tes ' mbNonLu, mbProbl�me, mbLu


' T�te de RA
Public sRef As String               ' R�f�rence d'analyse
Public iNumS�rie                    ' N� de la s�rie de rattachement, � NULL ou -1 sans s�rie/s�rie annul�e
Public iNumFRT                      ' N� de FRT
Public iIndiceEch As Long           ' Indice �chantillon pour tubes IDEC
Public iRangEchS�rie                ' Rang de l'�chantillon dans la s�rie (null en PC)
Public cEtatEch As String           ' Etat �chantillon IDEC
Public dDateValEch                  ' Timestamp validation ech IDEC
Public iTrait�Par                   ' �chantillon trait� par IDEC n� xxx
Public sCodeBarre                   ' Code barre scann�

Public sOptionsEdition As String    ' Options d'�dition
Public sOptionsLabo As String       ' Options d'analyse

Public sClasseDoc As String         ' Classe de document (associ� au crit�re)
 

' Plannings
Public dDateTour
Public hPers
Public hCp

' Client
Public sEtb As String               ' N� d'�tablissement, ou 0 (� cr�er)
Public iSec
Public iDrg
Public iDna
Public iGrp

Public sNomEtb As String
Public sPr�fixeEtb As String
Public sRue As String
Public sLoc As String
Public sCPost As String
Public sBdist As String
Public cEtbProprio As String
Public sNomSec As String

Public iCodeCli                     ' Au moment de la saisie du RA
Public sInfoCli As String           ' idem

' Crit�re
Public sCrit�re                     ' Crit�re d'analyse
Public hVerCrit                     ' Version du crit�re
Public cMM�thode                    ' M�tam�thode d'analyse
Public sTitreCrit�re As String      ' Libell� du crit�re
Public sCrit�reInfo                 ' Crit�re du fichier produit
Public iRevivification
Public hCl�2                        ' Utilis� pour les alertes Sodexho
Public sMod�le
Public cStatusModif                 ' Status de modification, 1 car

' Produit
Public iPro
Public sNomPro
Public sCplNom
Public sObs
Public t1, t2, t3, t4, t5           ' Type de produit

' Pr�l�vement
Public hCadrePr�l                   ' Cadre de pr�l�vement
Public hSecteurPr�l                   ' Stade de pr�l�vement

Public dDatePr�l                    ' Date de pr�l�vement
Public hHeurePr�l                   ' Heure de pr�l�vement

Public dTemp
Public dTamb
Public dTrec

Public dDatePr�p                    ' Date de pr�paration
Public hHeurePr�p                   ' Heure de pr�paration

Public sDLC2                        ' DLC secondaire (texte)
Public sDateRetrait                 ' Pas une date !

Public hInterventionOp�rateur       ' Intervention op�rateur
Public hNiveau�laboration           ' Niveau d'�laboration
Public h�tatPhysique                ' �tat physique
Public h�tatDivision                ' �tat de division
Public hContenant                   ' Contenant
Public hCondit                      ' Mode de conditionnement / Conditionnement
Public hTechnologieFabrication      ' Technologie de fabrication
Public hLieuPr�l                    ' Lieu de pr�l�vement (anc. cond de pr�l)
Public hCondPr�l                    ' Conditions de pr�l�vement (nouvelles)

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
Public dDateD�cond                  ' D�conditionnement
Public sDlc                         ' Pas une date
Public sDluo                        ' Pas une date
Public dDateR�cepCli

Public hAspect                      ' Aspect de l'�crantillon
Public dDateR�cep
Public hHeureR�cep

Public hCPrin
Public hConcl
Public hConclInfo
Public hCPrinInfo

Public cCofrac                      ' O/N, si forc� o/n
Public bConclTrafiqu�e              ' Conclusion de l'informatique alt�r�e

Public sRef0                        ' R�f�rence d'origine / r�f�rence client

Public sMarque                      ' Marque
Public sUv                          ' Unit� de vente


' Labo
Public dDateDebAnPr�vue             ' Date pr�vue de d�but d'analyse (datefinan dans la base)
Public dDateDebAn                   ' Date � laquelle l'analyse a d�but�
Public dDateFinAn                   ' Date de fin d'analyse
 
Public cLieuAn
Public cEtatLabo

Public bIncoh�rent
Public bIE
Public bFax
Public bEchCongel�                  ' Vrai si l'�chantillon est congel� par le labo

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

Public dDateR�cepInfo
Public dDateImpression

Public cLangue

Public sRemarques                   ' Remarques labo
Public sTxtConcl                    ' Texte de conclusion "d�comprim�"
Public cCorrection                  ' � O si corrections effectu�es (mis � O lors d'une d�validation)
Public dTimeStamp
Public dDateCra

Public iSignatureInfo               ' Check-sum de l'enregistrement

' Rab, peuvent contenir NULL
Public iInfo1
Public sInfo2

' Unit�s
Public iUTot, iUTotI, iUTotS
Public iUEnC, iUEnCI, iUEnCS

' Facturation
Public dPrix
Public cDevise As String


' Germes
Public cGermes As GermesRecherch�s  ' Liste des germes recherch�s



Public Property Get iNbBo�tes() As Integer
  Dim g As GermeRecherch�
  Dim n As Integer
  n = 0
  For Each g In cGermes
    n = n + g.cBo�tes.Count
  Next
  iNbBo�tes = n
End Property
