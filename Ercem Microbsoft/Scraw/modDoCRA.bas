Attribute VB_Name = "modDoRA"
Attribute VB_Description = "Points d'entrée d'accès à la structure CRA"
' modDoRA
' Points d'entrée d'accès à la structure RA
' 16/10/1997 PV
' 14/11/1997 PV Gestion du n° de série -1; meModificationSpéciale
' 23/12/1997 PV InitialiseHiérarchie ne fait rien pour un établissement en cours de création
' 10/04/1998 PV Affichage du sablier pendant l'ouverture de la fenêtre de RA
' 19/05/1998 PV Modif spéciale interdite si étatlabo à 4
' 30/03/1999 PV Métaméthodes A,B,V gérées
' 24/08/1999 PV Par défaut, date de réception = date du jour pour les nouveaux rapports
'  4/12/2000 PV Champs CRA3 initialisés

Option Explicit

' Valeurs possibles poir le champ iMode de la structure RA
Public Enum eModeEdition
  meCréation = 1              ' Tous les champs sont accessibles
  meModification = 2          ' idem (modification complète)
  meModificationRéduite = 3   ' Critère/germes/boîtes inaccessibles
  meVisualisation = 4         ' Aucun champ accessible
  meModificationSpéciale = 5  ' Modification après validation (=meModificationRéduite)
End Enum

' Tables en paramètre à litcra de la biblio libcra
Public Enum eTableRA
  tcBacterio = 0
  tcPhysicoChimie = 1
  tcLabo = 2
  tcLaboSec = 3
End Enum


' S'il existe déjà une fenêtre ouverte pour la référence, l'active et retourne vrai
Private Function bFenêtreOuverte(ByVal sRef As String) As Boolean
  Dim f As Form
  For Each f In Forms
    If TypeOf f Is frmRA Then
      If f.cra.sRef = sRef Then
        f.ZOrder 0
        bFenêtreOuverte = True
        Exit Function
      End If
    End If
  Next
  bFenêtreOuverte = False
End Function

Private Sub InitialiseHiérarchie(cra As RA, ByVal bInitialiseOptionsLabo As Boolean)
  ' Si l'établissement est en cours de création, on ne fait rien
  If cra.sEtb = "0" Then Exit Sub
  
  ' On récupère les options et la langue de l'établissement
  Dim h As Hiérarchie
  Set h = LireHiérarchie(cra.sEtb)
  If h Is Nothing Then
    Dim sMessage As String
    sMessage = sprintf(sGetIntlLib("CR321", "Erreur lors de la lecture des informations de hiérarchie de l'établissement %1 ||Prévenez impérativement la DI !"), cra.sEtb)
    DémonJournalUnix "Hiérarchie", "Erreur interne", sMessage
    MsgBox sMessage, vbCritical, sNomApp
    Exit Sub
  End If
  
  ' On initialise les champs du RA
  With cra
    .iSec = h.iSec
    .iDrg = h.iDrg
    .iDna = h.iDna
    .iGrp = h.iGrp
    .sOptionsEdition = h.sOptionsEdition
    If bInitialiseOptionsLabo Then .sOptionsLabo = h.sOptionsLabo
    .cLangue = h.cLangue
    .iCodeCli = h.iCodeCli
    .sInfoCli = h.sInfoCli
  End With
End Sub


