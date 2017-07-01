Attribute VB_Name = "modCommande6000"
' modCommand6000
' Module de traitement d'une commande Serveur6000
' 21/11/1997
' 25/11/1997 PV Commande MEM, et infos plus détaillées pour le DFREE
'  1/12/1997 PV Commande UNLOAD
' 19/04/1998 PV Commande VERSION
' 26/05/1998 PV Commande NETINFO, mise à l'heure en réseau, messages HTML
' 28/08/1998 PV Commandes REBOOT et HALTSYS
' 23/11/1998 PV Commande WallPaper
'  1/12/1998 PV Commande PS (liste des fenêtres) et more

Option Explicit

' Pour le mode local (Index=0), on regroupe toutes les lignes de résultat
' de façon à tout afficher en une fois
Private sMessageTotal As String

' Compteur de lignes affichées par commande pour une commande more
Private iCréditMore As Integer

' Gestion du more…
Public sBufferMore As String
Public bModeMore As Boolean



' Dispatcheur principal
Public Sub CommandeTCP6000(Index As Integer, ByVal sLigne As String)
  Dim p As Integer
  Dim sCmd As String, sArg As String
  
  ' Séparation commande - arguments
  ' A modifier et utiliser sGetArg pour gérer le cas où la commande est
  ' entourée de guillemets
  ' Pour l'instant ça ne gêne pas trop puisque FileShellExecute gère ça bien
  p = InStr(sLigne, " ")
  If p = 0 Then
    sCmd = sLigne
    sArg = ""
  Else
    sCmd = Left(sLigne, p - 1)
    sArg = Trim(Mid(sLigne, p + 1))
  End If
  
  
  ' Mécanisme de substitution de variable d'environnement
  Do
    Dim p2 As Integer
    Dim sVar As String
    
    p = InStr(sArg, "%")
    If p = 0 Then Exit Do
    p2 = InStr(p + 1, sArg, "%")
    If p2 = 0 Then Exit Do
    sVar = Mid(sArg, p + 1, p2 - p - 1)
    SubstitueChaîne sArg, "%" & sVar & "%", GetEnv(Index, sVar)
  Loop
  
  
  ' Dispatcheur
  On Error GoTo ProblèmeExécution
  Select Case UCase(sCmd)
    Case "?":         CmdHelp Index
    Case "HELP":      CmdHelp Index
    Case "VER":       CmdVer Index            ' Version de serveur6000
    
    Case "VERSION":   CmdVersion Index, sArg  ' Version d'un EXE ou d'une DLL
    
    Case "ENV":       CmdEnv Index, sArg
    Case "SET":       CmdSet Index, sArg
    
    Case "DATE":      CmdDate Index, sArg
    Case "TIME":      CmdTime Index, sArg
    
    Case "TYPE":      CmdType Index, sArg
    Case "DEL":       CmdDel Index, sArg
    Case "PDEL":      CmdPDel Index, sArg
    Case "REN":       CmdRen Index, sArg
    Case "COPY":      CmdCopy Index, sArg
    
    Case "DIR":       CmdDir Index, sArg
    Case "CD":        CmdCD Index, sArg
    Case "MD":        CmdMD Index, sArg
    Case "RD":        CmdRD Index, sArg
    
    Case "QUIT", "EXIT", "BYE": CmdQuit Index: Exit Sub
    Case Chr(4):      CmdQuit Index: Exit Sub     ' Sortie par Ctrl+D, vieille habitude !
    Case "UNLOAD":    CmdUnload Index: Exit Sub

    Case "ECHO":      CmdEcho Index, sArg
    
    Case "DFREE":     CmdDFree Index, sArg
    Case "MEM":       CmdMem Index, sArg

    Case "WALLPAPER": CmdWallPaper Index, sArg

    Case "PS":        CmdPS Index

    Case "MESSAGE":   CmdMessage Index, sArg
    Case "INPUTBOX":  CmdInputBox Index, sArg
    Case "SENDKEYS":  CmdSendKeys Index, sArg

    Case "GETREG":    CmdGetReg Index, sArg
    Case "SETREG":    CmdSetReg Index, sArg
    Case "KEYREG":    CmdKeyReg Index, sArg
    
    Case "NETINFO":   CmdNetInfo Index

    Case "MAJ6000":   CmdMaj6000 Index, sArg
    
    Case "RUN":       CmdRun Index, sArg
    
    Case "REBOOT":    CmdReboot Index, sArg
    Case "HALTSYS":   CmdHaltSys Index, sArg
    
    Case "":          ' Commande vide: Rien !
    Case "REM":       ' Rien non plus !
    
    Case Else:
                      If Len(sLigne) = 2 And UCase(Left(sLigne, 1)) >= "A" And UCase(Left(sLigne, 1)) <= "Z" And Right(sLigne, 1) = ":" Then
                        CmdChDrive Index, sLigne
                      Else
                        CmdRun Index, sLigne
                      End If
  End Select
  RetourPrompt Index
  Exit Sub
  
