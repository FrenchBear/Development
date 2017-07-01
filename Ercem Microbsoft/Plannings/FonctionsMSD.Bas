Attribute VB_Name = "FonctionsMSD"
Attribute VB_Description = "Module encapsulant les fonctions MSD pour les quelles cela est facile"
' FonctionsMSD
' Module encapsulant les fonctions MSD pour les quelles cela est facile
'  4/02/1998 PV  Dans msdImprimeÉtiquettesIE, iOption est codé: iNbRef*100+iNbEtiq
' 13/04/1998 PV  Modifications de planning
' 20/20/2000 PV  Expansion de contraintes
'  6/11/2000 PV  TR3 pour rechercher une référence avec ses lettres


Option Explicit

Sub Connexion()
  Dim sLigne As String
  Dim br As New Rev
  Dim sLettres1 As String
  
  Dim sMsg As String
  sMsg = sprintf(sGetIntlLib("CXsConnexionEnCours", "Connexion au système %1 en cours…"), sSystèmeDistant)
  frmPlanning.sbStatus.Panels("Info").Text = sMsg
  
  ConnexionGénérale
    
  ' Lettre(s) gerée(s) par le démon, ou rien si tout est accepté
  sLigne = DémonInfo(1)
  br.Buffer = sLigne
  br.GetField sLettres1     ' Plus pris en charge depuis la version 1.3.62
  br.GetField cSystèmeCA
  If sLettres1 = "*" Then sLettres1 = ""
  iSystèmePays = Val(DémonInfo(7))

  ' Récupération de la liste des utilisateurs et des unités si nécessaire
  If guti_iNbUtilisateurs = 0 Then
    ' On récupère le timestamp maximum des utilisateurs connu de msd
    Dim dMaxUtilisateur As Date, dMaxUnité As Date, dMaxSystème As Date, dMaxLettres As Date
    sLigne = DémonInfo(3)
    br.Buffer = sLigne
    br.GetField dMaxUtilisateur, dMaxUnité, dMaxSystème, dMaxLettres
    
    InitUtilisateurs dMaxUtilisateur
    InitUnités dMaxUnité
    InitLettres dMaxLettres
  End If
  
  frmPlanning.sbStatus.Panels("Info").Text = ""
End Sub

Sub Déconnexion()
  DéconnexionGénérale
  
  frmPlanning.iOldEtat = -1
  sImprimantePlannings = ""
  sImprimanteEtiquettes = ""
  sImprimanteDocuments = ""
  sImprimanteAP = ""
  sImprimanteFP = ""
  frmPlanning.sbStatus.Panels("Impr").Text = ""
End Sub




' Impressions
Public Sub msdImprimeÉtiquettesIE(sImprimante As String, txtLettres As String, iOption As Integer)
  Dim br As New Rev
  br.AddField sImprimante
  br.AddField txtLettres
  br.AddField iOption
  Bloquer
    tcps.Envoie "IEIE " & br.Buffer
    AttendSynchro
  Relâcher
End Sub
  


' Validation des interventions
Public Sub msdValideIntervention(iPers As Integer, cSys As String, iSérie As Long)
  Dim br As New Rev
  
  br.AddField cSys
  br.AddField iSérie
  br.AddField iPers
  Bloquer
    tcps.Envoie "VINT " & br.Buffer
    AttendSynchro
  Relâcher
End Sub


Public Sub msdDévalideIntervention(cSys As String, iSérie As Long)
  Dim br As New Rev
  
  br.AddField cSys
  br.AddField iSérie
  br.AddField 0
  Bloquer
    tcps.Envoie "VINT " & br.Buffer
    AttendSynchro
  Relâcher
End Sub


' TesteValidation : Teste le niveau de validation d'une intervention
' -1: intervention inexistante
' 0: intervention non validée ou validée et documents tous à l'état 0 donc annulable
' 11 à 77: intervention avec des documents, état min et max
Public Function msdTesteValidation(iSérie As Long) As Integer
  Dim br As New Rev, iRetour As Integer
  Dim sLigne As String
  
  br.AddField cSystèmeCA
  br.AddField iSérie
  Bloquer
    tcps.Envoie "TVAL " & br.Buffer
    sLigne = tcps.Reçoit
    br.Buffer = sLigne
    br.GetField iRetour
    msdTesteValidation = iRetour
    AttendSynchro
  Relâcher
