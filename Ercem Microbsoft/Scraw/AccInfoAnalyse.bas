Attribute VB_Name = "AccInfoAnalyse"
Attribute VB_Description = "Fonctions d'acc�s aux infos labo"
' AccInfoAnalyse
' Fonctions d'acc�s aux infos labo
'  4/09/97 PV
' 13/10/97 PV Fin de la structure InfoAnalyse
' 23/12/97 PV On ne g�n�re <seuil pour GAM, � que si le seuil est d�fini
' 18/11/99 PV LCD2 qui retourne hCl�2
'  3/12/00 PV LCD3 qui retourne ClasseDoc


Option Explicit

' Valeurs possibles pour le champ iModeGermes de la structure RA
Public Enum eModeGermes
  mgNonLu = 0              ' Pas lu, ou effac�
  mgLu = 1                 ' Lu sans probl�me
  mgModifi� = 2            ' Lu et modifi�
End Enum

' Valeurs possibles pour le champ iModeBo�tes de la structure RA
Public Enum eModeBo�tes
  mbNonLu = 0              ' Pas lu, ou pas de bo�tes
  mbProbl�me = 1           ' Lu, mais pb en lecture (pas d'enregistrement)
  mbLu = 2                 ' Lu sans probl�me, pas modifi�
  mbModifi� = 3            ' Lu mais modifi�, � enregistrer
End Enum


' Retourne la classe de document associ�e � un crit�re
Public Function sLireCrit�reClasseDoc(sCrit As String) As String
  Bloquer
    Dim br As New Rev
    br.AddField sCrit
    tcps.Envoie "LCC " & br.Buffer
    
    ' Cas du crit�re inexistant, ou invalide
    Dim sLigne As String
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) = "->" Then
      Rel�cher
      sLireCrit�reClasseDoc = ""
      Exit Function
    End If
  
    Dim sClasse As String
    br.Buffer = sLigne
    br.GetField sClasse
    
    ' Contr�le
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop
  Rel�cher
    
  sLireCrit�reClasseDoc = sClasse
End Function


