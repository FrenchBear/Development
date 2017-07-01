VERSION 4.00
Begin VB.Form FormMain 
   ClientHeight    =   4395
   ClientLeft      =   1155
   ClientTop       =   1875
   ClientWidth     =   7860
   Height          =   5085
   HelpContextID   =   7
   Icon            =   "CLEMAIN.frx":0000
   KeyPreview      =   -1  'True
   Left            =   1095
   LinkTopic       =   "Form1"
   ScaleHeight     =   4395
   ScaleWidth      =   7860
   Top             =   1245
   Width           =   7980
   Begin FPSpread.vaSpread Spread 
      Height          =   2955
      Left            =   105
      TabIndex        =   0
      Top             =   900
      Width           =   7515
      _version        =   131077
      _extentx        =   13256
      _extenty        =   5212
      _stockprops     =   64
      BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      maxcols         =   5
      maxrows         =   1
      selectblockoptions=   0
      spreaddesigner  =   "CLEMAIN.frx":030A
      unittype        =   2
   End
   Begin MSComDlg.CommonDialog CMDialog1 
      Left            =   1320
      Top             =   240
      _version        =   65536
      _extentx        =   847
      _extenty        =   847
      _stockprops     =   0
   End
   Begin VB.Menu MnuClefs 
      Caption         =   "&Clés"
      Begin VB.Menu MnuClefsNouvelle 
         Caption         =   "&Nouvelle..."
      End
      Begin VB.Menu MnuClefsSupprimer 
         Caption         =   "&Supprimer"
      End
      Begin VB.Menu MnuClefsModifier 
         Caption         =   "&Modifier..."
      End
      Begin VB.Menu MnuTiret1 
         Caption         =   "-"
      End
      Begin VB.Menu MnuCopierTableau 
         Caption         =   "&Copier la liste"
      End
      Begin VB.Menu MnuTiret2 
         Caption         =   "-"
      End
      Begin VB.Menu MnuQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu MnuPI 
      Caption         =   "&Aide"
      Begin VB.Menu MnuAide 
         Caption         =   "&Sommaire"
      End
      Begin VB.Menu MnuTiret3 
         Caption         =   "-"
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


'copie de la liste des clés dans le presse-papiers
Sub MnuCopierTableauClick()

Dim c As Integer
Dim r As Integer
Dim ch As String

    'cumul des clés dans la chaine ch
    ch = ""
    'parcours des lignes du tableau
    For r = 0 To Spread.MaxRows
        Spread.Row = r
        'parcours des colonnes du tableau
        For c = 1 To 5
            Spread.Col = c
            If c > 1 Then
                'séparateur de colonnes
                ch = ch & Chr$(9)
            End If
            'ajoute la donnée
            ch = ch & Spread.Text
        Next
        'séparateur de lignes
        ch = ch & vbCrLf
    Next
    'dans le clipboard
    Clipboard.SetText ch

End Sub

'sauvegarde le contenu du tableau dans le fichier des clés
'entrée:
'   nom du fichier de sauvegarde avec chemin d'accès
Sub SauveSpread(ByVal Fichier As String)

Dim NumFile As Integer
Dim n As Integer
Dim r As Integer
Dim c As Integer
Dim Ligne As String

    NumFile = FreeFile
    'fichier texte
    Open Fichier For Output As NumFile
    'nombre de clés
    Print #NumFile, Spread.MaxRows - 1
    'parcours des clés
    For r = 1 To Spread.MaxRows - 1
        Ligne = ""
        Spread.Row = r
        'parcours des informations des clés
        For c = 1 To 5
            Spread.Col = c
            'séparateur de champs
            Ligne = Ligne & Spread.Text & "|"
        Next
        'une clé par ligne de texte
        Print #NumFile, Ligne
    Next
    Close NumFile

End Sub

Sub MetAJourMenus()
    'rien
End Sub

'modification d'une clé
Sub MnuClefsModifierClick()
    With Spread
        .Row = .ActiveRow
        .Col = 1
        If .Text <> "" Then
            'clé à modifier si colonne 1 non vide
            Load formClef
            formClef.Caption = "Modification de clé"
            'maj des champs de la fenêtre de modification
            .Row = .ActiveRow
            .Col = 2
            formClef.txtUtilisateur.Text = .Text
            .Col = 3
            formClef.txtNumSérie.Text = .Text
            .Col = 4
            formClef.txtNumInstallation.Text = .Text
            .Col = 5
            formClef.lblClef.Caption = .Text
            formClef.RefreshBoutons
            'affiche la fenêtre
            formClef.Show MODAL
            'en sortie
            If formClef.Tag <> "" Then
                'par OK
                .Row = .ActiveRow
                .Col = 2
                .Text = Trim$(formClef.txtUtilisateur.Text)
                .Col = 3
                .Text = Trim$(formClef.txtNumSérie.Text)
                .Col = 4
                .Text = Trim$(formClef.txtNumInstallation.Text)
                .Col = 5
                .Text = Trim$(formClef.lblClef.Caption)
                'enregistrement du tableau à chaque modification de clé
                SauveSpread FichierClefs
            End If
            Unload formClef
        End If
    End With
