VERSION 4.00
Begin VB.MDIForm FormMain 
   Appearance      =   0  'Flat
   BackColor       =   &H8000000C&
   Caption         =   "MDIForm1"
   ClientHeight    =   4350
   ClientLeft      =   60
   ClientTop       =   1695
   ClientWidth     =   9600
   Height          =   5040
   Icon            =   "MODMAIN.frx":0000
   Left            =   0
   LinkTopic       =   "MDIForm1"
   Top             =   1065
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
      TabIndex        =   5
      Top             =   4080
      Width           =   9600
      Begin VB.Label lblLigneEtat 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   60
         TabIndex        =   6
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
      Height          =   465
      Left            =   0
      ScaleHeight     =   465
      ScaleWidth      =   9600
      TabIndex        =   1
      Top             =   0
      Width           =   9600
      Begin VB.Line LineSep 
         BorderColor     =   &H00808080&
         Index           =   0
         X1              =   0
         X2              =   8085
         Y1              =   0
         Y2              =   0
      End
      Begin VB.Line LineSep 
         BorderColor     =   &H00FFFFFF&
         Index           =   1
         X1              =   0
         X2              =   8085
         Y1              =   15
         Y2              =   15
      End
      Begin Threed.SSCommand btnFichierOuvrir 
         Height          =   345
         Left            =   420
         TabIndex        =   4
         Top             =   75
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   78
         outline         =   0   'False
         picture         =   "MODMAIN.frx":000C
      End
      Begin Threed.SSCommand btnFichierNouveau 
         Height          =   345
         Left            =   75
         TabIndex        =   3
         Top             =   75
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   78
         outline         =   0   'False
         picture         =   "MODMAIN.frx":0146
      End
      Begin Threed.SSCommand btnFichierEnregistrer 
         Height          =   345
         Left            =   765
         TabIndex        =   2
         Top             =   75
         Visible         =   0   'False
         Width           =   345
         _version        =   65536
         _extentx        =   609
         _extenty        =   609
         _stockprops     =   78
         outline         =   0   'False
         picture         =   "MODMAIN.frx":0264
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
      Top             =   465
      Visible         =   0   'False
      Width           =   9600
      Begin VB.Timer TimerAction 
         Enabled         =   0   'False
         Interval        =   1
         Left            =   2160
         Top             =   180
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
   Begin VB.Menu MnuAffichages 
      Caption         =   "&Affichage"
      Begin VB.Menu MnuAffichage 
         Caption         =   "&Général"
         Index           =   0
      End
      Begin VB.Menu MnuAffichage 
         Caption         =   "&Textes"
         Index           =   1
      End
      Begin VB.Menu MnuAffichage 
         Caption         =   "&Suggestions"
         Index           =   2
      End
      Begin VB.Menu MnuAffichage 
         Caption         =   "&Natures et spécificités"
         Index           =   3
      End
      Begin VB.Menu MnuAffichage 
         Caption         =   "&Pertinences Dangers"
         Index           =   4
      End
      Begin VB.Menu MnuAffichage 
         Caption         =   "&Criticité Dangers"
         Index           =   5
      End
   End
   Begin VB.Menu MnuFenetres 
      Caption         =   "Fe&nêtre"
      WindowList      =   -1  'True
      Begin VB.Menu MnuFenetreReorganiser 
         Caption         =   "&Réorganiser"
      End
   End
   Begin VB.Menu MnuAides 
      Caption         =   "&Aide"
      Begin VB.Menu MnuAideSommaire 
         Caption         =   "&Sommaire"
      End
      Begin VB.Menu MnuAideContextuelle 
         Caption         =   "&Aide constextuelle"
         Shortcut        =   {F1}
      End
      Begin VB.Menu MnuAideRechercher 
         Caption         =   "&Rechercher..."
      End
      Begin VB.Menu MnuAideTiret 
         Caption         =   "-"
      End
      Begin VB.Menu MnuAideApropos 
         Caption         =   "&A propos de..."
      End
   End
End
Attribute VB_Name = "FormMain"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit










Private Sub MnuFichierConfigurationImprimante_Click()
    MnuFichierConfigurationImprimanteClick
End Sub


Private Sub TimerAction_Timer()

    'code de l'action dans le tag du timer
    Select Case TimerAction.Tag
        Case "MetAJourMenus"
            MetAJourMenus
    End Select
    
    'l'action n'est effectuée qu'une seule fois
    TimerAction.Enabled = 0
    
End Sub

'enregistrement du module courant à partir du menu Fichier/Enregistrer
Private Sub btnFichierEnregistrer_Click()

Dim cr As Integer

    cr = FormMain.ActiveForm.MnuFichierEnregistrerClick()

End Sub

'nouveau module à partir du menu Fichier/Nouveau
Private Sub btnFichierNouveau_Click()
    MnuFichierNouveauClick
End Sub

'ouverture d'un module existant
Private Sub btnFichierOuvrir_Click()
    MnuFichierOuvrirClick
End Sub

'initialisations de l'application
Private Sub MDIForm_Load()