ProblèmeExécution:
  Retour Index, "!Serveur6000(" & Err.Source & "): Erreur " & Err.Number & ": " & Err.Description
  Resume Next
End Sub

' Retourne le nombre de lignes d'une chaîne, en comptant les LF.
' Si la dernière ligne n'est pas terminée par un LF, ajoute 1
Private Function iNbLF(sText As String) As Integer
  Dim p As Integer, p0 As Integer, nb As Integer
  p0 = 1
  Do
    p = InStr(p0, sText, vbLf)
    If p = 0 Then Exit Do
    nb = nb + 1
    p0 = p + 1
  Loop
  If Right(sText, 1) <> vbLf Then nb = nb + 1
  iNbLF = nb
End Function


Private Function iInstrLFMult(sText As String, nb As Integer) As Integer
  Dim p As Integer, p0 As Integer
  p0 = 1
  Do While nb > 0
    p = InStr(p0, sText, vbLf)
    If p = 0 Then p = Len(sText) + 1: Exit Do
    p0 = p + 1
    nb = nb - 1
  Loop
  iInstrLFMult = p
End Function

' Transmet à l'appellant le résultat d'une commande
Private Sub Retour(Index As Integer, ByVal sMessage As String)
  Dim p As Integer
  If Index = 0 Then
    sMessageTotal = sMessageTotal & sMessage & vbCrLf
    While iNbLF(sMessageTotal) > 15
      p = iInstrLFMult(sMessageTotal, 15)
      MsgBox Left(sMessageTotal, p) & "--- more ---", vbInformation, sNomApp
      sMessageTotal = Mid(sMessageTotal, p + 1)
    Wend
  ElseIf Index = -1 Then
    frmServeur6000.UDP2.SendData sMessage & vbCrLf
  Else
    sBufferMore = ""
    bModeMore = True
    While iNbLF(sMessage) > iCréditMore
      p = iInstrLFMult(sMessage, iCréditMore)
      frmServeur6000.TCP(Index).SendData Left(sMessage, p) & "--- more ---" & vbCr
      sMessage = Mid(sMessage, p + 1)
      iCréditMore = 0
      Do
        DoEvents
        If sBufferMore <> "" Then
          Select Case Left(sBufferMore, 1)
            Case vbCr: iCréditMore = 1
            Case " ":  iCréditMore = 23
          End Select
          sBufferMore = Mid(sBufferMore, 2)
        End If
      Loop While iCréditMore = 0
    Wend
    bModeMore = False
    frmServeur6000.TCP(Index).SendData sMessage & vbCrLf
    iCréditMore = iCréditMore - iNbLF(sMessage)
  End If
End Sub

Public Sub RetourPrompt(Index As Integer)
  Dim sPrompt As String
  sPrompt = GetEnv(Index, "PROMPT")
  If sPrompt = "" Then sPrompt = "$p$g"
  
  SubstitueChaîne sPrompt, "$p", CurDir
  SubstitueChaîne sPrompt, "$g", ">"
  SubstitueChaîne sPrompt, "$r", vbCrLf
  
  If Index = 0 Then
    If sMessageTotal = "" Then sMessageTotal = "Ok."
    MsgBox sMessageTotal, vbInformation, sNomApp
    sMessageTotal = ""
  ElseIf Index = -1 Then
    ' Prompt %\r\n de mode administration après une commande UDP
    frmServeur6000.UDP2.SendData "%" & vbCrLf
  Else
    ' Prompt classique sur une liaison TCP
    frmServeur6000.TCP(Index).SendData sPrompt
    iCréditMore = 23    ' RAZ du compteur more
  End If
End Sub


' Remplace toutes les occurences de sMotif dans sChaîne par sSubstition
' sans tenir compte de la casse
Static Sub SubstitueChaîne(ByRef sChaîne, ByVal sMotif As String, ByVal sSubstitution As String)
  Dim p As Integer
  Dim iPos As Integer
  
  iPos = 1
  Do
    p = InStr(iPos, UCase(sChaîne), UCase(sMotif))
    If p = 0 Then Exit Sub
    sChaîne = Left(sChaîne, p - 1) & sSubstitution & Mid(sChaîne, p + Len(sMotif))
    iPos = p + Len(sMotif)
  Loop
End Sub


' ===========================================================================
' Exécution d'une commande quelconque

