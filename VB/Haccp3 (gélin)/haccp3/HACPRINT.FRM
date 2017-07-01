VERSION 4.00
Begin VB.Form formImprimer 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Imprimer"
   ClientHeight    =   4995
   ClientLeft      =   1605
   ClientTop       =   1050
   ClientWidth     =   6090
   Height          =   5400
   HelpContextID   =   86
   Left            =   1545
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4995
   ScaleWidth      =   6090
   ShowInTaskbar   =   0   'False
   Top             =   705
   Width           =   6210
   Begin VB.CheckBox chkAperçu 
      Caption         =   "chkAperçu"
      Height          =   195
      Left            =   4080
      TabIndex        =   11
      Top             =   4260
      Visible         =   0   'False
      Width           =   1515
   End
   Begin VB.CommandButton btnImprimante 
      Caption         =   "Im&primante..."
      Height          =   375
      Left            =   4140
      TabIndex        =   9
      Top             =   1005
      Width           =   1815
   End
   Begin VB.Frame Frame2 
      Caption         =   "Vous souhaitez"
      Height          =   3975
      Left            =   180
      TabIndex        =   5
      Top             =   75
      Width           =   3795
      Begin VB.OptionButton optSélection 
         Caption         =   "Créer un document &Word contenant"
         Height          =   195
         Index           =   2
         Left            =   300
         TabIndex        =   10
         Top             =   3000
         Width           =   3375
      End
      Begin VB.ListBox lstAffichages 
         Height          =   2010
         Left            =   780
         MultiSelect     =   2  'Extended
         TabIndex        =   8
         Top             =   900
         Width           =   2595
      End
      Begin VB.OptionButton optSélection 
         Caption         =   " Imprimer &un affichage particulier"
         Height          =   195
         Index           =   1
         Left            =   300
         TabIndex        =   7
         Top             =   600
         Width           =   3375
      End
      Begin VB.OptionButton optSélection 
         Caption         =   " Imprimer &tous les affichages"
         Height          =   195
         Index           =   0
         Left            =   300
         TabIndex        =   6
         Top             =   300
         Value           =   -1  'True
         Width           =   3075
      End
      Begin Threed.SSPanel SSPanel1 
         Height          =   675
         Left            =   540
         TabIndex        =   13
         Top             =   3240
         Width           =   2835
         _version        =   65536
         _extentx        =   5001
         _extenty        =   1191
         _stockprops     =   15
         bevelouter      =   0
         Begin VB.OptionButton chkAffichageWord 
            Caption         =   "Option1"
            Height          =   195
            Index           =   0
            Left            =   180
            TabIndex        =   15
            Top             =   60
            Width           =   2355
         End
         Begin VB.OptionButton chkAffichageWord 
            Caption         =   "Option2"
            Height          =   195
            Index           =   1
            Left            =   180
            TabIndex        =   14
            Top             =   360
            Width           =   2355
         End
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Options"
      Height          =   675
      Left            =   180
      TabIndex        =   3
      Top             =   4095
      Width           =   3795
      Begin Threed.SSCheck chkElementsCritiques 
         Height          =   195
         Left            =   180
         TabIndex        =   4
         Top             =   300
         Width           =   2835
         _version        =   65536
         _extentx        =   5001
         _extenty        =   344
         _stockprops     =   78
         caption         =   "&Eléments critiques seulement"
      End
   End
   Begin VB.CommandButton btnImprimer 
      Caption         =   "&Imprimer"
      Height          =   375
      Left            =   4140
      TabIndex        =   2
      Top             =   165
      Width           =   1815
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "&Fermer"
      Height          =   375
      Left            =   4140
      TabIndex        =   1
      Top             =   585
      Width           =   1815
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   375
      Left            =   4140
      TabIndex        =   0
      Top             =   1545
      Width           =   1815
   End
   Begin vsViewLib.vsPrinter vsPrinter 
      Height          =   2055
      Left            =   4140
      TabIndex        =   12
      Top             =   2160
      Visible         =   0   'False
      Width           =   1380
      _version        =   65536
      _extentx        =   2434
      _extenty        =   3625
      _stockprops     =   101
      BeginProperty hdrfont {FB8F0823-0164-101B-84ED-08002B2EC713} 
         name            =   "Courier New"
         charset         =   1
         weight          =   700
         size            =   13.5
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      convinfo        =   1474738486
      abortwindow     =   -1  'True
      abortcaption    =   ""
      filename        =   ""
      tablesep        =   ""
      columns         =   1
      pageborder      =   3
      tableborder     =   7
      header          =   ""
      footer          =   ""
      spaceafter      =   0
      indentfirst     =   0
      indentleft      =   0
      indentright     =   0
      indenttab       =   0
      linespacing     =   100
      textalign       =   0
      textangle       =   0
      marginleft      =   720
      marginright     =   720
      margintop       =   720
      marginbottom    =   720
      preview         =   0   'False
      hdrcolor        =   0
      textcolor       =   0
      pencolor        =   0
      penwidth        =   0
      penstyle        =   0
      brushcolor      =   0
      brushstyle      =   0
      physicalpage    =   0   'False
      previewmode     =   2
      spacebefore     =   0
   End
End
Attribute VB_Name = "formImprimer"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Const VARIATION_INDENT_LEFT = 500

Private Projet As Projet

Private DéjàUneEntete As Integer
Private LiaisonEntete As Integer




'compte le nombre de chaines sélectionnées dans une list-box multisélection
Private Function GetNbAffichages(ctl As Control)

Dim i As Integer
Dim n As Integer

    n = 0
    For i = 0 To ctl.ListCount - 1
        If ctl.Selected(i) Then
            n = n + 1
        End If
    Next
    GetNbAffichages = n

End Function

Private Sub ImprimerArbreHACCP(ByVal NewPrinter As Integer, ByVal Titre As String)

Dim i As Integer

    If NewPrinter Then
        vsPrinter.Preview = chkAperçu.Value
        vsPrinter.Action = 3    'début de transfert
        If vsPrinter.Error Then
            Exit Sub
        End If
        InitHautEtBasDePage
    End If
    
    'titre
    vsPrinter.IndentLeft = 0
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.FontSize = 16
    vsPrinter.FontUnderline = True
    vsPrinter.Paragraph = Titre
    vsPrinter.FontUnderline = False
    vsPrinter.FontSize = 10
    vsPrinter.FontBold = False
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
        
    'arbre HACCP
    For i = 1 To Projet.EtapesCount
        InsérerDonnée Projet.Etape(i), i, 1, 0, 10, 12, False, 6
    Next

    If NewPrinter Then
        vsPrinter.Action = 6    'fin de transfert
    End If

