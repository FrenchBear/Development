Attribute VB_Name = "ConnexionGDoc"
Attribute VB_Description = "Connexion/D�connexion sp�cifique � SCRAW"
' ConnexionGDoc
' Connexion/D�connexion sp�cifique � GdocW
' 01/02/1999 PV


Option Explicit

Sub Connexion()
  Dim sLigne As String, sFiller As String
  Dim br As New Rev
  
  Dim sMsg As String
  sMsg = sprintf(sGetIntlLib("CXsConnexionEnCours", "Connexion au syst�me %1 en cours�"), sSyst�meDistant)
  frmBase.sbStatus.Panels("Info").Text = sMsg
  
  ConnexionG�n�rale
  
  ' Lettre du syst�me
  sLigne = D�monInfo(1)
  br.Buffer = sLigne
  br.GetField sFiller
  br.GetField cSyst�meCA

    
  ' R�cup�ration de la liste des utilisateurs et des unit�s si n�cessaire
  If guti_iNbUtilisateurs = 0 Then
    ' On r�cup�re le timestamp maximum des utilisateurs connu du d�mon
    Dim dMaxUtilisateur As Date, dMaxUnit� As Date, dMaxSyst�me As Date, dMaxLettres As Date
    sLigne = D�monInfo(3)
    br.Buffer = sLigne
    br.GetField dMaxUtilisateur, dMaxUnit�, dMaxSyst�me, dMaxLettres
    
    InitUtilisateurs dMaxUtilisateur
    InitLettres dMaxLettres
'    InitUnit�s dMaxUnit�
  End If
  
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub

Sub D�connexion()
  D�connexionG�n�rale
  
  frmBase.sbStatus.Panels("Impr").Text = ""
End Sub