Private Sub CmdRun(Index As Integer, ByVal sCmd As String)
  Dim i As Integer
  i = FileShellExecute(frmServeur6000.hwnd, sCmd)
  If i <> 0 Then Err.Raise 6000, "CmdRun", "Erreur " & i & " lors du ShellExecute"
End Sub


' ===========================================================================
' Aide

Private Sub CmdHelp(Index As Integer)
  Retour Index, "REM remarques         Commande qui ne fait rien !"
  Retour Index, "[RUN] commande [args] Exécute la commande via ShellExecute"
  Retour Index, "VER|MEM               Affiche des informations de version|de mémoire"
  Retour Index, "ECHO texte            Affiche texte"
  Retour Index, "ENV [variable]        Retourne une/les variable(s) d'environnement"
  Retour Index, "SET var val           Définit une variable d'environnement"
  Retour Index, "QUIT|EXIT|BYE|Ctrl+D  Termine une session"
  Retour Index, "DATE [JJ/MM/AAAA]     Affiche ou définit la date"
  Retour Index, "TIME [HH:MM[:SS]]     Affiche ou définit l'heure"
  Retour Index, "TYPE fichier          Affiche le contenu du fichier"
  Retour Index, "DEL|PDEL fichier      Efface|Envoie à la corbeille le fichier"
  Retour Index, "REN anc nouv          Renomme un fichier"
  Retour Index, "COPY source dest      Copie un fichier"
  Retour Index, "DIR [path[modèle]]    Liste les fichiers"
  Retour Index, "A: .. Z:              Change l'unité courante"
  Retour Index, "CD [path]             Affiche ou définit le répertoire courant"
  Retour Index, "MD|RD path            Crée|Supprime un répertoire"
  Retour Index, "MESSAGE msg           Affiche une boîte d'information avec msg"
  Retour Index, "INPUTBOX msg tit def  Demande une valeur à l'utilisateur"
  Retour Index, "GETREG path [clé]     Lit une valeur de la registry ou énumère les clés"
  Retour Index, "SETREG t path clé val Ecrit une valeur dans la registry. t: REG_SZ|REG_DWORD"
  Retour Index, "KEYREG path           Crée un chemin dans la registry"
  Retour Index, "DFREE [drive:]        Retourne l'espace disque libre"
  Retour Index, "MAJ6000               Mise à jour automatique de Serveur6000"
  Retour Index, "NETINFO               Informations réseau"
  Retour Index, "HALTSYS|REBOOT [F]    Arrêt|Redémarrage [Forcé]"
  Retour Index, "WALLPAPER fichier.bmp Change le papier peint"
  Retour Index, "PS                    Liste des fenêtres"
End Sub


' ===========================================================================
' Echo simple

Private Sub CmdEcho(Index As Integer, ByVal sArg As String)
  Retour Index, sArg
End Sub


' ===========================================================================
' Sortie

Private Sub CmdQuit(Index As Integer)
  Retour Index, vbCr & "Bye."     ' vbCr pour la sortie Ctrl+D
  If Index = 0 Then
    RetourPrompt 0
  Else
    DoEvents
    frmServeur6000.TCP(Index).Close
    frmServeur6000.TCP_Close Index
  End If
End Sub


Private Sub CmdUnload(Index As Integer)
  Retour Index, "Bye (Unload)."
  frmServeur6000.FinServeur6000
End Sub


' ===========================================================================
' Environnement

Private Sub CmdEnv(Index As Integer, ByVal sArg As String)
  If sArg = "" Then     ' Énumération
    ' Variables classiques…
    Dim i As Integer
    For i = 1 To colEnv.Count
      Retour Index, colEnv(i)
    Next
    ' Plus les variables synamiques
    Retour Index, "VISIBLE=" & GetEnv(Index, "VISIBLE")
    Retour Index, "SYSTRAY=" & GetEnv(Index, "SYSTRAY")
    Retour Index, "ECHO=" & GetEnv(Index, "ECHO")
    Retour Index, "DATE=" & GetEnv(Index, "DATE")
    Retour Index, "TIME=" & GetEnv(Index, "TIME")
  Else
    Dim sEnv As String
    sEnv = GetEnv(Index, sArg)
    If sEnv = "" Then Err.Raise 6000, "CmdEnv", "Variable d'environnement '" & sArg & "' inconnue"
    Retour Index, sArg & "=" & GetEnv(Index, sArg)
  End If
End Sub

Private Sub CmdSet(Index As Integer, ByVal sArg As String)
  If sArg = "" Then
    CmdEnv Index, sArg
  Else
    Dim sVariable As String
    Dim sValeur As String
    Dim p As Integer
    
    sVariable = sGetArg(sArg)
    p = InStr(sVariable, "=")
    If p > 0 Then
      sValeur = Mid(sVariable, p + 1)
      sVariable = Left(sVariable, p - 1)
    Else
      sValeur = sGetArg(sArg)
    End If
    FinArguments sArg
    
    SetEnv Index, sVariable, sValeur
  End If
  Exit Sub
