Attribute VB_Name = "AccCritère"
' Fonctions d'accès aux critères
' Accès par numéro, recherche…
' 4/09/97 PV

Option Explicit

' Cache des critères
Private cache As New Collection

' Transposition v0 --> dernière version
' Clé: C et le nom du critère
' Valeur stockée: "V" suivi du numéro de la dernière version (on ne peut pas ajouter un integer à une collection…)
Private cacheV0 As New Collection

' Statistiques
Public gcri_iNbLire As Integer
Public gcri_iNbLireDuCache As Integer


Function gcri_iCacheCount() As Integer
  gcri_iCacheCount = cache.Count
End Function


' Lit complètement un Critère
Public Function LireCritère(sCrit As String, Optional ByVal iVersion As Integer = 0) As Critère
  Dim i As Integer
  Dim bAMémoriserDansV0 As Boolean
  
  gcri_iNbLire = gcri_iNbLire + 1
  bAMémoriserDansV0 = False
  
  ' Si on demande la dernière version (iVersion=0), on cherche d'abord dans
  ' cacheV0 si on connait le numéro réelle de dernière version
  If iVersion = 0 Then
    Dim iDernièreVersion As Integer
    On Error Resume Next
    iDernièreVersion = Val(Mid(cacheV0("C" & sCrit), 2))
    If Err = 0 Then                       ' On l'a trouvé dans le cache !
      iVersion = iDernièreVersion
    Else
      bAMémoriserDansV0 = True
    End If
    On Error GoTo 0
  End If
  
  ' Ensuite on cherche si on n'a pas le critère dans le cache
  If iVersion > 0 Then
    Dim ec As Critère
    On Error Resume Next
    Set ec = cache("C" & sCrit & ";" & iVersion)
    If Err = 0 Then                       ' On l'a trouvé dans le cache !
      Set LireCritère = ec
      gcri_iNbLireDuCache = gcri_iNbLireDuCache + 1
      Exit Function                     ' Et c'est fini pour LireCritère
    End If
    On Error GoTo 0
  End If
  
  ' Pas trouvé dans le cache, on demande au démon
  Bloquer
    Dim br As New Rev
    br.AddField sCrit
    br.AddField iVersion
    tcps.Envoie "LCRI " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then
      Relâcher
      Set LireCritère = Nothing
      Exit Function
    End If
    
    Dim cr As New Critère
    Dim v As Variant
    br.Buffer = sLigne
    
    br.GetField v: cr.cri_critere = v
    br.GetField v: cr.cri_version = v
    br.GetField v: cr.cri_titre = v
    br.GetField v: cr.cri_nbger = v
    
    ' On récupère le corps
    For i = 1 To cr.cri_nbger
      sLigne = tcps.Reçoit
      If Left(sLigne, 2) = "->" Then
        Relâcher
        MsgBox "Erreur interne lors de la réception d'un critère"
        Stop
        Set LireCritère = Nothing
        Exit Function
      End If
      
      Dim iGerme As Integer, sUnité As String, m As Double, s As Double
      br.GetField iGerme, sUnité, m, s
      cr.SetGerme i, iGerme, m, s
    Next
    
    ' On ajoute le critère dans le cache
    cache.Add cr.Copie, "C" & cr.cri_critere & ";" & cr.cri_version
    
    ' Si nécessaire, on le stocke d'indice de la dernière version dans cacheV0
    If bAMémoriserDansV0 Then
      cacheV0.Add "V" & cr.cri_version, "C" & cr.cri_critere
    End If
    
    ' Contrôle
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  Relâcher
  
  Set LireCritère = cr
End Function



Sub EffaceCacheCritères()
  Dim i As Integer
  For i = 1 To cache.Count
    cache.Remove 1
  Next
End Sub


' Traces internes
Sub ListeCritères(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "Critère"
  lw.ColumnHeaders(2).Text = "Version"
  lw.ColumnHeaders(3).Text = "Titre"
  lw.ColumnHeaders(4).Text = "NbGer"
  
  Dim c As Critère
  For Each c In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = c.cri_critere
    itmX.SubItems(1) = c.cri_version
    itmX.SubItems(2) = c.cri_titre
    itmX.SubItems(3) = c.cri_nbger
  Next
End Sub

