Attribute VB_Name = "MenuDémarrer"
' MenuDémarrer.bas
' Mise à jour du menu démarrer
' 31/08/1998 PV
'  2/10/1998 PV Applis Office
'  1/04/1999 PV zTrace
' 24/07/1999 PV Office 2000
'  3/12/1999 PV sDefaultDataPath à X:\ pour les micros EC/DI; office 97/2000 selon @IP
' 24/02/2000 PV Prise en compte des systèmes Italiens
'  3/04/2000 PV Fin de X:
'  7/04/2000 PV Traces détaillées; Windows 2000
'  7/08/2000 PV Lecteur multimédia, NAV, ... , MAJ Win.ini


Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long


Option Explicit

Public Sub MAJMenuDémarrer()
  DoMAJMenuDémarrer
  DoMAJWinIni
End Sub


Private Sub DoMAJMenuDémarrer()
  Dim sRaccourci As String
  
  Trace "Mise à jour du menu Démarrer…"
  
  ' On crée les dossiers standard Microb'Soft
  CréeDossier sMenuProg, "Applications"
  CréeDossier sMenuProg & "Applications\", "Outils Microsoft Office"
  CréeDossier sMenuProg, "Communication"
  CréeDossier sMenuProg, "Système"
  
  ' Ménage du bureau
  Déplace1Fichier sBureau, sMenuProg & "Système\", "Documents Dell.lnk"
  Déplace1Fichier sBureau, sMenuProg & "Accessoires\", "Acrobat Reader 4.0.lnk"
  Déplace1Fichier sBureau, sMenuProg & "Accessoires\", "WinZip.lnk"
  EffaceFichier sBureau & "Installation de Microsoft*.lnk"
  EffaceFichier sBureau & "NetMeeting.lnk"
  EffaceDossier sBureau & "Porte-Documents"
  
  ' Ménage du haut du menu démarrer
  EffaceFichier sMenuDémarrer & "WinZip.lnk"
  EffaceFichier sMenuDémarrer & "Lecteur Windows Media.lnk"
  Déplace1Fichier sMenuDémarrer, sMenuProg & "Système\", "Windows Update.lnk"
  
  ' Ménage du menu programmes
  EffaceFichier sMenuProg & "Lecteur Windows Media .lnk"     ' Avec un espace !
  EffaceDossier sMenuProg & "Référence Microsoft"
  
  ' On déplace les éventuels raccourcis Office
  sRaccourci = Dir(sMenuProg & "Microsoft*.lnk")
  While sRaccourci <> ""
    Déplace1Fichier sMenuProg & "\", sMenuProg & "Applications\", sRaccourci
    sRaccourci = Dir
  Wend
  Déplace1Fichier sMenuProg & "\", sMenuProg & "Applications\", "Classeur Microsoft Office.lnk"
  Déplace1Fichier sMenuProg & "\", sMenuProg & "Applications\Outils Microsoft Office\", "Assistant Financier.lnk"
  DéplaceDossier sMenuProg & "\Outils Microsoft Office", sMenuProg & "Applications\Outils Microsoft Office"
  
  ' On déplace les raccourcis du menu communications
  sRaccourci = Dir(sMenuProg & "Accessoires\Communications\*.lnk")
  While sRaccourci <> ""
    Déplace1Fichier sMenuProg & "Accessoires\Communications\", sMenuProg & "\Communication\", sRaccourci
    sRaccourci = Dir
  Wend
  EffaceDossier sMenuProg & "Accessoires\Communications\"
          
  ' Et certains menus système
  DéplaceDossier sMenuProg & "Accessoires\Outils système\", sMenuProg & "Système\Outils système\"
  DéplaceDossier sMenuProg & "Accessoires\Outils internet\", sMenuProg & "Communication\Outils internet\"
  
  DéplaceDossier sMenuProg & "Accessoires\Jeux\", sMenuProg & "Jeux\"
  DéplaceDossier sMenuProg & "Internet Explorer\", sMenuProg & "Communication\Internet Explorer\"
  DéplaceDossier sMenuProg & "Client Terminal Server\", sMenuProg & "Communication\Client Terminal Server\"
  DéplaceDossier sMenuProg & "Services en ligne\", sMenuProg & "Communication\Services en ligne\"
  DéplaceDossier sMenuProg & "3Com NIC Utilities\", sMenuProg & "Système\3Com NIC Utilities\"
  DéplaceDossier sMenuProg & "Accessoires de Dell\", sMenuProg & "Système\Accessoires de Dell\"
  DéplaceDossier sMenuProg & "Matériel Microsoft\", sMenuProg & "Système\"
  DéplaceDossier sMenuProg & "McAfee VirusScan\", sMenuProg & "Système\McAfee VirusScan\"
  DéplaceDossier sMenuProg & "Vision\", sMenuProg & "Système\Vision\"
  DéplaceDossier sMenuProg & "Documents Dell\", sMenuProg & "Système\Documents Dell\"
  DéplaceDossier sMenuProg & "WinZip\", sMenuProg & "Accessoires\WinZip\"
  DéplaceDossier2 sMenuProg, "Adobe Ac*", sMenuProg & "Accessoires\"
  DéplaceDossier2 sMenuProg, "3Com*", sMenuProg & "Système\"
  DéplaceDossier2 sMenuProg, "Norton*", sMenuProg & "Système\"
  DéplaceDossier2 sMenuProg, "Adaptec*", sMenuProg & "Système\"
  DéplaceDossier2 sMenuProg, "Microsoft H*", sMenuProg & "Système\"
  DéplaceDossier2 sMenuProg, "pcANYWHERE*", sMenuProg & "Système\"
  DéplaceDossier2 sMenuProg, "InstallShield*", sMenuProg & "Développement\"
  DéplaceDossier2 sMenuProg, "Utilitaires HP*", sMenuProg & "Système\"
  DéplaceDossier2 sMenuProg, "Toshiba*", sMenuProg & "Système\"
  DéplaceDossier2 sMenuProg, "HP Office*", sMenuProg & "Système\"
  DéplaceDossier2 sMenuProg, "Code national", sMenuProg & "Système\"
 
  ' Pour Windows 2000
  If sMenuProgUser <> "" Then
    CréeDossier sMenuProgUser, "Système"
    DéplaceDossier sMenuProgUser & "Accessoires de Dell\", sMenuProgUser & "Système\Accessoires de Dell\"
    DéplaceDossier sMenuProgUser & "Documents Dell\", sMenuProgUser & "Système\Documents Dell\"
    
    Déplace1Fichier sMenuProgUser, sMenuProg & "Communication\", "Internet Explorer.lnk"
    Déplace1Fichier sMenuProgUser, sMenuProg & "Communication\", "Outlook Express.lnk"
    Copie1Fichier sMenuProgUser & "Accessoires\", sMenuDémarrer, "Invite de commandes.lnk"
    
    'Copie1Fichier sMenuProgUser & "Accessoires\", sMenuDémarrer, "Explorateur Windows.lnk"
    Dim WSHShell As Object
    Set WSHShell = CreateObject("WScript.Shell")
    Dim MyShortCut As Object
    Set MyShortCut = WSHShell.CreateShortcut(sMenuDémarrer & sExplorateurWindows & ".lnk")
    With MyShortCut
      .TargetPath = "%SYSTEMROOT%\explorer.exe"
      .Arguments = "/e"
      .WorkingDirectory = "%HOMEDRIVE%%HOMEPATH%"
      .WindowStyle = 4
      .IconLocation = "%SYSTEMROOT%\explorer.exe, 0"
      .Save
    End With
  End If
  
  If sBureauUser <> "" Then
    EffaceFichier sBureauUser & "Connexion à Internet.lnk"
  End If
  
  If sMenuProgDefault <> "" Then
    CréeDossier sMenuProgDefault, "Système"
    DéplaceDossier sMenuProgDefault & "Accessoires de Dell\", sMenuProgDefault & "Système\Accessoires de Dell\"
    DéplaceDossier sMenuProgDefault & "Documents Dell\", sMenuProgDefault & "Système\Documents Dell\"
  End If
  
  Déplace1Fichier sMenuProg, sMenuDémarrer, "Explorateur Windows.lnk"
  Déplace1Fichier sMenuProg, sMenuDémarrer, "Commandes MS-DOS.pif"
  Déplace1Fichier sMenuDémarrer, sMenuProg & "Applications\Outils Microsoft Office\", "Nouveau document Office.lnk"
  Déplace1Fichier sMenuDémarrer, sMenuProg & "Applications\Outils Microsoft Office\", "Ouvrir un document Office.lnk"
  Déplace1Fichier sMenuProgDémarrage, sMenuProg & "Applications\Outils Microsoft Office\", "Microsoft Recherche accélérée.lnk"
  
  Déplace1Fichier sMenuProg & "Microsoft Autoroute\", sMenuProg & "Applications\", "Autoroute Express Europe 98.lnk"
  EffaceDossier sMenuProg & "Microsoft Autoroute\"

  Déplace1Fichier sMenuProg, sMenuProg & "Communication\", "Internet Explorer.lnk"
  Déplace1Fichier sMenuProg, sMenuProg & "Communication\", "Outlook Express.lnk"
  Déplace1Fichier sMenuProg, sMenuProg & "Communication\", "NetMeeting.lnk"

  Copie1Fichier sMenuProg & "Communication\", sMenuDémarrer, "Internet Explorer.lnk"
  
  
  CréeRaccourci sMenuProg & "Communication\VTerm.lnk", sProgramFiles & "VTerm\VTerm.exe", sProgramFiles & "VTerm"
  CréeDossier sMenuProg, "Panneau de configuration.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
  
  
  ' Démarrage (Serveur 6000)
  Copie1Fichier sMenuProgMicrobsoft, sMenuProg & "Démarrage\", "Serveur 6000.lnk"
  
  
  Copie1Fichier sMenuProg & "Applications\", sMenuQuickLaunch, "Microsoft Excel.lnk"
  Copie1Fichier sMenuProg & "Applications\", sMenuQuickLaunch, "Microsoft Word.lnk"
  Copie1Fichier sMenuProg & "Communication\", sMenuQuickLaunch, "VTerm.lnk"
  Copie1Fichier sMenuDémarrer, sMenuQuickLaunch, "Explorateur Windows.lnk"
  
  
  ' Les raccourcis du SendTo (Envoyer vers)
  CréeDossier sMenuSendTo, "Autres"
  Copie1Fichier sMenuProg & "Accessoires\", sMenuSendTo, "Bloc-Notes.lnk"
  Copie1Fichier sMenuProg & "Accessoires\", sMenuSendTo, "WordPad.lnk"
  
  Déplace1Fichier sMenuSendTo, sMenuSendTo & "Autres\", "Assistant Publication de sites Web.lnk"
  Déplace1Fichier sMenuSendTo, sMenuSendTo & "Autres\", "Destinataire de message utilisant Microsoft Outlook.lnk"
  Déplace1Fichier sMenuSendTo, sMenuSendTo & "Autres\", "Destinataire.lnk"
  Déplace1Fichier sMenuSendTo, sMenuSendTo & "Autres\", "Porte-documents.lnk"
  
  ' On détermine le chemin par défaut en fonction de l'adresse IP du poste
  Dim sDefaultDataPath As String
  Dim IPserveur As String
  Dim p1 As Integer
  Dim si As New SocketInfo
  
  IPserveur = si.sAdresseIP
