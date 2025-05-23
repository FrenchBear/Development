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
' Impossible de placer cette cha�ne dans le fichier de ressources, car elle indique une
' erreur dans le chargement des ressources.
'
Const mstrRESOURCELOADFAIL$ = "Une erreur s'est produite pendant l'initialisation des ressources utilis�es par cette application."

'-----------------------------------------------------------
' SUB: DrawBackGround
'
' Dessine l'�cran bleu et affiche le titre de l'installation
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
    ' Obtient les valeurs syst�me pour la hauteur et la largeur.
    '
    intFormHeight = ScaleHeight
    intFormWidth = ScaleWidth

    '
    ' Calcule la taille de la zone bleue.
    '
    sngBlueStep = intBANDHEIGHT * (intBLUEEND - intBLUESTART) / intFormHeight
    sngBlueCur = intBLUESTART

    '
    ' Dessine l'�cran bleu.
    '
    For intY = 0 To intFormHeight Step intBANDHEIGHT
        Line (-1, intY - 1)-(intFormWidth, intY + intBANDHEIGHT), RGB(0, 0, sngBlueCur), BF
        sngBlueCur = sngBlueCur + sngBlueStep
    Next intY

    '
    ' Affiche le nom ombrag�.
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
    Const strINI_FILES$ = "Files"                           ' Section par d�faut � installer.
    Const strEXT_GRP$ = "GRP"                               ' Extension du groupe de programmes.

    #If Win16 Then
    Dim fBtrieve As Integer                                 ' Indique si Btrieve est utilis�.
    #End If
    Dim strGrpPath As String                                ' Nom du groupe de fichiers.
    Dim strGroupName As String                              ' Nom du groupe de programmes.
    Dim sFile As FILEINFO                                   ' Premi�re ligne d'information
                                                            ' de type "Files=".
    On Error GoTo MainError

    '
    ' Initialise les variables d'espacement pour les bo�tes de messages.
    '
    LF$ = Chr$(10)
    LS$ = LF$ & LF$

    '
    ' Initialise les cha�nes de ressources utilis�es par les variables globales
    ' et les feuilles/contr�les.
    '
    GetStrings
    
    '
    ' Obtient les r�pertoires de Windows et System de Windows.
    '
    gstrWinDir = GetWindowsDir()
    gstrWinSysDir = GetWindowsSysDir()

    '
    ' Si le r�pertoire System de Windows est un sous-r�pertoire du r�pertoire
    ' Windows, l�emplacement correct pour installer les fichiers sp�cifi�s dans
    ' SETUP.LST comme � $(WinSysDest) � est dans le r�pertoire System de Windows.
    ' Si le r�pertoire System de Windows n�est pas un sous-r�pertoire du
    ' r�pertoire Windows, alors l�utilisateur utilise une version r�seau
    ' de Windows. Dans ce cas, si l�utilisateur n�a pas d�acc�s en �criture
    ' sur le r�pertoire syst�me partag�, il faut changer la destination
    ' des fichiers vers le r�pertoire de Windows.
    '
    If InStr(gstrWinSysDir, gstrWinDir) = 0 Then
        If WriteAccess(gstrWinSysDir) = False Then
            gstrWinSysDir = gstrWinDir
        End If
    End If

    '
    ' Les arguments de la ligne de commande doivent �tre trait�s aussit�t
    ' que possible, sans eux, il est impossible d'appeler le programme
    ' de retrait de l'application pour nettoyer apr�s une installation
    ' interrompue.
    '
    #If Win32 And LOGGING Then
        ProcessCommandLine Command$, gstrSrcPath, gstrAppRemovalLog, gstrAppRemovalEXE
    #Else
        ProcessCommandLine Command$, gstrSrcPath
    #End If
    
    AddDirSep gstrSrcPath

    '
    ' Le programme d'amor�age (SETUP.EXE) copie les fichier SETUP1/132.EXE et SETUP.LST
    ' dans le r�pertoire Windows de l'utilisateur. Les informations n�cessaires comme
    ' les indicateurs et les informations sur les fichiers sont lus depuis cette
    ' copie de SETUP.LST copi� dans ce r�pertoire.
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
    ' Affiche le fond bleu de l'�cran d'installation d�s que le titre est disponible.
    '
    ShowMainForm

    '
    ' Si la cl� a une valeur non nulle dans SETUP.LST, alors d�finit la variable � vrai.
    '
    #If Win16 Then
        fBtrieve = IIf(Val(ReadIniFile(gstrSetupInfoFile, gstrINI_SETUP, gstrINI_BTRIEVE)), True, False)
    #End If

    '
    ' Affiche la fen�tre de bienvenue.
    '
    ShowWelcomeForm

    '
    ' Obtient le nom du fichier ex�cutable. Ce nom doit �tre ajout� dans le
    ' gestionnaire de programmes. Seulement le nom de l'EXE doit �tre saisi
    ' avec cette cl� dans le fichier d'informations d'installation (SETUP.LST).
    '
    gstrAppExe = ReadIniFile(gstrSetupInfoFile, gstrINI_SETUP, gstrINI_APPEXE)

    ' Si cet indicateur est d�finit, alors le r�pertoire de destination par
    ' d�faut est utilis� sans aucune question, et l'utilisateur n'a pas la
    ' possibilit� de le changer. Ceci est fait pour installer un EXE/DLL
    ' comme un composant plut�t qu'une application dans un r�pertoire. Dans
    ' ce cas, avoir un r�pertoire pour l'application n'est pas n�cessaire.
    If ReadIniFile(gstrSetupInfoFile, gstrINI_SETUP, gstrINI_FORCEUSEDEFDEST) = "1" Then
        gfForceUseDefDest = True
    End If
    
    'recherche le r�pertoire d'installation de HACCP.EXE
    Dim R�pertoireHACCP As String
    R�pertoireHACCP = ReadIniFile("win.ini", "haccp", "R�pertoire")
    If R�pertoireHACCP <> "" Then
        'r�pertoire trouv�
        gstrDestDir = R�pertoireHACCP
    Else
        Dim cr As Integer
        cr = MsgBox("La proc�dure d'installation ne trouve pas trace du programme HACCP sur votre ordinateur. " & Chr$(10) & Chr$(13) & Chr$(10) & Chr$(13) & "Si le programme HACCP n'est pas install�, choisissez le bouton 'Annuler' et installez le programme HACCP avant d'ajouter un module. " & Chr$(10) & Chr$(13) & Chr$(10) & Chr$(13) & "Si le programme HACCP est d�j� install�, cliquez sur OK pour m'indiquer le r�pertoire d'installation du programme HACCP.", MB_ICONEXCLAMATION Or MB_OKCANCEL, "Installation d'un module HACCP")
        If cr = IDCANCEL Then
            ExitSetup Me, gintRET_FATAL
        End If
        'change le r�pertoire d'installation
        Do
            cr = True
            ShowPathDialog gstrDIR_DEST
            If Not FileExists(gstrDestDir & "\haccp.exe") Then
                MsgBox "Le r�pertoire choisi ne contient pas le programme HACCP.EXE. Choisissez-en un autre.", MB_ICONEXCLAMATION, "Installation d'un module HACCP"
                cr = False
            End If
        Loop While Not cr
        If gfRetVal = gintRET_CANCEL Then
            ExitSetup Me, gintRET_FATAL
        End If
        
    End If
    '
    '
    ' Ajoute un anti-slash � la fin du nom du r�pertoire de destination.
    '
    AddDirSep gstrDestDir

    Do
        '
        ' Afiche le bouton d'installation et de r�pertoire par d�faut.
        ' L'utilisateur peut changer le r�pertoire par d�faut ici.
        '
        ShowBeginForm

        '
        ' Ceci est l'endroit convenable pour afficher une bo�te de dialogue d'options
        ' permettant � l'utilisateur de s�lectionner des options d'installation : exemples,
        ' documents, fichier d'aides, etc... Les r�sultats de cette bo�te de dialogue
        ' seraient v�rifi�s dans la boucle ci-dessous.
        '
        'ShowOptionsDialog (Fonction qui peut �tre �crit avec des cases � cocher, etc...)
        '

        '
        ' Initialise la table des lecteurs utilis�s et la table des espaces disque.
        '
        InitDiskInfo

        SetMousePtr gintMOUSE_HOURGLASS
        ShowStaticMessageDialog ResolveResString(resDISKSPACE)

        '
        ' Pour chaque section dans SETUP.LST qui sera install�e, appelle CalcDiskSpace
        ' avec le nom de la section.
        '
        CalcDiskSpace strINI_FILES
        
        '
        ' Si il y a une bo�te de dialogue d'options, il faut v�rifier les r�sultats
        ' ici pour d�terminer l'espace n�cessaire sur le disque (si les options
        ' doivent �tre install�es).
        '
        'If chkInstallSamples.Value = TRUE then
        '    CalcDiskSpace "Exemples"
        'End If
        '

        HideStaticMessageDialog
        SetMousePtr gintMOUSE_DEFAULT

    '
    ' Apr�s avoir fait tous les appels � CalcDiskSpace, appelle CheckDiskSpace
    ' pour v�rifier les r�sultats et afficher un avertissement (si n�cessaire).
    ' Si l'utilisateur d�sire utiliser un autre r�pertoire de destination
    ' (ou nettoyer et r�essayer) alors CheckDiskSpace renvoie faux.
    '
    Loop While CheckDiskSpace() = False

    '
    ' Affiche la feuille de copie et definit le pourcentage de la gauge � z�ro.
    '
    SetMousePtr gintMOUSE_HOURGLASS
    ShowCopyDialog
    UpdateStatus frmCopy.picStatus, 0, True

    '
    ' Toujours commence avec le disque num�ro 1.
    '
    gintCurrentDisk = 1

    '
    ' Commence � se connecter au fichier d'informations d'installation.
    ' Ceui-ci sera utilis� pour l'application de Retrait d'application.
    '
    #If Win32 And LOGGING Then
        EnableLogging gstrAppRemovalLog
        
        ' Doit aller de l'avant et force le r�pertoire de l'application a �tre cr��,
        ' pendant que le fichier d'informations de l'application de Retrait
        ' d'application sera copi� plus tard ici.
        MakePath gstrDestDir, False ' L'utilisateur doit ignorer les erreurs ici.
    #End If
    
    '
    ' Pour chaque section dans SETUP.LST qui a besoin d'�tre initialis�e, appel
    ' CopySection avec le nom de la section.
    '
    
    CopySection strINI_FILES
        
    ' S'il y a une bo�te de dialogue d'options, il faut v�rifier ici si
    ' oui ou non il faut copier les fichiers dans la(les) section(s) particuli�re(s)
    '
    'If chkInstallSamples.Value = TRUE then
    '    CopySection "Exemples"
    'End If
    '

    UpdateStatus frmCopy.picStatus, 1, True
    
    HideCopyDialog

    '
    ' Maintenant, fait toutes les mises � jour 'invisibles' qui sont requises.
    '
    SetMousePtr gintMOUSE_DEFAULT
    ShowStaticMessageDialog ResolveResString(resUPDATING)

    '
    ' Ajoute l'information sur Btrieve dans win.ini si n�cessaire.
    '
    #If Win16 Then
        If fBtrieve = True Then
            DoBtrieve
        End If
    #End If
    
    '
    ' Ajoute le partage de fichier (via VSHARE.386) si n�cessaire.
    '
#If Win16 Then
    AddShareIfNeeded
#End If

    '
    ' Inscrit tous les fichiers qui ont �t� enregistr�s dans le tableau des
    ' inscriptions. La proc�dure CopySection ajoute une entr�e d'inscription (si
    ' n�cessaire) si un fichier est copi�.
    '
    RegisterFiles

    '
    ' (Edition entreprise 32 bits uniquement)
    '
    ' Cr�e un groupe de programmes et des ic�nes s�par�es pour le Gestionnaire
    ' de connexion d'Automation � distance et le Gestionnaire d'Automation, s'ils
    ' ont �t� install�s.
    ' Ce groupe de programmes est enti�rement s�par� de celui cr�� pour
    ' l'application (s'il y en a une), ce groupe sera partag� par toutes
    ' les applications Visual Basic qui l'installe.
    '
    ' Remarque : Ce n'est pas l'endroit pour ajouter des ic�nes. Ceci
    ' est fait apr�s que les ic�nes de l'Automation � distance ont �t� cr��s.
    #If Win32 Then
        ShowStaticMessageDialog ResolveResString(resPROGMAN)
        If gsDest.strAUTMGR32 <> "" Or gsDest.strRACMGR32 <> "" Then
            ' Au moins un de ces programmes est install�. Donc cr�e le groupe de programmes.
            Const strREMAUTGROUPPATH = "RemAutVB.GRP"
            CreateOSProgramGroup frmSetup1, ResolveResString(resREMAUTGROUPNAME), strREMAUTGROUPPATH

            ' Maintenant cr�e les ic�nes pour AUTMGR32.EXE et RACMGR32.EXE.
            If gsDest.strRACMGR32 <> "" Then
                CreateOSLink frmSetup1, gsDest.strRACMGR32, "", ResolveResString(resRACMGR32ICON), False
            End If
            If gsDest.strAUTMGR32 <> "" Then
                CreateOSLink frmSetup1, gsDest.strAUTMGR32, "", ResolveResString(resAUTMGR32ICON), False
            End If
        End If
        mstrLastCreatedShellGroup = "" ' Ne pas utiliser le m�me pour les autres ic�nes.
    #End If


    '
    ' Cr�e des groupes de programmes et des ic�nes (ou liaisons, par ex. racourcis).
    '
    
    ShowStaticMessageDialog ResolveResString(resPROGMAN)
    
    Const fDefCreateGroupUnderWin95 = False
    ' Si fDefCreateGroupUnderWin95 est d�finit � faux (ce qui est fait par d�faut),
    ' alors aucun groupe de programmes ne sera cr�� sous Windows 95 � moins que cela
    ' ne soit absolument n�cessaire.
    '
    ' Par d�faut sous Windows 95, aucun groupe ne doit �tre cr��, et seulement
    ' l'ic�ne du programme doit �tre plac� directement dans le menu D�marrer/Programmes
    ' (� moins qu'il y ait d'autres ic�nes d�finit par l'utilisateur � ajouter).
    '
    
    Dim fAdditionalIcons As Boolean
    '
    ' Il y a deux raisons par d�faut pour installer plus d'ic�nes que celui
    ' de l'ex�cutable de l'application:
    '  1) S'il y a des ic�nes d�finit par l'utilisateur (en personnalisant cette proc�dure)
    '  2) S'il y a un ic�ne de l'application de Retrait d'application (et aussi si
    '     c'est sous Windows NT).
    '
    ' Si cette proc�dure est modifi�e pour installer plus d'ic�nes, v�rifier que
    ' cette variable est d�finie � vrai (True), ainsi un groupe de programmes sera
    ' d�fini pour les ic�nes.
    '
    fAdditionalIcons = False
    #If Win32 Then
        fAdditionalIcons = fAdditionalIcons Or (Not TreatAsWin95())
    #Else
        fAdditionalIcons = fAdditionalIcons
    #End If
    
    ' Les variables suivantes d�terminent si oui ou non il faut cr�er un groupe
    ' de programmes pour les ic�nes. Ceci est contr�l� par les indicateurs
    ' fNoGroupUnderWin95, fAdditionalIcons, et la fonction TreatAsWin95().
    Dim fCreateGroup As Boolean
#If Win32 Then
    If TreatAsWin95() Then
        ' Windowss 95 uniquement:
        ' Il faut cr�er un groupe de programmes seulement si il y a des ic�nes en plus
        ' de celui de l'ex�cutable de l'application (s'il y en a un), ou si
        ' l'indicateur fDefCreateGroupUnderWin95 a �t� d�fini � vrai (True) pour
        ' forcer le comportement par d�faut.
#Else
    If False Then
#End If
        fCreateGroup = fDefCreateGroupUnderWin95 Or fAdditionalIcons
    Else
        #If Win32 Then
            ' Windows 32 bits uniquement:
            ' Il faut cr�er un groupe dans le Gestionnaire de programmes car
            ' il y a toujours un ic�ne pour le programme de Retrait d'application.
            fCreateGroup = True
        #Else
            ' Windows 16 bits uniquement:
            ' S'il faut d�ployer ce projet comme une application (� l'oppos� d'un composant
            ' partag� unique), alors il faut cr�er un groupe et un(des) ic�ne(s).
            fCreateGroup = (gstrAppExe <> "") Or fAdditionalIcons
        #End If
    End If
    
    If fCreateGroup Then
        strGroupName = gstrAppName
        If gstrAppExe = "" Then
            strGrpPath = Left$(gstrAppName, InStr(gstrAppName, gstrSEP_EXT)) & strEXT_GRP
        Else
            strGrpPath = Left$(gstrAppExe, InStr(gstrAppExe, gstrSEP_EXT)) & strEXT_GRP
        End If
        
        '
        ' Cr�e le groupe de programmes principal.
        '
        CreateOSProgramGroup frmSetup1, strGroupName, strGrpPath
        fMainGroupWasCreated = True
    End If
    
    If gstrAppExe <> "" Then
        '
        ' Cr�e l'ic�ne de l'application principale ou le lien.
        '
        CreateOSLink frmSetup1, gsDest.strAppDir & gstrAppExe, "", gstrAppName
    End If
        
    '
    ' S'il faut cr�er plus d'ic�nes, ins�rez le code ici, et v�rifiez que la variable
    ' fAdditionalIcons ait la valeur vrai (True).
    '
    'If Not fAdditionalIcons Then
    '  MsgError "Erreur interne du programme d'installation personnalis�: fAdditionalIcons = Faux", vbOKOnly Or vbExclamation, gstrTitle
    '  ExitSetup Me, gintRET_FATAL
    'End If
    'CreateOSLink frmSetup1, gsDest.strAppDir & "Mon Exe 1.exe", "Mes arguments de ligne de commande de Exe 1", "Mon Exe 1"
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
            ' Maintenant, toute les actions du fichier d'informations doivent �tre soit
            ' annul�es ou valid�es.
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
' D�charge la feuille d'�tat de copie des fichiers.
'-----------------------------------------------------------
'
Private Sub HideCopyDialog()
    Unload frmCopy
End Sub

'-----------------------------------------------------------
' SUB: HideStaticMessageDialog
'
' D�charge la feuille des messages d'installation.
'-----------------------------------------------------------
'
Private Sub HideStaticMessageDialog()
    Unload frmMessage
End Sub

'-----------------------------------------------------------
' SUB: ShowBeginForm
'
' Affiche la feuille de d�but d'installation.
'-----------------------------------------------------------
'
Private Sub ShowBeginForm()
    frmBegin.Show 1
End Sub

'-----------------------------------------------------------
' SUB: ShowCopyDialog
'
' Affiche la feuille d'�tat de copie des fichiers.
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
' Affiche un mesasge d'installation dans une 'bo�te' de
' taille appropri�e pour le message.
'
' ENTREE: [strMessage] - message � afficher
'-----------------------------------------------------------
'
Private Sub ShowStaticMessageDialog(ByVal strMessage As String)
    Dim frm As Form

    Set frm = frmMessage
    frm.lblMsg.Caption = strMessage

    '
    ' La hauteur par d�faut est deux fois la hauteur de l'ic�ne
    ' d'installation. Si la hauteur du texte du message est plus
    ' grande, alors augmente la hauteur de la feuille � la
    ' hauteur de l'�tiquette plus la moiti� d'une hauteur d'ic�ne.
    '
    frm.ScaleHeight = frm.imgMsg.Height * 2
    If frm.lblMsg.Height > frm.ScaleHeight Then
        frm.ScaleHeight = frm.lblMsg.Height + frm.imgMsg.Height * 0.5
    End If

    '
    ' Centre verticalement l'ic�ne et l'�tiquette dans la feuille.
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
' Charge les cha�nes de ressources dans des variables globales
' et des feuilles/contr�les.
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
