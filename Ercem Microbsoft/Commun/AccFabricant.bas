Attribute VB_Name = "AccFabricant"
Attribute VB_Description = "Fonctions d'acc�s aux fabricants. Acc�s par num�ro, recherche�' Gestion d'un cache en m�moire"
' Fonctions d'acc�s aux Fabricants
' Acc�s par num�ro, recherche�
' Gestion d'un cache en m�moire
' 2/09/97

Option Explicit

' Cache
Private cache As New Collection

' Statistiques
Public gfab_iNbLire As Integer
Public gfab_iNbLireDuCache As Integer


Function gfab_iCacheCount() As Integer
  gfab_iCacheCount = cache.Count
End Function


' Lit compl�tement un Fabricant
Public Function LireFabricant(iNumfab As Long) As Fabricant
  gfab_iNbLire = gfab_iNbLire + 1
  
  ' On cherche d'abord dans le cache
  Dim ec As Fabricant
  On Error Resume Next
  Set ec = cache("F" & iNumfab)
  If Err = 0 Then                       ' On l'a trouv� dans le cache !
    Set LireFabricant = ec
    gfab_iNbLireDuCache = gfab_iNbLireDuCache + 1
    Exit Function                     ' Et c'est fini pour LireFabricant
  End If
  
  ' Pas trouv� dans le cache, on demande au d�mon
  On Error GoTo 0
  
  Bloquer
    Dim br As New Rev
    br.AddField iNumfab
    tcps.Envoie "Lfab " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Re�oit
    If sLigne = "->" Then
      Rel�cher
      Set LireFabricant = Nothing
      Exit Function
    End If
    
    Dim pr As New Fabricant
    Dim v As Variant
    br.Buffer = sLigne
    
    pr.bComplet = True
    br.GetField v: pr.fab_numfab = v
    br.GetField v: pr.fab_etat = v
    br.GetField v: pr.fab_origine = v
    br.GetField v: pr.fab_nom = v
    br.GetField v: pr.fab_comment = v
    br.GetField v: pr.fab_datecreat = v
    br.GetField v: pr.fab_heurecreat = v
    br.GetField v: pr.fab_opercreat = v
    br.GetField v: pr.fab_datemodif = v
    br.GetField v: pr.fab_heuremodif = v
    br.GetField v: pr.fab_opermodif = v
    br.GetField v: pr.timestamp = v
    br.GetField v: pr.fab_tsvalid = v
    br.GetField v: pr.fab_opervalid = v
    
    ' On ajoute le Fabricant dans le cache
    cache.Add pr.Copie, "F" & pr.fab_numfab
    
    ' Contr�le
    sLigne = tcps.Re�oit
    If sLigne <> "->" Then Stop
  Rel�cher
  
  Set LireFabricant = pr
End Function


Function RechercheFabricant(ByVal sMotifNom As String) As Collection
  Dim sReq As String
  sReq = "fab_nom$" & UCase(sMotifNom) & "*"
  If sMotifNom <> "" Then sReq = sReq & "$fab_nom$*" & UCase(sMotifNom) & "*"
  
  Bloquer
    Dim br As New Rev
    br.AddField sReq
    tcps.Envoie "Rfab " & br.Buffer
    
    Dim sLigne As String
    Dim iNumfab As Long, sNom As String
    Dim c As New Collection
    Dim pNew As New Fabricant
    Do
      sLigne = tcps.Re�oit
      If sLigne = "->" Then Exit Do
      
      br.Buffer = sLigne
      br.GetField iNumfab
      br.GetField sNom
      
      With pNew
        .bComplet = False
        .fab_numfab = iNumfab
        .fab_nom = sNom
      End With
      
      Dim k As Fabricant
      Set k = pNew.Copie
  
      ' Au cas o� le Fabricant n'est pas dans le cache on l'ajoute
      Dim pr As Fabricant
      On Error Resume Next
      Set pr = cache("F" & iNumfab)
      If Err Then cache.Add k, "F" & iNumfab
      On Error GoTo 0
      
      ' On l'ajoute � la collection de recherche
      c.Add k, "F" & iNumfab
    Loop
  Rel�cher
  
  Set RechercheFabricant = c
End Function


Sub EffaceCacheFabricants()
  Dim i As Integer
  For i = 1 To cache.Count
    cache.Remove 1
  Next
End Sub


' Traces internes
Sub ListeFabricants(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = sGetIntlLib("RFchNo", "N�")
  lw.ColumnHeaders(2).Text = " "
  lw.ColumnHeaders(3).Text = sGetIntlLib("RFchLibell�", "Libell�")
  lw.ColumnHeaders(4).Text = " "

  Dim f As Fabricant
  For Each f In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = f.fab_numfab
    itmX.SubItems(1) = ""
    itmX.SubItems(2) = f.fab_nom
    itmX.SubItems(3) = ""
  Next
End Sub