End Sub

Private Sub ImprimerDangersEtSujetsDangers(ByVal NewPrinter As Integer, ByVal Titre As String)

Dim fmt As String
Dim tbl As String
Dim i As Integer

    If NewPrinter Then
        vsPrinter.Preview = chkAperçu.Value
        vsPrinter.Action = 3    'début de transfert
        If vsPrinter.Error Then
            Exit Sub
        End If
        InitHautEtBasDePage
    End If
    
    vsPrinter.IndentLeft = 0
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.FontSize = 16
    vsPrinter.FontUnderline = True
    vsPrinter.Paragraph = Titre
    vsPrinter.FontUnderline = False
    vsPrinter.FontSize = 10
    vsPrinter.FontBold = False
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    
    'entete de tableau des dangers
    vsPrinter.FontBold = True
    vsPrinter.Paragraph = "Evaluation de la pertinence des dangers"
    fmt = "3500|3500|1440;"
    tbl = fmt & "Nature|Spécificité|Pertinence;"
    vsPrinter.Table = tbl
    'corps du tableau des dangers
    vsPrinter.FontBold = False
    For i = 1 To Projet.DangersCount
        If i = 1 Then
            tbl = fmt & Projet.Danger(i).Nature & "|" & Projet.Danger(i).Spécificité & "|" & Projet.Danger(i).Pertinence & ";"
        Else
            tbl = tbl & Projet.Danger(i).Nature & "|" & Projet.Danger(i).Spécificité & "|" & Projet.Danger(i).Pertinence & ";"
        End If
    Next
    vsPrinter.Table = tbl
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    
    'entete de tableau des sujets/dangers
    vsPrinter.FontBold = True
    vsPrinter.Paragraph = "Criticité des dangers"
    fmt = "1440|1440|1440|1440|1440|2000|1000;"
    tbl = fmt & Module.Niveau(NIVEAU_ETAPE) & "|" & Module.Niveau(NIVEAU_SUJET) & "|Nature|Spécificité|Nom|Commentaire|Criticité;"
    vsPrinter.Table = tbl
    'corps du tableau des sujets/dangers
    vsPrinter.FontBold = False
    For i = 1 To Projet.SujetsDangersCount
        If Not Projet.SujetDanger(i).Effacé Then
            If i = 1 Then
                tbl = fmt & Projet.Etape(Projet.SujetDanger(i).Etape).Titre & "|" & Projet.Etape(Projet.SujetDanger(i).Etape).Enfant(Projet.SujetDanger(i).Sujet).Titre & "|" & Projet.Danger(Projet.SujetDanger(i).Danger).Nature & "|" & Projet.Danger(Projet.SujetDanger(i).Danger).Spécificité & "|" & Projet.SujetDanger(i).Nom & "|" & Projet.SujetDanger(i).Commentaire & "|" & Projet.SujetDanger(i).Criticité & ";"
            Else
                tbl = tbl & Projet.Etape(Projet.SujetDanger(i).Etape).Titre & "|" & Projet.Etape(Projet.SujetDanger(i).Etape).Enfant(Projet.SujetDanger(i).Sujet).Titre & "|" & Projet.Danger(Projet.SujetDanger(i).Danger).Nature & "|" & Projet.Danger(Projet.SujetDanger(i).Danger).Spécificité & "|" & Projet.SujetDanger(i).Nom & "|" & Projet.SujetDanger(i).Commentaire & "|" & Projet.SujetDanger(i).Criticité & ";"
            End If
        End If
    Next
    vsPrinter.Table = tbl

    If NewPrinter Then
        vsPrinter.Action = 6    'fin de transfert
    End If


End Sub

Private Sub WordCréerTableau(AppWord As Object, ByVal Niveau As Integer, ByVal NiveauMax As Integer)

Dim c As Integer
Dim NbColonnes As Integer
    'format 20
    NbColonnes = NiveauMax - Niveau + 1
    AppWord.TableauInsérerTableau 0, NbColonnes, 1, , , 20, 5
        
    'titres des colonnes
    For c = 1 To NbColonnes
        WordStyle AppWord, "Titres"
        AppWord.Insertion Module.Niveau(Niveau + c - 1)
        If c < NbColonnes Then
            AppWord.CelluleSuiv
        End If
    Next

End Sub

Private Sub WordImprimerAffichage(ByVal Affichage As Integer, ByVal NouveauDocument As Integer, ByVal StatusMin As Integer, ByVal StatusMax As Integer)

Dim i As Integer

    HourGlass "show"
    UpdateStatus StatusMin
    If NouveauDocument Then
        On Error Resume Next
        StatusDlg.Label2.Caption = "Chargement de Word..."
        Set AppWord = CreateObject("word.basic")
        If Err Then
            ErreurUserBox GetChaineCrLf("M19"), MB_ICONEXCLAMATION
            HourGlass "hide"
            Exit Sub
        End If
        On Error GoTo 0
        StatusDlg.Label2.Caption = ""
        'cache Word
        'AppWord.FenAppMasquer
        'fichier vierge
        AppWord.FichierNouveau
    End If
    
    
    'pied de page avec numéros de page à droite
    WordHautEtBasPage AppWord

    DéjàUneEntete = False
    LiaisonEntete = False
    For i = 1 To Projet.EtapesCount
        StatusDlg.Label2.Caption = Module.Niveau(NIVEAU_ETAPE) & " " & Projet.Etape(i).Titre
        WordInsérerEtape AppWord, Projet.Etape(i), i, 1, 8, Affichage, StatusMin + (i - 1) * (StatusMax - StatusMin) / Projet.EtapesCount, StatusMin + i * (StatusMax - StatusMin) / Projet.EtapesCount
        UpdateStatus StatusMin + i * (StatusMax - StatusMin) / Projet.EtapesCount
    Next

    'MsgBox "impression terminée. alt-tab pour voir le résultat"
    HourGlass "hide"
    
End Sub

Private Sub ImprimerParamètres(ByVal NewPrinter As Integer, ByVal Titre As String)

