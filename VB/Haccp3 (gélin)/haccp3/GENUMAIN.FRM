VERSION 4.00
Begin VB.Form FormMain 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   4080
   ClientLeft      =   510
   ClientTop       =   1920
   ClientWidth     =   8520
   Height          =   4770
   HelpContextID   =   6
   Icon            =   "GENUMAIN.frx":0000
   Left            =   450
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4080
   ScaleWidth      =   8520
   Top             =   1290
   Width           =   8640
   Begin VB.TextBox txtRépertoireDestination 
      Height          =   285
      Left            =   3000
      TabIndex        =   10
      Top             =   2445
      Width           =   4800
   End
   Begin VB.FileListBox File1 
      Height          =   645
      Left            =   6930
      TabIndex        =   7
      Top             =   2940
      Visible         =   0   'False
      Width           =   915
   End
   Begin VB.OptionButton optDestination 
      BackColor       =   &H00800080&
      Height          =   315
      Index           =   1
      Left            =   750
      TabIndex        =   1
      Top             =   2430
      Width           =   220
   End
   Begin VB.OptionButton optDestination 
      BackColor       =   &H00800080&
      Height          =   255
      Index           =   0
      Left            =   750
      TabIndex        =   0
      Tag             =   "0"
      Top             =   2190
      Width           =   220
   End
   Begin MSComDlg.CommonDialog CmDialog1 
      Left            =   1560
      Top             =   3420
      _version        =   65536
      _extentx        =   847
      _extenty        =   847
      _stockprops     =   0
   End
   Begin Threed.SSCommand btnRepDestination 
      Height          =   315
      Left            =   7905
      TabIndex        =   11
      Top             =   2430
      Width           =   450
      _version        =   65536
      _extentx        =   794
      _extenty        =   556
      _stockprops     =   78
      picture         =   "GENUMAIN.frx":030A
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Répertoire de disque :"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   1080
      TabIndex        =   9
      Top             =   2475
      Width           =   1995
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "A:\"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   1080
      TabIndex        =   8
      Top             =   2205
      Width           =   390
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H0000FFFF&
      Caption         =   $"GENUMAIN.frx":0444
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   13.5
         underline       =   0   'False
         italic          =   -1  'True
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   1500
      Index           =   0
      Left            =   1440
      TabIndex        =   5
      Top             =   210
      Width           =   5925
   End
   Begin Threed.SSCommand btnGénérer 
      Height          =   840
      Left            =   3000
      TabIndex        =   4
      Top             =   3045
      Width           =   2880
      _version        =   65536
      _extentx        =   5080
      _extenty        =   1482
      _stockprops     =   78
      caption         =   "Générer les disquettes d'installation"
      picture         =   "GENUMAIN.frx":04E0
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      Index           =   1
      Visible         =   0   'False
      X1              =   8505
      X2              =   45
      Y1              =   15
      Y2              =   15
   End
   Begin VB.Line Line1 
      Index           =   0
      Visible         =   0   'False
      X1              =   8520
      X2              =   60
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "2) Lancez la génération des disquettes"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   270
      Index           =   3
      Left            =   195
      TabIndex        =   3
      Top             =   2790
      Width           =   3570
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "1) Choisissez la destination des fichiers d'installation"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   210
      TabIndex        =   2
      Top             =   1890
      Width           =   5715
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H0000FFFF&
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   13.5
         underline       =   0   'False
         italic          =   -1  'True
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   1590
      Index           =   1
      Left            =   1170
      TabIndex        =   6
      Top             =   165
      Width           =   6255
   End
   Begin VB.Menu MnuClefs 
      Caption         =   "&Fichier"
      Begin VB.Menu MnuQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu MnuPI 
      Caption         =   "&Aide"
      Begin VB.Menu MnuAide 
         Caption         =   "&Sommaire"
      End
      Begin VB.Menu MnuApropos 
         Caption         =   "A &propos de..."
      End
   End
End
Attribute VB_Name = "FormMain"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Option Explicit



Private Sub AjouterSectionDeFichiers(ctlListFile As Control, ByVal FichierSetup As String, ByVal Section As String, ByVal Source As String, ByVal NumDisquette As Integer, ByVal NomModule As String)

Dim Fichier As String
Dim i As Integer
Dim Valeur As String
       
    ctlListFile.path = Source
    ctlListFile.Pattern = "*.*"
    For i = 1 To ctlListFile.ListCount
        Fichier = ctlListFile.List(i - 1)
        Valeur = NumDisquette & ",," & Fichier & "," & Fichier
        Valeur = Valeur & ",$(AppPath)\" & NomModule & ",,,,," & GetFileSize(Source & "\" & Fichier)
        SetFichierIni Section, "File" & i, Valeur, FichierSetup
    Next

End Sub


Function CopyRépertoire(ctlListFile As Control, ByVal Source As String, ByVal Destination As String, ByVal VerrouillerProjetsHACCP As Integer) As Integer

