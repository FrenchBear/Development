VERSION 4.00
Begin VB.Form FormModule 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Form1"
   ClientHeight    =   5205
   ClientLeft      =   75
   ClientTop       =   1515
   ClientWidth     =   9435
   ForeColor       =   &H80000008&
   Height          =   5610
   Left            =   15
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   5205
   ScaleWidth      =   9435
   Top             =   1170
   Width           =   9555
   Begin TabDlg.SSTab SSTab1 
      Height          =   5055
      Left            =   0
      TabIndex        =   27
      Top             =   0
      Width           =   9375
      _version        =   65536
      _extentx        =   16536
      _extenty        =   8916
      _stockprops     =   15
      caption         =   "Pertinences Dangers"
      BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
         name            =   "Arial Narrow"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      tabsperrow      =   6
      tab             =   4
      taborientation  =   1
      tabs            =   6
      style           =   1
      tabmaxwidth     =   0
      tabheight       =   529
      tabcaption(0)   =   "Général"
      tab(0).controlcount=   1
      tab(0).controlenabled=   0   'False
      tab(0).control(0)=   "Panel(0)"
      tabcaption(1)   =   "Textes"
      tab(1).controlcount=   1
      tab(1).controlenabled=   0   'False
      tab(1).control(0)=   "Panel(1)"
      tabcaption(2)   =   "Suggestions"
      tab(2).controlcount=   1
      tab(2).controlenabled=   0   'False
      tab(2).control(0)=   "Panel(2)"
      tabcaption(3)   =   "Natures et spécificités"
      tab(3).controlcount=   1
      tab(3).controlenabled=   0   'False
      tab(3).control(0)=   "Panel(3)"
      tabcaption(4)   =   "Pertinences Dangers"
      tab(4).controlcount=   1
      tab(4).controlenabled=   -1  'True
      tab(4).control(0)=   "Panel(4)"
      tabcaption(5)   =   "Criticité Dangers"
      tab(5).controlcount=   1
      tab(5).controlenabled=   0   'False
      tab(5).control(0)=   "Panel(5)"
      Begin Threed.SSPanel Panel 
         Height          =   4455
         Index           =   0
         Left            =   -74880
         TabIndex        =   28
         Top             =   120
         Width           =   9015
         _version        =   65536
         _extentx        =   15901
         _extenty        =   7858
         _stockprops     =   15
         BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
            name            =   "MS Sans Serif"
            charset         =   1
            weight          =   700
            size            =   8.25
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         bevelouter      =   0
         Begin VB.TextBox txtAide 
            Height          =   315
            Left            =   2220
            TabIndex        =   3
            Top             =   1200
            Width           =   2475
         End
         Begin VB.TextBox txtLogo 
            Height          =   315
            Left            =   2220
            TabIndex        =   2
            Top             =   840
            Width           =   2475
         End
         Begin VB.TextBox txtNom 
            Height          =   315
            Left            =   2220
            MaxLength       =   8
            TabIndex        =   0
            Top             =   120
            Width           =   2475
         End
         Begin VB.TextBox txtTitre 
            Height          =   315
            Left            =   2220
            TabIndex        =   1
            Top             =   480
            Width           =   4755
         End
         Begin FPSpread.vaSpread SpreadDocSujet 
            Height          =   2415
            Left            =   4200
            TabIndex        =   48
            Top             =   1680
            Width           =   4695
            _version        =   131077
            _extentx        =   8281
            _extenty        =   4260
            _stockprops     =   64
            colsfrozen      =   1
            displayrowheaders=   0   'False
            editmodereplace =   -1  'True
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            maxcols         =   2
            maxrows         =   50
            processtab      =   -1  'True
            scrollbarextmode=   -1  'True
            spreaddesigner  =   "MODCHILD.frx":0000
            visiblecols     =   500
            visiblerows     =   500
         End
         Begin FPSpread.vaSpread SpreadNiveaux 
            Height          =   2415
            Left            =   120
            TabIndex        =   4
            Top             =   1680
            Width           =   4035
            _version        =   131077
            _extentx        =   7117
            _extenty        =   4260
            _stockprops     =   64
            colsfrozen      =   1
            displayrowheaders=   0   'False
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            maxcols         =   1
            maxrows         =   11
            scrollbarextmode=   -1  'True
            spreaddesigner  =   "MODCHILD.frx":0162
            visiblecols     =   500
            visiblerows     =   500
         End
         Begin VB.Label Label4 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Aide spécifique (HLP)"
            ForeColor       =   &H80000008&
            Height          =   210
            Left            =   120
            TabIndex        =   36
            Top             =   1260
            Width           =   2175
         End
         Begin VB.Label Label3 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Fichier logo (BMP)"
            ForeColor       =   &H80000008&
            Height          =   210
            Left            =   120
            TabIndex        =   31
            Top             =   900
            Width           =   1755
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Nom (8 lettres max):"
            ForeColor       =   &H80000008&
            Height          =   210
            Left            =   120
            TabIndex        =   30
            Top             =   180
            Width           =   1815
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Titre:"
            ForeColor       =   &H80000008&
            Height          =   210
            Left            =   120
            TabIndex        =   29
            Top             =   540
            Width           =   855
         End
      End
      Begin Threed.SSPanel Panel 
         Height          =   3615
         Index           =   1
         Left            =   -74880
         TabIndex        =   32
         Top             =   120
         Width           =   8775
         _version        =   65536
         _extentx        =   15478
         _extenty        =   6376
         _stockprops     =   15
         BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
            name            =   "MS Sans Serif"
            charset         =   1
            weight          =   700
            size            =   8.25
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         bevelouter      =   0
         Begin FPSpread.vaSpread SpreadTextes 
            Height          =   3405
            Left            =   0
            TabIndex        =   5
            Top             =   0
            Width           =   8700
            _version        =   131077
            _extentx        =   15346
            _extenty        =   6006
            _stockprops     =   64
            colsfrozen      =   1
            displayrowheaders=   0   'False
            editmodereplace =   -1  'True
            BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
               name            =   "MS Sans Serif"
               charset         =   1
               weight          =   400
               size            =   8.25
               underline       =   0   'False
               italic          =   0   'False
               strikethrough   =   0   'False
            EndProperty
            maxcols         =   3
            maxrows         =   7
            processtab      =   -1  'True
            scrollbarextmode=   -1  'True
            spreaddesigner  =   "MODCHILD.frx":02B3
            visiblecols     =   500
            visiblerows     =   500
         End
      End
      Begin Threed.SSPanel Panel 
         Height          =   4575
         Index           =   2
         Left            =   -74880
         TabIndex        =   33
         Top             =   0
         Width           =   8775
         _version        =   65536
         _extentx        =   15478
         _extenty        =   8070
         _stockprops     =   15
         BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
            name            =   "MS Sans Serif"
            charset         =   1
            weight          =   700
            size            =   8.25
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         bevelouter      =   0
         Begin VB.Frame Frame2 
            Caption         =   "Affichage"
            Height          =   855
            Left            =   0
            TabIndex        =   47
            Top             =   0
            Width           =   1935
            Begin VB.OptionButton OptAffichage 
               Caption         =   "Disp. en place"
               Height          =   255
               Index           =   0
               Left            =   330
               TabIndex        =   6
               Tag             =   "1"
               Top             =   225
               Width           =   1455
            End
            Begin VB.OptionButton OptAffichage 
               Caption         =   "Arbre HACCP"
               Height          =   255
               Index           =   1
               Left            =   330
               TabIndex        =   7
               Top             =   510
               Value           =   -1  'True
               Width           =   1470
            End
         End
         Begin VB.Frame FrameSuggestions 
            Caption         =   "Suggestions"
            Height          =   3705
            Left            =   0
            TabIndex        =   38
            Top             =   870
            Width           =   8655
            Begin FPSpread.vaSpread SpreadSuggestions 
               Height          =   3375
               Left            =   960
               TabIndex        =   49
               Top             =   240
               Width           =   7455
               _version        =   131077
               _extentx        =   13150
               _extenty        =   5953
               _stockprops     =   64
               displayrowheaders=   0   'False
               editmodereplace =   -1  'True
               BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
                  name            =   "MS Sans Serif"
                  charset         =   1
                  weight          =   700
                  size            =   8.25
                  underline       =   0   'False
                  italic          =   0   'False
                  strikethrough   =   0   'False
               EndProperty
               maxcols         =   5
               maxrows         =   1000
               processtab      =   -1  'True
               scrollbarextmode=   -1  'True
               spreaddesigner  =   "MODCHILD.frx":0447
               unittype        =   2
            End
            Begin Threed.SSCommand btnDeplaceSuggestion 
               Height          =   750
               Index           =   1
               Left            =   120
               TabIndex        =   9
               Top             =   255
               Width           =   750
               _version        =   65536
               _extentx        =   1323
               _extenty        =   1323
               _stockprops     =   78
               caption         =   "-> Haut"
               bevelwidth      =   1
               autosize        =   2
               picture         =   "MODCHILD.frx":0594
            End
            Begin Threed.SSCommand btnDeplaceSuggestion 
               Height          =   750
               Index           =   3
               Left            =   120
               TabIndex        =   10
               Top             =   1050
               Width           =   750
               _version        =   65536
               _extentx        =   1323
               _extenty        =   1323
               _stockprops     =   78
               caption         =   "-> Bas"
               bevelwidth      =   1
               autosize        =   2
               picture         =   "MODCHILD.frx":0BF6
            End
            Begin Threed.SSCommand btnEffaceSuggestion 
               Height          =   870
               Left            =   120
               TabIndex        =   12
               Top             =   2745
               Width           =   735
               _version        =   65536
               _extentx        =   1296
               _extenty        =   1535
               _stockprops     =   78
               caption         =   "Supprimer"
               bevelwidth      =   1
               autosize        =   1
               picture         =   "MODCHILD.frx":1258
            End
            Begin Threed.SSCommand btnInsererSuggestion 
               Height          =   870
               Left            =   120
               TabIndex        =   11
               Top             =   1845
               Width           =   735
               _version        =   65536
               _extentx        =   1296
               _extenty        =   1535
               _stockprops     =   78
               caption         =   "Ajouter"
               bevelwidth      =   1
               autosize        =   1
               picture         =   "MODCHILD.frx":1AAA
            End
         End
         Begin VB.ComboBox lstNiveaux 
            Height          =   315
            Left            =   2040
            Style           =   2  'Dropdown List
            TabIndex        =   8
            Tag             =   "-1"
            Top             =   270
            Width           =   6615
         End
         Begin VB.Label Label5 
            Caption         =   "Niveau de données:"
            Height          =   255
            Left            =   2040
            TabIndex        =   37
            Top             =   30
            Width           =   1815
         End
      End
      Begin Threed.SSPanel Panel 
         Height          =   3615
         Index           =   3
         Left            =   -74880
         TabIndex        =   34
         Top             =   120
         Width           =   8775
         _version        =   65536
         _extentx        =   15478
         _extenty        =   6376
         _stockprops     =   15
         BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
            name            =   "MS Sans Serif"
            charset         =   1
            weight          =   700
            size            =   8.25
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         bevelouter      =   0
         Begin VB.Frame FrameSpecificites 
            Caption         =   "Spécificités"
            Height          =   3615
            Left            =   2280
            TabIndex        =   40
            Top             =   0
            Width           =   2415
            Begin VB.ListBox ListeSpécificités 
               Height          =   2955
               Left            =   1080
               TabIndex        =   20
               Top             =   360
               Width           =   1095
            End
            Begin Threed.SSCommand btnModifierSpécificité 
               Height          =   870
               Left            =   120
               TabIndex        =   19
               Top             =   2280
               Visible         =   0   'False
               Width           =   855
               _version        =   65536
               _extentx        =   1508
               _extenty        =   1535
               _stockprops     =   78
               caption         =   "Modifier"
               bevelwidth      =   1
               autosize        =   1
               picture         =   "MODCHILD.frx":22FC
            End
            Begin Threed.SSCommand btnAjouterSpécificité 
               Height          =   870
               Left            =   120
               TabIndex        =   17
               Top             =   360
               Width           =   855
               _version        =   65536
               _extentx        =   1508
               _extenty        =   1535
               _stockprops     =   78
               caption         =   "Ajouter"
               bevelwidth      =   1
               autosize        =   1
               picture         =   "MODCHILD.frx":2B4E
            End
            Begin Threed.SSCommand btnEffaceSpecificite 
               Height          =   870
               Left            =   120
               TabIndex        =   18
               Top             =   1320
               Width           =   855
               _version        =   65536
               _extentx        =   1508
               _extenty        =   1535
               _stockprops     =   78
               caption         =   "Supprimer"
               bevelwidth      =   1
               autosize        =   1
               picture         =   "MODCHILD.frx":33A0
            End
         End
         Begin VB.Frame FrameNatures 
            Caption         =   "Natures"
            Height          =   3615
            Left            =   0
            TabIndex        =   39
            Top             =   0
            Width           =   2175
            Begin VB.ListBox ListeNatures 
               Height          =   2955
               Left            =   1080
               TabIndex        =   16
               Top             =   360
               Width           =   975
            End
            Begin Threed.SSCommand btnModifierNature 
               Height          =   870
               Left            =   120
               TabIndex        =   15
               Top             =   2280
               Visible         =   0   'False
               Width           =   855
               _version        =   65536
               _extentx        =   1508
               _extenty        =   1535
               _stockprops     =   78
               caption         =   "Modifier"
               bevelwidth      =   1
               autosize        =   1
               picture         =   "MODCHILD.frx":3BF2
            End
            Begin Threed.SSCommand btnAjouterNature 
               Height          =   870
               Left            =   120
               TabIndex        =   13
               Top             =   360
               Width           =   855
               _version        =   65536
               _extentx        =   1508
               _extenty        =   1535
               _stockprops     =   78
               caption         =   "Ajouter"
               bevelwidth      =   1
               autosize        =   1
               picture         =   "MODCHILD.frx":9C52
            End
            Begin Threed.SSCommand btnEffaceNature 
               Height          =   870
               Left            =   120
               TabIndex        =   14
               Top             =   1320
               Width           =   855
               _version        =   65536
               _extentx        =   1508
               _extenty        =   1535
               _stockprops     =   78
               caption         =   "Supprimer"
               bevelwidth      =   1
               autosize        =   1
               picture         =   "MODCHILD.frx":A4A4
            End
         End
      End
      Begin Threed.SSPanel Panel 
         Height          =   4515
         Index           =   4
         Left            =   120
         TabIndex        =   35
         Top             =   120
         Width           =   9135
         _version        =   65536
         _extentx        =   16113
         _extenty        =   7964
         _stockprops     =   15
         BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
            name            =   "MS Sans Serif"
            charset         =   1
            weight          =   700
            size            =   8.25
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         bevelouter      =   0
         Begin VB.Frame FrameQuestionsPertinence 
            Caption         =   "Questionnaire d'évaluation de la pertinence d'un danger"
            Height          =   3615
            Left            =   0
            TabIndex        =   41
            Top             =   0
            Width           =   9135
            Begin VB.ComboBox lstSpécificités 
               Height          =   315
               Left            =   5040
               Style           =   2  'Dropdown List
               TabIndex        =   22
               Top             =   345
               Width           =   3015
            End
            Begin VB.ComboBox lstNatures 
               Height          =   315
               Left            =   960
               Style           =   2  'Dropdown List
               TabIndex        =   21
               Top             =   345
               Width           =   2895
            End
            Begin FPSpread.vaSpread SpreadQuestionsPertinence 
               Height          =   2655
               Left            =   1035
               TabIndex        =   25
               Top             =   840
               Width           =   7995
               _version        =   131077
               _extentx        =   14102
               _extenty        =   4683
               _stockprops     =   64
               colsfrozen      =   1
               displayrowheaders=   0   'False
               editmodereplace =   -1  'True
               BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
                  name            =   "MS Sans Serif"
                  charset         =   1
                  weight          =   400
                  size            =   8.25
                  underline       =   0   'False
                  italic          =   0   'False
                  strikethrough   =   0   'False
               EndProperty
               maxcols         =   4
               maxrows         =   120
               processtab      =   -1  'True
               scrollbarextmode=   -1  'True
               spreaddesigner  =   "MODCHILD.frx":ACF6
               unittype        =   2
               visiblecols     =   500
               visiblerows     =   500
            End
            Begin Threed.SSCommand btnInsérerQuestPertinence 
               Height          =   870
               Left            =   90
               TabIndex        =   23
               Top             =   840
               Width           =   855
               _version        =   65536
               _extentx        =   1508
               _extenty        =   1535
               _stockprops     =   78
               caption         =   "&Ajouter"
               bevelwidth      =   1
               autosize        =   1
               picture         =   "MODCHILD.frx":AEE6
            End
            Begin VB.Label Label7 
               Caption         =   "Spécificité:"
               Height          =   255
               Left            =   3960
               TabIndex        =   43
               Top             =   345
               Width           =   1095
            End
            Begin VB.Label Label6 
               Caption         =   "Nature:"
               Height          =   255
               Left            =   120
               TabIndex        =   42
               Top             =   345
               Width           =   1095
            End
            Begin Threed.SSCommand btnSupprimerQuestPertinence 
               Height          =   870
               Left            =   90
               TabIndex        =   24
               Top             =   1770
               Width           =   855
               _version        =   65536
               _extentx        =   1508
               _extenty        =   1535
               _stockprops     =   78
               caption         =   "&Supprimer"
               bevelwidth      =   1
               autosize        =   1
               picture         =   "MODCHILD.frx":B738
            End
         End
      End
      Begin Threed.SSPanel Panel 
         Height          =   4515
         Index           =   5
         Left            =   -74880
         TabIndex        =   44
         Top             =   120
         Width           =   9135
         _version        =   65536
         _extentx        =   16113
         _extenty        =   7964
         _stockprops     =   15
         BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
            name            =   "MS Sans Serif"
            charset         =   1
            weight          =   700
            size            =   8.25
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         bevelouter      =   0
         Begin VB.Frame FrameQuestionsCriticité 
            Caption         =   "Questionnaire d'arbre HACCP"
            Height          =   4425
            Left            =   0
            TabIndex        =   45
            Top             =   0
            Width           =   9135
            Begin VB.ComboBox lstNiveauxCriticité 
               Height          =   315
               Left            =   135
               Style           =   2  'Dropdown List
               TabIndex        =   26
               Tag             =   "-1"
               Top             =   555
               Width           =   4665
            End
            Begin FPSpread.vaSpread SpreadQuestionsCriticité 
               Height          =   3405
               Left            =   180
               TabIndex        =   50
               Top             =   960
               Width           =   8700
               _version        =   131077
               _extentx        =   15346
               _extenty        =   6006
               _stockprops     =   64
               colsfrozen      =   1
               displayrowheaders=   0   'False
               editmodereplace =   -1  'True
               BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
                  name            =   "MS Sans Serif"
                  charset         =   1
                  weight          =   400
                  size            =   8.25
                  underline       =   0   'False
                  italic          =   0   'False
                  strikethrough   =   0   'False
               EndProperty
               maxcols         =   2
               maxrows         =   8
               processtab      =   -1  'True
               scrollbarextmode=   -1  'True
               spreaddesigner  =   "MODCHILD.frx":BF8A
               unittype        =   2
               visiblecols     =   500
               visiblerows     =   500
            End
            Begin VB.Label Label9 
               Caption         =   "Niveau de données:"
               Height          =   255
               Left            =   135
               TabIndex        =   46
               Top             =   315
               Width           =   2775
            End
         End
      End
   End