End Function


' A SIMPLIFIER - NE SERT PLUS QU'A TESTER L'EXISTENCE D'UN PLANNING
' Retour de msdTestClôture:
''-1: planning inexistant
' 0: planning pas clôt
' 1: planning clôt, aucun document saisi
' 2: planning clôt, documents en cours de saisie
' 3: planning clôt, mais sur un autre système (test des documents impossible)
Public Function msdTesteClôture(dDate As Date, sLettres As String) As Integer
  Dim br As New Rev, iRetour As Integer
  Dim sLigne As String
  
  AssertOkDate dDate
  AssertOkLettres sLettres
  
  br.AddField sLettres
  br.AddField dDate
  Bloquer
    tcps.Envoie "TCLO " & br.Buffer
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then
      br.Buffer = sLigne
      br.GetField iRetour
      msdTesteClôture = iRetour
      AttendSynchro
    End If
  Relâcher
End Function


' Trouve une référence. Retourne le numéro de série du planning, cSys est retourné par référence en dernier argument
'  9/01/97: La référence n'est cherchée que pour une première lettre donnée
' 26/09/00: La référence est cherchée pour le système donné et pas pour une première lettre (paramètre obsolète)
'  6/11/00: On cherche quand même avec les lettres pour éviter de créer lettres+ref identiques depuis deux systèmes différents
Public Function msdTrouveRef(ByVal sLettres As String, ByVal iRef As Long, ByVal cSystème As String, ByRef cSys As String) As Long
  Dim br As New Rev, iSerPlan As Long, cSysPlan As String
  
  br.AddField cSystème, sLettres, iRef
  Bloquer
    tcps.Envoie "TR3 " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then
      msdTrouveRef = 0
    Else
      br.Buffer = sLigne
      br.GetField cSysPlan
      br.GetField iSerPlan
      msdTrouveRef = iSerPlan
      cSys = cSysPlan
      AttendSynchro
    End If
  Relâcher
End Function


' Affecte une référence à un planning
Public Function msdAffecteRef(cSystème As String, iPlaSérie As Long) As Long
  Dim sLigne As String, iRef As Long
  Dim br As New Rev
  br.AddField cSystème
  br.AddField iPlaSérie
  
  Bloquer
    tcps.Envoie "AREF " & br.Buffer
    sLigne = tcps.Reçoit
    br.Buffer = sLigne
    br.GetField iRef
    msdAffecteRef = iRef
    AttendSynchro
  Relâcher
End Function



' Modifier les informations associées à un planning
Public Sub msdModifierJournée(j As Journee)
  Assert Not j Is Nothing
  
  ' Les infos de clôture ne passent pas par ce canal
  Dim br As New Rev
  br.AddField j.sLettres
  br.AddField j.dDatePlan
  br.AddField j.iHeureDébut
  br.AddField j.iHeureFin
  br.AddField j.iKmDébut
  br.AddField j.iKmFin
  
  Bloquer
    tcps.Envoie "MJOU " & br.Buffer
    AttendSynchro
  Relâcher
End Sub



' Expansion de contrainte codée via le C et lex, en attendant éventuellement
' une réécriture en VB pour améliorer les performances...
Public Function msdExpansionContrainte(ByVal dDate As Date, ByVal sContrainte As String) As String
  If sContrainte = "" Then Exit Function
  
  Dim br As New Rev
  Dim sLigne As String, sCD As String
  br.AddField dDate
  br.AddField sContrainte
  
  Bloquer
    tcps.Envoie "ECO " & br.Buffer
    sLigne = tcps.Reçoit
    br.Buffer = sLigne
    br.GetField sCD
    AttendSynchro
  Relâcher
  
  msdExpansionContrainte = sCD
End Function

