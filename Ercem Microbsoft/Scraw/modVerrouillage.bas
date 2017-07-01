Attribute VB_Name = "modVerrouillage"
Attribute VB_Description = "Implante les fonctions de verrouillage de référence"
' modVerrouillage
' Implante les fonctions de verrouillage de référence pour éviter les
' problèmes en environnement multi-utilisateurs
' Les fonctions de verrouillage ne sont pas obligatoires (non bloquant)
' mais sous la responsabilité du programme.
'
' 13/11/97   PV Version de base pour tester si tout est bien posé et libéré
' 21/04/1998 PV Trace des suppressions de verrous
' 12/05/1998 PV Fin des traces systématiques des suppressions de verrous…
'  8/07/1998 PV Fin réelle des traces systématiques des suppressions de verrous !
' 27/10/1998 PV LVER2 avec surveillance du retour sur crad

Option Explicit

' On mémorise localement la liste des référence verrouillées.
' C'est en principe inutile car c'est le démon qui doit gérer ça, mais ça facilite
' la mise au point du programme
Private colVerrous As New Collection


Function bPoseVerrou(ByVal sRef As String) As Boolean
  ' Ajout dans la collection locale de verrouillage
  On Error Resume Next
  colVerrous.Add sRef, sRef     ' Valeur quelconque et clé
  If Err Then                   ' Échec à l'insertion
    On Error GoTo 0
    bPoseVerrou = False
    MsgBox2i "CR271", sRef
    'MsgBox "Accès impossible à la référence " & sRef & "." & vbCrLf & "Le RA a été verrouillé par ce programme !" & vbCrLf & vbCrLf & "Prévenez la DI.", vbInformation, sNomApp
    Exit Function
  End If
  On Error GoTo 0
  
  ' On envoie la requête de verrouillage au démon
  Dim bOk As Boolean
  Bloquer
    Dim br As New Rev
    br.AddField sRef
    tcps.Envoie "PVER " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    br.Buffer = sLigne
    br.GetField bOk
    
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  Relâcher

  If Not bOk Then
    MsgBox2i "CR272", sRef
    'MsgBox "Accès impossible à la référence " & sRef & "." & vbCrLf & "Le RA est actuellement verrouillé par un autre utilisateur ou un autre programme, réessayez plus tard !" & vbCrLf & vbCrLf & "Si cette situation dure anormalement, prévenez la DI !", vbExclamation, sNomApp
    ' On l'enlève de la collection locale
    colVerrous.Remove sRef
  End If
  bPoseVerrou = bOk
End Function


Sub LibèreVerrou(ByVal sRef As String, Optional bNoWarning As Boolean = False)
  If bBlocageEnCours Then Beep: Exit Sub
  
  On Error Resume Next
  colVerrous.Remove sRef
  If Err And Not bNoWarning Then
    MsgBox2i "CR273", sRef
    'MsgBox "LibèreVerrou: tentative de libération du verrou scraw sur la référence " & sRef & ", alors qu'il n'y a pas de verrou posé…" & vbCrLf & vbCrLf & "Prévenez la DI !", vbCritical, sNomApp
  End If
  On Error GoTo 0
  
  ' On envoie la requête de déverrouillage au démon
  Bloquer
    Dim br As New Rev
    br.AddField sRef
    tcps.Envoie "LVER2 " & br.Buffer
    
    Dim sLigne As String, bStatus As Boolean
    sLigne = tcps.Reçoit
    br.Buffer = sLigne
    br.GetField bStatus

    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  Relâcher
  
  ' En cas de d'incohérence au niveau du démon, on le signale
  If Not bStatus Then
    Dim sMessage As String
    sMessage = sprintf(sGetIntlLib("CO087", "Problème interne grave !, LibèreVerrou…"), sRef)
    'sMessage = "Problème interne grave !" & vbCrLf & vbCrLf & "LibèreVerrou(""" & sRef & """) a échoué (verrou non trouvé)." & vbCrLf & vbCrLf & "Prévenez impérativement la DI !" & vbCrLf & "Il est cependant possible de continuer à utiliser le programme sans risque."
    DémonJournalUnix "Verrou", "Erreur interne", sMessage
    MsgBox sMessage, vbCritical, sNomApp
  End If
End Sub


Sub AfficheVerrousScraw()
  Dim sMessage As String
  
  If colVerrous.Count = 0 Then
    sMessage = sGetIntlLib("CR322", "Il n'y a aucun verrou scraw posé actuellement.")
  Else
    sMessage = sGetIntlLib("CR323", "Liste des verrous scraw en cours : |")
  End If
  
  Dim sRef
  For Each sRef In colVerrous
    sMessage = sMessage & sRef & " "
  Next
  MsgBox sMessage, vbInformation, sNomApp
End Sub


Sub AfficheVerrousCrad()
  frmVerrouillage.AfficheVerrous
End Sub

' Vérifie en fin de programme qu'il ne reste plus de verrou posé, sinon problème !
Sub ContrôleVerrous()
  If colVerrous.Count > 0 Then
    Dim sMessage As String
    sMessage = sGetIntlLib("CR191", "ContrôleVerrous: Il reste des verrous scraw non libérés en fin de programme !")
    Dim sRef
    For Each sRef In colVerrous
      sMessage = sMessage & sRef & " "
    Next
    sMessage = sMessage & vbCrLf & vbCrLf & sGetIntlLib("CO088", "Prévenez la DI !")
    MsgBox sMessage, vbCritical, sNomApp
  End If
End Sub