End Sub


' ===========================================================================
' Informations de version

Private Sub CmdVer(Index As Integer)
  Retour Index, "SERVEUR6000=" & GetEnv(Index, "SERVEUR6000")
  Retour Index, "OSPLATFORM=" & GetEnv(Index, "OSPLATFORM")
  Retour Index, "OSVERSION=" & GetEnv(Index, "OSVERSION")
  Retour Index, "PLUSVERSION=" & GetEnv(Index, "PLUSVERSION")
  Retour Index, "PROCESSOR=" & ProcInfo
End Sub


' ===========================================================================
' Informations réseau

Private Sub CmdNetInfo(Index As Integer)
  Retour Index, "LOCALHOSTNAME=" & frmServeur6000.sLocalHostName
  Retour Index, "LOCALIP=" & frmServeur6000.sLocalIP
  Retour Index, "WORKGROUP=" & frmServeur6000.sWorkgroup
  Retour Index, "RESEAU=" & frmServeur6000.sRéseau
  Retour Index, "TIMESERVER=" & frmServeur6000.sTimeServer
  Retour Index, "Z=" & frmServeur6000.sZ
End Sub


' ===========================================================================
' Liste des fenêtres

Private Sub CmdPS(Index As Integer)
  Retour Index, sListeFenêtres
End Sub

' ===========================================================================
' Arrêt/Redémarrage de la machine
' Si on passe un argument, le reboot est forcé

Private Sub CmdReboot(Index As Integer, ByVal sArg As String)
  HaltSys sArg <> "", True
End Sub

Private Sub CmdHaltSys(Index As Integer, ByVal sArg As String)
  HaltSys sArg <> "", False
End Sub


' ===========================================================================
' Date et heure
' Peuvent être appelées lors de la définition des pseudo-variables
' d'environnement DATE et TIME

Public Sub CmdDate(Index As Integer, ByVal sArg As String)
  If sArg = "" Then
    Retour Index, "DATE=" & Format(Now, "dd/mm/yyyy")
    Retour Index, "TIME=" & Format(Now, "hh:mm:ss")
  Else
    Dim sDate As String
    sDate = sGetArg(sArg)
    FinArguments sArg
    
  
    On Error GoTo ProblèmeSetDate
    Date = CDate(sDate)
  End If
  Exit Sub
  
ProblèmeSetDate:
  Err.Raise 6004, "CmdDate", "Date '" & sDate & "' invalide."
End Sub

Public Sub CmdTime(Index As Integer, ByVal sArg As String)
  If sArg = "" Then
    Retour Index, "DATE=" & Format(Now, "dd/mm/yyyy")
    Retour Index, "TIME=" & Format(Now, "hh:mm:ss")
  Else
    Dim sTime As String
    sTime = sGetArg(sArg)
    FinArguments sArg
    
    On Error GoTo ProblèmeSetTime
    Time = sTime
  End If
  Exit Sub
  
ProblèmeSetTime:
  Err.Raise 6004, "CmdTime", "Heure '" & sTime & "' invalide."
End Sub


' ===========================================================================
' Manipulation des fichiers
' Gèrent les chemins UNC

Private Sub CmdType(Index As Integer, ByVal sArg As String)
  Dim iFic As Integer
  Dim lig As String
  Dim sNomfic As String
  
  sNomfic = sGetArg(sArg)
  FinArguments sArg
  
  iFic = FreeFile
  On Error GoTo ProblèmeOuverture
  Open sNomfic For Input As #iFic
  On Error GoTo 0
  While Not EOF(iFic)
    Line Input #1, lig
    Retour Index, lig
  Wend
  Close #iFic
  Exit Sub
  
ProblèmeOuverture:
  Err.Raise 6005, "CmdType", "Echec à l'ouverture de '" & sNomfic & "', Err=" & Err & ": " & Error
End Sub


Private Sub CmdDel(Index As Integer, ByVal sArg As String)
  Dim sNomfic As String
  
  sNomfic = sGetArg(sArg)
  FinArguments sArg
  
  On Error GoTo ProblèmeEffacement
  Kill sNomfic
  On Error GoTo 0
  Exit Sub
  
ProblèmeEffacement:
  Err.Raise 6006, "CmdDel", "Echec à l'effacement (kill) de '" & sNomfic & "', Err=" & Err & ": " & Error
End Sub


