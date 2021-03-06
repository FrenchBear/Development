Attribute VB_Name = "FonctionsMSD"
Attribute VB_Description = "Module encapsulant les fonctions MSD pour les quelles cela est facile"
' FonctionsMSD
' Module encapsulant les fonctions MSD pour les quelles cela est facile
'  4/02/1998 PV  Dans msdImprime�tiquettesIE, iOption est cod�: iNbRef*100+iNbEtiq
' 13/04/1998 PV  Modifications de planning
' 20/20/2000 PV  Expansion de contraintes
'  6/11/2000 PV  TR3 pour rechercher une r�f�rence avec ses lettres


Option Explicit

Sub Connexion()
  Dim sLigne As String
  Dim br As New Rev
  Dim sLettres1 As String
  
  Dim sMsg As String
  sMsg = sprintf(sGetIntlLib("CXsConnexionEnCours", "Connexion au syst�me %1 en cours�"), sSyst�meDistant)
  frmPlanning.sbStatus.Panels("Info").Text = sMsg
  
  ConnexionG�n�rale
    
  ' Lettre(s) ger�e(s) par le d�mon, ou rien si tout est accept�
  sLigne = D�monInfo(1)
  br.Buffer = sLigne
  br.GetField sLettres1     ' Plus pris en charge depuis la version 1.3.62
  br.GetField cSyst�meCA
  If sLettres1 = "*" Then sLettres1 = ""
  iSyst�mePays = Val(D�monInfo(7))

  ' R�cup�ration de la liste des utilisateurs et des unit�s si n�cessaire
  If guti_iNbUtilisateurs = 0 Then
    ' On r�cup�re le timestamp maximum des utilisateurs connu de msd
    Dim dMaxUtilisateur As Date, dMaxUnit� As Date, dMaxSyst�me As Date, dMaxLettres As Date
    sLigne = D�monInfo(3)
    br.Buffer = sLigne
    br.GetField dMaxUtilisateur, dMaxUnit�, dMaxSyst�me, dMaxLettres
    
    InitUtilisateurs dMaxUtilisateur
    InitUnit�s dMaxUnit�
    InitLettres dMaxLettres
  End If
  
  frmPlanning.sbStatus.Panels("Info").Text = ""
End Sub

Sub D�connexion()
  D�connexionG�n�rale
  
  frmPlanning.iOldEtat = -1
  sImprimantePlannings = ""
  sImprimanteEtiquettes = ""
  sImprimanteDocuments = ""
  sImprimanteAP = ""
  sImprimanteFP = ""
  frmPlanning.sbStatus.Panels("Impr").Text = ""
End Sub




' Impressions
Public Sub msdImprime�tiquettesIE(sImprimante As String, txtLettres As String, iOption As Integer)
  Dim br As New Rev
  br.AddField sImprimante
  br.AddField txtLettres
  br.AddField iOption
  Bloquer
    tcps.Envoie "IEIE " & br.Buffer
    AttendSynchro
  Rel�cher
End Sub
  


' Validation des interventions
Public Sub msdValideIntervention(iPers As Integer, cSys As String, iS�rie As Long)
  Dim br As New Rev
  
  br.AddField cSys
  br.AddField iS�rie
  br.AddField iPers
  Bloquer
    tcps.Envoie "VINT " & br.Buffer
    AttendSynchro
  Rel�cher
End Sub


Public Sub msdD�valideIntervention(cSys As String, iS�rie As Long)
  Dim br As New Rev
  
  br.AddField cSys
  br.AddField iS�rie
  br.AddField 0
  Bloquer
    tcps.Envoie "VINT " & br.Buffer
    AttendSynchro
  Rel�cher
End Sub