Dim NumFile As Integer
Dim Fichier As String
Dim i As Integer
       
    ctlListFile.path = Source
    ctlListFile.Pattern = "*.*"
    ctlListFile.Refresh
    For i = 1 To ctlListFile.ListCount
        Fichier = ctlListFile.List(i - 1)
        DoEvents
        If ProgressionAnnulée Then
            CopyRépertoire = False
            Exit Function
        End If
        If Not DuplicateFile(Source, Destination, Fichier, Fichier) Then
            ErreurSystemeBox "Impossible de transférer le fichier " & Fichier & " sur " & Destination & ". Génération des disquettes interrompue.", MB_ICONSTOP, NomApplication
            CopyRépertoire = False
            Exit Function
        End If
        UpdateStatus GetFileSize(Source & "\" & Fichier)
    Next
    CopyRépertoire = True

End Function



Sub MetAJourMenus()
    refreshboutons
End Sub






Private Sub btnGénérer_Click()

Dim FichierListe As String
Dim Destination As String
Dim FichierSetup As String
Dim cr As Integer
Dim NumDisquetteModule As Integer

    'liste des fichiers à copier dans le répertoire destination
    FichierListe = RepertoireApplication & "\" & FICHIER_LST
    'répertoire destination
    If optDestination(0).Tag = "0" Then
        'disquettes
        Destination = "A:\"
    Else
        'répertoire de disque dur
        Destination = Trim$(txtRépertoireDestination.Text)
        If Not IsValidPath(Destination, "c:") Then
            ErreurUserBox "Répertoire de destination incorrect.", MB_ICONEXCLAMATION
            txtRépertoireDestination.SetFocus
            Exit Sub
        End If
        Destination = Trim$(txtRépertoireDestination.Text)
        If Not ExisteRépertoire(Destination) Then
            'crée le répertoire destination s'il n'existe pas
            If IDNO = MsgBox("Le répertoire destination " & UCase$(Destination) & " n'existe pas. Voulez-vous le créer ?", MB_YESNO, NomApplication) Then
                Exit Sub
            End If
            If Not CreatePath(Destination) Then
                ErreurUserBox "Le répertoire de destination " & UCase$(Destination) & " ne peut pas être créé.", MB_ICONEXCLAMATION
                Exit Sub
            End If
        End If
    End If

    'création de setup.lst à partir du modèle disquette/répertoire
    NumDisquetteModule = 1
    If optDestination(0).Tag = "0" Then
        cr = DuplicateFile(RepertoireApplication, RepertoireMaster, "genuset2.lst", "setup.lst")
    Else
        cr = DuplicateFile(RepertoireApplication, RepertoireMaster, "genuset1.lst", "setup.lst")
    End If
    If Not cr Then
        ErreurSystemeBox "Impossible de copier le modèle de fichier setup.lst", MB_ICONSTOP, NomApplication
        Exit Sub
    End If
    
    'fichier setup.lst
    FichierSetup = RepertoireMaster & "\setup.lst"
    
    'montre boite de dialogue en initialisant la taille totale des fichiers=
    'taille des fichiers de la liste de distribution + taille du programme setup1.ex_
    'du master d'installation de module HACCP
    ProgressionAnnulée = False
    ShowStatusDialog "Transfert en cours...", GetTailleFichiersListe(FichierListe, RepertoireApplication) + GetFileSize(RepertoireApplication & "\masters\instmod\setup1.ex_")
    
    'copie des fichiers d'installation de HACCP sur les disquettes ou dans le répertoire
    If CopyListe(FichierListe, RepertoireApplication, Destination, optDestination(0).Tag <> "1") Then
        'copie des fichiers du module
        'cas de la disquette: test de la place restante
        'While GetDiskSpaceFree(UCase$(SuppLastChar(Destination, 1))) < TailleModule
        '    cr = MsgBox("La place sur la disquette 2 est insuffisante pour y copier le module. Insérez une nouvelle disquette vierge et formatée.", MB_ICONEXCLAMATION Or MB_OKCANCEL, NomApplication)
        '    If cr = IDCANCEL Then
        '        GoTo fin_générer
        '    End If
        '    NumDisquetteModule = NumDisquetteModule + 1
        'Wend
        'ajout de la liste des fichiers de \masters\instmod
        'AjouterSectionDeFichiers File1, FichierSetup, "Files", RepertoireApplication & "\masters\instmod", NumDisquetteModule, NomModule
        'et transfert dans le répertoire de destination
        'copie des fichiers du module dans la destination
        
        'transfert de setup.lst dans le répertoire de destination
        If optDestination(0).Tag <> "1" Then
            'cas de disquettes: setup.lst dans la première disquette
            If MsgBox("Ré-insérez la disquette 1", MB_ICONINFORMATION Or MB_OKCANCEL, NomApplication) = IDCANCEL Then
                GoTo fin_générer
            End If
        End If
        cr = DuplicateFile(Trim$(RepertoireMaster), Destination, "setup.lst", "setup.lst")
        If Not cr Then
            GoTo fin_générer
        End If
        MsgBox "Génération terminée.", MB_ICONINFORMATION, NomApplication
    End If
    
    
fin_générer:
    Unload StatusDlg

End Sub

Private Sub btnRepDestination_Click()

Dim Repert As String

    Repert = ChoixRepertoireExistant("Choisissez le répertoire de destination des fichiers d'installation", "Choisissez un répertoire", (txtRépertoireDestination.Text))
    If Repert <> "" Then
        txtRépertoireDestination.Text = Repert
        txtRépertoireDestination.SelStart = 0
        txtRépertoireDestination.SelLength = Len(txtRépertoireDestination.Text)
    End If

End Sub



Private Sub Form_Load()

Dim chaine As String * 100
Dim chaine1 As String * 100
Dim cr As Integer
Dim hMod As Integer

    'dégradé du fond
    Const INSIDE_SOLID = 6
    Const COPY_PEN = 13
    Const PIXELS = 3
    DrawStyle = INSIDE_SOLID
    DrawMode = COPY_PEN
    DrawWidth = 2 'Required for dithering
    ScaleMode = PIXELS
    ScaleHeight = 256
    Dim i As Integer
    For i = 0 To 255
        Line (0, i)-(Me.Width, i + 1), RGB(255 - i, 0, 255 - i), B
    Next i
    'fin de dégradé du fond

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
        cr = FileLen("f:\real\haccp\genbase.vbp")
        If cr Then
            RepertoireApplication = "f:\real\haccp"
        Else
            cr = FileLen("c:\real\haccp\genbase.vbp")
            If cr Then
                RepertoireApplication = "c:\real\haccp"
            End If
        End If
        On Error GoTo 0
    End If
    
    'récupère le répertoire de windows
    cr = GetWindowsDirectory(chaine, 100)
    RepertoireWindows = Left$(chaine, cr)

    'adapte les titres
    Caption = NOM_COURT_APPLICATION & " " & VERSION_APPLICATION
    NomApplication = NOM_COURT_APPLICATION

    On Error GoTo 0
    
    'initialisations au chargement
    FichierConfig = RepertoireApplication & "\" & FICHIER_CONFIG
    optDestination(Val(GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_DESTINATION))).Value = 1
    txtRépertoireDestination.Text = GetConfig(SECTION_CONFIG_PARAMETRES, KEY_CONFIG_REPERTOIRE_DESTINATION)
    App.HelpFile = RepertoireApplication & "\genmul.hlp"
    
    'répertoire de génération du master
    RepertoireMaster = RepertoireApplication & "\masters\instmod"
    If Not ExisteRépertoire(RepertoireMaster) Then
        ErreurUserBox "Le répertoire master " & UCase$(RepertoireMaster) & " n'existe pas: vous ne pouvez pas générer de disquette d'installation d'un module tant que ce répertoire n'existe pas.", MB_ICONEXCLAMATION
        End
    End If
    
    
    'redessine les menus
    MetAJourMenus

    'apparition de la fenêtre principale
    FormMain.Show

    HourGlass "hide"
    
    