Private Sub CmdPDel(Index As Integer, ByVal sArg As String)
  Dim sNomfic As String
  Dim lStatus As Long
  
  sNomfic = sGetArg(sArg)
  FinArguments sArg
  
  lStatus = EffaceFichierCorbeille(frmServeur6000.hwnd, sNomfic)
  If lStatus <> 0 Then Err.Raise 6005, "CmdPDel", "Echec à l'envoi à la corbeille de '" & sNomfic & "', lStatus=" & lStatus
End Sub


Private Sub CmdRen(Index As Integer, ByVal sArg As String)
  Dim sSource As String
  Dim sDest As String
  
  sSource = sGetArg(sArg)
  sDest = sGetArg(sArg)
  FinArguments sArg
  
  On Error GoTo ProblèmeRename
  Name sSource As sDest
  Exit Sub
  
ProblèmeRename:
  Err.Raise 6007, "CmdRen", "Echec au rename de '" & sSource & "' en '" & sDest & "', Err=" & Err & ": " & Error
End Sub


Private Sub CmdCopy(Index As Integer, ByVal sArg As String)
  Dim sSource As String
  Dim sDest As String
  
  sSource = sGetArg(sArg)
  sDest = sGetArg(sArg)
  FinArguments sArg
  
  On Error GoTo ProblèmeCopy
  FileCopy sSource, sDest
  Exit Sub
  
ProblèmeCopy:
  Err.Raise 6008, "CmdCopy", "Echec à la copie de '" & sSource & "' sur '" & sDest & "', Err=" & Err & ": " & Error
End Sub


' ===========================================================================
' Dir

Private Sub CmdDir(Index As Integer, ByVal sModèle As String)
  Dim sDrive As String, sPath As String
  Dim sDernierComposant As String
  Dim iPos As Integer
  
  ' 1. On sépare sModèle en sDrive+sPath+sDernierComposant
  sPath = sModèle
  iPos = Len(sPath)
  Do While iPos > 0
    If Mid(sPath, iPos, 1) = ":" Or Mid(sPath, iPos, 1) = "\" Then Exit Do
    iPos = iPos - 1
  Loop
  sPath = Left(sModèle, iPos)
  sDernierComposant = Mid(sModèle, iPos + 1)
  
  If sPath = "" Then
    sDrive = ""
  Else
    sDrive = UCase(Left(sPath, 1))
    If sDrive < "A" Or sDrive > "Z" Or Mid(sPath, 2, 1) <> ":" Then
      sDrive = ""
    Else
      sPath = Mid(sPath, 3)
    End If
  End If
  
  
  Dim sTestCD As String
  If sDrive = "" Then
    sTestCD = Left(CurDir, 2)
  Else
    sTestCD = sDrive & ":"
  End If
  If sPath = "" Then
    sTestCD = sTestCD & Mid(CurDir(Left(sTestCD, 1)), 3)
  Else
    sTestCD = sTestCD & sPath
  End If
  If Right(sTestCD, 1) <> "\" Then sTestCD = sTestCD & "\"
  sTestCD = sTestCD & sDernierComposant
  
  
  ' 2. On remplace les parties non renseignées (drive, path) par le disque et
  ' le path courants, et on vérifie si le tout n'est pas un répertoire
  Dim bOkDir As Boolean
  If InStr(sDernierComposant, "*") <> 0 Or InStr(sDernierComposant, "?") <> 0 Then
    bOkDir = False
  Else
    Dim sSauveCurDir As String
    sSauveCurDir = CurDir
    On Error Resume Next
    ChDir sTestCD
    If Err Then
      bOkDir = False
    Else
      bOkDir = True
    End If
    On Error GoTo 0
    ChDir sSauveCurDir
  End If
  
  
  ' On prépare la recherche finale
  Dim sFullPath As String, sPattern As String
  If bOkDir Then
    sFullPath = sTestCD
    sPattern = "*"
  Else
    sFullPath = sDrive & ":" & sPath
    sPattern = sDernierComposant
  End If
  If Right(sFullPath, 1) <> "\" Then sFullPath = sFullPath & "\"
  
  
  Dim sFinal As String
  Dim f As String, iNb As Integer
  iNb = 0
  On Error GoTo ProblèmeDir
  f = Dir(sFullPath & sPattern, vbNormal + vbDirectory)
  On Error GoTo 0
  Retour Index, "Répertoire de " & sFullPath & sPattern
  Do While f <> ""
    If f = "." Or f = ".." Then GoTo ContinueDir

    Dim iAttr As VbFileAttribute, sAttr As String
    iAttr = GetAttr(sFullPath & f)
    sAttr = IIf(iAttr And vbDirectory, "d", "-")
    sAttr = sAttr & IIf(iAttr And vbArchive, "a", "-")
    sAttr = sAttr & IIf(iAttr And vbReadOnly, "r", "-")
    sAttr = sAttr & IIf(iAttr And vbHidden, "h", "-")
    sAttr = sAttr & IIf(iAttr And vbSystem, "s", "-")
    
    Dim sSize As String
    If iAttr And vbDirectory Then
      sSize = "<DIR>     "
    Else
      sSize = FileLen(sFullPath & f)
      If Len(sSize) < 10 Then sSize = Space(10 - Len(sSize)) & sSize
    End If
    
    Dim sDate As String
    If f = "." Or f = ".." Then
      sDate = "                   "
    Else
      sDate = Format(FileDateTime(sFullPath & f), "dd/mm/yyyy hh:mm:ss")
    End If
    
    Retour Index, sAttr & " " & sSize & " " & sDate & " " & f
    iNb = iNb + 1
    
