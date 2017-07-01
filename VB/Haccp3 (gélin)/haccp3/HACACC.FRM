VERSION 4.00
Begin VB.Form formAccueil 
   Appearance      =   0  'Flat
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Accueil"
   ClientHeight    =   5130
   ClientLeft      =   1005
   ClientTop       =   1410
   ClientWidth     =   7695
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
   Height          =   5535
   KeyPreview      =   -1  'True
   Left            =   945
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   342
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   513
   Top             =   1065
   Visible         =   0   'False
   Width           =   7815
   Begin VB.CommandButton btnNumSérie 
      Caption         =   "Passer en mode EXPLOITATION..."
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3960
      TabIndex        =   14
      Top             =   2760
      Width           =   3615
   End
   Begin VB.CommandButton btnAide 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Aide"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   4020
      TabIndex        =   13
      Top             =   4620
      Width           =   1755
   End
   Begin VB.CommandButton btnQueFaireAvecHACCP3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Que faire avec HACCP 3 ?"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   4020
      TabIndex        =   12
      Top             =   4200
      Width           =   3570
   End
   Begin Threed.SSPanel Panel3D1 
      Height          =   945
      Left            =   4005
      TabIndex        =   5
      Top             =   45
      Width           =   3570
      _version        =   65536
      _extentx        =   6297
      _extenty        =   1667
      _stockprops     =   15
      caption         =   "HACCP 3"
      BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   24
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      bevelinner      =   1
      font3d          =   2
   End
   Begin VB.FileListBox File1 
      Appearance      =   0  'Flat
      Height          =   420
      Left            =   2175
      TabIndex        =   4
      Top             =   3630
      Visible         =   0   'False
      Width           =   1005
   End
   Begin VB.DirListBox Dir1 
      Appearance      =   0  'Flat
      Height          =   705
      Left            =   735
      TabIndex        =   3
      Top             =   3645
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton btnOk 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Ok"
      Default         =   -1  'True
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   5820
      TabIndex        =   2
      Top             =   4620
      Width           =   1755
   End
   Begin VB.ComboBox lstModules 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3990
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   3705
      Width           =   3585
   End
   Begin VB.Label lblNumInstallation 
      Appearance      =   0  'Flat
      Caption         =   "N° d'installation :"
      BeginProperty Font 
         name            =   "Arial"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   4020
      TabIndex        =   15
      Top             =   2280
      Width           =   3555
   End
   Begin VB.Label lblUtilisateur 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BeginProperty Font 
         name            =   "Arial"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   525
      Left            =   4020
      TabIndex        =   11
      Top             =   2970
      Width           =   3525
   End
   Begin VB.Label Label6 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Licence d'utilisation accordée à:"
      BeginProperty Font 
         name            =   "Arial"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   4005
      TabIndex        =   10
      Top             =   2745
      Width           =   3555
   End
   Begin VB.Label lblNumSérie 
      Appearance      =   0  'Flat
      Caption         =   "N° de série:"
      BeginProperty Font 
         name            =   "Arial"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   4005
      TabIndex        =   9
      Top             =   2520
      Width           =   3555
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Caption         =   "(c) 1993-1995 Ercem, CITPPM"
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   4005
      TabIndex        =   8
      Top             =   1965
      Width           =   3540
   End
   Begin VB.Label lblVersion 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Caption         =   "version"
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   4005
      TabIndex        =   7
      Top             =   1695
      Width           =   3540
   End
   Begin VB.Label lblTitre 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      Caption         =   "Logiciel interactif d'aide à la méthode HACCP"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   540
      Left            =   4005
      TabIndex        =   6
      Top             =   1095
      Width           =   3570
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      Caption         =   "Module:"
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   4005
      TabIndex        =   0
      Top             =   3510
      Width           =   735
   End
   Begin VB.Image LogoModule 
      Appearance      =   0  'Flat
      Height          =   4980
      Left            =   60
      Stretch         =   -1  'True
      Top             =   60
      Width           =   3825
   End