' Lit les tables crit�re et dilution
' Retourne les options du crit�re dans sOptionsLabo
Public Function LireCrit�reDilutions(sCrit As String, iVersion As Integer, sM�taM�thode As String, sOptionsLabo As String) As RA

  Screen.MousePointer = vbHourglass
  ' Pas de cache, on demande syst�matiquement au d�mon
  ' puisque �a varie selon les clients (en fonction des options labo)
  Bloquer
    Dim br As New Rev
    br.AddField sCrit
    br.AddField iVersion
    br.AddField sM�taM�thode
    br.AddField sOptionsLabo
    tcps.Envoie "LCD3 " & br.Buffer
    
    ' Cas du crit�re inexistant, ou invalide
    Dim sLigne As String
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) = "->" Then
      Rel�cher
      Screen.MousePointer = vbDefault
      Set LireCrit�reDilutions = Nothing
      Exit Function
    End If
    
    ' Objet de retour
    Dim cr As New RA
    Set cr.cGermes = New GermesRecherch�s
    
    Dim g As GermeRecherch�
    Dim v As Variant
    
    br.Buffer = sLigne
    br.GetField v: cr.sCrit�re = v
    br.GetField v: cr.hVerCrit = v
    br.GetField v: cr.sTitreCrit�re = v
    br.GetField v: cr.iRevivification = v
    br.GetField v: cr.hCl�2 = v
    br.GetField v: cr.sOptionsLabo = v
    br.GetField v: cr.sClasseDoc = v
    
    ' On r�cup�re la liste des germes
    Do
      Dim iGerme As Integer, sUnit� As String, m As Double, s As Double, sM�thode As String, sAbr�g�Labo As String
      
      sLigne = tcps.Re�oit
      br.Buffer = sLigne
      
      br.GetField iGerme
      If iGerme = 0 Then Exit Do  ' Fin de la liste des germes
      br.GetField sUnit�, m, s, sM�thode, sAbr�g�Labo
      
      ' Si le crit�re est diff�rent de RE01, alors il s'agit d'un germe issu d'un crit�re,
      ' et marqu� comme tel de fa�on � ne pas �tre modifi�
      Dim bOrigineCrit�re As Boolean
      bOrigineCrit�re = sCrit <> "RE01"
        
      Set g = cr.cGermes.Add(iGerme, sUnit�, m, s, sM�thode, bOrigineCrit�re, Null, "")
      g.SetR�sultatD�faut
      
      ' On r�cup�re la liste des bo�tes
      Do
        Dim boi_milieu As Integer
        Dim boi_dilution As Integer
        Dim boi_quantite
        Dim boi_facteur As Long
        Dim boi_numboite As Integer
        Dim boi_typemarquage As Integer
        Dim boi_typeboite As Integer
        Dim boi_legende As String
        
        sLigne = tcps.Re�oit
        br.Buffer = sLigne
        br.GetField boi_milieu
        If boi_milieu = 0 Then Exit Do  ' Fin de la liste des bo�tes pour le germe
        br.GetField boi_dilution
        br.GetField boi_quantite
        br.GetField boi_facteur
        br.GetField boi_numboite
        br.GetField boi_typemarquage
        br.GetField boi_typeboite
        br.GetField boi_legende
        
        ' Initialisation de la l�gende
        If Abs(iGerme) = 7 Then    ' Salmonelles
          boi_legende = sUnit�
        ElseIf IsNumeric(boi_numboite) Then
          If boi_numboite > 0 Then
            boi_legende = "Bte " & boi_numboite
          End If
        End If
        
        g.Add boi_milieu, boi_dilution, boi_quantite, boi_facteur, boi_numboite, boi_typemarquage, boi_typeboite, boi_legende
      Loop
    Loop
    
    ' Contr�le
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop
  Rel�cher
  
  cr.iModeGermes = mgLu
  cr.iModeBo�tes = mbLu
  Set LireCrit�reDilutions = cr
  Screen.MousePointer = vbDefault
End Function



