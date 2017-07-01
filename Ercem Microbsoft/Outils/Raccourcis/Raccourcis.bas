Attribute VB_Name = "GestionRaccourcis"
' Module GestionRaccourcis
' Routines de mise à jour des raccourcis de Microb'Soft
' 20/08/1998 SS
' 21/08/1998 PV
' 31/08/1998 PV Remise au carré, modules Menuxxx
' 24/02/2000 PV Prise en compte des systèmes Italiens; C:\Program Files en variable
'  7/04/2000 PV Chemin "C:\Program Files" lu dans la registry. Version Windows 2000 "all users"
' 16/10/2000 PV EnlèveAttributRO


Option Explicit


Public sProgramFiles As String            ' …\Program files\              (ou la version locale)
Public sDossierMicrobsoft As String       ' …\Program files\Microbsoft\   (applis Microb'Soft)
Public sMenuDémarrer As String            ' …\Menu Démarrer\
Public sMenuProg As String                ' …\Menu Démarrer\Programmes\   (standard sous 95/98, AllUsers sous NT)
Public sMenuProgUser As String            ' …\Menu Démarrer\Programmes\   (utilisateur courant sous NT)
Public sMenuProgDefault As String         ' …\Menu Démarrer\Programmes\   (utilisateur à créer sous NT)
Public sMenuProgMicrobsoft As String      ' …\Menu Démarrer\Programmes\Microb'Soft\
Public sMenuProgDémarrage As String       ' …\Menu Démarrer\Programmes\Démarrage\
Public sMenuSendTo As String              ' …\Windows\SendTo\
Public sBureau As String                  ' Raccourci sur le bureau (std 95/98, AllUsers sous NT)
Public sBureauUser As String              ' Raccourci sur le bureau (de l'utilisateur)
Public sMenuQuickLaunch As String         ' Raccourcis de la barre de boutons

Dim WSHShell As Object                    ' Accès aux raccourcis
Dim WSHNetwork As IWshNetwork             ' Accès aux infos réseau (Whidows Script Host Object Model 1.0 WSHOM.OCX)
Dim fso As FileSystemObject               ' Accès au FileSystem (Microsoft Scripting RunTime, SCRRUN.DLL)


Private Function SF(sNom, sAltNom) As String
  Dim s As String
  s = WSHShell.SpecialFolders(sNom)
  If s = "" Then s = WSHShell.SpecialFolders(sAltNom)
  If Right(s, 1) <> "\" Then s = s & "\"
  SF = s
End Function


