Attribute VB_Name = "AccProduit"
Attribute VB_Description = "Fonctions d'accès aux produits. Accès par numéro, recherche…"
' AccProduit
' Fonctions d'accès aux produits
' Accès par numéro, recherche…
'  2/09/1997 PV
' 22/12/1998 PV Retour de t1..t5 par la fonction de recherche
'  6/01/1999 PV Fin du [État X] intégré au nom du produit; RPRO2 qui retourne l'état
'  8/01/1998 PV Etat "" remplacé par NULL (pourquoi crad renvoie "" au lieu de NULL ??? A surveiller !)

Option Explicit

' Cache
Private cache As New Collection

' Statistiques
Public gpro_iNbLire As Integer
Public gpro_iNbLireDuCache As Integer


Function gpro_iCacheCount() As Integer
  gpro_iCacheCount = cache.count
End Function


' Lit complètement un produit
Public Function LireProduit(iNumPro As Long) As Produit
  gpro_iNbLire = gpro_iNbLire + 1
  
  ' On cherche d'abord dans le cache
  Dim ec As Produit
  On Error Resume Next
  Set ec = cache("P" & iNumPro)
  If Err = 0 Then                       ' On l'a trouvé dans le cache !
    Set LireProduit = ec
    gpro_iNbLireDuCache = gpro_iNbLireDuCache + 1
    Exit Function                     ' Et c'est fini pour LireProduit
  End If
  
  ' Pas trouvé dans le cache, on demande au démon
  On Error GoTo 0
  
  Bloquer
    Dim br As New Rev
    br.AddField iNumPro
    tcps.Envoie "LPRO " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If sLigne = "->" Then
      Relâcher
      Set LireProduit = Nothing
      Exit Function
    End If
    
    Dim pr As New Produit
    Dim v As Variant
    br.Buffer = sLigne
    
    pr.bComplet = True
    br.GetField v: pr.pro_numpro = v
    br.GetField v: pr.pro_etat = VN(v)
    br.GetField v: pr.pro_nom = v
    br.GetField v: pr.pro_critere = v
    br.GetField v: pr.pro_comment = v
    br.GetField v: pr.pro_datecreat = v
    br.GetField v: pr.pro_heurecreat = v
    br.GetField v: pr.pro_opercreat = v
    br.GetField v: pr.pro_datemodif = v
    br.GetField v: pr.pro_heuremodif = v
    br.GetField v: pr.pro_opermodif = v
    br.GetField v: pr.pro_t1 = v
    br.GetField v: pr.pro_t2 = v
    br.GetField v: pr.pro_t3 = v
    br.GetField v: pr.pro_t4 = v
    br.GetField v: pr.pro_t5 = v
    br.GetField v: pr.timestamp = v
    br.GetField v: pr.pro_tsvalid = v
    br.GetField v: pr.pro_opervalid = v

    ' On ajoute le produit dans le cache
    cache.Add pr.Copie, "P" & pr.pro_numpro
    
    ' Contrôle
    sLigne = tcps.Reçoit
    If sLigne <> "->" Then Stop
  Relâcher
  
  Set LireProduit = pr
End Function


Function RechercheProduit(ByVal sMotifNom As String) As Collection
  Dim sReq As String
  sReq = "pro_nom$" & UCase(sMotifNom) & "*"
  If sMotifNom <> "" Then sReq = sReq & "$pro_nom$*" & UCase(sMotifNom) & "*"
  
  Bloquer
    Dim br As New Rev
    br.AddField sReq
    tcps.Envoie "RPRO2 " & br.Buffer
    
    Dim sLigne As String
    Dim iNumPro As Long, sNom As String, sCritère As String
    Dim t1 As Integer, t2 As Integer, t3 As Integer, t4 As Integer, t5 As Integer, sEtat
    Dim c As New Collection
    Dim pNew As New Produit
    Do
      sLigne = tcps.Reçoit
      If sLigne = "->" Then Exit Do
      
      br.Buffer = sLigne
      br.GetField iNumPro
      br.GetField sNom
      br.GetField sCritère
      br.GetField t1
      br.GetField t2
      br.GetField t3
      br.GetField t4
      br.GetField t5
      br.GetField sEtat
      
      With pNew
        .bComplet = False
        .pro_numpro = iNumPro
        .pro_nom = sNom
        .pro_critere = sCritère
        .pro_t1 = t1
        .pro_t2 = t2
        .pro_t3 = t3
        .pro_t4 = t4
        .pro_t5 = t5
        .pro_etat = VN(sEtat)
      End With
      
      Dim k As Produit
      Set k = pNew.Copie
  
      ' Au cas où le produit n'est pas dans le cache on l'ajoute
      Dim pr As Produit
      On Error Resume Next
      Set pr = cache("P" & iNumPro)
      If Err Then cache.Add k, "P" & iNumPro
      On Error GoTo 0
      
      ' On l'ajoute à la collection de recherche
      c.Add k, "P" & iNumPro
    Loop
  Relâcher
  
  Set RechercheProduit = c
End Function


Sub EffaceCacheProduits()
  Dim i As Integer
  For i = 1 To cache.count
    cache.Remove 1
  Next
End Sub


' Traces internes
Sub ListeProduits(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "N°"
  lw.ColumnHeaders(2).Text = " "
  lw.ColumnHeaders(3).Text = "Produit"
  lw.ColumnHeaders(4).Text = "Critère"
  
  Dim p As Produit
  For Each p In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = p.pro_numpro
    itmX.SubItems(1) = ""
    itmX.SubItems(2) = p.pro_nom
    itmX.SubItems(3) = p.pro_critere
  Next
End Sub