End
Attribute VB_Name = "formAccueil"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub btnAide_Click()
    MnuAideContextuelleClick
End Sub


Private Sub btnAide_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour obtenir de l'aide ou appuyez sur F1"
End Sub


'passage en mode exploitation
Private Sub btnNumSérie_Click()
    'saisie de la clé d'activation
    formSaisieLicence.Show MODAL
    If bLicenceOk Then
        'clé d'activation valide
        lblUtilisateur.Caption = GetConfig(SECTION_CONFIG_LICENCE, KEY_CONFIG_UTILISATEUR)
        lblNumSérie.Caption = "N° de série : " & GetConfig(SECTION_CONFIG_LICENCE, KEY_CONFIG_NUM_SERIE)
        btnNumSérie.Visible = False
    End If
End Sub

Private Sub btnNumSérie_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici si vous posséder la clé d'activation du logiciel"
End Sub


Private Sub btnOk_Click()

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    If Module Is Nothing Then
        'le module n'est pas encore choisi
        HourGlass "show"
        'charge le module choisi en mémoire
        Set Module = New Module
        Module.Load RepertoireApplication & "\" & Trim$(GetItemDansChaineSep(lstModules.List(lstModules.ListIndex), 2, ":")), Trim$(GetItemDansChaineSep(lstModules.List(lstModules.ListIndex), 2, ":"))
        'mémorise le dernier module choisi pour le présenter au prochain lancement
        SetConfig SECTION_CONFIG_PARAMETRES, KEY_CONFIG_LASTMODULE, lstModules.List(lstModules.ListIndex)
        'définit le fichier d'aide spécifique au module
        ChangeHelpFileModule
        'adapte les menus au module
        ChangeMenuDocumentationModule
        ChangeMenuAffichage
        MetAJourMenus
        HourGlass "hide"
        
    End If
    
    'la feuille est déchargée dans FormMain_Load si elle ne doit pas apparaitre
    If bAfficherAcceuil Then
        Unload Me
    End If
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub btnOk_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Module Is Nothing Then
        LigneEtat "Cliquez ici pour valider le choix du module"
    Else
        LigneEtat "Cliquez ici pour fermer la fenêtre d'accueil"
    End If
End Sub


'affiche l'aide spécifique au module
Private Sub btnQueFaireAvecHACCP3_Click()