End Sub

'ajoute une nouvelle clé
Sub MnuClefsNouvelleClick()
    'champs de la fenêtre vides
    Load formClef
    formClef.Caption = "Nouvelle clé"
    'affiche la fenêtre
    formClef.Show MODAL
    'sortie
    If formClef.Tag <> "" Then
        'par OK
        With Spread
            'remplit le tableau
            .Row = .MaxRows
            .Col = 1
            .Text = Format$(Now, "dd/mm/yy")
            .Col = 2
            .Text = Trim$(formClef.txtUtilisateur.Text)
            .Col = 3
            .Text = Trim$(formClef.txtNumSérie.Text)
            .Col = 4
            .Text = Trim$(formClef.txtNumInstallation.Text)
            .Col = 5
            .Text = Trim$(formClef.lblClef.Caption)
            'une ligne de plus vierge
            .MaxRows = .MaxRows + 1
        End With
        'sauvegarde du tableau complet à chaque ajout de clé
        SauveSpread FichierClefs
    End If
    Unload formClef
End Sub

'suppression d'une clé
Sub MnuClefsSupprimerClick()

    With Spread
        .Row = .ActiveRow
        .Col = 1
        If .Text <> "" Then
            'clé à supprimer si ligne non vide
            .Col = 4
            If MsgBox("Voulez-vous supprimer la clé de l'utilisateur '" & .Text & "' ?", MB_YESNO, NomApplication) = IDYES Then
                'après confirmation, ote la ligne du tableau
                SpreadOteLigne Spread
                'une ligne de moins
                .MaxRows = .MaxRows - 1
                'et sauvegarde complète du nouveau tableau à chaque suppression de clé
                SauveSpread FichierClefs
            End If
        End If
    End With
    
    
End Sub