' Met � jour cra.cGermes.cBo�tes � partir de la table serieboite
Public Sub LitBo�tes(sRef As String, cra As RA)

  If cra.iModeBo�tes = mbProbl�me Then
    MsgBox2i "CR155"
    'MsgBox "Tentative de lecture des bo�tes alors qu'il y a un probl�me !", vbCritical, sNomApp
    Stop
  End If

  Dim g As GermeRecherch�
  Dim b As Bo�te
  
  Bloquer
    Dim br As New Rev
    br.AddField sRef
    tcps.Envoie "LSB " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) = "->" Then        ' S�rie inexistante sur le syst�me
      Rel�cher
      cra.iModeBo�tes = mbNonLu
      Exit Sub
    End If
    
    ' Par d�faut on consid�re que tout a �t� lu correctement
    cra.iModeBo�tes = mbLu
    
    ' On r�cup�re la liste des bo�tes
    ' Attention, la premi�re ligne a d�j� �t� lue
    Do
      br.Buffer = sLigne
      
      Dim sb_indiceboite
      Dim sb_reference
      Dim sb_critere
      Dim sb_germe
      Dim sb_methode
      Dim sb_milieu
      Dim sb_dilution
      Dim sb_quantite
      Dim sb_facteur
      Dim sb_numboite
      Dim sb_etatboite
      Dim sb_typeboite
      Dim sb_idboite
      Dim sb_typemarquage
      Dim sb_tslecture
      Dim sb_operlecture
      Dim sb_denombrement
      Dim sb_legende

      br.GetField sb_indiceboite
      If sb_indiceboite = 0 Then Exit Do  ' Fin de la liste des bo�tes
      br.GetField sb_reference
      br.GetField sb_critere
      br.GetField sb_germe
      br.GetField sb_methode
      br.GetField sb_milieu
      br.GetField sb_dilution
      br.GetField sb_quantite
      br.GetField sb_facteur
      br.GetField sb_numboite
      br.GetField sb_etatboite
      br.GetField sb_typeboite
      br.GetField sb_idboite
      br.GetField sb_typemarquage
      br.GetField sb_tslecture
      br.GetField sb_operlecture
      br.GetField sb_denombrement
      br.GetField sb_legende
      
      ' On recherche le germe correspondant
      For Each g In cra.cGermes
        If g.iGerme = sb_germe Then Exit For
      Next
      
      If g Is Nothing Then
        If cra.iModeBo�tes <> mbProbl�me Then
          MsgBox2i "CR158", sb_reference, sb_germe
          'MsgBox "Incoh�rence lors de la lecture de la liste des bo�tes de la r�f�rence " & sb_reference & vbCrLf & _
            "Il existe une bo�te pour le germe " & sb_germe & ", alors que ce dernier n'est pas pr�sent dans la liste des germes recherch�s�" & vbCrLf & vbCrLf & _
            "La liste des bo�tes ne sera pas affich�e ni modifi�e.", vbExclamation, sNomApp
          End If
        cra.iModeBo�tes = mbProbl�me
      Else
        ' Construction de l'objet bo�te
        Set b = Nothing
        Set b = New Bo�te
        b.boi_milieu = sb_milieu
        b.boi_dilution = sb_dilution
        b.boi_quantite = sb_quantite
        b.boi_facteur = sb_facteur
        b.boi_numboite = sb_numboite
        b.boi_etatboite = sb_etatboite
        b.boi_typeboite = sb_typeboite
        b.boi_idboite = sb_idboite
        b.boi_typemarquage = sb_typemarquage
        b.boi_tslecture = sb_tslecture
        b.boi_operlecture = sb_operlecture
        b.boi_denombrement = sb_denombrement
        b.boi_legende = sb_legende
        
        g.AddBo�te b
      End If
      
      sLigne = tcps.Re�oit
    Loop
    
    ' Contr�le
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop
    
    ' En cas de probl�me, on efface la liste des bo�tes
    If cra.iModeBo�tes = mbProbl�me Then
      For Each g In cra.cGermes
        Set g.cBo�tes = Nothing
      Next
    End If
    
  Rel�cher
  
End Sub


' Efface la liste des bo�tes pour une r�f�rence donn�e
Public Sub D�truitBo�tes(ByVal sRef As String)
  Bloquer
    Dim br As New Rev
    Dim sLigne As String
    
    br.AddField sRef
    tcps.Envoie "DSB " & br.Buffer
    
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop
  Rel�cher
End Sub


Public Sub EcritBo�tes(cra As RA)
  If cra.iModeBo�tes <> mbModifi� Then Stop
  
  ' On commence par effacer la s�rie de bo�tes existante
  D�truitBo�tes cra.sRef
  
  ' Puis on �crit les germes
  Bloquer
    Dim br As New Rev
    Dim sLigne As String
    
    Dim g As GermeRecherch�
    For Each g In cra.cGermes
      Dim b As Bo�te
      For Each b In g.cBo�tes
        br.Clear
        
        br.AddField 0                   ' Indice est en serial dans la base
        br.AddField cra.sRef
        br.AddField cra.sCrit�re
        br.AddField g.iGerme
        br.AddField g.sM�thode
        br.AddField b.boi_milieu
        br.AddField b.boi_dilution
        br.AddField b.boi_quantite
        br.AddField b.boi_facteur
        br.AddField b.boi_numboite
        br.AddField b.boi_etatboite
        br.AddField b.boi_typeboite
        br.AddField b.boi_idboite
        br.AddField b.boi_typemarquage
        br.AddField b.boi_tslecture
        br.AddField b.boi_operlecture
        br.AddField b.boi_denombrement
        br.AddField b.boi_legende
      
        tcps.Envoie "ESB " & br.Buffer
        
        sLigne = tcps.Re�oit
        If Left(sLigne, 2) <> "->" Then Stop
      Next
    Next
    
  Rel�cher

  cra.iModeBo�tes = mbLu
End Sub

