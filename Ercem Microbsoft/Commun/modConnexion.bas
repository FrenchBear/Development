Attribute VB_Name = "modConnexion"
Attribute VB_Description = "Regroupe les procédures de connexion / déconnexion / synchro ainsi que les commandes communes d'accès au démon"
' module modConnexion
' Regroupe les procédures de connexion / déconnexion / synchro
' ainsi que les commandes communes d'accès au démon
'  2/09/1997 PV
'  6/04/1998 PV  CompteAnalysesPrévues
' 19/04/1998 PV  Message et fin de programme en cas d'échec à la connexion. CompteAnalysesPrévues --> modDiversScran
' 26/02/1999 PV  Internationalisation; ContrôleEtablissementMêmeJour et ContrôleDDP dans modDiversScraw (modConnexion est commun)
' 20/04/2001 PV  DémonTraceSession


Option Explicit


Sub AttendSynchro()
  Dim sLigne As String
  Do
    sLigne = tcps.Reçoit
    If sLigne = "->" Then Exit Do
  Loop
End Sub


Sub ConnexionGénérale()
  If Not tcps.bConnexion(sSystèmeDistant, iPortDémon) Then
    MsgBox2i "CO060", sSystèmeDistant
    EmergencyExit
  End If
  AttendSynchro
  
  Dim sLigne As String
  Dim br As New Rev
  
  ' On récupère la version du démon (pour la boîte à propos)
  sLigne = DémonInfo(5)
  br.Buffer = sLigne
  br.GetField sVersionDémon
  
  ' Contrôle de version de protocole
  sLigne = DémonInfo(2)
  br.Buffer = sLigne
  br.GetField iNumProto, iRelProto
  
  If iNumProto <> 1 Then
    frmBase.sbStatus.Panels("Info").Text = ""
    tcps.Ferme
    MsgBox2i "CO061", sSystèmeDistant, 1, iNumProto
    ' Erreur interne grave !||Incompatibilité de protocole|Niveau de protocole requis 1|Niveau de protocole disponible iNumProto
    EmergencyExit
    End
  End If
  
  If iRelProto < iMinRelease Then
    frmBase.sbStatus.Panels("Info").Text = ""
    tcps.Ferme
    MsgBox2i "CO062", sSystèmeDistant, iMinRelease, iRelProto
    ' Erreur interne grave !|Incompatibilité de protocole du système Unix %1 :|Version de protocole requise: %2|Version de protocole disponible: %3||Faites une mise à jour des programmes, et si le problème persiste, prévenez le service informatique !
    EmergencyExit
    End
  End If

  ' On informe le serveur de  l'identité de l'utilisateur
  If sNomOpérateur <> "" Then
    DémonUtilisateur sNomOpérateur, iNumOpérateur
  End If
  
End Sub


Sub DéconnexionGénérale()
  tcps.Ferme
End Sub




' Récupère des informations générales
Public Function DémonInfo(ByVal iInfo As Integer) As String
  Dim sLigne As String
  Bloquer
    tcps.Envoie "INFO " & iInfo & "|"
    sLigne = tcps.Reçoit
    DémonInfo = sLigne
    AttendSynchro
  Relâcher
End Function




' Identification
Public Sub DémonUtilisateur(ByVal sNomOpérateur As String, ByVal iNumOpérateur As Integer)
  Dim br As New Rev
  br.AddField iNumOpérateur
  br.AddField sNomOpérateur
  Bloquer
    tcps.Envoie "IDUT " & br.Buffer
    AttendSynchro
  Relâcher
End Sub


' Trace de la session
Public Sub DémonTraceSession(ByVal iNumOpérateur As Integer, ByVal sIdModif As String)
  Dim br As New Rev
  br.AddField iNumOpérateur
  br.AddField sIdModif
  Bloquer
    tcps.Envoie "TS " & br.Buffer
    AttendSynchro
  Relâcher
End Sub



' Ecriture d'une trace dans le journal Unix
Public Sub DémonJournalUnix(ByVal sDomaine As String, ByVal sOpération As String, ByVal sDescription As String)
  Dim br As New Rev
  br.AddField sApplicationGlobale, sDomaine, sOpération, sDescription
  
  Bloquer
    tcps.Envoie "JOU " & br.Buffer
    AttendSynchro
  Relâcher
End Sub