End
Attribute VB_Name = "FormModule"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'objet module associé à la feuille
Public Module As New Module

'propriétés utilisée par OuvrirModule
'répertoire du module à charger dans Form_Load
Public RépertoireModuleACharger As String
'nom du module à charger dans Form_Load (nom du sous-répertoire ou MODULEi pour un nouveau module)
Public NomModuleACharger As String

'à mettre à true pour ignorer les modifications de module au déchargement de la feuille
Public IgnorerModification As Integer

'flag indiquant que les noms des niveaux de données ont été modifiés:
'il faut alors mettre à jour les onglets qui les utilise
Private bNiveauxModifiés As Integer

'flag pour éviter le transfert des questions de pertinences
Private InterditTransfertQuestionsDansModule   As Integer


'changement d'onglet depuis le menu Affichage
'entrée:
'   index de l'onglet
Public Sub MnuFichierAffichageClick(ByVal IndexTab As Integer)

    Dim i As Integer
    'démarque tous les affichages
    For i = 0 To 5
        FormMain.MnuAffichage(i).Checked = False
    Next
    'marque l'affichage correspondant à l'onglet
    FormMain.MnuAffichage(IndexTab).Checked = True
    'et change d'onglet
    SSTAB1.Tab = IndexTab
    
End Sub