' Initialise les variables globales de gestion des raccourcis
Public Sub InitRaccourcis()
  Set WSHShell = CreateObject("WScript.Shell")
  Set fso = New FileSystemObject
  
  Set WSHNetwork = CreateObject("WScript.Network")
  Trace "UserName = " & WSHNetwork.UserName
  Trace "UserDomain = " & WSHNetwork.UserDomain
  Trace "ComputerName = " & WSHNetwork.ComputerName
  Trace ""
  Select Case LangueSystème
    Case LANG_DUTCH:    Trace "Language = Dutch"
    Case LANG_ENGLISH:  Trace "Language = English"
    Case LANG_FRENCH:   Trace "Langue = Français"
    Case LANG_GERMAN:   Trace "Langue = Allemand"
    Case LANG_ITALIAN:  Trace "Langue = Italien"
    Case LANG_SPANISH:  Trace "Langue = Espagnol"
    Case LANG_POLISH:   Trace "Langue = Polonais"
    Case Else:          Trace "Langue = 0x" & Hex(LangueSystème)
  End Select
  Trace ""
  
  ' Récupération du dossier des programmes
  sProgramFiles = RécupèreValeurRegistry("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "ProgramFilesDir", "REG_SZ")
  If Right(sProgramFiles, 1) <> "\" Then sProgramFiles = sProgramFiles & "\"
  sDossierMicrobsoft = sProgramFiles & "Microbsoft\"
  Trace "sProgramFiles = " & sProgramFiles
  Trace "sDossierMicrobsoft = " & sDossierMicrobsoft
  
  sMenuDémarrer = SF("AllUsersStartMenu", "StartMenu")
  sMenuProg = SF("AllUsersPrograms", "Programs")
  sMenuProgMicrobsoft = sMenuProg & "Microb'Soft\"
  sMenuProgDémarrage = SF("AllUsersStartup", "Startup")
  sMenuSendTo = WSHShell.SpecialFolders("sendto") & "\"
  ' Attention, sous 98 AllUserDesktop renvoir C:\Windows\All users\Desktop qui existe mais ne sert à rien...
  If WSHShell.SpecialFolders("AllUsersPrograms") <> "" Then
    sBureau = SF("AllUsersDesktop", "Desktop")
  Else
    sBureau = WSHShell.SpecialFolders("Desktop") & "\"
  End If
  
  Trace "sMenuDémarrer = " & sMenuDémarrer
  Trace "sMenuProg = " & sMenuProg
  Trace "sMenuProgMicrobsoft = " & sMenuProgMicrobsoft
  Trace "sMenuProgDémarrage = " & sMenuProgDémarrage
  Trace "sMenuSendTo = " & sMenuSendTo
  Trace "sBureau = " & sBureau
  
  ' Pour Windows 2000
  If WSHShell.SpecialFolders("AllUsersPrograms") <> "" Then
    sMenuProgUser = WSHShell.SpecialFolders("Programs")
    If Right(sMenuProgUser, 1) <> "\" Then sMenuProgUser = sMenuProgUser & "\"
    sBureauUser = WSHShell.SpecialFolders("Desktop")
    If Right(sBureauUser, 1) <> "\" Then sBureauUser = sBureauUser & "\"
    sMenuProgDefault = Replace(sMenuProg, "All users", "Default user", , , vbTextCompare)
    Trace "sMenuProgUser = " & sMenuProgUser
    Trace "sMenuProgDefault = " & sMenuProgDefault
    Trace "sBureauUser = " & sBureauUser
  End If
  
  ' La barre QuickLaunch ne fonctionne pas avec "All users"...
  Dim p As Integer, sBureauPerso As String
  sBureauPerso = WSHShell.SpecialFolders("Desktop")
  p = InStrRev(sBureauPerso, "\", Len(sBureauPerso) - 1)
  sMenuQuickLaunch = Left(sBureauPerso, p) & "Application Data\Microsoft\Internet Explorer\Quick Launch\"
  Trace "sMenuQuickLaunch = " & sMenuQuickLaunch
  CréeDossier Left(sBureauPerso, p) & "Application Data\Microsoft\", "Internet Explorer"
  CréeDossier Left(sBureauPerso, p) & "Application Data\Microsoft\Internet Explorer\", "Quick Launch"
End Sub


' Attention, si la cible pointe sur une unité inexistante, crée un raccourci avec chaque élément
' du path tronqué à 8 caractères !
' Ex: X:\Microbso\TablesLa.exe au lieu de Z:\Microbsoft\TablesLabo.exe

Public Sub CréeRaccourci(Nom As String, cible As String, travail As String)
  TraceDétaillée "CréeRaccourci " & Nom & ", " & cible & ", " & travail
  
  Dim MyShortCut As Object
  
  Set MyShortCut = WSHShell.CreateShortcut(Nom)
  With MyShortCut
      .TargetPath = WSHShell.ExpandEnvironmentStrings(cible)
      .WorkingDirectory = travail
      .WindowStyle = 4
      .IconLocation = cible & ", 0"
      .Save
  End With
End Sub


Public Function bRaccourciPointantSurZ(sNom As String) As Boolean
  Dim MyShortCut As Object
  
  ' Pour tester les propriétés
  ' Mais pose des problèmes si la bonne version de WSHOM.OCX (Windows Script Host Object Model 1.0) n'est pas installée
  'Dim w As IWshShell
  'Dim s As IWshShortcut_Class
  
  Set MyShortCut = WSHShell.CreateShortcut(sNom)
  If InStr(1, MyShortCut.TargetPath, "Z:", vbTextCompare) <> 0 Or InStr(1, MyShortCut.WorkingDirectory, "Z:", vbTextCompare) <> 0 Then
    bRaccourciPointantSurZ = True
  End If
End Function


' Accès à l'objet FileSystem sans erreurs si la source n'existe pas
Public Sub CréeDossier(sPath As String, sNom As String)
  TraceDétaillée "CréeDossier " & sPath & ", " & sNom
  Dim f As Scripting.Folder
  Dim nf As Scripting.Folder    ' Nouveau dossier
  On Error Resume Next
  Set f = fso.GetFolder(sPath)
  If Err Then
    MsgBox "Erreur " & Err & " (" & Err.Source & "): " & Err.Description, vbExclamation, sNomApp
    Exit Sub
  End If
  
  Set nf = f.SubFolders.Add(sNom)
End Sub


Public Sub DéplaceFichier(ByVal sFichierSource As String, ByVal sFichierDestination As String)
  TraceDétaillée "DéplaceFichier " & sFichierSource & ", " & sFichierDestination
  If Not fso.FileExists(sFichierSource) Then Exit Sub
  If fso.FileExists(sFichierDestination) Then fso.DeleteFile sFichierDestination
  fso.MoveFile sFichierSource, sFichierDestination
End Sub

Public Sub Déplace1Fichier(ByVal sDossierSource As String, ByVal sDossierDestination As String, ByVal sFichier As String)
  TraceDétaillée "Déplace1Fichier " & sDossierSource & ", " & sDossierDestination & " " & sFichier
  DéplaceFichier sDossierSource & sFichier, sDossierDestination & sFichier
End Sub


Public Sub CopieFichier(ByVal sFichierSource As String, ByVal sFichierDestination As String)
  TraceDétaillée "CopieFichier " & sFichierSource & ", " & sFichierDestination
  If Not fso.FileExists(sFichierSource) Then Exit Sub
  If fso.FileExists(sFichierDestination) Then fso.DeleteFile sFichierDestination
  fso.CopyFile sFichierSource, sFichierDestination
End Sub

Public Sub Copie1Fichier(ByVal sDossierSource As String, ByVal sDossierDestination As String, ByVal sFichier As String)
  TraceDétaillée "Copie1Fichier " & sDossierSource & ", " & sDossierDestination & ", " & sFichier
  CopieFichier sDossierSource & sFichier, sDossierDestination & sFichier
End Sub


Public Sub DéplaceDossier(ByVal sSource As String, ByVal sDestination As String)
  TraceDétaillée "DéplaceDossier " & sSource & " " & sDestination
  If Right(sSource, 1) = "\" Then sSource = Left(sSource, Len(sSource) - 1)
  If Right(sDestination, 1) = "\" Then sDestination = Left(sDestination, Len(sDestination) - 1)
  
  If Not fso.FolderExists(sSource) Then Exit Sub

  If fso.FolderExists(sDestination) Then
    On Error Resume Next
    fso.CopyFolder sSource, sDestination
    fso.DeleteFolder sSource, True
  Else
    fso.MoveFolder sSource, sDestination
  End If
End Sub

Public Sub DéplaceDossier2(ByVal sSource As String, ByVal sPattern As String, ByVal sDestination As String)
  TraceDétaillée "DéplaceDossier2 " & sSource & " " & sPattern & " " & sDestination
  Dim f As String
  f = Dir(sSource & sPattern, vbDirectory)
  Do
    If f = "" Then Exit Sub
    DéplaceDossier sSource & f, sDestination & f
    f = Dir
  Loop
End Sub


Public Sub EffaceDossier(ByVal sDossier As String)
  TraceDétaillée "EffaceDossier " & sDossier
  If Right(sDossier, 1) = "\" Then sDossier = Left(sDossier, Len(sDossier) - 1)
  
  If Not fso.FolderExists(sDossier) Then Exit Sub
  fso.DeleteFolder sDossier, True
End Sub


Public Sub EffaceFichier(ByVal sFichier As String)
  TraceDétaillée "EffaceFichier " & sFichier
  On Error Resume Next
  fso.DeleteFile sFichier
End Sub


Public Sub EnlèveAttributRO(ByVal sFichier As String)
  TraceDétaillée "EnlèveAttributRO " & sFichier
  On Error Resume Next
  Dim f As File
  
  Set f = fso.GetFile(sFichier)
  If (f.Attributes And 1) Then
    f.Attributes = f.Attributes And (Not 1)
  End If
End Sub