ContinueDir:
    f = Dir
  Loop
  Retour Index, ""
  Retour Index, iNb & " fichier(s) ou répertoire(s) trouvé(s)"
  Exit Sub
  
ProblèmeDir:
  Err.Raise 6009, "CmdDir", "Echec à l'énumération de '" & sModèle & "', Err=" & Err & ": " & Error
End Sub


Private Sub CmdCD(Index As Integer, ByVal sArg As String)
  If sArg = "" Then
    Retour Index, CurDir
  Else
    Dim sPath As String
    
    sPath = sGetArg(sArg)
    FinArguments sArg
  
    On Error GoTo ProblèmeChDir
    ChDir sPath
  End If
  Exit Sub
  
ProblèmeChDir:
  Err.Raise 6010, "CmdCD", "Echec au ChDir '" & sPath & "', Err=" & Err & ": " & Error
End Sub


Private Sub CmdChDrive(Index As Integer, ByVal sArg As String)
  Dim sDrive As String
  
  sDrive = sGetArg(sArg)
  FinArguments sArg

  On Error GoTo ProblèmeChDrive
  ChDrive sDrive
  Exit Sub
  
ProblèmeChDrive:
  Err.Raise 6010, "CmdChDrive", "Echec au ChDrive '" & sDrive & "', Err=" & Err & ": " & Error
End Sub


' ===========================================================================
' Manipulations de répertoires

Private Sub CmdMD(Index As Integer, ByVal sArg As String)
  Dim sPath As String
  
  sPath = sGetArg(sArg)
  FinArguments sArg
  
  On Error GoTo ProblèmeMkDir
  MkDir sPath
  On Error GoTo 0
  Exit Sub
  
ProblèmeMkDir:
  Err.Raise 6010, "CmdMD", "Echec au MkDir '" & sPath & "', Err=" & Err & ": " & Error
End Sub


Private Sub CmdRD(Index As Integer, ByVal sArg As String)
  Dim sPath As String
  
  sPath = sGetArg(sArg)
  FinArguments sArg
  
  On Error GoTo ProblèmeRmDir
  RmDir sPath
  On Error GoTo 0
  Exit Sub
  
ProblèmeRmDir:
  Err.Raise 6010, "CmdRD", "Echec au RmDir '" & sPath & "', Err=" & Err & ": " & Error
End Sub



' ===========================================================================
' Changement de papier peint

Private Sub CmdWallPaper(Index As Integer, ByVal sArg As String)
  Dim sNomfic As String
  
  sNomfic = sGetArg(sArg)
  FinArguments sArg
  
  NewWallpaper sNomfic
End Sub


' ===========================================================================
' Dialogues utilisateur

' MsgBox ne va pas, la boîte est modale et bloque l'application
' Plus gênant, msgbox affiche son message derrière la fenêtre courante quand la
' fenêtre de Serveur6000 est invisible, et pas moyen de faire un AppActivate
' dans ce cas…

Private Sub CmdMessage(Index As Integer, ByVal sArg As String)
  Dim sMessage As String
  Dim bModal As Boolean
  
  sMessage = sGetArg(sArg)
  If sArg <> "" Then bModal = CInt(sGetArg(sArg))
  FinArguments sArg
  SubstitueChaîne sMessage, "|", vbCrLf
  
  If bModal Then
    MsgBox sMessage, vbCritical + vbSystemModal, sNomApp
  Else
    MsgBox sMessage, vbInformation, sNomApp
  End If
End Sub


Private Sub CmdInputBox(Index As Integer, ByVal sArg As String)
  Dim sMessage As String, sTitre As String, sDéfaut As String
  
  sMessage = sGetArg(sArg)
  If sArg = "" Then
    sTitre = sNomApp
    sDéfaut = ""
  Else
    sTitre = sGetArg(sArg)
    If sArg = "" Then
      sDéfaut = ""
    Else
      sDéfaut = sGetArg(sArg)
    End If
  End If
  FinArguments sArg
  
  Dim sRep As String
  sRep = InputBox(sMessage, sTitre, sDéfaut)
  Retour Index, "MSGBOX=" & sRep
