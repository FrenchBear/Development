Attribute VB_Name = "AccFDR"
Attribute VB_Description = "Fonctions d'accès aux feuilles de route, gestion d'un cache mémoire"
' Fonctions d'accès aux feuilles de route
' Gestion d'un cache en mémoire
' 24/10/00 PV

Option Explicit

' Cache
Private cache As New Collection

' Statistiques
Public gfdr_iNbLire As Integer
Public gfdr_iNbLireDuCache As Integer

Function gfdr_iCacheCount() As Integer
  gfdr_iCacheCount = cache.count
End Function


' Lit complètement un établissement
' Retourne Nothing si etb inxistant
Public Function LireFDR(ByVal iNiveau As Integer, ByVal iNumXXX As Long) As FDR
  gfdr_iNbLire = gfdr_iNbLire + 1
  
  ' On cherche d'abord dans le cache
  Dim fc As FDR
  On Error Resume Next
  Set fc = cache("F" & iNiveau & iNumXXX)
  If Err = 0 Then                       ' On l'a trouvé dans le cache !
    Set LireFDR = fc
    gfdr_iNbLireDuCache = gfdr_iNbLireDuCache + 1
    Exit Function                     ' Et c'est fini pour LireFDR
  End If
  
  ' Pas trouvé dans le cache, on demande au démon
  On Error GoTo 0
  
  Bloquer
    Dim br As New Rev
    br.AddField iNiveau, iNumXXX
    tcps.Envoie "FDR " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If sLigne = "->" Then
      Relâcher
      Set LireFDR = Nothing
      Exit Function
    End If
    
    Dim ft As New FDR
    Dim v As Variant
    br.Buffer = sLigne
    
    ft.iNiveau = iNiveau
    ft.iNumXXX = iNumXXX
    br.GetField v: ft.sNom = v
    br.GetField v: ft.iParent = v
    br.GetField v: ft.sFDR = v
    
    ' On ajoute l'établissement dans le cache
    cache.Add ft.Copie, "F" & iNiveau & iNumXXX
    
    ' Contrôle
    sLigne = tcps.Reçoit
    If sLigne <> "->" Then MsgBox "STOP.15": Stop
  Relâcher
  
  Set LireFDR = ft
End Function


Sub EffaceCacheFDRs()
  Dim i As Integer
  For i = 1 To cache.count
    cache.Remove 1
  Next
End Sub


' Traces internes
Sub ListeFDRs(lv As ListView)
  Dim itmX As ListItem

  lv.ListItems.Clear
  lv.ColumnHeaders(1).Text = "Niv"
  lv.ColumnHeaders(2).Text = "No"
  lv.ColumnHeaders(3).Text = "Nom"
  lv.ColumnHeaders(4).Text = "Fdr"

  Dim e As FDR
  For Each e In cache
    Set itmX = lv.ListItems.Add()
    itmX.Text = e.iNiveau
    itmX.SubItems(1) = e.iNumXXX
    itmX.SubItems(2) = e.sNom
    itmX.SubItems(3) = e.sFDR
  Next
End Sub