'le titre de la fenêtre contient des informations sur le module et l'onglet en cours
Private Sub ChangeTitreFenetre()

    Me.Caption = UCase$(Module.Nom) & " (" & Module.Titre & ") - " & SSTAB1.Caption

End Sub

'fermeture de la fenêtre depuis le menu Fichier/Fermer
Public Sub MnuFichierFermerClick()

    Unload Me

End Sub


'remplissage du spread de questionnaire de criticité
'entrée:
'   niveaux de données du questionnaire à afficher
Sub RemplitSpreadQuestionsCriticité(ByVal IndexlstNiveauxCriticité As Integer)

Dim i As Integer

    'vide le spread
    With Me.SpreadQuestionsCriticité
        .Row = 1
        .Row2 = Me.SpreadQuestionsCriticité.MaxRows
        .Col = 1
        .Col2 = 1
        .BlockMode = True
        .Action = SS_ACTION_CLEAR_TEXT
        .BlockMode = False
        .Col = 1
    End With
    
    If IndexlstNiveauxCriticité < 0 Then
        'pas de niveau de données sélectionné
        Exit Sub
    End If
    'remplissage du spread
    For i = 1 To Module.QuestionsCriticitéCount()
        With Me.SpreadQuestionsCriticité
            .Row = i
            .Col = 1
            .Text = Format$(i)
            .Col = 2
            .Text = Module.QuestionCriticité(IndexlstNiveauxCriticité + 1, i)
        End With
    Next
    With Me.SpreadQuestionsCriticité
        .Row = 1
        .Col = 1
        .Action = SS_ACTION_ACTIVE_CELL
        .Refresh
    End With

End Sub

'Transfert du contenu des onglets dans l'objet Module
Function TransfertDonneesSaisiesDansModule() As Integer

Dim i As Integer
Dim cr As Integer

    TransfertDonneesSaisiesDansModule = False
    
    'Onglet Général
    If Trim$(Me.txtNom.Text) = "" Then
        ErreurUserBox "La saisie du nom du module est obligatoire.", MB_ICONEXCLAMATION
        Me.SetFocus
        Me.SSTAB1.Tab = 0
        Me.txtNom.SetFocus
        Exit Function
    End If
    Module.Nom = Me.txtNom.Text
    
    'saisie du titre obligatoire pour qu'il apparaisse dans la liste des modules de HACCP
    If Trim$(Me.txtTitre.Text) = "" Then
        ErreurUserBox "La saisie du titre du module est obligatoire.", MB_ICONEXCLAMATION
        Me.SetFocus
        Me.SSTAB1.Tab = 0
        Me.txtTitre.SetFocus
        Exit Function
    End If
    Module.Titre = Me.txtTitre.Text
    
    Module.FichierLogo = Me.txtLogo.Text
    Module.FichierAide = Me.txtAide.Text
    
    'liste des niveaux
    TransfertNiveauxDansModule

    'sujet de documentation
    TransfertSujetDocDansModule
    
    'onglet textes abrégés
    Dim Titre As String
    For i = 1 To Me.SpreadTextes.MaxRows
        Me.SpreadTextes.Row = i
        Me.SpreadTextes.Col = 2
        Titre = Me.SpreadTextes.Text
        Me.SpreadTextes.Col = 3
        Module.SetAffichage i, Titre, Me.SpreadTextes.Text
    Next
    
    'onglet suggestions
    TransfertSuggestionsDansModule Me.lstNiveaux.ListIndex, Val(optAffichage(0).Tag)
     
    'onglet natures et spécificités
    'transfert déjà fait
    
    'onglet questions pertinence
    TransfertQuestionsPertinenceDansModule Me.lstNatures.ListIndex, Me.lstSpécificités.ListIndex
    
    'onglet Questions Criticité
    TransfertQuestionsCriticitéDansModule Me.lstNiveauxCriticité.ListIndex
    
    TransfertDonneesSaisiesDansModule = True

End Function


'transfert des noms de niveaux de données dans l'objet module
Private Sub TransfertNiveauxDansModule()

Dim i As Integer
Dim chNiveau As String

    Me.SpreadNiveaux.Col = 1
    For i = 1 To Me.SpreadNiveaux.MaxRows
        Me.SpreadNiveaux.Row = i
        chNiveau = Trim$(Me.SpreadNiveaux.Text)
        'affecte le module attaché à la feuille
        Module.SetNiveau i, chNiveau
    Next


End Sub

' transfert des sujets de documentation dans l'objet module
Private Sub TransfertSujetDocDansModule()

Dim i As Integer
Dim n As Integer

    n = 1
    With SpreadDocSujet
        .Col = 1
        For i = 1 To .MaxRows
            .Row = i
            .Col = 2
            If .Text <> "" Then
                'topic
                Module.DocSujetTopic(n) = Val(.Text)
                .Col = 1
                'titre
                Module.DocSujetTitre(n) = .Text
                n = n + 1
            End If
        Next
    End With
    'nombre de sujet de documentation
    Module.DocSujetCount = n - 1

End Sub


'transfert du questionnaire de criticité dans l'objet module
'entrée:
'   index du niveau de donnée du questionnaire
Sub TransfertQuestionsCriticitéDansModule(ByVal IndexlstNiveauxCriticité As Integer)

