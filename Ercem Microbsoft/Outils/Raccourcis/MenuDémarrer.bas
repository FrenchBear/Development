Attribute VB_Name = "MenuD�marrer"
' MenuD�marrer.bas
' Mise � jour du menu d�marrer
' 31/08/1998 PV
'  2/10/1998 PV Applis Office
'  1/04/1999 PV zTrace
' 24/07/1999 PV Office 2000
'  3/12/1999 PV sDefaultDataPath � X:\ pour les micros EC/DI; office 97/2000 selon @IP
' 24/02/2000 PV Prise en compte des syst�mes Italiens
'  3/04/2000 PV Fin de X:
'  7/04/2000 PV Traces d�taill�es; Windows 2000
'  7/08/2000 PV Lecteur multim�dia, NAV, ... , MAJ Win.ini


Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Public Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long


Option Explicit

Public Sub MAJMenuD�marrer()
  DoMAJMenuD�marrer
  DoMAJWinIni
End Sub


Private Sub DoMAJMenuD�marrer()
  Dim sRaccourci As String
  
  Trace "Mise � jour du menu D�marrer�"
  
  ' On cr�e les dossiers standard Microb'Soft
  Cr�eDossier sMenuProg, "Applications"
  Cr�eDossier sMenuProg & "Applications\", "Outils Microsoft Office"
  Cr�eDossier sMenuProg, "Communication"
  Cr�eDossier sMenuProg, "Syst�me"
  
  ' M�nage du bureau
  D�place1Fichier sBureau, sMenuProg & "Syst�me\", "Documents Dell.lnk"
  D�place1Fichier sBureau, sMenuProg & "Accessoires\", "Acrobat Reader 4.0.lnk"
  D�place1Fichier sBureau, sMenuProg & "Accessoires\", "WinZip.lnk"
  EffaceFichier sBureau & "Installation de Microsoft*.lnk"
  EffaceFichier sBureau & "NetMeeting.lnk"
  EffaceDossier sBureau & "Porte-Documents"
  
  ' M�nage du haut du menu d�marrer
  EffaceFichier sMenuD�marrer & "WinZip.lnk"
  EffaceFichier sMenuD�marrer & "Lecteur Windows Media.lnk"
  D�place1Fichier sMenuD�marrer, sMenuProg & "Syst�me\", "Windows Update.lnk"
  
  ' M�nage du menu programmes
  EffaceFichier sMenuProg & "Lecteur Windows Media .lnk"     ' Avec un espace !
  EffaceDossier sMenuProg & "R�f�rence Microsoft"
  
  ' On d�place les �ventuels raccourcis Office
  sRaccourci = Dir(sMenuProg & "Microsoft*.lnk")
  While sRaccourci <> ""
    D�place1Fichier sMenuProg & "\", sMenuProg & "Applications\", sRaccourci
    sRaccourci = Dir
  Wend
  D�place1Fichier sMenuProg & "\", sMenuProg & "Applications\", "Classeur Microsoft Office.lnk"
  D�place1Fichier sMenuProg & "\", sMenuProg & "Applications\Outils Microsoft Office\", "Assistant Financier.lnk"
  D�placeDossier sMenuProg & "\Outils Microsoft Office", sMenuProg & "Applications\Outils Microsoft Office"
  
  ' On d�place les raccourcis du menu communications
  sRaccourci = Dir(sMenuProg & "Accessoires\Communications\*.lnk")
  While sRaccourci <> ""
    D�place1Fichier sMenuProg & "Accessoires\Communications\", sMenuProg & "\Communication\", sRaccourci
    sRaccourci = Dir
  Wend
  EffaceDossier sMenuProg & "Accessoires\Communications\"
          
  ' Et certains menus syst�me
  D�placeDossier sMenuProg & "Accessoires\Outils syst�me\", sMenuProg & "Syst�me\Outils syst�me\"
  D�placeDossier sMenuProg & "Accessoires\Outils internet\", sMenuProg & "Communication\Outils internet\"
  
  D�placeDossier sMenuProg & "Accessoires\Jeux\", sMenuProg & "Jeux\"
  D�placeDossier sMenuProg & "Internet Explorer\", sMenuProg & "Communication\Internet Explorer\"
  D�placeDossier sMenuProg & "Client Terminal Server\", sMenuProg & "Communication\Client Terminal Server\"
  D�placeDossier sMenuProg & "Services en ligne\", sMenuProg & "Communication\Services en ligne\"
  D�placeDossier sMenuProg & "3Com NIC Utilities\", sMenuProg & "Syst�me\3Com NIC Utilities\"
  D�placeDossier sMenuProg & "Accessoires de Dell\", sMenuProg & "Syst�me\Accessoires de Dell\"
  D�placeDossier sMenuProg & "Mat�riel Microsoft\", sMenuProg & "Syst�me\"
  D�placeDossier sMenuProg & "McAfee VirusScan\", sMenuProg & "Syst�me\McAfee VirusScan\"
  D�placeDossier sMenuProg & "Vision\", sMenuProg & "Syst�me\Vision\"
  D�placeDossier sMenuProg & "Documents Dell\", sMenuProg & "Syst�me\Documents Dell\"
  D�placeDossier sMenuProg & "WinZip\", sMenuProg & "Accessoires\WinZip\"
  D�placeDossier2 sMenuProg, "Adobe Ac*", sMenuProg & "Accessoires\"
  D�placeDossier2 sMenuProg, "3Com*", sMenuProg & "Syst�me\"
  D�placeDossier2 sMenuProg, "Norton*", sMenuProg & "Syst�me\"
  D�placeDossier2 sMenuProg, "Adaptec*", sMenuProg & "Syst�me\"
  D�placeDossier2 sMenuProg, "Microsoft H*", sMenuProg & "Syst�me\"
  D�placeDossier2 sMenuProg, "pcANYWHERE*", sMenuProg & "Syst�me\"
  D�placeDossier2 sMenuProg, "InstallShield*", sMenuProg & "D�veloppement\"
  D�placeDossier2 sMenuProg, "Utilitaires HP*", sMenuProg & "Syst�me\"
  D�placeDossier2 sMenuProg, "Toshiba*", sMenuProg & "Syst�me\"
  D�placeDossier2 sMenuProg, "HP Office*", sMenuProg & "Syst�me\"
  D�placeDossier2 sMenuProg, "Code national", sMenuProg & "Syst�me\"
 
  ' Pour Windows 2000
  If sMenuProgUser <> "" Then
    Cr�eDossier sMenuProgUser, "Syst�me"
    D�placeDossier sMenuProgUser & "Accessoires de Dell\", sMenuProgUser & "Syst�me\Accessoires de Dell\"
    D�placeDossier sMenuProgUser & "Documents Dell\", sMenuProgUser & "Syst�me\Documents Dell\"
    
    D�place1Fichier sMenuProgUser, sMenuProg & "Communication\", "Internet Explorer.lnk"
    D�place1Fichier sMenuProgUser, sMenuProg & "Communication\", "Outlook Express.lnk"
    Copie1Fichier sMenuProgUser & "Accessoires\", sMenuD�marrer, "Invite de commandes.lnk"
    
    'Copie1Fichier sMenuProgUser & "Accessoires\", sMenuD�marrer, "Explorateur Windows.lnk"
    Dim WSHShell As Object
    Set WSHShell = CreateObject("WScript.Shell")
    Dim MyShortCut As Object
    Set MyShortCut = WSHShell.CreateShortcut(sMenuD�marrer & sExplorateurWindows & ".lnk")
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
    EffaceFichier sBureauUser & "Connexion � Internet.lnk"
  End If
  
  If sMenuProgDefault <> "" Then
    Cr�eDossier sMenuProgDefault, "Syst�me"
    D�placeDossier sMenuProgDefault & "Accessoires de Dell\", sMenuProgDefault & "Syst�me\Accessoires de Dell\"
    D�placeDossier sMenuProgDefault & "Documents Dell\", sMenuProgDefault & "Syst�me\Documents Dell\"
  End If
  
  D�place1Fichier sMenuProg, sMenuD�marrer, "Explorateur Windows.lnk"
  D�place1Fichier sMenuProg, sMenuD�marrer, "Commandes MS-DOS.pif"
  D�place1Fichier sMenuD�marrer, sMenuProg & "Applications\Outils Microsoft Office\", "Nouveau document Office.lnk"
  D�place1Fichier sMenuD�marrer, sMenuProg & "Applications\Outils Microsoft Office\", "Ouvrir un document Office.lnk"
  D�place1Fichier sMenuProgD�marrage, sMenuProg & "Applications\Outils Microsoft Office\", "Microsoft Recherche acc�l�r�e.lnk"
  
  D�place1Fichier sMenuProg & "Microsoft Autoroute\", sMenuProg & "Applications\", "Autoroute Express Europe 98.lnk"
  EffaceDossier sMenuProg & "Microsoft Autoroute\"

  D�place1Fichier sMenuProg, sMenuProg & "Communication\", "Internet Explorer.lnk"
  D�place1Fichier sMenuProg, sMenuProg & "Communication\", "Outlook Express.lnk"
  D�place1Fichier sMenuProg, sMenuProg & "Communication\", "NetMeeting.lnk"

  Copie1Fichier sMenuProg & "Communication\", sMenuD�marrer, "Internet Explorer.lnk"
  
  
  Cr�eRaccourci sMenuProg & "Communication\VTerm.lnk", sProgramFiles & "VTerm\VTerm.exe", sProgramFiles & "VTerm"
  Cr�eDossier sMenuProg, "Panneau de configuration.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
  
  
  ' D�marrage (Serveur 6000)
  Copie1Fichier sMenuProgMicrobsoft, sMenuProg & "D�marrage\", "Serveur 6000.lnk"
  
  
  Copie1Fichier sMenuProg & "Applications\", sMenuQuickLaunch, "Microsoft Excel.lnk"
  Copie1Fichier sMenuProg & "Applications\", sMenuQuickLaunch, "Microsoft Word.lnk"
  Copie1Fichier sMenuProg & "Communication\", sMenuQuickLaunch, "VTerm.lnk"
  Copie1Fichier sMenuD�marrer, sMenuQuickLaunch, "Explorateur Windows.lnk"
  
  
  ' Les raccourcis du SendTo (Envoyer vers)
  Cr�eDossier sMenuSendTo, "Autres"
  Copie1Fichier sMenuProg & "Accessoires\", sMenuSendTo, "Bloc-Notes.lnk"
  Copie1Fichier sMenuProg & "Accessoires\", sMenuSendTo, "WordPad.lnk"
  
  D�place1Fichier sMenuSendTo, sMenuSendTo & "Autres\", "Assistant Publication de sites Web.lnk"
  D�place1Fichier sMenuSendTo, sMenuSendTo & "Autres\", "Destinataire de message utilisant Microsoft Outlook.lnk"
  D�place1Fichier sMenuSendTo, sMenuSendTo & "Autres\", "Destinataire.lnk"
  D�place1Fichier sMenuSendTo, sMenuSendTo & "Autres\", "Porte-documents.lnk"
  
  ' On d�termine le chemin par d�faut en fonction de l'adresse IP du poste
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
  
  ' Un peu de mise � jour de la registry pour Office, au passage�
  Trace "Mise � jour de la registry pour Office�"
  Select Case iVersionOffice
    Case 97:
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Common"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Common\FileNew"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Common\FileNew\SharedTemplates"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Query"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Query\DataSourceFolders"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\PowerPoint"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\PowerPoint\Recent Folder List"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\PowerPoint\Recent Folder List\Default"
      
      D�finitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Common\FileNew\SharedTemplates", "", "W:\commun\modeles"
      D�finitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "AltStartup", "W:\commun\excel"
      D�finitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "DefaultPath", sDefaultDataPath
      D�finitValeurRegistry "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "DefFileMRU", 8     ' 8 fichiers r�cents par d�faut
      D�finitValeurRegistry "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options5", 3201    ' Pas de d�placement de la s�lection vers le bas
      D�finitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "DOC-PATH", sDefaultDataPath
      D�finitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Query\DataSourceFolders", "0", "w:\commun\dsn"
      D�finitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\PowerPoint\Recent Folder List\Default", "", sDefaultDataPath

    Case 2000:
      Trace "Mise � jour de la registry pour Office�"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Common"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Common\General"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Options"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Options"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Query"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Query\DataSourceFolders"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\PowerPoint"
      Cr�eCl�Registry "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\PowerPoint\Recent Folder List"
      
      D�finitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Common\General", "SharedTemplates", "W:\commun\modeles"
      D�finitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Options", "DefaultPath", sDefaultDataPath
      D�finitValeurRegistry "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Options", "DefFileMRU", 8     ' 8 fichiers r�cents par d�faut
      D�finitValeurRegistry "REG_DWORD", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Options", "Options5", 3201    ' Pas de d�placement de la s�lection vers le bas
      D�finitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Options", "DOC-PATH", sDefaultDataPath
      D�finitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Query\DataSourceFolders", "0", "w:\commun\dsn"
      D�finitValeurRegistry "REG_SZ", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\PowerPoint", "Default", sDefaultDataPath
    
    Case Else:
      Stop
  End Select
  
  On Error GoTo 0
  
End Sub


Public Function sGetProfile(ByVal sFichier As String, ByVal sSection As String, ByVal sCl� As String, ByVal sD�faut As String) As String
  Dim sRes As String, l As Long
  sRes = Space(500)
  l = GetPrivateProfileString(sSection, sCl�, sD�faut, sRes, 500, sFichier)
  sGetProfile = Left(sRes, l)
End Function


Public Sub SetProfile(ByVal sFichier As String, ByVal sSection As String, ByVal sCl� As String, ByVal sValeur As String)
  Dim l As Long
  
  l = WritePrivateProfileString(sSection, sCl�, sValeur, sFichier)
End Sub


Private Sub DoMAJWinIni()
  Trace "Mise � jour du win.ini�"
  Dim s As String
  s = sGetProfile("win.ini", "windows", "load", "")
  If InStr(1, s, "majsoft", vbTextCompare) <> 0 Then
    Trace "Elimination de majsoft du win.ini"
    SetProfile "win.ini", "windows", "load", ""
  End If
End Sub
