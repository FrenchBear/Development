VERSION 4.00
Begin VB.MDIForm FormMain 
   Appearance      =   0  'Flat
   BackColor       =   &H8000000C&
   Caption         =   "MDIForm1"
   ClientHeight    =   4350
   ClientLeft      =   75
   ClientTop       =   1905
   ClientWidth     =   9600
   Height          =   5040
   Icon            =   "HACMAIN.frx":0000
   Left            =   15
   LinkTopic       =   "MDIForm1"
   LockControls    =   -1  'True
   Top             =   1275
   Width           =   9720
   Begin VB.PictureBox picBarreEtat 
      Align           =   2  'Align Bottom
      Appearance      =   0  'Flat
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   270
      Left            =   0
      ScaleHeight     =   240
      ScaleWidth      =   9570
      TabIndex        =   2
      Top             =   4080
      Width           =   9600
      Begin VB.Label lblLigneEtat 
         Appearance      =   0  'Flat
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   60
         TabIndex        =   3
         Top             =   0
         Width           =   6435
      End
   End
   Begin VB.PictureBox picToolbar 
      Align           =   1  'Align Top
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   0
      ScaleHeight     =   33
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   640
      TabIndex        =   1
      Top             =   0
      Width           =   9600
      Begin Threed.SSRibbon btnFenetre 
         Height          =   345
         Index           =   5
         Left            =   4290
         TabIndex        =   19
         Top             =   90
         Visible         =   0   'False
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   65
         backcolor       =   -2147483633
         groupallowallup =   0   'False
         outline         =   0   'False
         pictureup       =   "HACMAIN.frx":030A
         picturedn       =   "HACMAIN.frx":08D8
      End
      Begin Threed.SSCommand btnDétail 
         Height          =   345
         Left            =   5235
         TabIndex        =   18
         Top             =   90
         Visible         =   0   'False
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   78
         outline         =   0   'False
         picture         =   "HACMAIN.frx":0EA6
      End
      Begin Threed.SSCommand btnEditionCopier 
         Height          =   345
         Left            =   1605
         TabIndex        =   17
         Top             =   90
         Visible         =   0   'False
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   78
         outline         =   0   'False
         picture         =   "HACMAIN.frx":10CC
      End
      Begin Threed.SSCommand btnEditionCouper 
         Height          =   345
         Left            =   1260
         TabIndex        =   16
         Top             =   90
         Visible         =   0   'False
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   78
         outline         =   0   'False
         picture         =   "HACMAIN.frx":137E
      End
      Begin Threed.SSCommand btnEditionColler 
         Height          =   345
         Left            =   1950
         TabIndex        =   15
         Top             =   90
         Visible         =   0   'False
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   78
         outline         =   0   'False
         picture         =   "HACMAIN.frx":1630
      End
      Begin VB.Line LineSep 
         BorderColor     =   &H00FFFFFF&
         Index           =   1
         X1              =   0
         X2              =   539
         Y1              =   1
         Y2              =   1
      End
      Begin VB.Line LineSep 
         BorderColor     =   &H00808080&
         Index           =   0
         X1              =   0
         X2              =   539
         Y1              =   0
         Y2              =   0
      End
      Begin Threed.SSCommand btnFichierEnregistrer 
         Height          =   345
         Left            =   780
         TabIndex        =   14
         Top             =   90
         Visible         =   0   'False
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   78
         outline         =   0   'False
         picture         =   "HACMAIN.frx":18E2
      End
      Begin Threed.SSCommand btnAide 
         Height          =   345
         Left            =   6180
         TabIndex        =   13
         Top             =   90
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   78
         outline         =   0   'False
         picture         =   "HACMAIN.frx":1A26
      End
      Begin Threed.SSCommand btnCohérence 
         Height          =   345
         Left            =   5580
         TabIndex        =   12
         Top             =   90
         Visible         =   0   'False
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   78
         outline         =   0   'False
         picture         =   "HACMAIN.frx":1B7E
      End
      Begin Threed.SSCommand btnFichierNouveau 
         Height          =   345
         Left            =   90
         TabIndex        =   11
         Top             =   90
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   78
         outline         =   0   'False
         picture         =   "HACMAIN.frx":1E20
      End
      Begin Threed.SSCommand btnFichierOuvrir 
         Height          =   345
         Left            =   435
         TabIndex        =   10
         Top             =   90
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   78
         outline         =   0   'False
         picture         =   "HACMAIN.frx":1F3E
      End
      Begin Threed.SSRibbon btnFenetre 
         Height          =   345
         Index           =   6
         Left            =   4635
         TabIndex        =   9
         Top             =   90
         Visible         =   0   'False
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   65
         backcolor       =   -2147483633
         groupallowallup =   0   'False
         outline         =   0   'False
         pictureup       =   "HACMAIN.frx":2078
         picturedn       =   "HACMAIN.frx":2646
      End
      Begin Threed.SSRibbon btnFenetre 
         Height          =   345
         Index           =   4
         Left            =   3945
         TabIndex        =   8
         Top             =   90
         Visible         =   0   'False
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   65
         backcolor       =   -2147483633
         groupallowallup =   0   'False
         outline         =   0   'False
         pictureup       =   "HACMAIN.frx":2C14
         picturedn       =   "HACMAIN.frx":2E3A
      End
      Begin Threed.SSRibbon btnFenetre 
         Height          =   345
         Index           =   3
         Left            =   3600
         TabIndex        =   4
         Top             =   90
         Visible         =   0   'False
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   65
         backcolor       =   -2147483633
         groupallowallup =   0   'False
         outline         =   0   'False
         pictureup       =   "HACMAIN.frx":3060
         picturedn       =   "HACMAIN.frx":362E
      End
      Begin Threed.SSRibbon btnFenetre 
         Height          =   345
         Index           =   2
         Left            =   3255
         TabIndex        =   5
         Top             =   90
         Visible         =   0   'False
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   65
         backcolor       =   -2147483633
         groupallowallup =   0   'False
         outline         =   0   'False
         pictureup       =   "HACMAIN.frx":3BFC
         picturedn       =   "HACMAIN.frx":41CA
      End
      Begin Threed.SSRibbon btnFenetre 
         Height          =   345
         Index           =   1
         Left            =   2910
         TabIndex        =   6
         Top             =   90
         Visible         =   0   'False
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   65
         backcolor       =   -2147483633
         groupallowallup =   0   'False
         outline         =   0   'False
         pictureup       =   "HACMAIN.frx":4798
         picturedn       =   "HACMAIN.frx":4942
      End
      Begin Threed.SSRibbon btnFenetre 
         Height          =   345
         Index           =   0
         Left            =   2565
         TabIndex        =   7
         Top             =   90
         Visible         =   0   'False
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   65
         backcolor       =   -2147483633
         groupallowallup =   0   'False
         outline         =   0   'False
         pictureup       =   "HACMAIN.frx":4AEC
         picturedn       =   "HACMAIN.frx":4D12
      End
   End
   Begin VB.PictureBox Picture1 
      Align           =   1  'Align Top
      Appearance      =   0  'Flat
      BackColor       =   &H0080FF80&
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   945
      Left            =   0
      ScaleHeight     =   61
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   638
      TabIndex        =   0
      Top             =   495
      Visible         =   0   'False
      Width           =   9600
      Begin VB.Timer TimerAction 
         Enabled         =   0   'False
         Interval        =   1
         Left            =   0
         Top             =   0
      End
      Begin VB.Timer TimerTips 
         Enabled         =   0   'False
         Interval        =   2000
         Left            =   3180
         Top             =   120
      End
      Begin DwstgLib.DwStorage DwStorage1 
         Left            =   4320
         Top             =   210
         _version        =   65536
         _extentx        =   741
         _extenty        =   741
         _stockprops     =   0
      End
      Begin MSComDlg.CommonDialog CMDialog1 
         Left            =   780
         Top             =   195
         _version        =   65536
         _extentx        =   847
         _extenty        =   847
         _stockprops     =   0
         cancelerror     =   -1  'True
      End
   End
   Begin VB.Menu MnuFichier 
      Caption         =   "&Fichier"
      Begin VB.Menu MnuFichierNouveau 
         Caption         =   "&Nouveau"
         Shortcut        =   ^N
      End
      Begin VB.Menu MnuFichierOuvrir 
         Caption         =   "&Ouvrir..."
         Shortcut        =   ^O
      End
      Begin VB.Menu MnuFichierFermer 
         Caption         =   "&Fermer"
         Shortcut        =   ^{F4}
      End
      Begin VB.Menu MnuFichierEnregistrer 
         Caption         =   "&Enregistrer"
         Shortcut        =   ^S
      End
      Begin VB.Menu MnuFichierEnregistrerSous 
         Caption         =   "En&registrer sous..."
      End
      Begin VB.Menu MnuFichierTiret1 
         Caption         =   "-"
      End
      Begin VB.Menu MnuFichierConfigurationImprimante 
         Caption         =   "&Configuration de l'imprimante..."
      End
      Begin VB.Menu MnuFichierImprimer 
         Caption         =   "&Imprimer..."
         Shortcut        =   ^P
      End
      Begin VB.Menu MnuFichierTiret11 
         Caption         =   "-"
      End
      Begin VB.Menu MnuFichierConfigurer 
         Caption         =   "Config&urer..."
      End
      Begin VB.Menu MnuFichierTiret2 
         Caption         =   "-"
      End
      Begin VB.Menu MnuDerniersFichiers 
         Caption         =   " "
         Index           =   0
         Visible         =   0   'False
      End
      Begin VB.Menu MnuFichierTiret3 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu MnuFichierQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu MnuEdition 
      Caption         =   "&Edition"
      Begin VB.Menu MnuEditionAnnuler 
         Caption         =   "&Annuler"
         Enabled         =   0   'False
         Shortcut        =   ^Z
      End
      Begin VB.Menu MnuEditionTiret1 
         Caption         =   "-"
      End
      Begin VB.Menu MnuEditionCouper 
         Caption         =   "&Couper"
         Shortcut        =   ^X
      End
      Begin VB.Menu MnuEditionCopier 
         Caption         =   "Co&pier"
         Shortcut        =   ^C
      End
      Begin VB.Menu MnuEditionColler 
         Caption         =   "Co&ller"
         Shortcut        =   ^V
      End
      Begin VB.Menu MnuEditionEffacer 
         Caption         =   "&Effacer"
      End
      Begin VB.Menu MnuEditionTiret2 
         Caption         =   "-"
      End
      Begin VB.Menu MnuEditionContrôlerCohérence 
         Caption         =   "Co&ntrôler la cohérence"
         Shortcut        =   {F5}
      End
      Begin VB.Menu MnuEditionDétail 
         Caption         =   "Po&ur en savoir plus..."
      End
      Begin VB.Menu MnuEditionOptions 
         Caption         =   "&Options..."
      End
   End
   Begin VB.Menu MnuAffichages 
      Caption         =   "&Affichage"
      Begin VB.Menu MnuAffichage 
         Caption         =   "&Paramètres généraux"
         Index           =   0
      End
      Begin VB.Menu MnuAffichage 
         Caption         =   "&Equipe HACCP"
         Index           =   1
      End
      Begin VB.Menu MnuAffichage 
         Caption         =   "&Documentation générale"
         Index           =   2
      End
      Begin VB.Menu MnuAffichage 
         Caption         =   "&Etapes et sujets"
         Index           =   3
      End
      Begin VB.Menu MnuAffichage 
         Caption         =   "&Dispositions en place"
         Index           =   4
      End
      Begin VB.Menu MnuAffichage 
         Caption         =   "&Identification des dangers"
         Index           =   5
      End
      Begin VB.Menu MnuAffichage 
         Caption         =   "&Arbre HACCP"
         Index           =   6
      End
   End
   Begin VB.Menu MnuFenetres 
      Caption         =   "Fe&nêtre"
      WindowList      =   -1  'True
      Begin VB.Menu MnuFenetreNouvelle 
         Caption         =   "&Nouvelle fenêtre"
      End
      Begin VB.Menu MnuFenetreMosaiqueVerticale 
         Caption         =   "Mosaïque &verticale"
      End
      Begin VB.Menu MnuFenetreMosaiqueHorizontale 
         Caption         =   "Mosaïque &horizontale"
      End
      Begin VB.Menu MnuFenetreReorganiser 
         Caption         =   "&Réorganiser les icônes"
      End
   End
   Begin VB.Menu MnuDocumentations 
      Caption         =   "&Documentation"
      Visible         =   0   'False
      Begin VB.Menu MnuDocHACCP 
         Caption         =   ""
         Index           =   0
      End
      Begin VB.Menu MnuDocTiret 
         Caption         =   "-"
      End
      Begin VB.Menu MnuDocSujet 
         Caption         =   " "
         Index           =   0
         Visible         =   0   'False
      End
   End
   Begin VB.Menu MnuAides 
      Caption         =   "A&ide"
      Begin VB.Menu MnuAideSommaire 
         Caption         =   "&Sommaire"
      End
      Begin VB.Menu MnuAideContextuelle 
         Caption         =   "Aide &contextuelle"
         Shortcut        =   {F1}
      End
      Begin VB.Menu MnuAideRechercher 
         Caption         =   "&Rechercher..."
      End
      Begin VB.Menu MnuAideTiret 
         Caption         =   "-"
      End
      Begin VB.Menu MnuAideAcceuil 
         Caption         =   "&Ecran d'accueil..."
      End
      Begin VB.Menu MnuAideApropos 
         Caption         =   "&A propos de..."
      End
   End
   Begin VB.Menu MnuPopupDocuments 
      Caption         =   "D&ocuments"
      Visible         =   0   'False
      Begin VB.Menu MnuPopupDocument 
         Caption         =   "doc1"
         Index           =   0
      End
      Begin VB.Menu MnuDocumentsTiret 
         Caption         =   "-"
      End
      Begin VB.Menu MnuDocumentsAnnuler 
         Caption         =   "Annuler"
      End
   End
