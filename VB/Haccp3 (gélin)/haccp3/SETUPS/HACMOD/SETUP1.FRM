VERSION 4.00
Begin VB.Form frmSetup1 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00400000&
   BorderStyle     =   0  'None
   Caption         =   "Outil d'installation Visual Basic 4.0"
   ClientHeight    =   1770
   ClientLeft      =   990
   ClientTop       =   3855
   ClientWidth     =   7950
   ClipControls    =   0   'False
   DrawStyle       =   5  'Transparent
   FillStyle       =   0  'Solid
   BeginProperty Font 
      name            =   "Times New Roman"
      charset         =   1
      weight          =   700
      size            =   24
      underline       =   0   'False
      italic          =   -1  'True
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H00000000&
   Height          =   2175
   Icon            =   "SETUP1.frx":0000
   Left            =   930
   LinkMode        =   1  'Source
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   118
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   530
   ShowInTaskbar   =   0   'False
   Top             =   3510
   Width           =   8070
   WindowState     =   2  'Maximized
   Begin VB.Label lblModify 
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   $"SETUP1.frx":0442
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   624
      Left            =   12
      TabIndex        =   1
      Top             =   12
      Visible         =   0   'False
      Width           =   7932
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblDDE 
      AutoSize        =   -1  'True
      BorderStyle     =   1  'Fixed Single
      Caption         =   $"SETUP1.frx":051E
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   12
      TabIndex        =   0
      Top             =   1512
      Visible         =   0   'False
      Width           =   6444
   End
End
Attribute VB_Name = "frmSetup1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit
Option Compare Text

'
' Impossible de placer cette chaîne dans le fichier de ressources, car elle indique une
' erreur dans le chargement des ressources.
'
Const mstrRESOURCELOADFAIL$ = "Une erreur s'est produite pendant l'initialisation des ressources utilisées par cette application."

'-----------------------------------------------------------
' SUB: DrawBackGround
'
' Dessine l'écran bleu et affiche le titre de l'installation
' avec l'ombrage.
'-----------------------------------------------------------
'
Private Sub DrawBackGround()
    Const intBLUESTART% = 255
    Const intBLUEEND% = 0
    Const intBANDHEIGHT% = 2
    Const intSHADOWSTART% = 8
    Const intSHADOWCOLOR% = 0
    Const intTEXTSTART% = 4
    Const intTEXTCOLOR% = 15

    Dim sngBlueCur As Single
    Dim sngBlueStep As Single
    Dim intFormHeight As Integer
    Dim intFormWidth As Integer
    Dim intY As Integer

    '
    ' Obtient les valeurs système pour la hauteur et la largeur.
    '
    intFormHeight = ScaleHeight
    intFormWidth = ScaleWidth

    '
    ' Calcule la taille de la zone bleue.
    '
    sngBlueStep = intBANDHEIGHT * (intBLUEEND - intBLUESTART) / intFormHeight
    sngBlueCur = intBLUESTART

    '
    ' Dessine l'écran bleu.
    '
    For intY = 0 To intFormHeight Step intBANDHEIGHT
        Line (-1, intY - 1)-(intFormWidth, intY + intBANDHEIGHT), RGB(0, 0, sngBlueCur), BF
        sngBlueCur = sngBlueCur + sngBlueStep
    Next intY

    '
    ' Affiche le nom ombragé.
    '
    CurrentX = intSHADOWSTART
    CurrentY = intSHADOWSTART
    ForeColor = QBColor(intSHADOWCOLOR)
    Print Caption
    CurrentX = intTEXTSTART
    CurrentY = intTEXTSTART
    ForeColor = QBColor(intTEXTCOLOR)
    Print Caption
End Sub

