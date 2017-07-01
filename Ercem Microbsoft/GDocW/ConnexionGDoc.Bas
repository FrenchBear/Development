Attribute VB_Name = "ConnexionGDoc"
Attribute VB_Description = "Connexion/Déconnexion spécifique à SCRAW"
' ConnexionGDoc
' Connexion/Déconnexion spécifique à GdocW
' 01/02/1999 PV


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
  
  frmBase.sbStatus.Panels("Impr").Text = ""
End Sub