Const DX = 4000

    If NewPrinter Then
        vsPrinter.Preview = chkAperçu.Value
        vsPrinter.Action = 3    'début de transfert
        If vsPrinter.Error Then
            Exit Sub
        End If
        InitHautEtBasDePage
    End If
    
    vsPrinter.IndentLeft = 0
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.FontSize = 16
    vsPrinter.FontUnderline = True
    vsPrinter.Paragraph = Titre & " "
    vsPrinter.FontUnderline = False
    vsPrinter.FontBold = False
    vsPrinter.FontSize = 10
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.Paragraph = ""
    vsPrinter.Text = "Titre: "
    vsPrinter.FontBold = False
    vsPrinter.CurrentX = DX
    vsPrinter.Paragraph = Projet.Titre & " "
    vsPrinter.FontBold = True
    vsPrinter.Paragraph = ""
    vsPrinter.Text = "Auteur: "
    vsPrinter.FontBold = False
    vsPrinter.CurrentX = DX
    vsPrinter.Paragraph = Projet.Auteur & " "
    vsPrinter.FontBold = True
    vsPrinter.Paragraph = ""
    vsPrinter.Text = "Référence: "
    vsPrinter.FontBold = False
    vsPrinter.CurrentX = DX
    vsPrinter.Paragraph = Projet.Référence & " "
    vsPrinter.FontBold = True
    vsPrinter.Paragraph = ""
    vsPrinter.Text = "Date de création: "
    vsPrinter.FontBold = False
    vsPrinter.CurrentX = DX
    vsPrinter = Projet.DateCréation
    vsPrinter.FontBold = True
    vsPrinter.Paragraph = ""
    vsPrinter.Text = "Date de modification: "
    vsPrinter.FontBold = False
    vsPrinter.CurrentX = DX
    vsPrinter = Projet.DateModification
    vsPrinter.FontBold = True
    vsPrinter = ""
    vsPrinter.Paragraph = "Commentaire: "
    vsPrinter.FontBold = False
    vsPrinter = Projet.Commentaire & " "
    
    If NewPrinter Then
        vsPrinter.Action = 6    'fin de transfert
    End If
    
End Sub

Private Sub ImprimerEquipe(ByVal NewPrinter As Integer, ByVal Titre As String)

Dim fmt As String
Dim tbl As String
Dim i As Integer

    If NewPrinter Then
        vsPrinter.Preview = chkAperçu.Value
        vsPrinter.Action = 3    'début de transfert
        If vsPrinter.Error Then
            Exit Sub
        End If
        InitHautEtBasDePage
    End If
    
    vsPrinter.IndentLeft = 0
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.FontSize = 16
    vsPrinter.FontUnderline = True
    vsPrinter.Paragraph = Titre
    vsPrinter.FontUnderline = False
    vsPrinter.FontSize = 10
    vsPrinter.FontBold = False
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    
    'entete de tableau
    vsPrinter.FontBold = True
    fmt = "2880|2880;"
    tbl = fmt & "Nom|Fonction;"
    vsPrinter.Table = tbl
    
    'corps du tableau
    vsPrinter.FontBold = False
    For i = 1 To Projet.PersonnesCount
        If i = 1 Then
            tbl = fmt & Projet.PersonneNom(i) & "|" & Projet.PersonneFonction(i) & ";"
        Else
            tbl = tbl & Projet.PersonneNom(i) & "|" & Projet.PersonneFonction(i) & ";"
        End If
    Next
    vsPrinter.Table = tbl

    If NewPrinter Then
        vsPrinter.Action = 6    'fin de transfert
    End If
    
End Sub


Private Sub ImprimerDocuments(ByVal NewPrinter As Integer, ByVal Titre As String)


    If NewPrinter Then
        vsPrinter.Preview = chkAperçu.Value
        vsPrinter.Action = 3    'début de transfert
        If vsPrinter.Error Then
            Exit Sub
        End If
        InitHautEtBasDePage
    End If
    
    'titre
    vsPrinter.IndentLeft = 0
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.FontSize = 16
    vsPrinter.FontUnderline = True
    vsPrinter.Paragraph = Titre
    vsPrinter.FontUnderline = False
    vsPrinter.FontSize = 10
    vsPrinter.FontBold = False
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    
    InsérerTableauDocuments Projet

    If NewPrinter Then
        vsPrinter.Action = 6    'fin de transfert
    End If
    
End Sub



Private Sub ImprimerEtapesEtSujets(ByVal NewPrinter As Integer, ByVal Titre As String)

Dim Etape As Donnee
Dim Sujet As Donnee
Dim i As Integer
Dim j As Integer

    If NewPrinter Then
        vsPrinter.Preview = chkAperçu.Value
        vsPrinter.Action = 3    'début de transfert
        If vsPrinter.Error Then
            Exit Sub
        End If
        InitHautEtBasDePage
    End If
    
    'titre
    vsPrinter.IndentLeft = 0
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.FontSize = 16
    vsPrinter.FontUnderline = True
    vsPrinter.Paragraph = Titre
    vsPrinter.FontUnderline = False
    vsPrinter.FontSize = 10
    vsPrinter.FontBold = False
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
        
    For i = 1 To Projet.EtapesCount
        InsérerDonnée Projet.Etape(i), i, 1, 0, 2, 14, False, 3
    Next

    If NewPrinter Then
        vsPrinter.Action = 6    'fin de transfert
    End If
    
End Sub




Private Sub ImprimerDispositionsEnPlace(ByVal NewPrinter As Integer, ByVal Titre As String)

Dim i As Integer

    If NewPrinter Then
        vsPrinter.Preview = chkAperçu.Value
        vsPrinter.Action = 3    'début de transfert
        If vsPrinter.Error Then
            Exit Sub
        End If
        InitHautEtBasDePage
    End If
    
    'titre
    vsPrinter.IndentLeft = 0
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.FontSize = 16
    vsPrinter.FontUnderline = True
    vsPrinter.Paragraph = Titre
    vsPrinter.FontUnderline = False
    vsPrinter.FontSize = 10
    vsPrinter.FontBold = False
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
        
    'arbre des dispositions en place
    For i = 1 To Projet.EtapesCount
        InsérerDonnée Projet.Etape(i), i, 1, 0, 8, 14, False, 4
    Next

    If NewPrinter Then
        vsPrinter.Action = 6    'fin de transfert
    End If
    
End Sub





