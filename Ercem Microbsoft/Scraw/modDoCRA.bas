Attribute VB_Name = "modDoRA"
Attribute VB_Description = "Points d'entr�e d'acc�s � la structure CRA"
' modDoRA
' Points d'entr�e d'acc�s � la structure RA
' 16/10/1997 PV
' 14/11/1997 PV Gestion du n� de s�rie -1; meModificationSp�ciale
' 23/12/1997 PV InitialiseHi�rarchie ne fait rien pour un �tablissement en cours de cr�ation
' 10/04/1998 PV Affichage du sablier pendant l'ouverture de la fen�tre de RA
' 19/05/1998 PV Modif sp�ciale interdite si �tatlabo � 4
' 30/03/1999 PV M�tam�thodes A,B,V g�r�es
' 24/08/1999 PV Par d�faut, date de r�ception = date du jour pour les nouveaux rapports
'  4/12/2000 PV Champs CRA3 initialis�s

Option Explicit

' Valeurs possibles poir le champ iMode de la structure RA
Public Enum eModeEdition
  meCr�ation = 1              ' Tous les champs sont accessibles
  meModification = 2          ' idem (modification compl�te)
  meModificationR�duite = 3   ' Crit�re/germes/bo�tes inaccessibles
  meVisualisation = 4         ' Aucun champ accessible
  meModificationSp�ciale = 5  ' Modification apr�s validation (=meModificationR�duite)
End Enum

' Tables en param�tre � litcra de la biblio libcra
Public Enum eTableRA
  tcBacterio = 0
  tcPhysicoChimie = 1
  tcLabo = 2
  tcLaboSec = 3
End Enum


' S'il existe d�j� une fen�tre ouverte pour la r�f�rence, l'active et retourne vrai
Private Function bFen�treOuverte(ByVal sRef As String) As Boolean
  Dim f As Form
  For Each f In Forms
    If TypeOf f Is frmRA Then
      If f.cra.sRef = sRef Then
        f.ZOrder 0
        bFen�treOuverte = True
        Exit Function
      End If
    End If
  Next
  bFen�treOuverte = False
End Function

Private Sub InitialiseHi�rarchie(cra As RA, ByVal bInitialiseOptionsLabo As Boolean)
  ' Si l'�tablissement est en cours de cr�ation, on ne fait rien
  If cra.sEtb = "0" Then Exit Sub
  
  ' On r�cup�re les options et la langue de l'�tablissement
  Dim h As Hi�rarchie
  Set h = LireHi�rarchie(cra.sEtb)
  If h Is Nothing Then
    Dim sMessage As String
    sMessage = sprintf(sGetIntlLib("CR321", "Erreur lors de la lecture des informations de hi�rarchie de l'�tablissement %1 ||Pr�venez imp�rativement la DI !"), cra.sEtb)
    D�monJournalUnix "Hi�rarchie", "Erreur interne", sMessage
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


