Attribute VB_Name = "modVerrouillage"
Attribute VB_Description = "Implante les fonctions de verrouillage de r�f�rence"
' modVerrouillage
' Implante les fonctions de verrouillage de r�f�rence pour �viter les
' probl�mes en environnement multi-utilisateurs
' Les fonctions de verrouillage ne sont pas obligatoires (non bloquant)
' mais sous la responsabilit� du programme.
'
' 13/11/97   PV Version de base pour tester si tout est bien pos� et lib�r�
' 21/04/1998 PV Trace des suppressions de verrous
' 12/05/1998 PV Fin des traces syst�matiques des suppressions de verrous�
'  8/07/1998 PV Fin r�elle des traces syst�matiques des suppressions de verrous !
' 27/10/1998 PV LVER2 avec surveillance du retour sur crad

Option Explicit

' On m�morise localement la liste des r�f�rence verrouill�es.
' C'est en principe inutile car c'est le d�mon qui doit g�rer �a, mais �a facilite
' la mise au point du programme
Private colVerrous As New Collection


Function bPoseVerrou(ByVal sRef As String) As Boolean
  ' Ajout dans la collection locale de verrouillage
  On Error Resume Next
  colVerrous.Add sRef, sRef     ' Valeur quelconque et cl�
  If Err Then                   ' �chec � l'insertion
    On Error GoTo 0
    bPoseVerrou = False
    MsgBox2i "CR271", sRef
    'MsgBox "Acc�s impossible � la r�f�rence " & sRef & "." & vbCrLf & "Le RA a �t� verrouill� par ce programme !" & vbCrLf & vbCrLf & "Pr�venez la DI.", vbInformation, sNomApp
    Exit Function
  End If
  On Error GoTo 0
  
  ' On envoie la requ�te de verrouillage au d�mon
  Dim bOk As Boolean
  Bloquer
    Dim br As New Rev
    br.AddField sRef
    tcps.Envoie "PVER " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField bOk
    
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop
  Rel�cher

  If Not bOk Then
    MsgBox2i "CR272", sRef
    'MsgBox "Acc�s impossible � la r�f�rence " & sRef & "." & vbCrLf & "Le RA est actuellement verrouill� par un autre utilisateur ou un autre programme, r�essayez plus tard !" & vbCrLf & vbCrLf & "Si cette situation dure anormalement, pr�venez la DI !", vbExclamation, sNomApp
    ' On l'enl�ve de la collection locale
    colVerrous.Remove sRef
  End If
  bPoseVerrou = bOk
End Function


Sub Lib�reVerrou(ByVal sRef As String, Optional bNoWarning As Boolean = False)
  If bBlocageEnCours Then Beep: Exit Sub
  
  On Error Resume Next
  colVerrous.Remove sRef
  If Err And Not bNoWarning Then
    MsgBox2i "CR273", sRef
    'MsgBox "Lib�reVerrou: tentative de lib�ration du verrou scraw sur la r�f�rence " & sRef & ", alors qu'il n'y a pas de verrou pos�" & vbCrLf & vbCrLf & "Pr�venez la DI !", vbCritical, sNomApp
  End If
  On Error GoTo 0
  
  ' On envoie la requ�te de d�verrouillage au d�mon
  Bloquer
    Dim br As New Rev
    br.AddField sRef
    tcps.Envoie "LVER2 " & br.Buffer
    
    Dim sLigne As String, bStatus As Boolean
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField bStatus

    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop
  Rel�cher
  
  ' En cas de d'incoh�rence au niveau du d�mon, on le signale
  If Not bStatus Then
    Dim sMessage As String
    sMessage = sprintf(sGetIntlLib("CO087", "Probl�me interne grave !, Lib�reVerrou�"), sRef)
    'sMessage = "Probl�me interne grave !" & vbCrLf & vbCrLf & "Lib�reVerrou(""" & sRef & """) a �chou� (verrou non trouv�)." & vbCrLf & vbCrLf & "Pr�venez imp�rativement la DI !" & vbCrLf & "Il est cependant possible de continuer � utiliser le programme sans risque."
    D�monJournalUnix "Verrou", "Erreur interne", sMessage
    MsgBox sMessage, vbCritical, sNomApp
  End If
End Sub


Sub AfficheVerrousScraw()
  Dim sMessage As String
  
  If colVerrous.Count = 0 Then
    sMessage = sGetIntlLib("CR322", "Il n'y a aucun verrou scraw pos� actuellement.")
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

' V�rifie en fin de programme qu'il ne reste plus de verrou pos�, sinon probl�me !
Sub Contr�leVerrous()
  If colVerrous.Count > 0 Then
    Dim sMessage As String
    sMessage = sGetIntlLib("CR191", "Contr�leVerrous: Il reste des verrous scraw non lib�r�s en fin de programme !")
    Dim sRef
    For Each sRef In colVerrous
      sMessage = sMessage & sRef & " "
    Next
    sMessage = sMessage & vbCrLf & vbCrLf & sGetIntlLib("CO088", "Pr�venez la DI !")
    MsgBox sMessage, vbCritical, sNomApp
  End If
End Sub