Private Sub InitHautEtBasDePage()
    
    vsPrinter.HdrFontName = "Arial"
    vsPrinter.HdrFontSize = 10
    vsPrinter.HdrFontBold = False
    vsPrinter.HdrFontItalic = False
    vsPrinter.HdrFontUnderline = False
    vsPrinter.Header = GetChaineCrLf("TitreImp") & "||"
    If bLicenceOk Then
        vsPrinter.Header = vsPrinter.Header & GetConfig(SECTION_CONFIG_LICENCE, KEY_CONFIG_UTILISATEUR) & " " & GetConfig(SECTION_CONFIG_LICENCE, KEY_CONFIG_NUM_SERIE)
    Else
        vsPrinter.Header = vsPrinter.Header & "Mode d'évaluation"
    End If
    vsPrinter.Footer = Projet.FichierProjet & " " & Projet.Titre & " (" & Projet.Référence & "," & Format$(Projet.DateModification(), "dd/mm/yy") & ")||Page %d"
    
End Sub


Private Sub RefreshBoutons()

    'boutons
    btnImprimer.Enabled = optSélection(0).Tag = "0" Or (optSélection(0).Tag = "1" And GetNbAffichages(lstAffichages) > 0) Or (optSélection(0).Tag = "2" And (chkAffichageWord(0).Value <> 0 Or chkAffichageWord(1).Value <> 0))
    btnImprimer.Caption = IIf(optSélection(0).Tag = "2", "&Créer le document", "&Imprimer")
    'btnAperçu.Enabled = optSélection(0).Tag <> "2"
    'lstAffichages.Enabled = optSélection(0).Tag = "1"
    
    'options
    chkElementsCritiques.Enabled = (optSélection(0).Tag = "1" And lstAffichages.ListIndex = 6) Or (optSélection(0).Tag = "2" And chkAffichageWord(1).Value <> 0)

End Sub

'génération des lignes d'entetes du document Word
Private Sub WordInsérerEntête(AppWord As Object, ByVal Etape As Donnee, ByVal Sujet As Donnee, ByVal SujetDanger As SujetDanger)

Dim ch As String

    WordStyle AppWord, "entete"
    ch = GetChaineCrLf("TitreImp") & Chr$(9) & Chr$(9)
    If bLicenceOk Then
        ch = ch & GetConfig(SECTION_CONFIG_LICENCE, KEY_CONFIG_UTILISATEUR) & " " & GetConfig(SECTION_CONFIG_LICENCE, KEY_CONFIG_NUM_SERIE)
    Else
        ch = ch & "Mode d'évaluation"
    End If
    AppWord.Insertion ch & CrLf2
    
    WordStyle AppWord, "etape"
    AppWord.Insertion Module.Niveau(NIVEAU_ETAPE) & Chr$(9) & Etape.Titre
    
    If Not Sujet Is Nothing Then
        AppWord.Insertion vbCrLf
        WordStyle AppWord, "Sujet"
        AppWord.Insertion Module.Niveau(NIVEAU_SUJET) & Chr$(9) & Sujet.Titre
        If Not SujetDanger Is Nothing Then
            AppWord.Insertion vbCrLf
            WordStyle AppWord, "sujetdanger"
            AppWord.Insertion Module.Niveau(NIVEAU_SUJET_DANGER) & Chr$(9) & SujetDanger.Nom & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")"
        End If
    End If
    AppWord.Insertion vbCrLf
    WordStyle AppWord, "entete"
    AppWord.Insertion vbCrLf & vbCrLf & vbCrLf
        
End Sub

'crée et remplit un tableau à partir des mesures préventives ou des points à maitriser
'AppWord: objet application word
'Donnée: sujet ou sujetdanger
'niveau: niveau mesure préventive ou niveau point à maitriser
'niveaumax: niveau enregistrements
'statutmin: valeur mini de l'avancement dans la barre de status
'statutmax: valeur maxi de l'avancement dans la barre de status
Private Sub WordInsérerTableau(AppWord As Object, ByVal Donnée As Object, ByVal Niveau As Integer, ByVal NiveauMax As Integer, ByVal StatusMin As Integer, ByVal StatusMax As Integer)

Dim n As Integer
Dim i As Integer
Dim TableauCréé As Integer
Dim Insérer As Integer

    TableauCréé = False
      
    'lignes du tableau
    n = Donnée.EnfantsCount
    'les enfants de Donnée sont des points à maitriser ou des mesures préventives
    For i = 1 To n
        Insérer = True
        If chkElementsCritiques.Enabled And chkElementsCritiques.Value Then
            If Donnée.Enfant(i).Criticité <> "OUI" Then
                Insérer = False
            End If
        End If
        If Insérer Then
            If Not TableauCréé Then
                'créer l'entete du tableau si au moins une donnée à y mettre
                WordCréerTableau AppWord, Niveau, NiveauMax
                TableauCréé = True
            End If
            StatusDlg.Label4.Caption = Donnée.Enfant(i).Titre
            'on est dans la dernière colonne du tableau
            'cellulesuiv ajoute une ligne au tableau
            AppWord.CelluleSuiv
            'on est dans la première colonne
            'on remplit la ligne avec les enfants de la donnée (mesures préventives
            'ou valeurs cibles)
            'positionne dans la colonne
            AppWord.DébutLigneTableau
            For Insérer = NiveauMax - Niveau + 1 To 1 Step -1
                AppWord.BordureSup 1
                If Insérer > 1 Then
                    AppWord.CelluleSuiv
                End If
            Next
            WordRemplirTableau AppWord, Donnée.Enfant(i), 1, Niveau + 1, NiveauMax
        End If
    Next
    If Not TableauCréé Then
        WordStyle AppWord, "normal"
        If chkElementsCritiques.Enabled And chkElementsCritiques.Value Then
            AppWord.Insertion vbCrLf & "Pas de " & Module.Niveau(NIVEAU_POINT_A_MAITRISER) & " critique."
        Else
            AppWord.Insertion vbCrLf & "Pas de " & Module.Niveau(NIVEAU_POINT_A_MAITRISER)
        End If
    End If
    
    AppWord.FinDocument
    
End Sub

'remplit une ligne d'un tableau
Private Sub WordRemplirTableau(AppWord As Object, ByVal Donnée As Donnee, ByVal Colonne As Integer, ByVal Niveau As Integer, ByVal NiveauMax As Integer)