End
Attribute VB_Name = "FormMain"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit


Private Sub btnAide_Click()
    MnuAideContextuelleClick
End Sub

Private Sub btnCohérence_Click()

    MnuEditionContrôlerCohérenceClick
    
End Sub

Private Sub btnDétail_Click()
    MnuEditionDétailClick
End Sub

Private Sub btnEditionColler_Click()
    MnuEditionCollerClick
End Sub

Private Sub btnEditionCopier_Click()
    MnuEditionCopierClick
End Sub

Private Sub btnEditionCouper_Click()
    MnuEditionCouperClick
End Sub

Private Sub btnFenetre_Click(Index As Integer, Value As Integer)

    'l'activation d'une fenêtre déclenche le click du bouton
    'correspondant mais ne doit pas aller plus loin
    If ActionLimitée Or Value = 0 Then
        Exit Sub
    End If
    HourGlass "show"
    
    'montre l'onglet correspondant au bouton
    MnuAffichage_Click Index
    
    TimerTipsTimer bEfface:=True
    
    MetAJourMenus
    HourGlass "Hide"

End Sub




Private Sub btnFichierEnregistrer_Click()
    FormMain.ActiveForm.MnuFichierEnregistrerClick
End Sub


Private Sub btnFichierNouveau_Click()

    MnuFichierNouveauClick
    