End Sub


' ===========================================================================
' SendKeys

Private Sub CmdSendKeys(Index As Integer, ByVal sArg As String)
  Dim sKeys As String
  
  sKeys = sGetArg(sArg)
  FinArguments sArg
  
  On Error GoTo ProblèmeSendKeys
  SendKeys sKeys
  On Error GoTo 0
  Exit Sub

ProblèmeSendKeys:
  Err.Raise 6012, "CmdSendKeys", "Echec au SendKeys '" & sKeys & "', Err=" & Err & ": " & Error
End Sub


' ===========================================================================
' Registry

Private Sub CmdGetReg(Index As Integer, ByVal sArg As String)
  Dim sPath As String
  Dim sClé As String
  
  sPath = sGetArg(sArg)
  If sArg <> "" Then sClé = sGetArg(sArg)
  FinArguments sArg
  
  If sClé = "" Then     ' Enumération des valeurs
    Dim sEnum As String
    On Error GoTo ProblèmeEnumération
    sEnum = EnumèreValeursRegistry(sPath)
    On Error GoTo 0
    Retour Index, sEnum
  Else
    Dim v As Variant
    Dim sType As String
    On Error GoTo ProblèmeRegistry
    v = RécupèreValeurRegistry(sPath, sClé, sType)
    On Error GoTo 0
    Retour Index, "TYPE=" & sType
    Retour Index, "VALEUR=" & v
  End If
  Exit Sub

ProblèmeRegistry:
  Err.Raise 6013, "CmdGetReg", "Echec au RécupèreValeurRegistry, Err=" & Err & ": " & Error
  Exit Sub

ProblèmeEnumération:
  Err.Raise 6013, "CmdGetReg", "Echec au EnumèreValeursRegistry, Err=" & Err & ": " & Error
  Exit Sub
End Sub


Private Sub CmdSetReg(Index As Integer, ByVal sArg As String)
  Dim sType As String     ' REG_SZ ou REG_DWORD
  Dim sPath As String     ' HKEY_CURRENT_USER\Software\PViolent\VTerm\1.0
  Dim sClé As String      ' Police
  Dim sValeur As String   ' Lucida console
  
  sType = sGetArg(sArg)
  sPath = sGetArg(sArg)
  sClé = sGetArg(sArg)
  sValeur = sGetArg(sArg)
  FinArguments sArg
  
  On Error GoTo ProblèmeRegistry
  DéfinitValeurRegistry sType, sPath, sClé, sValeur
  On Error GoTo 0
  Exit Sub

ProblèmeRegistry:
  Err.Raise 6013, "CmdSetReg", "Echec au DéfinitValeurRegistry, Err=" & Err & ": " & Error
  Exit Sub
End Sub


Private Sub CmdKeyReg(Index As Integer, ByVal sArg As String)
  Dim sPath As String     ' HKEY_CURRENT_USER\Software\PViolent\VTerm\1.0
  
  sPath = sGetArg(sArg)
  FinArguments sArg
  
  On Error GoTo ProblèmeRegistry
  CréeCléRegistry sPath
  On Error GoTo 0
  Exit Sub

ProblèmeRegistry:
  Err.Raise 6013, "CmdKeyReg", "Echec au CréeCheminRegistry, Err=" & Err & ": " & Error
  Exit Sub
End Sub


' ===========================================================================
' Espace disque libre / Informations disque
' Ne supporte pas encore les chemins UNC

Private Sub CmdDFree(Index As Integer, ByVal sArg As String)
  If sArg = "" Then
    ' Sans paramètres, énumère les disques
    Dim cDrive As Integer
    Dim iDrives As Long
    Dim iMasque As Long
    iDrives = UnitésDisque()
    iMasque = 4
    For cDrive = Asc("C") To Asc("Z")
      If (iDrives And iMasque) <> 0 Then Dfree1 Index, Chr(cDrive) & ":\"
      iMasque = iMasque * 2
    Next
  Else
    Dim sRootPathname As String
    sRootPathname = sGetArg(sArg)
    FinArguments sArg
    
    If Right(sRootPathname, 1) <> "\" Then sRootPathname = sRootPathname & "\"
    Dfree1 Index, sRootPathname
  End If
  
End Sub