Dim i As Integer
Dim n As Integer

    If Niveau > NiveauMax + 1 Then
        Exit Sub
    End If
            
    'saute éventuellement les mesures préventives non critiques
    If chkElementsCritiques.Enabled And chkElementsCritiques.Value And Niveau = NIVEAU_MESURE_PREVENTIVE And Donnée.Criticité <> "OUI" Then
        Exit Sub
    End If
        
        
    AppWord.DébutLigneTableau
    For i = Colonne To 2 Step -1
        If AppWord.BordureSup() = 0 Then
            'AppWord.BordureSup 1
            i = i
        End If
        If i = Colonne Then
            If Asc(Left$(AppWord.LitSignet$("\para"), 1)) = 13 Then
                AppWord.BordureSup 0
            End If
        End If
        AppWord.CelluleSuiv
        If i > 2 Then
            If Asc(Left$(AppWord.LitSignet$("\para"), 1)) = 13 Then
                AppWord.BordureSup 0
            End If
        End If
    Next
    'et la remplie
    WordStyle AppWord, "cellule"
    If Donnée.Criticité = "OUI" Then
        'AppWord.FormatBordureEtTrame 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "0,3 cm", 6, 0, 4, 0
        AppWord.Soulignement 1
    Else
        AppWord.Soulignement 0
    End If
    AppWord.Insertion Donnée.Titre
    
    'successeurs dans les colonnes à droite
    n = Donnée.EnfantsCount
    For i = 1 To n
        'tout ou seulement les éléments critiques
        'If (chkElementsCritiques.Enabled = False) Or (chkElementsCritiques.Enabled And (Not chkElementsCritiques.Value Or (chkElementsCritiques.Value And Donnée.Enfant(i).Criticité = "OUI"))) Then
            If i > 1 Then
                AppWord.CelluleSuiv
            End If
            'appel récursif
            WordRemplirTableau AppWord, Donnée.Enfant(i), Colonne + 1, Niveau + 1, NiveauMax
        'End If
    Next
    'se positionne sur la dernière colonne du tableau avant de remonter d'un niveau
    'afin que CelluleSuiv ajoute une ligne au tableau
    AppWord.FinLigneTableau

End Sub


'change le format des caractères dans une application Word
Private Sub WordStyle(AppWord As Object, ByVal Style As String)

    Select Case LCase$(Style)
        Case "normal"
            AppWord.FormatCaractères 10
            AppWord.gras 0
        Case "etape"
            'FormatBordureEtTrame  doit être avant FormatCaractères !
            AppWord.FormatBordureEtTrame 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "0,3 cm", 10, 0, 11, 0
            AppWord.FormatTabs "3 cm", "5 cm", 0, 0, 1
            AppWord.FormatCaractères 16
            AppWord.gras 1
        Case "sujet"
            AppWord.FormatBordureEtTrame 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "0,3 cm", 2, 0, 11, 0
            AppWord.FormatTabs "3 cm", "5 cm", 0, 0, 1
            AppWord.FormatCaractères 16
            AppWord.gras 1
        Case "sujetdanger"
            AppWord.FormatBordureEtTrame 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "0,3 cm", 6, 0, 4, 0
            AppWord.FormatTabs "3 cm", "5 cm", 0, 0, 1
            AppWord.FormatCaractères 16
            AppWord.gras 1
        Case "cellule"
            AppWord.gras 0
            Err = 0
            On Error Resume Next
            'en word 6
            AppWord.ParaCentré
            If Err Then
                'en word 7
                AppWord.CentrerPara
            End If
            On Error GoTo 0
            AppWord.FormatCaractères 10
        Case "titres"
            AppWord.gras 1
            On Error Resume Next
            'en word 6
            AppWord.ParaCentré
            If Err Then
                'en word 7
                AppWord.CentrerPara
            End If
            On Error GoTo 0
            AppWord.FormatCaractères 10
        Case "entete"
            AppWord.gras 0
            AppWord.FormatBordureEtTrame 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "0,3 cm", 0, 0, 0, 0
            AppWord.FormatCaractères 8
        Case "hautbaspage"
            AppWord.gras 0
    End Select

End Sub

Private Sub btnAide_Click()
    AideProgramme HelpContextID
End Sub

Private Sub btnAide_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour obtenir de l'aide ou appuyez sur F1"
End Sub


Private Sub btnAnnuler_Click()
    Unload Me
End Sub



Private Sub ImprimerOnglet(ByVal OngletSeul As Integer, ByVal IndexOnglet As Integer)

    Select Case IndexOnglet
        Case 0
            'paramètres
            ImprimerParamètres OngletSeul, lstAffichages.List(IndexOnglet)
        Case 1
            'équipe
            ImprimerEquipe OngletSeul, lstAffichages.List(IndexOnglet)
        Case 2
            'documentation
            ImprimerDocuments OngletSeul, lstAffichages.List(IndexOnglet)
        Case 3
            'étapes et sujets
            ImprimerEtapesEtSujets OngletSeul, lstAffichages.List(IndexOnglet)
        Case 4
            'dispositions en place
            ImprimerDispositionsEnPlace OngletSeul, lstAffichages.List(IndexOnglet)
        Case 5
            'dangers et sujets/dangers
            ImprimerDangersEtSujetsDangers OngletSeul, lstAffichages.List(IndexOnglet)
        Case 6
            'arbre HACCP
            ImprimerArbreHACCP OngletSeul, lstAffichages.List(IndexOnglet) & IIf(chkElementsCritiques.Value, "(" & suppfirstchar(chkElementsCritiques.Caption, 1) & ")", "")
        Case 7
            'tableau schéma de vie
            ImprimerShémaVie OngletSeul, lstAffichages.List(IndexOnglet)
    End Select
    
End Sub





Private Sub ImprimerTout()

    vsPrinter.Preview = chkAperçu.Value
    vsPrinter.Action = 3    'début de transfert
    If vsPrinter.Error Then
        Exit Sub
    End If
    InitHautEtBasDePage
    
    ImprimerParamètres False, lstAffichages.List(0)
    vsPrinter.Action = 4 'NewPage
    ImprimerEquipe False, lstAffichages.List(1)
    vsPrinter.Action = 4 'NewPage
    ImprimerDocuments False, lstAffichages.List(2)
    vsPrinter.Action = 4 'NewPage
    ImprimerEtapesEtSujets False, lstAffichages.List(3)
    vsPrinter.Action = 4 'NewPage
    ImprimerDispositionsEnPlace False, lstAffichages.List(4)
    vsPrinter.Action = 4 'NewPage
    ImprimerDangersEtSujetsDangers False, lstAffichages.List(5)
    vsPrinter.Action = 4 'NewPage
    ImprimerArbreHACCP False, lstAffichages.List(6)
    
    vsPrinter.Action = 6 'EndDoc
    
End Sub


Private Sub btnImprimante_Click()
    MnuFichierConfigurationImprimanteClick
End Sub