Dim i As Integer
Dim Question As String

    If IndexlstNiveauxCriticité < 0 Then
        Exit Sub
    End If
    Me.SpreadQuestionsCriticité.MaxRows = Module.QuestionsCriticitéCount
    For i = 1 To Me.SpreadQuestionsCriticité.MaxRows
        Me.SpreadQuestionsCriticité.Row = i
        Me.SpreadQuestionsCriticité.Col = 2
        Module.SetQuestionCriticité IndexlstNiveauxCriticité + 1, i, Trim$(Me.SpreadQuestionsCriticité.Text)
    Next

End Sub

'transfert du questionnaire de pertinence dans l'objet module
'entrée:
'   index de la nature dans la liste des natures
'   index de la spécificité dans la liste des spécificités
Sub TransfertQuestionsPertinenceDansModule(ByVal IndexlstNatures As Integer, ByVal IndexLstSpécificités As Integer)

Dim i As Integer
Dim Id As String
Dim Question As String
Dim RéponseOui As String
Dim RéponseNon As String
Dim Spécificité As Specificite

    If IndexlstNatures < 0 Or IndexLstSpécificités < 0 Then
        Exit Sub
    End If
    
    'spécificité à laquelle on ajoute les questions réponses
    Set Spécificité = Module.Natures.Item(Me.lstNatures.List(IndexlstNatures)).Spécificités.Item(Me.lstSpécificités.List(IndexLstSpécificités))
    
    'efface les questions de la spécificité
    Spécificité.QuestPertinencesClear
    
    For i = 1 To Me.SpreadQuestionsPertinence.MaxRows
        Me.SpreadQuestionsPertinence.Row = i
        Me.SpreadQuestionsPertinence.Col = 1
        Id = Me.SpreadQuestionsPertinence.Text
        If Id <> "" Then
            Me.SpreadQuestionsPertinence.Col = 2
            Question = Trim$(Me.SpreadQuestionsPertinence.Text)
            Me.SpreadQuestionsPertinence.Col = 3
            RéponseOui = GetTypeReponsePertinence(Me.SpreadQuestionsPertinence.Text)
            Me.SpreadQuestionsPertinence.Col = 4
            RéponseNon = GetTypeReponsePertinence(Me.SpreadQuestionsPertinence.Text)
            Spécificité.QuestPertinences.Add Id, Question, RéponseOui, RéponseNon
        End If
    Next

End Sub


'enregistrement du module attaché à la feuille à partir du menu Fichier/Enregistrer
Public Function MnuFichierEnregistrerClick() As Integer

    HourGlass "show"

    MnuFichierEnregistrerClick = True

    If Not TransfertDonneesSaisiesDansModule() Then
        'annulation si les données saisies ne sont pas valides
        MnuFichierEnregistrerClick = False
        HourGlass "hide"
        Exit Function
    End If

    If Module.Répertoire <> "" Then
        'le module a déjà été enregistré
        If Module.Nom <> UCase$(GetFichierSansChemin(Module.Répertoire)) Then
            'en cas de changement de nom d'un module déjà enregistré
            HourGlass "hide"
            MnuFichierEnregistrerClick = MnuFichierEnregistrerSousClick("Le nom du module a changé. Choisissez un répertoire ou enregistrer le module.")
        Else
            'sauvegarde du module
            SauverModule
            'le titre de fenêtre contient le nom du fichier
            ChangeTitreFenetre
            HourGlass "hide"
        End If
        MetAJourMenus
        Exit Function
    End If
    
    'cas ou le module n'a pas encore été enregistré
    HourGlass "hide"
    MnuFichierEnregistrerClick = MnuFichierEnregistrerSousClick("Le module n'a pas encore été enregistré. Choisissez le répertoire ou enregistrer le module.")
    MetAJourMenus
    
End Function




'transfert des suggestions dans l'objet module
'entrée:
'   index du niveau de donnée
'   affichage (arbre haccp ou dispositions en place)
Private Sub TransfertSuggestionsDansModule(ByVal Index As Integer, ByVal Affichage As Integer)

Dim i As Integer
Dim j As Integer
Dim n As Integer
Dim chSuggestion As String
Dim chDescription As String
Dim bEffacée As Integer
Dim bRemplacée As Integer
Dim bAjoutée As Integer

    j = lstNiveaux.ItemData(Index)
    n = 0
    
    'efface toute les suggestions d'un niveau
    Module.SuggestionsClear j, Affichage, True
    
    'recrée les suggestions du spread
    With Me.SpreadSuggestions
        For i = 1 To .MaxRows
            .Row = i
            .Col = 1
            chSuggestion = Trim$(.Text)
            .Col = 2
            chDescription = Trim$(.Text)
            .Col = 3
            bAjoutée = Trim$(.Text) = "X"
            .Col = 4
            bEffacée = Trim$(.Text) = "X"
            .Col = 5
            bRemplacée = Trim$(.Text) = "X"
            If chSuggestion <> "" Then
                n = n + 1
                Module.AddSuggestion j, chSuggestion, chDescription, n, Val(Me.optAffichage(0).Tag), bAjoutée, bEffacée, bRemplacée
            End If
        Next
    End With
    
End Sub


'remplissage des ongletsà partir de l'objet module
Sub TransfertModuleDansOnglets()

Dim i As Integer

    'onglet Général
    Me.txtNom.Text = Module.Nom
    Me.txtTitre.Text = Module.Titre
    Me.txtLogo.Text = Module.FichierLogo
    Me.txtAide.Text = Module.FichierAide

    'liste de niveaux
    With SpreadNiveaux
        .Col = 1
        .MaxRows = Module.NiveauxCount
        For i = 1 To Module.NiveauxCount
            .Row = i
            .Text = Module.Niveau(i)
        Next
    End With
    RemplitLstNiveaux

    'sujets de documentation
    With SpreadDocSujet
        .MaxRows = Module.DocSujetMax
        For i = 1 To .MaxRows
            If i <= Module.DocSujetCount Then
                .Row = i
                .Col = 1
                .Text = Module.DocSujetTitre(i)
                .Col = 2
                .Text = Module.DocSujetTopic(i)
            Else
                .Row = i
                .Col = 1
                .Text = ""
                .Col = 2
                .Text = ""
            End If
        Next
    End With
    

    'onglet Textes
    Me.SpreadTextes.Col = 2
    For i = 1 To Module.AffichagesCount
        Me.SpreadTextes.Row = i
        Me.SpreadTextes.Text = Module.AffichageTitre(i)
    Next
    Me.SpreadTextes.Col = 3
    For i = 1 To Module.AffichagesCount
        Me.SpreadTextes.Row = i
        Me.SpreadTextes.Text = Module.AffichageCommentaire(i)
    Next

    'Onglet Suggestions
    RemplitSpreadSuggestions Me.lstNiveaux.ListIndex, Val(Me.optAffichage(0).Tag)

    'onglet Natures et spécificités et listes de l'onglet Questions Pertinences
    RemplitListeNatures 'et spécificités
    RemplitLstNatures   'et spécificités et questions pertinence
    
    'onglet Questions Pertinence
    RemplitSpreadQuestionsPertinence Me.lstNatures.ListIndex, Me.lstSpécificités.ListIndex
    
    'onglet Questions Criticité
    RemplitSpreadQuestionsCriticité Me.lstNiveauxCriticité.ListIndex
    
    'onglet par défaut
    Me.SSTAB1.Tab = 0
    
End Sub



'remplissage du spread des suggestions à partir de l'objet module
'entrée:
'   index du niveau de donnée
'   affichage (arbre HACCP ou dispositions en place)
Public Sub RemplitSpreadSuggestions(ByVal Index As Integer, ByVal Affichage As Integer)

Dim i As Integer
Dim j As Integer
Dim Niveau As Integer
Dim n As Integer

    Niveau = Me.lstNiveaux.ItemData(Index)
    'vide le spread
    With Me.SpreadSuggestions
        .Row = 1
        .Row2 = Me.SpreadSuggestions.MaxRows
        .Col = 1
        .Col2 = Me.SpreadSuggestions.MaxCols
        .BlockMode = True
        .Action = SS_ACTION_CLEAR_TEXT
        .BlockMode = False
        .Col = 1
    End With
    'remplit le spread
    n = Module.SuggestionsCount(Niveau, Affichage)
    '2 * n suggestions possible (minimum 1000)
    If 2 * n > SpreadSuggestions.MaxRows Then
        SpreadSuggestions.MaxRows = 2 * n
    End If
    For i = 1 To n
        With Me.SpreadSuggestions
            .Row = i
            .Col = 1
            .Text = Module.Suggestion(Niveau, i, Affichage)
            .Col = 2
            .Text = Module.SuggestionDescription(Niveau, i, Affichage)
            .Col = 3
            .Text = IIf(Module.SuggestionAjoutée(Niveau, i, Affichage) <> 0, "X", "")
            .Col = 4
            .Text = IIf(Module.SuggestionEffacée(Niveau, i, Affichage) <> 0, "X", "")
            .Col = 5
            .Text = IIf(Module.SuggestionRemplacée(Niveau, i, Affichage) <> 0, "X", "")
        End With
    Next
    Me.SpreadSuggestions.Refresh
