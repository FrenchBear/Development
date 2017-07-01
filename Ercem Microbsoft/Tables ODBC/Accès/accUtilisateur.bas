Attribute VB_Name = "accUtilisateur"
' accUtilisateur
' Accès aux utilisateurs
' 19/01/1998 PV
'  2/05/1998 PV Gestion du cache disque local, pour les accès ODBC à 64K…
' 22/07/1998 PV Date+heure du fichier cache gérée correctement
' 12/08/1999 PV dMaxUtilisateur lu depuis sysinfo.si_mtu pour optimiser le démarrage
' 25/08/1999 PV Cas où le programme est lancé depuis un périph en lecture seule: pas d'écriture du cache
' 20/03/2000 PV Gestion de uti_bal (cache 3)
' 25/05/2000 PV Collection privée accessible au travers d'une fonction et invalidation du cache



Option Explicit

Private m_colUtilisateur As New Collection

Public Function colUtilisateur() As Collection
  If m_colUtilisateur.Count = 0 Then ChargeUtilisateurs
  Set colUtilisateur = m_colUtilisateur
End Function

Public Sub InvalideColUtilisateur()
  EffaceCollection m_colUtilisateur
  dMaxUtilisateur = Now   ' Empêche l'utilisation du cache disque local
End Sub

Public Sub ChargeUtilisateurs()
  Dim cUtilisateur As New BDCurseur
  Dim u As New Utilisateur
  
  ' En cas de changement de système, on efface la liste
  EffaceCollection m_colUtilisateur
  
  ' dMaxUtilisateur est lu dans sysinfo
  ' Plus de select max(timestamp)… pour accélérer le démarrage
  
  Dim sNomCacheDisque As String
  sNomCacheDisque = App.Path & "\Cache utilisateurs 3.dat"
  
  Dim bOkCacheDisque As Boolean
  On Error Resume Next
  bOkCacheDisque = FileDateTime(sNomCacheDisque) >= dMaxUtilisateur
  If Err Then bOkCacheDisque = False
  On Error GoTo 0


  If bOkCacheDisque Then
    Dim iNumUti As Integer, ut As New Utilisateur
    
    Open sNomCacheDisque For Input As #1
    Input #1, iNumUti
    Do Until EOF(1)
      ut.DiskRead 1
      ' On ajoute l'utilisateur dans le cache mémoire
      m_colUtilisateur.Add ut.Copie, "U" & ut.uti_numuti
    Loop
    Close #1
    
  Else
    cUtilisateur.OpenCurseur "select uti_numuti,uti_nom,uti_bal,uti_passwd,uti_unite,uti_systemes,uti_niveau from utilisateur where uti_systemes<>'-' order by uti_nom"
    While Not cUtilisateur.EOF
      u.uti_numuti = cUtilisateur!uti_numuti
      u.uti_nom = cUtilisateur!uti_nom
      u.uti_bal = cUtilisateur!uti_bal
      u.uti_unite = cUtilisateur!uti_unite
      u.uti_systemes = cUtilisateur!uti_systemes
      u.uti_niveau = cUtilisateur!uti_niveau
      
      u.uti_passwdlogin = cUtilisateur!uti_passwd
      
      m_colUtilisateur.Add u.Copie, "U" & u.uti_numuti
      cUtilisateur.MoveNext
    Wend
    cUtilisateur.CloseCurseur
    
    On Error Resume Next
    Open sNomCacheDisque For Output As #1
    If Err Then
      If Err <> 75 Then   ' Accès en lecture seule: on ignore silencieusement
        MsgBox "Échec à l'ouverture en écriture du cache disque '" & sNomCacheDisque & "'" & vbCrLf & vbCrLf & "Err=" & Err.Number & ": " & Err.Description & vbCrLf & vbCrLf & "Prévenez le service Informatique !", vbExclamation, App.Title
      End If
      On Error GoTo 0
    Else
      On Error GoTo 0
      Write #1, m_colUtilisateur.Count
      For Each ut In m_colUtilisateur
        ut.DiskWrite 1
      Next
      Close #1
      
      ' On positionne la date et l'heure du cache à dMaxUtilisateur et non pas
      ' à l'heure courante, non pas à cause du décalage horaire éventuel du micro,
      ' mais parce que le système Unix local n'a peut-être pas encore été synchronisé
      ' depuis le serveur, alors que la table utilisateur a été modifiée.
      ' Les temps en seconde impairs sont arrondis au multiple de 2 supérieur, c'est
      ' ce qu'on veut !
      SetFileDateTime sNomCacheDisque, dMaxUtilisateur
    End If
    
  End If
  
End Sub


Function sNomUtilisateur(sNum As Variant) As String
  If IsNull(sNum) Then
    sNomUtilisateur = ""
  Else
    On Error Resume Next
    sNomUtilisateur = colUtilisateur("U" & Trim(sNum)).uti_nom
    If Err = 0 Then Exit Function
    On Error GoTo 0
    sNomUtilisateur = ""
  End If
End Function

