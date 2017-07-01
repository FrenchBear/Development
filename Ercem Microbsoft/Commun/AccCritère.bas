Attribute VB_Name = "AccCrit�re"
' Fonctions d'acc�s aux crit�res
' Acc�s par num�ro, recherche�
' 4/09/97 PV

Option Explicit

' Cache des crit�res
Private cache As New Collection

' Transposition v0 --> derni�re version
' Cl�: C et le nom du crit�re
' Valeur stock�e: "V" suivi du num�ro de la derni�re version (on ne peut pas ajouter un integer � une collection�)
Private cacheV0 As New Collection

' Statistiques
Public gcri_iNbLire As Integer
Public gcri_iNbLireDuCache As Integer


Function gcri_iCacheCount() As Integer
  gcri_iCacheCount = cache.Count
End Function


' Lit compl�tement un Crit�re
Public Function LireCrit�re(sCrit As String, Optional ByVal iVersion As Integer = 0) As Crit�re
  Dim i As Integer
  Dim bAM�moriserDansV0 As Boolean
  
  gcri_iNbLire = gcri_iNbLire + 1
  bAM�moriserDansV0 = False
  
  ' Si on demande la derni�re version (iVersion=0), on cherche d'abord dans
  ' cacheV0 si on connait le num�ro r�elle de derni�re version
  If iVersion = 0 Then
    Dim iDerni�reVersion As Integer
    On Error Resume Next
    iDerni�reVersion = Val(Mid(cacheV0("C" & sCrit), 2))
    If Err = 0 Then                       ' On l'a trouv� dans le cache !
      iVersion = iDerni�reVersion
    Else
      bAM�moriserDansV0 = True
    End If
    On Error GoTo 0
  End If
  
  ' Ensuite on cherche si on n'a pas le crit�re dans le cache
  If iVersion > 0 Then
    Dim ec As Crit�re
    On Error Resume Next
    Set ec = cache("C" & sCrit & ";" & iVersion)
    If Err = 0 Then                       ' On l'a trouv� dans le cache !
      Set LireCrit�re = ec
      gcri_iNbLireDuCache = gcri_iNbLireDuCache + 1
      Exit Function                     ' Et c'est fini pour LireCrit�re
    End If
    On Error GoTo 0
  End If
  
  ' Pas trouv� dans le cache, on demande au d�mon
  Bloquer
    Dim br As New Rev
    br.AddField sCrit
    br.AddField iVersion
    tcps.Envoie "LCRI " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) = "->" Then
      Rel�cher
      Set LireCrit�re = Nothing
      Exit Function
    End If
    
    Dim cr As New Crit�re
    Dim v As Variant
    br.Buffer = sLigne
    
    br.GetField v: cr.cri_critere = v
    br.GetField v: cr.cri_version = v
    br.GetField v: cr.cri_titre = v
    br.GetField v: cr.cri_nbger = v
    
    ' On r�cup�re le corps
    For i = 1 To cr.cri_nbger
      sLigne = tcps.Re�oit
      If Left(sLigne, 2) = "->" Then
        Rel�cher
        MsgBox "Erreur interne lors de la r�ception d'un crit�re"
        Stop
        Set LireCrit�re = Nothing
        Exit Function
      End If
      
      Dim iGerme As Integer, sUnit� As String, m As Double, s As Double
      br.GetField iGerme, sUnit�, m, s
      cr.SetGerme i, iGerme, m, s
    Next
    
    ' On ajoute le crit�re dans le cache
    cache.Add cr.Copie, "C" & cr.cri_critere & ";" & cr.cri_version
    
    ' Si n�cessaire, on le stocke d'indice de la derni�re version dans cacheV0
    If bAM�moriserDansV0 Then
      cacheV0.Add "V" & cr.cri_version, "C" & cr.cri_critere
    End If
    
    ' Contr�le
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop
  Rel�cher
  
  Set LireCrit�re = cr
End Function



Sub EffaceCacheCrit�res()
  Dim i As Integer
  For i = 1 To cache.Count
    cache.Remove 1
  Next
End Sub


' Traces internes
Sub ListeCrit�res(lw As ListView)
  Dim itmX As ListItem

  lw.ListItems.Clear
  lw.ColumnHeaders(1).Text = "Crit�re"
  lw.ColumnHeaders(2).Text = "Version"
  lw.ColumnHeaders(3).Text = "Titre"
  lw.ColumnHeaders(4).Text = "NbGer"
  
  Dim c As Crit�re
  For Each c In cache
    Set itmX = lw.ListItems.Add()
    itmX.Text = c.cri_critere
    itmX.SubItems(1) = c.cri_version
    itmX.SubItems(2) = c.cri_titre
    itmX.SubItems(3) = c.cri_nbger
  Next
End Sub

