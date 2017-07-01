Attribute VB_Name = "AccInfoAnalyse"
Attribute VB_Description = "Fonctions d'accès aux infos labo"
' AccInfoAnalyse
' Fonctions d'accès aux infos labo
'  4/09/97 PV
' 13/10/97 PV Fin de la structure InfoAnalyse
' 23/12/97 PV On ne génère <seuil pour GAM, … que si le seuil est défini
' 18/11/99 PV LCD2 qui retourne hClé2
'  3/12/00 PV LCD3 qui retourne ClasseDoc


Option Explicit

' Valeurs possibles pour le champ iModeGermes de la structure RA
Public Enum eModeGermes
  mgNonLu = 0              ' Pas lu, ou effacé
  mgLu = 1                 ' Lu sans problème
  mgModifié = 2            ' Lu et modifié
End Enum

' Valeurs possibles pour le champ iModeBoîtes de la structure RA
Public Enum eModeBoîtes
  mbNonLu = 0              ' Pas lu, ou pas de boîtes
  mbProblème = 1           ' Lu, mais pb en lecture (pas d'enregistrement)
  mbLu = 2                 ' Lu sans problème, pas modifié
  mbModifié = 3            ' Lu mais modifié, à enregistrer
End Enum


' Retourne la classe de document associée à un critère
Public Function sLireCritèreClasseDoc(sCrit As String) As String
  Bloquer
    Dim br As New Rev
    br.AddField sCrit
    tcps.Envoie "LCC " & br.Buffer
    
    ' Cas du critère inexistant, ou invalide
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then
      Relâcher
      sLireCritèreClasseDoc = ""
      Exit Function
    End If
  
    Dim sClasse As String
    br.Buffer = sLigne
    br.GetField sClasse
    
    ' Contrôle
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  Relâcher
    
  sLireCritèreClasseDoc = sClasse
End Function


' Lit les tables critère et dilution
' Retourne les options du critère dans sOptionsLabo
Public Function LireCritèreDilutions(sCrit As String, iVersion As Integer, sMétaMéthode As String, sOptionsLabo As String) As RA

  Screen.MousePointer = vbHourglass
  ' Pas de cache, on demande systématiquement au démon
  ' puisque ça varie selon les clients (en fonction des options labo)
  Bloquer
    Dim br As New Rev
    br.AddField sCrit
    br.AddField iVersion
    br.AddField sMétaMéthode
    br.AddField sOptionsLabo
    tcps.Envoie "LCD3 " & br.Buffer
    
    ' Cas du critère inexistant, ou invalide
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then
      Relâcher
      Screen.MousePointer = vbDefault
      Set LireCritèreDilutions = Nothing
      Exit Function
    End If
    
    ' Objet de retour
    Dim cr As New RA
    Set cr.cGermes = New GermesRecherchés
    
    Dim g As GermeRecherché
    Dim v As Variant
    
    br.Buffer = sLigne
    br.GetField v: cr.sCritère = v
    br.GetField v: cr.hVerCrit = v
    br.GetField v: cr.sTitreCritère = v
    br.GetField v: cr.iRevivification = v
    br.GetField v: cr.hClé2 = v
    br.GetField v: cr.sOptionsLabo = v
    br.GetField v: cr.sClasseDoc = v
    
    ' On récupère la liste des germes
    Do
      Dim iGerme As Integer, sUnité As String, m As Double, s As Double, sMéthode As String, sAbrégéLabo As String
      
      sLigne = tcps.Reçoit
      br.Buffer = sLigne
      
      br.GetField iGerme
      If iGerme = 0 Then Exit Do  ' Fin de la liste des germes
      br.GetField sUnité, m, s, sMéthode, sAbrégéLabo
      
      ' Si le critère est différent de RE01, alors il s'agit d'un germe issu d'un critère,
      ' et marqué comme tel de façon à ne pas être modifié
      Dim bOrigineCritère As Boolean
      bOrigineCritère = sCrit <> "RE01"
        
      Set g = cr.cGermes.Add(iGerme, sUnité, m, s, sMéthode, bOrigineCritère, Null, "")
      g.SetRésultatDéfaut
      
      ' On récupère la liste des boîtes
      Do
        Dim boi_milieu As Integer
        Dim boi_dilution As Integer
        Dim boi_quantite
        Dim boi_facteur As Long
        Dim boi_numboite As Integer
        Dim boi_typemarquage As Integer
        Dim boi_typeboite As Integer
        Dim boi_legende As String
        
        sLigne = tcps.Reçoit
        br.Buffer = sLigne
        br.GetField boi_milieu
        If boi_milieu = 0 Then Exit Do  ' Fin de la liste des boîtes pour le germe
        br.GetField boi_dilution
        br.GetField boi_quantite
        br.GetField boi_facteur
        br.GetField boi_numboite
        br.GetField boi_typemarquage
        br.GetField boi_typeboite
        br.GetField boi_legende
        
        ' Initialisation de la légende
        If Abs(iGerme) = 7 Then    ' Salmonelles
          boi_legende = sUnité
        ElseIf IsNumeric(boi_numboite) Then
          If boi_numboite > 0 Then
            boi_legende = "Bte " & boi_numboite
          End If
        End If
        
        g.Add boi_milieu, boi_dilution, boi_quantite, boi_facteur, boi_numboite, boi_typemarquage, boi_typeboite, boi_legende
      Loop
    Loop
    
    ' Contrôle
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  Relâcher
  
  cr.iModeGermes = mgLu
  cr.iModeBoîtes = mbLu
  Set LireCritèreDilutions = cr
  Screen.MousePointer = vbDefault