'  Select Case IPserveur
'  '      Uranus            Neptune           Donald            EC1                Pluto              Taillefer
'    Case "200.200.200.85", "200.200.200.82", "200.200.200.81", "200.200.200.141", "200.200.200.106", "200.200.200.130"
'      sDefaultDataPath = "X:\"
'    Case Else:
      sDefaultDataPath = "W:\"
'  End Select
  
  Dim iVersionOffice As Integer
  If Left(IPserveur, 12) = "200.200.200." Then
    iVersionOffice = 2000   ' Sur Grenoble
  Else
    iVersionOffice = 97     ' Ailleurs
  End If

  On Error Resume Next
  ' Assez sensible...
  
  ' Un peu de mise à jour de la registry pour Office, au passage…
  Trace "Mise à jour de la registry pour Office…"
  Select Case iVersionOffice
    Case 97:
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Common"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Common\FileNew"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Common\FileNew\SharedTemplates"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Query"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Query\DataSourceFolders"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\PowerPoint"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\PowerPoint\Recent Folder List"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\PowerPoint\Recent Folder List\Default"
      
      DéfinitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Common\FileNew\SharedTemplates", "", "W:\commun\modeles"
      DéfinitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "AltStartup", "W:\commun\excel"
      DéfinitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "DefaultPath", sDefaultDataPath
      DéfinitValeurRegistry "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "DefFileMRU", 8     ' 8 fichiers récents par défaut
      DéfinitValeurRegistry "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options5", 3201    ' Pas de déplacement de la sélection vers le bas
      DéfinitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "DOC-PATH", sDefaultDataPath
      DéfinitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Query\DataSourceFolders", "0", "w:\commun\dsn"
      DéfinitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\PowerPoint\Recent Folder List\Default", "", sDefaultDataPath

    Case 2000:
      Trace "Mise à jour de la registry pour Office…"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Common"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Common\General"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Options"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Options"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Query"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Query\DataSourceFolders"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\PowerPoint"
      CréeCléRegistry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\PowerPoint\Recent Folder List"
      
      DéfinitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Common\General", "SharedTemplates", "W:\commun\modeles"
      DéfinitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Options", "DefaultPath", sDefaultDataPath
      DéfinitValeurRegistry "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Options", "DefFileMRU", 8     ' 8 fichiers récents par défaut
      DéfinitValeurRegistry "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Options", "Options5", 3201    ' Pas de déplacement de la sélection vers le bas
      DéfinitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Options", "DOC-PATH", sDefaultDataPath
      DéfinitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Query\DataSourceFolders", "0", "w:\commun\dsn"
      DéfinitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\PowerPoint", "Default", sDefaultDataPath
    
    Case Else:
      Stop
  End Select
  
  On Error GoTo 0
  
End Sub


Public Function sGetProfile(ByVal sFichier As String, ByVal sSection As String, ByVal sClé As String, ByVal sDéfaut As String) As String
  Dim sRes As String, l As Long
  sRes = Space(500)
  l = GetPrivateProfileString(sSection, sClé, sDéfaut, sRes, 500, sFichier)
  sGetProfile = Left(sRes, l)
End Function


Public Sub SetProfile(ByVal sFichier As String, ByVal sSection As String, ByVal sClé As String, ByVal sValeur As String)
  Dim l As Long
  
  l = WritePrivateProfileString(sSection, sClé, sValeur, sFichier)
End Sub


Private Sub DoMAJWinIni()
  Trace "Mise à jour du win.ini…"
  Dim s As String
  s = sGetProfile("win.ini", "windows", "load", "")
  If InStr(1, s, "majsoft", vbTextCompare) <> 0 Then
    Trace "Elimination de majsoft du win.ini"
    SetProfile "win.ini", "windows", "load", ""
  End If
End Sub
