Attribute VB_Name = "AccRA"
Attribute VB_Description = "Fonctions d'accès aux CRAs. Pas de cache."
' AccRA
' Fonctions d'accès aux RAs
' Accès par référence, pas de service de cache !
'  4/09/97 PV
' 24/10/97 PV Validation séparée
' 27/10/97 PV L'écriture retourne le status COFRAC
' 30/10/97 PV N° d'établissement à NULL Ok, mais géré en VB par la valeur 0
' 27/07/98 PV LCRA2/ECRT2, avec 7 nouveaux champs
' 10/08/98 PV LCRA2/ECRT2 avec un huitième champ, hInterventionOpérateur
' 15/10/98 PV Champ supplémentaire, cCorrection
' 27/11/2000 PV RechercheRAdeFRT
' 10/08/2000 PV LCRA3/ECRT3 avec sClasseDoc, dDateFinAn , iUTot, iUTotI, iUTotS, iUEnC, iUEnCI, iUEnCS, dPrix, cDevise, iHeureRécep, dDateRécepCli, sModèle, cStatusModif, dDateDécond


Option Explicit

' Pointeur sur le dernier RA enregistré pour le mécanisme F5
Public craF5 As New RA      ' New RA crée un RA factice vierge pour tout accès avant le 1er enregistrement