Dim cr As Integer
Dim NomModule As String
Dim RepertoireModule As String
Dim FichierAideBouton As String

    NomModule = Trim$(GetItemDansChaineSep(lstModules.List(lstModules.ListIndex), 2, ":"))
    RepertoireModule = RepertoireApplication & "\" & NomModule
    If ExisteFichier(RepertoireModule & "\" & FICHIER_HLP_HACPP) Then
        FichierAideBouton = RepertoireModule & "\" & FICHIER_HLP_HACPP
    Else
        FichierAideBouton = RepertoireApplication & "\" & FICHIER_HLP_HACPP
    End If
    WinHelpVB FormMain.CMDialog1, FichierAideBouton, HELP_CONTEXT, 1
                                                                    
End Sub

'initialise les variables de fichiers d'aide
Private Sub ChangeHelpFileModule()

    'fichier d'aide du programme
    If ExisteFichier(Module.Répertoire & "\" & FICHIER_HLP_HACPPPGM) Then
        FichierAideProgramme = Module.Répertoire & "\" & FICHIER_HLP_HACPPPGM
    End If
    'fichier d'aide sur méthode HACCP
    If ExisteFichier(Module.Répertoire & "\" & FICHIER_HLP_HACPP) Then
        FichierAideHACCP = Module.Répertoire & "\" & FICHIER_HLP_HACPP
    Else
        FichierAideHACCP = RepertoireApplication & "\" & FICHIER_HLP_HACPP
    End If
    
    'pour que l'appui sur F1 fonctionne
    App.HelpFile = FichierAideProgramme

End Sub

'affiche le logo du module s'il existe ou celui de remplacement
Private Sub ChangeLogoModule()

Dim NomModule As String
Dim FichierINIModule As String
Dim ModuleTemp As New Module

    NomModule = Trim$(GetItemDansChaineSep(lstModules.List(lstModules.ListIndex), 2, ":"))
    FichierINIModule = RepertoireApplication & "\" & NomModule & "\" & FICHIER_MODULE_INI

    'logo de la fenêtre acceuil
    On Error Resume Next
    LogoModule.Picture = LoadPicture(RepertoireApplication & "\" & NomModule & "\" & ModuleTemp.LoadLogo(RepertoireApplication & "\" & NomModule & "\" & FICHIER_MODULE_INI))
    If Err Then
        If Err = 53 Then
            'fichier inexistant
            LogoModule.Picture = LoadPicture(RepertoireApplication & "\" & FICHIER_LOGO_DEFAULT)
            Resume fin_changelogomodule
        Else
            ErreurSystemeBox Error$, MB_ICONEXCLAMATION, "ChangeLogoModule"
        End If
    End If
fin_changelogomodule:

End Sub

'construit le menu Documentation
Private Sub ChangeMenuDocumentationModule()

Dim n As Integer
Dim i As Integer
Dim chTitre As String

    'partie haute du menu documentation
    n = Val(GetFichierIni("Menu Documentation Haut", "NbSujets", Module.FichierModule))
    For i = 0 To n - 1
        chTitre = GetFichierIni("Menu Documentation Haut", "Sujet" & i + 1, Module.FichierModule)
        If chTitre <> "" Then
            If i > 0 Then
                Load FormMain.MnuDocHACCP(i)
            End If
            FormMain.MnuDocHACCP(i).Caption = chTitre
            FormMain.MnuDocHACCP(i).Visible = True
            FormMain.MnuDocHACCP(i).Tag = Val(GetFichierIni("Menu Documentation Haut", "topic" & i + 1, Module.FichierModule))
        End If
    Next
    
    'partie basse du menu documentation
    'pas de lignes de menu si le fichier d'aide pour la partie basse
    'n'existe pas
    FichierAideModule = Module.Répertoire & "\" & Module.FichierAide
    If ExisteFichier(FichierAideModule) Then
        'nombre de sujets de documentation
        n = Module.DocSujetCount
        For i = 0 To n - 1
            'remplit le menu documentation
            If i > 0 Then
                Load FormMain.MnuDocSujet(i)
            End If
            FormMain.MnuDocSujet(i).Visible = True
            FormMain.MnuDocSujet(i).Caption = "&" & (i + 1) & " " & Module.DocSujetTitre(i + 1)
        Next
    End If
    'cache le tiret de séparation inutile dans le menu Documentation
    If Not FormMain.MnuDocHACCP(0).Visible And Not FormMain.MnuDocSujet(0).Visible Then
        FormMain.MnuDocumentations.Visible = False
    Else
        FormMain.MnuDocTiret.Visible = FormMain.MnuDocHACCP(0).Visible And FormMain.MnuDocSujet(0).Visible
        FormMain.MnuDocumentations.Visible = True
    End If
    
End Sub


Private Sub btnQueFaireAvecHACCP3_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour obtenir la réponse à cette question"
End Sub

'la fenêtre d'acceuil est déchargée dès qu'elle perd le focus
Private Sub Form_Deactivate()
    Unload Me
End Sub

'la fenêtre d'acceuil est déchargée à l'appui sur escape
Private Sub Form_KeyPress(keyascii As Integer)
    If keyascii = 27 Then
        Unload Me
    End If
End Sub

'fenêtre d'acceuil affichée au lancement du programme
Private Sub Form_Load()

Dim chRepert As String
Dim i As Integer
Dim chBase As String
Dim cr As Integer

    'c'est plus beau
    CenterInMain FormMain, Me
    lblTitre.Caption = GetChaineCrLf("TitreAcceuil")

    'adaptations selon le mode évaluation/exploitation
    cr = LicenceLireBase(chBase)
    lblNumInstallation.Caption = lblNumInstallation.Caption & chBase
    btnNumSérie.Visible = Not bLicenceOk
    If bLicenceOk Then
        lblUtilisateur.Caption = GetConfig(SECTION_CONFIG_LICENCE, KEY_CONFIG_UTILISATEUR)
        lblNumSérie.Caption = lblNumSérie.Caption & " " & GetConfig(SECTION_CONFIG_LICENCE, KEY_CONFIG_NUM_SERIE)
    Else
        lblUtilisateur.Caption = ""
        lblNumSérie.Caption = "Programme en mode EVALUATION"
    End If
    lblVersion.Caption = "Version " & VERSION_APPLICATION
    If Module Is Nothing Then
        'le module n'est pas encore choisi
        Dir1.path = RepertoireApplication
        'parcours des sous-répertoires des modules
        For i = 0 To Dir1.ListCount - 1
            chRepert = Dir1.List(i)
            File1.path = chRepert
            'il s'agit d'un sous-répertoire de module si le fichier de
            'description de module est présent
            File1.Pattern = FICHIER_MODULE_INI
            If File1.ListCount = 1 Then
                'ajout à la liste des modules le titre et plus loin donc non visible le nom du module
                'pour le retrouver ensuite
                Dim ModuleTemp As New Module
                lstModules.AddItem ModuleTemp.LoadTitre(chRepert & "\" & FICHIER_MODULE_INI) & Space$(100) & ":" & GetFichierSansChemin(chRepert)
            End If
        Next
        If lstModules.ListCount = 0 Then
            'pas de module
            ErreurUserBox GetChaineCrLf("M20"), MB_ICONSTOP
            End
        Else
            'au moins un module, module par défaut
            Dim p As Integer
            p = PositionDansListe(lstModules, GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_LASTMODULE))
            lstModules.ListIndex = iif2(p <> -1, p, 0)
            If Not bAfficherAcceuil Then
                'passe en icone pour moins voir la fenêtre qui s'affiche obligatoirement car c'est une fenêtre mdichild
                WindowState = 1
                btnOk_Click
            Else
                ChangeLogoModule
            End If
        End If
    Else
        'le module ne peut pas être changé
        lstModules.AddItem Module.Titre & Space$(100) & ":" & Module.Nom
        lstModules.ListIndex = 0
        lstModules.Enabled = False
    End If
    FormMain.MnuAideAcceuil.Enabled = False
    bFenetreAccueilChargee = True
    HourGlass "hide"

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub

Private Sub Form_Unload(Cancel As Integer)
    bFenetreAccueilChargee = False
    FormMain.MnuAideAcceuil.Enabled = True
    If Not bQuitterApplicationEnCours Then
        'valide le module choisi
        btnOk_Click
    End If
End Sub

Private Sub Label1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


Private Sub Label2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


Private Sub Label4_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


Private Sub lblNumInstallation_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Numéro d'installation de votre exemplaire de programme " & NomApplication
End Sub


Private Sub lblNumSérie_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Numéro de série de votre exemplaire du programme " & NomApplication
End Sub


Private Sub lblUtilisateur_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


Private Sub lblVersion_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


Private Sub LogoModule_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


'affichage du logo du module choisi
Private Sub lstModules_Click()

    ChangeLogoModule

End Sub


'adaptation du menu affichage à partir du module choisi
Public Sub ChangeMenuAffichage()

Dim i As Integer

    For i = 0 To Module.AffichagesCount - 1
        FormMain.MnuAffichage(i).Caption = "&" & i + 1 & "  " & Module.AffichageTitre(i + 1)
    Next

End Sub

Private Sub Panel3D1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