Private Sub btnImprimer_Click()
        
    'gestion d'erreur inattendue
    On Error GoTo err_inattendue
        
    HourGlass "show"
    'optSélection(0).Tag contient l'index du bouton d'option cliqué
    Select Case optSélection(0).Tag
        Case "0"
            'tout imprimer avec vsPrinter
            ImprimerTout
        Case "1"
            ImprimerPlusieursOnglets
        Case "2"
            'génération d'un document Word
            Dim NouveauDocument As Integer
            NouveauDocument = True
            'cache la fenêtre d'impression car elle est modale et la fenêtre de status ne peut pas s'afficher non modale dessus
            Me.Hide
            'montre la fenêtre d'indicateur d'avancement
            ShowStatusDialog "Génération du document en cours", 100, False
            If chkAffichageWord(0).Value Then
                'contenant les dispositions en place
                StatusDlg.Label1.Caption = Module.AffichageTitre(5)
                WordImprimerAffichage 4, NouveauDocument, 0, IIf(chkAffichageWord(1).Value <> 0, 50, 100)
                NouveauDocument = False
            End If
            If chkAffichageWord(1).Value Then
                StatusDlg.Label1.Caption = Module.AffichageTitre(7)
                'et/ou l'arbre HACCP
                WordImprimerAffichage 6, NouveauDocument, IIf(chkAffichageWord(0).Value <> 0, 50, 0), 100
            End If
            AppWord.fenappafficher
            HideStatus
            HourGlass "hide"
            Me.Show vbModal
    End Select
    HourGlass "hide"
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub


Private Sub chkAffichageWord_Click(Index As Integer)
    optSélection(2).Value = 1
    RefreshBoutons
End Sub

Private Sub chkElementsCritiques_Click(Value As Integer)
    RefreshBoutons
End Sub


Private Sub Form_Load()

Dim i As Integer

    CenterInScreen Me
    
    For i = 0 To Module.AffichagesCount - 1
        lstAffichages.AddItem Module.AffichageTitre(i + 1) & " "
    Next
    lstAffichages.AddItem "Schéma de vie / CCP"
    If lstAffichages.ListCount > 0 Then
        lstAffichages.Selected(mini(FormMain.ActiveForm.SSTab1.Tab, lstAffichages.ListCount)) = True
    End If
    chkAffichageWord(0).Caption = Module.AffichageTitre(5)
    chkAffichageWord(1).Caption = Module.AffichageTitre(7)
    
    RefreshBoutons
    
    'projet à imprimer
    Set Projet = FormMain.ActiveForm.Projet
    
End Sub



Private Sub lstAffichages_Click()
    optSélection(1).Value = 1
    RefreshBoutons
End Sub


'Donnée
'NuméroOrdre
'Niveau
'IndentLeft
'
'NiveauMax
'TailleMax
'bImprimerDocuments
'Affichage
Private Sub InsérerDonnée(ByVal Donnée As Donnee, ByVal NuméroOrdre As String, ByVal Niveau As Integer, ByVal IndentLeft As Integer, ByVal NiveauMax As Integer, ByVal TailleMax As Integer, ByVal ImprimerDocuments As Integer, ByVal Affichage As Integer)

Dim i As Integer

    If Niveau > NiveauMax Then
        Exit Sub
    End If
        
    vsPrinter.IndentLeft = IndentLeft
    vsPrinter.FontSize = maxi(10, TailleMax - Niveau)
    vsPrinter.FontBold = True
    vsPrinter.Paragraph = NuméroOrdre & ". " & Donnée.Titre
    vsPrinter.FontSize = 10
    vsPrinter.FontBold = False
    vsPrinter.Paragraph = ""
    vsPrinter.IndentLeft = IndentLeft + VARIATION_INDENT_LEFT
    If Donnée.Commentaire <> "" Then
        vsPrinter.Paragraph = Donnée.Commentaire
        vsPrinter.Paragraph = ""
    End If
        
    'documents
    If ImprimerDocuments Then
        If Donnée.DocumentsCount > 0 Then
            vsPrinter.TableBorder = 7
            InsérerTableauDocuments Donnée
            vsPrinter.Paragraph = ""
        End If
    End If
    
    'arbre
    If Affichage = 6 And Niveau = NIVEAU_SUJET Then
        'imprime le niveau des sujets/dangers
        Dim SujetDanger As SujetDanger
        Dim j As Integer
        For j = 1 To Projet.SujetsDangersCount
            Set SujetDanger = Projet.SujetDanger(j)
            If Not SujetDanger.Effacé And Donnée.id = SujetDanger.Sujet Then
                If Not chkElementsCritiques.Value Or (chkElementsCritiques.Value And SujetDanger.Criticité = "OUI") Then
                    'paragraphe du sujet/danger
                    vsPrinter.IndentLeft = IndentLeft
                    vsPrinter.FontSize = maxi(10, TailleMax - Niveau)
                    vsPrinter.FontBold = True
                    vsPrinter.Paragraph = NuméroOrdre & "." & j & ". " & SujetDanger.Nom & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")"
                    vsPrinter.FontSize = 10
                    vsPrinter.FontBold = False
                    vsPrinter.Paragraph = ""
                    vsPrinter.IndentLeft = IndentLeft + VARIATION_INDENT_LEFT
                    If SujetDanger.Commentaire <> "" Then
                        vsPrinter.Paragraph = SujetDanger.Commentaire
                        vsPrinter.Paragraph = ""
                    End If
                    If Not chkElementsCritiques.Value Then
                        'Criticité
                        vsPrinter.Paragraph = Module.Niveau(NIVEAU_SUJET_DANGER) & " critique: " & SujetDanger.Criticité
                        vsPrinter.Paragraph = ""
                    End If
                    'suite de l'arbre HACCP à partir de points à maitriser
                    For i = 1 To SujetDanger.EnfantsCount
                        If Not chkElementsCritiques.Value Or (chkElementsCritiques.Value And SujetDanger.Criticité = "OUI") Then
                            'appel récursif
                            InsérerDonnée SujetDanger.Enfant(i), NuméroOrdre & "." & j & "." & i, Niveau + 2, IndentLeft + 2 * VARIATION_INDENT_LEFT, NiveauMax, TailleMax, ImprimerDocuments, Affichage
                            If i <> SujetDanger.EnfantsCount Then
                                vsPrinter.Paragraph = ""
                            End If
                        End If
                    Next
                End If
            End If
        Next
    Else
        For i = 1 To Donnée.EnfantsCount
            'If (Niveau <> NIVEAU_POINT_A_MAITRISER And Niveau <> NIVEAU_MESURE_PREVENTIVE) Or ((Niveau = NIVEAU_POINT_A_MAITRISER Or Niveau = NIVEAU_MESURE_PREVENTIVE) And (Not chkElementsCritiques.Value Or (chkElementsCritiques.Value And Donnée.Enfant(i).Criticité = "OUI"))) Then
            If (Niveau <> NIVEAU_POINT_A_MAITRISER And Niveau <> NIVEAU_MESURE_PREVENTIVE) Or (Niveau = NIVEAU_MESURE_PREVENTIVE) Or (Niveau = NIVEAU_POINT_A_MAITRISER And (Not chkElementsCritiques.Value Or (chkElementsCritiques.Value And Donnée.Enfant(i).Criticité = "OUI"))) Then
                'appel récursif
                InsérerDonnée Donnée.Enfant(i), NuméroOrdre & "." & i, Niveau + 1, IndentLeft + VARIATION_INDENT_LEFT, NiveauMax, TailleMax, ImprimerDocuments, Affichage
                If i <> Donnée.EnfantsCount Then
                    vsPrinter.Paragraph = ""
                End If
            End If
        Next
    End If
    