Private Sub Dfree1(Index As Integer, ByVal sRootPathname As String)
  sRootPathname = UCase(sRootPathname)
  
  Dim sType As String
  sType = DiskType(sRootPathname)
  Retour Index, sRootPathname & "TYPE=" & sType
  If InStr(sType, "réseau") <> 0 Then
    Retour Index, sRootPathname & "REMOTE=" & RemoteDrive(sRootPathname)
  End If
  Retour Index, sRootPathname & "LABEL=" & VolumeLabel(sRootPathname)
    
  Dim cFreeBytesAvailableToCaller As Currency
  Dim cTotalNumberOfBytes As Currency
  Dim cTotalNumberOfFreeBytes As Currency
  If VbGetDiskFreeSpaceEx(sRootPathname, cFreeBytesAvailableToCaller, cTotalNumberOfBytes, cTotalNumberOfFreeBytes) Then
    Retour Index, sRootPathname & "DISKLOAD=" & 100 - Int(cTotalNumberOfFreeBytes / cTotalNumberOfBytes * 100)
    Retour Index, sRootPathname & "TOTALSPACE=" & cTotalNumberOfBytes
    Retour Index, sRootPathname & "FREESPACE=" & cTotalNumberOfFreeBytes
  Else
    Dim lTotalNumberOfBytes As Long
    Dim lTotalNumberOfFreeBytes As Long
    
    lTotalNumberOfBytes = DiskTotalSpace(sRootPathname)
    lTotalNumberOfFreeBytes = DiskFreeSpace(sRootPathname)
    
    If lTotalNumberOfBytes > 0 Then
      Retour Index, sRootPathname & "DISKLOAD=" & 100 - Int(lTotalNumberOfFreeBytes / lTotalNumberOfBytes * 100)
      Retour Index, sRootPathname & "TOTALSPACE=" & lTotalNumberOfBytes
      Retour Index, sRootPathname & "FREESPACE=" & lTotalNumberOfFreeBytes
    End If
  End If
End Sub


' ===========================================================================
' Mémoire libre

Private Sub CmdMem(Index As Integer, ByVal sArg As String)
  FinArguments sArg
  
  Dim mb As MEMORYSTATUS
  GlobalMemoryStatus mb
  
  Retour Index, "MEMLOAD=" & mb.dwMemoryLoad
  Retour Index, "MEMTOTALPHYS=" & mb.dwTotalPhys
  Retour Index, "MEMAVAILPHYS=" & mb.dwAvailPhys
  Retour Index, "MEMTOTALPAGEFILE=" & mb.dwTotalPageFile
  Retour Index, "MEMAVAILPAGEFILE=" & mb.dwAvailPageFile
  Retour Index, "MEMTOTALVIRTUAL=" & mb.dwAvailVirtual
  Retour Index, "MEMAVAILVIRTUAL=" & mb.dwAvailVirtual
End Sub



' ===========================================================================
' Mise à jour de serveur6000

Private Sub CmdMaj6000(Index As Integer, ByVal sArg As String)
  
  On Error GoTo ProblèmeMAJ
  FinArguments sArg
  
  If Not frmServeur6000.bVersionPlusRécenteSurSysDisk Then
    Retour Index, "!Pas de version plus récente sur X:\microbsoft, ou disque X: inaccessible"
  Else
    frmServeur6000.MiseAJour False    ' Mise à jour sans message
  End If
  Exit Sub
  
ProblèmeMAJ:
  Err.Raise 6017, "CmdMaj6000", "!Echec à la mise à jour (" & Err.Source & "), Err=" & Err.Number & ": " & Err.Description
End Sub


' ===========================================================================
' Version de fichier, d'après la bibliothèque Version.dll

Private Sub CmdVersion(Index As Integer, ByVal sArg As String)
  Dim iFic As Integer
  Dim lig As String
  Dim sNomfic As String
  
  sNomfic = sGetArg(sArg)
  FinArguments sArg
  
  On Error GoTo ProblèmeVersion
  
  Dim fd As Date, fs As Long
  Dim VerInfo As VS_FIXEDFILEINFO
  
  fd = FileDateTime(sNomfic)
  fs = FileLen(sNomfic)
  
  Retour Index, "FILEDATETIME=" & Format(fd, "yyyy/mm/dd hh:mm:ss")
  Retour Index, "FILESIZE=" & fs
  If GetVersion(sNomfic, VerInfo) Then
    Retour Index, "VERSION=" & VerInfo.dwFileVersionMSh & "." & VerInfo.dwFileVersionMSl & "." & VerInfo.dwFileVersionLSh & "." & VerInfo.dwFileVersionLSl
    Retour Index, "VERSION1=" & VerInfo.dwFileVersionMSh
    Retour Index, "VERSION2=" & VerInfo.dwFileVersionMSl
    Retour Index, "VERSION3=" & VerInfo.dwFileVersionLSh
    Retour Index, "VERSION4=" & VerInfo.dwFileVersionLSl
  End If
  Exit Sub
  
ProblèmeVersion:
  Err.Raise 6018, "CmdVersion", "Echec à l'accès à '" & sNomfic & "', Err=" & Err & ": " & Error
End Sub

