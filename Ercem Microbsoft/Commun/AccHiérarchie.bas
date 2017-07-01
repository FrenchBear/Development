Attribute VB_Name = "AccHi�rarchie"
Attribute VB_Description = "Fonctions d'acc�s � la hi�rarchie d'un �tablissement. G�re son propre cache"
' AccHi�rarchie.bas
' Fonctions d'acc�s � la hi�rarchie d'un �tablissement
' Ne passe pas par le cache �tablissement, g�re son propre cache
' 17/10/97 PV Acc�s

Option Explicit

' Cache
Private cache As New Collection

' Statistiques
Public ghie_iNbLire As Integer
Public ghie_iNbLireDuCache As Integer


Function ghie_iCacheCount() As Integer
  ghie_iCacheCount = cache.Count
End Function


' Lit la hi�rarchie d'un �tablissement
Public Function LireHi�rarchie(ByRef sNumEtb As String) As Hi�rarchie
  ghie_iNbLire = ghie_iNbLire + 1
  
  ' On cherche d'abord dans le cache
  Dim h As Hi�rarchie
  On Error Resume Next
  Set h = cache("H" & sNumEtb)
  If Err = 0 Then                       ' On l'a trouv� dans le cache !
    Set LireHi�rarchie = h
    ghie_iNbLireDuCache = ghie_iNbLireDuCache + 1
    Exit Function                     ' Et c'est fini pour LireHi�rarchie
  End If
  
  ' Pas trouv� dans le cache, on demande au d�mon
  On Error GoTo 0
  
  Bloquer
    Dim br As New Rev
    br.AddField sNumEtb
    tcps.Envoie "LHIE2 " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) = "->" Then
      Rel�cher
      Set LireHi�rarchie = Nothing
      Exit Function
    End If
    
    Dim nh As New Hi�rarchie
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
    
    ' On ajoute l'enregistrement de hi�rarchie dans le cache
    cache.Add nh.Copie, "H" & nh.sEtb
    
    ' Contr�le
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop
  Rel�cher
  
  Set LireHi�rarchie = nh
End Function


Sub EffaceCacheHi�rarchies()
  Dim i As Integer
  For i = 1 To cache.Count
    cache.Remove 1
  Next
End Sub


' Traces internes
Sub ListeHi�rarchies(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "N�Etb"
  lw.ColumnHeaders(2).Text = "cLangue"
  lw.ColumnHeaders(3).Text = "Options d'�dition / Options labo / CodeCli / InfoCli"
  lw.ColumnHeaders(4).Text = " "

  Dim d As Hi�rarchie
  For Each d In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = d.sEtb
    itmX.SubItems(1) = d.cLangue
    itmX.SubItems(2) = d.sOptionsEdition & " / " & d.sOptionsLabo & " / " & d.iCodeCli & " / " & d.sInfoCli
    itmX.SubItems(3) = ""
  Next
End Sub