End Function



' Met à jour cra.cGermes.cBoîtes à partir de la table serieboite
Public Sub LitBoîtes(sRef As String, cra As RA)

  If cra.iModeBoîtes = mbProblème Then
    MsgBox2i "CR155"
    'MsgBox "Tentative de lecture des boîtes alors qu'il y a un problème !", vbCritical, sNomApp
    Stop
  End If

  Dim g As GermeRecherché
  Dim b As Boîte
  
  Bloquer
    Dim br As New Rev
    br.AddField sRef
    tcps.Envoie "LSB " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then        ' Série inexistante sur le système
      Relâcher
      cra.iModeBoîtes = mbNonLu
      Exit Sub
    End If
    
    ' Par défaut on considère que tout a été lu correctement
    cra.iModeBoîtes = mbLu
    
    ' On récupère la liste des boîtes
    ' Attention, la première ligne a déjà été lue
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
      If sb_indiceboite = 0 Then Exit Do  ' Fin de la liste des boîtes
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
        If cra.iModeBoîtes <> mbProblème Then
          MsgBox2i "CR158", sb_reference, sb_germe
          'MsgBox "Incohérence lors de la lecture de la liste des boîtes de la référence " & sb_reference & vbCrLf & _
            "Il existe une boîte pour le germe " & sb_germe & ", alors que ce dernier n'est pas présent dans la liste des germes recherchés…" & vbCrLf & vbCrLf & _
            "La liste des boîtes ne sera pas affichée ni modifiée.", vbExclamation, sNomApp
          End If
        cra.iModeBoîtes = mbProblème
      Else
        ' Construction de l'objet boîte
        Set b = Nothing
        Set b = New Boîte
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
        
        g.AddBoîte b
      End If
      
      sLigne = tcps.Reçoit
    Loop
    
    ' Contrôle
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
    
    ' En cas de problème, on efface la liste des boîtes
    If cra.iModeBoîtes = mbProblème Then
      For Each g In cra.cGermes
        Set g.cBoîtes = Nothing
      Next
    End If
    
  Relâcher
  
End Sub


' Efface la liste des boîtes pour une référence donnée
Public Sub DétruitBoîtes(ByVal sRef As String)
  Bloquer
    Dim br As New Rev
    Dim sLigne As String
    
    br.AddField sRef
    tcps.Envoie "DSB " & br.Buffer
    
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  Relâcher
End Sub


Public Sub EcritBoîtes(cra As RA)
  If cra.iModeBoîtes <> mbModifié Then Stop
  
  ' On commence par effacer la série de boîtes existante
  DétruitBoîtes cra.sRef
  
  ' Puis on écrit les germes
  Bloquer
    Dim br As New Rev
    Dim sLigne As String
    
    Dim g As GermeRecherché
    For Each g In cra.cGermes
      Dim b As Boîte
      For Each b In g.cBoîtes
        br.Clear
        
        br.AddField 0                   ' Indice est en serial dans la base
        br.AddField cra.sRef
        br.AddField cra.sCritère
        br.AddField g.iGerme
        br.AddField g.sMéthode
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
        
        sLigne = tcps.Reçoit
        If Left(sLigne, 2) <> "->" Then Stop
      Next
    Next
    
  Relâcher

  cra.iModeBoîtes = mbLu
End Sub