Dim chaine As String * 100
Dim chaine1 As String * 100
Dim cr As Integer
Dim l As Long
Dim hMod As Integer

    HourGlass "show"

    'récupère le répertoire de l'exécutable
    hMod = GetModuleHandle(NOM_MODULE_EXE)
    If hMod <> 0 Then
        cr = GetModuleFilename(hMod, chaine, 100)
        SeparePathFilename Left$(chaine, cr), RepertoireApplication, chaine1
    Else
        'répertoire principal en cas d'exécution depuis VB
        On Error Resume Next
        cr = FileLen("c:\real\haccp\haccp.vbp") <> 0
        If cr Then
            RepertoireApplication = "c:\real\haccp\haccp.vbp"
        Else
            cr = FileLen("f:\real\haccp\haccp.vbp")
            If cr Then
                RepertoireApplication = "f:\real\haccp"
            End If
        End If
        On Error GoTo 0
    End If
    
    'récupère le répertoire de windows
    cr = GetWindowsDirectory(chaine, 100)
    RepertoireWindows = Left$(chaine, cr)

    'noms de fichiers
    FichierConfig = RepertoireApplication + "\" + FICHIER_CONFIG
    
    'charge les menus dans la langue du pays
    Caption = NOM_COURT_APPLICATION & " " & VERSION_APPLICATION
    NomApplication = NOM_COURT_APPLICATION

    'restaure la position de la fenêtre depuis la dernière utilisation de l'application
    Dim ch As String
    ch = "WindowLeft"
    l = Val(ChargeTexteWinIni(ch))
    If ch <> "" Then
        Left = l
        Top = Val(ChargeTexteWinIni("WindowTop"))
        Width = Val(ChargeTexteWinIni("WindowWidth"))
        Height = Val(ChargeTexteWinIni("WindowHeight"))
        If Val(ChargeTexteWinIni("WindowState")) = ICONIZED Then
            WindowState = NORMAL
        Else
            WindowState = Val(ChargeTexteWinIni("WindowState"))
        End If
    Else
        WindowState = MAXIMIZED
    End If
    
    'initialisations au chargement
    Initialisations

    'redessine les menus
    MetAJourMenus

    'apparition de la fenêtre principale
    FormMain.Show

    HourGlass "hide"

End Sub

Private Sub MDIForm_Resize()

    If WindowState <> ICONIZED Then
        'retaillage de la ligne d'état
        lblLigneEtat.Width = ScaleWidth - lblLigneEtat.Left
        'et de la ligne relief sous les menus
        LineSep(0).X2 = ScaleWidth - LineSep(0).X1
        LineSep(1).X2 = LineSep(0).X2
    End If
    
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)

Dim cr As Integer

    'mémorise la situation de la fenêtre de l'application
    cr = WriteProfileString(NomApplication, "WindowState", Format$(WindowState))
    cr = WriteProfileString(NomApplication, "WindowHeight", Format$(Height))
    cr = WriteProfileString(NomApplication, "WindowWidth", Format$(Width))
    cr = WriteProfileString(NomApplication, "WindowLeft", Format$(Left))
    cr = WriteProfileString(NomApplication, "WindowTop", Format$(Top))
    

End Sub

'changement d'onglet
Private Sub MnuAffichage_Click(Index As Integer)
    FormMain.ActiveForm.MnuFichierAffichageClick Index
End Sub

Private Sub MnuAideApropos_Click()
    HourGlass "Show"
    formAboutBox.Show MODAL
End Sub

Private Sub MnuAideContextuelle_Click()
    MnuAideContextuelleClick
End Sub

Private Sub MnuAideRechercher_Click()
    WinHelpVB FormMain.CMDialog1, FichierAideProgramme, HELP_PARTIALKEY, 1
End Sub

Private Sub MnuAideSommaire_Click()
    WinHelpVB FormMain.CMDialog1, FichierAideProgramme, HELP_INDEX, 1
End Sub

Private Sub MnuDerniersFichiers_Click(Index As Integer)
    MnuFichierModuleClick Index
End Sub

Private Sub MnuFenetreReorganiser_Click()
    MnuFenetreReorganiserClick
End Sub

'enregistrement depuis le menu fichier/enregistrer
Private Sub MnuFichierEnregistrer_Click()
Dim cr As Integer
    cr = FormMain.ActiveForm.MnuFichierEnregistrerClick()
End Sub

'enregistrement depuis le menu fichier/enregistrer Sous
Private Sub MnuFichierEnregistrerSous_Click()
Dim cr As Integer
    cr = FormMain.ActiveForm.MnuFichierEnregistrerSousClick("Choisissez le répertoire ou enregistrer le module.")
End Sub

'fermeture du module courant
Private Sub MnuFichierFermer_Click()
    FormMain.ActiveForm.MnuFichierFermerClick
    MetAJourMenus
End Sub

'affichage de la fenêtre d'impression
Private Sub MnuFichierImprimer_Click()
    MnuFichierImprimerClick
End Sub

'nouveau module
Private Sub MnuFichierNouveau_Click()

    MnuFichierNouveauClick

End Sub

'ouverture d'un module
Private Sub MnuFichierOuvrir_Click()

    MnuFichierOuvrirClick

End Sub

'sortie du programme
Private Sub MnuFichierQuitter_Click()

    Unload Me

End Sub