' Accueil principal, cr�ation d'un nouveau rapport d'analyse
Private Function bDoNouveauRA(ByVal sRef As String, ByRef sEtb As String, ByVal iTable As eTableRA) As Boolean
  bDoNouveauRA = False
  If bFen�treOuverte(sRef) Then Exit Function
  If Not bPoseVerrou(sRef) Then Exit Function
  
  Dim fRA As frmRA
  
  ' RA vierge
  Set fRA = New frmRA
  fRA.iTable = iTable
  fRA.cra.iMode = meCr�ation
  fRA.cra.iModeGermes = mgNonLu
  fRA.cra.iModeBo�tes = mbNonLu
  
  fRA.cra.sRef = sRef
  fRA.cra.sEtb = sEtb
  ' On ne lit pas la hi�rarchie dans le cas d'un �tablissement non cr��
  If sEtb <> "0" Then InitialiseHi�rarchie fRA.cra, True

  ' On affecte l'op�ratrice et la date de saisie, juste pour l'affichage, puisque
  ' cette information sera mise � jour au moment de l'enregistrement
  'fRA.cra.hOperSaisPH = iNumOp�rateur
  'fRA.cra.dDateSaisPH = Now
  
  ' Par d�faut, m�tam�thode S
  fRA.cra.cMM�thode = "S"
  If InStr(fRA.cra.sOptionsLabo, "A") <> 0 Then fRA.cra.cMM�thode = "A"
  If InStr(fRA.cra.sOptionsLabo, "B") <> 0 Then fRA.cra.cMM�thode = "B"
  If InStr(fRA.cra.sOptionsLabo, "V") <> 0 Then fRA.cra.cMM�thode = "V"
  
  ' Option F, envoyer par fax par d�faut
  If InStr(fRA.cra.sOptionsLabo, "F") <> 0 Then
    fRA.cra.bFax = True
  End If
  
  ' Option T, trait� par le SL (1) par d�faut
  If InStr(fRA.cra.sOptionsEdition, "T") <> 0 Then
    fRA.cra.iTrait�Par = 1
  End If
  
  ' Lieu d'analyse, le m�me que le syst�me du d�mon Unix
  fRA.cra.cLieuAn = cSyst�meCA
  
  ' Par d�faut, cadre de pr�l�vement 1 et date de pr�l�vement la veille,
  ' date de d�but d'analyse pr�vue le jour m�me
  fRA.cra.hCadrePr�l = 1
  fRA.cra.dDatePr�l = Format(Now - 1, "dd/mm/yyyy")
  fRA.cra.dDateDebAnPr�vue = Today
  
  ' 24/8/99 PV: Par d�faut, date de r�ception = date du jour
  fRA.cra.dDateR�cep = Today
  
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
  fRA.cra.hHeureR�cep = Null
  fRA.cra.dDateR�cepCli = Null
  fRA.cra.sMod�le = ""
  fRA.cra.sDLC2 = ""
  fRA.cra.sCodeFamille = ""
  fRA.cra.cStatusModif = ""
  fRA.cra.dDateD�cond = Null
  
  
  fRA.Show
  bDoNouveauRA = True
End Function


' RA existant, on se contente d'afficher les infos sans les modifier
Public Function bDoAfficherExistant(ByVal sRef As String, ByVal iMode As eModeEdition, ByVal iTable As eTableRA) As Boolean
  bDoAfficherExistant = False
  If bFen�treOuverte(sRef) Then Exit Function
  If Not bPoseVerrou(sRef) Then Exit Function
  
  Dim fRA As frmRA
  
  ' RA vierge
  Set fRA = New frmRA
  fRA.iTable = iTable
  Set fRA.cra = LitRA(iTable, sRef)
  If fRA.cra Is Nothing Then
    MsgBox2i "CR257", sRef
    'MsgBox "�chec � la lecture du RA " & sRef, vbExclamation, sNomApp
    Unload fRA
    Exit Function
  End If
  
  ' Saisie commenc�e au labo: il faut quand m�me remplir par d�faut certains champs,
  ' par remplis par le programme serie
  If fRA.cra.cEtatPH <= "1" Then InitialiseHi�rarchie fRA.cra, False

  If iMode = meVisualisation Then
    fRA.cra.iMode = meVisualisation
  Else
    If fRA.cra.cEtatLabo >= "3" Or fRA.cra.cEtatPH >= "3" Then
      If frmRecherche.bModeSp�cial And fRA.cra.cEtatLabo < "4" Then
        fRA.cra.iMode = meModificationSp�ciale
      Else
        fRA.cra.iMode = meVisualisation
      End If
    ElseIf IsSerieLabo(fRA.cra.iNumS�rie) Or fRA.cra.cEtatLabo >= "2" Then
      fRA.cra.iMode = meModificationR�duite
    Else
      fRA.cra.iMode = meModification
    End If
  End If
  
  ' Chargement de la liste des bo�tes
  LitBo�tes sRef, fRA.cra
  
  fRA.Show
  bDoAfficherExistant = True
End Function


' Si iNumSerie vaut NULL, 0 ou -1, ce n'est pas une s�rie et cette fonction retourne false
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
' Points d'entr�e publics

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

