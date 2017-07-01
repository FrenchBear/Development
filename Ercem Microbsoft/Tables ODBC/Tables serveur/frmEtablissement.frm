VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmEtablissement 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des établissements"
   ClientHeight    =   6630
   ClientLeft      =   135
   ClientTop       =   135
   ClientWidth     =   10155
   ClipControls    =   0   'False
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmEtablissement.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   442
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   677
   Tag             =   "Données"
   Begin VB.Frame fraFeuille 
      BackColor       =   &H008080FF&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   3075
      Index           =   4
      Left            =   3720
      TabIndex        =   162
      Top             =   1320
      Visible         =   0   'False
      Width           =   1155
      Begin VB.Frame fraAdr2 
         Caption         =   "Adresse secondaire (FME: CR n°2)"
         Height          =   2475
         Left            =   0
         TabIndex        =   309
         Top             =   0
         Width           =   8895
         Begin VB.TextBox txtChampVB 
            BackColor       =   &H8000000F&
            DataField       =   "^etb_bdist2"
            ForeColor       =   &H80000012&
            Height          =   315
            Index           =   15
            Left            =   2460
            MaxLength       =   37
            TabIndex        =   151
            Top             =   1320
            Width           =   4275
         End
         Begin VB.TextBox txtChampVB 
            BackColor       =   &H8000000F&
            DataField       =   "^etb_nom2"
            ForeColor       =   &H80000012&
            Height          =   315
            Index           =   27
            Left            =   1680
            MaxLength       =   41
            TabIndex        =   147
            Top             =   240
            Width           =   5055
         End
         Begin MSWLess.WLText txtChamp 
            DataField       =   "etb_cpost2"
            Height          =   315
            Index           =   10
            Left            =   1680
            TabIndex        =   150
            Top             =   1320
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            MaxLength       =   5
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtChamp 
            DataField       =   "etb_fax2"
            Height          =   315
            Index           =   11
            Left            =   3780
            TabIndex        =   153
            Top             =   1680
            Width           =   1995
            _ExtentX        =   3519
            _ExtentY        =   556
            _Version        =   393216
            MaxLength       =   16
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtChamp 
            DataField       =   "etb_corresp2"
            Height          =   315
            Index           =   17
            Left            =   1680
            TabIndex        =   154
            Top             =   2040
            Width           =   7095
            _ExtentX        =   12515
            _ExtentY        =   556
            _Version        =   393216
            MaxLength       =   49
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtChamp 
            DataField       =   "etb_tel2"
            Height          =   315
            Index           =   18
            Left            =   1680
            TabIndex        =   152
            Top             =   1680
            Width           =   2055
            _ExtentX        =   3625
            _ExtentY        =   556
            _Version        =   393216
            MaxLength       =   16
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtChamp 
            DataField       =   "etb_loc2"
            Height          =   315
            Index           =   24
            Left            =   1680
            TabIndex        =   149
            Top             =   960
            Width           =   5055
            _ExtentX        =   8916
            _ExtentY        =   556
            _Version        =   393216
            MaxLength       =   41
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtChamp 
            DataField       =   "etb_rue2"
            Height          =   315
            Index           =   26
            Left            =   1680
            TabIndex        =   148
            Top             =   600
            Width           =   5055
            _ExtentX        =   8916
            _ExtentY        =   556
            _Version        =   393216
            MaxLength       =   41
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Correspondant :"
            Height          =   210
            Index           =   14
            Left            =   60
            TabIndex        =   315
            Top             =   2100
            Width           =   1560
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Localité :"
            Height          =   210
            Index           =   18
            Left            =   60
            TabIndex        =   314
            Top             =   1020
            Width           =   855
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Tel / Fax :"
            Height          =   210
            Index           =   20
            Left            =   60
            TabIndex        =   313
            Top             =   1740
            Width           =   930
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "CPost / BD :"
            Height          =   210
            Index           =   21
            Left            =   60
            TabIndex        =   312
            Top             =   1380
            Width           =   1140
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Rue :"
            Height          =   210
            Index           =   22
            Left            =   60
            TabIndex        =   311
            Top             =   660
            Width           =   495
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Nom :"
            Height          =   210
            Index           =   23
            Left            =   60
            TabIndex        =   310
            Top             =   300
            Width           =   555
         End
      End
      Begin TablesServeur.BDCombo bdcFME 
         Height          =   330
         Left            =   1680
         TabIndex        =   164
         Top             =   2580
         Width           =   7215
         _ExtentX        =   12726
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_fme"
      End
      Begin TablesServeur.BDCombo bdcFEU 
         Height          =   330
         Left            =   1680
         TabIndex        =   165
         Top             =   2940
         Width           =   7215
         _ExtentX        =   12726
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_feu"
      End
      Begin TablesServeur.BDCombo bdcDécoupage 
         Height          =   330
         Left            =   1680
         TabIndex        =   167
         Top             =   3420
         Width           =   7215
         _ExtentX        =   12726
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "*etb_decoupage"
      End
      Begin TablesServeur.BDCheck bckCheck 
         Height          =   285
         Index           =   8
         Left            =   2520
         TabIndex        =   169
         Top             =   3840
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "*!etb_impdateana"
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Impression date analyse :"
         Height          =   210
         Index           =   109
         Left            =   0
         TabIndex        =   168
         Top             =   3900
         Width           =   2475
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Découpage :"
         Height          =   210
         Index           =   119
         Left            =   0
         TabIndex        =   166
         Top             =   3480
         Width           =   1200
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "FEU :"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   210
         Index           =   80
         Left            =   0
         MousePointer    =   10  'Up Arrow
         TabIndex        =   276
         ToolTipText     =   "Affiche la FEU correspondante"
         Top             =   3000
         Width           =   525
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "FME :"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   210
         Index           =   24
         Left            =   0
         MousePointer    =   10  'Up Arrow
         TabIndex        =   163
         Top             =   2640
         Width           =   540
      End
   End
   Begin VB.Frame fraFeuille 
      BackColor       =   &H00FF8080&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   735
      Index           =   2
      Left            =   1320
      TabIndex        =   51
      Top             =   1380
      Visible         =   0   'False
      Width           =   1455
      Begin TablesServeur.BDCombo bdcNiveauIntervenant 
         Height          =   330
         Left            =   1680
         TabIndex        =   98
         Top             =   4080
         Width           =   3315
         _ExtentX        =   5847
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_niveauinterv"
      End
      Begin VB.TextBox txtChampVB 
         BackColor       =   &H8000000F&
         DataField       =   "^etb_contraintes"
         ForeColor       =   &H80000012&
         Height          =   315
         Index           =   82
         Left            =   1680
         TabIndex        =   94
         Top             =   3120
         Width           =   7155
      End
      Begin TablesServeur.BDCheck bckCheck 
         Height          =   285
         Index           =   5
         Left            =   1680
         TabIndex        =   102
         Top             =   4800
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "!etb_avispassage"
      End
      Begin TablesServeur.BDCheck bckCheck 
         Height          =   285
         Index           =   7
         Left            =   3960
         TabIndex        =   104
         Top             =   4800
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "*!etb_fpstandard"
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "FP standard :"
         Height          =   210
         Index           =   120
         Left            =   2640
         TabIndex        =   103
         Top             =   4860
         Width           =   1275
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_debcontrat"
         Height          =   315
         Index           =   1
         Left            =   8400
         TabIndex        =   88
         Top             =   960
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Début contrat :"
         Height          =   210
         Index           =   102
         Left            =   6600
         TabIndex        =   87
         Top             =   1020
         Width           =   1440
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_dureecontrat"
         Height          =   315
         Index           =   4
         Left            =   8400
         TabIndex        =   90
         Top             =   1320
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Durée contrat :"
         Height          =   210
         Index           =   103
         Left            =   6600
         TabIndex        =   89
         Top             =   1380
         Width           =   1440
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_fincontrat"
         Height          =   315
         Index           =   8
         Left            =   8400
         TabIndex        =   92
         Top             =   1680
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Fin contrat :"
         Height          =   210
         Index           =   104
         Left            =   6600
         TabIndex        =   91
         Top             =   1740
         Width           =   1140
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Avis de passage :"
         Height          =   210
         Index           =   98
         Left            =   0
         TabIndex        =   101
         Top             =   4860
         Width           =   1680
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_fdr"
         Height          =   555
         Index           =   28
         Left            =   1680
         TabIndex        =   96
         Top             =   3480
         Width           =   7155
         _ExtentX        =   12621
         _ExtentY        =   979
         _Version        =   393216
         ScrollBars      =   2
         MultiLine       =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_presteh"
         Height          =   315
         Index           =   93
         Left            =   3840
         TabIndex        =   64
         Top             =   960
         Width           =   2595
         _ExtentX        =   4577
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_prestch"
         Height          =   315
         Index           =   92
         Left            =   3840
         TabIndex        =   84
         Top             =   2760
         Width           =   2595
         _ExtentX        =   4577
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_presthuiles"
         Height          =   315
         Index           =   91
         Left            =   3840
         TabIndex        =   80
         Top             =   2400
         Width           =   2595
         _ExtentX        =   4577
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_prestfs"
         Height          =   315
         Index           =   81
         Left            =   3840
         TabIndex        =   76
         Top             =   2040
         Width           =   2595
         _ExtentX        =   4577
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_prestlis"
         Height          =   315
         Index           =   56
         Left            =   3840
         TabIndex        =   72
         Top             =   1680
         Width           =   2595
         _ExtentX        =   4577
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_prestbs"
         Height          =   315
         Index           =   35
         Left            =   3840
         TabIndex        =   68
         Top             =   1320
         Width           =   2595
         _ExtentX        =   4577
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_prestan"
         Height          =   315
         Index           =   34
         Left            =   3840
         TabIndex        =   60
         Top             =   600
         Width           =   2595
         _ExtentX        =   4577
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_zone"
         Height          =   315
         Index           =   83
         Left            =   1680
         TabIndex        =   100
         Top             =   4440
         Width           =   3015
         _ExtentX        =   5318
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_datedebinterv"
         Height          =   315
         Index           =   80
         Left            =   8400
         TabIndex        =   86
         Top             =   600
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_prest"
         Height          =   315
         Index           =   79
         Left            =   1680
         TabIndex        =   53
         Top             =   0
         Width           =   4995
         _ExtentX        =   8811
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   40
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_freqeh"
         Height          =   315
         Index           =   49
         Left            =   2760
         TabIndex        =   63
         Top             =   960
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_nbreh"
         Height          =   315
         Index           =   48
         Left            =   1680
         TabIndex        =   62
         Top             =   960
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_freqch"
         Height          =   315
         Index           =   47
         Left            =   2760
         TabIndex        =   83
         Top             =   2760
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_nbrch"
         Height          =   315
         Index           =   46
         Left            =   1680
         TabIndex        =   82
         Top             =   2760
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_freqhuiles"
         Height          =   315
         Index           =   45
         Left            =   2760
         TabIndex        =   79
         Top             =   2400
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_nbrhuiles"
         Height          =   315
         Index           =   44
         Left            =   1680
         TabIndex        =   78
         Top             =   2400
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_freqfs"
         Height          =   315
         Index           =   43
         Left            =   2760
         TabIndex        =   75
         Top             =   2040
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_nbrfs"
         Height          =   315
         Index           =   42
         Left            =   1680
         TabIndex        =   74
         Top             =   2040
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_freqlis"
         Height          =   315
         Index           =   41
         Left            =   2760
         TabIndex        =   71
         Top             =   1680
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_nbrlis"
         Height          =   315
         Index           =   40
         Left            =   1680
         TabIndex        =   70
         Top             =   1680
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_freqbs"
         Height          =   315
         Index           =   39
         Left            =   2760
         TabIndex        =   67
         Top             =   1320
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_nbrbs"
         Height          =   315
         Index           =   38
         Left            =   1680
         TabIndex        =   66
         Top             =   1320
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_freqan"
         Height          =   315
         Index           =   37
         Left            =   2760
         TabIndex        =   59
         Top             =   600
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_nbran"
         Height          =   315
         Index           =   36
         Left            =   1680
         TabIndex        =   58
         Top             =   600
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Prestation"
         Height          =   210
         Index           =   82
         Left            =   3900
         TabIndex        =   56
         Top             =   360
         Width           =   975
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Fréquence"
         Height          =   210
         Index           =   81
         Left            =   2760
         TabIndex        =   55
         Top             =   360
         Width           =   990
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Nombre"
         Height          =   210
         Index           =   25
         Left            =   1740
         TabIndex        =   54
         Top             =   360
         Width           =   735
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "AB :"
         Height          =   210
         Index           =   34
         Left            =   0
         TabIndex        =   57
         Top             =   660
         Width           =   375
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Feuille de route :"
         Height          =   210
         Index           =   26
         Left            =   0
         TabIndex        =   95
         Top             =   3540
         Width           =   1605
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Zone :"
         Height          =   210
         Index           =   65
         Left            =   0
         TabIndex        =   99
         Top             =   4500
         Width           =   615
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Contraintes :"
         Height          =   210
         Index           =   64
         Left            =   0
         TabIndex        =   93
         Top             =   3180
         Width           =   1245
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Niveau interv. :"
         Height          =   210
         Index           =   63
         Left            =   0
         TabIndex        =   97
         Top             =   4140
         Width           =   1440
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Début prest. :"
         Height          =   210
         Index           =   62
         Left            =   6600
         TabIndex        =   85
         Top             =   660
         Width           =   1320
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Prestation :"
         Height          =   210
         Index           =   61
         Left            =   0
         TabIndex        =   52
         Top             =   60
         Width           =   1110
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "EH :"
         Height          =   210
         Index           =   40
         Left            =   0
         TabIndex        =   61
         Top             =   1020
         Width           =   390
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Ch :"
         Height          =   210
         Index           =   39
         Left            =   0
         TabIndex        =   81
         Top             =   2820
         Width           =   390
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Hu :"
         Height          =   210
         Index           =   38
         Left            =   0
         TabIndex        =   77
         Top             =   2460
         Width           =   390
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "FS :"
         Height          =   210
         Index           =   37
         Left            =   0
         TabIndex        =   73
         Top             =   2100
         Width           =   360
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Li :"
         Height          =   210
         Index           =   36
         Left            =   0
         TabIndex        =   69
         Top             =   1740
         Width           =   285
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "BS :"
         Height          =   210
         Index           =   35
         Left            =   0
         TabIndex        =   65
         Top             =   1380
         Width           =   375
      End
   End
   Begin VB.Frame fraFeuille 
      BackColor       =   &H00FF80FF&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   975
      Index           =   7
      Left            =   7260
      TabIndex        =   222
      Top             =   1320
      Visible         =   0   'False
      Width           =   1335
      Begin VB.Frame fraHiérarchie 
         Caption         =   "Hiérarchie"
         Height          =   2715
         Left            =   0
         TabIndex        =   244
         Top             =   2640
         Width           =   8835
         Begin MSWLess.WLText txtOptEd 
            Height          =   315
            Index           =   1
            Left            =   7200
            TabIndex        =   273
            TabStop         =   0   'False
            Top             =   1860
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtOptLabo 
            Height          =   315
            Index           =   1
            Left            =   7980
            TabIndex        =   272
            TabStop         =   0   'False
            Top             =   1860
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtOptEd 
            Height          =   315
            Index           =   0
            Left            =   7200
            TabIndex        =   271
            TabStop         =   0   'False
            Top             =   2280
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtOptLabo 
            Height          =   315
            Index           =   0
            Left            =   7980
            TabIndex        =   270
            TabStop         =   0   'False
            Top             =   2280
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtOptLabo 
            Height          =   315
            Index           =   5
            Left            =   7980
            TabIndex        =   260
            TabStop         =   0   'False
            Top             =   420
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtOptEd 
            Height          =   315
            Index           =   5
            Left            =   7200
            TabIndex        =   259
            TabStop         =   0   'False
            Top             =   420
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtOptLabo 
            Height          =   315
            Index           =   4
            Left            =   7980
            TabIndex        =   258
            TabStop         =   0   'False
            Top             =   780
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtOptEd 
            Height          =   315
            Index           =   4
            Left            =   7200
            TabIndex        =   257
            TabStop         =   0   'False
            Top             =   780
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtOptLabo 
            Height          =   315
            Index           =   3
            Left            =   7980
            TabIndex        =   256
            TabStop         =   0   'False
            Top             =   1140
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtOptEd 
            Height          =   315
            Index           =   3
            Left            =   7200
            TabIndex        =   255
            TabStop         =   0   'False
            Top             =   1140
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtOptLabo 
            Height          =   315
            Index           =   2
            Left            =   7980
            TabIndex        =   254
            TabStop         =   0   'False
            Top             =   1500
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtOptEd 
            Height          =   315
            Index           =   2
            Left            =   7200
            TabIndex        =   253
            TabStop         =   0   'False
            Top             =   1500
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtHNom 
            Height          =   315
            Index           =   5
            Left            =   2460
            TabIndex        =   252
            TabStop         =   0   'False
            Top             =   420
            Width           =   4695
            _ExtentX        =   8281
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtHNum 
            Height          =   315
            Index           =   5
            Left            =   1680
            TabIndex        =   251
            TabStop         =   0   'False
            Top             =   420
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtHNom 
            Height          =   315
            Index           =   4
            Left            =   2460
            TabIndex        =   250
            TabStop         =   0   'False
            Top             =   780
            Width           =   4695
            _ExtentX        =   8281
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtHNum 
            Height          =   315
            Index           =   4
            Left            =   1680
            TabIndex        =   249
            TabStop         =   0   'False
            Top             =   780
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtHNom 
            Height          =   315
            Index           =   3
            Left            =   2460
            TabIndex        =   248
            TabStop         =   0   'False
            Top             =   1140
            Width           =   4695
            _ExtentX        =   8281
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtHNum 
            Height          =   315
            Index           =   3
            Left            =   1680
            TabIndex        =   247
            TabStop         =   0   'False
            Top             =   1140
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtHNom 
            Height          =   315
            Index           =   2
            Left            =   2460
            TabIndex        =   246
            TabStop         =   0   'False
            Top             =   1500
            Width           =   4695
            _ExtentX        =   8281
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtHNum 
            Height          =   315
            Index           =   2
            Left            =   1680
            TabIndex        =   245
            TabStop         =   0   'False
            Top             =   1500
            Width           =   735
            _ExtentX        =   1296
            _ExtentY        =   556
            _Version        =   393216
            Locked          =   -1  'True
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Synthèse :"
            Height          =   210
            Index           =   79
            Left            =   5640
            TabIndex        =   274
            Top             =   2340
            Width           =   1020
         End
         Begin VB.Line Line1 
            X1              =   5640
            X2              =   8700
            Y1              =   2220
            Y2              =   2220
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Établissement :"
            Height          =   210
            Index           =   78
            Left            =   5640
            TabIndex        =   269
            Top             =   1920
            Width           =   1470
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Groupe :"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   -1  'True
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   210
            Index           =   69
            Left            =   120
            MousePointer    =   10  'Up Arrow
            TabIndex        =   268
            ToolTipText     =   "Affiche le groupe"
            Top             =   480
            Width           =   855
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Direction nat. :"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   -1  'True
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   210
            Index           =   6
            Left            =   120
            MousePointer    =   10  'Up Arrow
            TabIndex        =   267
            ToolTipText     =   "Affiche la direction nationale"
            Top             =   840
            Width           =   1470
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Direction reg. :"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   -1  'True
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   210
            Index           =   4
            Left            =   120
            MousePointer    =   10  'Up Arrow
            TabIndex        =   266
            ToolTipText     =   "Affiche la direction régionale"
            Top             =   1200
            Width           =   1485
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Secteur :"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   -1  'True
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   210
            Index           =   0
            Left            =   120
            MousePointer    =   10  'Up Arrow
            TabIndex        =   264
            ToolTipText     =   "Affiche le secteur"
            Top             =   1560
            Width           =   900
         End
         Begin VB.Label lblOptions 
            AutoSize        =   -1  'True
            Caption         =   "Labo"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   -1  'True
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   210
            Index           =   3
            Left            =   8100
            MousePointer    =   10  'Up Arrow
            TabIndex        =   263
            ToolTipText     =   "Affiche la liste des options labo"
            Top             =   180
            Width           =   480
         End
         Begin VB.Label lblOptions 
            AutoSize        =   -1  'True
            Caption         =   "Édition"
            BeginProperty Font 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   -1  'True
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FF0000&
            Height          =   210
            Index           =   0
            Left            =   7200
            MousePointer    =   10  'Up Arrow
            TabIndex        =   262
            ToolTipText     =   "Affiche la liste des options d'édition"
            Top             =   180
            Width           =   675
         End
         Begin VB.Label lblChamp 
            Caption         =   "Options :"
            Height          =   255
            Index           =   70
            Left            =   6120
            TabIndex        =   261
            Top             =   180
            Width           =   915
         End
      End
      Begin VB.Frame fraTraçabilité 
         Caption         =   "Traçabilité"
         Height          =   1755
         Left            =   0
         TabIndex        =   229
         Top             =   900
         Width           =   8835
         Begin TablesServeur.BDCombo bdcOperCreat 
            Height          =   330
            Left            =   3780
            TabIndex        =   233
            Top             =   240
            Width           =   4935
            _ExtentX        =   8705
            _ExtentY        =   582
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataField       =   "etb_opercreat"
         End
         Begin TablesServeur.BDCombo bdcOperModif 
            Height          =   330
            Left            =   3780
            TabIndex        =   237
            Top             =   600
            Width           =   4935
            _ExtentX        =   8705
            _ExtentY        =   582
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataField       =   "etb_opermodif"
         End
         Begin TablesServeur.BDCombo bdcOperValid 
            Height          =   330
            Left            =   3780
            TabIndex        =   240
            Top             =   960
            Width           =   4935
            _ExtentX        =   8705
            _ExtentY        =   582
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            DataField       =   "etb_opervalid"
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Dernier transf. Satti :"
            Height          =   210
            Index           =   106
            Left            =   4080
            TabIndex        =   317
            Top             =   1380
            Visible         =   0   'False
            Width           =   1995
         End
         Begin MSWLess.WLText txtChamp 
            DataField       =   "etb_ddt"
            Height          =   315
            Index           =   30
            Left            =   6180
            TabIndex        =   316
            Top             =   1320
            Visible         =   0   'False
            Width           =   2055
            _ExtentX        =   3625
            _ExtentY        =   556
            _Version        =   393216
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtChamp 
            DataField       =   "etb_heuremodif"
            Height          =   315
            Index           =   20
            Left            =   2940
            TabIndex        =   236
            Top             =   600
            Width           =   795
            _ExtentX        =   1402
            _ExtentY        =   556
            _Version        =   393216
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtChamp 
            DataField       =   "etb_datemodif"
            Height          =   315
            Index           =   21
            Left            =   1680
            TabIndex        =   235
            Top             =   600
            Width           =   1215
            _ExtentX        =   2143
            _ExtentY        =   556
            _Version        =   393216
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtChamp 
            DataField       =   "etb_heurecreat"
            Height          =   315
            Index           =   22
            Left            =   2940
            TabIndex        =   232
            Top             =   240
            Width           =   795
            _ExtentX        =   1402
            _ExtentY        =   556
            _Version        =   393216
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtChamp 
            DataField       =   "etb_datecreat"
            Height          =   315
            Index           =   23
            Left            =   1680
            TabIndex        =   231
            Top             =   240
            Width           =   1215
            _ExtentX        =   2143
            _ExtentY        =   556
            _Version        =   393216
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtChamp 
            DataField       =   "etb_tsvalid"
            Height          =   315
            Index           =   25
            Left            =   1680
            TabIndex        =   239
            Top             =   960
            Width           =   2055
            _ExtentX        =   3625
            _ExtentY        =   556
            _Version        =   393216
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin MSWLess.WLText txtChamp 
            DataField       =   "timestamp"
            Height          =   315
            Index           =   14
            Left            =   1680
            TabIndex        =   242
            Top             =   1320
            Width           =   2235
            _ExtentX        =   3942
            _ExtentY        =   556
            _Version        =   393216
            ForeColor       =   -2147483630
            BackColor       =   -2147483633
            BorderStyle     =   1
            Appearance      =   1
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Modifié le :"
            Height          =   210
            Index           =   16
            Left            =   120
            TabIndex        =   234
            Top             =   660
            Width           =   1020
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Créé le :"
            Height          =   210
            Index           =   17
            Left            =   120
            TabIndex        =   230
            Top             =   300
            Width           =   810
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Validé le :"
            Height          =   210
            Index           =   19
            Left            =   120
            TabIndex        =   238
            Top             =   1020
            Width           =   930
         End
         Begin VB.Label lblChamp 
            AutoSize        =   -1  'True
            Caption         =   "Timestamp :"
            Height          =   210
            Index           =   13
            Left            =   120
            TabIndex        =   241
            Top             =   1380
            Width           =   1155
         End
      End
      Begin VB.TextBox txtChampVB 
         BackColor       =   &H8000000F&
         DataField       =   "^etb_etat"
         ForeColor       =   &H80000012&
         Height          =   315
         Index           =   8
         Left            =   1680
         MaxLength       =   1
         TabIndex        =   224
         Top             =   0
         Width           =   315
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_origine"
         Height          =   315
         Index           =   3
         Left            =   3780
         TabIndex        =   226
         Top             =   0
         Width           =   6075
         _ExtentX        =   10716
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   30
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_comment"
         Height          =   555
         Index           =   2
         Left            =   1680
         TabIndex        =   228
         Top             =   360
         Width           =   8175
         _ExtentX        =   14420
         _ExtentY        =   979
         _Version        =   393216
         MaxLength       =   180
         ScrollBars      =   2
         MultiLine       =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "État :"
         Height          =   210
         Index           =   9
         Left            =   0
         TabIndex        =   223
         Top             =   60
         Width           =   525
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Origine :"
         Height          =   210
         Index           =   3
         Left            =   2640
         TabIndex        =   225
         Top             =   60
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Commentaire :"
         Height          =   210
         Index           =   2
         Left            =   0
         TabIndex        =   227
         Top             =   420
         Width           =   1395
      End
   End
   Begin VB.Frame fraFeuille 
      BackColor       =   &H00FFFF80&
      BorderStyle     =   0  'None
      Caption         =   "etb_altadr"
      Height          =   915
      Index           =   5
      Left            =   4980
      TabIndex        =   170
      Top             =   1320
      Visible         =   0   'False
      Width           =   1455
      Begin TablesServeur.BDCombo bdcTypeFact 
         Height          =   330
         Left            =   1680
         TabIndex        =   187
         Top             =   2160
         Width           =   1935
         _ExtentX        =   3413
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_fact"
      End
      Begin TablesServeur.BDCombo bdcGroupement 
         Height          =   330
         Left            =   1680
         TabIndex        =   185
         Top             =   1800
         Width           =   7155
         _ExtentX        =   12621
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_numgrf"
      End
      Begin TablesServeur.BDCheck bckCheck 
         Height          =   285
         Index           =   1
         Left            =   1680
         TabIndex        =   172
         Top             =   0
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "!etb_altadr"
      End
      Begin TablesServeur.BDCheck bckCheck 
         Height          =   285
         Index           =   2
         Left            =   5040
         TabIndex        =   193
         Top             =   2520
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "!etb_tva"
      End
      Begin TablesServeur.BDCombo bdcTarif 
         Height          =   330
         Left            =   1680
         TabIndex        =   197
         Top             =   2880
         Width           =   7155
         _ExtentX        =   12621
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_tarif"
      End
      Begin VB.TextBox txtChampVB 
         BackColor       =   &H8000000F&
         DataField       =   "^etb_altnom"
         ForeColor       =   &H80000012&
         Height          =   315
         Index           =   33
         Left            =   1680
         MaxLength       =   41
         TabIndex        =   176
         Top             =   360
         Width           =   7155
      End
      Begin VB.TextBox txtChampVB 
         BackColor       =   &H8000000F&
         DataField       =   "^etb_altbdist"
         ForeColor       =   &H80000012&
         Height          =   315
         Index           =   30
         Left            =   2460
         MaxLength       =   37
         TabIndex        =   183
         Top             =   1440
         Width           =   6375
      End
      Begin TablesServeur.BDCheck bckCheck 
         Height          =   285
         Index           =   6
         Left            =   8100
         TabIndex        =   195
         Top             =   2520
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "!etb_factanticipee"
      End
      Begin TablesServeur.BDCombo bdcNCP 
         Height          =   330
         Left            =   1680
         TabIndex        =   199
         Top             =   3240
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "*etb_facncp"
      End
      Begin TablesServeur.BDCombo bdcNDP 
         Height          =   330
         Left            =   1680
         TabIndex        =   201
         Top             =   3600
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "*etb_facndp"
      End
      Begin TablesServeur.BDCheck bckCheck 
         Height          =   285
         Index           =   3
         Left            =   7860
         TabIndex        =   219
         Top             =   4320
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "!etb_blprix"
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_banque"
         Height          =   315
         Index           =   78
         Left            =   6360
         TabIndex        =   217
         Top             =   4320
         Width           =   375
         _ExtentX        =   661
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Banque :"
         Height          =   210
         Index           =   114
         Left            =   5460
         TabIndex        =   216
         Top             =   4380
         Width           =   855
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_nbranfor"
         Height          =   315
         Index           =   77
         Left            =   8940
         TabIndex        =   211
         Top             =   3960
         Width           =   435
         _ExtentX        =   767
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   5
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_refcom"
         Height          =   315
         Index           =   75
         Left            =   1680
         TabIndex        =   221
         Top             =   4680
         Width           =   3435
         _ExtentX        =   6059
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   30
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "AP chiffré :"
         Height          =   210
         Index           =   76
         Left            =   6780
         TabIndex        =   218
         Top             =   4380
         Width           =   1005
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Nb an f :"
         Height          =   210
         Index           =   60
         Left            =   8040
         TabIndex        =   210
         Top             =   4020
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Référence cmd :"
         Height          =   210
         Index           =   58
         Left            =   0
         TabIndex        =   220
         Top             =   4740
         Width           =   1515
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Remise :"
         Height          =   210
         Index           =   47
         Left            =   0
         TabIndex        =   212
         Top             =   4380
         Width           =   810
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_ristourne"
         Height          =   315
         Index           =   15
         Left            =   1680
         TabIndex        =   213
         Top             =   4320
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Escompte :"
         Height          =   210
         Index           =   92
         Left            =   3000
         TabIndex        =   214
         Top             =   4380
         Width           =   1050
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_tauxescompte"
         Height          =   315
         Index           =   27
         Left            =   4140
         TabIndex        =   215
         Top             =   4320
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Nb ex fact :"
         Height          =   210
         Index           =   108
         Left            =   3000
         TabIndex        =   204
         Top             =   4020
         Width           =   1080
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_nbexfact"
         Height          =   315
         Index           =   33
         Left            =   4140
         TabIndex        =   205
         Top             =   3960
         Width           =   375
         _ExtentX        =   661
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Situation :"
         Height          =   210
         Index           =   110
         Left            =   4680
         TabIndex        =   206
         Top             =   4020
         Width           =   975
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_situation"
         Height          =   315
         Index           =   52
         Left            =   5760
         TabIndex        =   207
         Top             =   3960
         Width           =   375
         _ExtentX        =   661
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_modefact"
         Height          =   315
         Index           =   59
         Left            =   7620
         TabIndex        =   209
         Top             =   3960
         Width           =   375
         _ExtentX        =   661
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Mode de fact :"
         Height          =   210
         Index           =   112
         Left            =   6180
         TabIndex        =   208
         Top             =   4020
         Width           =   1350
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Niveau calcul :"
         Height          =   210
         Index           =   100
         Left            =   0
         TabIndex        =   198
         Top             =   3300
         Width           =   1350
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Détail présent. :"
         Height          =   210
         Index           =   101
         Left            =   0
         TabIndex        =   200
         Top             =   3660
         Width           =   1530
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_datetarif"
         Height          =   315
         Index           =   76
         Left            =   1680
         TabIndex        =   203
         Top             =   3960
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Date tarif :"
         Height          =   210
         Index           =   59
         Left            =   0
         TabIndex        =   202
         Top             =   4020
         Width           =   1020
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Tarif :"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   210
         Index           =   96
         Left            =   0
         MousePointer    =   10  'Up Arrow
         TabIndex        =   196
         ToolTipText     =   "Affiche le secteur"
         Top             =   2940
         Width           =   600
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Facturation anticipée :"
         Height          =   210
         Index           =   107
         Left            =   5820
         TabIndex        =   194
         Top             =   2580
         Width           =   2115
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Mois de fact groupée :"
         Height          =   210
         Index           =   105
         Left            =   3660
         TabIndex        =   188
         Top             =   2220
         Width           =   2115
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_moisfact"
         Height          =   315
         Index           =   12
         Left            =   5820
         TabIndex        =   189
         Top             =   2160
         Width           =   2535
         _ExtentX        =   4471
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   12
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_codetva"
         Height          =   315
         Index           =   58
         Left            =   1680
         TabIndex        =   191
         Top             =   2520
         Width           =   2535
         _ExtentX        =   4471
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   20
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_commentfc"
         Height          =   315
         Index           =   57
         Left            =   3000
         TabIndex        =   174
         Top             =   0
         Width           =   5835
         _ExtentX        =   10292
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   65
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_altrue"
         Height          =   315
         Index           =   32
         Left            =   1680
         TabIndex        =   178
         Top             =   720
         Width           =   7155
         _ExtentX        =   12621
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   41
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_altloc"
         Height          =   315
         Index           =   31
         Left            =   1680
         TabIndex        =   180
         Top             =   1080
         Width           =   7155
         _ExtentX        =   12621
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   41
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_altcpost"
         Height          =   315
         Index           =   29
         Left            =   1680
         TabIndex        =   182
         Top             =   1440
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   5
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Code TVA :"
         Height          =   210
         Index           =   46
         Left            =   0
         TabIndex        =   190
         Top             =   2580
         Width           =   1035
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Rem FC :"
         Height          =   210
         Index           =   45
         Left            =   2100
         TabIndex        =   173
         Top             =   60
         Width           =   840
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "TVA :"
         Height          =   210
         Index           =   44
         Left            =   4500
         TabIndex        =   192
         Top             =   2580
         Width           =   480
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Groupement :"
         Height          =   210
         Index           =   33
         Left            =   0
         TabIndex        =   184
         Top             =   1860
         Width           =   1305
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Type fact :"
         Height          =   210
         Index           =   32
         Left            =   0
         TabIndex        =   186
         Top             =   2220
         Width           =   990
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Autre adresse :"
         Height          =   210
         Index           =   31
         Left            =   0
         TabIndex        =   171
         Top             =   60
         Width           =   1470
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Nom :"
         Height          =   210
         Index           =   30
         Left            =   0
         TabIndex        =   175
         Top             =   420
         Width           =   555
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Rue :"
         Height          =   210
         Index           =   29
         Left            =   0
         TabIndex        =   177
         Top             =   780
         Width           =   495
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "CPost / BD :"
         Height          =   210
         Index           =   28
         Left            =   0
         TabIndex        =   181
         Top             =   1500
         Width           =   1140
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Localité :"
         Height          =   210
         Index           =   27
         Left            =   0
         TabIndex        =   179
         Top             =   1140
         Width           =   855
      End
   End
   Begin VB.Frame fraFeuille 
      BackColor       =   &H0080FF80&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   2115
      Index           =   1
      Left            =   60
      TabIndex        =   4
      Top             =   1380
      Visible         =   0   'False
      Width           =   1275
      Begin TablesServeur.BDCombo bdcThèmeDéfaut 
         Height          =   330
         Left            =   5760
         TabIndex        =   318
         Top             =   4680
         Width           =   3075
         _ExtentX        =   5424
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   -2147483630
         DataField       =   "etb_themedefaut"
      End
      Begin TablesServeur.BDCombo bdcPays 
         Height          =   330
         Left            =   1680
         TabIndex        =   17
         Top             =   1800
         Width           =   2475
         _ExtentX        =   4366
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_pays"
      End
      Begin TablesServeur.BDCombo bdcSecteur 
         Height          =   330
         Left            =   1680
         TabIndex        =   15
         Top             =   1440
         Width           =   7155
         _ExtentX        =   12621
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_numsec"
      End
      Begin TablesServeur.BDCombo bdcEdLangue 
         Height          =   330
         Left            =   5760
         TabIndex        =   19
         Top             =   1800
         Width           =   3075
         _ExtentX        =   5424
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_edlangue"
      End
      Begin TablesServeur.BDCombo bdcUnité 
         Height          =   330
         Left            =   1680
         TabIndex        =   27
         Top             =   2880
         Width           =   2475
         _ExtentX        =   4366
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_unite"
      End
      Begin TablesServeur.BDCombo bdcProprio 
         Height          =   330
         Left            =   5760
         TabIndex        =   29
         Top             =   2880
         Width           =   3075
         _ExtentX        =   5424
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_proprio"
      End
      Begin TablesServeur.BDCombo bdcRayon 
         Height          =   330
         Left            =   5760
         TabIndex        =   25
         Top             =   2520
         Width           =   3075
         _ExtentX        =   5424
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_rayon"
      End
      Begin TablesServeur.BDCombo bdcZoneComm 
         Height          =   330
         Left            =   5760
         TabIndex        =   48
         Top             =   4320
         Width           =   3075
         _ExtentX        =   5424
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_zcom"
      End
      Begin VB.TextBox txtChampVB 
         BackColor       =   &H8000000F&
         DataField       =   "etb_optlabo"
         ForeColor       =   &H80000012&
         Height          =   315
         Index           =   85
         Left            =   5760
         MaxLength       =   5
         TabIndex        =   33
         Top             =   3240
         Width           =   795
      End
      Begin VB.TextBox txtChampVB 
         BackColor       =   &H8000000F&
         DataField       =   "etb_optedition"
         ForeColor       =   &H80000012&
         Height          =   315
         Index           =   84
         Left            =   1680
         MaxLength       =   5
         TabIndex        =   31
         Top             =   3240
         Width           =   795
      End
      Begin VB.TextBox txtChampVB 
         BackColor       =   &H8000000F&
         DataField       =   "*^etb_bdist"
         ForeColor       =   &H80000012&
         Height          =   315
         Index           =   12
         Left            =   2520
         MaxLength       =   37
         TabIndex        =   11
         Top             =   720
         Width           =   6315
      End
      Begin TablesServeur.BDCombo bdcLabo 
         Height          =   330
         Left            =   1680
         TabIndex        =   23
         Top             =   2520
         Width           =   2715
         _ExtentX        =   4789
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "*etb_labo"
      End
      Begin TablesServeur.BDCombo bdcIdAuchan 
         Height          =   330
         Left            =   1680
         TabIndex        =   50
         Top             =   4680
         Width           =   2475
         _ExtentX        =   4366
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_idauchan"
      End
      Begin VB.Label lblthemdef 
         Caption         =   "Thème défaut:"
         Height          =   255
         Left            =   4260
         TabIndex        =   319
         Top             =   4740
         Width           =   1515
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "N° contrat (clé1):"
         Height          =   210
         Index           =   42
         Left            =   0
         TabIndex        =   41
         Top             =   4020
         Width           =   1635
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_cle1"
         Height          =   315
         Index           =   96
         Left            =   1680
         TabIndex        =   42
         Top             =   3960
         Width           =   2475
         _ExtentX        =   4366
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   16
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Saisie RA :"
         Height          =   210
         Index           =   118
         Left            =   6600
         TabIndex        =   34
         Top             =   3300
         Width           =   990
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_optsaisie"
         Height          =   315
         Index           =   84
         Left            =   8100
         TabIndex        =   35
         Top             =   3240
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   10
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_categacti"
         Height          =   315
         Index           =   82
         Left            =   1680
         TabIndex        =   44
         Top             =   4320
         Width           =   435
         _ExtentX        =   767
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   3
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Activité :"
         Height          =   210
         Index           =   117
         Left            =   0
         TabIndex        =   43
         Top             =   4380
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Id Auchan :"
         Height          =   210
         Index           =   116
         Left            =   0
         TabIndex        =   49
         Top             =   4740
         Width           =   1080
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "RDIA :"
         Height          =   210
         Index           =   41
         Left            =   2700
         TabIndex        =   45
         Top             =   4380
         Width           =   585
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_rdia"
         Height          =   315
         Index           =   51
         Left            =   3420
         TabIndex        =   46
         Top             =   4320
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   3
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Labo :"
         Height          =   210
         Index           =   97
         Left            =   0
         TabIndex        =   22
         Top             =   2580
         Width           =   600
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_exempetb"
         Height          =   315
         Index           =   90
         Left            =   5760
         TabIndex        =   40
         Top             =   3600
         Width           =   795
         _ExtentX        =   1402
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_infocli"
         Height          =   315
         Index           =   87
         Left            =   2640
         TabIndex        =   38
         Top             =   3600
         Width           =   1515
         _ExtentX        =   2672
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   10
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_code"
         Height          =   315
         Index           =   86
         Left            =   1680
         TabIndex        =   37
         Top             =   3600
         Width           =   915
         _ExtentX        =   1614
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_rue"
         Height          =   315
         Index           =   5
         Left            =   1680
         TabIndex        =   6
         Top             =   0
         Width           =   7155
         _ExtentX        =   12621
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   41
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_loc"
         Height          =   315
         Index           =   6
         Left            =   1680
         TabIndex        =   8
         Top             =   360
         Width           =   7155
         _ExtentX        =   12621
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   41
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_tel"
         Height          =   315
         Index           =   7
         Left            =   1680
         TabIndex        =   13
         Top             =   1080
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   16
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_corresp"
         Height          =   315
         Index           =   9
         Left            =   1680
         TabIndex        =   21
         Top             =   2160
         Width           =   7155
         _ExtentX        =   12621
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   49
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_fax"
         Height          =   315
         Index           =   13
         Left            =   3780
         TabIndex        =   14
         Top             =   1080
         Width           =   1995
         _ExtentX        =   3519
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   16
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "*etb_cpost"
         Height          =   315
         Index           =   16
         Left            =   1680
         TabIndex        =   10
         Top             =   720
         Width           =   795
         _ExtentX        =   1402
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   5
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "ZCom :"
         Height          =   210
         Index           =   77
         Left            =   4440
         TabIndex        =   47
         Top             =   4380
         Width           =   675
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Secteur :"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   210
         Index           =   11
         Left            =   0
         MousePointer    =   10  'Up Arrow
         TabIndex        =   265
         ToolTipText     =   "Affiche le secteur"
         Top             =   1500
         Width           =   900
      End
      Begin VB.Label lblOptions 
         AutoSize        =   -1  'True
         Caption         =   "Labo :"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   210
         Index           =   2
         Left            =   4440
         MousePointer    =   10  'Up Arrow
         TabIndex        =   32
         ToolTipText     =   "Affiche la liste des options labo"
         Top             =   3300
         Width           =   615
      End
      Begin VB.Label lblOptions 
         AutoSize        =   -1  'True
         Caption         =   "Options édition :"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   210
         Index           =   1
         Left            =   0
         MousePointer    =   10  'Up Arrow
         TabIndex        =   30
         ToolTipText     =   "Affiche la liste des options d'édition"
         Top             =   3300
         Width           =   1635
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "NbEx :"
         Height          =   210
         Index           =   75
         Left            =   4440
         TabIndex        =   39
         Top             =   3660
         Width           =   615
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Rayon :"
         Height          =   210
         Index           =   74
         Left            =   4440
         TabIndex        =   24
         Top             =   2580
         Width           =   720
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Codes client :"
         Height          =   210
         Index           =   71
         Left            =   0
         TabIndex        =   36
         Top             =   3660
         Width           =   1290
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Proprio :"
         Height          =   210
         Index           =   68
         Left            =   4440
         TabIndex        =   28
         Top             =   2940
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Secteur :"
         Height          =   210
         Index           =   67
         Left            =   0
         TabIndex        =   26
         Top             =   2940
         Width           =   855
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Langue :"
         Height          =   210
         Index           =   66
         Left            =   4440
         TabIndex        =   18
         Top             =   1860
         Width           =   840
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Rue :"
         Height          =   210
         Index           =   7
         Left            =   0
         TabIndex        =   5
         Top             =   60
         Width           =   495
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "CPost / BD :"
         Height          =   210
         Index           =   1
         Left            =   0
         TabIndex        =   9
         Top             =   780
         Width           =   1140
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Tel / Fax :"
         Height          =   210
         Index           =   5
         Left            =   0
         TabIndex        =   12
         Top             =   1140
         Width           =   930
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Localité :"
         Height          =   210
         Index           =   8
         Left            =   0
         TabIndex        =   7
         Top             =   420
         Width           =   855
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Correspondant :"
         Height          =   210
         Index           =   10
         Left            =   0
         TabIndex        =   20
         Top             =   2220
         Width           =   1560
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Pays :"
         Height          =   210
         Index           =   15
         Left            =   0
         TabIndex        =   16
         Top             =   1860
         Width           =   585
      End
   End
   Begin VB.Frame fraFeuille 
      BackColor       =   &H0080C0FF&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   1095
      Index           =   6
      Left            =   6240
      TabIndex        =   277
      Top             =   1260
      Visible         =   0   'False
      Width           =   1275
      Begin TablesServeur.BDCombo bdcModeRèglement 
         Height          =   330
         Left            =   1680
         TabIndex        =   287
         Top             =   1140
         Width           =   2355
         _ExtentX        =   4154
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_moderegl"
      End
      Begin TablesServeur.BDCheck bckCheck 
         Height          =   285
         Index           =   4
         Left            =   6720
         TabIndex        =   295
         Top             =   1860
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "!etb_reglfinmois"
      End
      Begin TablesServeur.BDCombo bdcCollectif 
         Height          =   330
         Left            =   1680
         TabIndex        =   285
         Top             =   720
         Width           =   5175
         _ExtentX        =   9128
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_collectif"
      End
      Begin VB.TextBox txtChampVB 
         BackColor       =   &H8000000F&
         DataField       =   "^etb_devise"
         ForeColor       =   &H80000012&
         Height          =   315
         Index           =   102
         Left            =   1680
         MaxLength       =   1
         TabIndex        =   297
         Top             =   2220
         Width           =   315
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "(commence conventionnellement par ! pour un grand compte)"
         Height          =   210
         Index           =   50
         Left            =   3180
         TabIndex        =   303
         Top             =   3480
         Width           =   5835
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "(code interne au client, pour la transmission du CA)"
         Height          =   210
         Index           =   49
         Left            =   3180
         TabIndex        =   308
         Top             =   4200
         Width           =   4845
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "CA Code compta :"
         Height          =   210
         Index           =   48
         Left            =   0
         TabIndex        =   306
         Top             =   4200
         Width           =   1695
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "CA Client :"
         Height          =   210
         Index           =   43
         Left            =   0
         TabIndex        =   301
         Top             =   3480
         Width           =   990
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_cacodecompta"
         Height          =   315
         Index           =   53
         Left            =   1680
         TabIndex        =   307
         Top             =   4140
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   16
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "^etb_caclient"
         Height          =   315
         Index           =   88
         Left            =   1680
         TabIndex        =   302
         Top             =   3420
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   15
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "^etb_camarque"
         Height          =   315
         Index           =   89
         Left            =   1680
         TabIndex        =   305
         Top             =   3780
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   15
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_centrepayeur"
         Height          =   315
         Index           =   104
         Left            =   1680
         TabIndex        =   282
         Top             =   360
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   6
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtNomCentrePayeur 
         Height          =   315
         Left            =   2760
         TabIndex        =   283
         TabStop         =   0   'False
         Top             =   360
         Width           =   6075
         _ExtentX        =   10716
         _ExtentY        =   556
         _Version        =   393216
         Locked          =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_jourregl"
         Height          =   315
         Index           =   99
         Left            =   4260
         TabIndex        =   293
         Top             =   1860
         Width           =   615
         _ExtentX        =   1085
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtNomFacturé 
         Height          =   315
         Left            =   2760
         TabIndex        =   280
         TabStop         =   0   'False
         Top             =   0
         Width           =   6075
         _ExtentX        =   10716
         _ExtentY        =   556
         _Version        =   393216
         Locked          =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_correspcompta"
         Height          =   315
         Index           =   103
         Left            =   1680
         TabIndex        =   299
         Top             =   2580
         Width           =   7155
         _ExtentX        =   12621
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   60
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_condregl"
         Height          =   315
         Index           =   101
         Left            =   1680
         TabIndex        =   291
         Top             =   1860
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_delairegl"
         Height          =   315
         Index           =   100
         Left            =   1680
         TabIndex        =   289
         Top             =   1500
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_facture"
         Height          =   315
         Index           =   94
         Left            =   1680
         TabIndex        =   279
         Top             =   0
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   6
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Shape shpComptaSansEffet 
         BorderStyle     =   0  'Transparent
         FillStyle       =   5  'Downward Diagonal
         Height          =   2655
         Left            =   0
         Top             =   360
         Visible         =   0   'False
         Width           =   8835
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Collectif :"
         Height          =   210
         Index           =   95
         Left            =   0
         TabIndex        =   284
         Top             =   780
         Width           =   870
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Centre payeur :"
         Height          =   210
         Index           =   86
         Left            =   0
         TabIndex        =   281
         Top             =   420
         Width           =   1500
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Regl. fin de mois :"
         Height          =   210
         Index           =   94
         Left            =   4980
         TabIndex        =   294
         Top             =   1920
         Width           =   1680
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Jour de règl. :"
         Height          =   210
         Index           =   93
         Left            =   2820
         TabIndex        =   292
         Top             =   1920
         Width           =   1305
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Identité payeur :"
         Height          =   210
         Index           =   91
         Left            =   0
         TabIndex        =   298
         Top             =   2640
         Width           =   1605
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Devise :"
         Height          =   210
         Index           =   88
         Left            =   0
         TabIndex        =   296
         Top             =   2280
         Width           =   765
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Cond. de règl. :"
         Height          =   210
         Index           =   87
         Left            =   0
         TabIndex        =   290
         Top             =   1920
         Width           =   1470
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Délai de règl. :"
         Height          =   210
         Index           =   84
         Left            =   0
         TabIndex        =   288
         Top             =   1560
         Width           =   1380
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Mode de règl. :"
         Height          =   210
         Index           =   83
         Left            =   0
         TabIndex        =   286
         Top             =   1200
         Width           =   1425
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Code comptable :"
         Height          =   210
         Index           =   12
         Left            =   0
         TabIndex        =   278
         Top             =   60
         Width           =   1665
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Paramétrage de l'analyse du CA sous Access"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   72
         Left            =   0
         TabIndex        =   300
         Top             =   3120
         Width           =   4410
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "CA Marque :"
         Height          =   210
         Index           =   73
         Left            =   0
         TabIndex        =   304
         Top             =   3840
         Width           =   1155
      End
   End
   Begin VB.Frame fraFeuille 
      BackColor       =   &H0080FFFF&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   795
      Index           =   3
      Left            =   2520
      TabIndex        =   105
      Top             =   1380
      Visible         =   0   'False
      Width           =   1035
      Begin TablesServeur.BDCheck bckCheck 
         Height          =   285
         Index           =   0
         Left            =   1680
         TabIndex        =   107
         Top             =   0
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "!etb_gestrict"
      End
      Begin TablesServeur.BDCombo bdcLangue 
         Height          =   330
         Index           =   1
         Left            =   1680
         TabIndex        =   115
         Top             =   1080
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_langeh1"
      End
      Begin TablesServeur.BDCombo bdcLangue 
         Height          =   330
         Index           =   4
         Left            =   1680
         TabIndex        =   156
         Top             =   4320
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_langeh4"
      End
      Begin TablesServeur.BDCombo bdcLangue 
         Height          =   330
         Index           =   2
         Left            =   1680
         TabIndex        =   126
         Top             =   2160
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_langeh2"
      End
      Begin TablesServeur.BDCombo bdcLangue 
         Height          =   330
         Index           =   3
         Left            =   1680
         TabIndex        =   137
         Top             =   3240
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   582
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DataField       =   "etb_langeh3"
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "etb_typeeh"
         Height          =   315
         Index           =   0
         Left            =   1680
         TabIndex        =   161
         Top             =   4740
         Width           =   7155
         _ExtentX        =   12621
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   60
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   """Rab"" EH :"
         Height          =   210
         Index           =   99
         Left            =   0
         TabIndex        =   160
         Top             =   4800
         Width           =   990
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "min"
         Height          =   210
         Index           =   19
         Left            =   6180
         TabIndex        =   159
         Top             =   4380
         Width           =   330
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "min"
         Height          =   210
         Index           =   18
         Left            =   6180
         TabIndex        =   140
         Top             =   3300
         Width           =   330
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "min"
         Height          =   210
         Index           =   17
         Left            =   6180
         TabIndex        =   129
         Top             =   2220
         Width           =   330
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "min"
         Height          =   210
         Index           =   16
         Left            =   6180
         TabIndex        =   118
         Top             =   1140
         Width           =   330
      End
      Begin MSWLess.WLText txtdurEH 
         DataField       =   "etb_dureh4"
         Height          =   315
         Index           =   7
         Left            =   5640
         TabIndex        =   158
         Tag             =   "Durée de l'EH 4"
         Top             =   4320
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtdurEH 
         DataField       =   "etb_dureh3"
         Height          =   315
         Index           =   6
         Left            =   5640
         TabIndex        =   139
         Tag             =   "Durée de l'EH 3"
         Top             =   3240
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtdurEH 
         DataField       =   "etb_dureh2"
         Height          =   315
         Index           =   5
         Left            =   5640
         TabIndex        =   128
         Tag             =   "Durée de l'EH 2"
         Top             =   2160
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtdurEH 
         DataField       =   "etb_dureh1"
         Height          =   315
         Index           =   0
         Left            =   5640
         TabIndex        =   117
         Tag             =   "Durée de l'EH 1"
         Top             =   1080
         Width           =   495
         _ExtentX        =   873
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtTitreScénario 
         Height          =   315
         Index           =   3
         Left            =   2400
         TabIndex        =   135
         TabStop         =   0   'False
         Top             =   2880
         Width           =   6435
         _ExtentX        =   11351
         _ExtentY        =   556
         _Version        =   393216
         Locked          =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtTitreScénario 
         Height          =   315
         Index           =   2
         Left            =   2400
         TabIndex        =   124
         TabStop         =   0   'False
         Top             =   1800
         Width           =   6435
         _ExtentX        =   11351
         _ExtentY        =   556
         _Version        =   393216
         Locked          =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtTitreScénario 
         Height          =   315
         Index           =   1
         Left            =   2400
         TabIndex        =   113
         TabStop         =   0   'False
         Top             =   720
         Width           =   6435
         _ExtentX        =   11351
         _ExtentY        =   556
         _Version        =   393216
         Locked          =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtTitreScénario 
         Height          =   315
         Index           =   4
         Left            =   2400
         TabIndex        =   146
         TabStop         =   0   'False
         Top             =   3960
         Width           =   6435
         _ExtentX        =   11351
         _ExtentY        =   556
         _Version        =   393216
         Locked          =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtTitreGrille 
         Height          =   315
         Index           =   3
         Left            =   2400
         TabIndex        =   132
         TabStop         =   0   'False
         Top             =   2520
         Width           =   6435
         _ExtentX        =   11351
         _ExtentY        =   556
         _Version        =   393216
         Locked          =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtGrille 
         DataField       =   "etb_typeh3"
         Height          =   315
         Index           =   3
         Left            =   1680
         TabIndex        =   131
         Top             =   2520
         Width           =   675
         _ExtentX        =   1191
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtTitreGrille 
         Height          =   315
         Index           =   2
         Left            =   2400
         TabIndex        =   121
         TabStop         =   0   'False
         Top             =   1440
         Width           =   6435
         _ExtentX        =   11351
         _ExtentY        =   556
         _Version        =   393216
         Locked          =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtGrille 
         DataField       =   "etb_typeh2"
         Height          =   315
         Index           =   2
         Left            =   1680
         TabIndex        =   120
         Top             =   1440
         Width           =   675
         _ExtentX        =   1191
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtTitreGrille 
         Height          =   315
         Index           =   1
         Left            =   2400
         TabIndex        =   110
         TabStop         =   0   'False
         Top             =   360
         Width           =   6435
         _ExtentX        =   11351
         _ExtentY        =   556
         _Version        =   393216
         Locked          =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtGrille 
         DataField       =   "etb_typeh1"
         Height          =   315
         Index           =   1
         Left            =   1680
         TabIndex        =   109
         Top             =   360
         Width           =   675
         _ExtentX        =   1191
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtTitreGrille 
         Height          =   315
         Index           =   4
         Left            =   2400
         TabIndex        =   143
         TabStop         =   0   'False
         Top             =   3600
         Width           =   6435
         _ExtentX        =   11351
         _ExtentY        =   556
         _Version        =   393216
         Locked          =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtGrille 
         DataField       =   "etb_typeh4"
         Height          =   315
         Index           =   4
         Left            =   1680
         TabIndex        =   142
         Top             =   3600
         Width           =   675
         _ExtentX        =   1191
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtScénario 
         DataField       =   "etb_sceeh3"
         Height          =   315
         Index           =   3
         Left            =   1680
         TabIndex        =   134
         Top             =   2880
         Width           =   675
         _ExtentX        =   1191
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtScénario 
         DataField       =   "etb_sceeh2"
         Height          =   315
         Index           =   2
         Left            =   1680
         TabIndex        =   123
         Top             =   1800
         Width           =   675
         _ExtentX        =   1191
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtScénario 
         DataField       =   "etb_sceeh4"
         Height          =   315
         Index           =   4
         Left            =   1680
         TabIndex        =   145
         Top             =   3960
         Width           =   675
         _ExtentX        =   1191
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtScénario 
         DataField       =   "etb_sceeh1"
         Height          =   315
         Index           =   1
         Left            =   1680
         TabIndex        =   112
         Top             =   720
         Width           =   675
         _ExtentX        =   1191
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Durée EH 4 :"
         Height          =   210
         Index           =   15
         Left            =   3780
         TabIndex        =   157
         Top             =   4380
         Width           =   1200
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Durée  EH 3 :"
         Height          =   210
         Index           =   14
         Left            =   3780
         TabIndex        =   138
         Top             =   3300
         Width           =   1260
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Durée EH 2 :"
         Height          =   210
         Index           =   13
         Left            =   3780
         TabIndex        =   127
         Top             =   2220
         Width           =   1200
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Durée EH 1 :"
         Height          =   210
         Index           =   12
         Left            =   3780
         TabIndex        =   116
         Top             =   1140
         Width           =   1200
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Langue 4 :"
         Height          =   210
         Index           =   11
         Left            =   0
         TabIndex        =   155
         Top             =   4380
         Width           =   1020
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Langue 3 :"
         Height          =   210
         Index           =   10
         Left            =   0
         TabIndex        =   136
         Top             =   3300
         Width           =   1020
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Langue 2 :"
         Height          =   210
         Index           =   9
         Left            =   0
         TabIndex        =   125
         Top             =   2220
         Width           =   1020
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Langue 1 :"
         Height          =   210
         Index           =   8
         Left            =   0
         TabIndex        =   114
         Top             =   1140
         Width           =   1020
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Scénario 4 :"
         Height          =   210
         Index           =   4
         Left            =   0
         TabIndex        =   144
         Top             =   4020
         Width           =   1125
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Scénario 3 :"
         Height          =   210
         Index           =   3
         Left            =   0
         TabIndex        =   133
         Top             =   2940
         Width           =   1125
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Scénario 2 :"
         Height          =   210
         Index           =   2
         Left            =   0
         TabIndex        =   122
         Top             =   1860
         Width           =   1125
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Scénario 1 :"
         Height          =   210
         Index           =   1
         Left            =   0
         TabIndex        =   111
         Top             =   780
         Width           =   1125
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Grille 1 :"
         Height          =   210
         Index           =   7
         Left            =   0
         TabIndex        =   108
         Top             =   420
         Width           =   780
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Grille 4 :"
         Height          =   210
         Index           =   6
         Left            =   0
         TabIndex        =   141
         Top             =   3660
         Width           =   780
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Grille 2 :"
         Height          =   210
         Index           =   5
         Left            =   0
         TabIndex        =   119
         Top             =   1500
         Width           =   780
      End
      Begin VB.Label lblGE 
         AutoSize        =   -1  'True
         Caption         =   "Grille 3 :"
         Height          =   210
         Index           =   0
         Left            =   0
         TabIndex        =   130
         Top             =   2580
         Width           =   780
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "EH Stricte :"
         Height          =   210
         Index           =   89
         Left            =   0
         TabIndex        =   106
         Top             =   60
         Width           =   1050
      End
   End
   Begin VB.CommandButton btnHistorique 
      Caption         =   "Histo"
      Enabled         =   0   'False
      Height          =   285
      Left            =   9060
      Style           =   1  'Graphical
      TabIndex        =   275
      TabStop         =   0   'False
      Top             =   465
      Width           =   1035
   End
   Begin MSComctlLib.TabStrip tsTab 
      Height          =   495
      Left            =   120
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   780
      Width           =   9375
      _ExtentX        =   16536
      _ExtentY        =   873
      MultiRow        =   -1  'True
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   7
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Identification"
            Key             =   "Id"
            Object.ToolTipText     =   "Description de l'établissement"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Prestation"
            Key             =   "Prest"
            Object.ToolTipText     =   "Caractéristiques de la prestation"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "EH"
            Key             =   "EH"
            Object.ToolTipText     =   "Options des grilles d'évaluation"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Envoi"
            Key             =   "FME"
            Object.ToolTipText     =   "Paramètres des modalités d'envoi"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Facture"
            Key             =   "Fact"
            Object.ToolTipText     =   "Paramètres de facturation"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab6 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Compta"
            Key             =   "Com"
            Object.ToolTipText     =   "Paramètres de la compta"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab7 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Traçabilité"
            Key             =   "Tra"
            Object.ToolTipText     =   "Informations de traçabilité"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   8340
      Top             =   1260
   End
   Begin TablesServeur.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   243
      Top             =   0
      Width           =   10155
      _ExtentX        =   17912
      _ExtentY        =   767
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.TextBox txtChampVB 
      BackColor       =   &H8000000F&
      DataField       =   "*^etb_prefixe"
      ForeColor       =   &H80000012&
      Height          =   315
      Index           =   1
      Left            =   1020
      MaxLength       =   16
      TabIndex        =   1
      ToolTipText     =   "Préfixe"
      Top             =   450
      Width           =   1395
   End
   Begin VB.TextBox txtChampVB 
      BackColor       =   &H8000000F&
      DataField       =   "*^etb_numetb"
      ForeColor       =   &H80000012&
      Height          =   315
      Index           =   0
      Left            =   60
      TabIndex        =   0
      ToolTipText     =   "N°"
      Top             =   450
      Width           =   915
   End
   Begin VB.TextBox txtChampVB 
      BackColor       =   &H8000000F&
      DataField       =   "*^etb_nom"
      ForeColor       =   &H80000012&
      Height          =   315
      Index           =   4
      Left            =   2460
      MaxLength       =   41
      TabIndex        =   2
      ToolTipText     =   "Nom"
      Top             =   450
      Width           =   6555
   End
End
Attribute VB_Name = "frmEtablissement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Feuille de gestion des établissements
' 18/04/1999 PV Première version
' 18/05/1999 PV Mécanisme UpShift général; AjouteWeb
' 15/06/1999 PV Opération générale; valeurs par défaut; mémorisation
'  8/07/1999 PV Champs O/N via BDCheck
' 15/07/1999 PV GEStrict par défaut à O pour Ercem uniquement
'  6/08/1999 PV synchrodelete
' 11/08/1999 PV Contrôle des n°s d'EH et de la langue d'édition
' 17/08/1999 PV Gestion d'un cache titres de grille/scénarios; caches externalisés dans modCache
' 23/08/1999 PV Normalisation préfixe+nom
' 30/09/1999 PV Impression structure
' 21/10/1999 PV Gestion de la table nbex locale
' 23/11/1999 PV Hiérarchie; liens internes; optimisation d'affichage par onglet visible
' 30/11/1999 PV Zones commerciales
'  8/02/2000 PV Avertissement avant le passage à l'état S
' 16/02/2000 FG Ajout champs alpha pour la prestation etb_prestan, etb_prestbs, ...
' 21/03/2000 PV Reprise des champs de creetb dans le bon ordre
' 20/04/2000 PV Augmentation des tarifs
' 27/04/2000 PV Retour du contrôle des index
' 29/05/2000 PV Onglet comptabilité
'  6/06/2000 PV colChampsMS (champs Microb'Soft, pas Satti); recherche rapide d'etb Fimebio (? à la fin du n°)
' 11/07/2000 PV Début de la traduction en anglais
'  5/09/2000 PV Sélection hiérarchique; AfficheEtablissement via where-part
'  8/09/2000 PV Gestion des tarifs externes; etb_ape --> etb_tarif
' 29/09/1999 PV Fin de la gestion de la table nbex locale; Nouveux champs Microb'Soft II
' 25/01/2001 PV Fin des restrictions sur les etbs Fimebio gérés par Satti
' 13/02/2001 PV Traçabilité des opérations générales
' 14/02/2001 PV Champs tarifs invisibles
' 27/02/2001 PV etb_impdateana
'  1/03/2001 PV Fin des champs tarifs et de l'onglet Fact2
' 18/05/2001 PV FEU à défaut à 1 pour la France; règle de découpage i; Contrôle valeur FME et FEU
' 18/05/2001 PV bOpérationGénérale
' 24/07/2001 PV Y==2 dans la compilation des options labo
' 26/07/2001 PV etb_comment varchar(180) textbox multiligne
'  8/08/2001 PV État Z
' 31/11/2001 FF Historique des modifications
' 03/12/2001 FF Historique des suppressions et des destructions
' 04/12/2001 FF Historique des créations
' 05/12/2001 FF Historique des récupérations d'enregistrement
' 06/12/2001 PV sMéthodesGlobales (menu commande contextuel); bouton Historique dynamique; fin du btn 'Dernier no'
'  8/12/2001 FF+PV bdcThèmeDéfaut


Option Explicit

Private iCurFrame As Integer              ' Cadre courant visible

Private cEtb As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private bOpGénérale As Boolean            ' Vrai si changement sur la sélection

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                 ' Query de la sélection en cours

Private colHistorique As New Collection   ' Trace des modifications pour l'historique

Private Const sTable = "etablissement"


'=================================================================================
' Méthodes globales implémentées par ce module, pour l'affichage du menu Commandes

Public Property Get sMéthodesGlobales() As String
  sMéthodesGlobales = "Historique,Récupère,AjouteWeb,TransfertEtbCompta,DernierNo"
End Property



'=================================================================================
' Accès direct

Public Sub AfficheEtablissement(ByVal sWP As String)
  ' Si la feuille n'est pas disponible, on en ouvre une autre
  If iMode <> meEmpty And iMode <> meNavigate Then
    Dim F As New frmEtablissement
    F.AfficheEtablissement sWP
    Exit Sub
  End If
  
  EffaceFormulaire
  BDActiveFormulaire colChamps, True
  iMode = meQuery
  ValidateQuery sWP
End Sub


'=================================================================================
' Actions de validation

Private Sub ValidateQuery(Optional ByVal sWP As String)
  Assert iMode = meQuery
  
  Dim t As Control
  Dim bWPIntègreEtat As Boolean
  bWPIntègreEtat = False
  
  bWPIntègreEtat = False
  For Each t In colChamps
    If Not t.Locked And t.Text <> "" Then
    
      ' Cas spécifique pour accélérer la recherche d'établissements Fimebio dont on ne connaît pas la lettre
      If t.DataField = "etb_numetb" And (t.Text Like "#[?]" Or t.Text Like "##[?]" Or t.Text Like "###[?]" Or t.Text Like "####[?]" Or t.Text Like "#####[?]") Then
        Dim n As Long
        n = Val(t.Text)
        t.Text = n & Chr(65 + n Mod 26)
      End If
      
      Dim sFinal As String, sMsg As String
      If Not bQueryToWP(t.DataField, t.Text, colColonnes(t.DataField).iType, sFinal, sMsg) Then
        MsgBox "Erreur dans la requête !" & vbCrLf & sMsg, vbExclamation, App.Title
        t.SetFocus
        Exit Sub
      End If
      If sWP <> "" Then sWP = sWP & " and "
      sWP = sWP & "(" & sFinal & ")"
      If t.DataField = "etb_etat" Then bWPIntègreEtat = True
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  If Not bWPIntègreEtat Then sWP = sWP & " and etb_etat is null"
  
  If bShiftPressed Then
    sWP = InputBox("Modification avancée de la requête", "Sélection", sWP)
    If sWP = "" Then Exit Sub
  Else
    If iSystèmePays = 0 Then    ' Ne concerne que la France
      ' Du bon usage des index…
      If colChamps("etb_numetb") = "" _
         And (Left(colChamps("etb_prefixe"), 1) = "*" Or colChamps("etb_prefixe") = "") _
         And (Left(colChamps("etb_nom"), 1) = "*" Or colChamps("etb_nom") = "") _
         And InStr(1, sWP, "etb_numsec") = 0 _
         And (colChamps("etb_cpost") = "" Or Left(colChamps("etb_cpost"), 1) = "*") _
         And colChamps("etb_numgrf") = "" _
         And colChamps("etb_tarif") = "" Then
        If Not bAdminServeur Then
          MsgBox "Vous devez obligatoirement préciser un des éléments suivants :" & vbCrLf & _
            "- N° d'établissement" & vbCrLf & _
            "- Préfixe ou Nom, en ne commençant pas les deux par *" & vbCrLf & _
            "- Code postal" & vbCrLf & _
            "- N° de secteur" & vbCrLf & _
            "- N° de groupement" & vbCrLf & _
            "- N° de tarif" & vbCrLf & _
            "- Code comptable", vbExclamation, App.Title
          Exit Sub
        Else
          MsgBox "Attention, pour accélérer fortement la recherche, vous devriez préciser un des éléments suivants :" & vbCrLf & _
            "- N° d'établissement" & vbCrLf & _
            "- Préfixe ou Nom, en ne commençant pas les deux par *" & vbCrLf & _
            "- Code postal" & vbCrLf & _
            "- N° de secteur" & vbCrLf & _
            "- N° de groupement" & vbCrLf & _
            "- Code comptable", vbInformation, App.Title
        End If
      End If
    End If
  End If
  
  Dim cEtbQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from " & sTable & " where " & sWP
  
  ' & " order by etb_numetb"  : double le temps de recherche !
  cEtbQuery.OpenCurseur sQuery
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    ActiveFormulaire True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cEtb Is Nothing Then cEtb.CloseCurseur
  Set cEtb = cEtbQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cEtb.EOF And cEtb.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a été sélectionné"
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  On Error Resume Next
  bdSél.SetFocus
End Sub


' =============================================================================
' Contrôles

' Vérifie que les champs contiennent des valeurs légales
' Le contrôle des NULL et des types a déjà été fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer
  Dim i As Integer
  
  bOkValeurs = False
  
  ' Pays
  If bdcPays <> "" Then
    bdcPays.Synchronise
    If bdcPays.ListIndex < 0 Then
      MsgBox "Pays inconnu !", vbExclamation, App.Title
      Page "Id"
      bdcPays.SetFocus
      Exit Function
    End If
  End If
  
  ' Thème
  If bdcThèmeDéfaut <> "" Then
    bdcThèmeDéfaut.Synchronise
    If bdcThèmeDéfaut.ListIndex < 0 Then
      MsgBox "Thème par défaut inconnu !", vbExclamation, App.Title
      Page "Id"
      bdcThèmeDéfaut.SetFocus
      Exit Function
    End If
  End If
  
  If iSystèmePays = 0 Then
    If Val(bdcPays) = 0 And bdcZoneComm = "" Then
      MsgBox "Zone commerciale obligatoire pour la France !", vbExclamation, App.Title
      Page "Id"
      bdcZoneComm.SetFocus
      Exit Function
    End If
    
    If bdcZoneComm <> "" Then
      bdcZoneComm.Synchronise
      If bdcZoneComm.ListIndex < 0 Then
        MsgBox "Zone commerciale inconnue !", vbExclamation, App.Title
        Page "Id"
        bdcZoneComm.SetFocus
        Exit Function
      End If
    End If

    If bdcUnité = "" Then
      MsgBox "Code secteur obligatoire !", vbExclamation, App.Title
      Page "Id"
      bdcUnité.SetFocus
      Exit Function
    Else
      bdcUnité.Synchronise
      If bdcUnité.ListIndex < 0 Then
        MsgBox "Code secteur incorrect !", vbExclamation, App.Title
        Page "Id"
        bdcUnité.SetFocus
        Exit Function
      End If
    End If
  End If
  
  If Not bSansSecteur And bdcSecteur.ListIndex < 0 Then
    SynchroSec
    If bdcSecteur.ListIndex < 0 Then
      MsgBox "Secteur inconnu !", vbExclamation, App.Title
      Page "Id"
      bdcSecteur.SetFocus
      Exit Function
    End If
  End If
  
  ' On regarde si le nom et le préfixe n'existent pas déjà
  Dim sSer As String
  sSer = BDCurseurExpress("select etb_numetb from " & sTable & " where etb_nom=" & sFormToSQL(colChamps("etb_nom"), BDTypeCHAR) & " and etb_prefixe=" & sFormToSQL(colChamps("etb_prefixe"), BDTypeCHAR))
  If sSer <> "" And sSer <> colChamps("etb_numetb") Then
    MsgBox "ATTENTION - Cet établissement existe déjà sous le n° " & sSer, vbExclamation, App.Title
    Exit Function
  End If
  
  ' On regarde si la langue d'EH est définie
  For i = 1 To 4
    If txtGrille(i) <> "" Then
      txtTitreGrille(i) = sGetTitreGrille(txtGrille(i))
      If txtTitreGrille(i) = "" Then
        MsgBox "ATTENTION - Audit " & txtGrille(i) & " inconnu !", vbExclamation, App.Title
        Page "EH"
        txtGrille(i).SetFocus
        Exit Function
      End If
      
      If txtScénario(i) <> "" Then
        If Not IsNumeric(txtScénario(i)) < 0 Then
          MsgBox "ATTENTION - Scénario " & txtScénario(i) & " incorrect !", vbExclamation, App.Title
          Page "EH"
          txtScénario(i).SetFocus
          Exit Function
        End If
      End If
      
      If bdcLangue(i) = "" Then
        MsgBox "Attention, la langue d'édition est obligatoire !", vbExclamation, App.Title
        Page "EH"
        bdcLangue(i).SetFocus
        Exit Function
      End If
    End If
  Next
  
  ' On contrôle le labo
  If bdcLabo <> "" Then
    bdcLabo.Synchronise
    If bdcLabo.ListIndex < 0 Then
      MsgBox "Labo inconnu !", vbExclamation, App.Title
      Page "Id"
      bdcLabo.SetFocus
      Exit Function
    End If
  End If
  
  ' On contrôle l'Id Auchan
  If bdcIdAuchan <> "" Then
    bdcIdAuchan.Synchronise
    If bdcIdAuchan.ListIndex < 0 Then
      MsgBox "Id Auchan inconnu !", vbExclamation, App.Title
      Page "Id"
      bdcIdAuchan.SetFocus
      Exit Function
    End If
  End If
  
  ' Pour les n°s Fimebio, on vérifie que la lettre est correcte
  Dim n As String
  n = colChamps("etb_numetb")
  If Len(n) > 1 And (Not IsNumeric(n) Or Right(n, 1) = "F") Then
    Dim nn As String, L As String
    nn = Left(n, Len(n) - 1)
    L = Right(n, 1)
    If IsNumeric(nn) And L >= "A" And L <= "Z" Then
      If L <> Chr(65 + Val(nn) Mod 26) Then
        MsgBox "Attention - N° d'établissement Fimebio et lettre incorrecte." & vbCrLf & "Vérifiez le n°, vous ne pourrez PAS modifier un n° d'établissement après création.", vbExclamation, App.Title
        If Not bShiftPressed Then Exit Function
      End If
    End If
  End If
  
  ' On vérifie que le code comptable vaut NULL ou un tablissement valide
  If colChamps("etb_facture") <> "" Then
    Dim s
    s = BDCurseurExpress("select etb_numetb from etablissement where etb_numetb=" & sFormToSQL(colChamps("etb_facture"), BDTypeCHAR))
    If s = "" Then
      MsgBox "Attention - Code comptable inexistant ou invalide...", vbExclamation, App.Title
      If Not bShiftPressed Then
        Page "Com"
        colChamps("etb_facture").SetFocus
        Exit Function
      End If
    End If
  End If
  
  ' On vérifie que le centre payeur vaut NULL ou un tablissement valide
  If colChamps("etb_centrepayeur") <> "" Then
    s = BDCurseurExpress("select etb_numetb from etablissement where etb_numetb=" & sFormToSQL(colChamps("etb_centrepayeur"), BDTypeCHAR))
    If s = "" Then
      MsgBox "Attention - Code centre payeur inexistant ou invalide...", vbExclamation, App.Title
      If Not bShiftPressed Then
        Page "Com"
        colChamps("etb_centrepayeur").SetFocus
        Exit Function
      End If
    End If
  End If
  
  ' On vérifie le compte collectif en France
  If iSystèmePays = 0 Then
    bdcCollectif.Synchronise
    If bdcCollectif.ListIndex < 0 Then
      MsgBox "Compte collectif inconnu !", vbExclamation, App.Title
      Page "Com"
      bdcCollectif.SetFocus
      Exit Function
    End If
  End If
  
  
  ' Contrôles spécifiques par préfixe
  If iSystèmePays = 0 Then
    If colChamps("etb_prefixe") Like "CAF.*" Then   ' Casino
      Dim sCodeCasino As String
      sCodeCasino = colChamps("etb_infocli")
      If sCodeCasino Like "DV*" Or sCodeCasino Like "DH*" Or sCodeCasino Like "DM*" Then
        If Format(Int(Val(Mid(sCodeCasino, 3)))) <> Mid(sCodeCasino, 3) Then
          MsgBox "Code Cafeteria Casino incorrect: doit être de la forme DVnnn, DHnnn, DMnnn, où nnn représente de 1 à 3 chiffres sans espace", vbExclamation, App.Title
          Page "Id"
          colChamps("etb_infocli").SetFocus
          Exit Function
        End If
      Else
        MsgBox "Code Cafeteria Casino incorrect: doit être de la forme DVnnn, DHnnn, DMnnn", vbExclamation, App.Title
        Page "Id"
        colChamps("etb_infocli").SetFocus
        Exit Function
      End If
    End If
  End If
  
  
  ' Contrôles groupés
  If Not bOkValeursEnvoi(bOpGen:=False) Then Exit Function
  If Not bOkValeursFacturation(bOpGen:=False) Then Exit Function
  
  ' Plein de tests à implanter !
  
 
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function



' Vérifie que les champs contiennent des valeurs légales pour une opération générale
' La valeur vide est toujours légale
Private Function bOkValeursOpGen() As Boolean
  Dim iOld As Integer
  
  bOkValeursOpGen = False

  If bdcPays <> "" Then
    bdcPays.Synchronise
    If bdcPays.ListIndex < 0 Then
      MsgBox "Pays inconnu !", vbExclamation, App.Title
      bdcPays.SetFocus
      Exit Function
    End If
  End If
  
  ' La zone commerciale ne concerne que la France
  If iSystèmePays = 0 Then
    If bdcZoneComm <> "" Then
      bdcZoneComm.Synchronise
      If bdcZoneComm.ListIndex < 0 Then
        MsgBox "Zone commerciale inconnue !", vbExclamation, App.Title
        bdcZoneComm.SetFocus
        Exit Function
      End If
    End If
  End If
  
  If bdcSecteur <> "" Then
    If bdcSecteur.ListIndex < 0 Then
      SynchroSec
      If bdcSecteur.ListIndex < 0 Then
        MsgBox "Secteur inconnu !", vbExclamation, App.Title
        bdcSecteur.SetFocus
        Exit Function
      End If
    End If
  End If

  ' Contrôle du labo
  If bdcLabo <> "" Then
    bdcLabo.Synchronise
    If bdcLabo.ListIndex < 0 Then
      MsgBox "Labo inconnu !", vbExclamation, App.Title
      bdcLabo.SetFocus
      Exit Function
    End If
  End If
  
  
  ' Contrôles groupés
  If Not bOkValeursEnvoi(bOpGen:=True) Then Exit Function
  If Not bOkValeursFacturation(bOpGen:=True) Then Exit Function


  bOkValeursOpGen = True
End Function




Private Function bOkValeursEnvoi(bOpGen As Boolean) As Boolean
  bOkValeursEnvoi = False
  
  If bdcDécoupage <> "" Then
    bdcDécoupage.Synchronise
    If bdcDécoupage.ListIndex < 0 Then
      MsgBox "Règle de découpage à l'envoi incorrecte !", vbExclamation, App.Title
      Page "FME"
      bdcDécoupage.SetFocus
      Exit Function
    End If
  End If
  
  If bdcFME <> "" Then
    Dim iNb As Integer
    iNb = BDCurseurExpress("select count(*) from fme where fme_numfme=" & bdcFME)
    If iNb = 0 Then
      MsgBox "Numéro de FME inexistant.", vbExclamation, App.Title
      Page "FME"
      bdcFME.SetFocus
      Exit Function
    End If
  End If

  If bdcFEU <> "" Then
    iNb = BDCurseurExpress("select count(*) from feu where feu_numfeu=" & bdcFEU)
    If iNb = 0 Then
      MsgBox "Numéro de Feu inexistant.", vbExclamation, App.Title
      Page "FME"
      bdcFEU.SetFocus
      Exit Function
    End If
  End If

  bOkValeursEnvoi = True
End Function



Private Function bOkValeursFacturation(bOpGen As Boolean) As Boolean
  bOkValeursFacturation = False
  
  If bdcNCP <> "" Then
    bdcNCP.Synchronise
    If bdcNCP.ListIndex < 0 Then
      MsgBox "Niveau de calcul des prix incorrect !", vbExclamation, App.Title
      Page "Fact"
      bdcNCP.SetFocus
      Exit Function
    End If
  End If
  
  If bdcNDP <> "" Then
    bdcNDP.Synchronise
    If bdcNDP.ListIndex < 0 Then
      MsgBox "Détail de présentation des prix incorrect !", vbExclamation, App.Title
      Page "Fact"
      bdcNDP.SetFocus
      Exit Function
    End If
  End If
  
  ' Contrôle des mois de facturation
  If colChamps("etb_moisfact") = "" Then
    ' En opération générale, ne surtout pas remplir un champ à l'insu de l'utilisateur !!!!!
    If Not bOpGen Then colChamps("etb_moisfact") = "111111111111"
  Else
    If Len(colChamps("etb_moisfact")) <> 12 Then
      MsgBox "Les mois de facturation doivent être une suite de douze 1 (facture pour ce mois) ou 0 (pas de facture pour ce mois)", vbExclamation, App.Title
      Page "Fact"
      colChamps("etb_moisfact").SetFocus
      Exit Function
    End If
    
    Dim i As Integer
    For i = 1 To 12
      If Not Mid(colChamps("etb_moisfact"), i, 1) Like "[01]" Then
        MsgBox "Les mois de facturation doivent être une suite de douze 1 (facture pour ce mois) ou 0 (pas de facture pour ce mois)", vbExclamation, App.Title
        Page "Fact"
        colChamps("etb_moisfact").SetFocus
        Exit Function
      End If
    Next
  End If
  
  ' Contrôle du taux de ristourne
  If colChamps("etb_ristourne") <> "" Then
    Dim v As Double
    v = CDbl(colChamps("etb_ristourne"))
    If Abs(v) > 10 Then
      Dim s As String
      If v > 0 Then s = "d'augmentation" Else s = "de remise"
      MsgBox "ATTENTION, vous avez défini le taux de ristourne à " & colChamps("etb_ristourne") & ", soit plus de 10% " & s & " en pied de facture." & vbCrLf & "Assurez-vous qu'il n'y a pas d'erreur.", vbInformation, App.Title
    End If
  End If
  
  ' Contrôle du taux d'escompte
  If colChamps("etb_tauxescompte") <> "" Then
    v = CDbl(colChamps("etb_tauxescompte"))
    If Abs(v) > 10 Then
      MsgBox "ATTENTION, vous avez défini le taux d'escompte à " & colChamps("etb_escompte") & ", soit plus de 10%." & vbCrLf & "Assurez-vous qu'il n'y a pas d'erreur.", vbInformation, App.Title
    End If
  End If
  
  
  ' Ok !
  bOkValeursFacturation = True
End Function



' =============================================================================

Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  TrimCrLf colChamps("etb_fdr")
  TrimCrLf colChamps("etb_comment")

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  ' Génération du n° de série (mécanisme inhabituel)
  If colChamps("etb_numetb") = "" Then colChamps("etb_numetb") = iGetSerial("etb")
  
  Dim cEtbAdd As New BDCurseur
  cEtbAdd.OpenCurseur "select * from " & sTable & " where etb_numetb='0'"
  cEtbAdd.AddNew
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "etb", True
  
  ' Seuls les champs actifs sont mis à jour
  ActiveTraçabilité True
  ActiveChamp "etb_numetb", True

  If Not bPrépareEditAdd(cEtbAdd, colColonnes, colChamps) Then
    cEtbAdd.CloseCurseur
    ActiveTraçabilité False
    ActiveChamp "etb_numetb", False
    Exit Sub
  End If
  cEtbAdd.CloseCurseur
  
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cEtb Is Nothing Then cEtb.CloseCurseur
  Set cEtb = New BDCurseur
  
  sFinalWP = "etb_numetb=" & sFormToSQL(colChamps("etb_numetb"), BDTypeCHAR)
  sQuery = "select * from " & sTable & " where " & sFinalWP
  cEtb.OpenCurseur sQuery
  cEtb.MoveFirst
  
  ' On mémorise toutes les valeurs saisie par l'utilisateur
  EffaceCollection colHistorique
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colHistorique.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  ' Si on est en train d'ajouter un enregistrement, Historique
  If iMode = meAdd Then
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        ' On enregistre uniquement si les champs ne sont pas vides
        If ValeurContrôle(C) <> "" Then
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colHistorique(C.DataField)
        End If
      End If
    Next
    ' On enregistre dans le journal la trace de la création
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("etb_numetb"), "créé", sMsgTrace
    End If
  End If
  
  
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  bdSél.EmpêcheMouvements
  
  Mémorise
  
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cEtb Is Nothing

  If colChamps("etb_nom") <> sNormaliseNom(colChamps("etb_nom")) Then
    colChamps("etb_nom") = sNormaliseNom(colChamps("etb_nom"))
    MsgBox "Attention, le nom a été modifié pour correspondre aux règles générales de créations de nom (pas d'espaces en double, nom en majuscules, le É est la seule majuscule accentuée acceptée).", vbInformation, App.Title
  End If
  If colChamps("etb_prefixe") <> sNormaliseNom(colChamps("etb_prefixe")) Then
    colChamps("etb_prefixe") = sNormaliseNom(colChamps("etb_prefixe"))
    MsgBox "Attention, le préfixe a été modifié pour correspondre aux règles générales de créations de nom (pas d'espaces en double, nom en majuscules, le É est la seule majuscule accentuée acceptée).", vbInformation, App.Title
  End If

  TrimCrLf colChamps("etb_fdr")
  TrimCrLf colChamps("etb_comment")
  
  If bOpGénérale Then
    Dim sSQL As String
    
    If Not bOkValeursOpGen Then Exit Sub
    
    sSQL = "update " & sTable & " set "
    Dim t As Control, iNbChamp As Integer
    Dim sVal As String, sValSQL As String, sValInterne As String, sMsg As String
    For Each t In colChamps
      If t.Text = "=" Then
        If iNbChamp > 0 Then sSQL = sSQL & ","
        sSQL = sSQL & t.DataField & "=NULL"
        iNbChamp = iNbChamp + 1
      ElseIf t.Text <> "" Then
        bOkValType t.Text, colColonnes(t.DataField).iType, sValSQL, sValInterne, sMsg
        If iNbChamp > 0 Then sSQL = sSQL & ","
        sSQL = sSQL & t.DataField & "=" & sValSQL
        iNbChamp = iNbChamp + 1
      End If
    Next
    If iNbChamp = 0 Then
      MsgBox "Opération générale sans modification !" & vbCrLf & "Vous devez modifier au moins un champ pour lancer une opération générale, sinon annulez l'opération générale en cours.", vbExclamation, App.Title
      Exit Sub
    End If
    
    sSQL = sSQL & ",timestamp=current,etb_datemodif=current,etb_heuremodif=" & Hour(Now) * 100 + Minute(Now) & ",etb_opermodif=" & iNumOpérateur & " where " & sFinalWP
    If Not bOpérationGénérale(sTable, sSQL, sFinalWP) Then Exit Sub
    
    ' On ré-exécute la requête, sinon la bufférisation locale empêche l'affichage des champs modifiés
    SetMessage "Lecture des données modifiées, patientez…"
    Screen.MousePointer = vbHourglass
    If Not cEtb Is Nothing Then cEtb.CloseCurseur
    cEtb.OpenCurseur sQuery
    Screen.MousePointer = vbDefault
  
  Else  ' Modification classique

    If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
    If Not bOkValeurs Then Exit Sub
    cEtb.Edit
    
    ' Traçabilité ancien style
    InitTraçabilité colChamps, "etb", False
  
    ActiveTraçabilité True     ' Pour mettre à jour la base
  
    If Not bPrépareEditAdd(cEtb, colColonnes, colChamps) Then
      ActiveTraçabilité False
      Exit Sub
    End If
    
    ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a été changé
    If iMode = meChange Then
      Dim C As Control
      Dim sMsgTrace As String
      For Each C In Controls
        If DataFieldEx(C) <> "" Then
          If colHistorique(C.DataField) <> ValeurContrôle(C) Then  ' Modifié !
            If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
            sMsgTrace = sMsgTrace & C.DataField & ":" & colHistorique(C.DataField) & "->" & ValeurContrôle(C)
          End If
        End If
      Next
      If sMsgTrace <> "" Then
         JournalUnix sTable & " " & colChamps("etb_numetb"), "changé", sMsgTrace
      End If
    End If
  End If
  
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  AjusteMouvements
  
  Mémorise

  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


Private Sub ActionValidate()
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub





Private Sub ActionCancel()
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cEtb Is Nothing Then
    If Not (cEtb.EOF And cEtb.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, False
  ActiveFormulaire True
  
  colChamps("etb_numetb").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cEtb Is Nothing
  
  ' Opération générale = Shift+Changement
  bOpGénérale = bShiftPressed
  
  If cEtb.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
'If bOkAccèsPrivilégié(colChamps("etb_numetb"), "ChangeEtb", "Modification établissement") Then
'  MsgBox "Modif OK"
'Else
'  MsgBox "Modif refusée !"
'End If

  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "etb_numetb", False
  ActiveChamp "etb_etat", False
  ActiveChamp "timestamp", False
  ActiveChamp "etb_ddt", False
  ActiveTraçabilité False
  
  If bOpGénérale Then ActiveChamp "etb_nom", False    ' Sécurité...
  
  colChamps("etb_prefixe").SetFocus
  AutoSelect colChamps("etb_prefixe"), True
  bdSél.TabStop = False
  
  iMode = meChange
  
  ' On mémorise les valeurs avant le changement
  EffaceCollection colHistorique
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colHistorique.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  If bOpGénérale Then
    SetMessage "OPÉRATION GÉNÉRALE - Définissez les champs modifiés, puis validez [Entrée] ou abandonnez [Échap]"
    EffaceFormulaire
  Else
    SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
  End If
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)

  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "etb_numetb", False
  ActiveChamp "timestamp", False
  ActiveChamp "etb_ddt", False
  ActiveTraçabilité False
  
  ' Valeurs par défaut
  bdcPays = iSystèmePays
  If cSystèmeProprio Like "[EFS]" Then
    bdcProprio = "S"
  Else
    bdcProprio = cSystèmeProprio
  End If
  bdcEdLangue = cSystèmeLang
  bdcLangue(1) = cSystèmeLang
  bdcLangue(2) = cSystèmeLang
  bdcLangue(3) = cSystèmeLang
  bdcLangue(4) = cSystèmeLang
  If cSystèmeProprio = "E" Then
    colChamps("etb_gestrict") = "O"
  Else
    colChamps("etb_gestrict") = "N"
  End If
  colChamps("etb_tva") = "O"            ' Sinon etbs sans TVA
  colChamps("etb_impdateana") = "O"     ' On imprime la date d'analyse par défaut
  If iSystèmePays = 0 Then colChamps("etb_feu") = 1
  colChamps("etb_themedefaut") = 0
  
  ' Labos par défaut
  ' Pour la France, on remplit à la main
  Select Case cSystèmeCA
    Case "B": bdcLabo = "B"       ' Italie
    Case "K": bdcLabo = "K"       ' UK
    Case "X": bdcLabo = "X"       ' Belgique
  End Select
  
  ' Pour les pays étrangers, les champs obligatoires de la facturation
  ' sont remplis avec des valeurs par défaut factices
  If cSystèmeCA Like "[BKX]" Then
    bdcNCP = 1
    bdcNDP = 1
  End If
  
  ' Nouveaux champs
  colChamps("etb_avispassage") = "N"
  colChamps("etb_decoupage") = "a"
  colChamps("etb_fpstandard") = "O"
  
  colChamps("etb_prefixe").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub AjouteWeb()
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'opération en cours avant de faire un ajout Web !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim vReq As Variant
  vReq = InputBox("N° de la requête Web d'ajout ?")
  If vReq = "" Or Not IsNumeric(vReq) Then Exit Sub
  
  Dim cWeb As New BDCurseur
  cWeb.OpenCurseur "select cre_serie, cre_etat, cre_origine, cre_operation, cre_numetb, cre_numsec," & _
  "cre_nom, cre_nom2, cre_altnom, cre_rue, cre_rue2, cre_altrue,cre_loc, cre_loc2, cre_altloc, cre_cpost, cre_cpost2, cre_altcpost," & _
  "cre_bdist, cre_bdist2, cre_altbdist, cre_pays, cre_unite, cre_rayon,cre_datetarif, cre_prefixe, cre_codecli, cre_infocli," & _
  "cre_optedition, cre_optlabo, cre_zone, cre_contraintes,cre_ddclient, cre_ddmarque, cre_edlangue," & _
  "cre_typeh1, cre_typeh2, cre_typeh3, cre_typeh4,cre_sceeh1, cre_sceeh2, cre_sceeh3, cre_sceeh4," & _
  "cre_langeh1, cre_langeh2, cre_langeh3, cre_langeh4,cre_libelles1, cre_libelles2, cre_libelles3, cre_libelles4, cre_libelles5," & _
  "cre_libelles6, cre_prixs1, cre_prixs2, cre_prixs3, cre_prixs4, cre_prixs5,cre_prixs6, cre_fact,cre_tva, cre_codetva, cre_gestrict," & _
  "cre_prest, cre_refcom, cre_corresp, cre_corresp2,cre_proprio, cre_comment, cre_fdr, cre_blprix, cre_nbran, cre_ape, cre_rdia," & _
  "cre_tel,cre_tel2, cre_fax, cre_fax2, cre_feu,cre_fme, cre_altadr,cre_datedebinterv,cre_niveauinterv, cre_compta1,cre_compta2," & _
  "cre_prix0 , cre_prix1, cre_prix2, cre_prix3, cre_prix4, cre_prix5" & _
  " from creetb where cre_serie=" & vReq
  If cWeb.EOF Then
    MsgBox "Requête inconnue, ajout interrompu.", vbExclamation, App.Title
    Exit Sub
  End If

'  If cWeb!cre_etat <> "V" Then
'    MsgBox "La requête n'est pas à l'état V, ajout interompu.", vbExclamation, app.title
'    Exit Sub
'  End If

  If cWeb!cre_operation <> "C" Then
    MsgBox "Il ne s'agit pas d'une requête de création, ajout interompu.", vbExclamation, App.Title
    Exit Sub
  End If

  ActionAdd
  colChamps("etb_origine") = NV(cWeb!cre_origine)
  colChamps("etb_numsec") = NV(cWeb!cre_numsec)
  colChamps("etb_nom") = sNormaliseNom(NV(cWeb!cre_nom))
  colChamps("etb_nom2") = sNormaliseNom(NV(cWeb!cre_nom2))
  colChamps("etb_altnom") = sNormaliseNom(NV(cWeb!cre_altnom))
  colChamps("etb_rue") = NV(cWeb!cre_rue)
  colChamps("etb_rue2") = NV(cWeb!cre_rue2)
  colChamps("etb_altrue") = NV(cWeb!cre_altrue)
  colChamps("etb_loc") = NV(cWeb!cre_loc)
  colChamps("etb_loc2") = NV(cWeb!cre_loc2)
  colChamps("etb_altloc") = NV(cWeb!cre_altloc)
  colChamps("etb_cpost") = NV(cWeb!cre_cpost)
  colChamps("etb_cpost2") = NV(cWeb!cre_cpost2)
  colChamps("etb_altcpost") = NV(cWeb!cre_altcpost)
  colChamps("etb_bdist") = NV(cWeb!cre_bdist)
  colChamps("etb_bdist2") = NV(cWeb!cre_bdist2)
  colChamps("etb_altbdist") = NV(cWeb!cre_altbdist)
  colChamps("etb_pays") = NV(cWeb!cre_pays)
  colChamps("etb_unite") = NV(cWeb!cre_unite)
  colChamps("etb_rayon") = NV(cWeb!cre_rayon)
  colChamps("etb_datetarif") = NV(cWeb!cre_datetarif)
  colChamps("etb_prefixe") = sNormaliseNom(NV(cWeb!cre_prefixe))
  colChamps("etb_code") = NV(cWeb!cre_codecli)
  colChamps("etb_infocli") = NV(cWeb!cre_infocli)
  colChamps("etb_optedition") = NV(cWeb!cre_optedition)
  colChamps("etb_optlabo") = NV(cWeb!cre_optlabo)
  colChamps("etb_zone") = NV(cWeb!cre_zone)
  colChamps("etb_contraintes") = NV(cWeb!cre_contraintes)
  colChamps("etb_ddclient") = NV(cWeb!cre_ddclient)
  colChamps("etb_ddmarque") = NV(cWeb!cre_ddmarque)
  colChamps("etb_edlangue") = NV(cWeb!cre_edlangue)
  colChamps("etb_typeh1") = NV(cWeb!cre_typeh1)
  colChamps("etb_typeh2") = NV(cWeb!cre_typeh2)
  colChamps("etb_typeh3") = NV(cWeb!cre_typeh3)
  colChamps("etb_typeh4") = NV(cWeb!cre_typeh4)
  colChamps("etb_sceeh1") = NV(cWeb!cre_sceeh1)
  colChamps("etb_sceeh2") = NV(cWeb!cre_sceeh2)
  colChamps("etb_sceeh3") = NV(cWeb!cre_sceeh3)
  colChamps("etb_sceeh4") = NV(cWeb!cre_sceeh4)
  colChamps("etb_langeh1") = NV(cWeb!cre_langeh1)
  colChamps("etb_langeh2") = NV(cWeb!cre_langeh2)
  colChamps("etb_langeh3") = NV(cWeb!cre_langeh3)
  colChamps("etb_langeh4") = NV(cWeb!cre_langeh4)
  colChamps("etb_libelles1") = NV(cWeb!cre_libelles1)
  colChamps("etb_libelles2") = NV(cWeb!cre_libelles2)
  colChamps("etb_libelles3") = NV(cWeb!cre_libelles3)
  colChamps("etb_libelles4") = NV(cWeb!cre_libelles4)
  colChamps("etb_libelles5") = NV(cWeb!cre_libelles5)
  colChamps("etb_libelles6") = NV(cWeb!cre_libelles6)
  colChamps("etb_prixs1") = NV(cWeb!cre_prixs1)
  colChamps("etb_prixs2") = NV(cWeb!cre_prixs2)
  colChamps("etb_prixs3") = NV(cWeb!cre_prixs3)
  colChamps("etb_prixs4") = NV(cWeb!cre_prixs4)
  colChamps("etb_prixs5") = NV(cWeb!cre_prixs5)
  colChamps("etb_prixs6") = NV(cWeb!cre_prixs6)
  colChamps("etb_fact") = NV(cWeb!cre_fact)
  colChamps("etb_tva") = NV(cWeb!cre_tva)
  colChamps("etb_codetva") = NV(cWeb!cre_codetva)
  colChamps("etb_gestrict") = NV(cWeb!cre_gestrict)
  colChamps("etb_prest") = NV(cWeb!cre_prest)
  colChamps("etb_refcom") = NV(cWeb!cre_refcom)
  colChamps("etb_corresp") = NV(cWeb!cre_corresp)
  colChamps("etb_corresp2") = NV(cWeb!cre_corresp2)
  colChamps("etb_proprio") = NV(cWeb!cre_proprio)
  colChamps("etb_comment") = NV(cWeb!cre_comment)
  colChamps("etb_fdr") = NV(cWeb!cre_fdr)
  colChamps("etb_blprix") = NV(cWeb!cre_blprix)
  colChamps("etb_nbran") = NV(cWeb!cre_nbran)
  colChamps("etb_rdia") = NV(cWeb!cre_rdia)
  colChamps("etb_tel") = NV(cWeb!cre_tel)
  colChamps("etb_tel2") = NV(cWeb!cre_tel2)
  colChamps("etb_fax") = NV(cWeb!cre_fax)
  colChamps("etb_fax2") = NV(cWeb!cre_fax2)
  colChamps("etb_feu") = NV(cWeb!cre_feu)
  colChamps("etb_fme") = NV(cWeb!cre_fme)
  colChamps("etb_altadr") = NV(cWeb!cre_altadr)
  colChamps("etb_datedebinterv") = NV(cWeb!cre_datedebinterv)
  colChamps("etb_niveauinterv") = NV(cWeb!cre_niveauinterv)
  'colChamps("etb_compta1") = NV(cWeb!cre_compta1)
  'colChamps("etb_compta2") = NV(cWeb!cre_compta2)
  ' ATTENTION A L'ORDRE QUI SUIT !!!
  colChamps("etb_prix0") = NV(cWeb!cre_prix0)
  colChamps("etb_prix1") = NV(cWeb!cre_prix2)
  colChamps("etb_prix2") = NV(cWeb!cre_prix1)
  colChamps("etb_prix3") = NV(cWeb!cre_prix5)
  colChamps("etb_prix4") = NV(cWeb!cre_prix3)
  colChamps("etb_prix5") = NV(cWeb!cre_prix4)
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cEtb Is Nothing
  
  If cEtb.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  If bShiftPressed Then
    ActionDétruit             ' Détruit l'enregistrement
  Else
    ActionSupprime            ' Marque l'enregistrement supprimé (état S)
  End If
End Sub


Public Sub ActionSupprime()   ' Marque l'enregistrement supprimé (état S)
  If colChamps("etb_etat") <> "" Then
    MsgBox "Déjà supprimé (état " & colChamps("etb_etat") & ")", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, vous allez basculer l'enregistrement à l'état S (supprimé)." & vbCrLf & "Vous pourrez ultérieurement restaurer l'enregistrement à l'état normal en choisissant le menu Commandes, Récupère un enregistrement supprimé." & vbCrLf & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  cEtb.Edit
  cEtb!etb_etat = "S"
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "etb", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
  bPrépareEditAdd cEtb, colColonnes, colChamps
  ActiveTraçabilité False
  
  ' On spécifie dans l'historique des modifications que le numéro X est passé à l'état de supprimé
  Dim sMsgTrace As String
  sMsgTrace = colChamps("etb_numetb") & " -> Etat S"
    If cEtb!etb_etat = "S" Then
       If sMsgTrace <> "" Then
          JournalUnix sTable & " " & colChamps("etb_numetb"), "supprimé", sMsgTrace
       End If
    End If
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub


Public Sub Récupère()   ' Récupère un enregistrement supprimé (état S)
  If colChamps("etb_etat") = "" Then
    MsgBox "Vous ne pouvez récupérer qu'un enregistrement supprimé (état S) ou zombie (état Z).", vbExclamation, App.Title
    Exit Sub
  End If
  
  cEtb.Edit
  cEtb!etb_etat = Null
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "etb", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
  bPrépareEditAdd cEtb, colColonnes, colChamps
  ActiveTraçabilité False
  
  ' Si on veut récupérer, on le mentionne ds l'historique
  Dim sMsgTrace As String
  sMsgTrace = colChamps("etb_numetb") & " -> Récup"
  If sMsgTrace <> "" Then
        JournalUnix sTable & " " & colChamps("etb_numetb"), "récupéré", sMsgTrace
  End If
  
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub


Public Sub ActionDétruit()
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  If colChamps("etb_etat") = "" Then
    MsgBox "Vous ne pouvez pas détruire un enregistrement sans l'avoir au préalable supprimé (état S ou Z)", vbExclamation, App.Title
    If Not bShiftPressed Then Exit Sub
  End If
  
  ' Historique
  Dim sMsgTrace As String
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContrôle(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & ValeurContrôle(C)
         End If
      End If
  Next
  
  On Error Resume Next
  cEtb.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  ' On garde la trace de la destruction
  JournalUnix sTable & " " & colChamps("etb_numetb"), "détruit", sMsgTrace
  
  ' synchrodelete est mis à jour par un trigger
  
  cEtb.MoveNext
  If cEtb.EOF Then
    cEtb.MovePrevious
    If cEtb.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  bdSél.ActiveMouvements iMode = meNavigate
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


'=================================================================================

Private Sub ActiveTraçabilité(bEnable As Boolean)
  ActiveChamp "etb_datecreat", bEnable
  ActiveChamp "etb_heurecreat", bEnable
  ActiveChamp "etb_opercreat", bEnable
  ActiveChamp "etb_datemodif", bEnable
  ActiveChamp "etb_heuremodif", bEnable
  ActiveChamp "etb_opermodif", bEnable
  ActiveChamp "etb_tsvalid", bEnable
  ActiveChamp "etb_opervalid", bEnable
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cEtb Is Nothing

  bdSél.ButtonEnabled("First") = cEtb.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cEtb.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cEtb.EOF
  bdSél.ButtonEnabled("Last") = Not cEtb.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cEtb.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cEtb.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cEtb.MoveNext
  AjusteMouvements
  If cEtb.EOF Then cEtb.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cEtb.MovePrevious
  AjusteMouvements
  If cEtb.BOF Then cEtb.MoveFirst
  SynchroniseFormulaire
End Sub




'=================================================================================
' Actions du sélecteur

Private Sub bdSél_ActionAdd():      ActionAdd:      End Sub
Private Sub bdSél_ActionCancel():   ActionCancel:   End Sub
Private Sub bdSél_ActionChange():   ActionChange:   End Sub
Private Sub bdSél_ActionDelete():   ActionDelete:   End Sub
Private Sub bdSél_ActionFirst():    ActionFirst:    End Sub
Private Sub bdSél_ActionLast():     ActionLast:     End Sub
Private Sub bdSél_ActionNext():     ActionNext:     End Sub
Private Sub bdSél_ActionPrevious(): ActionPrevious: End Sub
Private Sub bdSél_ActionQuery():    ActionQuery:    End Sub
Private Sub bdSél_ActionValidate(): ActionValidate: End Sub

Private Sub btnHistorique_Click()
  Historique
End Sub

Public Sub DernierNo()
  On Error GoTo Problème
  Dim s As Long
  s = BDCurseurExpress("select max(serialetb) from serialetb")
  If iMode = meEmpty Then AfficheEtablissement "etb_numetb=" & Chr(34) & s & Chr(34)
  MsgBox "Dernier n° d'établissement créé: " & s, vbInformation, App.Title
  Exit Sub
  
Problème:
  MsgBox "Désolé, cette fonction n'est pas disponible sur ce système.", vbExclamation, App.Title
End Sub


' ==============================================================================
' Nouveautés

'Private Sub btnNouveau_Click(Index As Integer)
'  Select Case btnNouveau(Index).Tag
'    Case "etb_impdateana":    Nouveau "Ce champ indique si on imprime la date d'analyse sur le rapport d'analyse."
'    Case Else: Nouveau "Champ " & btnNouveau(Index).Tag & " non documenté !"
'  End Select
'End Sub
'
'Private Sub Nouveau(ByVal sMsg As String)
'  MsgBox Replace(sMsg, "|", vbCrLf), vbInformation, App.Title & " - Nouveautés"
'End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  Dim C As Control
  
  ResetChienDeGarde
  
' Changement d'onglet avec PgPrec/PgSuiv
  If KeyCode = vbKeyPageUp Then
    If tsTab.SelectedItem.Index > 1 Then Page tsTab.SelectedItem.Index - 1
    KeyCode = 0
  ElseIf KeyCode = vbKeyPageDown Then
    If tsTab.SelectedItem.Index < tsTab.Tabs.Count Then Page tsTab.SelectedItem.Index + 1
    KeyCode = 0
  ElseIf KeyCode = vbKeyF5 Then   ' Mémoire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set C = ActiveControl
          C = colMémoireEtablissement(ActiveControl.DataField)
          C.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each C In colChamps
        If Not C.Locked Then      ' On ne remplit pas les champs verrouillés
          C = colMémoireEtablissement(C.DataField)
        End If
      Next
    End If
  Else
    bdSél.KeyDown KeyCode
  End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
End Sub

' Menu de commandes contextuel pour chaque feuille

Private Sub fraFeuille_MouseDown(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
If Button = 2 Then    ' Bouton droit
    PopupMenu MDIServeur.mnuCommandes
  End If
End Sub

' Champs en majuscules
' Pour les TextBox, c'est géré dans BDForm

Private Sub bdcEdLangue_Change()
  ToMaj bdcEdLangue
End Sub

Private Sub bdcLangue_Change(Index As Integer)
  ToMaj bdcLangue(Index)
End Sub

Private Sub bdcProprio_Change()
  ToMaj bdcProprio
End Sub

Private Sub bdcTypeFact_Change()
  ToMaj bdcTypeFact
End Sub

Private Sub bdcLabo_Change()
  ToMaj bdcLabo
End Sub

Private Sub bdcIdAuchan_Change()
  ToMaj bdcIdAuchan
End Sub

Private Sub bdcDécoupage_Change()
  ToMin bdcDécoupage
End Sub


' ===============================================================
' Gestion des onglets

' Change le frame affiché
Private Sub Page(ByVal sPage)
  ' On ne change que l'onglet, ce code appelle automatiquement tsTab_Click
  Set tsTab.SelectedItem = tsTab.Tabs(sPage)
End Sub



Private Sub tsTab_Click()
  ' Utilise le mécanisme visible/invisible comme il est conseillé dans l'aide
  ' et contrairement à la doc qui prône l'usage du ZOrder…
  ' Avantage: (entre autres, voir l'aide) évite les conflits d'accélérateurs entre pages
  If tsTab.SelectedItem.Index = iCurFrame Then Exit Sub     ' Inutile de changer le cadre.
  ' Sinon, masque l'ancien cadre et affiche le nouveau.
  fraFeuille(tsTab.SelectedItem.Index).Visible = True
  If iCurFrame >= 0 Then fraFeuille(iCurFrame).Visible = False
  iCurFrame = tsTab.SelectedItem.Index
  
  ' Accompagnement du focus
  On Error Resume Next
  Select Case tsTab.SelectedItem.Key
    Case "Id":    colChamps("etb_rue").SetFocus
    Case "Prest": colChamps("etb_prest").SetFocus
    Case "EH":    bckCheck(0).SetFocus
    Case "FME":   colChamps("etb_nom2").SetFocus
    Case "Fact":  colChamps("etb_altadr").SetFocus
    Case "Com":   colChamps("etb_facture").SetFocus
    Case "Tra":   colChamps("etb_etat").SetFocus
    Case Else: Stop
  End Select
  
  AffichagesSpécifiques
End Sub


'=================================================================================
' Fonctions de service (form)

Private Sub Form_Load()
  Internationalisation
  
  Screen.MousePointer = vbHourglass
  
  ' On met les frames en tête de pile d'affichage, sinon certains sont derrière le tsTab
  Dim F As Frame
  For Each F In fraFeuille
    F.ZOrder 0
    F.BackColor = &H8000000F
  Next
  
  Show
  iCurFrame = -1   ' Pour forcer le passage à la page 0
  Page "Id"
  
  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  ' Chargement des combos
  ' Utilisateurs
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcOperModif.AddItem u.uti_numuti, u.uti_nom
    bdcOperValid.AddItem u.uti_numuti, u.uti_nom
  Next
  
  ' Pays
  Dim p As Pays
  For Each p In colPays
    bdcPays.AddItem p.pay_pays, p.pay_libelle
  Next
  
  ' Langues
  Dim L As Langue
  For Each L In colLangue
    bdcLangue(1).AddItem L.lan_code, L.lan_langue
    bdcLangue(2).AddItem L.lan_code, L.lan_langue
    bdcLangue(3).AddItem L.lan_code, L.lan_langue
    bdcLangue(4).AddItem L.lan_code, L.lan_langue
    bdcEdLangue.AddItem L.lan_code, L.lan_langue
  Next

  ' Unités
  Dim n As Unité
  For Each n In colUnité
    bdcUnité.AddItem n.uni_numunite, n.uni_code
  Next
  
  ' Types de facture
  bdcTypeFact.AddItem "V", "Visite"
  bdcTypeFact.AddItem "I", "Individuelle"
  bdcTypeFact.AddItem "G", "Groupée"
  
  ' Niveau d'intervenant
  bdcNiveauIntervenant.AddItem 1, "Assistant Préleveur (AP)"
  bdcNiveauIntervenant.AddItem 2, "Assistant Conseil (AC)"
  bdcNiveauIntervenant.AddItem 3, "Conseil Hygiène Qualité (CHQ)"
  bdcNiveauIntervenant.AddItem 4, "Consultants (C)"
  
  ' Rayons
  Dim r As Rayon
  For Each r In colRayon
    bdcRayon.AddItem r.ray_indice, r.ray_libelle
  Next
  
  ' Propriétaires
  Dim pr As Proprio
  For Each pr In colProprio
    bdcProprio.AddItem pr.pr_proprio, pr.pr_nom
  Next
  
  'chargement du combo thème défaut
  bdcThèmeDéfaut.AddItem 0, "Thème classique"
    
  ' Zones commerciales
  ' Devrait être basé sur la table zonecomm, mais en attendant...
  If iSystèmePays = 0 Then
    bdcZoneComm.AddItem 0, "(Hors zone)"
    bdcZoneComm.AddItem 1, "Ain"
    bdcZoneComm.AddItem 2, "Aisne"
    bdcZoneComm.AddItem 3, "Allier"
    bdcZoneComm.AddItem 4, "Alpes-de-Haute-Provence"
    bdcZoneComm.AddItem 5, "Hautes-Alpes"
    bdcZoneComm.AddItem 6, "Alpes-Maritimes"
    bdcZoneComm.AddItem 7, "Ardèche"
    bdcZoneComm.AddItem 8, "Ardennes"
    bdcZoneComm.AddItem 9, "Ariège"
    bdcZoneComm.AddItem 10, "Aube"
    bdcZoneComm.AddItem 11, "Aude"
    bdcZoneComm.AddItem 12, "Aveyron"
    bdcZoneComm.AddItem 13, "Bouches-du-Rhône"
    bdcZoneComm.AddItem 14, "Calvados"
    bdcZoneComm.AddItem 15, "Cantal"
    bdcZoneComm.AddItem 16, "Charente"
    bdcZoneComm.AddItem 17, "Charente-Maritime"
    bdcZoneComm.AddItem 18, "Cher"
    bdcZoneComm.AddItem 19, "Corrèze"
    bdcZoneComm.AddItem 20, "Corse (Corse-du-Sud et Haute-Corse)"
    bdcZoneComm.AddItem 21, "Côte-d’Or"
    bdcZoneComm.AddItem 22, "Côtes-du-Nord"
    bdcZoneComm.AddItem 23, "Creuse"
    bdcZoneComm.AddItem 24, "Dordogne"
    bdcZoneComm.AddItem 25, "Doubs"
    bdcZoneComm.AddItem 26, "Drôme"
    bdcZoneComm.AddItem 27, "Eure"
    bdcZoneComm.AddItem 28, "Eure-et-Loir"
    bdcZoneComm.AddItem 29, "Finistère"
    bdcZoneComm.AddItem 30, "Gard"
    bdcZoneComm.AddItem 31, "Haute-Garonne"
    bdcZoneComm.AddItem 32, "Gers"
    bdcZoneComm.AddItem 33, "Gironde"
    bdcZoneComm.AddItem 34, "Hérault"
    bdcZoneComm.AddItem 35, "Ille-et-Vilaine"
    bdcZoneComm.AddItem 36, "Indre"
    bdcZoneComm.AddItem 37, "Indre-et-Loire"
    bdcZoneComm.AddItem 38, "Isère"
    bdcZoneComm.AddItem 39, "Jura"
    bdcZoneComm.AddItem 40, "Landes"
    bdcZoneComm.AddItem 41, "Loir-et-Cher"
    bdcZoneComm.AddItem 42, "Loire"
    bdcZoneComm.AddItem 43, "Haute-Loire"
    bdcZoneComm.AddItem 44, "Loire-Atlantique"
    bdcZoneComm.AddItem 45, "Loiret"
    bdcZoneComm.AddItem 46, "Lot"
    bdcZoneComm.AddItem 47, "Lot-et-Garonne"
    bdcZoneComm.AddItem 48, "Lozère"
    bdcZoneComm.AddItem 49, "Maine-et-Loire"
    bdcZoneComm.AddItem 50, "Manche"
    bdcZoneComm.AddItem 51, "Marne"
    bdcZoneComm.AddItem 52, "Haute-Marne"
    bdcZoneComm.AddItem 53, "Mayenne"
    bdcZoneComm.AddItem 54, "Meurthe-et-Moselle"
    bdcZoneComm.AddItem 55, "Meuse"
    bdcZoneComm.AddItem 56, "Morbihan"
    bdcZoneComm.AddItem 57, "Moselle"
    bdcZoneComm.AddItem 58, "Nièvre"
    bdcZoneComm.AddItem 59, "Nord"
    bdcZoneComm.AddItem 60, "Oise"
    bdcZoneComm.AddItem 61, "Orne"
    bdcZoneComm.AddItem 62, "Pas-de-Calais"
    bdcZoneComm.AddItem 63, "Puy-de-Dôme"
    bdcZoneComm.AddItem 64, "Pyrénées-Atlantiques"
    bdcZoneComm.AddItem 65, "Hautes-Pyrénées"
    bdcZoneComm.AddItem 66, "Pyrénées-Orientales"
    bdcZoneComm.AddItem 67, "Bas-Rhin"
    bdcZoneComm.AddItem 68, "Haut-Rhin"
    bdcZoneComm.AddItem 69, "Rhône"
    bdcZoneComm.AddItem 70, "Haute-Saône"
    bdcZoneComm.AddItem 71, "Saône-et-Loire"
    bdcZoneComm.AddItem 72, "Sarthe"
    bdcZoneComm.AddItem 73, "Savoie"
    bdcZoneComm.AddItem 74, "Haute-Savoie"
    bdcZoneComm.AddItem 75, "Paris"
    bdcZoneComm.AddItem 76, "Seine-Maritime"
    bdcZoneComm.AddItem 77, "Seine-et-Marne"
    bdcZoneComm.AddItem 78, "Yvelines"
    bdcZoneComm.AddItem 79, "Deux-Sèvres"
    bdcZoneComm.AddItem 80, "Somme"
    bdcZoneComm.AddItem 81, "Tarn"
    bdcZoneComm.AddItem 82, "Tarn-et-Garonne"
    bdcZoneComm.AddItem 83, "Var"
    bdcZoneComm.AddItem 84, "Vaucluse"
    bdcZoneComm.AddItem 85, "Vendée"
    bdcZoneComm.AddItem 86, "Vienne"
    bdcZoneComm.AddItem 87, "Haute-Vienne"
    bdcZoneComm.AddItem 88, "Vosges"
    bdcZoneComm.AddItem 89, "Yonne"
    bdcZoneComm.AddItem 90, "Territoire-de-Belfort"
    bdcZoneComm.AddItem 91, "Essonne"
    bdcZoneComm.AddItem 92, "Hauts-de-Seine"
    bdcZoneComm.AddItem 93, "Seine-St-Denis"
    bdcZoneComm.AddItem 94, "Val-de-Marne"
    bdcZoneComm.AddItem 95, "Val-d’Oise"
    bdcZoneComm.AddItem 98, "Monaco"
    bdcZoneComm.AddItem 75001, "Paris 1er"
    bdcZoneComm.AddItem 75002, "Paris 2ème"
    bdcZoneComm.AddItem 75003, "Paris 3ème"
    bdcZoneComm.AddItem 75004, "Paris 4ème"
    bdcZoneComm.AddItem 75005, "Paris 5ème"
    bdcZoneComm.AddItem 75006, "Paris 6ème"
    bdcZoneComm.AddItem 75007, "Paris 7ème"
    bdcZoneComm.AddItem 75008, "Paris 8ème"
    bdcZoneComm.AddItem 75009, "Paris 9ème"
    bdcZoneComm.AddItem 75010, "Paris 10ème"
    bdcZoneComm.AddItem 75011, "Paris 11ème"
    bdcZoneComm.AddItem 75012, "Paris 12ème"
    bdcZoneComm.AddItem 75013, "Paris 13ème"
    bdcZoneComm.AddItem 75014, "Paris 14ème"
    bdcZoneComm.AddItem 75015, "Paris 15ème"
    bdcZoneComm.AddItem 75016, "Paris 16ème"
    bdcZoneComm.AddItem 75017, "Paris 17ème"
    bdcZoneComm.AddItem 75018, "Paris 18ème"
    bdcZoneComm.AddItem 75019, "Paris 19ème"
    bdcZoneComm.AddItem 75020, "Paris 20ème"
  Else
    ' Champ non obligatoire à l'étranger
    colColonnes("etb_zcom").bRequired = False
    'bdcZoneComm.Enabled = False
    'bdcZoneComm.BackColor = &H8000000F
    'bdcZoneComm.TabStop = False
  End If
  
  ' Modes de règlement
  bdcModeRèglement.AddItem 1, "Chèque"
  bdcModeRèglement.AddItem 2, "Traite"
  bdcModeRèglement.AddItem 3, "Virement"
  bdcModeRèglement.AddItem 4, "LCR à l'acceptation"
  bdcModeRèglement.AddItem 6, "Contentieux"
  bdcModeRèglement.AddItem 7, "Prélèvement"
  bdcModeRèglement.AddItem 8, "Mandat administratif"
  
  ' Comptes collectifs
  If iSystèmePays = 0 Then
    bdcCollectif.AddItem "4110000000", "Clients ordinaires"
    bdcCollectif.AddItem "4119010000", "Exportation intracommunautaire"
    bdcCollectif.AddItem "4119020000", "Clients exonérés de TVA"
    bdcCollectif.AddItem "4119030000", "Exportation extracommunautaire"
    bdcCollectif.AddItem "4160000000", "Clients douteux"
  Else
    ' Champ non obligatoire à l'étranger
    colColonnes("etb_collectif").bRequired = False
  End If
  
  ' Labos
  bdcLabo.AddItem "-", "(Pas de labo)"
  bdcLabo.AddItem "H", "Roanne (hagar)"
  bdcLabo.AddItem "C", "Cergy (cergy)"
  bdcLabo.AddItem "T", "La Rochelle (tripoli)"
  bdcLabo.AddItem "R", "Fontaine (microbe)"
  bdcLabo.AddItem "O", "Osny (osny)"
  bdcLabo.AddItem "B", "Bergamo (bergamo)"
  bdcLabo.AddItem "X", "St-Niklaas (brux)"
  bdcLabo.AddItem "K", "Birmingham (kilt)"
  
  ' Id Auchan
  bdcIdAuchan.AddItem "M", "Amont"
  bdcIdAuchan.AddItem "F", "Aval"
  bdcIdAuchan.AddItem "C", "Contre-expertise"
  
  ' Niveau de calcul des prix
  bdcNCP.AddItem "1", "Préparation automatique forfait et document"
  bdcNCP.AddItem "2", "Préparation automatique forfait, document et paramètre"
  bdcNCP.AddItem "3", "Préparation automatique forfait et paramètre"
  bdcNCP.AddItem "4", "Préparation à valider forfait et document"
  
  ' Niveau de présentation des prix
  bdcNDP.AddItem "0", "Total prestation uniquement"
  bdcNDP.AddItem "1", "Total par famille (3 AB pour 450 F, 1 EH à 350 F)"
  bdcNDP.AddItem "2", "Détail par famille (1 AB a 130 F, 1 AB à 180 F, 1 AB à 140 F, 1 EH à 350 F)"
  bdcNDP.AddItem "3", "Détail par paramètre ou par Paramètre, chaque analyse présentée séparément"
  bdcNDP.AddItem "4", "Détail par paramètre ou par Paramètre, récapitulatif total regroupé par Paramètre"
  
  ' Découpage de dossier
  bdcDécoupage.AddItem "a", "Impression en 1 tranche  A=AB+BS+Li+FS+EH+CH"
  bdcDécoupage.AddItem "b", "Impression en 2 tranches A=AB+BS+Li+FS+EH  C=CH"
  bdcDécoupage.AddItem "c", "Impression en 3 tranches A=AB+BS+Li+FS  B=EH  C=CH"
  bdcDécoupage.AddItem "i", "Impression en 2 tranches B=EH  I(Immédiate)=AB+BS+Li+FS+CH"
  
  
  ' Formulaire en mode initial
  Set cEtb = Nothing
  ActiveFormulaire False
  bdSél.LectureSeule = bLectureSeule
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  bdSél.SetFocus
  
  SetMessage
  SetStatus
  sFinalWP = ""
  Screen.MousePointer = vbDefault
  
  Refresh     ' Sinon, certains BDCombo ne sont pas ffichés !!!
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'opération en cours avant de fermer la fenêtre !", vbCritical, App.Title
    If Not bShiftPressed Then
      Cancel = True
      Exit Sub
    End If
  End If

  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cEtb Is Nothing Then cEtb.CloseCurseur
  MDIServeur.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


Private Sub Form_Resize()
  ' On retaille le tabstrip…
  tsTab.Move 4, 53, ScaleWidth - 8, ScaleHeight - 53
  
  ' Puis les frames contenant les contrôles
  Dim F As Frame
  For Each F In fraFeuille
    F.Move tsTab.ClientLeft + 2, tsTab.ClientTop + 6, tsTab.ClientWidth - 2, tsTab.ClientHeight - 4
  Next
End Sub


' Aide des options
Private Sub lblOptions_Click(Index As Integer)
  Select Case Index
    Case 0, 1:
      FileShellExecute hWnd, "http://www.silliker/microbsoft/serveur/optedcra.htm"
    Case 2, 3:
      FileShellExecute hWnd, "http://www.silliker/microbsoft/serveur/optlabo.htm"
  End Select
End Sub


' Liens internes
Private Sub lblChamp_Click(Index As Integer)
  Select Case Index
    Case 11:   ' N° de secteur sur l'onglet d'identification
      If bdcSecteur <> "" Then frmSecteur.AfficheSecteur "sec_numsec=" & Chr(34) & bdcSecteur & Chr(34)
      
    Case 0:   ' N° de secteur dans la hiérarchie
      If txtHNum(2) <> "" Then frmSecteur.AfficheSecteur "sec_numsec=" & Chr(34) & txtHNum(2) & Chr(34)
      
    Case 4:   ' N° drg dans la hiérarchie
      If txtHNum(3) <> "" Then frmDirReg.AfficheDirReg "drg_numdrg=" & Chr(34) & txtHNum(3) & Chr(34)
  
    Case 6:   ' N° dna dans la hiérarchie
      If txtHNum(4) <> "" Then frmDirNat.AfficheDirNat "dna_numdna=" & Chr(34) & txtHNum(4) & Chr(34)
    
    Case 69:  ' N° grp dans la hiérarchie
      If txtHNum(5) <> "" Then frmGroupe.AfficheGroupe "grp_numgrp=" & Chr(34) & txtHNum(5) & Chr(34)
      
    Case 96:  ' Fiche-tarif
      If colChamps("etb_tarif") <> "" Then frmTarif.AfficheTarif "tar_numtarif=" & colChamps("etb_tarif")
      
    Case 24:  ' FME
      If IsNumeric(colChamps("etb_fme")) Then TablesFeuFme "-fme:" & colChamps("etb_fme")
      
    Case 80:  ' FEU
      If IsNumeric(colChamps("etb_feu")) Then TablesFeuFme "-feu:" & colChamps("etb_feu")
  End Select
End Sub


Private Sub TablesFeuFme(ByVal sOption As String)
  Dim a As String
  a = App.Path
  Do
    On Error Resume Next
    Shell Chr(34) & a & "\TablesFEU" & Chr(34) & " -uti:" & iNumOpérateur & " " & sOption, vbNormalFocus
    If Err = 0 Then Exit Do
    On Error GoTo 0
    If StrComp(a, "c:\program files\microbsoft", vbTextCompare) = 0 Then Exit Do
    a = "c:\program files\microbsoft"
  Loop
End Sub


'=================================================================================
' Active le formulaire, affiche en jaune les champs indexés

Private Sub ActiveFormulaire(bActivé As Boolean)
  BDActiveFormulaire colChamps, bActivé
  If bActivé Then
    colChamps("etb_numetb").BackColor = BCChampIndexé
    colChamps("etb_prefixe").BackColor = BCChampIndexé
    colChamps("etb_cpost").BackColor = BCChampIndexé
    colChamps("etb_tarif").BackColor = BCChampIndexé
'    colChamps("etb_compta1").BackColor = BCChampIndexé
    colChamps("etb_numsec").BackColor = BCChampIndexé
    colChamps("etb_numgrf").BackColor = BCChampIndexé
    colChamps("timestamp").BackColor = BCChampIndexé
  End If
End Sub

'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cEtb Is Nothing Then
    EffaceFormulaire
  ElseIf cEtb.BOF And cEtb.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cEtb.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cEtb.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    
    ' Effacement des champs qui seront affichés sur timer
    Dim i As Integer
    For i = 1 To 4
      txtTitreGrille(i) = ""
      txtTitreScénario(i) = ""
    Next
    For i = 2 To 5
      txtHNum(i) = ""
      txtHNom(i) = ""
    Next
    For i = 0 To 5
      txtOptEd(i) = ""
      txtOptLabo(i) = ""
    Next
    btnHistorique.BackColor = &H8000000F
    btnHistorique.Enabled = False
    
    bdSél.NumRec = cEtb.AbsolutePosition
    ActiveTimer mtRapide      ' Mise à jour en arrière plan
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cEtb.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  ' Les infos du premier onglet sont toujours affichées
  If bdcSecteur.ListIndex < 0 Then SynchroSec
  
  ' Optimisation, on n'affiche certains champs que si on onglet précis est affiché
  AffichagesSpécifiques
  
  ' Affichage de l'historique
  Dim bHisto As Boolean
  If bHistoDisponible Then
    btnHistorique.Enabled = True
    btnHistorique.BackColor = &HFFFF&
  Else
    btnHistorique.Enabled = False
    btnHistorique.BackColor = &H8000000F
  End If
End Sub


Private Sub AffichagesSpécifiques()
  ' Affichages spécifiques
    Select Case tsTab.SelectedItem.Key
    Case "Id":
    Case "Prest":
    Case "EH":    AfficheEH
    Case "FME":   AfficheFMEFEU
    Case "Fact":  AfficheGroupementTarif
    Case "Com":   AfficheCompta
    Case "Tra":   AfficheHiérarchie
    Case Else: Stop
  End Select
End Sub

Private Sub AfficheEH()
  txtTitreGrille(1) = sGetTitreGrille(txtGrille(1))
  txtTitreScénario(1) = sGetTitreScénario(txtGrille(1), txtScénario(1))
  txtTitreGrille(2) = sGetTitreGrille(txtGrille(2))
  txtTitreScénario(2) = sGetTitreScénario(txtGrille(2), txtScénario(2))
  txtTitreGrille(3) = sGetTitreGrille(txtGrille(3))
  txtTitreScénario(3) = sGetTitreScénario(txtGrille(3), txtScénario(3))
  txtTitreGrille(4) = sGetTitreGrille(txtGrille(4))
  txtTitreScénario(4) = sGetTitreScénario(txtGrille(4), txtScénario(4))
End Sub

Private Sub AfficheGroupementTarif()
  If bdcGroupement.ListIndex < 0 Then SynchroGroupement
  If bdcTarif.ListIndex < 0 Then SynchroTarif
End Sub


Private Sub AfficheFMEFEU()
  If bdcFME.ListIndex < 0 Then SynchroFME
  If bdcFEU.ListIndex < 0 Then SynchroFEU
End Sub

Private Sub AfficheCompta()
  If colChamps("etb_facture") = "" Then
    txtNomFacturé = "*** INVALIDE! Le code comptable DOIT être renseigné !"
    shpComptaSansEffet.Visible = False
  ElseIf colChamps("etb_facture") = colChamps("etb_numetb") Then
    txtNomFacturé = "(les infos comptables de l'établissement sont utilisées)"
    shpComptaSansEffet.Visible = False
  Else
    txtNomFacturé = BDCurseurExpress("select trim(etb_prefixe)||"" ""||etb_nom from etablissement where etb_numetb=" & sFormToSQL(colChamps("etb_facture"), BDTypeCHAR))
    shpComptaSansEffet.Visible = True
  End If
  
  If colChamps("etb_centrepayeur") = "" Then
    txtNomCentrePayeur = "*** INVALIDE! Le centre payeur DOIT être renseigné !"
  ElseIf colChamps("etb_centrepayeur") = colChamps("etb_numetb") Then
    txtNomCentrePayeur = "(l'établissement est son propre centre payeur)"
  Else
    txtNomCentrePayeur = BDCurseurExpress("select trim(etb_prefixe)||"" ""||etb_nom from etablissement where etb_numetb=" & sFormToSQL(colChamps("etb_centrepayeur"), BDTypeCHAR))
  End If
  
End Sub

Private Sub AfficheHiérarchie()
  Static colHiérarchie As New Collection    ' Cache privé, plus simple
  
  If bdcSecteur = "" Then Exit Sub          ' En mode interrogation, on n'affiche rien
  If txtHNum(2) <> "" Then Exit Sub         ' Déjà affiché, on navigue entre onglets
  
  Dim sNom As String
  sNom = sGetNomSecteur(bdcSecteur)
  txtHNum(2) = bdcSecteur
  txtHNom(2) = sNom
  txtOptEd(1) = colChamps("etb_optedition")
  txtOptLabo(1) = colChamps("etb_optlabo")
  
  Dim h As Hiérarchie
  On Error Resume Next
  Set h = colHiérarchie("S" & bdcSecteur)
  If Err Then
    On Error GoTo 0
    
    Set h = New Hiérarchie
    Dim C As New BDCurseur
    C.OpenCurseur "select sec_optedition,sec_optlabo,drg_numdrg,drg_nom,drg_optedition,drg_optlabo,dna_numdna,dna_nom,dna_optedition,dna_optlabo,grp_numgrp,grp_nom,grp_optedition,grp_optlabo " & _
      "from secteur,dirreg,dirnat,groupe " & _
      "where sec_numsec=" & bdcSecteur & " and drg_numdrg=sec_numdrg and dna_numdna=drg_numdna and grp_numgrp=dna_numgrp"
    
    If C.EOF Then   ' Ne devrait jamais arriver mais on peut tomber sur des n°s de secteur invalides...
      h.sec_optedition = ""
      h.sec_optlabo = ""
      
      h.drg_numdrg = 1
      h.drg_nom = "PAS DE RATTACHEMENT DIRECTION REGIONALE"
      h.drg_optedition = ""
      h.drg_optlabo = ""
      
      h.dna_numdna = 1
      h.dna_nom = "PAS DE RATTACHEMENT DIRECTION NATIONALE"
      h.dna_optedition = ""
      h.dna_optlabo = ""
      
      h.grp_numgrp = 1
      h.grp_nom = "PAS DE RATTACHEMENT GROUPE"
      h.grp_optedition = ""
      h.grp_optlabo = ""
    Else
      h.sec_optedition = NV(C!sec_optedition)
      h.sec_optlabo = NV(C!sec_optlabo)
      
      h.drg_numdrg = C!drg_numdrg
      h.drg_nom = C!drg_nom
      h.drg_optedition = NV(C!drg_optedition)
      h.drg_optlabo = NV(C!drg_optlabo)
      
      h.dna_numdna = C!dna_numdna
      h.dna_nom = C!dna_nom
      h.dna_optedition = NV(C!dna_optedition)
      h.dna_optlabo = NV(C!dna_optlabo)
      
      h.grp_numgrp = C!grp_numgrp
      h.grp_nom = C!grp_nom
      h.grp_optedition = NV(C!grp_optedition)
      h.grp_optlabo = NV(C!grp_optlabo)
    End If
    
    C.CloseCurseur
    
    colHiérarchie.Add h, "S" & bdcSecteur
  End If
  On Error GoTo 0
  
  txtOptEd(2) = h.sec_optedition
  txtOptLabo(2) = h.sec_optlabo
  
  txtHNum(3) = h.drg_numdrg
  txtHNom(3) = h.drg_nom
  txtOptEd(3) = h.drg_optedition
  txtOptLabo(3) = h.drg_optlabo
  
  txtHNum(4) = h.dna_numdna
  txtHNom(4) = h.dna_nom
  txtOptEd(4) = h.dna_optedition
  txtOptLabo(4) = h.dna_optlabo
  
  txtHNum(5) = h.grp_numgrp
  txtHNom(5) = h.grp_nom
  txtOptEd(5) = h.grp_optedition
  txtOptLabo(5) = h.grp_optlabo
  
  ' Synthèse
  Dim sLettre As String
  Dim sOpt As String
  Dim p As Integer, i As Integer, j As Integer
  
  sOpt = ""
  For i = 5 To 1 Step -1
    For j = 1 To Len(txtOptEd(i))
      sLettre = Mid(txtOptEd(i), j, 1)
      If sLettre >= "a" And sLettre <= "z" Then       ' On enlève une option
        p = InStr(1, sOpt, UCase(sLettre))
        If p > 0 Then sOpt = Left(sOpt, p - 1) & Mid(sOpt, p + 1)
      Else                                            ' On ajoute une option
        If InStr(1, sOpt, sLettre) = 0 Then sOpt = sOpt & sLettre
      End If
    Next
  Next
  txtOptEd(0) = sOpt
      
  sOpt = ""
  For i = 5 To 1 Step -1
    For j = 1 To Len(txtOptLabo(i))
      sLettre = Mid(txtOptLabo(i), j, 1)
      If sLettre = "2" Then sLettre = "Y"
      If sLettre >= "a" And sLettre <= "z" Then       ' On enlève une option
        p = InStr(1, sOpt, UCase(sLettre))
        If p > 0 Then sOpt = Left(sOpt, p - 1) & Mid(sOpt, p + 1)
      Else                                            ' On ajoute une option
        If InStr(1, sOpt, sLettre) = 0 Then sOpt = sOpt & sLettre
      End If
    Next
  Next
  sOpt = Replace(sOpt, "Y", "2")
  txtOptLabo(0) = sOpt
      
End Sub


Private Sub EffaceFormulaire()
  Dim C As Control
  For Each C In colChamps
    C.Text = ""
  Next
  bdSél.NumRec = ""
  Dim i As Integer
  For i = 1 To 4
    txtTitreGrille(i) = ""
    txtTitreScénario(i) = ""
  Next
  For i = 2 To 5
    txtHNum(i) = ""
    txtHNom(i) = ""
  Next
  For i = 0 To 5
    txtOptEd(i) = ""
    txtOptLabo(i) = ""
  Next
  txtNomCentrePayeur = ""
  txtNomFacturé = ""
  shpComptaSansEffet.Visible = False
  btnHistorique.BackColor = &H8000000F
  btnHistorique.Enabled = False
End Sub


' Activation du timer de mise à jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop: timSatellites.Enabled = False
    Case mtLent: timSatellites.Interval = 1000: timSatellites.Enabled = True
    Case mtRapide: timSatellites.Interval = 250: timSatellites.Enabled = True
  End Select
End Sub


Private Sub ActiveChamp(ByVal sChamp As String, bEnabled As Boolean)
  BDActiveChamp colChamps(sChamp), bEnabled
End Sub

Private Sub txtChamp_Change(Index As Integer)
  If iSystèmePays = 0 And txtChamp(Index).DataField = "etb_cpost" And colChamps("etb_pays") = 0 And Len(colChamps("etb_cpost")) = 5 Then
    Dim L As Long
    L = Val(txtChamp(Index))
    If L >= 1000 And L <= 74999 Or L >= 76000 And L <= 95999 Or L >= 98000 And L <= 98999 Then
      bdcZoneComm = L \ 1000
      bdcZoneComm.Synchronise
    ElseIf L >= 75001 And L <= 75020 Then
      bdcZoneComm = L
      bdcZoneComm.Synchronise
    Else
      bdcZoneComm = "(à remplir)"
    End If
  End If
End Sub

' Pour ajouter un établissement avec n° imposé
Private Sub txtChamp_DblClick(Index As Integer)
  If txtChamp(Index).DataField = "etb_numetb" And iMode = meAdd Then
    BDActiveChamp txtChamp(Index), True
  End If

  ' PV a le droit de réactiver n'importe que champ.
  ' Attention, tout n'est pas autorisé.
  ' Par exemple, INTERDIT de renuméroter un etb en mode modification...
  If (iMode = meAdd Or iMode = meChange) And iNumOpérateur = 46 And txtChamp(Index).Locked Then
    BDActiveChamp txtChamp(Index), True
  End If
End Sub

Private Sub txtChampVB_DblClick(Index As Integer)
  If txtChampVB(Index).DataField = "etb_numetb" And iMode = meAdd Then
    BDActiveChamp txtChampVB(Index), True
  End If

  ' PV a le droit de réactiver n'importe que champ.
  ' Attention, tout n'est pas autorisé.
  ' Par exemple, INTERDIT de renuméroter un etb en mode modification...
  If (iMode = meAdd Or iMode = meChange) And iNumOpérateur = 46 And txtChampVB(Index).Locked Then
    BDActiveChamp txtChampVB(Index), True
  End If
End Sub


'=================================================================================
' Ligne d'aide

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub txtChampVB_GotFocus(Index As Integer)
  AutoSelect txtChampVB(Index)
  SetStatus txtChampVB(Index).Tag
End Sub


Private Sub txtHNum_GotFocus(Index As Integer)
  SetStatus
End Sub

Private Sub txtHNom_GotFocus(Index As Integer)
  SetStatus
End Sub

Private Sub txtGrille_GotFocus(Index As Integer)
  AutoSelect txtGrille(Index)
  SetStatus txtGrille(Index).Tag
End Sub

Private Sub txtScénario_GotFocus(Index As Integer)
  AutoSelect txtScénario(Index)
  SetStatus txtScénario(Index).Tag
End Sub

Private Sub txtdurEH_GotFocus(Index As Integer)
  AutoSelect txtdurEH(Index)
  SetStatus txtdurEH(Index).Tag
End Sub

Private Sub bckCheck_GotFocus(Index As Integer)
  AutoSelect bckCheck(Index)
  SetStatus bckCheck(Index).Tag
End Sub

Private Sub bdSél_GotFocus()
  SetStatus
End Sub

Private Sub bdcPays_GotFocus()
  SetStatus bdcPays.Tag
End Sub

Private Sub bdcPays_LostFocus()
  bdcPays.Synchronise
End Sub

Private Sub bdcZoneComm_GotFocus()
  SetStatus bdcZoneComm.Tag
End Sub

Private Sub bdcZoneComm_LostFocus()
  bdcZoneComm.Synchronise
End Sub



Private Sub bdcLangue_GotFocus(Index As Integer)
  SetStatus bdcLangue(Index).Tag
End Sub

Private Sub bdcLangue_LostFocus(Index As Integer)
  bdcLangue(Index).Synchronise
End Sub


Private Sub bdcSecteur_GotFocus()
  SetStatus bdcSecteur.Tag
End Sub

Private Sub bdcSecteur_LostFocus()
  If bdcSecteur <> "" Then
    bdcSecteur.Synchronise
    If bdcSecteur.ListIndex < 0 Then SynchroSec
  End If
End Sub


Private Sub bdcFME_GotFocus()
  SetStatus bdcFME.Tag
End Sub

Private Sub bdcFME_LostFocus()
  If bdcFME <> "" Then
    bdcFME.Synchronise
    If bdcFME.ListIndex < 0 Then SynchroFME
  End If
End Sub


Private Sub bdcFEU_GotFocus()
  SetStatus bdcFEU.Tag
End Sub

Private Sub bdcFEU_LostFocus()
  If bdcFEU <> "" Then
    bdcFEU.Synchronise
    If bdcFEU.ListIndex < 0 Then SynchroFEU
  End If
End Sub


Private Sub bdcGroupement_GotFocus()
  SetStatus bdcGroupement.Tag
End Sub

Private Sub bdcGroupement_LostFocus()
  If bdcGroupement <> "" Then
    bdcGroupement.Synchronise
    If bdcGroupement.ListIndex < 0 Then SynchroGroupement
  End If
End Sub


Private Sub txtGrille_Change(Index As Integer)
  txtTitreGrille(Index) = ""
  txtTitreScénario(Index) = ""
End Sub

Private Sub txtGrille_LostFocus(Index As Integer)
  txtTitreGrille(Index) = sGetTitreGrille(txtGrille(Index))
  txtTitreScénario(Index) = sGetTitreScénario(txtGrille(Index), txtScénario(Index))
End Sub


Private Sub txtScénario_Change(Index As Integer)
  txtTitreScénario(Index) = ""
End Sub

Private Sub txtScénario_LostFocus(Index As Integer)
  txtTitreScénario(Index) = sGetTitreScénario(txtGrille(Index), txtScénario(Index))
End Sub


Private Sub bdcTypeFact_GotFocus()
  SetStatus bdcTypeFact.Tag
End Sub

Private Sub bdcTypeFact_LostFocus()
  bdcTypeFact.Synchronise
End Sub


Private Sub bdcProprio_GotFocus()
  SetStatus bdcProprio.Tag
End Sub

Private Sub bdcProprio_LostFocus()
  bdcProprio.Synchronise
End Sub


Private Sub bdcRayon_GotFocus()
  SetStatus bdcRayon.Tag
End Sub

Private Sub bdcRayon_LostFocus()
  bdcRayon.Synchronise
End Sub


Private Sub bdcUnité_GotFocus()
  SetStatus bdcUnité.Tag
End Sub

Private Sub bdcUnité_LostFocus()
  bdcUnité.Synchronise
End Sub


Private Sub bdcLabo_GotFocus()
  SetStatus bdcLabo.Tag
End Sub

Private Sub bdcLabo_LostFocus()
  bdcLabo.Synchronise
End Sub


Private Sub bdcNDP_GotFocus()
  SetStatus bdcNDP.Tag
End Sub

Private Sub bdcNDP_LostFocus()
  bdcNDP.Synchronise
End Sub


Private Sub bdcNCP_GotFocus()
  SetStatus bdcNCP.Tag
End Sub

Private Sub bdcNCP_LostFocus()
  bdcNCP.Synchronise
End Sub


Private Sub bdcDécoupage_GotFocus()
  SetStatus bdcDécoupage.Tag
End Sub

Private Sub bdcDécoupage_LostFocus()
  bdcDécoupage.Synchronise
End Sub


Private Sub bdcIdAuchan_GotFocus()
  SetStatus bdcIdAuchan.Tag
End Sub

Private Sub bdcIdAuchan_LostFocus()
  bdcIdAuchan.Synchronise
End Sub


Private Sub bdcNiveauIntervenant_GotFocus()
  SetStatus bdcNiveauIntervenant.Tag
End Sub

Private Sub bdcNiveauIntervenant_LostFocus()
  bdcNiveauIntervenant.Synchronise
End Sub


Private Sub bdcEdLangue_GotFocus()
  SetStatus bdcEdLangue.Tag
End Sub

Private Sub bdcEdLangue_LostFocus()
  bdcEdLangue.Synchronise
End Sub


Private Sub bdcModeRèglement_GotFocus()
  SetStatus bdcModeRèglement.Tag
End Sub

Private Sub bdcModeRèglement_LostFocus()
  bdcModeRèglement.Synchronise
End Sub



' Champs accessibles uniquement en interrogation
Private Sub bdcOperCreat_GotFocus()
  SetStatus bdcOperCreat.Tag
End Sub

Private Sub bdcOperModif_GotFocus()
  SetStatus bdcOperModif.Tag
End Sub

Private Sub bdcOperValid_GotFocus()
  SetStatus bdcOperValid.Tag
End Sub



'=================================================================================
' Synchros sur timer

Private Sub SynchroSec()
  If bdcSecteur = "" Then Exit Sub
  Dim sNom As String
  sNom = sGetNomSecteur(bdcSecteur)
  If sNom <> "" Then bdcSecteur.AddItem Int(Val(bdcSecteur)), sNom
End Sub

Private Sub SynchroFME()
  If bdcFME = "" Then Exit Sub
  Dim sNom As String
  On Error GoTo SansFME   ' Pas de FME sur bergamo
  sNom = sGetTitreFME(bdcFME)
  If sNom <> "" Then DoEvents: bdcFME.AddItem Int(Val(bdcFME)), sNom
SansFME:
End Sub

Private Sub SynchroFEU()
  If bdcFEU = "" Then Exit Sub
  Dim sNom As String
  On Error GoTo SansFEU
  sNom = sGetTitreFEU(bdcFEU)
  If sNom <> "" Then DoEvents: bdcFEU.AddItem Int(Val(bdcFEU)), sNom
SansFEU:
End Sub

Private Sub SynchroGroupement()
  If bdcGroupement = "" Then Exit Sub
  Dim sNom As String
  On Error GoTo SansGroupement    ' La table groupement n'existe pas sur bergamo
  sNom = sGetNomGroupement(bdcGroupement)
  If sNom <> "" Then DoEvents: bdcGroupement.AddItem bdcGroupement, sNom
SansGroupement:
End Sub

Private Sub SynchroTarif()
  If bdcTarif = "" Then Exit Sub
  Dim sNom As String
  On Error GoTo SansTarif    ' La table Tarif n'existe pas partout
  sNom = sGetNomTarif(bdcTarif)
  If sNom <> "" Then DoEvents: bdcTarif.AddItem bdcTarif, sNom
SansTarif:
End Sub


'=================================================================================
' Accès au Web

Public Sub FenêtreWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=" & sTable
End Sub


'=================================================================================
' Copie des données dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours…"
  BDCopieSélection cEtb, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub



'=================================================================================
' Impression

Public Sub Imprime()
  DoEtat True
End Sub

Public Sub Aperçu()
  DoEtat False
End Sub

Private Sub DoEtat(ByVal bImpression As Boolean)
  On Error GoTo pb
  
  Dim iChoix As Integer
  iChoix = frmMessageChoix.ChoixEtat("&Simple", "Simple+&adresses", "&Détaillé", "S&tructure")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
  Exit Sub
  
pb:
  intlMessageErreurEtat
End Sub

Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String, sSQLTête As String, sSQLCorps As String
  sSQLTête = "select unique etb_numsec,sec_nom from " & sTable & ",secteur where " & sFinalWP & " and etb_numsec=sec_numsec"
  sSQLCorps = "select * from " & sTable & " where " & sFinalWP
  sSQL = "SHAPE {" & sSQLTête & "} AS Tête APPEND ({" & sSQLCorps & "} AS Corps RELATE 'etb_numsec' TO 'etb_numsec') AS Corps"

  Select Case iChoix
    ' Les on error resume next servent à éviter une erreur 13:Type incompatible, venue de dieu sait où et impossible à localiser...
    Case 1: On Error Resume Next: BDEtat sSQL, drEtbSimple, bImpression
    Case 2: On Error Resume Next: BDEtat sSQL, drEtbSimpleAvecAdresse, bImpression
    Case 3: On Error Resume Next: BDEtat sSQL, drEtbDétaillé, bImpression
    Case 4: FormateStructure sFinalWP, bImpression, Me, iChoix
  End Select
End Sub

' Callback de l'aperçu avant impression
Public Sub PrintReport(ByVal iChoix As Integer)
  Etat iChoix, True
End Sub


'=================================================================================
' Mémorisation

Public Sub Mémorise()
  EffaceCollection colMémoireEtablissement
  
  Dim t As Control
  For Each t In colChamps
    colMémoireEtablissement.Add (t), t.DataField
  Next
End Sub


''=================================================================================
'' Augmentation des tarifs
'
'Private Function nt(iOldTarif, fTaux As Single, iChoix As Integer)
'  If IsNull(iOldTarif) Then
'    nt = Null
'  ElseIf iChoix = 1 Then    ' Augmentation simple
'    nt = Int(0.5 + (1 + fTaux / 100) * iOldTarif)
'  ElseIf iChoix = 2 Then    ' Augmentation en conservant les centimes
'    nt = 100 * Int(0.5 + (1 + fTaux / 100) * (iOldTarif \ 100)) + iOldTarif Mod 100
'  End If
'End Function
'
'
'Public Sub Augmentation()
'  If iMode = meEmpty Then
'    MsgBox "Effectuez une sélection avant d'appliquer une augmentation.", vbExclamation, App.Title
'    Exit Sub
'  End If
'
'  Dim iChoix As Integer
'  iChoix = frmMessageChoix.Choix("Augmentation des tarifs", "Choisissez le type d'augmentation à appliquer.", "&Simple", "&Conservation des centimes", "&Renumérotation des centimes")
'  If iChoix = 0 Then Exit Sub
'
'  If iChoix = 3 Then
'    RenumérotationCentimes
'    Exit Sub
'  End If
'
'  Dim fTaux As Single, sTaux As String
'  sTaux = InputBox("Taux d'augmentation, ex: 3.25 pour 3.25%", App.Title)
'  If sTaux = "" Then Exit Sub     ' Annuler
'  sTaux = Replace(sTaux, ".", ",")
'  If Not IsNumeric(sTaux) Then
'    MsgBox "Taux invalide.", vbExclamation, App.Title
'    Exit Sub
'  End If
'  fTaux = CSng(sTaux)
'  If fTaux < 0.1 Or fTaux > 10 Then
'    MsgBox "Taux d'augmentation <0.1% ou >10%, abandon.", vbExclamation, App.Title
'    Exit Sub
'  End If
'
'  Dim dDateDarif As Date, sDateTarif As String
'  sDateTarif = InputBox("Date limite de validité du tarif, ex: 31/12/2000", App.Title)
'  If sDateTarif = "" Then Exit Sub
'  If Not IsDate(sDateTarif) Then
'    MsgBox "Date invalide.", vbExclamation, App.Title
'    Exit Sub
'  End If
'  dDateDarif = CDate(sDateTarif)
'  If dDateDarif < Today Or dDateDarif > Today + 360 Then
'    MsgBox "Date dans le passé ou plus de deux ans dans le futur, abandon.", vbExclamation, App.Title
'    Exit Sub
'  End If
'
'  SetMessage "Mise à jour des tarifs en cours"
'  EffaceFormulaire
'  cEtb.MoveFirst
'  Do Until cEtb.EOF
'    If cEtb.AbsolutePosition Mod 10 = 0 Then
'      bdSél.NumRec = cEtb.AbsolutePosition
'      bdSél.RefreshNumRec
'    End If
'
'    cEtb.Edit
'    cEtb!etb_prix0 = nt(cEtb!etb_prix0, fTaux, iChoix)
'    cEtb!etb_prix1 = nt(cEtb!etb_prix1, fTaux, iChoix)
'    cEtb!etb_prix2 = nt(cEtb!etb_prix2, fTaux, iChoix)
'    cEtb!etb_prix3 = nt(cEtb!etb_prix3, fTaux, iChoix)
'    cEtb!etb_prix4 = nt(cEtb!etb_prix4, fTaux, iChoix)
'    cEtb!etb_prix5 = nt(cEtb!etb_prix5, fTaux, iChoix)
'    cEtb!etb_prixs1 = nt(cEtb!etb_prixs1, fTaux, iChoix)
'    cEtb!etb_prixs2 = nt(cEtb!etb_prixs2, fTaux, iChoix)
'    cEtb!etb_prixs3 = nt(cEtb!etb_prixs3, fTaux, iChoix)
'    cEtb!etb_prixs4 = nt(cEtb!etb_prixs4, fTaux, iChoix)
'    cEtb!etb_prixs5 = nt(cEtb!etb_prixs5, fTaux, iChoix)
'    cEtb!etb_prixs6 = nt(cEtb!etb_prixs6, fTaux, iChoix)
'    cEtb!etb_datetarif = dDateDarif
'    cEtb!etb_datemodif = Today
'    cEtb!etb_heuremodif = 100 * Hour(Now) + Minute(Now)
'    cEtb!etb_opermodif = iNumOpérateur
'    cEtb!timestamp = BDTime     ' Now + tOffsetNow
'    cEtb.Update
'
'    cEtb.MoveNext
'  Loop
'  cEtb.MoveFirst
'
'  SynchroniseFormulaire   ' Affiche le premier enregistrement
'  SetMessage
'End Sub
'
'
'Private Sub RenumérotationCentimes()
'  Dim iSigne As Integer, iIndice As Integer
'
'  iSigne = -1
'  iIndice = 1
'  SetMessage "Renumérotation des centimes en cours"
'  EffaceFormulaire
'  cEtb.MoveFirst
'  Do Until cEtb.EOF
'    If cEtb.AbsolutePosition Mod 10 = 0 Then
'      bdSél.NumRec = cEtb.AbsolutePosition
'      bdSél.RefreshNumRec
'    End If
'
'    cEtb.Edit
'    cEtb!etb_prix0 = 100 * (cEtb!etb_prix0 \ 100) + iSigne * (iIndice \ 2)
'    cEtb!etb_datemodif = Today
'    cEtb!etb_heuremodif = 100 * Hour(Now) + Minute(Now)
'    cEtb!etb_opermodif = iNumOpérateur
'    cEtb!timestamp = BDTime  ' Now + tOffsetNow
'    cEtb.Update
'
'    iIndice = iIndice + 1
'    iSigne = -iSigne
'
'    cEtb.MoveNext
'  Loop
'  cEtb.MoveFirst
'
'  SynchroniseFormulaire   ' Affiche le premier enregistrement
'  SetMessage
'End Sub
'
'



'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "A:Customer management"

  SetLib tsTab.Tabs("Id"), "Caption", "A:Identification"
  SetLib tsTab.Tabs("Prest"), "Caption", "A:Intervention"
  SetLib tsTab.Tabs("EH"), "Caption", "A:Audit"
  SetLib tsTab.Tabs("FME"), "Caption", "A:Dispatch"
  SetLib tsTab.Tabs("Fact"), "Caption", "A:Invoicing"
  SetLib tsTab.Tabs("Com"), "Caption", "A:Accounting"
  SetLib tsTab.Tabs("Tra"), "Caption", "A:Traceability"
  
  SetLib btnHistorique, "Caption", "A:History"
  
  SetLib lblChamp(7), "Caption", "A:Street :"
  SetLib lblChamp(8), "Caption", "A:Locality :"
  SetLib lblChamp(1), "Caption", "A:ZIP/City :"
  SetLib lblChamp(5), "Caption", "A:Tel/Fax :"
  SetLib lblChamp(15), "Caption", "A:Country :"
  SetLib lblChamp(66), "Caption", "A:Language :"
  SetLib lblChamp(10), "Caption", "A:Correspondent :"
  SetLib lblChamp(74), "Caption", "A:Department :"
  SetLib lblChamp(67), "Caption", "A:Area :"
  SetLib lblChamp(68), "Caption", "A:Owner :"
  SetLib lblOptions(1), "Caption", "A:Print options :"
  SetLib lblOptions(2), "Caption", "A:Lab options :"
  SetLib lblChamp(118), "Caption", "A:COA input :"
  SetLib lblChamp(71), "Caption", "A:Cust. codes :"
  SetLib lblChamp(75), "Caption", "A:Copy # :"
  SetLib lblChamp(72), "Caption", "A:MD cust. code :"
  SetLib lblChamp(73), "Caption", "A:MD brand :"
  SetLib lblChamp(117), "Caption", "A:Activity :"
  SetLib lblChamp(77), "Caption", "A:Com. area :"
  SetLib lblChamp(97), "Caption", "A:Lab :"
  SetLib lblChamp(98), "Caption", "A:Interv. notice :"
  SetLib lblChamp(116), "Caption", "A:Auchan ID :"
  SetLib lblChamp(42), "Caption", "A:Contract # :"
  
  SetLib lblChamp(89), "Caption", "A:Strict list :"
  SetLib lblGE(7), "Caption", "A:Audit 1 :"
  SetLib lblGE(5), "Caption", "A:Audit 2 :"
  SetLib lblGE(0), "Caption", "A:Audit 3 :"
  SetLib lblGE(6), "Caption", "A:Audit 4 :"
  SetLib lblGE(1), "Caption", "A:Scenario 1 :"
  SetLib lblGE(2), "Caption", "A:Scenario 2 :"
  SetLib lblGE(3), "Caption", "A:Scenario 3 :"
  SetLib lblGE(4), "Caption", "A:Scenario 4 :"
  SetLib lblGE(8), "Caption", "A:Language 1 :"
  SetLib lblGE(9), "Caption", "A:Language 2 :"
  SetLib lblGE(10), "Caption", "A:Language 3 :"
  SetLib lblGE(11), "Caption", "A:Language 4 :"
  SetLib lblGE(12), "Caption", "A:Length 1 :"
  SetLib lblGE(13), "Caption", "A:Length 2 :"
  SetLib lblGE(14), "Caption", "A:Length 3 :"
  SetLib lblGE(15), "Caption", "A:Length 4 :"
  SetLib lblChamp(99), "Caption", "A:Comments :"
  
  SetLib fraAdr2, "Caption", "A:Second Address (FME dest. #2):"
  SetLib lblChamp(23), "Caption", "A:Name :"
  SetLib lblChamp(22), "Caption", "A:Street :"
  SetLib lblChamp(18), "Caption", "A:Locality :"
  SetLib lblChamp(21), "Caption", "A:ZIP/City :"
  SetLib lblChamp(20), "Caption", "A:Tel/Fax :"
  SetLib lblChamp(14), "Caption", "A:Correspondent :"
  SetLib lblChamp(119), "Caption", "A:Division :"
  SetLib lblChamp(109), "Caption", "A:Print analysis date :"
  
  SetLib lblChamp(61), "Caption", "A:Intervention :"
  SetLib lblChamp(25), "Caption", "A:Quantity"
  SetLib lblChamp(81), "Caption", "A:Frequency"
  SetLib lblChamp(82), "Caption", "A:intervention"
  SetLib lblChamp(34), "Caption", "A:BA :"
  SetLib lblChamp(40), "Caption", "A:Audit :"
  SetLib lblChamp(35), "Caption", "A:Special :"
  SetLib lblChamp(36), "Caption", "A:Listeria :"
  SetLib lblChamp(37), "Caption", "A:Swab :"
  SetLib lblChamp(38), "Caption", "A:Oil :"
  SetLib lblChamp(39), "Caption", "A:Chem :"
  SetLib lblChamp(64), "Caption", "A:Constraints :"
  SetLib lblChamp(26), "Caption", "A:Field info :"
  SetLib lblChamp(62), "Caption", "A:Intervention start :"
  SetLib lblChamp(102), "Caption", "A:Contract starts :"
  SetLib lblChamp(103), "Caption", "A:Contract length :"
  SetLib lblChamp(104), "Caption", "A:Contract ends :"
  SetLib lblChamp(63), "Caption", "A:Int. level :"
  SetLib lblChamp(65), "Caption", "A:Area :"
  SetLib lblChamp(120), "Caption", "A:Common SF :"
  
  SetLib lblChamp(9), "Caption", "A:Status :"
  SetLib lblChamp(3), "Caption", "A:Origin :"
  SetLib lblChamp(2), "Caption", "A:Comment :"
  SetLib fraTraçabilité, "Caption", "A:Traceability"
  SetLib lblChamp(17), "Caption", "A:Created on :"
  SetLib lblChamp(16), "Caption", "A:Last modified on :"
  SetLib lblChamp(19), "Caption", "A:Approved on :"
  SetLib fraHiérarchie, "Caption", "A:Hierarchy"
End Sub


'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("etb_numetb") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub

Private Function bHistoDisponible() As Boolean
  If iMode <> meNavigate Then
    bHistoDisponible = False
    Exit Function
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("etb_numetb") & "'"
  bHistoDisponible = BDCurseurExpress("select count(*) from journal where " & sWP) > 0
End Function
