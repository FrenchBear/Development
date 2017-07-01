Attribute VB_Name = "modConnexion"
Attribute VB_Description = "Regroupe les proc�dures de connexion / d�connexion / synchro ainsi que les commandes communes d'acc�s au d�mon"
' module modConnexion
' Regroupe les proc�dures de connexion / d�connexion / synchro
' ainsi que les commandes communes d'acc�s au d�mon
'  2/09/1997 PV
'  6/04/1998 PV  CompteAnalysesPr�vues
' 19/04/1998 PV  Message et fin de programme en cas d'�chec � la connexion. CompteAnalysesPr�vues --> modDiversScran
' 26/02/1999 PV  Internationalisation; Contr�leEtablissementM�meJour et Contr�leDDP dans modDiversScraw (modConnexion est commun)
' 20/04/2001 PV  D�monTraceSession


Option Explicit


Sub AttendSynchro()
  Dim sLigne As String
  Do
    sLigne = tcps.Re�oit
    If sLigne = "->" Then Exit Do
  Loop
End Sub


Sub ConnexionG�n�rale()
  If Not tcps.bConnexion(sSyst�meDistant, iPortD�mon) Then
    MsgBox2i "CO060", sSyst�meDistant
    EmergencyExit
  End If
  AttendSynchro
  
  Dim sLigne As String
  Dim br As New Rev
  
  ' On r�cup�re la version du d�mon (pour la bo�te � propos)
  sLigne = D�monInfo(5)
  br.Buffer = sLigne
  br.GetField sVersionD�mon
  
  ' Contr�le de version de protocole
  sLigne = D�monInfo(2)
  br.Buffer = sLigne
  br.GetField iNumProto, iRelProto
  
  If iNumProto <> 1 Then
    frmBase.sbStatus.Panels("Info").Text = ""
    tcps.Ferme
    MsgBox2i "CO061", sSyst�meDistant, 1, iNumProto
    ' Erreur interne grave !||Incompatibilit� de protocole|Niveau de protocole requis 1|Niveau de protocole disponible iNumProto
    EmergencyExit
    End
  End If
  
  If iRelProto < iMinRelease Then
    frmBase.sbStatus.Panels("Info").Text = ""
    tcps.Ferme
    MsgBox2i "CO062", sSyst�meDistant, iMinRelease, iRelProto
    ' Erreur interne grave !|Incompatibilit� de protocole du syst�me Unix %1 :|Version de protocole requise: %2|Version de protocole disponible: %3||Faites une mise � jour des programmes, et si le probl�me persiste, pr�venez le service informatique !
    EmergencyExit
    End
  End If

  ' On informe le serveur de  l'identit� de l'utilisateur
  If sNomOp�rateur <> "" Then
    D�monUtilisateur sNomOp�rateur, iNumOp�rateur
  End If
  
End Sub


Sub D�connexionG�n�rale()
  tcps.Ferme
End Sub




' R�cup�re des informations g�n�rales
Public Function D�monInfo(ByVal iInfo As Integer) As String
  Dim sLigne As String
  Bloquer
    tcps.Envoie "INFO " & iInfo & "|"
    sLigne = tcps.Re�oit
    D�monInfo = sLigne
    AttendSynchro
  Rel�cher
End Function




' Identification
Public Sub D�monUtilisateur(ByVal sNomOp�rateur As String, ByVal iNumOp�rateur As Integer)
  Dim br As New Rev
  br.AddField iNumOp�rateur
  br.AddField sNomOp�rateur
  Bloquer
    tcps.Envoie "IDUT " & br.Buffer
    AttendSynchro
  Rel�cher
End Sub


' Trace de la session
Public Sub D�monTraceSession(ByVal iNumOp�rateur As Integer, ByVal sIdModif As String)
  Dim br As New Rev
  br.AddField iNumOp�rateur
  br.AddField sIdModif
  Bloquer
    tcps.Envoie "TS " & br.Buffer
    AttendSynchro
  Rel�cher
End Sub



' Ecriture d'une trace dans le journal Unix
Public Sub D�monJournalUnix(ByVal sDomaine As String, ByVal sOp�ration As String, ByVal sDescription As String)
  Dim br As New Rev
  br.AddField sApplicationGlobale, sDomaine, sOp�ration, sDescription
  
  Bloquer
    tcps.Envoie "JOU " & br.Buffer
    AttendSynchro
  Rel�cher
End Sub

