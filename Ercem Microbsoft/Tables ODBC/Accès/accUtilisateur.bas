Attribute VB_Name = "accUtilisateur"
' accUtilisateur
' Acc�s aux utilisateurs
' 19/01/1998 PV
'  2/05/1998 PV Gestion du cache disque local, pour les acc�s ODBC � 64K�
' 22/07/1998 PV Date+heure du fichier cache g�r�e correctement
' 12/08/1999 PV dMaxUtilisateur lu depuis sysinfo.si_mtu pour optimiser le d�marrage
' 25/08/1999 PV Cas o� le programme est lanc� depuis un p�riph en lecture seule: pas d'�criture du cache
' 20/03/2000 PV Gestion de uti_bal (cache 3)
' 25/05/2000 PV Collection priv�e accessible au travers d'une fonction et invalidation du cache



Option Explicit

Private m_colUtilisateur As New Collection

Public Function colUtilisateur() As Collection
  If m_colUtilisateur.Count = 0 Then ChargeUtilisateurs
  Set colUtilisateur = m_colUtilisateur
End Function

Public Sub InvalideColUtilisateur()
  EffaceCollection m_colUtilisateur
  dMaxUtilisateur = Now   ' Emp�che l'utilisation du cache disque local
End Sub

Public Sub ChargeUtilisateurs()
  Dim cUtilisateur As New BDCurseur
  Dim u As New Utilisateur
  
  ' En cas de changement de syst�me, on efface la liste
  EffaceCollection m_colUtilisateur
  
  ' dMaxUtilisateur est lu dans sysinfo
  ' Plus de select max(timestamp)� pour acc�l�rer le d�marrage
  
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
      ' On ajoute l'utilisateur dans le cache m�moire
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
      If Err <> 75 Then   ' Acc�s en lecture seule: on ignore silencieusement
        MsgBox "�chec � l'ouverture en �criture du cache disque '" & sNomCacheDisque & "'" & vbCrLf & vbCrLf & "Err=" & Err.Number & ": " & Err.Description & vbCrLf & vbCrLf & "Pr�venez le service Informatique !", vbExclamation, App.Title
      End If
      On Error GoTo 0
    Else
      On Error GoTo 0
      Write #1, m_colUtilisateur.Count
      For Each ut In m_colUtilisateur
        ut.DiskWrite 1
      Next
      Close #1
      
      ' On positionne la date et l'heure du cache � dMaxUtilisateur et non pas
      ' � l'heure courante, non pas � cause du d�calage horaire �ventuel du micro,
      ' mais parce que le syst�me Unix local n'a peut-�tre pas encore �t� synchronis�
      ' depuis le serveur, alors que la table utilisateur a �t� modifi�e.
      ' Les temps en seconde impairs sont arrondis au multiple de 2 sup�rieur, c'est
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

