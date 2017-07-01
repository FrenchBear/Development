Attribute VB_Name = "AccHiérarchie"
Attribute VB_Description = "Fonctions d'accès à la hiérarchie d'un établissement. Gère son propre cache"
' AccHiérarchie.bas
' Fonctions d'accès à la hiérarchie d'un établissement
' Ne passe pas par le cache établissement, gère son propre cache
' 17/10/97 PV Accès

Option Explicit

' Cache
Private cache As New Collection

' Statistiques
Public ghie_iNbLire As Integer
Public ghie_iNbLireDuCache As Integer


Function ghie_iCacheCount() As Integer
  ghie_iCacheCount = cache.Count
End Function


' Lit la hiérarchie d'un établissement
Public Function LireHiérarchie(ByRef sNumEtb As String) As Hiérarchie
  ghie_iNbLire = ghie_iNbLire + 1
  
  ' On cherche d'abord dans le cache
  Dim h As Hiérarchie
  On Error Resume Next
  Set h = cache("H" & sNumEtb)
  If Err = 0 Then                       ' On l'a trouvé dans le cache !
    Set LireHiérarchie = h
    ghie_iNbLireDuCache = ghie_iNbLireDuCache + 1
    Exit Function                     ' Et c'est fini pour LireHiérarchie
  End If
  
  ' Pas trouvé dans le cache, on demande au démon
  On Error GoTo 0
  
  Bloquer
    Dim br As New Rev
    br.AddField sNumEtb
    tcps.Envoie "LHIE2 " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) = "->" Then
      Relâcher
      Set LireHiérarchie = Nothing
      Exit Function
    End If
    
    Dim nh As New Hiérarchie
    Dim v As Variant
    br.Buffer = sLigne
    
    br.GetField v: nh.sEtb = v
    br.GetField v: nh.iSec = v
    br.GetField v: nh.iDrg = v
    br.GetField v: nh.iDna = v
    br.GetField v: nh.iGrp = v
    br.GetField v: nh.sOptionsEdition = v
    br.GetField v: nh.sOptionsLabo = v
    br.GetField v: nh.cLangue = v
    br.GetField v: nh.iCodeCli = v
    br.GetField v: nh.sInfoCli = v
    
    ' On ajoute l'enregistrement de hiérarchie dans le cache
    cache.Add nh.Copie, "H" & nh.sEtb
    
    ' Contrôle
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  Relâcher
  
  Set LireHiérarchie = nh
End Function


Sub EffaceCacheHiérarchies()
  Dim i As Integer
  For i = 1 To cache.Count
    cache.Remove 1
  Next
End Sub


' Traces internes
Sub ListeHiérarchies(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "N°Etb"
  lw.ColumnHeaders(2).Text = "cLangue"
  lw.ColumnHeaders(3).Text = "Options d'édition / Options labo / CodeCli / InfoCli"
  lw.ColumnHeaders(4).Text = " "

  Dim d As Hiérarchie
  For Each d In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = d.sEtb
    itmX.SubItems(1) = d.cLangue
    itmX.SubItems(2) = d.sOptionsEdition & " / " & d.sOptionsLabo & " / " & d.iCodeCli & " / " & d.sInfoCli
    itmX.SubItems(3) = ""
  Next
End Sub

