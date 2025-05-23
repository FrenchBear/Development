Attribute VB_Name = "FonctionsMSD"
Attribute VB_Description = "Module encapsulant les fonctions MSD pour les quelles cela est facile"
' FonctionsMSD
' Module encapsulant les fonctions MSD pour les quelles cela est facile
'  4/02/1998 PV  Dans msdImprime�tiquettesIE, iOption est cod�: iNbRef*100+iNbEtiq
' 13/04/1998 PV  Modifications de planning

Option Explicit

Sub Connexion()
  Dim sLigne As String
  Dim br As New Rev
  Dim sLettres1 As String
  
  Dim sMsg As String
  sMsg = sprintf(sGetIntlLib("CXsConnexionEnCours", "Connexion au syst�me %1 en cours�"), sSyst�meDistant)
  frmGImp.sbStatus.Panels("Info").Text = sMsg
  
  ConnexionG�n�rale
    
  ' Lettre(s) ger�e(s) par le d�mon, ou rien si tout est accept�
  sLigne = D�monInfo(1)
  br.Buffer = sLigne
  br.GetField sLettres1     ' Plus pris en charge depuis la version 1.3.62
  br.GetField cSyst�meCA
  If sLettres1 = "*" Then sLettres1 = ""
  
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
  
  frmGImp.sbStatus.Panels("Info").Text = ""
End Sub

Sub D�connexion()
  D�connexionG�n�rale
  
  frmGImp.iOldEtat = -1
  sImprimanteAiguillesBL = ""
  sImprimanteAiguillesFP = ""
  frmGImp.sbStatus.Panels("Impr").Text = ""
End Sub