' Lit complètement un RA
Public Function LitRA(ByVal iTable As eTableRA, ByVal sRef As String) As RA
  Bloquer
    Dim br As New Rev
    br.AddField iTable, sRef
    tcps.Envoie "LCRA3 " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then
      Relâcher
      Set LitRA = Nothing
      Exit Function
    End If
    
    Dim cra As New RA
    Dim v As Variant
    br.Buffer = sLigne
    
    br.GetField v: cra.sRef = v
    br.GetField v: cra.iNumSérie = v
    br.GetField v: cra.iNumFRT = v
    br.GetField v: cra.iIndiceEch = v
    br.GetField v: cra.iRangEchSérie = v
    br.GetField v: cra.cEtatEch = v
    br.GetField v: cra.dDateValEch = v
    br.GetField v: cra.iTraitéPar = v
    br.GetField v: cra.sCodeBarre = v
    
    br.GetField v: cra.sOptionsEdition = v
    br.GetField v: cra.sOptionsLabo = v
    
    br.GetField v: cra.hCadrePrél = v
    br.GetField v: cra.cMMéthode = v
    
    br.GetField v: cra.bIE = v
    br.GetField v: cra.bIncohérent = v
    br.GetField v: cra.bFax = v
    br.GetField v: cra.bEchCongelé = v
    
    br.GetField v: cra.dDateTour = v
    br.GetField v: cra.hPers = v
    br.GetField v: cra.hCp = v
    
    br.GetField v: cra.sEtb = NZ(v)
    
    br.GetField v: cra.iSec = v
    br.GetField v: cra.iDrg = v
    br.GetField v: cra.iDna = v
    br.GetField v: cra.iGrp = v
    
    br.GetField v: cra.sNomEtb = v
    br.GetField v: cra.sPréfixeEtb = v
    br.GetField v: cra.sRue = v
    br.GetField v: cra.sLoc = v
    br.GetField v: cra.sCPost = v
    br.GetField v: cra.sBdist = v
    br.GetField v: cra.cEtbProprio = v
    br.GetField v: cra.sNomSec = v
    
    br.GetField v: cra.iCodeCli = v
    br.GetField v: cra.sInfoCli = v
    
    br.GetField v: cra.sCritère = v
    br.GetField v: cra.hVerCrit = v
    br.GetField v: cra.sCritèreInfo = v
    
    br.GetField v: cra.iPro = v
    br.GetField v: cra.sNomPro = v
    br.GetField v: cra.sCplNom = v
    br.GetField v: cra.sObs = v
    
    br.GetField v: cra.sMarque = v
    br.GetField v: cra.sUv = v
    br.GetField v: cra.hCondit = v
    br.GetField v: cra.sCodeArt = v
    br.GetField v: cra.dDatePrél = v
    br.GetField v: cra.hHeurePrél = v
    br.GetField v: cra.dTemp = v
    br.GetField v: cra.dTamb = v
    br.GetField v: cra.dTrec = v
    br.GetField v: cra.dDatePrép = v
    br.GetField v: cra.hHeurePrép = v
    br.GetField v: cra.sDateRetrait = v
    br.GetField v: cra.hLieuPrél = v
    br.GetField v: cra.iFab = v
    br.GetField v: cra.sNomFab = v
    br.GetField v: cra.iDis = v
    br.GetField v: cra.sNomDis = v
    br.GetField v: cra.sCodeFab = v
    br.GetField v: cra.sCodeEmb = v
    br.GetField v: cra.sIdlot = v
    br.GetField v: cra.dDateFab = v
    br.GetField v: cra.dDateLivr = v
    br.GetField v: cra.dDateCond = v
    br.GetField v: cra.sDlc = v
    br.GetField v: cra.sDluo = v
    br.GetField v: cra.hAspect = v
    br.GetField v: cra.dDateRécep = v
    br.GetField v: cra.hCPrin = v
    br.GetField v: cra.hConcl = v
    br.GetField v: cra.hConclInfo = v
    br.GetField v: cra.hCPrinInfo = v
    br.GetField v: cra.cCofrac = v
    br.GetField v: cra.bConclTrafiquée = v
    br.GetField v: cra.sRef0 = v
    br.GetField v: cra.dDateDebAn = v
    br.GetField v: cra.dDateDebAnPrévue = v         ' dDateFinAn dans la base
    br.GetField v: cra.cLieuAn = v
    br.GetField v: cra.cEtatPH = v
    br.GetField v: cra.cEtatLabo = v
    
    br.GetField v: cra.hCodeTech = v
    
    br.GetField v: cra.hOperSaisPH = v
    br.GetField v: cra.dDateSaisPH = v
    br.GetField v: cra.hOperValPH = v
    br.GetField v: cra.dDateValPH = v
    
    br.GetField v: cra.hIngVal = v
    
    br.GetField v: cra.hOperSaisLabo = v
    br.GetField v: cra.dDateSaisLabo = v
    br.GetField v: cra.hOperValLabo0 = v
    br.GetField v: cra.dDateValLabo0 = v
    br.GetField v: cra.hOperValLabo = v
    br.GetField v: cra.dDateValLabo = v
    
    br.GetField v: cra.dDateRécepInfo = v
    br.GetField v: cra.dDateImpression = v
    
    br.GetField v: cra.cLangue = v
    
    br.GetField v: cra.sRemarques = v
    br.GetField v: cra.sTxtConcl = v
    br.GetField v: cra.cCorrection = v
    br.GetField v: cra.dTimeStamp = v
    br.GetField v: cra.dDateCra = v
    
    br.GetField v: cra.iSignatureInfo = v
    
    ' Nouveaux champs de LCRA2
    br.GetField v: cra.hInterventionOpérateur = v
    br.GetField v: cra.hNiveauÉlaboration = v
    br.GetField v: cra.hÉtatPhysique = v
    br.GetField v: cra.hContenant = v
    br.GetField v: cra.hÉtatDivision = v
    br.GetField v: cra.hTechnologieFabrication = v
    br.GetField v: cra.hCondPrél = v
    br.GetField v: cra.hSecteurPrél = v

    br.GetField v: cra.iInfo1 = v
    br.GetField v: cra.sInfo2 = v

    ' Nouveaux champs de LCRA3
    br.GetField v: cra.sClasseDoc = v
    br.GetField v: cra.dDateFinAn = v
    br.GetField v: cra.iUTot = v
    br.GetField v: cra.iUTotI = v
    br.GetField v: cra.iUTotS = v
    br.GetField v: cra.iUEnC = v
    br.GetField v: cra.iUEnCI = v
    br.GetField v: cra.iUEnCS = v
    br.GetField v: cra.dPrix = v
    br.GetField v: cra.cDevise = v
    br.GetField v: cra.hHeureRécep = v
    br.GetField v: cra.dDateRécepCli = v
    br.GetField v: cra.sModèle = v
    br.GetField v: cra.sDLC2 = v
    br.GetField v: cra.sCodeFamille = v
    br.GetField v: cra.cStatusModif = v
    br.GetField v: cra.dDateDécond = v

    ' Lecture de la liste des germes
    Set cra.cGermes = New GermesRecherchés
    
    Do
      sLigne = tcps.Reçoit
      If Left(sLigne, 2) = "->" Then Exit Do
      br.Buffer = sLigne
      
      Dim g As GermeRecherché
      Set g = New GermeRecherché
      
      br.GetField v                    ' Référence ignorée
      br.GetField v: g.hLigne = v      ' hLigne
      br.GetField v: g.iGerme = v      ' hRefPar
      br.GetField v: g.sMéthode = v    ' cMethode
      br.GetField v: g.sRésultat = v   ' szResultat
      br.GetField v: g.m = v           ' szCrit
      br.GetField v: g.sUnité = v      ' szUnité
      br.GetField v: g.s = v           ' iSeuil
      br.GetField v: g.iCPar = v       ' hCPar
      br.GetField v: g.cSpécifCli = v  ' cSpecifCli
      br.GetField v: g.dDateFinAn = v  ' iDateFinAn
      br.GetField v: g.cEtatLabo = v   ' cEtatLabo
      br.GetField v: g.iOperSais = v   ' hOperSais
      br.GetField v: g.dDateSais = v   ' iDateSais
      br.GetField v: g.iOperVal = v    ' hOperVal
      br.GetField v: g.dDateVal = v    ' iDateVal
      br.GetField v: g.timestamp = v   ' iTimeStamp
      br.GetField v
            
      If v = "+" Then
        g.bOrigineCritère = False
        g.bGermeModifié = False
      ElseIf v = "M" Then
        g.bOrigineCritère = True
        g.bGermeModifié = True
      Else
        g.bOrigineCritère = True
        g.bGermeModifié = False
      End If
      
      br.GetField v: g.sSensibilité = v
      br.GetField v: g.dPrix = v
      br.GetField v: g.cDevise = v
      
      
      ' On ajoute le germe à la collection
      cra.cGermes.AddGermeRecherché g
    Loop
    
  Relâcher
  
  ' Variables d'état en mémoire
  cra.iModeGermes = mgLu
  cra.iModeBoîtes = mbNonLu
  Set LitRA = cra
