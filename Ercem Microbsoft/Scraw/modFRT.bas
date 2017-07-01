Attribute VB_Name = "modFRT"
Attribute VB_Description = "Module de gestion des FRT"
' module modFRT
' Module de gestion des FRT
' 22/10/97 PV


Public iNumFRTCourante As Long             ' No de FRT courant, ou 0
Private colFRT As New Collection           ' R�f�rences rattach�es � la FRT courante


Option Explicit


' Obtient un no de FRT unique � chaque appel
Public Function GetNumFRT() As Long
  Dim sLigne As String, br As New Rev
  Dim iFRT As Long
  
  Bloquer
    tcps.Envoie "NFRT"
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField iFRT
    AttendSynchro
  Rel�cher
  
  GetNumFRT = iFRT
End Function


Public Sub AjouteR�f�renceFRT(ByVal sRef As String)
  On Error Resume Next
  colFRT.Add sRef, sRef
  If Err Then
     MsgBox2i "CR259"
    'MsgBox "Erreur interne: tentative d'ajout d'une r�f�rence en double dans la FRT courante !", vbCritical, sNomApp
    Stop
  End If
  frmRecherche.tbBoutons.Buttons("ImprimeFRT").Enabled = True
End Sub

Public Sub Enl�veR�f�renceFRT(ByVal sRef As String)
  On Error Resume Next
  colFRT.Remove sRef
End Sub



' Impression d'une FRT quelconque
Public Sub ImprimeFRT(ByVal iFRT As Long)
  Dim sLigne As String, br As New Rev
  Dim iStatus As Integer        ' Retour de IFRT: O:Ok, 1:FRT vide, 2:N� incorrect
  
  If Left(sImprimanteLaser, 5) = "[Nul]" Then Exit Sub
  
  If Left(sImprimanteLaser, 5) = "[Win]" Then
    D�butImpressionFRTLocal sImprimanteLaser, iBacLaser
    iStatus = iImpVBFRT(iFRT)
    FinImpressionFRTLocal
    If iStatus > 0 Then
      MsgBox2i "CR260", iFRT, sImprimanteLaser
    Else
      MsgBox2i "CR262", iFRT
    End If
    Exit Sub
  End If
  
  br.AddField sImprimanteLaser
  br.AddField iFRT
  
  Bloquer
    tcps.Envoie "IFRT " & br.Buffer
    
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField iStatus
    
    AttendSynchro
  Rel�cher
  
  Select Case iStatus
    Case 0: MsgBox2i "CR260", iFRT, sImprimanteLaser
    ' MsgBox "La fiche r�capitulative tourn�e " & iFRT & " a �t� imprim�e sur " & sImprimanteLaser & ".", vbInformation, sNomApp
    Case 1: MsgBox2i "CR261", iFRT, sImprimanteLaser
    'MsgBox "La fiche r�capitulative tourn�e " & iFRT & " a �t� imprim�e sur " & sImprimanteLaser & ", mais elle ne contient aucune r�f�rence suite � la suppression de RA.", vbInformation, sNomApp
    Case 2: MsgBox2i "CR262", iFRT
    'MsgBox "La FRT " & iFRT & " n'existe pas !", vbExclamation, sNomApp
  End Select
End Sub



' Efface en m�moire les infos sur une FRT, apr�s impression
Public Sub EffaceFRTCourante()
  iNumFRTCourante = 0
  While colFRT.Count > 0
    colFRT.Remove 1
  Wend
  frmRecherche.tbBoutons.Buttons("ImprimeFRT").Enabled = False
End Sub


' Info, pas tr�s utile�
Public Sub AfficheEtatFRT()
  If iNumFRTCourante = 0 Then
    MsgBox2i "CR263"
    'MsgBox "Il n'y a pas de FRT courante.", vbInformation, sNomApp
  Else
    Dim sMsg As String, s As Variant
    sMsg = sprintf(sGetIntlLib("CR263b", "FRT Courante:"), iNumFRTCourante, colFRT.Count)
    'sMsg = "FRT courante: " & iNumFRTCourante & vbCrLf & "Contient " & colFRT.Count & " r�f�rence(s) : " & vbCrLf
    For Each s In colFRT
      sMsg = sMsg & s & " "
    Next
    MsgBox sMsg, vbInformation, sNomApp
  End If
End Sub