End Sub

'ajout d'une nature
Private Sub btnAjouterNature_Click()

Dim chNature As String
Dim Nature As Nature

    'saisie de la nouvelle nature
    chNature = InputBox("Entrez une nouvelle nature", NomApplication, "")
    If chNature = "" Then
        Exit Sub
    End If
    
    'ajoute la nature à la liste, doublons non autorisés
    If Not Module.Natures.Add(chNature) Is Nothing Then
        ListeNatures.AddItem chNature
        ListeNatures.ListIndex = ListeNatures.NewIndex
        'mise à jour de la liste des natures de l'onglet des questions de pertinence
        RemplitLstNatures
        Module.Salit
    End If
    
End Sub



'ajout d'une spécificité
Private Sub btnAjouterSpécificité_Click()

Dim chSpécificité As String
Dim i As Integer

    'pas de nature sélectionnée
    If Me.ListeNatures.ListIndex = -1 Then
        Exit Sub
    End If

    chSpécificité = InputBox("Entrez une nouvelle spécificité", NomApplication, "")
    If chSpécificité = "" Then
        Exit Sub
    End If
    
    'ajoute la spécificité à la liste
    If Not Module.Natures.Item(Me.ListeNatures).Spécificités.Add(chSpécificité) Is Nothing Then
        ListeSpécificités.AddItem chSpécificité
        ListeSpécificités.ListIndex = ListeSpécificités.NewIndex
        'mise à jour de la liste des spécificités de l'onglet des questions de pertinence
        RemplitLstSpécificités lstNatures.ListIndex
        Module.Salit
    End If
    
End Sub


'déplacement d'une suggestion
'entrée:
'   sens du déplacement (1 vers le haut, 3 vers le bas)
Private Sub btnDeplaceSuggestion_Click(Index As Integer)

Dim t1 As String, t2 As String
Dim drow As Integer
Dim c As Integer
Dim ci As Integer
Dim ri As Integer

    With SpreadSuggestions
        drow = Index - 2
        ri = .ActiveRow
        ci = .ActiveCol
        For c = 1 To .MaxCols
            If (drow = -1 And ri > 1) Or (drow = 1 And ri < SpreadSuggestions.MaxRows) Then
                .Col = c
                .Row = ri
                t1 = .Text
                .Row = .Row + drow
                t2 = .Text
                .Text = t1
                .Row = .Row - drow
                .Text = t2
            End If
        Next
        .Row = ri + drow
        .Col = ci
        .Action = 0
    End With

End Sub

'efface la nature sélectionnée dans la liste ListeNatures
Private Sub btnEffaceNature_Click()

Dim idRep As Integer
Dim i As Integer
Dim Nature As Nature

    If ListeNatures.ListIndex >= 0 Then
        'nature à effacer
        Set Nature = Module.Natures.Item(ListeNatures)
        'confirmation opérateur
        idRep = MsgBox("L'effacement de la nature '" & Nature.Libellé & "' effacera les spécificités et questionnaires associés. Voulez-vous continuer ?", MB_YESNO Or MB_ICONEXCLAMATION, NomApplication)
        If idRep = IDYES Then
            'effacement dans le module
            Module.Natures.Delete ListeNatures
            'effacement dans la liste de natures
            i = ListeNatures.ListIndex
            ListeNatures.RemoveItem ListeNatures.ListIndex
            If i = ListeNatures.ListCount Then
                ListeNatures.ListIndex = ListeNatures.ListCount - 1
            Else
                ListeNatures.ListIndex = i
            End If
            'mise à jour des spécificités de la nouvelle nature active
            RemplitListeSpécificités ListeNatures.ListIndex
            InterditTransfertQuestionsDansModule = True
            RemplitLstNatures 'et spécificités
            InterditTransfertQuestionsDansModule = False
            Module.Salit
        End If
    End If

End Sub




'efface la spécificité sélectionnée dans la liste ListeSpécificités
Private Sub btnEffaceSpecificite_Click()

Dim CodeSpécificité As Integer
Dim idRep As Integer
Dim i As Integer

    If ListeSpécificités.ListIndex >= 0 Then
        idRep = MsgBox("L'effacement de la spécificité '" & ListeSpécificités & "' effacera les questionnaires associés. Voulez-vous continuer ?", MB_YESNO Or MB_ICONEXCLAMATION, NomApplication)
        If idRep = IDYES Then
            'efface la spécificité dans le module
            Module.Natures.Item(Me.ListeNatures).Spécificités.Delete ListeSpécificités
            'efface la spécificité dans la liste déroulante
            i = ListeSpécificités.ListIndex
            ListeSpécificités.RemoveItem ListeSpécificités.ListIndex
            If i = ListeSpécificités.ListCount Then
                ListeSpécificités.ListIndex = ListeSpécificités.ListCount - 1
            End If
            'mise à jour de la liste des spécificités de l'onglet des questions de pertinence
            RemplitLstSpécificités lstNatures.ListIndex
            Module.Salit
        End If
    End If

End Sub


'efface une suggession du spread des suggestions
Private Sub btnEffaceSuggestion_Click()

    SpreadOteLigne SpreadSuggestions
    
End Sub

'insère une question de pertinence vierge dans le spread
Private Sub btnInsérerQuestPertinence_Click()

    SpreadInsereLigneBlanche SpreadQuestionsPertinence

End Sub

'insère une suggestion vierge dans le spread
Private Sub btnInsererSuggestion_Click()

    SpreadInsereLigneBlanche SpreadSuggestions

End Sub



'modification du libellé d'une nature
Private Sub btnModifierNature_Click()
    ListeNatures_DblClick
End Sub

'modification du libellé d'une spécificité
Private Sub btnModifierSpécificité_Click()
    ListeSpécificités_DblClick
End Sub

'suppression d'une question de pertinence dans le spread
Private Sub btnSupprimerQuestPertinence_Click()

    SpreadOteLigne SpreadQuestionsPertinence

End Sub

'initialisation d'une feuille de module
'entrée:
'   - attribut RépertoireModuleACharger vide pou un nouveau module ou initialisé
'   avec un répertoire de module existant
'   - attribut NomModuleACharger avec un nom unique de module
Private Sub Form_Load()
    
    Left = (Forms.Count - 2) * 330
    Top = Left
    Width = FormMain.ScaleWidth - Left
    Height = FormMain.ScaleHeight - Top
    
    If RépertoireModuleACharger = "" Then
        'Nouveau module
        Module.Nom = NomModuleACharger
        'remplissage des niveaux de données du module avec valeurs par défaut
        Dim i As Integer
        For i = 1 To Module.NiveauxCount
            Module.SetNiveau i, GetConfig(SECTION_NIVEAUX_DONNEES, KEY_NIVEAU_DONNEE & i)
        Next
        'remplissage des noms d'affichage du module avec valeurs par défaut
        For i = 1 To Module.AffichagesCount
            Module.SetAffichage i, GetConfig(SECTION_AFFICHAGES, KEY_AFFICHAGE & i), ""
        Next
        'remplissage du questionnaire de criticité avec valeurs par défaut
        Dim j As Integer
        For i = 1 To Module.NiveauxCriticitéCount
            For j = 1 To Module.QuestionsCriticitéCount
                Module.SetQuestionCriticité i, j, GetConfig(SECTION_MODULE_QUESTIONS_CRITICITE, KEY_MODULE_QUESTION_CRITICITE & i & "," & j)
            Next
        Next
    Else
        'charge un module
        Module.Load RépertoireModuleACharger, NomModuleACharger
    End If
    RemplitLstNiveauxCriticité
    
    'affiche les données du module
    TransfertModuleDansOnglets
    
    ChangeTitreFenetre
    Tag = RépertoireModuleACharger
    SSTAB1.Tab = 0
    FormMain.MnuAffichage(0).Checked = True
    
    'initialisation des spreads
    With SpreadNiveaux
        .Row = 0
        .Col = 1
        .Text = "Niveaux de données"
        .ColWidth(1) = 34
    End With
    With SpreadDocSujet
        .Row = 0
        .Col = 1
        .Text = "Sujet de documentation"
        .Col = 2
        .Text = "Context ID"
        .ColWidth(1) = 25
        .ColWidth(2) = 12
    End With
    With SpreadTextes
        .Row = 0
        .Col = 1
        .Text = "Affichage"
        .Col = 2
        .Text = "Titre Affichage"
        .Col = 3
        .Text = "Commentaire"
        .ColWidth(1) = 21
        .ColWidth(2) = 18
        .ColWidth(3) = 38
        For i = 1 To Module.AffichagesCount
            .Col = 1
            .Row = i
            .Text = GetConfig(SECTION_AFFICHAGES, KEY_AFFICHAGE & i)
            .RowHeight(i) = 30
        Next
    End With
    With SpreadSuggestions
        .Row = 0
        .Col = 1
        .Text = "Suggestion"
        .Col = 2
        .Text = "Description"
        .Col = 3
        .Text = "Ajoutée"
        .Col = 4
        .Text = "Effacée"
        .Col = 5
        .Text = "Remplacée"
        .ColWidth(1) = 3000
        .ColWidth(2) = 3000
        .ColWidth(3) = 1000
        .ColWidth(4) = 1000
        .ColWidth(5) = 1000
    End With
    With SpreadQuestionsPertinence
        .Row = 0
        .Col = 1
        .Text = "n°"
        .Col = 2
        .Text = "Question"
        .Col = 3
        .Text = "Oui"
        .Col = 4
        .Text = "Non"
        .ColWidth(1) = 500
        .ColWidth(2) = 4725
        .ColWidth(3) = 1305
        .ColWidth(4) = 1305
    End With
    With SpreadQuestionsCriticité
        .Row = 0
        .Col = 1
        .Text = "n°"
        .Col = 2
        .Text "Questions (Pensez que les réponses sont OUI ou NON)"
        .ColWidth(1) = 500
        .ColWidth(2) = 8700
        Dim l As Integer
        For l = 1 To .MaxRows
            .RowHeight(l) = 400
        Next
    End With
    
    'le module est marqué non modifié malgré les changements effectués dans cette initialisation
    Module.ModifieNon
    
    MetAJourMenus
    