Private Sub Form_Load()
    Const strINI_FILES$ = "Files"                           ' Section par défaut à installer.
    Const strEXT_GRP$ = "GRP"                               ' Extension du groupe de programmes.

    #If Win16 Then
    Dim fBtrieve As Integer                                 ' Indique si Btrieve est utilisé.
    #End If
    Dim strGrpPath As String                                ' Nom du groupe de fichiers.
    Dim strGroupName As String                              ' Nom du groupe de programmes.
    Dim sFile As FILEINFO                                   ' Première ligne d'information
                                                            ' de type "Files=".
    On Error GoTo MainError

    '
    ' Initialise les variables d'espacement pour les boîtes de messages.
    '
    LF$ = Chr$(10)
    LS$ = LF$ & LF$

    '
    ' Initialise les chaînes de ressources utilisées par les variables globales
    ' et les feuilles/contrôles.
    '
    GetStrings
    
    '
    ' Obtient les répertoires de Windows et System de Windows.
    '
    gstrWinDir = GetWindowsDir()
    gstrWinSysDir = GetWindowsSysDir()

    '
    ' Si le répertoire System de Windows est un sous-répertoire du répertoire
    ' Windows, l’emplacement correct pour installer les fichiers spécifiés dans
    ' SETUP.LST comme « $(WinSysDest) » est dans le répertoire System de Windows.
    ' Si le répertoire System de Windows n’est pas un sous-répertoire du
    ' répertoire Windows, alors l’utilisateur utilise une version réseau
    ' de Windows. Dans ce cas, si l’utilisateur n’a pas d’accès en écriture
    ' sur le répertoire système partagé, il faut changer la destination
    ' des fichiers vers le répertoire de Windows.
    '
    If InStr(gstrWinSysDir, gstrWinDir) = 0 Then
        If WriteAccess(gstrWinSysDir) = False Then
            gstrWinSysDir = gstrWinDir
        End If
    End If

    '
    ' Les arguments de la ligne de commande doivent être traités aussitôt
    ' que possible, sans eux, il est impossible d'appeler le programme
    ' de retrait de l'application pour nettoyer après une installation
    ' interrompue.
    '
    #If Win32 And LOGGING Then
        ProcessCommandLine Command$, gstrSrcPath, gstrAppRemovalLog, gstrAppRemovalEXE
    #Else
        ProcessCommandLine Command$, gstrSrcPath
    #End If
    
    AddDirSep gstrSrcPath

    '
    ' Le programme d'amorçage (SETUP.EXE) copie les fichier SETUP1/132.EXE et SETUP.LST
    ' dans le répertoire Windows de l'utilisateur. Les informations nécessaires comme
    ' les indicateurs et les informations sur les fichiers sont lus depuis cette
    ' copie de SETUP.LST copié dans ce répertoire.
    '
    gstrSetupInfoFile = gstrWinDir & gstrFILE_SETUP
    
    gstrAppName = ReadIniFile(gstrSetupInfoFile, gstrINI_SETUP, gstrINI_APPNAME)
    If gstrAppName = gstrNULL Then
        MsgError ResolveResString(resNOSETUPLST), MB_OK Or MB_ICONSTOP, gstrSETMSG
        gstrTitle = ResolveResString(resSETUP, "|1", gstrAppName)
        ExitSetup Me, gintRET_FATAL
    End If
    
    gstrTitle = ResolveResString(resSETUP, "|1", gstrAppName)

    '
    ' Affiche le fond bleu de l'écran d'installation dès que le titre est disponible.
    '
    ShowMainForm

    '
    ' Si la clé a une valeur non nulle dans SETUP.LST, alors définit la variable à vrai.
    '
    #If Win16 Then
        fBtrieve = IIf(Val(ReadIniFile(gstrSetupInfoFile, gstrINI_SETUP, gstrINI_BTRIEVE)), True, False)
    #End If

    '
    ' Affiche la fenêtre de bienvenue.
    '
    ShowWelcomeForm

    '
    ' Obtient le nom du fichier exécutable. Ce nom doit être ajouté dans le
    ' gestionnaire de programmes. Seulement le nom de l'EXE doit être saisi
    ' avec cette clé dans le fichier d'informations d'installation (SETUP.LST).
    '
    gstrAppExe = ReadIniFile(gstrSetupInfoFile, gstrINI_SETUP, gstrINI_APPEXE)

    ' Si cet indicateur est définit, alors le répertoire de destination par
    ' défaut est utilisé sans aucune question, et l'utilisateur n'a pas la
    ' possibilité de le changer. Ceci est fait pour installer un EXE/DLL
    ' comme un composant plutôt qu'une application dans un répertoire. Dans
    ' ce cas, avoir un répertoire pour l'application n'est pas nécessaire.
    If ReadIniFile(gstrSetupInfoFile, gstrINI_SETUP, gstrINI_FORCEUSEDEFDEST) = "1" Then
        gfForceUseDefDest = True
    End If
    
    'recherche le répertoire d'installation de HACCP.EXE
    Dim RépertoireHACCP As String
    RépertoireHACCP = ReadIniFile("win.ini", "haccp", "Répertoire")
    If RépertoireHACCP <> "" Then
        'répertoire trouvé
        gstrDestDir = RépertoireHACCP
    Else
        '
        ' Lit le répertoire de destination par défaut. Si le nom spécifié entre en
        ' conflit ave le nom d'un fichier, alors demande une nouveau répertoire par
        ' défaut.
        '
        gstrDestDir = ResolveDestDir(ReadIniFile(gstrSetupInfoFile, gstrINI_SETUP, gstrINI_APPDIR))
        While FileExists(gstrDestDir) = True Or gstrDestDir = gstrNULL
            If MsgError(ResolveResString(resBADDEFDIR), MB_OKCANCEL Or MB_ICONQUESTION, gstrSETMSG) = IDCANCEL Then
                ExitSetup Me, gintRET_FATAL
            End If
            ShowPathDialog gstrDIR_DEST
        Wend
    End If
    '
    '
    ' Ajoute un anti-slash à la fin du nom du répertoire de destination.
    '
    AddDirSep gstrDestDir

    Do
        '
        ' Afiche le bouton d'installation et de répertoire par défaut.
        ' L'utilisateur peut changer le répertoire par défaut ici.
        '
        ShowBeginForm

        '
        ' Ceci est l'endroit convenable pour afficher une boîte de dialogue d'options
        ' permettant à l'utilisateur de sélectionner des options d'installation : exemples,
        ' documents, fichier d'aides, etc... Les résultats de cette boîte de dialogue
        ' seraient vérifiés dans la boucle ci-dessous.
        '
        'ShowOptionsDialog (Fonction qui peut être écrit avec des cases à cocher, etc...)
        '

        '
        ' Initialise la table des lecteurs utilisés et la table des espaces disque.
        '
        InitDiskInfo

        SetMousePtr gintMOUSE_HOURGLASS
        ShowStaticMessageDialog ResolveResString(resDISKSPACE)

        '
        ' Pour chaque section dans SETUP.LST qui sera installée, appelle CalcDiskSpace
        ' avec le nom de la section.
        '
        CalcDiskSpace strINI_FILES
        'section des fichiers du programme d'installation de module
        CalcDiskSpace "instmod"
        
        '
        ' Si il y a une boîte de dialogue d'options, il faut vérifier les résultats
        ' ici pour déterminer l'espace nécessaire sur le disque (si les options
        ' doivent être installées).
        '
        'If chkInstallSamples.Value = TRUE then
        '    CalcDiskSpace "Exemples"
        'End If
        '

        HideStaticMessageDialog
        SetMousePtr gintMOUSE_DEFAULT

    '
    ' Après avoir fait tous les appels à CalcDiskSpace, appelle CheckDiskSpace
    ' pour vérifier les résultats et afficher un avertissement (si nécessaire).
    ' Si l'utilisateur désire utiliser un autre répertoire de destination
    ' (ou nettoyer et réessayer) alors CheckDiskSpace renvoie faux.
    '
    Loop While CheckDiskSpace() = False

    '
    ' Affiche la feuille de copie et definit le pourcentage de la gauge à zéro.
    '
    SetMousePtr gintMOUSE_HOURGLASS
    ShowCopyDialog
    UpdateStatus frmCopy.picStatus, 0, True

    '
    ' Toujours commence avec le disque numéro 1.
    '
    gintCurrentDisk = 1

    '
    ' Commence à se connecter au fichier d'informations d'installation.
    ' Ceui-ci sera utilisé pour l'application de Retrait d'application.
    '
    #If Win32 And LOGGING Then
        EnableLogging gstrAppRemovalLog
        
        ' Doit aller de l'avant et force le répertoire de l'application a être créé,
        ' pendant que le fichier d'informations de l'application de Retrait
        ' d'application sera copié plus tard ici.
        MakePath gstrDestDir, False ' L'utilisateur doit ignorer les erreurs ici.
    #End If
    
    '
    ' Pour chaque section dans SETUP.LST qui a besoin d'être initialisée, appel
    ' CopySection avec le nom de la section.
    '
    
    CopySection strINI_FILES
    
    CopySection "instmod"
    
    ' S'il y a une boîte de dialogue d'options, il faut vérifier ici si
    ' oui ou non il faut copier les fichiers dans la(les) section(s) particulière(s)
    '
    'If chkInstallSamples.Value = TRUE then
    
    'End If
    '

    UpdateStatus frmCopy.picStatus, 1, True
    
    HideCopyDialog

    '
    ' Maintenant, fait toutes les mises à jour 'invisibles' qui sont requises.
    '
    SetMousePtr gintMOUSE_DEFAULT
    ShowStaticMessageDialog ResolveResString(resUPDATING)

    '
    ' Ajoute l'information sur Btrieve dans win.ini si nécessaire.
    '
    #If Win16 Then
        If fBtrieve = True Then
            DoBtrieve
        End If
    #End If
    
    '
    ' Ajoute le partage de fichier (via VSHARE.386) si nécessaire.
    '
#If Win16 Then
    AddShareIfNeeded
#End If

    '
    ' Inscrit tous les fichiers qui ont été enregistrés dans le tableau des
    ' inscriptions. La procédure CopySection ajoute une entrée d'inscription (si
    ' nécessaire) si un fichier est copié.
    '
    RegisterFiles

    '
    ' (Edition entreprise 32 bits uniquement)
    '
    ' Crée un groupe de programmes et des icônes séparées pour le Gestionnaire
    ' de connexion d'Automation à distance et le Gestionnaire d'Automation, s'ils
    ' ont été installés.
    ' Ce groupe de programmes est entièrement séparé de celui créé pour
    ' l'application (s'il y en a une), ce groupe sera partagé par toutes
    ' les applications Visual Basic qui l'installe.
    '
    ' Remarque : Ce n'est pas l'endroit pour ajouter des icônes. Ceci
    ' est fait après que les icônes de l'Automation à distance ont été créés.
    #If Win32 Then
        ShowStaticMessageDialog ResolveResString(resPROGMAN)
        If gsDest.strAUTMGR32 <> "" Or gsDest.strRACMGR32 <> "" Then
            ' Au moins un de ces programmes est installé. Donc crée le groupe de programmes.
            Const strREMAUTGROUPPATH = "RemAutVB.GRP"
            CreateOSProgramGroup frmSetup1, ResolveResString(resREMAUTGROUPNAME), strREMAUTGROUPPATH

            ' Maintenant crée les icônes pour AUTMGR32.EXE et RACMGR32.EXE.
            If gsDest.strRACMGR32 <> "" Then
                CreateOSLink frmSetup1, gsDest.strRACMGR32, "", ResolveResString(resRACMGR32ICON), False
            End If
            If gsDest.strAUTMGR32 <> "" Then
                CreateOSLink frmSetup1, gsDest.strAUTMGR32, "", ResolveResString(resAUTMGR32ICON), False
            End If
        End If
        mstrLastCreatedShellGroup = "" ' Ne pas utiliser le même pour les autres icônes.
    #End If


    '
    ' Crée des groupes de programmes et des icônes (ou liaisons, par ex. racourcis).
    '
    
    ShowStaticMessageDialog ResolveResString(resPROGMAN)
    
    Const fDefCreateGroupUnderWin95 = False
    ' Si fDefCreateGroupUnderWin95 est définit à faux (ce qui est fait par défaut),
    ' alors aucun groupe de programmes ne sera créé sous Windows 95 à moins que cela
    ' ne soit absolument nécessaire.
    '
    ' Par défaut sous Windows 95, aucun groupe ne doit être créé, et seulement
    ' l'icône du programme doit être placé directement dans le menu Démarrer/Programmes
    ' (à moins qu'il y ait d'autres icônes définit par l'utilisateur à ajouter).
    '
    
    Dim fAdditionalIcons As Boolean
    '
    ' Il y a deux raisons par défaut pour installer plus d'icônes que celui
    ' de l'exécutable de l'application:
    '  1) S'il y a des icônes définit par l'utilisateur (en personnalisant cette procédure)
    '  2) S'il y a un icône de l'application de Retrait d'application (et aussi si
    '     c'est sous Windows NT).
    '
    ' Si cette procédure est modifiée pour installer plus d'icônes, vérifier que
    ' cette variable est définie à vrai (True), ainsi un groupe de programmes sera
    ' défini pour les icônes.
    '
    fAdditionalIcons = True
    #If Win32 Then
        fAdditionalIcons = fAdditionalIcons Or (Not TreatAsWin95())
    #Else
        fAdditionalIcons = fAdditionalIcons
    #End If
    
    ' Les variables suivantes déterminent si oui ou non il faut créer un groupe
    ' de programmes pour les icônes. Ceci est contrôlé par les indicateurs
    ' fNoGroupUnderWin95, fAdditionalIcons, et la fonction TreatAsWin95().
    Dim fCreateGroup As Boolean
#If Win32 Then
    If TreatAsWin95() Then
        ' Windowss 95 uniquement:
        ' Il faut créer un groupe de programmes seulement si il y a des icônes en plus
        ' de celui de l'exécutable de l'application (s'il y en a un), ou si
        ' l'indicateur fDefCreateGroupUnderWin95 a été défini à vrai (True) pour
        ' forcer le comportement par défaut.
#Else
    If False Then
#End If
        fCreateGroup = fDefCreateGroupUnderWin95 Or fAdditionalIcons
    Else
        #If Win32 Then
            ' Windows 32 bits uniquement:
            ' Il faut créer un groupe dans le Gestionnaire de programmes car
            ' il y a toujours un icône pour le programme de Retrait d'application.
            fCreateGroup = True
        #Else
            ' Windows 16 bits uniquement:
            ' S'il faut déployer ce projet comme une application (à l'opposé d'un composant
            ' partagé unique), alors il faut créer un groupe et un(des) icône(s).
            fCreateGroup = (gstrAppExe <> "") Or fAdditionalIcons
        #End If
    End If
    
    If fCreateGroup Then
        strGroupName = "HACCP 3"
        If gstrAppExe = "" Then
            strGrpPath = Left$(gstrAppName, InStr(gstrAppName, gstrSEP_EXT)) & strEXT_GRP
        Else
            strGrpPath = Left$(gstrAppExe, InStr(gstrAppExe, gstrSEP_EXT)) & strEXT_GRP
        End If
        
        '
        ' Crée le groupe de programmes principal.
        '
        CreateOSProgramGroup frmSetup1, strGroupName, strGrpPath
        fMainGroupWasCreated = True
    End If
    
    If gstrAppExe <> "" Then
        '
        ' Crée l'icône de l'application principale ou le lien.
        '
        CreateOSLink frmSetup1, gsDest.strAppDir & gstrAppExe, "", gstrAppName
    End If
        
    '
    ' S'il faut créer plus d'icônes, insérez le code ici, et vérifiez que la variable
    ' fAdditionalIcons ait la valeur vrai (True).
    '
    If Not fAdditionalIcons Then
        MsgError "Erreur interne du programme d'installation personnalisé: fAdditionalIcons = Faux", vbOKOnly Or vbExclamation, gstrTitle
        ExitSetup Me, gintRET_FATAL
    End If
    CreateOSLink frmSetup1, gsDest.strAppDir & "genmod.exe", "", "Génération d'une disquette d'installation de module HACCP"
    'CreateOSLink frmSetup1, gsDest.strAppDir & "Mon Exe 2.exe", "Mes arguments de ligne de commande de Exe 2", "Mon Exe 2"
    '

    '
    ' Inscrit le chemin pour les applications 32 bits.
    '
    #If Win32 And LOGGING Then
        If gstrAppExe <> "" Then
            Dim strPerAppPath As String
            strPerAppPath = ReadIniFile(gstrSetupInfoFile, gstrINI_SETUP, gstrINI_APPPATH)
            AddPerAppPath gstrAppExe, gsDest.strAppDir, strPerAppPath
        End If
    #End If
    
ExitSetup:
    HideStaticMessageDialog
    RestoreProgMan
    #If Win32 And LOGGING Then
        If fWithinAction() Then
            ' Maintenant, toute les actions du fichier d'informations doivent être soit
            ' annulées ou validées.
            ExitSetup Me, gintRET_FATAL
        End If
        MoveAppRemovalFiles
    #End If
    ExitSetup Me, gintRET_FINISHEDSUCCESS

MainError:
    Select Case MsgError(Error$ & LS$ & ResolveResString(resUNEXPECTED), MB_RETRYCANCEL Or MB_ICONEXCLAMATION, gstrTitle)
    Case IDRETRY
        Resume
    Case IDCANCEL
        ExitSetup Me, gintRET_ABORT
        Resume
    End Select
End Sub

'-----------------------------------------------------------
' SUB: HideCopyDialog
'
' Décharge la feuille d'état de copie des fichiers.
'-----------------------------------------------------------
'
Private Sub HideCopyDialog()
    Unload frmCopy
End Sub

'-----------------------------------------------------------
' SUB: HideStaticMessageDialog
'
' Décharge la feuille des messages d'installation.
'-----------------------------------------------------------
'
Private Sub HideStaticMessageDialog()
    Unload frmMessage
End Sub

'-----------------------------------------------------------
' SUB: ShowBeginForm
'
' Affiche la feuille de début d'installation.
'-----------------------------------------------------------
'
Private Sub ShowBeginForm()
    frmBegin.Show 1
End Sub

'-----------------------------------------------------------
' SUB: ShowCopyDialog
'
' Affiche la feuille d'état de copie des fichiers.
'-----------------------------------------------------------
'
Private Sub ShowCopyDialog()
    CenterForm frmCopy
    frmCopy.Show
    frmCopy.Refresh
    frmCopy.cmdExit.SetFocus
End Sub

'-----------------------------------------------------------
' SUB: ShowMainForm
'
' Affiche la feuille bleue principale d'installation.
'-----------------------------------------------------------
'
Private Sub ShowMainForm()
    Me.Caption = gstrTitle
    Me.Show
    DrawBackGround
    Me.Refresh
End Sub

'-----------------------------------------------------------
' SUB: ShowStaticMessageDialog
'
' Affiche un mesasge d'installation dans une 'boîte' de
' taille appropriée pour le message.
'
' ENTREE: [strMessage] - message à afficher
'-----------------------------------------------------------
'
Private Sub ShowStaticMessageDialog(ByVal strMessage As String)
    Dim frm As Form

    Set frm = frmMessage
    frm.lblMsg.Caption = strMessage

    '
    ' La hauteur par défaut est deux fois la hauteur de l'icône
    ' d'installation. Si la hauteur du texte du message est plus
    ' grande, alors augmente la hauteur de la feuille à la
    ' hauteur de l'étiquette plus la moitié d'une hauteur d'icône.
    '
    frm.ScaleHeight = frm.imgMsg.Height * 2
    If frm.lblMsg.Height > frm.ScaleHeight Then
        frm.ScaleHeight = frm.lblMsg.Height + frm.imgMsg.Height * 0.5
    End If

    '
    ' Centre verticalement l'icône et l'étiquette dans la feuille.
    '
    frm.imgMsg.Top = frm.ScaleHeight / 2 - frm.imgMsg.Height / 2
    frm.lblMsg.Top = frm.ScaleHeight / 2 - frm.lblMsg.Height / 2

    CenterForm frm

    frm.Show
    frm.Refresh
End Sub

'-----------------------------------------------------------
' SUB: ShowWelcomeForm
'
' Affiche la feuille de bienvenue dans l'installation.
'-----------------------------------------------------------
'
Private Sub ShowWelcomeForm()
    frmWelcome.Show 1
End Sub

'-----------------------------------------------------------
' SUB: GetStrings
'
' Charge les chaînes de ressources dans des variables globales
' et des feuilles/contrôles.
'-----------------------------------------------------------
'
Private Sub GetStrings()
    On Error GoTo GSErr
    
    gstrSETMSG = ResolveResString(resSETMSG)
    
    Exit Sub
    
GSErr:
    MsgError mstrRESOURCELOADFAIL, MB_ICONSTOP Or MB_OK, gstrNULL
    ExitSetup Me, gintRET_FATAL
End Sub