End Sub

'Etape
'NuméroOrdre
'Niveau
'NiveauMax
'Affichage
'StatusMin
'StatusMax
Private Sub WordInsérerEtape(AppWord As Object, ByVal Etape As Donnee, ByVal NuméroOrdre As Integer, ByVal Niveau As Integer, ByVal NiveauMax As Integer, ByVal Affichage As Integer, ByVal StatusMin As Integer, ByVal StatusMax As Integer)

Dim i As Integer
Dim Sujet As Donnee

    'WordStyle AppWord, "etape"
    'AppWord.Insertion Etape.Titre & vbCrLf
    
    'sujets
    If Etape.EnfantsCount = 0 Then
        If DéjàUneEntete Then
            'une section par sujet: les noms d'étape et de sujet
            'sont mis dans l'entête pour répétition sur chaque page
            AppWord.InsertionSaut 2
            AppWord.FinDocument
        End If
        'entete de section
        AppWord.AffichageEnTête
        If DéjàUneEntete Then
            'entete indépendante entre sections
            'If Not LiaisonEntete Then
                AppWord.LiaisonEnTêtePiedPage
                LiaisonEntete = True
            'End If
            'pour supprimer le texte récopié de l'entete précédente
            Dim k As Integer
            For k = 1 To 10
                AppWord.EtendreSélection
            Next
        End If
        WordInsérerEntête AppWord, Etape, Nothing, Nothing
        DéjàUneEntete = True
        AppWord.AffichageEnTête
        WordStyle AppWord, "normal"
        AppWord.Insertion vbCrLf & "Pas de sujets"
        Exit Sub
    End If
    
    For i = 1 To Etape.EnfantsCount
        Set Sujet = Etape.Enfant(i)
        StatusDlg.Label3.Caption = Module.Niveau(NIVEAU_SUJET) & " " & Sujet.Titre
        'WordStyle AppWord, "Sujet"
        'AppWord.Insertion Sujet.Titre & vbCrLf
        If Affichage = 4 Then
            'cas des dispositions en place
            If DéjàUneEntete Then
                'une section par sujet: les noms d'étape et de sujet
                'sont mis dans l'entête pour répétition sur chaque page
                AppWord.InsertionSaut 2
                AppWord.FinDocument
            End If
            'entete de section
            AppWord.AffichageEnTête
            If DéjàUneEntete Then
                'entete indépendante entre sections
                'If Not LiaisonEntete Then
                    AppWord.LiaisonEnTêtePiedPage
                    LiaisonEntete = True
                'End If
                'pour supprimer le texte récopié de l'entete précédente
                For k = 1 To 10
                    AppWord.EtendreSélection
                Next
            End If
            WordInsérerEntête AppWord, Etape, Sujet, Nothing
            AppWord.EditionEffacer 10
            DéjàUneEntete = True
            AppWord.AffichageEnTête
            'imprime les dispositions en place
            WordInsérerTableau AppWord, Sujet, NIVEAU_MESURE_PREVENTIVE, NIVEAU_ENREGISTREMENT, StatusMin + (i - 1) * (StatusMax - StatusMin) / Etape.EnfantsCount, StatusMin + i * (StatusMax - StatusMin) / Etape.EnfantsCount
        Else
            'cas de l'arbre HACCP
            Dim SujetDanger As SujetDanger
            Dim j As Integer
            If Projet.SujetsDangersCount = 0 Then
                WordStyle AppWord, "normal"
                AppWord.Insertion vbCrLf & "Pas de " & Module.Niveau(NIVEAU_SUJET_DANGER)
            Else
                'imprime le niveau des sujets/dangers
                For j = 1 To Projet.SujetsDangersCount
                    Set SujetDanger = Projet.SujetDanger(j)
                    If Not SujetDanger.Effacé And Sujet.id = SujetDanger.Sujet Then
                        If DéjàUneEntete Then
                            'une section par sujet/danger, les noms d'étape, de sujet et de sujetdanger
                            'sont mis dans l'entête pour répétition sur chaque page
                            AppWord.InsertionSaut 2
                            AppWord.FinDocument
                        End If
                        'entete de section
                        AppWord.AffichageEnTête
                        'entete indépendante entre sections
                        If DéjàUneEntete Then
                            'If Not LiaisonEntete Then
                                AppWord.LiaisonEnTêtePiedPage
                                LiaisonEntete = True
                            'End If
                            'pour supprimer le texte récopié de l'entete précédente
                            For k = 1 To 10
                                AppWord.EtendreSélection
                            Next
                        End If
                        WordInsérerEntête AppWord, Etape, Sujet, SujetDanger
                        AppWord.AffichageEnTête
                        DéjàUneEntete = True
                        'WordStyle AppWord, "sujetdanger"
                        'AppWord.Insertion SujetDanger.Nom & vbCrLf
                        If SujetDanger.EnfantsCount > 0 Then
                            'remplissage du tableau à partir des points à maitriser
                            WordInsérerTableau AppWord, SujetDanger, NIVEAU_POINT_A_MAITRISER, NIVEAU_ENREGISTREMENT, StatusMin, StatusMin + (i - 1) * (StatusMax - StatusMin) / Etape.EnfantsCount
                        Else
                            'pas de points à maitriser
                            WordStyle AppWord, "normal"
                            AppWord.Insertion vbCrLf & "Pas de " & Module.Niveau(NIVEAU_POINT_A_MAITRISER)
                        End If
                    End If
                Next
            End If
        End If
        UpdateStatus StatusMin + i * (StatusMax - StatusMin) / Etape.EnfantsCount
    Next
    