End Sub






Private Sub Form_Unload(Cancel As Integer)

Dim cr As Integer
Dim i As Integer

    HourGlass "show"
        
    'mémorise les choix effectuer
    SetConfig SECTION_CONFIG_PARAMETRES, KEY_CONFIG_DESTINATION, optDestination(0).Tag
    SetConfig SECTION_CONFIG_PARAMETRES, KEY_CONFIG_REPERTOIRE_DESTINATION, txtRépertoireDestination.Text
    
    HourGlass "hide"

End Sub



Private Sub Label4_Click(Index As Integer)
    optDestination(Index).Value = 1
End Sub


Private Sub MnuAide_Click()
    WinHelpVB FormMain.CMDialog1, RepertoireApplication & "\genmul.hlp", HELP_INDEX, 1
End Sub

Private Sub MnuApropos_Click()
    formAboutBox.Show MODAL
End Sub




Private Sub MnuQuitter_Click()
    Unload Me
End Sub



Private Sub refreshboutons()

    btnGénérer.Enabled = optDestination(0).Tag = "0" Or (optDestination(0).Tag = "1" And txtRépertoireDestination.Text <> "")
    txtRépertoireDestination.Enabled = optDestination(0).Tag = "1"
    btnRepDestination.Enabled = txtRépertoireDestination.Enabled
    
End Sub


Private Sub optDestination_Click(Index As Integer)
    optDestination(0).Tag = Index
    refreshboutons
End Sub


Private Sub txtRépertoireDestination_LostFocus()
    txtRépertoireDestination.Text = Trim$(txtRépertoireDestination.Text)
End Sub


Private Sub txtRépertoireModule_Change()
    refreshboutons
End Sub



