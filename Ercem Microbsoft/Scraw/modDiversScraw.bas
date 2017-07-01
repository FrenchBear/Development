Attribute VB_Name = "modDiversScraw"
Attribute VB_Description = "Opérations diverses de scraw…"
' modDiversScraw
' Opérations diverses de scraw…
' 27/10/1997 PV
'  6/04/1998 PV  CompteAnalysesPrévues en provenance de modConnexion
'  1/12/1998 PV  Impression dans CompteAnalysesPrévues (Fonction COMP2)
' 26/02/1999 PV  ContrôleEtablissementMêmeJour et ContrôleDDP transférés depuis modConnexion
' 19/10/1999 PV  N° établissement char(6)
'  2/11/1999 PV    RécupèreInfosLibRA


Option Explicit


' Ajoute chacune des lettres de sLettres à sChaîne si elles ne sont pas déjà présentes
Public Sub AjouteLettres(ByRef sChaîne As String, ByVal sLettres As String)
  Dim cLettre As String
  Dim i As Integer
  
  For i = 1 To Len(sLettres)
    cLettre = Mid(sLettres, i, 1)
    If InStr(sChaîne, cLettre) = 0 Then
      sChaîne = sChaîne & cLettre
    End If
  Next
End Sub


' Retire à sChaîne toutes les lettres de sLettres qui y sont présentes
Public Sub RetireLettres(ByRef sChaîne As String, ByVal sLettres As String)
  Dim cLettre As String
  Dim iPos As Integer
  Dim i As Integer
  
  For i = 1 To Len(sLettres)
    cLettre = Mid(sLettres, i, 1)
    iPos = InStr(sChaîne, cLettre)
    If iPos > 0 Then
      sChaîne = Left(sChaîne, iPos - 1) & Mid(sChaîne, iPos + 1)
    End If
  Next
End Sub



' ===============================================================================
' Compte le nombre d'analyses prévues pour une date donnée et un cadre de prélèvement donné
' Tous cadres de prélèvements si cpr=0
' Si on veut imprimer, on transmet le nom de l'imprimante

Function CompteAnalysesPrévues(d As Date, cpr As Integer, bImpression As Boolean) As Long
  Dim sLigne As String
  Dim br As New Rev
  Dim iNb As Long

  br.AddField d, cpr, IIf(bImpression, sImprimanteLaser, "")
  Bloquer
    tcps.Envoie "COMP2 " & br.Buffer
  
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then GoTo suite    ' Sortie chien de garde et abandon
    br.Buffer = sLigne
    br.GetField iNb
    
    AttendSynchro
suite:
  Relâcher
  
  CompteAnalysesPrévues = iNb
End Function




' ===============================================================================
' Vérifie que les dates de prélèvement d'une référence sont homogènes

Public Sub ContrôleDDP(ByVal sRef As String, ByVal dRef As Date)
  Dim sLigne As String
  Dim br As New Rev
  Dim sRefEch As String, dPrél As Date
  Dim sMessage As String
  
  br.AddField sRef
  Dim iNb As Integer
  iNb = 0
  Bloquer
    tcps.Envoie "DDP " & br.Buffer
    
    Do
      sLigne = tcps.Reçoit
      If sLigne = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sRefEch, dPrél
      
      If dPrél <> dRef Then
        iNb = iNb + 1
        If iNb < 6 Then
          If sMessage <> "" Then sMessage = sMessage & ", "
          sMessage = sMessage & sRefEch & ": " & Format(dPrél, "dd/mm/yyyy")
        ElseIf iNb = 6 Then
          sMessage = sMessage & ", ..."
        End If
      End If
      
    Loop
  Relâcher
  
  If sMessage <> "" Then
    MsgBox2i "CR269", sRef, Format(dRef, "dd/mm/yyyy"), sMessage
    'MsgBox "Avertissement: Le RA " & sRef & " a été prélevé le " & Format(dRef, "dd/mm/yyyy") & ", alors que d'autres échantillons pour cette intervention ont été prélevés à d'autres dates :" & vbCrLf & sMessage & vbCrLf & vbCrLf & "Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
  End If
End Sub



' ===============================================================================
' Vérifie que l'établissement n'est pas planifié sous une autre référence le même jour

Public Sub ContrôleEtablissementMêmeJour(ByRef sEtb As String, ByVal dDate As Date, ByVal sRefInt As String)
  Dim sLigne As String
  Dim br As New Rev
  Dim sAutreRefInt As String
  Dim sMessage As String
  
  br.AddField sEtb
  br.AddField dDate
  br.AddField sRefInt
  Bloquer
    tcps.Envoie "PETB2 " & br.Buffer
    
    Do
      sLigne = tcps.Reçoit
      If sLigne = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sAutreRefInt
      
      If sRefInt <> sAutreRefInt Then
        If sMessage <> "" Then sMessage = sMessage & ", "
        sMessage = sMessage & sAutreRefInt
      End If
    Loop
  Relâcher
  
  If sMessage <> "" Then
    MsgBox2i "CR270", sEtb, sNomEtablissement(sEtb), Format(dDate, "dd/mm/yyyy"), sMessage
    'MsgBox "Avertissement: Des prélèvements sont déjà enregistrés pour l'établissement " & iEtb & " (" & sNomEtablissement(iEtb) & ") le " & Format(dDate, "dd/mm/yyyy") & " sous d'autre(s) référence(s) d'intervention : " & vbCrLf & sMessage & vbCrLf & vbCrLf & "Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
  End If
End Sub


' ===============================================================================
' Récupère le n° de version de la biblio des RAs ainsi que le nombre maxi de germes

Public Sub RécupèreInfosLibRA()
  Dim sLigne As String
  Dim br As New Rev
  
  sLigne = DémonInfo(6)
  br.Buffer = sLigne
  br.GetField VERSION_CRA, MAXLIGNERES
  
  sInfosRab = "libcra " & VERSION_CRA & ", MAXLIGNERES=" & MAXLIGNERES
End Sub