' Accueil principal, création d'un nouveau rapport d'analyse
Private Function bDoNouveauRA(ByVal sRef As String, ByRef sEtb As String, ByVal iTable As eTableRA) As Boolean
  bDoNouveauRA = False
  If bFenêtreOuverte(sRef) Then Exit Function
  If Not bPoseVerrou(sRef) Then Exit Function
  
  Dim fRA As frmRA
  
  ' RA vierge
  Set fRA = New frmRA
  fRA.iTable = iTable
  fRA.cra.iMode = meCréation
  fRA.cra.iModeGermes = mgNonLu
  fRA.cra.iModeBoîtes = mbNonLu
  
  fRA.cra.sRef = sRef
  fRA.cra.sEtb = sEtb
  ' On ne lit pas la hiérarchie dans le cas d'un établissement non créé
  If sEtb <> "0" Then InitialiseHiérarchie fRA.cra, True

  ' On affecte l'opératrice et la date de saisie, juste pour l'affichage, puisque
  ' cette information sera mise à jour au moment de l'enregistrement
  'fRA.cra.hOperSaisPH = iNumOpérateur
  'fRA.cra.dDateSaisPH = Now
  
  ' Par défaut, métaméthode S
  fRA.cra.cMMéthode = "S"
  If InStr(fRA.cra.sOptionsLabo, "A") <> 0 Then fRA.cra.cMMéthode = "A"
  If InStr(fRA.cra.sOptionsLabo, "B") <> 0 Then fRA.cra.cMMéthode = "B"
  If InStr(fRA.cra.sOptionsLabo, "V") <> 0 Then fRA.cra.cMMéthode = "V"
  
  ' Option F, envoyer par fax par défaut
  If InStr(fRA.cra.sOptionsLabo, "F") <> 0 Then
    fRA.cra.bFax = True
  End If
  
  ' Option T, traité par le SL (1) par défaut
  If InStr(fRA.cra.sOptionsEdition, "T") <> 0 Then
    fRA.cra.iTraitéPar = 1
  End If
  
  ' Lieu d'analyse, le même que le système du démon Unix
  fRA.cra.cLieuAn = cSystèmeCA
  
  ' Par défaut, cadre de prélèvement 1 et date de prélèvement la veille,
  ' date de début d'analyse prévue le jour même
  fRA.cra.hCadrePrél = 1
  fRA.cra.dDatePrél = Format(Now - 1, "dd/mm/yyyy")
  fRA.cra.dDateDebAnPrévue = Today
  
  ' 24/8/99 PV: Par défaut, date de réception = date du jour
  fRA.cra.dDateRécep = Today
  
  ' 4/12/00 PV: Initialisation champs CRA3
  fRA.cra.sClasseDoc = ""
  fRA.cra.dDateFinAn = Null
  fRA.cra.iUTot = Null
  fRA.cra.iUTotI = Null
  fRA.cra.iUTotS = Null
  fRA.cra.iUEnC = Null
  fRA.cra.iUEnCI = Null
  fRA.cra.iUEnCS = Null
  fRA.cra.dPrix = Null
  fRA.cra.cDevise = ""
  fRA.cra.hHeureRécep = Null
  fRA.cra.dDateRécepCli = Null
  fRA.cra.sModèle = ""
  fRA.cra.sDLC2 = ""
  fRA.cra.sCodeFamille = ""
  fRA.cra.cStatusModif = ""
  fRA.cra.dDateDécond = Null
  
  
  fRA.Show
  bDoNouveauRA = True
End Function


' RA existant, on se contente d'afficher les infos sans les modifier
Public Function bDoAfficherExistant(ByVal sRef As String, ByVal iMode As eModeEdition, ByVal iTable As eTableRA) As Boolean
  bDoAfficherExistant = False
  If bFenêtreOuverte(sRef) Then Exit Function
  If Not bPoseVerrou(sRef) Then Exit Function
  
  Dim fRA As frmRA
  
  ' RA vierge
  Set fRA = New frmRA
  fRA.iTable = iTable
  Set fRA.cra = LitRA(iTable, sRef)
  If fRA.cra Is Nothing Then
    MsgBox2i "CR257", sRef
    'MsgBox "Échec à la lecture du RA " & sRef, vbExclamation, sNomApp
    Unload fRA
    Exit Function
  End If
  
  ' Saisie commencée au labo: il faut quand même remplir par défaut certains champs,
  ' par remplis par le programme serie
  If fRA.cra.cEtatPH <= "1" Then InitialiseHiérarchie fRA.cra, False

  If iMode = meVisualisation Then
    fRA.cra.iMode = meVisualisation
  Else
    If fRA.cra.cEtatLabo >= "3" Or fRA.cra.cEtatPH >= "3" Then
      If frmRecherche.bModeSpécial And fRA.cra.cEtatLabo < "4" Then
        fRA.cra.iMode = meModificationSpéciale
      Else
        fRA.cra.iMode = meVisualisation
      End If
    ElseIf IsSerieLabo(fRA.cra.iNumSérie) Or fRA.cra.cEtatLabo >= "2" Then
      fRA.cra.iMode = meModificationRéduite
    Else
      fRA.cra.iMode = meModification
    End If
  End If
  
  ' Chargement de la liste des boîtes
  LitBoîtes sRef, fRA.cra
  
  fRA.Show
  bDoAfficherExistant = True
End Function


' Si iNumSerie vaut NULL, 0 ou -1, ce n'est pas une série et cette fonction retourne false
' sinon retourne true
Private Function IsSerieLabo(iNumSerie As Variant) As Boolean
  If VarType(iNumSerie) = vbNull Then
    IsSerieLabo = False
  ElseIf iNumSerie <= 0 Then
    IsSerieLabo = False
  Else
    IsSerieLabo = True
  End If
End Function

' ==============================================================================
' Points d'entrée publics

Public Sub VisualiseRA(ByVal sRef As String)
  HourGlass "show"
  bDoAfficherExistant sRef, meVisualisation, IIf(frmRecherche.cmdTableSL.Checked, tcLabo, tcBacterio)
  HourGlass "hide"
End Sub

Public Function bNouveauRA(ByVal sRef As String, ByRef sEtb As String) As Boolean
  HourGlass "show"
  bNouveauRA = bDoNouveauRA(sRef, sEtb, IIf(frmRecherche.cmdTableSL.Checked, tcLabo, tcBacterio))
  HourGlass "hide"
End Function

Public Function bModifieRA(ByVal sRef As String) As Boolean
  HourGlass "show"
  bModifieRA = bDoAfficherExistant(sRef, meModification, IIf(frmRecherche.cmdTableSL.Checked, tcLabo, tcBacterio))
  HourGlass "hide"
End Function

