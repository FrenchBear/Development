Attribute VB_Name = "AccDistributeur"
Attribute VB_Description = "Fonctions d'accès aux distributeurs. Accès par numéro, recherche… Gestion d'un cache en mémoire"
' Module AccDistributeur
' Fonctions d'accès aux Distributeurs. Accès par numéro, recherche…
' Gestion d'un cache en mémoire
'  2/09/1997 PV

Option Explicit

' Cache
Private cache As New Collection

' Statistiques
Public gdis_iNbLire As Integer
Public gdis_iNbLireDuCache As Integer


Function gdis_iCacheCount() As Integer
  gdis_iCacheCount = cache.Count
End Function


' Lit complètement un Distributeur
Public Function LireDistributeur(iNumdis As Long) As Distributeur
  gdis_iNbLire = gdis_iNbLire + 1
  
  ' On cherche d'abord dans le cache
  Dim ec As Distributeur
  On Error Resume Next
  Set ec = cache("D" & iNumdis)
  If Err = 0 Then                       ' On l'a trouvé dans le cache !
    Set LireDistributeur = ec
    gdis_iNbLireDuCache = gdis_iNbLireDuCache + 1
    Exit Function                     ' Et c'est fini pour LireDistributeur
  End If
  
  ' Pas trouvé dans le cache, on demande au démon
  On Error GoTo 0
  
  Bloquer
    Dim br As New Rev
    br.AddField iNumdis
    tcps.Envoie "Ldis " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If sLigne = "->" Then
      Relâcher
      Set LireDistributeur = Nothing
      Exit Function
    End If
    
    Dim pr As New Distributeur
    Dim v As Variant
    br.Buffer = sLigne
    
    pr.bComplet = True
    br.GetField v: pr.dis_numdis = v
    br.GetField v: pr.dis_etat = v
    br.GetField v: pr.dis_origine = v
    br.GetField v: pr.dis_nom = v
    br.GetField v: pr.dis_comment = v
    br.GetField v: pr.dis_datecreat = v
    br.GetField v: pr.dis_heurecreat = v
    br.GetField v: pr.dis_opercreat = v
    br.GetField v: pr.dis_datemodif = v
    br.GetField v: pr.dis_heuremodif = v
    br.GetField v: pr.dis_opermodif = v
    br.GetField v: pr.timestamp = v
    br.GetField v: pr.dis_tsvalid = v
    br.GetField v: pr.dis_opervalid = v
    
    ' On ajoute le Distributeur dans le cache
    cache.Add pr.Copie, "D" & pr.dis_numdis
    
    ' Contrôle
    sLigne = tcps.Reçoit
    If sLigne <> "->" Then Stop
  Relâcher
  
  Set LireDistributeur = pr
End Function


Function RechercheDistributeur(ByVal sMotifNom As String) As Collection
  Dim sReq As String
  sReq = "dis_nom$" & UCase(sMotifNom) & "*"
  If sMotifNom <> "" Then sReq = sReq & "$dis_nom$*" & UCase(sMotifNom) & "*"
  
  Bloquer
    Dim br As New Rev
    br.AddField sReq
    tcps.Envoie "Rdis " & br.Buffer
    
    Dim sLigne As String
    Dim iNumdis As Long, sNom As String
    Dim c As New Collection
    Dim pNew As New Distributeur
    Do
      sLigne = tcps.Reçoit
      If sLigne = "->" Then Exit Do
      
      br.Buffer = sLigne
      br.GetField iNumdis
      br.GetField sNom
      
      With pNew
        .bComplet = False
        .dis_numdis = iNumdis
        .dis_nom = sNom
      End With
      
      Dim k As Distributeur
      Set k = pNew.Copie
  
      ' Au cas où le Distributeur n'est pas dans le cache on l'ajoute
      Dim pr As Distributeur
      On Error Resume Next
      Set pr = cache("D" & iNumdis)
      If Err Then cache.Add k, "D" & iNumdis
      On Error GoTo 0
      
      ' On l'ajoute à la collection de recherche
      c.Add k, "D" & iNumdis
    Loop
  Relâcher
  
  Set RechercheDistributeur = c
End Function


Sub EffaceCacheDistributeurs()
  Dim i As Integer
  For i = 1 To cache.Count
    cache.Remove 1
  Next
End Sub


' Traces internes
Sub ListeDistributeurs(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = sGetIntlLib("RTCHDNo", "N°")
  lw.ColumnHeaders(2).Text = " "
  lw.ColumnHeaders(3).Text = sGetIntlLib("RTCHDLibellé", "Libellé")
  lw.ColumnHeaders(4).Text = " "

  Dim d As Distributeur
  For Each d In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = d.dis_numdis
    itmX.SubItems(1) = ""
    itmX.SubItems(2) = d.dis_nom
    itmX.SubItems(3) = ""
  Next
End Sub