'ote la ligne courante d'un spread (ne diminue pas le spread d'une ligne, la dernière ligne est blanche)
Sub SpreadOteLigne(ctl As Control)

Dim i As Integer
Dim j As Integer
Dim t As String
Dim bt As Long

    HourGlass "show"
    With ctl
        .Col = 1
        For i = .ActiveRow + 1 To .MaxRows
            For j = 1 To .MaxCols
                .Col = j
                .Row = i
                bt = 0
                If .CellType = SS_CELL_TYPE_BUTTON Then
                    bt = .TypeButtonPicture '.TypeButtonText
                End If
                t = .Text
                .Row = i - 1
                .Text = t
                If .CellType = SS_CELL_TYPE_BUTTON Then
                    If bt Then
                        '.TypeButtonPicture = ctlPictureFleche.Picture
                    Else
                        .TypeButtonPicture = LoadPicture("")
                    End If
                End If
            Next
        Next
        .Row = .MaxRows
        For j = 1 To .MaxCols
            .Col = j
            .Text = ""
        Next
    End With
    HourGlass "hide"


End Sub




'remplit le tableau avec le contenu d'un fichier de clés
'entrée:
'   nom du fichier de clés
Sub RemplitSpread(ByVal Fichier As String)

Dim NumFile As Integer
Dim n As Integer
Dim r As Integer
Dim c As Integer
Dim Ligne As String
    
    If Not ExisteFichier(Fichier) Then
        'le fichier n'existe pas
        Exit Sub
    End If
    
    'ouvre le fichier
    NumFile = FreeFile
    Open Fichier For Input As NumFile
    r = 1
    If Not EOF(NumFile) Then
        'nombre de clés dans le fichier
        Input #NumFile, n
        'dimensionne le tableau
        Spread.MaxRows = n + 1
    End If
    'parcours du fichier
    While Not EOF(NumFile)
        'chaque clé
        Line Input #NumFile, Ligne
        Spread.Row = r
        'est distribuée dans une ligne du tableau
        For c = 1 To 5
            Spread.Col = c
            Spread.Text = GetItemDansChaineSep(Ligne, c, "|")
        Next
        'ligne suivante
        r = r + 1
    Wend
    Close NumFile

End Sub

'chargement de l'application
Private Sub Form_Load()

Dim chaine As String * 100
Dim chaine1 As String * 100
Dim cr As Integer
Dim hMod As Integer

    On Error Resume Next
    HourGlass "show"
        
    'deux retours à la ligne
    CrLf2 = vbCrLf & vbCrLf
    
    'récupère le répertoire de l'exécutable
    hMod = GetModuleHandle(NOM_MODULE_EXE)
    If hMod <> 0 Then
        cr = GetModuleFilename(hMod, chaine, 100)
        SeparePathFilename Left$(chaine, cr), RepertoireApplication, chaine1
    Else
        'répertoire principal en cas d'exécution depuis VB
        On Error Resume Next
        cr = FileLen("f:\real\haccp\cles.vbp")
        If cr Then
            RepertoireApplication = "f:\real\haccp"
        Else
            cr = FileLen("c:\real\haccp\cles.vbp")
            If cr Then
                RepertoireApplication = "c:\real\haccp"
            End If
        End If
        On Error GoTo 0
    End If
    
    'récupère le répertoire de windows
    cr = GetWindowsDirectory(chaine, 100)
    RepertoireWindows = Left$(chaine, cr)

    'intialisations
    Caption = NOM_COURT_APPLICATION & " " & VERSION_APPLICATION
    NomApplication = NOM_COURT_APPLICATION
    FichierAide = RepertoireApplication & "\" & FICHIER_AIDE
    FichierClefs = RepertoireApplication & "\" & FICHIER_CLEFS
    App.HelpFile = FichierAide
    On Error GoTo 0
        
    'restaure la position de la fenêtre depuis la dernière utilisation de l'application
    Dim ch As String
    ch = "WindowLeft"
    cr = Val(ChargeTexteWinIni(ch))
    If ch <> "" Then
        Left = cr
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
    
    'largeurs des colonnes du spread
    Dim w As Single
    Dim i As Integer
    w = (Spread.Width - Spread.ColWidth(0) - 375) / 5
    For i = 1 To 5
        Spread.ColWidth(i) = w
    Next
    'lecture du fichier des clés
    RemplitSpread FichierClefs
    
    'redessine les menus
    MetAJourMenus

    'apparition de la fenêtre principale
    FormMain.Show

    HourGlass "hide"
    
    
End Sub



'retaillage des colonnes à partir de la largeur de la fenêtre
Private Sub Form_Resize()

Dim i As Integer
Dim w1 As Single

    w1 = Spread.Width - Spread.ColWidth(0)
    Spread.Left = 0
    Spread.Top = 0
    Spread.Width = ScaleWidth
    Spread.Height = ScaleHeight
    For i = 1 To 5
        Spread.ColWidth(i) = Spread.ColWidth(i) / w1 * (Spread.Width - Spread.ColWidth(0))
    Next
    
End Sub

Private Sub Form_Unload(Cancel As Integer)

Dim cr As Integer

    HourGlass "show"
        
    'mémorise la situation de la fenêtre de l'application
    cr = WriteProfileString(NomApplication, "WindowState", Format$(WindowState))
    cr = WriteProfileString(NomApplication, "WindowHeight", Format$(Height))
    cr = WriteProfileString(NomApplication, "WindowWidth", Format$(Width))
    cr = WriteProfileString(NomApplication, "WindowLeft", Format$(Left))
    cr = WriteProfileString(NomApplication, "WindowTop", Format$(Top))
    
    HourGlass "hide"

End Sub


Private Sub MnuAide_Click()
    'sommaire de l'aide en ligne
    WinHelpVB FormMain.cmdialog1, FichierAide, HELP_INDEX, 0
End Sub

Private Sub MnuApropos_Click()
    'fenêtre d'a propos
    formAboutBox.Show MODAL
End Sub

'nouvelle clé
Private Sub MnuClefsNouvelle_Click()
    MnuClefsNouvelleClick
End Sub


'supprimer une clé
Private Sub MnuClefsSupprimer_Click()
    MnuClefsSupprimerClick
End Sub


'modifier un clé
Private Sub MnuClefsModifier_Click()
    MnuClefsModifierClick
End Sub



'copier la liste des clés dans le presse-papiers
Private Sub MnuCopierTableau_Click()
    MnuCopierTableauClick
End Sub


'quitter le programme
Private Sub MnuQuitter_Click()
    Unload Me
End Sub



'ajout ou modification d'une clé par double-click sur le spread
Private Sub Spread_DblClick(ByVal Col As Long, ByVal Row As Long)
    With Spread
        .Row = Row
        .Col = 1
        If .Text <> "" Then
            MnuClefsModifierClick
        Else
            MnuClefsNouvelleClick
        End If
    End With
    
End Sub