End Sub


'remplissage de la liste des natures de l'onglet Natures et Spécificités
Sub RemplitListeNatures()

Dim i As Integer
Dim n As Integer

    'remplissage de la liste de natures
    Me.ListeNatures.Clear
    For i = 1 To Module.Natures.Count
         Me.ListeNatures.AddItem Module.Natures.Item(i).Libellé
    Next

    'sélectionne la première nature
    If Me.ListeNatures.ListCount <> 0 Then
        If Me.ListeNatures.ListIndex = 0 Then
            RemplitListeSpécificités Me.ListeNatures.ListIndex
        Else
            Me.ListeNatures.ListIndex = 0
        End If
    Else
        'pour effacer la liste de spécificités quand il n'y a pas de nature
        RemplitListeSpécificités -1
    End If

End Sub



'remplissage de la liste de spécificités de l'onglet Natures et Spécificités
'entrée:
'   index de la nature sélectionnée dans ListeNatures
Sub RemplitListeSpécificités(ByVal IndexListeNatures As Integer)

Dim i As Integer
Dim Nature As Nature

    Me.ListeSpécificités.Clear
    If IndexListeNatures < 0 Then
        Exit Sub
    End If
    Set Nature = Module.Natures.Item(Me.ListeNatures)
    
    For i = 1 To Nature.Spécificités.Count
        Me.ListeSpécificités.AddItem Nature.Spécificités.Item(i).Libellé
    Next
    If Me.ListeSpécificités.ListCount <> 0 Then
        Me.ListeSpécificités.ListIndex = 0
    End If

End Sub




'remplissage de la liste des natures de l'onglet de pertinences
Sub RemplitLstNatures()

Dim i As Integer
Dim n As Integer

    'remplissage de la liste de natures
    Me.lstNatures.Clear
    For i = 1 To Module.Natures.Count
         Me.lstNatures.AddItem Module.Natures.Item(i).Libellé
    Next
    
    'sélectionne la première nature
    If Me.lstNatures.ListCount <> 0 Then
        If Me.lstNatures.ListIndex = 0 Then
            RemplitLstSpécificités Me.lstNatures.ListIndex
        Else
            Me.lstNatures.ListIndex = 0
        End If
    Else
        'pour effacer la liste de spécificités quand il n'y a pas de nature
        RemplitLstSpécificités -1
    End If

End Sub


'remplissage de la liste des spécificités de l'onglet de pertinences
'entrée:
'   index de la nature sélectionnée dans lstNatures
Sub RemplitLstSpécificités(ByVal IndexlstNatures As Integer)

Dim i As Integer
Dim Nature As Nature

    'efface d'abord la liste
    Me.lstSpécificités.Clear
    If IndexlstNatures >= 0 Then
        Set Nature = Module.Natures.Item(Me.lstNatures)
        For i = 1 To Nature.Spécificités.Count
            Me.lstSpécificités.AddItem Nature.Spécificités.Item(i).Libellé
        Next
    End If
    If Me.lstSpécificités.ListCount <> 0 Then
        If Me.lstSpécificités.ListIndex = 0 Then
            RemplitSpreadQuestionsPertinence IndexlstNatures, Me.lstSpécificités.ListIndex
        Else
            Me.lstSpécificités.ListIndex = 0
        End If
        Me.SpreadQuestionsPertinence.Enabled = True
    Else
        'pour vider le spread
        RemplitSpreadQuestionsPertinence IndexlstNatures, -1
        Me.SpreadQuestionsPertinence.Enabled = False
    End If

End Sub



'remplit le spread de questions pertinences à partir de l'objet module
'entrée:
'   index de la nature
'   index de la spécificité
Sub RemplitSpreadQuestionsPertinence(ByVal IndexlstNatures As Integer, ByVal IndexLstSpécificités As Integer)

Dim i As Integer
Dim Spécificité As Specificite

    'vide le spread
    With Me.SpreadQuestionsPertinence
        .Row = 1
        .Row2 = Me.SpreadQuestionsPertinence.MaxRows
        .Col = 1
        .Col2 = 4
        .BlockMode = True
        .Action = SS_ACTION_CLEAR_TEXT
        .BlockMode = False
        .Col = 1
    End With
    
    If IndexlstNatures < 0 Or IndexLstSpécificités < 0 Then
        'pas de nature ou de spécificité
        Exit Sub
    End If
    Set Spécificité = Module.Natures.Item(Me.lstNatures).Spécificités.Item(Me.lstSpécificités)
    For i = 1 To Spécificité.QuestPertinences.Count
        With Me.SpreadQuestionsPertinence
            .Row = i
            .Col = 1
            .Text = Spécificité.QuestPertinences.Item(i).Id
            .Col = 2
            .Text = Spécificité.QuestPertinences.Item(i).Question
            .Col = 3
            .Text = SetLibelléRéponsePertinence(Spécificité.QuestPertinences.Item(i).RéponseOui)
            .Col = 4
            .Text = SetLibelléRéponsePertinence(Spécificité.QuestPertinences.Item(i).RéponseNon)
        End With
    Next

    With Me.SpreadQuestionsPertinence
        .Row = 1
        .Col = 1
        .Action = SS_ACTION_ACTIVE_CELL
    End With

End Sub



'déchargement de la feuille
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

Dim Message As String
Dim Filename As String
Dim reponse As Integer
Dim cr As Integer

    If Module.Modifié And Not IgnorerModification Then
        'sauvegarde du module modifié ?
        Message = "Le module a été modifié." & CrLf & " Voulez-vous l'enregistrer ?"
        reponse = MsgBox(Message, MB_ICONQUESTION Or MB_YESNOCANCEL, NomApplication)
        Select Case reponse
            Case IDYES
                'sauvegarde
                If Not MnuFichierEnregistrerClick() Then
                    Cancel = True
                End If
            Case IDNO
            Case IDCANCEL
                Cancel = True
        End Select
    End If
    
End Sub

'erngistrement du module sous un nouveau nom de puis le menu Fichier/Enregistrer Sous
'entrée:
'   message affiché à l'opérateur
Public Function MnuFichierEnregistrerSousClick(ByVal Message As String) As Integer