End Function



' Écrit complètement un RA
' Modifie le champ cCOFRAC dans le RA
Public Sub EcritRA(ByVal iTable As eTableRA, ByRef cra As RA)
  Dim br As New Rev
  
  br.AddField cra.sRef
  br.AddField cra.iNumSérie
  br.AddField cra.iNumFRT
  br.AddField cra.iIndiceEch
  br.AddField cra.iRangEchSérie
  br.AddField cra.cEtatEch
  br.AddField cra.dDateValEch
  br.AddField cra.iTraitéPar
  br.AddField cra.sCodeBarre

  br.AddField cra.sOptionsEdition
  br.AddField cra.sOptionsLabo
  
  br.AddField cra.hCadrePrél
  br.AddField cra.cMMéthode
  
  br.AddField cra.bIE
  br.AddField cra.bIncohérent
  br.AddField cra.bFax
  br.AddField cra.bEchCongelé
  
  br.AddField cra.dDateTour
  br.AddField cra.hPers
  br.AddField cra.hCp
  
  br.AddField cra.sEtb
  br.AddField cra.iSec
  br.AddField cra.iDrg
  br.AddField cra.iDna
  br.AddField cra.iGrp
  
  br.AddField cra.sNomEtb
  br.AddField cra.sPréfixeEtb
  br.AddField cra.sRue
  br.AddField cra.sLoc
  br.AddField cra.sCPost
  br.AddField cra.sBdist
  br.AddField cra.cEtbProprio
  br.AddField cra.sNomSec
  
  br.AddField cra.iCodeCli
  br.AddField cra.sInfoCli
  
  br.AddField cra.sCritère
  br.AddField cra.hVerCrit
  br.AddField cra.sCritèreInfo
  
  br.AddField cra.iPro
  br.AddField cra.sNomPro
  br.AddField cra.sCplNom
  br.AddField cra.sObs
  
  br.AddField cra.sMarque
  br.AddField cra.sUv
  br.AddField cra.hCondit
  br.AddField cra.sCodeArt
  br.AddField cra.dDatePrél
  br.AddField cra.hHeurePrél
  br.AddField cra.dTemp
  br.AddField cra.dTamb
  br.AddField cra.dTrec
  br.AddField cra.dDatePrép
  br.AddField cra.hHeurePrép
  br.AddField CStr(cra.sDateRetrait)
  br.AddField cra.hLieuPrél
  br.AddField cra.iFab
  br.AddField cra.sNomFab
  br.AddField cra.iDis
  br.AddField cra.sNomDis
  br.AddField cra.sCodeFab
  br.AddField cra.sCodeEmb
  br.AddField cra.sIdlot
  br.AddField cra.dDateFab
  br.AddField cra.dDateLivr
  br.AddField cra.dDateCond
  br.AddField CStr(cra.sDlc)
  br.AddField CStr(cra.sDluo)
  br.AddField cra.hAspect
  br.AddField cra.dDateRécep
  br.AddField cra.hCPrin
  br.AddField cra.hConcl
  br.AddField cra.hConclInfo
  br.AddField cra.hCPrinInfo
  br.AddField cra.cCofrac
  br.AddField cra.bConclTrafiquée
  br.AddField cra.sRef0
  br.AddField cra.dDateDebAn
  br.AddField cra.dDateDebAnPrévue            ' dDateFinAn dans la base
  br.AddField cra.cLieuAn
  br.AddField cra.cEtatPH
  br.AddField cra.cEtatLabo
  
  br.AddField cra.hCodeTech
  
  br.AddField cra.hOperSaisPH
  br.AddField cra.dDateSaisPH
  br.AddField cra.hOperValPH
  br.AddField cra.dDateValPH
  
  br.AddField cra.hIngVal
  
  br.AddField cra.hOperSaisLabo
  br.AddField cra.dDateSaisLabo
  br.AddField cra.hOperValLabo0
  br.AddField cra.dDateValLabo0
  br.AddField cra.hOperValLabo
  br.AddField cra.dDateValLabo
  
  br.AddField cra.dDateRécepInfo
  br.AddField cra.dDateImpression
  
  br.AddField cra.cLangue
  
  br.AddField cra.sRemarques
  br.AddField cra.sTxtConcl
  br.AddField cra.cCorrection
  br.AddField cra.dTimeStamp
  br.AddField cra.dDateCra
  
  br.AddField cra.iSignatureInfo
  
  ' Nouveaux champs de ECRT2
  br.AddField cra.hInterventionOpérateur
  br.AddField cra.hNiveauÉlaboration
  br.AddField cra.hÉtatPhysique
  br.AddField cra.hContenant
  br.AddField cra.hÉtatDivision
  br.AddField cra.hTechnologieFabrication
  br.AddField cra.hCondPrél
  br.AddField cra.hSecteurPrél

  br.AddField cra.iInfo1
  br.AddField cra.sInfo2

  ' Nouveaux champs de ECRT3
  br.AddField cra.sClasseDoc
  br.AddField cra.dDateFinAn
  br.AddField cra.iUTot
  br.AddField cra.iUTotI
  br.AddField cra.iUTotS
  br.AddField cra.iUEnC
  br.AddField cra.iUEnCI
  br.AddField cra.iUEnCS
  br.AddField cra.dPrix
  br.AddField cra.cDevise
  br.AddField cra.hHeureRécep
  br.AddField cra.dDateRécepCli
  br.AddField cra.sModèle
  br.AddField cra.sDLC2
  br.AddField cra.sCodeFamille
  br.AddField cra.cStatusModif
  br.AddField cra.dDateDécond


  ' Écriture de la tête
  Bloquer
    tcps.Envoie "ECRT3 " & br.Buffer
          
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  
  
    ' Écriture de la liste des germes
    Dim g As GermeRecherché
    Dim cStatus As String
    
    For Each g In cra.cGermes
      br.Clear
      
      br.AddField cra.sRef
      br.AddField g.hLigne          ' hLigne
      br.AddField g.iGerme          ' hRefPar
      br.AddField g.sMéthode        ' cMethode
      br.AddField CStr(g.sRésultat) ' szResultat
      br.AddField CStr(g.m)         ' szCrit
      br.AddField g.sUnité          ' szUnité
      br.AddField VN(g.s)           ' iSeuil
      br.AddField g.iCPar           ' hCPar
      br.AddField g.cSpécifCli      ' cSpecifCli
      br.AddField g.dDateFinAn      ' iDateFinAn
      br.AddField g.cEtatLabo       ' cEtatLabo
      br.AddField g.iOperSais       ' hOperSais
      br.AddField g.dDateSais       ' iDateSais
      br.AddField g.iOperVal        ' hOperVal
      br.AddField g.dDateVal        ' iDateVal
      br.AddField g.timestamp       ' iTimeStamp
      br.AddField Trim(g.cStatus)
      br.AddField g.sSensibilité
      br.AddField g.dPrix
      br.AddField g.cDevise

      tcps.Envoie "ECRC3 " & br.Buffer
      
      sLigne = tcps.Reçoit
      If Left(sLigne, 2) <> "->" Then Stop
    Next
    
    
    ' Mise à jour de la base de données
    br.Clear
    br.AddField iTable
    br.AddField cra.sRef

    tcps.Envoie "ECRA " & br.Buffer
    
    ' On récupère le status COFRAC
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then Stop
    br.Buffer = sLigne
    Dim bCOFRAC As Boolean
    br.GetField bCOFRAC
    cra.cCofrac = IIf(bCOFRAC, "O", "N")
    
    ' Contrôle final
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  Relâcher
  
  ' On mémorise les données pour le mécanisme de rappel F5
  Set craF5 = cra
