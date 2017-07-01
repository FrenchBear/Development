Attribute VB_Name = "ConnexionSCRAW"
Attribute VB_Description = "Connexion/Déconnexion spécifique à SCRAW"
' ConnexionSCRAW
' Connexion/Déconnexion spécifique à SCRAW
' Octobre 97, PV
' 21/07/1998 PV Initialisation des lettres


Option Explicit

Sub Connexion()
  Dim sLigne As String, sFiller As String
  Dim br As New Rev
  
  Dim sMsg As String
  sMsg = sprintf(sGetIntlLib("CXsConnexionEnCours", "Connexion au système %1 en cours…"), sSystèmeDistant)
  frmBase.sbStatus.Panels("Info").Text = sMsg
  
  ConnexionGénérale
  
  ' Lettre du système
  sLigne = DémonInfo(1)
  br.Buffer = sLigne
  br.GetField sFiller
  br.GetField cSystèmeCA

    
  ' Récupération de la liste des utilisateurs et des unités si nécessaire
  If guti_iNbUtilisateurs = 0 Then
    ' On récupère le timestamp maximum des utilisateurs connu du démon
    Dim dMaxUtilisateur As Date, dMaxUnité As Date, dMaxSystème As Date, dMaxLettres As Date
    sLigne = DémonInfo(3)
    br.Buffer = sLigne
    br.GetField dMaxUtilisateur, dMaxUnité, dMaxSystème, dMaxLettres
    
    InitUtilisateurs dMaxUtilisateur
    InitLettres dMaxLettres
'    InitUnités dMaxUnité
  End If
  
  frmBase.sbStatus.Panels("Info").Text = ""
End Sub


Sub Déconnexion()
  DéconnexionGénérale
  sImprimanteLaser = ""
  frmBase.sbStatus.Panels("Impr").Text = ""
End Sub