End Sub

Private Sub btnFichierOuvrir_Click()

    MnuFichierOuvrirClick

End Sub

Private Sub lblLigneEtat_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


'fenêtre principale de l'application
Private Sub MDIForm_Load()

Dim chaine As String * 100
Dim chaine1 As String * 100
Dim cr As Integer
Dim hMod As Integer
Dim FichierOCX As String
Dim w As String

    On Error Resume Next
    HourGlass "show"
    
    'récupère le répertoire de l'exécutable
    hMod = GetModuleHandle(NOM_MODULE_EXE)
    If hMod <> 0 Then
        cr = GetModuleFilename(hMod, chaine, 100)
        SeparePathFilename Left$(chaine, cr), RepertoireApplication, chaine1
    Else
        'répertoire principal en cas d'exécution depuis VB
        On Error Resume Next
        cr = FileLen("f:\real\haccp\haccp.vbp")
        If cr Then
            RepertoireApplication = "f:\real\haccp"
        Else
            cr = FileLen("c:\real\haccp\haccp.vbp")
            If cr Then
                RepertoireApplication = "c:\real\haccp"
            End If
        End If
        On Error GoTo 0
    End If
    
    'récupère le répertoire de windows
    cr = GetWindowsDirectory(chaine, 100)
    RepertoireWindows = Left$(chaine, cr)

    'charge les menus dans la langue du pays
    Caption = NOM_COURT_APPLICATION & " " & VERSION_APPLICATION
    NomApplication = NOM_COURT_APPLICATION

    'noms de fichiers utilisés par l'application
    FichierConfig = RepertoireApplication + "\" + FICHIER_CONFIG
    FichierTextes = RepertoireApplication + "\" + FICHIER_TEXTES
    If Not ExisteFichier(FichierTextes) Then
        'l'absence du fichier de config arrête l'application
        MsgBox "Il manque le fichier '" & FichierTextes & "'. Contactez votre administrateur ou réinstallez HACCP.", MB_ICONSTOP, "HACCP"
        End
    End If
    'vérifie la présence des fichiers OCX
    #If Win16 Then
        w = "16"
    #Else
        w = "32"
    #End If
    FichierOCX = "vsview" & w & ".ocx"
    If ExisteFichier(RepertoireWindows & "\system\" & FichierOCX) Then
        FichierOCX = "threed" & w & ".ocx"
        If ExisteFichier(RepertoireWindows & "\system\" & FichierOCX) Then
            FichierOCX = "tabctl" & w & ".ocx"
            If ExisteFichier(RepertoireWindows & "\system\" & FichierOCX) Then
                FichierOCX = "comdlg" & w & ".ocx"
                If ExisteFichier(RepertoireWindows & "\system\" & FichierOCX) Then
                    FichierOCX = "dwstg" & w & ".ocx"
                    If ExisteFichier(RepertoireWindows & "\system\" & FichierOCX) Then
                        FichierOCX = "ss" & w & "x25.ocx"
                        If ExisteFichier(RepertoireWindows & "\system\" & FichierOCX) Then
                            FichierOCX = ""
                        End If
                    End If
                End If
            End If
        End If
    End If
    If FichierOCX <> "" Then
        'l'absence d'un ocx empêche l'application d'être lancée
        ErreurSystemeBox InsereChaine(GetChaineCrLf("M27"), UCase$(FichierOCX)), MB_ICONSTOP, NomApplication
        End
    End If
    On Error GoTo 0
    
    'gestion de la licence de l'application
    'génére la base si elle n'existe pas déjà
    Dim chBase As String
    If Not LicenceLireBase(chBase) Then
        LicenceCacherBase LicenceGénérerBase()
        bLicenceOk = False
    Else
        'vérifie la licence d'utilisation
        bLicenceOk = LicenceOk(GetConfig(SECTION_CONFIG_LICENCE, KEY_CONFIG_NUM_SERIE), LicenceDécoder(GetConfig(SECTION_CONFIG_LICENCE, KEY_CONFIG_CLE)))
    End If
    
    
    'restaure la position de la fenêtre depuis la dernière utilisation de l'application
    #If 0 Then
    Dim ch As String
    ch = "WindowLeft"
    cr = Val(ChargeTexteWinIni(ch))
    If ch <> "" Then
        If cr >= 0 And cr <= Screen.Width Then
            Left = cr
        Else
            Left = 0
        End If
        cr = Val(ChargeTexteWinIni("WindowTop"))
        If cr >= 0 And cr <= Screen.Height Then
            Top = cr
        Else
            Top = 0
        End If
        cr = Val(ChargeTexteWinIni("WindowWidth"))
        If cr >= 0 And cr <= Screen.Width Then
            Width = cr
        Else
            Width = Screen.Width
        End If
        cr = Val(ChargeTexteWinIni("WindowHeight"))
        If cr >= 0 And cr <= Screen.Height Then
            Height = cr
        Else
            Height = Screen.Height
        End If
        If Val(ChargeTexteWinIni("WindowState")) = ICONIZED Then
            WindowState = NORMAL
        Else
            WindowState = Val(ChargeTexteWinIni("WindowState"))
        End If
    Else
        WindowState = MAXIMIZED
    End If
    #End If
    WindowState = MAXIMIZED
    
    'initialisations au chargement
    Initialisations

    'redessine les menus
    MetAJourMenus

    'apparition de la fenêtre principale
    FormMain.Show

    'charge les fenêtres filles
    Load formAccueil
    If bAfficherAcceuil And Trim$(Command$) = "" Then
        'affiche la fenetre acceuil pour choix du module
        formAccueil.Show
    Else
        'premier module choisi, provoque btnOk_Click de la fenêtre d'accueil
        Unload formAccueil
    End If

    'ouverture du fichier précisé dans la ligne de commande de lancement
    If Trim$(Command$) <> "" Then
        DechargerFenetreAccueil
        If OuvrirProjet(Trim$(Command$)) Then
            MRUListe.PutFirst Trim$(UCase$(Command$))
            AnnulerAnnulation
        End If
    End If

    HourGlass "hide"

End Sub

Private Sub MDIForm_Resize()

    If WindowState <> ICONIZED Then
        'retailles quelques éléments graphiques avec la fenêtre
        lblLigneEtat.Width = ScaleWidth - lblLigneEtat.Left
        LineSep(0).X2 = ScaleWidth - LineSep(0).X1
        LineSep(1).X2 = LineSep(0).X2
    End If

End Sub

'fin du programme
Private Sub MDIForm_Unload(Cancel As Integer)

Dim cr As Integer
Dim i As Integer

    HourGlass "show"
        
    'flag global indiquant une fin imminente
    bQuitterApplicationEnCours = True
    
    'décharge les feuilles Filles explicitement pour
    'que ça se fasse pendant que le sablier est affiché
    For i = Forms.Count - 1 To 0 Step -1
        Unload Forms(i)
    Next

    'mémorise la situation de la fenêtre de l'application
    #If 0 Then
    cr = WriteProfileString(NomApplication, "WindowState", Format$(WindowState))
    cr = WriteProfileString(NomApplication, "WindowHeight", Format$(Height))
    cr = WriteProfileString(NomApplication, "WindowWidth", Format$(Width))
    cr = WriteProfileString(NomApplication, "WindowLeft", Format$(Left))
    cr = WriteProfileString(NomApplication, "WindowTop", Format$(Top))
    #End If
    
    Set MRUListe = Nothing

    HourGlass "hide"
    
End Sub

Private Sub MnuAffichage_Click(Index As Integer)
    FormMain.ActiveForm.MnuFichierAffichageClick Index
End Sub

Private Sub MnuAideAcceuil_Click()
    HourGlass "show"
    formAccueil.Show
    MetAJourMenus
End Sub

Private Sub MnuAideApropos_Click()

    HourGlass "Show"
    formAboutBox.Show MODAL

End Sub

Private Sub MnuAideContextuelle_Click()
    MnuAideContextuelleClick
End Sub

Private Sub MnuAideRechercher_Click()
    WinHelpVB FormMain.CMDialog1, FichierAideProgramme, HELP_PARTIALKEY, 0
End Sub

Private Sub MnuAideSommaire_Click()
    WinHelpVB FormMain.CMDialog1, FichierAideProgramme, HELP_INDEX, 1
End Sub

Private Sub MnuDocHACCP_Click(Index As Integer)
    MnuDocHACCPClick Index, MnuDocHACCP(Index).Tag
End Sub

Private Sub MnuDocSujet_Click(Index As Integer)
    MnuDocSujetClick Index
End Sub

Private Sub MnuEditionAnnuler_Click()
    
    
    'gestion d'erreur inattendue
    On Error GoTo err_inattendue
    
    ExécuterAnnulation

    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub

Private Sub MnuEditionColler_Click()
    MnuEditionCollerClick
End Sub

Private Sub MnuEditionContrôlerCohérence_Click()

    MnuEditionContrôlerCohérenceClick

End Sub

Private Sub MnuEditionCopier_Click()
    MnuEditionCopierClick
End Sub

Private Sub MnuEditionCouper_Click()
    MnuEditionCouperClick
End Sub


Private Sub MnuEditionDétail_Click()
    MnuEditionDétailClick
End Sub

Private Sub MnuEditionEffacer_Click()
    MnuEditionEffacerClick
End Sub

Private Sub MnuEditionOptions_Click()
    MnuEditionOptionsClick
End Sub

Private Sub MnuFenetreMosaiqueHorizontale_Click()
    MnuFenetreMosaiqueHorizontaleClick
End Sub

Private Sub MnuFenetreMosaiqueVerticale_Click()
    MnuFenetreMosaiqueVerticaleClick
End Sub

Private Sub MnuFenetreNouvelle_Click()

    MnuFenetreNouvelleClick

End Sub

Private Sub MnuFenetreReorganiser_Click()
    MnuFenetreReorganiserClick
End Sub

Private Sub MnuFichierConfigurationImprimante_Click()
    MnuFichierConfigurationImprimanteClick
End Sub

Private Sub MnuFichierConfigurer_Click()

    MnuFichierConfigurerClick
    
End Sub

Private Sub MnuFichierEnregistrer_Click()
   FormMain.ActiveForm.MnuFichierEnregistrerClick
End Sub

Private Sub MnuFichierEnregistrerSous_Click()
    FormMain.ActiveForm.MnuFichierEnregistrerSousClick
End Sub


Private Sub MnuFichierFermer_Click()

    MnuFichierFermerClick

End Sub

Private Sub MnuFichierImprimer_Click()
    MnuFichierImprimerClick
End Sub

Private Sub MnuFichierNouveau_Click()

    MnuFichierNouveauClick

End Sub

Private Sub MnuFichierOuvrir_Click()

    MnuFichierOuvrirClick

End Sub

Private Sub MnuDerniersFichiers_Click(Index As Integer)

    MnuFichierProjetClick Index

End Sub

'fin du programme
Private Sub MnuFichierQuitter_Click()
    
    bQuitterApplicationEnCours = True
    Unload Me

End Sub

'pour ouvrir un document associé depuis la liste popup de documents
Private Sub MnuPopupDocument_Click(Index As Integer)

    'changement de l'index détecté dans la fonction AFficherMenuDocuments
    IndexMenuPopupDocument = Index
    
End Sub


Private Sub picToolbar_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


'effectue certaines actions hors de toute procédure-événement
Private Sub TimerAction_Timer()

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    'l'action n'est effectuée qu'une seule fois
    TimerAction.Enabled = 0

    'code de l'action dans le tag du timer
    Select Case TimerAction.Tag
        Case "MetAJourMenus"
            'met à jour les menus (notamment après fermeture de la dernière fenêtre projet)
            MetAJourMenus
        Case "OuvreDocument"
            'ouvre un document dans son application et l'application lancée garde le focus
            'c'est nécessaire pour palier un bug de Spread VBX qui reprenait le focus
            Dim cr As Integer
            cr = FileShellExecute(FormMain.hWnd, FormMain.Tag)
            If cr = 2 Then
                'fichier inexistant
                cr = MsgBox(InsereChaine(GetChaineCrLf("M7"), UCase$(FormMain.Tag)), MB_YESNO Or MB_ICONQUESTION, NomApplication)
                If cr = IDYES Then
                    If Not CréerFichierVide(FormMain.Tag) Then
                        'impossible de créer le fichier
                        ErreurUserBox InsereChaine(GetChaineCrLf("M25"), UCase$(FormMain.Tag)), MB_ICONEXCLAMATION
                    Else
                        'nouvelle tentative
                        FormMain.TimerAction.Enabled = True
                    End If
                End If
            Else
                If cr = 31 Then
                    'pas d'association de fichier
                    ErreurUserBox InsereChaine(GetChaineCrLf("M25"), UCase$(FormMain.Tag)), MB_ICONEXCLAMATION
                End If
            End If
    End Select
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub

Private Sub TimerTips_Timer()

    'affichage de la bulle d'aide
    TimerTipsTimer
 
End Sub