End Sub


' Efface un RA
Public Function DétruitRA(ByVal iTable As eTableRA, ByVal sRef As String)
  Dim br As New Rev
  
  br.AddField iTable, sRef
  
  Bloquer
    tcps.Envoie "DCRA " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  Relâcher
End Function



' Valide ou invalide la salsie de la partie haute d'un RA
Public Function ValideRA(iTable As eTableRA, cra As RA)
  Dim br As New Rev
  Dim sLigne As String
  
  br.AddField iTable
  br.AddField cra.sRef
  br.AddField cra.hOperValPH       ' A NULL pour annuler la validation
  
  Bloquer
    tcps.Envoie "VCRA " & br.Buffer
    
    ' Contrôle final
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  Relâcher
End Function



' ===========================================================================
' Enumération des RA d'une FRT

Public Function RechercheRAdeFRT(iFRT As Long) As Collection
  Dim colRef As Collection
  Set colRef = EnumRefFRT(iFRT)
  
  Dim colRA As New Collection
  Dim sRef As Variant
  Dim r As RA
  For Each sRef In colRef
    Set r = LitRA(tcLabo, sRef)
    LitBoîtes (sRef), r       ' Chargement de la liste des boîtes
    
    colRA.Add r
    Set r = Nothing
  Next
  Set RechercheRAdeFRT = colRA
End Function

