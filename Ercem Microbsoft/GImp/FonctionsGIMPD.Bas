Attribute VB_Name = "FonctionsMSD"
Attribute VB_Description = "Module encapsulant les fonctions MSD pour les quelles cela est facile"
' FonctionsMSD
' Module encapsulant les fonctions MSD pour les quelles cela est facile
'  4/02/1998 PV  Dans msdImprimeÉtiquettesIE, iOption est codé: iNbRef*100+iNbEtiq
' 13/04/1998 PV  Modifications de planning

Option Explicit

Sub Connexion()
  Dim sLigne As String
  Dim br As New Rev
  Dim sLettres1 As String
  
  Dim sMsg As String
  sMsg = sprintf(sGetIntlLib("CXsConnexionEnCours", "Connexion au système %1 en cours…"), sSystèmeDistant)
  frmGImp.sbStatus.Panels("Info").Text = sMsg
  
  ConnexionGénérale
    
  ' Lettre(s) gerée(s) par le démon, ou rien si tout est accepté
  sLigne = DémonInfo(1)
  br.Buffer = sLigne
  br.GetField sLettres1     ' Plus pris en charge depuis la version 1.3.62
  br.GetField cSystèmeCA
  If sLettres1 = "*" Then sLettres1 = ""
  
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
  
  frmGImp.sbStatus.Panels("Info").Text = ""
End Sub

Sub Déconnexion()
  DéconnexionGénérale
  
  frmGImp.iOldEtat = -1
  sImprimanteAiguillesBL = ""
  sImprimanteAiguillesFP = ""
  frmGImp.sbStatus.Panels("Impr").Text = ""
End Sub