Dim chRepertoire As String
Dim cr As Integer

    MnuFichierEnregistrerSousClick = False

    'choix du répertoire contenant le sous-répertoire du module
    chRepertoire = ChoixRepertoireExistant(Message, NomApplication, RepertoireApplication)
    If chRepertoire <> "" Then
        On Error Resume Next
        If right$(chRepertoire, 1) = "\" Then
            chRepertoire = SuppLastChar(chRepertoire, 1)
        End If
        ChDir chRepertoire & "\" & Module.Nom
        If Err Then
            If Err = 76 Then
                'création du répertoire
                cr = MsgBox("Le répertoire " & UCase$(chRepertoire & "\" & Module.Nom) & " n'existe pas." & CrLf & CrLf & "Voulez-vous le créer ?", MB_ICONQUESTION Or MB_YESNO, NomApplication)
                If cr = IDYES Then
                    MkDir chRepertoire & "\" & Module.Nom
                Else
                    'abandon
                    Exit Function
                End If
            End If
        End If
        If ExisteFichier(chRepertoire & "\" & Module.Nom & "\" & FICHIER_MODULE_INI) Then
            'recouvrement d'un module existant
            cr = MsgBox("Le répertoire choisi contient déjà un module. Ce module sera perdu si vous choisissez de le remplacer." & CrLf & CrLf & "Voulez-vous remplacer le module existant ?", MB_ICONQUESTION Or MB_YESNO, NomApplication)
            If cr = IDNO Then
                Exit Function
            End If
        End If
        'sauvegarde du module
        Module.Répertoire = chRepertoire & "\" & Module.Nom
        Module.FichierModule = Module.Répertoire & "\" & FICHIER_MODULE_INI
        SauverModule
        'le titre de la fenêtre contient le nom du sous-répertoire
        ChangeTitreFenetre
        MnuFichierEnregistrerSousClick = True
    End If
    
End Function


Private Sub Form_Resize()
    If WindowState <> 1 Then
        'retaillage des onglets
        SSTabResize
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)

    'module libéré
    Module.Free
    Set Module = Nothing
    
    'prépare une action MetAJourMenus après la fermeture de la fenêtre
    FormMain.TimerAction.Tag = "MetAJourMenus"
    FormMain.TimerAction.Enabled = True
    
End Sub


'choix d'une nature dans l'onglet des natures et spécificités
Private Sub ListeNatures_Click()

    RemplitListeSpécificités ListeNatures.ListIndex

End Sub

'modification d'une nature
Private Sub ListeNatures_DblClick()
        
Dim chNature As String
Dim Nature As Nature

    'saisie de la nouvelle nature
    chNature = InputBox("Changer la nature", NomApplication, ListeNatures)
    If chNature = "" Then
        Exit Sub
    End If
    
    'modifie la nature dans la liste, doublons non autorisés
    If Not Module.RenommerNature(ListeNatures, chNature) Is Nothing Then
        ListeNatures.List(ListeNatures.ListIndex) = chNature
        'mise à jour de la liste des natures de l'onglet des questions de pertinence
        RemplitLstNatures
        Module.Salit
    End If
    

End Sub


'modification d'une spécificité
Private Sub ListeSpécificités_DblClick()

Dim chSpécificité As String
Dim Spécificité As Specificite

    'saisie de la nouvelle nature
    chSpécificité = InputBox("Changer la spécificité", NomApplication, ListeSpécificités)
    If chSpécificité = "" Then
        Exit Sub
    End If
    
    'modifie la spécificité dans la liste, doublons non autorisés
    If Not Module.RenommerSpécificité(ListeNatures, ListeSpécificités, chSpécificité) Is Nothing Then
        ListeSpécificités.List(ListeSpécificités.ListIndex) = chSpécificité
        'mise à jour de la liste des natures de l'onglet des questions de pertinence
        RemplitLstSpécificités lstNatures.ListIndex
        Module.Salit
    End If

End Sub

'choix d'une nature dans l'onglet de pertinence
Private Sub lstNatures_Click()

    If Val(lstNatures.Tag) <> -1 And InterditTransfertQuestionsDansModule = False Then
        'met les questions de pertinences modifiées dans le module
        TransfertQuestionsPertinenceDansModule Val(Me.lstNatures.Tag), Me.lstSpécificités.ListIndex
    End If
    InterditTransfertQuestionsDansModule = True
    'liste de spécificités de la nouvelle nature
    RemplitLstSpécificités lstNatures.ListIndex
    InterditTransfertQuestionsDansModule = False
    lstNatures.Tag = Format$(lstNatures.ListIndex)
    SpreadQuestionsPertinence.Refresh
    
End Sub


Private Sub lstNatures_KeyUp(KeyCode As Integer, Shift As Integer)
    SpreadQuestionsPertinence.Refresh
End Sub

'choix d'un niveau de données dans l'onglet des suggestions
Private Sub lstNiveaux_Click()

    If Val(lstNiveaux.Tag) <> -1 Then
        'mémorise les suggestions modifiées dans le module
        TransfertSuggestionsDansModule Val(lstNiveaux.Tag), Val(optAffichage(0).Tag)
    End If
    'nouvelles suggestions
    RemplitSpreadSuggestions lstNiveaux.ListIndex, Val(Me.optAffichage(0).Tag)
    lstNiveaux.Tag = Format$(lstNiveaux.ListIndex)
    
End Sub





Private Sub lstNiveaux_KeyUp(KeyCode As Integer, Shift As Integer)
    SpreadSuggestions.Refresh
End Sub

'choix d'un niveau dans l'onglet de criticité
Private Sub lstNiveauxCriticité_Click()

    If Val(lstNiveauxCriticité.Tag) <> -1 Then
        'mémorise les questions saisies dans le module
        TransfertQuestionsCriticitéDansModule Val(lstNiveauxCriticité.Tag)
    End If
    'nouvelles questions de criticité
    RemplitSpreadQuestionsCriticité lstNiveauxCriticité.ListIndex
    lstNiveauxCriticité.Tag = Format$(lstNiveauxCriticité.ListIndex)
    
End Sub


'choix d'une spécificité dans l'onglet de pertinence
Private Sub lstSpécificités_Click()

    If Val(lstSpécificités.Tag) <> -1 And Not InterditTransfertQuestionsDansModule Then
        'mémorise les questions dans le module
        TransfertQuestionsPertinenceDansModule Val(lstNatures.Tag), Val(lstSpécificités.Tag)
    End If
    'nouvelle questions pertinence
    RemplitSpreadQuestionsPertinence lstNatures.ListIndex, lstSpécificités.ListIndex
    lstSpécificités.Tag = Format$(lstSpécificités.ListIndex)
    SpreadQuestionsPertinence.Refresh
    
End Sub





Private Sub lstSpécificités_KeyUp(KeyCode As Integer, Shift As Integer)
    SpreadQuestionsPertinence.Refresh
End Sub

'choix d'un affichage dans l'onglet des suggestions
Private Sub optAffichage_Click(Index As Integer)

    'mémorise les suggestions dans le module
    TransfertSuggestionsDansModule Val(lstNiveaux.Tag), Val(optAffichage(0).Tag)
    'nouvelle suggestions
    RemplitSpreadSuggestions lstNiveaux.ListIndex, Index
    optAffichage(0).Tag = Format$(Index)

End Sub

Private Sub SpreadDocSujet_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    SpreadDocSujet.Refresh
End Sub


'modification du libellé d'un niveau
Private Sub SpreadNiveaux_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = KEY_DEL Then
        Module.Salit
        bNiveauxModifiés = True
    End If
End Sub

'modification du libellé d'un niveau
Private Sub SpreadNiveaux_KeyPress(KeyAscii As Integer)
    Module.Salit
    bNiveauxModifiés = True
End Sub


Private Sub SpreadNiveaux_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    SpreadNiveaux.Refresh
End Sub

'modification d'une question de criticité
Private Sub SpreadQuestionsCriticité_KeyDown(KeyCode As Integer, Shift As Integer)

    If Me.SpreadQuestionsCriticité.EditMode Then
        If KeyCode = KEY_DEL Then Module.Salit
    End If

End Sub


'modification d'une question de criticité
Private Sub SpreadQuestionsCriticité_KeyPress(KeyAscii As Integer)
    If Me.SpreadQuestionsCriticité.EditMode Then
        Module.Salit
    End If
End Sub


Private Sub SpreadQuestionsCriticité_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    SpreadQuestionsCriticité.Refresh
End Sub

Private Sub SpreadQuestionsPertinence_Click(ByVal Col As Long, ByVal Row As Long)
    SpreadQuestionsPertinence.Refresh
End Sub

'modification d'une question de pertinence
Private Sub SpreadQuestionsPertinence_KeyDown(KeyCode As Integer, Shift As Integer)
    If Me.SpreadQuestionsPertinence.EditMode Then
        If KeyCode = KEY_DEL Then Module.Salit
    End If
End Sub

'modification d'une question de pertinence
Private Sub SpreadQuestionsPertinence_KeyPress(KeyAscii As Integer)
    If Me.SpreadQuestionsPertinence.EditMode Then
        Module.Salit
    End If
End Sub

Private Sub SpreadQuestionsPertinence_KeyUp(KeyCode As Integer, Shift As Integer)
    SpreadQuestionsPertinence.Refresh
End Sub

Private Sub SpreadQuestionsPertinence_LostFocus()
    MetAJourMenus
End Sub

Private Sub SpreadQuestionsPertinence_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    SpreadQuestionsPertinence.Refresh
End Sub

'modification d'une suggestion
Private Sub SpreadSuggestions_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = KEY_DEL Then Module.Salit
End Sub

'modification d'une suggestion
Private Sub SpreadSuggestions_KeyPress(KeyAscii As Integer)
    Module.Salit
End Sub

Private Sub SpreadSuggestions_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    SpreadSuggestions.Refresh
End Sub

'modification d'un texte
Private Sub SpreadTextes_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = KEY_DEL Then Module.Salit
End Sub

'modification d'un texte
Private Sub SpreadTextes_KeyPress(KeyAscii As Integer)
    Module.Salit
End Sub


Private Sub SpreadTextes_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    SpreadTextes.Refresh
End Sub

'changement d'onglet
Private Sub SSTab1_Click(PreviousTab As Integer)
    Panel(PreviousTab).Visible = False
    Panel(SSTAB1.Tab).Visible = True
    'change l'affichage marqué dans le menu Affichage
    FormMain.MnuAffichage(PreviousTab).Checked = False
    FormMain.MnuAffichage(SSTAB1.Tab).Checked = True
    ChangeTitreFenetre
    If PreviousTab = 0 And bNiveauxModifiés Then
        'modifie la liste déroulante de l'onglet de Suggestions
        'en faisant attention de sauvegarder les modifications effectuées dans cet onglet
        TransfertNiveauxDansModule
        TransfertSuggestionsDansModule Val(lstNiveaux.Tag), Val(optAffichage(0).Tag)
        RemplitLstNiveaux
        'modifie la liste déroulante de l'onglet de criticité
        TransfertQuestionsCriticitéDansModule lstNiveauxCriticité.ListIndex
        RemplitLstNiveauxCriticité
    End If
    SSTabResize
End Sub

'changement du fichier d'aide
Private Sub txtAide_Change()
    MetAJourMenus
End Sub

'changement du fichier d'aide
Private Sub txtAide_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = KEY_DEL Then Module.Salit
End Sub

'changement du fichier d'aide
Private Sub txtAide_KeyPress(KeyAscii As Integer)
    Module.Salit
End Sub

'fichier d'aide passe dans le module
Private Sub txtAide_LostFocus()
    Module.FichierAide = Me.txtAide.Text
End Sub

'changement du fichier de logo
Private Sub txtLogo_Change()
    MetAJourMenus
End Sub

Private Sub txtLogo_GotFocus()
    SelectionneZoneTexte txtLogo
End Sub

'changement du fichier de logo
Private Sub txtLogo_KeyPress(KeyAscii As Integer)
    Module.Salit
    MetAJourMenus
End Sub

Private Sub txtLogo_LostFocus()
    Module.FichierLogo = Me.txtLogo.Text
End Sub

Private Sub txtNom_Change()
    MetAJourMenus
End Sub

Private Sub txtNom_GotFocus()
    SelectionneZoneTexte txtNom
    txtNom.Tag = txtNom.Text
End Sub

'changement du nom de module
Private Sub txtNom_KeyDown(KeyCode As Integer, Shift As Integer)
    If KeyCode = KEY_DEL Then Module.Salit
End Sub

'changement du nom de module
Private Sub txtNom_KeyPress(KeyAscii As Integer)
    If KeyAscii <> 8 Then
        If Chr$(KeyAscii) = " " Or KeyAscii < 32 Then
            KeyAscii = 0
            Exit Sub
        End If
    End If
    KeyAscii = Asc(UCase$(Chr$(KeyAscii)))
    Module.Salit
    MetAJourMenus
End Sub

Private Sub txtNom_LostFocus()
    If txtNom.Tag <> txtNom.Text Then
        Module.Nom = txtNom.Text
        ChangeTitreFenetre
    End If
End Sub

Private Sub txtTitre_Change()
    MetAJourMenus
End Sub

Private Sub txtTitre_GotFocus()
    SelectionneZoneTexte txtTitre
    txtTitre.Tag = txtTitre.Text
End Sub

'changement du titre du module
Private Sub txtTitre_KeyPress(KeyAscii As Integer)
    Module.Salit
    MetAJourMenus
End Sub


'retaillage des contrôles dans les onglets
Private Sub SSTabResize()

Dim t As Integer
    t = SSTAB1.Tab
    Panel(t).Visible = False
    With SSTAB1
        .Left = 0
        .Top = 0
        .Width = Me.ScaleWidth
        .Height = Me.ScaleHeight
    End With
    
    Panel(t).Left = gap
    Panel(t).Top = gap
    Panel(t).Height = maxi(0, SSTAB1.Height - 2 * SSTAB1.TabHeight)
    Panel(t).Width = SSTAB1.Width - 2 * gap
    Select Case t
        Case 0
            ControleContreBas SpreadNiveaux, Panel(t)
        Case 1
            SpreadTextes.Height = Panel(t).Top + Panel(t).Height - SpreadTextes.Top - gap
            SpreadTextes.Width = Panel(t).Width
        Case 2
            FrameSuggestions.Height = maxi(0, Panel(t).Top + Panel(t).Height - FrameSuggestions.Top - gap)
            FrameSuggestions.Width = Panel(t).Width - FrameSuggestions.Left
            SpreadSuggestions.Width = maxi(0, FrameSuggestions.Width - SpreadSuggestions.Left - gap)
            SpreadSuggestions.Height = maxi(0, FrameSuggestions.Height - SpreadSuggestions.Top - gap)
            SpreadSuggestions.ColWidth(2) = SpreadSuggestions.Width - SpreadSuggestions.ColWidth(1) - 300
        Case 3
            ControleContreBas FrameNatures, Panel(t)
            FrameNatures.Width = (Panel(t).Width - 2 * gap) / 2
            ControleContreBas ListeNatures, FrameNatures
            ControleContreDroite ListeNatures, FrameNatures
            ControleContreBas FrameSpecificites, Panel(t)
            FrameSpecificites.Width = FrameNatures.Width
            FrameSpecificites.Left = FrameNatures.Left + FrameNatures.Width + gap
            ControleContreBas ListeSpécificités, FrameSpecificites
            ControleContreDroite ListeSpécificités, FrameSpecificites
        Case 4
            ControleContreBas FrameQuestionsPertinence, Panel(t)
            ControleContreDroite FrameQuestionsPertinence, Panel(t)
            ControleContreBas SpreadQuestionsPertinence, FrameQuestionsPertinence
            ControleContreDroite SpreadQuestionsPertinence, FrameQuestionsPertinence
        Case 5
            ControleContreBas FrameQuestionsCriticité, Panel(t)
            ControleContreDroite FrameQuestionsCriticité, Panel(t)
            ControleContreBas SpreadQuestionsCriticité, FrameQuestionsCriticité
            ControleContreDroite SpreadQuestionsCriticité, FrameQuestionsCriticité
            SpreadQuestionsCriticité.ColWidth(2) = SpreadQuestionsCriticité.Width - SpreadQuestionsCriticité.ColWidth(1) - 300
    End Select
    SSTAB1.Tab = t
    Panel(t).Visible = True
    SSTAB1.Visible = True

End Sub


'remplissage de la liste des niveaux dans l'onglet  des suggestions
Private Sub RemplitLstNiveaux()

Dim i As Integer
Dim n As Integer

    'remplissage de la liste déroulante de niveaux de données
    'les niveaux de données étapes et sujets n'apparaissent que si l'arbre HACCP est cliqué
    'et le niveau danger n'apparait jamais
    Me.lstNiveaux.Clear
    For i = 1 To Module.NiveauxCount
        Me.lstNiveaux.AddItem Module.Niveau(i)
        Me.lstNiveaux.ItemData(Me.lstNiveaux.NewIndex) = i
    Next
    
    'sélectionne le premier niveau
    If Me.lstNiveaux.ListCount <> 0 Then
        If Me.lstNiveaux.ListIndex = 0 Then
            RemplitSpreadSuggestions Me.lstNiveaux.ListIndex, Val(Me.optAffichage(0).Tag)
        Else
            Me.lstNiveaux.ListIndex = 0
        End If
    Else
        'pour effacer la liste de suggestion quand il n'y a pas de niveaux (anormal)
        RemplitSpreadSuggestions -1, Val(Me.optAffichage(0).Tag)
    End If

End Sub

Private Sub txtTitre_LostFocus()
    If txtTitre.Text <> txtTitre.Tag Then
        Module.Titre = txtTitre.Text
        ChangeTitreFenetre
    End If
End Sub


'remplissage de la liste des niveaux dans l'onglet de criticités
Private Sub RemplitLstNiveauxCriticité()

Dim Index As Integer

    'niveaux de données pour les questionnaires de criticité de dangers
    Index = maxi(0, lstNiveauxCriticité.ListIndex)
    lstNiveauxCriticité.Clear
    lstNiveauxCriticité.AddItem "Dangers"
    lstNiveauxCriticité.AddItem Module.Niveau(3)
    lstNiveauxCriticité.AddItem Module.Niveau(4)
    lstNiveauxCriticité.ListIndex = Index

End Sub