' TesteValidation : Teste le niveau de validation d'une intervention
' -1: intervention inexistante
' 0: intervention non valid�e ou valid�e et documents tous � l'�tat 0 donc annulable
' 11 � 77: intervention avec des documents, �tat min et max
Public Function msdTesteValidation(iS�rie As Long) As Integer
  Dim br As New Rev, iRetour As Integer
  Dim sLigne As String
  
  br.AddField cSyst�meCA
  br.AddField iS�rie
  Bloquer
    tcps.Envoie "TVAL " & br.Buffer
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField iRetour
    msdTesteValidation = iRetour
    AttendSynchro
  Rel�cher
End Function


' A SIMPLIFIER - NE SERT PLUS QU'A TESTER L'EXISTENCE D'UN PLANNING
' Retour de msdTestCl�ture:
''-1: planning inexistant
' 0: planning pas cl�t
' 1: planning cl�t, aucun document saisi
' 2: planning cl�t, documents en cours de saisie
' 3: planning cl�t, mais sur un autre syst�me (test des documents impossible)
Public Function msdTesteCl�ture(dDate As Date, sLettres As String) As Integer
  Dim br As New Rev, iRetour As Integer
  Dim sLigne As String
  
  AssertOkDate dDate
  AssertOkLettres sLettres
  
  br.AddField sLettres
  br.AddField dDate
  Bloquer
    tcps.Envoie "TCLO " & br.Buffer
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then
      br.Buffer = sLigne
      br.GetField iRetour
      msdTesteCl�ture = iRetour
      AttendSynchro
    End If
  Rel�cher
End Function


' Trouve une r�f�rence. Retourne le num�ro de s�rie du planning, cSys est retourn� par r�f�rence en dernier argument
'  9/01/97: La r�f�rence n'est cherch�e que pour une premi�re lettre donn�e
' 26/09/00: La r�f�rence est cherch�e pour le syst�me donn� et pas pour une premi�re lettre (param�tre obsol�te)
'  6/11/00: On cherche quand m�me avec les lettres pour �viter de cr�er lettres+ref identiques depuis deux syst�mes diff�rents
Public Function msdTrouveRef(ByVal sLettres As String, ByVal iRef As Long, ByVal cSyst�me As String, ByRef cSys As String) As Long
  Dim br As New Rev, iSerPlan As Long, cSysPlan As String
  
  br.AddField cSyst�me, sLettres, iRef
  Bloquer
    tcps.Envoie "TR3 " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Re�oit
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
  Rel�cher
End Function


' Affecte une r�f�rence � un planning
Public Function msdAffecteRef(cSyst�me As String, iPlaS�rie As Long) As Long
  Dim sLigne As String, iRef As Long
  Dim br As New Rev
  br.AddField cSyst�me
  br.AddField iPlaS�rie
  
  Bloquer
    tcps.Envoie "AREF " & br.Buffer
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField iRef
    msdAffecteRef = iRef
    AttendSynchro
  Rel�cher
End Function



' Modifier les informations associ�es � un planning
Public Sub msdModifierJourn�e(j As Journee)
  Assert Not j Is Nothing
  
  ' Les infos de cl�ture ne passent pas par ce canal
  Dim br As New Rev
  br.AddField j.sLettres
  br.AddField j.dDatePlan
  br.AddField j.iHeureD�but
  br.AddField j.iHeureFin
  br.AddField j.iKmD�but
  br.AddField j.iKmFin
  
  Bloquer
    tcps.Envoie "MJOU " & br.Buffer
    AttendSynchro
  Rel�cher
End Sub



' Expansion de contrainte cod�e via le C et lex, en attendant �ventuellement
' une r��criture en VB pour am�liorer les performances...
Public Function msdExpansionContrainte(ByVal dDate As Date, ByVal sContrainte As String) As String
  If sContrainte = "" Then Exit Function
  
  Dim br As New Rev
  Dim sLigne As String, sCD As String
  br.AddField dDate
  br.AddField sContrainte
  
  Bloquer
    tcps.Envoie "ECO " & br.Buffer
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField sCD
    AttendSynchro
  Rel�cher
  
  msdExpansionContrainte = sCD
End Function