End Sub




Private Sub InsérerTableauDocuments(ByVal Donnée As Object)

Dim fmt As String
Dim tbl As String
Dim i As Integer

    'entete de tableau
    vsPrinter.FontBold = True
    fmt = "4000|4000;"
    tbl = fmt & "Fichier|Titre;"
    vsPrinter.Table = tbl
    
    'corps du tableau
    vsPrinter.FontBold = False
    For i = 1 To Donnée.DocumentsCount
        If i = 1 Then
            tbl = fmt & Donnée.DocumentFichier(i) & "|" & Donnée.DocumentTitre(i) & ";"
        Else
            tbl = tbl & Donnée.DocumentFichier(i) & "|" & Donnée.DocumentTitre(i) & ";"
        End If
    Next
    vsPrinter.Table = tbl

End Sub

Private Sub ImprimerShémaVie(ByVal NewPrinter As Integer, ByVal Titre As String)

Dim fmt As String
Dim tbl As String

    If NewPrinter Then
        vsPrinter.Preview = chkAperçu.Value
        vsPrinter.Action = 3    'début de transfert
        If vsPrinter.Error Then
            Exit Sub
        End If
        InitHautEtBasDePage
    End If
    
    vsPrinter.IndentLeft = 0
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.FontSize = 16
    vsPrinter.FontUnderline = True
    vsPrinter.Paragraph = Titre
    vsPrinter.FontUnderline = False
    vsPrinter.FontSize = 10
    vsPrinter.FontBold = False
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    
    'entete de tableau
    vsPrinter.FontBold = True
    fmt = "2600|2600|2600|2600;"
    tbl = fmt & Module.Niveau(NIVEAU_ETAPE) & "|" & Module.Niveau(NIVEAU_SUJET_DANGER) & " (Critique) |" & Module.Niveau(NIVEAU_POINT_A_MAITRISER) & " (Critique)|Commentaire;"
    vsPrinter.Table = tbl
    
    'corps du tableau
    vsPrinter.FontBold = False
    Dim Etape As Donnee
    Dim Sujet As Donnee
    Dim SujetDanger As SujetDanger
    Dim Donnée As Donnee
    Dim TitreEtape  As String
    Dim i As Integer
    Dim j As Integer
    Dim k As Integer
    Dim m As Integer
    Dim Premier As Integer
    Premier = True
    For i = 1 To Projet.EtapesCount
        Set Etape = Projet.Etape(i)
        TitreEtape = Etape.Titre
        For j = 1 To Etape.EnfantsCount
            Set Sujet = Etape.Enfant(j)
            For k = 1 To Projet.SujetsDangersCount
                Set SujetDanger = Projet.SujetDanger(k)
                If Not SujetDanger.Effacé And SujetDanger.Criticité = "OUI" And SujetDanger.Sujet = Sujet.id Then
                    For m = 1 To SujetDanger.EnfantsCount
                        Set Donnée = SujetDanger.Enfant(m)
                        If Donnée.Criticité = "OUI" Then
                            If Premier Then
                                tbl = fmt & TitreEtape & "|" & SujetDanger.Titre & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")|" & Donnée.Titre & "|" & Donnée.Commentaire & ";"
                                Premier = False
                            Else
                                tbl = tbl & TitreEtape & "|" & SujetDanger.Titre & " (" & Projet.Danger(SujetDanger.Danger).Spécificité & ")|" & Donnée.Titre & "|" & Donnée.Commentaire & ";"
                            End If
                            TitreEtape = ""
                        End If
                    Next
                End If
            Next
        Next
    Next
    vsPrinter.Table = tbl

    If NewPrinter Then
        vsPrinter.Action = 6    'fin de transfert
    End If

End Sub

Private Sub lstAffichages_DblClick()
    btnImprimer_Click
End Sub

Private Sub optSélection_Click(Index As Integer)
    optSélection(0).Tag = Index
    RefreshBoutons
End Sub



Private Sub ImprimerPlusieursOnglets()

Dim i As Integer
Dim prem As Integer
Dim dern As Integer

    'imprimer avec vsPrinter les onglets sélectionnés
    prem = -1
    dern = -1
    For i = 0 To lstAffichages.ListCount - 1
        If prem <> -1 And lstAffichages.Selected(i) Then
            'dernier onglet sélectionné
            dern = i
        End If
        If prem = -1 And lstAffichages.Selected(i) Then
            'premier onglet sélectionné
            prem = i
            dern = i
        End If
    Next
    If prem <> -1 Then
        'au moins un onglet sélectionné
        If dern = prem Then
            'un seul onglet sélectionné
            ImprimerOnglet True, lstAffichages.ListIndex
        Else
            For i = 0 To lstAffichages.ListCount - 1
                If lstAffichages.Selected(i) Then
                    If i = prem Then
                        'démarrage d'impression
                        vsPrinter.Preview = chkAperçu.Value
                        vsPrinter.Action = 3    'début de transfert
                        If vsPrinter.Error Then
                            Exit Sub
                        End If
                        InitHautEtBasDePage
                        'impression du premier onglet
                        ImprimerOnglet False, i
                    Else
                        'impression des onglets suivants
                        vsPrinter.Action = 4 'NewPage
                        ImprimerOnglet False, i
                        If i = dern Then
                            'sortie des pages
                            vsPrinter.Action = 6    'fin de transfert
                        End If
                    End If
                End If
            Next
        End If
    End If

End Sub

Private Sub WordHautEtBasPage(AppWord As Object)

Dim ch As String

    WordStyle AppWord, "entete"
    AppWord.AffichageEnTête
    ch = GetChaineCrLf("TitreImp") & Chr$(9) & Chr$(9)
    If bLicenceOk Then
        ch = ch & GetConfig(SECTION_CONFIG_LICENCE, KEY_CONFIG_UTILISATEUR) & " " & GetConfig(SECTION_CONFIG_LICENCE, KEY_CONFIG_NUM_SERIE)
    Else
        ch = ch & "Mode d'évaluation"
    End If
    AppWord.Insertion ch
    AppWord.AffichageEnTête
    AppWord.InsertionNumPage 1, 2
    AppWord.AffichagePiedPage
    AppWord.Insertion Projet.FichierProjet & " " & Projet.Titre & " (" & Projet.Référence & "," & Format$(Projet.DateModification(), "dd/mm/yy") & ") "
    AppWord.AffichagePiedPage
    
End Sub
