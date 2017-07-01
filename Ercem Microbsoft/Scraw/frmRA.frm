VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmRA 
   Caption         =   "Patientez, chargement du RA en cours…"
   ClientHeight    =   9810
   ClientLeft      =   60
   ClientTop       =   -2250
   ClientWidth     =   13080
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmRA.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   654
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   872
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox chkSaisieValidée 
      Caption         =   "Saisie validée"
      Height          =   195
      Left            =   3120
      TabIndex        =   159
      Top             =   600
      Width           =   1875
   End
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   630
      Left            =   0
      TabIndex        =   99
      Top             =   0
      Width           =   13080
      _ExtentX        =   23072
      _ExtentY        =   1111
      ButtonWidth     =   1455
      ButtonHeight    =   953
      AllowCustomize  =   0   'False
      Wrappable       =   0   'False
      Appearance      =   1
      ImageList       =   "ListeImages"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   10
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Contrôler"
            Object.ToolTipText     =   "Contrôler la cohérence entre les champs"
            ImageKey        =   "imgContrôler"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Valider"
            Object.ToolTipText     =   "Valider la saisie de la partie haute (Ctrl+W)"
            ImageKey        =   "imgValider"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Enregistrer"
            Object.ToolTipText     =   "Enregistrer le CRA (Ctrl+S)"
            ImageKey        =   "imgEnregistrer"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "EnregistrerQuitter"
            Object.ToolTipText     =   "Enregistrer le CRA et quitter (F2)"
            ImageKey        =   "imgEnregistrerQuitter"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Quitter"
            Object.ToolTipText     =   "Fermer la fenêtre sans enregistrer (F3 ou Alt+F4)"
            ImageKey        =   "imgQuitter"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Suivant"
            Object.ToolTipText     =   "Ferme le CRA en cours et passe au suivant (F12)"
            ImageKey        =   "imgSuivant"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "Supprimer"
            Key             =   "Supprimer"
            Object.ToolTipText     =   "Supprimer le CRA courant et la liste de boîtes"
            ImageKey        =   "imgSupprimer"
         EndProperty
      EndProperty
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   555
      Index           =   4
      Left            =   2940
      TabIndex        =   162
      Top             =   1260
      Visible         =   0   'False
      Width           =   1275
      Begin VB.TextBox txtNomLangue 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2220
         Locked          =   -1  'True
         TabIndex        =   108
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   3120
         Width           =   2295
      End
      Begin VB.TextBox txtLangue 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1860
         Locked          =   -1  'True
         TabIndex        =   247
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   3120
         Width           =   315
      End
      Begin VB.TextBox txtBouclageFocus 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   7
         Left            =   4680
         TabIndex        =   182
         Top             =   3120
         Width           =   255
      End
      Begin VB.TextBox txtBouclageFocus 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   6
         Left            =   1560
         TabIndex        =   164
         Top             =   60
         Width           =   255
      End
      Begin VB.TextBox txtNomCp 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2520
         Locked          =   -1  'True
         TabIndex        =   171
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   780
         Width           =   5475
      End
      Begin VB.TextBox txtNomPers 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2520
         Locked          =   -1  'True
         TabIndex        =   168
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   420
         Width           =   5475
      End
      Begin VB.TextBox txtCP 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1860
         Locked          =   -1  'True
         TabIndex        =   170
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   780
         Width           =   615
      End
      Begin VB.TextBox txtPers 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1860
         Locked          =   -1  'True
         TabIndex        =   167
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   420
         Width           =   615
      End
      Begin VB.TextBox txtDateTournée 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1860
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   165
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   60
         Width           =   1455
      End
      Begin VB.TextBox txtiEtb 
         BackColor       =   &H8000000F&
         Height          =   315
         Index           =   0
         Left            =   1860
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   173
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   1200
         Width           =   1455
      End
      Begin VB.TextBox txtiEtb 
         BackColor       =   &H8000000F&
         Height          =   315
         Index           =   1
         Left            =   1860
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   175
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   1560
         Width           =   1455
      End
      Begin VB.TextBox txtiEtb 
         BackColor       =   &H8000000F&
         Height          =   315
         Index           =   2
         Left            =   1860
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   177
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   1920
         Width           =   1455
      End
      Begin VB.TextBox txtiEtb 
         BackColor       =   &H8000000F&
         Height          =   315
         Index           =   3
         Left            =   1860
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   179
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   2280
         Width           =   1455
      End
      Begin VB.TextBox txtiEtb 
         BackColor       =   &H8000000F&
         Height          =   315
         Index           =   4
         Left            =   1860
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   181
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   2640
         Width           =   1455
      End
      Begin VB.Label lblPlanning 
         AutoSize        =   -1  'True
         Caption         =   "Langue d'édition :"
         Height          =   210
         Index           =   3
         Left            =   0
         TabIndex        =   248
         Tag             =   "204"
         Top             =   3180
         Width           =   1710
      End
      Begin VB.Label lblPlanning 
         AutoSize        =   -1  'True
         Caption         =   "Centre de profit :"
         Height          =   210
         Index           =   2
         Left            =   0
         TabIndex        =   169
         Tag             =   "204"
         Top             =   840
         Width           =   1635
      End
      Begin VB.Label lblPlanning 
         AutoSize        =   -1  'True
         Caption         =   "Personne :"
         Height          =   210
         Index           =   1
         Left            =   0
         TabIndex        =   166
         Tag             =   "204"
         Top             =   480
         Width           =   1035
      End
      Begin VB.Label lblPlanning 
         AutoSize        =   -1  'True
         Caption         =   "Date tournée :"
         Height          =   210
         Index           =   0
         Left            =   0
         TabIndex        =   163
         Tag             =   "204"
         Top             =   60
         Width           =   1395
      End
      Begin VB.Label lblPlanning 
         AutoSize        =   -1  'True
         Caption         =   "iEtb :"
         Height          =   210
         Index           =   12
         Left            =   0
         TabIndex        =   172
         Tag             =   "204"
         Top             =   1260
         Width           =   495
      End
      Begin VB.Label lblPlanning 
         AutoSize        =   -1  'True
         Caption         =   "iSec :"
         Height          =   210
         Index           =   13
         Left            =   0
         TabIndex        =   174
         Tag             =   "204"
         Top             =   1620
         Width           =   510
      End
      Begin VB.Label lblPlanning 
         AutoSize        =   -1  'True
         Caption         =   "iDrg :"
         Height          =   210
         Index           =   14
         Left            =   0
         TabIndex        =   176
         Tag             =   "204"
         Top             =   1980
         Width           =   510
      End
      Begin VB.Label lblPlanning 
         AutoSize        =   -1  'True
         Caption         =   "iDna :"
         Height          =   210
         Index           =   15
         Left            =   0
         TabIndex        =   178
         Tag             =   "204"
         Top             =   2340
         Width           =   555
      End
      Begin VB.Label lblPlanning 
         AutoSize        =   -1  'True
         Caption         =   "iGrp :"
         Height          =   210
         Index           =   16
         Left            =   0
         TabIndex        =   180
         Tag             =   "204"
         Top             =   2700
         Width           =   510
      End
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   675
      Index           =   3
      Left            =   10080
      TabIndex        =   161
      Top             =   660
      Visible         =   0   'False
      Width           =   1155
      Begin VB.TextBox txtBouclageFocus 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   5
         Left            =   2280
         TabIndex        =   198
         Top             =   4920
         Width           =   255
      End
      Begin VB.TextBox txtBouclageFocus 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   4
         Left            =   0
         TabIndex        =   184
         Top             =   3180
         Width           =   255
      End
      Begin VB.TextBox txtNomCPrin 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2640
         Locked          =   -1  'True
         TabIndex        =   191
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   3780
         Width           =   3420
      End
      Begin VB.TextBox txtCTrafiquée 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1860
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   197
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   4860
         Width           =   375
      End
      Begin VB.TextBox txtNumCon 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1860
         Locked          =   -1  'True
         TabIndex        =   187
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   3420
         Width           =   720
      End
      Begin VB.TextBox txtNomCon 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2640
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   188
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   4140
         Width           =   7095
      End
      Begin VB.TextBox txtCPrin 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1860
         Locked          =   -1  'True
         TabIndex        =   190
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   3780
         Width           =   720
      End
      Begin VB.TextBox txtNumConInfo 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1860
         Locked          =   -1  'True
         TabIndex        =   193
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   4140
         Width           =   720
      End
      Begin VB.TextBox txtCPrinInfo 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1860
         Locked          =   -1  'True
         TabIndex        =   195
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   4500
         Width           =   720
      End
      Begin MSFlexGridLib.MSFlexGrid fgRésultat 
         Height          =   2835
         Left            =   0
         TabIndex        =   185
         Top             =   240
         Width           =   8895
         _ExtentX        =   15690
         _ExtentY        =   5001
         _Version        =   393216
         Rows            =   11
         Cols            =   5
         FixedCols       =   0
         FocusRect       =   0
         HighLight       =   0
         ScrollBars      =   2
         SelectionMode   =   1
         BorderStyle     =   0
         FormatString    =   "<Germe                                                                        |>Résultat    |>Critère      |<CPar |^Etat"
      End
      Begin VB.Label lblTitreRésultats 
         AutoSize        =   -1  'True
         Caption         =   "Résultats :"
         Height          =   210
         Left            =   0
         TabIndex        =   183
         Tag             =   "204"
         Top             =   0
         Width           =   1020
      End
      Begin VB.Label lblRésultats 
         AutoSize        =   -1  'True
         Caption         =   "C. trafiquée :"
         Height          =   210
         Index           =   11
         Left            =   0
         TabIndex        =   196
         Tag             =   "204"
         Top             =   4920
         Width           =   1245
      End
      Begin VB.Label lblRésultats 
         AutoSize        =   -1  'True
         Caption         =   "Conclusion :"
         Height          =   210
         Index           =   0
         Left            =   0
         TabIndex        =   186
         Tag             =   "204"
         Top             =   3480
         Width           =   1155
      End
      Begin VB.Label lblRésultats 
         AutoSize        =   -1  'True
         Caption         =   "CPrin :"
         Height          =   210
         Index           =   1
         Left            =   0
         TabIndex        =   189
         Tag             =   "204"
         Top             =   3840
         Width           =   630
      End
      Begin VB.Label lblRésultats 
         AutoSize        =   -1  'True
         Caption         =   "CInfo :"
         Height          =   210
         Index           =   2
         Left            =   0
         TabIndex        =   192
         Tag             =   "204"
         Top             =   4200
         Width           =   645
      End
      Begin VB.Label lblRésultats 
         AutoSize        =   -1  'True
         Caption         =   "CPrinInfo :"
         Height          =   210
         Index           =   3
         Left            =   0
         TabIndex        =   194
         Tag             =   "204"
         Top             =   4560
         Width           =   1005
      End
   End
   Begin VB.TextBox txtRéférence 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1320
      Locked          =   -1  'True
      TabIndex        =   158
      TabStop         =   0   'False
      Tag             =   "224"
      Top             =   540
      Width           =   1560
   End
   Begin VB.TextBox txtNomEtb 
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   3900
      Locked          =   -1  'True
      TabIndex        =   156
      TabStop         =   0   'False
      Tag             =   "200"
      Top             =   900
      Width           =   5745
   End
   Begin VB.TextBox txtPréfixe 
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   2340
      Locked          =   -1  'True
      TabIndex        =   155
      TabStop         =   0   'False
      Tag             =   "200"
      Top             =   900
      Width           =   1515
   End
   Begin VB.TextBox txtNumEtb 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1320
      Locked          =   -1  'True
      TabIndex        =   154
      TabStop         =   0   'False
      Tag             =   "200"
      Top             =   900
      Width           =   990
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   1635
      Index           =   5
      Left            =   7260
      TabIndex        =   153
      Top             =   1740
      Visible         =   0   'False
      Width           =   855
      Begin VB.TextBox txtCorrection 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   5040
         Locked          =   -1  'True
         TabIndex        =   238
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   4440
         Width           =   375
      End
      Begin VB.CommandButton btnDétailFRT 
         Caption         =   "Détail…"
         Height          =   315
         Left            =   2700
         TabIndex        =   243
         ToolTipText     =   "Affiche des infos sur la FRT indiquée"
         Top             =   4800
         Width           =   915
      End
      Begin VB.Frame fraLabo 
         Caption         =   "Laboratoire"
         Height          =   2835
         Left            =   0
         TabIndex        =   214
         Top             =   1500
         Width           =   9135
         Begin VB.TextBox txtOperValLabo 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   4260
            Locked          =   -1  'True
            TabIndex        =   233
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   2400
            Width           =   615
         End
         Begin VB.TextBox txtDateValLabo 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   1860
            Locked          =   -1  'True
            TabIndex        =   232
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   2400
            Width           =   2175
         End
         Begin VB.TextBox txtNomValLabo 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   4920
            Locked          =   -1  'True
            TabIndex        =   234
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   2400
            Width           =   2955
         End
         Begin VB.TextBox txtOperSaisLabo 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   4260
            Locked          =   -1  'True
            TabIndex        =   225
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   1680
            Width           =   615
         End
         Begin VB.TextBox txtDateSaisLabo 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   1860
            Locked          =   -1  'True
            TabIndex        =   224
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   1680
            Width           =   2175
         End
         Begin VB.TextBox txtOperValLabo0 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   4260
            Locked          =   -1  'True
            TabIndex        =   229
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   2040
            Width           =   615
         End
         Begin VB.TextBox txtDateValLabo0 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   1860
            Locked          =   -1  'True
            TabIndex        =   228
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   2040
            Width           =   2175
         End
         Begin VB.TextBox txtNomSaisLabo 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   4920
            Locked          =   -1  'True
            TabIndex        =   226
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   1680
            Width           =   2955
         End
         Begin VB.TextBox txtNomValLabo0 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   4920
            Locked          =   -1  'True
            TabIndex        =   230
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   2040
            Width           =   2955
         End
         Begin VB.TextBox txtDateDebAn 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   1860
            Locked          =   -1  'True
            TabIndex        =   219
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   600
            Width           =   2175
         End
         Begin VB.TextBox txtLieuAn 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   1860
            Locked          =   -1  'True
            TabIndex        =   221
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   1320
            Width           =   375
         End
         Begin VB.TextBox txtNomLieuAn 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   2280
            Locked          =   -1  'True
            TabIndex        =   222
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   1320
            Width           =   5115
         End
         Begin VB.TextBox txtEtatLabo 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   1860
            Locked          =   -1  'True
            TabIndex        =   216
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   240
            Width           =   375
         End
         Begin VB.TextBox txtNomEtatLabo 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   2280
            Locked          =   -1  'True
            TabIndex        =   217
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   240
            Width           =   5595
         End
         Begin VB.Label lblTraçabilité 
            AutoSize        =   -1  'True
            Caption         =   "Validation :"
            Height          =   210
            Index           =   13
            Left            =   120
            TabIndex        =   231
            Tag             =   "204"
            Top             =   2460
            Width           =   1065
         End
         Begin VB.Label lblTraçabilité 
            AutoSize        =   -1  'True
            Caption         =   "Saisie :"
            Height          =   210
            Index           =   11
            Left            =   120
            TabIndex        =   223
            Tag             =   "204"
            Top             =   1740
            Width           =   690
         End
         Begin VB.Label lblTraçabilité 
            AutoSize        =   -1  'True
            Caption         =   "Validation 0 :"
            Height          =   210
            Index           =   9
            Left            =   120
            TabIndex        =   227
            Tag             =   "204"
            Top             =   2100
            Width           =   1245
         End
         Begin VB.Label lblTraçabilité 
            AutoSize        =   -1  'True
            Caption         =   "Début analyse :"
            Height          =   210
            Index           =   4
            Left            =   120
            TabIndex        =   218
            Tag             =   "204"
            Top             =   660
            Width           =   1500
         End
         Begin VB.Label lblTraçabilité 
            AutoSize        =   -1  'True
            Caption         =   "Lieu analyse :"
            Height          =   210
            Index           =   6
            Left            =   120
            TabIndex        =   220
            Tag             =   "204"
            Top             =   1380
            Width           =   1320
         End
         Begin VB.Label lblTraçabilité 
            AutoSize        =   -1  'True
            Caption         =   "Etat labo :"
            Height          =   210
            Index           =   8
            Left            =   120
            TabIndex        =   215
            Tag             =   "204"
            Top             =   300
            Width           =   990
         End
      End
      Begin VB.Frame fraPH 
         Caption         =   "Partie haute"
         Height          =   1395
         Left            =   0
         TabIndex        =   201
         Top             =   0
         Width           =   9135
         Begin VB.TextBox txtBouclageFocus 
            Appearance      =   0  'Flat
            BackColor       =   &H000000FF&
            BorderStyle     =   0  'None
            Height          =   255
            Index           =   8
            Left            =   1500
            TabIndex        =   203
            Top             =   240
            Width           =   255
         End
         Begin VB.TextBox txtOperSaisPH 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   4260
            Locked          =   -1  'True
            TabIndex        =   208
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   600
            Width           =   615
         End
         Begin VB.TextBox txtDateSaisPH 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   1860
            Locked          =   -1  'True
            TabIndex        =   207
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   600
            Width           =   2175
         End
         Begin VB.TextBox txtOperValPH 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   4260
            Locked          =   -1  'True
            TabIndex        =   212
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   960
            Width           =   615
         End
         Begin VB.TextBox txtDateValPH 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   1860
            Locked          =   -1  'True
            TabIndex        =   211
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   960
            Width           =   2175
         End
         Begin VB.TextBox txtNomSaisPH 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   4920
            Locked          =   -1  'True
            TabIndex        =   209
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   600
            Width           =   2955
         End
         Begin VB.TextBox txtNomValPH 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   4920
            Locked          =   -1  'True
            TabIndex        =   213
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   960
            Width           =   2955
         End
         Begin VB.TextBox txtEtatPH 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   1860
            Locked          =   -1  'True
            TabIndex        =   204
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   240
            Width           =   375
         End
         Begin VB.TextBox txtNomEtatPH 
            BackColor       =   &H8000000F&
            Height          =   315
            Left            =   2280
            Locked          =   -1  'True
            TabIndex        =   205
            TabStop         =   0   'False
            Tag             =   "200"
            Top             =   240
            Width           =   5595
         End
         Begin VB.Label lblTraçabilité 
            AutoSize        =   -1  'True
            Caption         =   "Saisie PH :"
            Height          =   210
            Index           =   2
            Left            =   120
            TabIndex        =   206
            Tag             =   "204"
            Top             =   660
            Width           =   1005
         End
         Begin VB.Label lblTraçabilité 
            AutoSize        =   -1  'True
            Caption         =   "Validation PH :"
            Height          =   210
            Index           =   3
            Left            =   120
            TabIndex        =   210
            Tag             =   "204"
            Top             =   1020
            Width           =   1380
         End
         Begin VB.Label lblTraçabilité 
            AutoSize        =   -1  'True
            Caption         =   "Etat PH :"
            Height          =   210
            Index           =   7
            Left            =   120
            TabIndex        =   202
            Tag             =   "204"
            Top             =   300
            Width           =   840
         End
      End
      Begin VB.TextBox txtNumFRT 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1860
         Locked          =   -1  'True
         TabIndex        =   242
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   4800
         Width           =   735
      End
      Begin VB.TextBox txtBouclageFocus 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   9
         Left            =   8940
         TabIndex        =   246
         Top             =   4860
         Width           =   255
      End
      Begin VB.TextBox txtCOFRAC 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1860
         Locked          =   -1  'True
         TabIndex        =   236
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   4440
         Width           =   375
      End
      Begin VB.TextBox txtDateCRA 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   6840
         Locked          =   -1  'True
         TabIndex        =   245
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   4800
         Width           =   1995
      End
      Begin VB.TextBox txtTimestamp 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   6840
         Locked          =   -1  'True
         TabIndex        =   240
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   4440
         Width           =   1995
      End
      Begin VB.Label lblTraçabilité 
         AutoSize        =   -1  'True
         Caption         =   "Correction :"
         Height          =   210
         Index           =   5
         Left            =   3840
         TabIndex        =   237
         Tag             =   "204"
         Top             =   4500
         Width           =   1110
      End
      Begin VB.Label lblTraçabilité 
         AutoSize        =   -1  'True
         Caption         =   "N° FRT :"
         Height          =   210
         Index           =   12
         Left            =   0
         TabIndex        =   241
         Tag             =   "204"
         Top             =   4860
         Width           =   765
      End
      Begin VB.Label lblTraçabilité 
         AutoSize        =   -1  'True
         Caption         =   "COFRAC :"
         Height          =   210
         Index           =   10
         Left            =   0
         TabIndex        =   235
         Tag             =   "204"
         Top             =   4500
         Width           =   900
      End
      Begin VB.Label lblTraçabilité 
         AutoSize        =   -1  'True
         Caption         =   "Date CRA :"
         Height          =   210
         Index           =   1
         Left            =   5640
         TabIndex        =   244
         Tag             =   "204"
         Top             =   4860
         Width           =   1020
      End
      Begin VB.Label lblTraçabilité 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   0
         Left            =   5640
         TabIndex        =   239
         Tag             =   "204"
         Top             =   4500
         Width           =   1155
      End
   End
   Begin MSComctlLib.TabStrip tsTab 
      Height          =   435
      Left            =   5160
      TabIndex        =   152
      Top             =   1260
      Width           =   4455
      _ExtentX        =   7858
      _ExtentY        =   767
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   5
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Tête"
            Key             =   "Tête"
            Object.ToolTipText     =   "Partie haute du CRA"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Analyse"
            Key             =   "Analyse"
            Object.ToolTipText     =   "Informations relatives à l'analyse"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Résultats"
            Key             =   "Résultats"
            Object.ToolTipText     =   "Résultats de l'analyse"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Planning"
            Key             =   "Planning"
            Object.ToolTipText     =   "Informations relatives à la planification"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Divers"
            Key             =   "Divers"
            Object.ToolTipText     =   "Traçabilité de l'échantillon"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   1095
      Index           =   2
      Left            =   3360
      TabIndex        =   151
      Top             =   1920
      Visible         =   0   'False
      Width           =   1995
      Begin VB.TextBox txtStatusModif 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   315
         Left            =   9720
         Locked          =   -1  'True
         MaxLength       =   1
         TabIndex        =   114
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   360
         Width           =   255
      End
      Begin VB.TextBox txtPrixSpécifique 
         Height          =   315
         Left            =   8400
         MaxLength       =   5
         TabIndex        =   135
         Tag             =   "200"
         Top             =   1800
         Width           =   1035
      End
      Begin VB.TextBox txtRevivification 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   8400
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   112
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   360
         Width           =   495
      End
      Begin VB.TextBox txtTraitéPar 
         Height          =   315
         Left            =   1860
         MaxLength       =   5
         TabIndex        =   131
         Tag             =   "200"
         Top             =   1800
         Width           =   555
      End
      Begin VB.CheckBox chkCongelé 
         Caption         =   "Co&ngelé par le labo"
         Height          =   210
         Left            =   6300
         TabIndex        =   127
         Top             =   1140
         Width           =   2175
      End
      Begin VB.TextBox txtBouclageFocus 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   3
         Left            =   9360
         TabIndex        =   150
         Top             =   2220
         Width           =   255
      End
      Begin VB.TextBox txtBouclageFocus 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   2
         Left            =   1560
         TabIndex        =   102
         Top             =   60
         Width           =   255
      End
      Begin VB.CommandButton btnModifieBoîte 
         Caption         =   "m"
         Height          =   315
         Left            =   7680
         TabIndex        =   148
         ToolTipText     =   "Modifie une boîte de la liste"
         Top             =   2220
         Width           =   315
      End
      Begin VB.CommandButton btnModifieGerme 
         Caption         =   "m"
         Height          =   315
         Left            =   2700
         TabIndex        =   143
         ToolTipText     =   "Modifie un germe de la liste"
         Top             =   2220
         Width           =   315
      End
      Begin VB.TextBox txtRangEchSérie 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   5400
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   118
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   720
         Width           =   855
      End
      Begin VB.TextBox txtNumSérie 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1860
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   116
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   720
         Width           =   1275
      End
      Begin VB.TextBox txtOptionsLabo 
         Height          =   315
         Left            =   1860
         MaxLength       =   5
         TabIndex        =   124
         Tag             =   "200"
         Top             =   1080
         Width           =   1035
      End
      Begin VB.TextBox txtCritère 
         Height          =   315
         Left            =   1860
         MaxLength       =   10
         TabIndex        =   104
         Tag             =   "200"
         Top             =   0
         Width           =   1395
      End
      Begin VB.TextBox txtTitreCritère 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   3300
         Locked          =   -1  'True
         TabIndex        =   105
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   0
         Width           =   6645
      End
      Begin VB.TextBox txtRemarquesLabo 
         Height          =   315
         Left            =   1860
         MaxLength       =   200
         TabIndex        =   129
         Tag             =   "200"
         Top             =   1440
         Width           =   8175
      End
      Begin VB.CheckBox chkFax 
         Caption         =   "&Fax"
         Height          =   210
         Left            =   5400
         TabIndex        =   126
         Top             =   1140
         Width           =   1035
      End
      Begin VB.CheckBox chkIE 
         Caption         =   "&IE"
         Height          =   210
         Left            =   4500
         TabIndex        =   125
         Top             =   1140
         Width           =   1035
      End
      Begin VB.CommandButton btnLireGermes 
         Caption         =   "&Lire germes"
         Height          =   315
         Left            =   5100
         TabIndex        =   139
         Top             =   5160
         Width           =   1275
      End
      Begin VB.TextBox txtVerCrit 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   5400
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   110
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   360
         Width           =   495
      End
      Begin VB.CommandButton btnEnlèveGerme 
         Caption         =   "-"
         Height          =   315
         Left            =   2280
         TabIndex        =   142
         ToolTipText     =   "Retire un germe de la liste"
         Top             =   2220
         Width           =   315
      End
      Begin VB.CommandButton btnAjouteGerme 
         Caption         =   "+"
         Height          =   315
         Left            =   1860
         TabIndex        =   141
         ToolTipText     =   "Ajoute un germe"
         Top             =   2220
         Width           =   315
      End
      Begin VB.CommandButton btnAjouteBoîte 
         Caption         =   "+"
         Height          =   315
         Left            =   6840
         TabIndex        =   146
         ToolTipText     =   "Ajoute une boîte à la liste"
         Top             =   2220
         Width           =   315
      End
      Begin VB.CommandButton btnEnlèveBoîte 
         Caption         =   "-"
         Height          =   315
         Left            =   7260
         TabIndex        =   147
         ToolTipText     =   "Retire une boîte de la liste"
         Top             =   2220
         Width           =   315
      End
      Begin MSFlexGridLib.MSFlexGrid fgBoîtes 
         Height          =   2115
         Left            =   5100
         TabIndex        =   149
         Top             =   2580
         Width           =   4935
         _ExtentX        =   8705
         _ExtentY        =   3731
         _Version        =   393216
         Rows            =   8
         Cols            =   7
         FixedCols       =   0
         FocusRect       =   0
         ScrollBars      =   0
         SelectionMode   =   1
         BorderStyle     =   0
         FormatString    =   "<Milieu    |>Dil  |>Qté  |>Facteur  |>No b|<Type  |Légende"
      End
      Begin MSFlexGridLib.MSFlexGrid fgGermes 
         Height          =   2895
         Left            =   0
         TabIndex        =   144
         Top             =   2580
         Width           =   5055
         _ExtentX        =   8916
         _ExtentY        =   5106
         _Version        =   393216
         Rows            =   11
         Cols            =   5
         FixedCols       =   0
         FocusRect       =   0
         ScrollBars      =   2
         SelectionMode   =   1
         BorderStyle     =   0
         FormatString    =   "<Germe    |Méth|Unité         |>m             |>Seuil         "
      End
      Begin SCRAW.ChampDate txtDateDebAnPrévue 
         Height          =   315
         Left            =   5400
         TabIndex        =   133
         Top             =   1800
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
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
      Begin SCRAW.BDCombo cboMMéthode 
         Height          =   330
         Left            =   1860
         TabIndex        =   107
         Top             =   360
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
      End
      Begin SCRAW.BDCombo bdcClasseDoc 
         Height          =   330
         Left            =   8400
         TabIndex        =   120
         Top             =   720
         Width           =   3555
         _ExtentX        =   6271
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
      End
      Begin SCRAW.BDCombo bdcDevise 
         Height          =   330
         Left            =   9480
         TabIndex        =   136
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
      End
      Begin MSWLess.WLCommand btnNouveau 
         Height          =   315
         Index           =   0
         Left            =   12000
         TabIndex        =   121
         TabStop         =   0   'False
         Tag             =   "classedoc"
         ToolTipText     =   "Cliquez pour voir le rôle de ce nouveau champ"
         Top             =   720
         Visible         =   0   'False
         Width           =   405
         _ExtentX        =   714
         _ExtentY        =   556
         _Version        =   393216
         Caption         =   "ç"
         ForeColor       =   -1
         BackColor       =   65535
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Wingdings"
            Size            =   12
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Style           =   1
      End
      Begin MSWLess.WLCommand btnNouveau 
         Height          =   315
         Index           =   1
         Left            =   12000
         TabIndex        =   137
         TabStop         =   0   'False
         Tag             =   "prix"
         ToolTipText     =   "Cliquez pour voir le rôle de ce nouveau champ"
         Top             =   1800
         Visible         =   0   'False
         Width           =   405
         _ExtentX        =   714
         _ExtentY        =   556
         _Version        =   393216
         Caption         =   "ç"
         ForeColor       =   -1
         BackColor       =   65535
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Wingdings"
            Size            =   12
            Charset         =   2
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Style           =   1
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "Modif :"
         Height          =   210
         Index           =   14
         Left            =   9000
         TabIndex        =   113
         Tag             =   "204"
         Top             =   420
         Width           =   630
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "Prix spécifique :"
         Height          =   210
         Index           =   13
         Left            =   7020
         TabIndex        =   134
         Tag             =   "204"
         Top             =   1860
         Width           =   1485
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "Classe doc :"
         Height          =   210
         Index           =   11
         Left            =   6960
         TabIndex        =   119
         Tag             =   "204"
         Top             =   780
         Width           =   1155
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "&Date de début d'analyse prévue :"
         Height          =   210
         Index           =   8
         Left            =   2580
         TabIndex        =   132
         Tag             =   "204"
         Top             =   1860
         Width           =   3180
      End
      Begin VB.Label lblModeGermes 
         AutoSize        =   -1  'True
         Caption         =   "Mode des germes"
         Height          =   210
         Left            =   5100
         TabIndex        =   200
         Top             =   4920
         Width           =   1680
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "Revivification :"
         Height          =   210
         Index           =   7
         Left            =   6960
         TabIndex        =   111
         Tag             =   "204"
         Top             =   420
         Width           =   1350
      End
      Begin VB.Label lblModeBoîtes 
         AutoSize        =   -1  'True
         Caption         =   "Mode des boîtes"
         Height          =   210
         Left            =   5100
         TabIndex        =   199
         Top             =   4740
         Width           =   1560
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "&Traité par :"
         Height          =   210
         Index           =   12
         Left            =   0
         TabIndex        =   130
         Tag             =   "204"
         Top             =   1860
         Width           =   1050
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "Rang :"
         Height          =   210
         Index           =   10
         Left            =   4500
         TabIndex        =   117
         Tag             =   "204"
         Top             =   780
         Width           =   615
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "N° série :"
         Height          =   210
         Index           =   9
         Left            =   0
         TabIndex        =   115
         Tag             =   "204"
         Top             =   780
         Width           =   900
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "Crit&ère :"
         Height          =   210
         Index           =   0
         Left            =   0
         TabIndex        =   103
         Tag             =   "204"
         Top             =   60
         Width           =   780
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "&Opt labo :"
         Height          =   210
         Index           =   3
         Left            =   0
         TabIndex        =   123
         Tag             =   "204"
         Top             =   1140
         Width           =   945
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "MMéthod&e :"
         Height          =   210
         Index           =   2
         Left            =   0
         TabIndex        =   106
         Tag             =   "204"
         Top             =   420
         Width           =   1110
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "Re&marques :"
         Height          =   210
         Index           =   4
         Left            =   0
         TabIndex        =   128
         Tag             =   "204"
         Top             =   1500
         Width           =   1200
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "Liste des &germes :"
         Height          =   210
         Index           =   5
         Left            =   0
         TabIndex        =   140
         Tag             =   "204"
         Top             =   2280
         Width           =   1755
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "Version :"
         Height          =   210
         Index           =   1
         Left            =   4500
         TabIndex        =   109
         Tag             =   "204"
         Top             =   420
         Width           =   840
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "Liste des &boîtes :"
         Height          =   210
         Index           =   6
         Left            =   5100
         TabIndex        =   145
         Top             =   2280
         Width           =   1635
      End
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   885
      Index           =   1
      Left            =   180
      TabIndex        =   101
      Top             =   1380
      Visible         =   0   'False
      Width           =   1620
      Begin VB.TextBox txtCodeFamille 
         Height          =   315
         Left            =   6960
         MaxLength       =   20
         TabIndex        =   94
         Tag             =   "200"
         Top             =   7860
         Width           =   2880
      End
      Begin VB.TextBox txtDLC2 
         Height          =   315
         Left            =   3600
         MaxLength       =   10
         TabIndex        =   46
         Tag             =   "200"
         Top             =   3900
         Width           =   1455
      End
      Begin VB.TextBox txtNomIntOpér 
         BackColor       =   &H8000000F&
         Height          =   510
         Left            =   2640
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   97
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   8100
         Width           =   2415
      End
      Begin VB.TextBox txtIntOpér 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   1860
         TabIndex        =   96
         Tag             =   "200"
         Top             =   8100
         Width           =   720
      End
      Begin VB.TextBox txtInfo2 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   8580
         MaxLength       =   10
         TabIndex        =   92
         Tag             =   "200"
         Top             =   7500
         Width           =   1560
      End
      Begin VB.TextBox txtInfo1 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   6960
         TabIndex        =   91
         Tag             =   "200"
         Top             =   7500
         Width           =   1560
      End
      Begin VB.TextBox txtCondPrél 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   1860
         TabIndex        =   88
         Tag             =   "200"
         Top             =   7560
         Width           =   720
      End
      Begin VB.TextBox txtNomCondPrél 
         BackColor       =   &H8000000F&
         Height          =   510
         Left            =   2640
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   89
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   7560
         Width           =   2415
      End
      Begin VB.TextBox txtTechFab 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   1860
         TabIndex        =   82
         Tag             =   "200"
         Top             =   7020
         Width           =   720
      End
      Begin VB.TextBox txtNomTechFab 
         BackColor       =   &H8000000F&
         Height          =   510
         Left            =   2640
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   83
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   7020
         Width           =   2415
      End
      Begin VB.TextBox txtSecteurPrél 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   6960
         TabIndex        =   85
         Tag             =   "200"
         Top             =   6960
         Width           =   720
      End
      Begin VB.TextBox txtNomSecteurPrél 
         BackColor       =   &H8000000F&
         Height          =   510
         Left            =   7740
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   86
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   6960
         Width           =   2415
      End
      Begin VB.TextBox txtContenant 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   1860
         TabIndex        =   76
         Tag             =   "200"
         Top             =   6480
         Width           =   720
      End
      Begin VB.TextBox txtNomContenant 
         BackColor       =   &H8000000F&
         Height          =   510
         Left            =   2640
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   77
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   6480
         Width           =   2415
      End
      Begin VB.TextBox txtÉtatDiv 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   6960
         TabIndex        =   79
         Tag             =   "200"
         Top             =   6420
         Width           =   720
      End
      Begin VB.TextBox txtNomÉtatDiv 
         BackColor       =   &H8000000F&
         Height          =   510
         Left            =   7740
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   80
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   6420
         Width           =   2415
      End
      Begin VB.TextBox txtNomÉtatPhy 
         BackColor       =   &H8000000F&
         Height          =   510
         Left            =   7740
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   74
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   5880
         Width           =   2415
      End
      Begin VB.TextBox txtÉtatPhy 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   6960
         TabIndex        =   73
         Tag             =   "200"
         Top             =   5880
         Width           =   720
      End
      Begin VB.TextBox txtNomNivÉlabo 
         BackColor       =   &H8000000F&
         Height          =   510
         Left            =   2640
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   71
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   5940
         Width           =   2415
      End
      Begin VB.TextBox txtNivÉlabo 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   1860
         TabIndex        =   70
         Tag             =   "200"
         Top             =   5940
         Width           =   720
      End
      Begin VB.TextBox txtDateRetrait 
         Height          =   315
         Left            =   1860
         MaxLength       =   10
         TabIndex        =   47
         Tag             =   "200"
         Top             =   3900
         Width           =   1455
      End
      Begin VB.TextBox txtDateDLUO 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   8700
         MaxLength       =   10
         TabIndex        =   44
         Tag             =   "200"
         Top             =   3540
         Width           =   1455
      End
      Begin VB.TextBox txtDateDLC 
         Height          =   315
         Left            =   6960
         MaxLength       =   10
         TabIndex        =   43
         Tag             =   "200"
         Top             =   3540
         Width           =   1455
      End
      Begin VB.TextBox txtBouclageFocus 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   1
         Left            =   7380
         TabIndex        =   98
         Top             =   8220
         Width           =   255
      End
      Begin VB.TextBox txtBouclageFocus 
         Appearance      =   0  'Flat
         BackColor       =   &H000000FF&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   0
         Left            =   1440
         TabIndex        =   0
         Top             =   60
         Width           =   255
      End
      Begin VB.TextBox txtNomAspect 
         BackColor       =   &H8000000F&
         Height          =   510
         Left            =   7740
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   68
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   5325
         Width           =   2415
      End
      Begin VB.TextBox txtAspect 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   6960
         TabIndex        =   67
         Tag             =   "200"
         Top             =   5325
         Width           =   720
      End
      Begin VB.TextBox txtUV 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   6960
         MaxLength       =   20
         TabIndex        =   62
         Tag             =   "200"
         Top             =   4965
         Width           =   3180
      End
      Begin VB.TextBox txtMarque 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   1860
         MaxLength       =   20
         TabIndex        =   60
         Tag             =   "200"
         Top             =   4980
         Width           =   3180
      End
      Begin VB.TextBox txtCodeFabricant 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   1860
         MaxLength       =   20
         TabIndex        =   56
         Tag             =   "200"
         Top             =   4620
         Width           =   3180
      End
      Begin VB.TextBox txtNomPro 
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   2880
         Locked          =   -1  'True
         TabIndex        =   3
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   0
         Width           =   6105
      End
      Begin VB.TextBox txtNumPro 
         Height          =   315
         Left            =   1860
         TabIndex        =   2
         Tag             =   "200"
         Top             =   0
         Width           =   960
      End
      Begin VB.TextBox txtComplémentNom 
         Height          =   315
         Left            =   1860
         MaxLength       =   60
         TabIndex        =   6
         Tag             =   "200"
         Top             =   360
         Width           =   8340
      End
      Begin VB.TextBox txtObs 
         Height          =   315
         Left            =   1860
         MaxLength       =   255
         TabIndex        =   8
         Tag             =   "200"
         Top             =   720
         Width           =   8340
      End
      Begin VB.TextBox txtCodeArticle 
         Height          =   315
         Left            =   6960
         MaxLength       =   20
         TabIndex        =   20
         Tag             =   "200"
         Top             =   1740
         Width           =   3180
      End
      Begin VB.TextBox txtNumLip 
         Height          =   315
         Left            =   1860
         TabIndex        =   22
         Tag             =   "200"
         Top             =   2100
         Width           =   720
      End
      Begin VB.TextBox txtNomLip 
         BackColor       =   &H8000000F&
         Height          =   510
         Left            =   2640
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   23
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   2100
         Width           =   2415
      End
      Begin VB.TextBox txtNumCdt 
         Height          =   315
         Left            =   6960
         TabIndex        =   25
         Tag             =   "200"
         Top             =   2100
         Width           =   720
      End
      Begin VB.TextBox txtNomCdt 
         BackColor       =   &H8000000F&
         Height          =   510
         Left            =   7740
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   26
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   2100
         Width           =   2415
      End
      Begin VB.TextBox txtNumFab 
         Height          =   315
         Left            =   1860
         TabIndex        =   28
         Tag             =   "200"
         Top             =   2640
         Width           =   720
      End
      Begin VB.TextBox txtNomFab 
         BackColor       =   &H8000000F&
         Height          =   510
         Left            =   2640
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   29
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   2640
         Width           =   2415
      End
      Begin VB.TextBox txtNumDis 
         Height          =   315
         Left            =   6960
         TabIndex        =   31
         Tag             =   "200"
         Top             =   2640
         Width           =   720
      End
      Begin VB.TextBox txtNomDis 
         BackColor       =   &H8000000F&
         Height          =   510
         Left            =   7740
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   32
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   2640
         Width           =   2415
      End
      Begin VB.TextBox txtIdLot 
         Height          =   315
         Left            =   1860
         MaxLength       =   20
         TabIndex        =   41
         Tag             =   "200"
         Top             =   3540
         Width           =   3180
      End
      Begin VB.TextBox txtCodeEmballeur 
         Height          =   315
         Left            =   6960
         MaxLength       =   20
         TabIndex        =   49
         Tag             =   "200"
         Top             =   3900
         Width           =   3180
      End
      Begin VB.TextBox txtNumCpr 
         Height          =   315
         Left            =   6960
         TabIndex        =   53
         Tag             =   "200"
         Top             =   4260
         Width           =   720
      End
      Begin VB.TextBox txtNomCpr 
         BackColor       =   &H8000000F&
         Height          =   555
         Left            =   7740
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   54
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   4260
         Width           =   2415
      End
      Begin VB.TextBox txtRefOrigine 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   1860
         MaxLength       =   20
         TabIndex        =   51
         Tag             =   "200"
         Top             =   4260
         Width           =   3180
      End
      Begin VB.TextBox txtOptionsEdition 
         Height          =   315
         Left            =   6960
         MaxLength       =   5
         TabIndex        =   58
         Tag             =   "200"
         Top             =   4605
         Width           =   735
      End
      Begin VB.TextBox txtCritèreInfo 
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   9060
         Locked          =   -1  'True
         MaxLength       =   10
         TabIndex        =   4
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   0
         Width           =   1155
      End
      Begin SCRAW.ChampTempérature txtTempératureProduit 
         Height          =   315
         Left            =   6960
         TabIndex        =   13
         Top             =   1380
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
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
      Begin SCRAW.ChampHeure txtHeurePrélèvement 
         Height          =   315
         Left            =   3360
         TabIndex        =   11
         Top             =   1380
         Width           =   915
         _ExtentX        =   1614
         _ExtentY        =   556
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
      Begin SCRAW.ChampDate txtDatePrélèvement 
         Height          =   315
         Left            =   1860
         TabIndex        =   10
         Top             =   1380
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
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
      Begin SCRAW.ChampDate txtDatePréparation 
         Height          =   315
         Left            =   1860
         TabIndex        =   17
         Top             =   1740
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
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
      Begin SCRAW.ChampDate txtDateFabrication 
         Height          =   315
         Left            =   1860
         TabIndex        =   34
         Top             =   3180
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
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
      Begin SCRAW.ChampDate txtDateLivraison 
         Height          =   315
         Left            =   6960
         TabIndex        =   37
         Top             =   3180
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
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
      Begin SCRAW.ChampDate txtDateConditionnement 
         Height          =   315
         Left            =   3600
         TabIndex        =   35
         Top             =   3180
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
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
      Begin SCRAW.ChampTempérature txtTempératureAmbiance 
         Height          =   315
         Left            =   8040
         TabIndex        =   14
         Top             =   1380
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
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
      Begin SCRAW.ChampTempérature txtTempératureRéception 
         Height          =   315
         Left            =   9120
         TabIndex        =   15
         Top             =   1380
         Width           =   1035
         _ExtentX        =   1826
         _ExtentY        =   556
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   12640511
      End
      Begin SCRAW.ChampDate txtDateRéception 
         Height          =   315
         Left            =   1860
         TabIndex        =   64
         Top             =   5340
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
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
      Begin SCRAW.ChampHeure txtHeurePréparation 
         Height          =   315
         Left            =   3360
         TabIndex        =   18
         Top             =   1740
         Width           =   915
         _ExtentX        =   1614
         _ExtentY        =   556
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   12640511
      End
      Begin SCRAW.ChampDate txtDateDéconditionnement 
         Height          =   315
         Left            =   8700
         TabIndex        =   39
         Top             =   3180
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
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
      Begin SCRAW.ChampHeure txtHeureRéception 
         Height          =   315
         Left            =   3420
         TabIndex        =   65
         Top             =   5340
         Width           =   915
         _ExtentX        =   1614
         _ExtentY        =   556
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
      Begin SCRAW.ChampDate txtDateRéceptionClient 
         Height          =   315
         Left            =   1860
         TabIndex        =   38
         Top             =   5640
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   556
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
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Code famille:|[28]"
         Height          =   210
         Index           =   35
         Left            =   5100
         TabIndex        =   93
         Tag             =   "204"
         Top             =   7860
         Width           =   1695
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Date décondit. :|[13]"
         Height          =   210
         Index           =   34
         Left            =   0
         TabIndex        =   122
         Tag             =   "204"
         Top             =   3420
         Width           =   1980
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Int. opérateur :|[9]"
         Height          =   210
         Index           =   33
         Left            =   0
         TabIndex        =   95
         Tag             =   "204"
         Top             =   8160
         Width           =   1815
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Info Rab :"
         Height          =   210
         Index           =   32
         Left            =   5100
         TabIndex        =   90
         Tag             =   "204"
         Top             =   7560
         Width           =   930
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Cond. de prél. :|[15]"
         Height          =   210
         Index           =   31
         Left            =   0
         TabIndex        =   87
         Tag             =   "204"
         Top             =   7620
         Width           =   1935
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Technologie de fab:|[20]"
         Height          =   210
         Index           =   29
         Left            =   0
         TabIndex        =   81
         Tag             =   "204"
         Top             =   7080
         Width           =   2325
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Secteur prélèv. :|[7]"
         Height          =   210
         Index           =   30
         Left            =   5100
         TabIndex        =   84
         Tag             =   "204"
         Top             =   7020
         Width           =   1905
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Contenant :|[17]"
         Height          =   210
         Index           =   27
         Left            =   0
         TabIndex        =   75
         Tag             =   "204"
         Top             =   6540
         Width           =   1605
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "État de division :|[18]"
         Height          =   210
         Index           =   28
         Left            =   5100
         TabIndex        =   78
         Tag             =   "204"
         Top             =   6480
         Width           =   2055
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "État physique :|[8]"
         Height          =   210
         Index           =   26
         Left            =   5100
         TabIndex        =   72
         Tag             =   "204"
         Top             =   5940
         Width           =   1785
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Niv. d'élaboration :|[19]"
         Height          =   210
         Index           =   25
         Left            =   0
         TabIndex        =   69
         Tag             =   "204"
         Top             =   6000
         Width           =   2250
      End
      Begin VB.Label lblOrthographe 
         AutoSize        =   -1  'True
         ForeColor       =   &H000000FF&
         Height          =   210
         Left            =   1860
         TabIndex        =   138
         Tag             =   "204"
         Top             =   1080
         Width           =   60
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Date de r&éception :"
         Height          =   210
         Index           =   23
         Left            =   0
         TabIndex        =   63
         Tag             =   "204"
         Top             =   5400
         Width           =   1830
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Aspect échantillon :|[34]"
         Height          =   210
         Index           =   24
         Left            =   5100
         TabIndex        =   66
         Tag             =   "204"
         Top             =   5385
         Width           =   2310
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Unité de vente :|[30]"
         Height          =   210
         Index           =   22
         Left            =   5100
         TabIndex        =   61
         Tag             =   "204"
         Top             =   5025
         Width           =   1995
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Mar&que :|[29]"
         Height          =   210
         Index           =   21
         Left            =   0
         TabIndex        =   59
         Tag             =   "204"
         Top             =   5040
         Width           =   1305
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Code fabr&icant :"
         Height          =   210
         Index           =   19
         Left            =   0
         TabIndex        =   55
         Tag             =   "204"
         Top             =   4680
         Width           =   1515
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "&Produit :"
         Height          =   210
         Index           =   0
         Left            =   0
         TabIndex        =   1
         Tag             =   "204"
         Top             =   60
         Width           =   810
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Comp&lément nom :"
         Height          =   210
         Index           =   1
         Left            =   0
         TabIndex        =   5
         Tag             =   "204"
         Top             =   420
         Width           =   1785
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "O&bservations :"
         Height          =   210
         Index           =   2
         Left            =   0
         TabIndex        =   7
         Tag             =   "204"
         Top             =   780
         Width           =   1395
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Date+heure prél :|[5]"
         Height          =   210
         Index           =   3
         Left            =   0
         TabIndex        =   9
         Tag             =   "204"
         Top             =   1440
         Width           =   2040
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "D&ate préparation :|[12]"
         Height          =   210
         Index           =   5
         Left            =   0
         TabIndex        =   16
         Tag             =   "204"
         Top             =   1800
         Width           =   2220
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "T&° prod/amb/réc. :|[6]"
         Height          =   210
         Index           =   4
         Left            =   5100
         TabIndex        =   12
         Tag             =   "204"
         Top             =   1440
         Width           =   2085
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Code article :|[27]"
         Height          =   210
         Index           =   6
         Left            =   5100
         TabIndex        =   19
         Tag             =   "204"
         Top             =   1680
         Width           =   1725
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Lieu d&e prél :[14]"
         Height          =   210
         Index           =   7
         Left            =   0
         TabIndex        =   21
         Tag             =   "204"
         Top             =   2160
         Width           =   1635
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Conditionnement :|[16]"
         Height          =   210
         Index           =   8
         Left            =   5160
         TabIndex        =   24
         Tag             =   "204"
         Top             =   2160
         Width           =   2220
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "&Fabricant :|[21]/[22]"
         Height          =   210
         Index           =   9
         Left            =   0
         TabIndex        =   27
         Tag             =   "204"
         Top             =   2700
         Width           =   1935
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "&Distributeur :|[31]/[32]"
         Height          =   210
         Index           =   10
         Left            =   5100
         TabIndex        =   30
         Tag             =   "204"
         Top             =   2700
         Width           =   2175
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Date fab/cond :|[23]"
         Height          =   210
         Index           =   11
         Left            =   0
         TabIndex        =   33
         Tag             =   "204"
         Top             =   3240
         Width           =   1935
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Date li&vraison :"
         Height          =   210
         Index           =   12
         Left            =   5100
         TabIndex        =   36
         Tag             =   "204"
         Top             =   3240
         Width           =   1425
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "DLC / DL&UO :|[25]"
         Height          =   210
         Index           =   14
         Left            =   5100
         TabIndex        =   42
         Tag             =   "204"
         Top             =   3600
         Width           =   1695
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Identification lot &:|[24]"
         Height          =   210
         Index           =   13
         Left            =   0
         TabIndex        =   40
         Tag             =   "204"
         Top             =   3600
         Width           =   2130
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Code emballeur :"
         Height          =   210
         Index           =   16
         Left            =   5100
         TabIndex        =   48
         Tag             =   "204"
         Top             =   3960
         Width           =   1620
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Cadre de prél&èv. :|[10]"
         Height          =   210
         Index           =   18
         Left            =   5100
         TabIndex        =   52
         Tag             =   "204"
         Top             =   4320
         Width           =   2175
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "DLC2/Retrait :|[26]"
         Height          =   210
         Index           =   15
         Left            =   0
         TabIndex        =   45
         Tag             =   "204"
         Top             =   3960
         Width           =   1530
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Référence ori&gine :"
         Height          =   210
         Index           =   17
         Left            =   0
         TabIndex        =   50
         Tag             =   "204"
         Top             =   4320
         Width           =   1785
      End
      Begin VB.Label lblTête 
         AutoSize        =   -1  'True
         Caption         =   "Option&s édition :"
         Height          =   210
         Index           =   20
         Left            =   5100
         TabIndex        =   57
         Tag             =   "204"
         Top             =   4665
         Width           =   1575
      End
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   100
      Top             =   9495
      Width           =   13080
      _ExtentX        =   23072
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
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
   Begin MSComctlLib.ImageList ListeImages 
      Left            =   9300
      Top             =   660
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   9
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRA.frx":0442
            Key             =   "imgSupprimer"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRA.frx":0554
            Key             =   "imgEnregistrer"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRA.frx":0666
            Key             =   "imgContrôler"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRA.frx":09B8
            Key             =   "imgValider"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRA.frx":0EFA
            Key             =   "imgEnregistrerQuitter"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRA.frx":124C
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRA.frx":1566
            Key             =   "imgQuitter"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRA.frx":1880
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRA.frx":1B9A
            Key             =   "imgSuivant"
         EndProperty
      EndProperty
   End
   Begin VB.Label lblRéférence 
      AutoSize        =   -1  'True
      Caption         =   "Référence :"
      Height          =   210
      Left            =   180
      TabIndex        =   160
      Tag             =   "228"
      Top             =   600
      Width           =   1080
   End
   Begin VB.Label lblEtablissement 
      AutoSize        =   -1  'True
      Caption         =   "Établiss. :"
      Height          =   210
      Left            =   180
      TabIndex        =   157
      Tag             =   "204"
      Top             =   960
      Width           =   930
   End
   Begin VB.Menu mnuRA 
      Caption         =   "&RA"
      Begin VB.Menu cmdContrôler 
         Caption         =   "&Contrôler"
      End
      Begin VB.Menu cmdValider 
         Caption         =   "&Valider"
         Shortcut        =   ^W
      End
      Begin VB.Menu cmdAnnulerValidation 
         Caption         =   "&Annuler la validation"
      End
      Begin VB.Menu sep0 
         Caption         =   "-"
      End
      Begin VB.Menu cmdEnregistrer 
         Caption         =   "&Enregistrer"
         Shortcut        =   ^S
      End
      Begin VB.Menu cmdEnregistrerQuitter 
         Caption         =   "En&registrer et quitter"
         Shortcut        =   {F2}
      End
      Begin VB.Menu cmdAbandonnerQuitter 
         Caption         =   "Abandonner et &quitter"
         Shortcut        =   {F3}
      End
      Begin VB.Menu sep10 
         Caption         =   "-"
      End
      Begin VB.Menu cmdSuivant 
         Caption         =   "S&uivant"
         Shortcut        =   {F12}
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdSupprimer 
         Caption         =   "&Supprimer"
      End
   End
   Begin VB.Menu mnuF5 
      Caption         =   "F&5"
      Begin VB.Menu cmdMémoriser 
         Caption         =   "&Mémoriser"
         Shortcut        =   ^{F5}
      End
      Begin VB.Menu sepF5 
         Caption         =   "-"
      End
      Begin VB.Menu cmdF5Valeur 
         Caption         =   "&Valeur mémorisée du champ"
      End
      Begin VB.Menu cmdF5Tête 
         Caption         =   "&Tête mémorisée"
         Shortcut        =   +{F5}
      End
      Begin VB.Menu cmdF5Analyse 
         Caption         =   "&Analyse précédente"
      End
   End
   Begin VB.Menu mnuRech 
      Caption         =   "Rec&herche"
      Begin VB.Menu cmdRechEtablissement 
         Caption         =   "&Etablissement…"
      End
      Begin VB.Menu cmdRechDate 
         Caption         =   "D&ate…"
      End
      Begin VB.Menu cmdRechProduit 
         Caption         =   "&Produit…"
      End
      Begin VB.Menu cmdRechFabricant 
         Caption         =   "&Fabricant…"
      End
      Begin VB.Menu cmdRechDistrib 
         Caption         =   "&Distributeur…"
      End
      Begin VB.Menu cmdRechConclusion 
         Caption         =   "Conc&lusion…"
      End
      Begin VB.Menu sepa 
         Caption         =   "-"
      End
      Begin VB.Menu cmdLibelléRA 
         Caption         =   "&1. Stade de prélèvement"
         Index           =   1
      End
      Begin VB.Menu cmdLibelléRA 
         Caption         =   "&2. Intervention opérateur"
         Index           =   2
      End
      Begin VB.Menu cmdLibelléRA 
         Caption         =   "&3. Mode de conditionnement"
         Index           =   3
      End
      Begin VB.Menu cmdLibelléRA 
         Caption         =   "&4. Niveau d'élaboration"
         Index           =   4
      End
      Begin VB.Menu cmdLibelléRA 
         Caption         =   "&5. État de division"
         Index           =   5
      End
      Begin VB.Menu cmdLibelléRA 
         Caption         =   "&6. État physique"
         Index           =   6
      End
      Begin VB.Menu cmdLibelléRA 
         Caption         =   "&7. Technologie de fabrication"
         Index           =   7
      End
      Begin VB.Menu cmdLibelléRA 
         Caption         =   "&8. Aspect de l'échantillon"
         Index           =   8
      End
      Begin VB.Menu cmdLibelléRA 
         Caption         =   "&9. Conditions de prélèvement"
         Index           =   9
      End
      Begin VB.Menu cmdLibelléRA 
         Caption         =   "10. Cadre du prélèvement"
         Index           =   10
      End
      Begin VB.Menu cmdLibelléRA 
         Caption         =   "11. Lieu de prélèvement"
         Index           =   11
      End
      Begin VB.Menu cmdLibelléRA 
         Caption         =   "12. &Contenant"
         Index           =   12
      End
   End
   Begin VB.Menu mnuAvancé 
      Caption         =   "Avanc&é"
      Begin VB.Menu cmdForcerRattachementFRTCourante 
         Caption         =   "&Forcer le rattachement à la FRT courante"
      End
      Begin VB.Menu cmdEffacerNuméroFRT 
         Caption         =   "&Effacer le rattachement à la FRT"
      End
      Begin VB.Menu cmdTrafiquerFRT 
         Caption         =   "&Trafiquer le n° de FRT sans contrôle"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&?"
      Begin VB.Menu cmdAideSommaire 
         Caption         =   "&Sommaire de l'aide"
      End
      Begin VB.Menu cmdAideContextuelle 
         Caption         =   "Aide &contextuelle"
         Shortcut        =   {F1}
      End
      Begin VB.Menu sep8 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A propos de…"
      End
   End
   Begin VB.Menu mnuBarreBoutons 
      Caption         =   "(BarreBoutons)"
      Visible         =   0   'False
      Begin VB.Menu cmdBarreStandard 
         Caption         =   "&Barre de boutons standard"
         Checked         =   -1  'True
      End
      Begin VB.Menu cmdEtiquettes 
         Caption         =   "&Afficher les étiquettes"
      End
   End
End
Attribute VB_Name = "frmRA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille de saisie des CRA sous Windows"
' frmRA
' Feuille de saisie des RA sous Windows
'  2/09/1997 PV
' 26/11/1997 PV Menu F5, et commande de reprise de la liste des germes
'  1/12/1997 PV Bug effacement fabricant et distributeur réglé
'  4/12/1997 PV Contrôle des DLC pour le cadre de prélèvement 8
' 12/12/1997 PV Message si DatePrel<now-4j et pas analyse à la DLC(cpr=8) ou expérimentale(cpr=5)
' 16/12/1997 PV Contrôle de date de prélèvement débrayé (Langlais)…
' 22/12/1997 PV Date de début d'analyse prévue; cadre de prélèvement 37 (analyse différée)
'  9/01/1998 PV Effacement de n° de FRT
' 27/01/1998 PV Possibilité de passer outre l'absence d'option D sans boîtes
' 30/01/1998 PV W12: Critère Listéria; avertissement si n° de FRT et analyse future
'  2/02/1998 PV Message si etb planifié sous une autre référence, si date de prélèvement pas homogène,
' 12/02/1998 PV Date d'analyse prévue un lundi
' 20/02/1998 PV bCheckIE n'est plus bloquant
' 22/07/1998 PV Message en cas de germe sans boîte
' 27/07/1998 PV Champs supplémentaires
'  7/08/1998 PV Intervention opérateur
' 10/08/1998 PV Heure de préparation; fin des champs non imprimés en jaune
' 26/08/1998 PV Tous les champs pris en compte dans Focus
'  2/09/1998 PV On efface le n° de produit si critère produit<>critère labo
' 15/10/1998 PV Champ cCorrection
' 29/10/1998 PV Contrôle option édition Z uniquement si McDo
'  2/11/1998 PV Listeria W20, W21, W22 (saisie critère / option L)
' 17/12/1998 PV Nouveau fichier produits; présentation 3col "nouveau"; DLC secondaire…
' 21/12/1998 PV 1.4: Nouveaux fichiers satellites; vieux libellés connençant par !; nouveaux produits avec t1=0
'  6/01/1999 PV Gestion locale du [État X] dans le nom de produit; gestion de la date de déconditionnement; F5 pour les nouveaux champs
'  8/01/1999 PV Verrouillage des nouveaux champs, «État » éliminé, pb date prél invalide
' 22/01/1999 PV Métaméthode B, AFNOR Bis
' 10/02/1999 NC Internationalisation
' 29/03/1999 PV 26 métaméthodes
' 29/04/1999 PV Délai des analyses courantes à 5 jours
'  3/05/1999 PV Fin de l'ancien fichier produit
' 18/11/1999 PV bCheckAlertesSodexho
'  5/02/2000 PV On efface les résultats précédents en cas de "F5 analyse"...
'  5/02/2000 PV Si option labo D, pas d'avertissement pour germes sans boîtes
'  4/07/2000 PV Pas de mise à jour nompro/critère info pour les saisies antérieures au 3/7/2000
'  3/12/2000 PV Classe de document
'  5/12/2000 PV +HeureRéception; activation DLC2, famille, date déconditionnement; Gestion du prix spécifique; Date de réception client
'  5/02/2001 PV Recopie de cStatusModif dans la recopie du corps
' 23/05/2001 PV Pas de classe Ch sur tripoli/co2/hagar
'  5/06/2001 PV Affectation autorisée des critères OGM*
' 17/07/2001 PV La suppression de RA saisi le jour même n'est plus une Op privilégiée
'  3/08/2001 PV Classe de document Le (Legionelles)
'  7/08/2001 PV Contrôle de plus de deux | dans les obs
' 20/08/2001 PV bCritèreImposable réécrit en se basant sur la classe de document
' 23/11/2001 PV Contrôles cra.dDatePrél<=cra.dDateRécep, cra.dDateRécep<=cra.dDateDebAnPrévue et cra.dDateRécep<=cra.dDateDebAn


Option Explicit

Private iCurFrame As Integer    ' Cadre courant visible

' Structure de données associée à la feuille
Public iTable As eTableRA      ' Table d'origine des données
Public cra As New RA

' Pour ne pas effacer les germes lors de l'initialisation des champs critère, MMéthode, …
Private bModeChargement As Boolean

' Gestion et affichage de l'indicateur de modification des données
Private sTitreFenêtre As String
Private bDirty As Boolean

' Pour connaître l'état du shift lors d'un double-clic, on mémorise le paramètre
' button lors d'un événement MouseDown…
Private iShift As Integer

' Orthographe
Dim sOrthComplémentNom As String
Dim sOrthObs As String

Dim iTabIndex As Integer


'========================================================
' Protection contre les problèmes de ré-entrance, mécanisme général

Sub DoActionSuivante(ByVal sAction As String)
  Select Case sAction
    Case "txtNumPro_LostFocus": txtNumPro_LostFocus
    Case "txtNumFab_LostFocus": txtNumFab_LostFocus
    Case "txtNumDis_LostFocus": txtNumDis_LostFocus
    Case "txtComplémentNom_LostFocus": txtComplémentNom_LostFocus
    Case "txtObs_LostFocus": txtObs_LostFocus
    Case Else: MsgBox "frmRA.DoActionSuivante: Action suivante " & sAction & " inconnue !", vbCritical, sNomApp: Stop
  End Select
End Sub


'========================================================

Private Function bContrôle() As Boolean
  bContrôle = False

  ' Contrôles individuels des champs, et transfert dans la structure de données
  
  ' Tête
  If Not bCheckNumPro(True) Then Exit Function
  If Not bCheckComplémentNom(True) Then Exit Function
  If Not bCheckObs(True) Then Exit Function
  If Not bCheckDatePrélèvement(True) Then Exit Function
  If Not bCheckHeurePrélèvement(True) Then Exit Function
  If Not bCheckTempératureProduit(True) Then Exit Function
  If Not bCheckTempératureAmbiance(True) Then Exit Function
  If Not bCheckTempératureRéception(True) Then Exit Function
  If Not bCheckDatePréparation(True) Then Exit Function
  If Not bCheckHeurePréparation(True) Then Exit Function
  If Not bCheckCodeArticle(True) Then Exit Function
  If Not bCheckCodeFamille(True) Then Exit Function
  If Not bCheckLieuDePrélèvement(True) Then Exit Function
  If Not bCheckConditionnement(True) Then Exit Function
  If Not bCheckInterventionOpérateur(True) Then Exit Function
  If Not bCheckFabricant(True) Then Exit Function
  If Not bCheckDistributeur(True) Then Exit Function
  If Not bCheckDateFabrication(True) Then Exit Function
  If Not bCheckDateLivraison(True) Then Exit Function
  If Not bCheckDateRéceptionClient(True) Then Exit Function
  If Not bCheckDateConditionnement(True) Then Exit Function
  If Not bCheckDateDéconditionnement(True) Then Exit Function
  If Not bCheckDateDLC(True) Then Exit Function
  If Not bCheckDateDLUO(True) Then Exit Function
  If Not bCheckIdLot(True) Then Exit Function
  If Not bCheckCodeEmballeur(True) Then Exit Function
  If Not bCheckDLC2(True) Then Exit Function
  If Not bCheckDateRetrait(True) Then Exit Function
  If Not bCheckCadreDePrélèvement(True) Then Exit Function
  If Not bCheckRefOrigine(True) Then Exit Function
  If Not bCheckCodeFabricant(True) Then Exit Function
  If Not bCheckOptionsEdition(True) Then Exit Function
  If Not bCheckMarque(True) Then Exit Function
  If Not bCheckUV(True) Then Exit Function
  If Not bCheckDateRéception(True) Then Exit Function
  If Not bCheckHeureRéception(True) Then Exit Function
  If Not bCheckAspectÉchantillon(True) Then Exit Function
  If Not bCheckNiveauÉlaboration(True) Then Exit Function
  If Not bCheckÉtatPhysique(True) Then Exit Function
  If Not bCheckContenant(True) Then Exit Function
  If Not bCheckÉtatDivision(True) Then Exit Function
  If Not bCheckTechnologieFabrication(True) Then Exit Function
  If Not bCheckSecteurPrélèvement(True) Then Exit Function
  If Not bCheckConditionsPrélèvement(True) Then Exit Function
  If Not bCheckInfosRab1(True) Then Exit Function
  If Not bCheckInfosRab2(True) Then Exit Function
  If Not bCheckNouveauxProduits(True) Then Exit Function
  
  
  ' Analyse
  If Not bCheckMMéthode(True) Then Exit Function
  If Not bCheckCritère(True) Then Exit Function
  If Not bCheckOptionsLabo(True) Then Exit Function
  If Not bCheckIE(True) Then Exit Function
  If Not bCheckFax(True) Then Exit Function
  If Not bCheckCongelé(True) Then Exit Function
  If Not bCheckRemarquesLabo(True) Then Exit Function
  If Not bCheckPrixSpécifique(True) Then Exit Function
  If Not bCheckDevise(True) Then Exit Function
  If Not bCheckTraitéPar(True) Then Exit Function
  If Not bCheckDateDebAnPrévue(True) Then Exit Function
  If Not bCheckGermes(True) Then Exit Function
  If Not bCheckBoîtes(True) Then Exit Function
  If Not bCheckDate2() Then Exit Function     ' Date de déb analyse prévue / jour
  If Not bCheckClasseDoc(True) Then Exit Function
  
  ' Contrôles de cohérence croisés
  If Not bCheckCritèreProduitAnalyse(True) Then Exit Function
  
  ' Quelques contrôles d'antériorité de dates, la biblio libcra en fera d'autres
  If Not bChekAntérioritéDate(cra.dDatePrél, Today, "date de prélèvement", "date du jour") Then Exit Function
  If Not bChekAntérioritéDate(cra.dDatePrél, cra.dDateRécep, "date de prélèvement", "date de réception labo") Then Exit Function
  If Not bChekAntérioritéDate(cra.dDateRécep, cra.dDateDebAnPrévue, "date de réception labo", "date d'analyse (prévue)") Then Exit Function
  If Not bChekAntérioritéDate(cra.dDateRécep, cra.dDateDebAn, "date de réception labo", "date d'analyse (réelle)") Then Exit Function
  bChekAntérioritéDate cra.dDatePrél, cra.sDlc, "date de prélèvement", "DLC", True
  If Not bChekAntérioritéDate(cra.dDatePrép, cra.dDatePrél, "date de préparation", "date de prélèvement") Then Exit Function
  If Not bChekAntérioritéDate(cra.dDateFab, cra.dDatePrél, "date de fabrication", "date de prélèvement") Then Exit Function
  If Not bChekAntérioritéDate(cra.dDateFab, cra.dDateCond, "date de fabrication", "date de conditionnement") Then Exit Function
  If Not bChekAntérioritéDate(cra.dDateCond, cra.dDatePrél, "date de conditionnement", "date de prélèvement") Then Exit Function
  If Not bChekAntérioritéDate(cra.dDateLivr, cra.dDatePrél, "date de livraison", "date de prélèvement") Then Exit Function
  If Not bChekAntérioritéDate(cra.dDateRécepCli, cra.dDatePrél, "date de réception client", "date de prélèvement") Then Exit Function
  If Not bChekAntérioritéDate(cra.dDateFab, cra.dDateLivr, "date de fabrication", "date de livraison") Then Exit Function
  If Not bChekAntérioritéDate(cra.dDateFab, cra.sDlc, "date de fabrication", "DLC") Then Exit Function
  If Not bChekAntérioritéDate(cra.dDateFab, cra.sDluo, "date de fabrication", "DLUO") Then Exit Function
  If Not bChekAntérioritéDate(cra.dDateLivr, cra.sDlc, "date de livraison", "DLC") Then Exit Function
  If Not bChekAntérioritéDate(cra.dDateLivr, cra.sDluo, "date de livraison", "DLUO") Then Exit Function
  
  ' Tests spécifiques
  bCheckAlertesSodexho True, False
  
  bContrôle = True
End Function


Private Function bContrôleValidation() As Boolean
  bContrôleValidation = False
  If Not bCheckAlertesSodexho(True, True) Then Exit Function

  bContrôleValidation = True
End Function



Private Function bChekAntérioritéDate(ByVal d1, ByVal d2, ByVal sD1 As String, ByVal sD2 As String, Optional bInformation As Boolean = False) As Boolean
  ' Pour DLC et DLUO, on autorise les dates compactes (ex: 280798)
  If Not IsDate(d2) Then
    If IsNull(d2) Then bChekAntérioritéDate = True: Exit Function
    If IsDateCompacte(d2) Then d2 = dDécodeDate(d2)
  End If
  
  If IsDate(d1) Then
    If IsDate(d2) Then
      If d1 = dAbsence Or d2 = dAbsence Then    ' Pas de contrôle par rapport à ABSENCE
        bChekAntérioritéDate = True
        Exit Function
      End If
      If CDate(d1) > CDate(d2) Then
        If bInformation Then
          MsgBox2i "CR100", sD1, sD2
          'MsgBox "Avertissement: La " & sD1 & " est postérieure à la " & sD2 & "." & vbCrLf & vbCrLf & "Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
        Else
          MsgBox2i "CR101", sD1, sD2
          'MsgBox "La " & sD1 & " doit être antérieure à la " & sD2 & ".", vbExclamation, sNomApp
        End If
        If bShiftPressed Then
          bChekAntérioritéDate = True   ' Passe-droit
        Else
          bChekAntérioritéDate = False
        End If
        Exit Function
      End If
    End If
  End If
  bChekAntérioritéDate = True
End Function


' Détermine s'il s'agit d'un vieux libellé
Private Function bContrôleVieuxLibellé(txtField As TextBox, sFichier As String, sLibellé As String, bMessage As Boolean) As Boolean
  ' Avant le 1/1/99, pas de contrôle
  If cra.dDatePrél < #1/1/1999# Then
    bContrôleVieuxLibellé = True
    Exit Function
  End If
  
  ' Contrôle non bloquant pour l'instant
  If Left(sLibellé, 1) = "!" Then
    If bMessage Then
          MsgBox2i "CR102", sFichier
          'MsgBox "Avertissement: Code " & sFichier & " incorrect !" & vbCrLf & vbCrLf & "Il s'agit d'un ancien libellé qui ne devrait plus être utilisé. L'utilisation de ce libellé sera impossible dans quelques jours." & vbCrLf & vbCrLf & "Prévenez le préleveur et/ou la DOP.", vbInformation, sNomApp
    End If
  End If
  
  bContrôleVieuxLibellé = True
End Function


' Retourne vrai si le critère peut être imposé sur l'onglet labo
' Ok pour TIAC et les classes BM et Li
' On gère un cache local en mémoire
Private Function bCritèreImposable(s As String) As Boolean
  If s = "TIAC" Then
    bCritèreImposable = True
    Exit Function
  End If
  
  Static colCacheCritèresAutorisés As New Collection
  
  ' On cherche d'abord dans le cache...
  Dim bRes As Boolean
  On Error Resume Next
  bRes = colCacheCritèresAutorisés(s)
  If Err = 0 Then
    bCritèreImposable = bRes
    Exit Function
  End If
  On Error GoTo 0
  
  ' Puis on interroge le démon
  Dim sClasse As String
  sClasse = sLireCritèreClasseDoc(s)
  bRes = UCase(sClasse) = "LI" Or UCase(sClasse) = "BM"
  colCacheCritèresAutorisés.Add bRes, s
  bCritèreImposable = bRes
  
'  bCritèreImposable = s = "W6" Or s = "W8" Or s = "W9" Or s = "W11" Or s = "W12" Or s = "W20" Or s = "W21" Or s = "W22" Or s = "TIAC" Or _
'    s = "W35" Or s = "W37" Or s = "W38" Or _
'    s = "FB297" Or s = "FB298" Or s = "FB299" Or s = "FB333" Or s = "FB348" Or s = "FB692" Or _
'    s = "FB712" Or s = "FB713" Or s = "FB714" Or s = "FB715" Or s = "FB716" Or s = "FB722" Or _
'    s = "FB723" Or s = "FB732" Or s = "FB793" Or s = "FB809" Or s = "FB819" Or s = "FB820" Or _
'    s = "FB846" Or s = "FB848" Or s = "FB858" Or s = "FB861" Or s = "FB873" Or s = "FB968" Or _
'    s Like "OGM*"
End Function


' Compare le critère du produit et le critère demandé pour l'analyse
' Ne compare que les parties avant un point
' Tolérance pour les analyses  W6, W8, W9, W11, W12, W20, W21, W22 et TIAC
Private Function bCheckCritèreProduitAnalyse(bMessage As Boolean) As Boolean
  Dim sCritèrePro As String, sCritèreAnalyse As String
  Dim p As Integer
  
  sCritèrePro = txtCritèreInfo
  p = InStr(sCritèrePro, ".")
  If p > 1 Then sCritèrePro = Left(sCritèrePro, p - 1)
  sCritèreAnalyse = txtCritère
  p = InStr(sCritèreAnalyse, ".")
  If p > 1 Then sCritèreAnalyse = Left(sCritèreAnalyse, p - 1)
  
  If bCritèreImposable(sCritèreAnalyse) Then
    bCheckCritèreProduitAnalyse = True
    Exit Function
  End If
  
  If sCritèrePro <> sCritèreAnalyse Then
    MsgBox2i "CR103b"
    ' Attention, le critère associé au produit est incompatible avec le critère d'analyse demandé.||Seuls les critères associés à la classe Li peuvent être affectés indépendamment du critère du produit.||Vous devez ressaisir le n° de produit et le critère.
    txtNumPro = ""
    txtNomPro = ""
    txtCritèreInfo = ""
    txtCritère = ""
    bCheckCritèreProduitAnalyse = False
    Focus txtNumPro
    Exit Function
  End If
  
  bCheckCritèreProduitAnalyse = True
End Function


Private Function bCheckAlertesSodexho(bMessage As Boolean, bModeValidation As Boolean) As Boolean
  bCheckAlertesSodexho = True
  If cra.sEtb = "1212" Or cra.iSec = 27257 Then ' A remplacer par une option
    Dim sMsg As String
    If cra.hClé2 = 1 And cra.hCadrePrél <> 33 Then
      sMsg = "Pour ce critère, le cadre de prélèvement devrait être '33: Sodexho Matière première à cuire'."
    End If
    If cra.hClé2 = 2 And cra.hCadrePrél <> 34 Then
      sMsg = "Pour ce critère, le cadre de prélèvement devrait être '34: Sodexho Produit à consommer en l'état'."
    End If
    If sMsg <> "" Then
      sMsg = "ALERTE SODEXHO " & IIf(bModeValidation, "Validation", "Saisie") & vbCrLf & vbCrLf & sMsg
      If bModeValidation Then
        sMsg = sMsg & vbCrLf & "Validation interdite, contactez la DOP."
      Else
        sMsg = sMsg & vbCrLf & "Vérifiez impérativement auprès de la DOP avant la validation définitive."
      End If
      MsgBox sMsg, IIf(bModeValidation, vbExclamation, vbInformation), App.Title
      DémonJournalUnix "Alerte Sodexho", "", sMsg & "|ref=" & cra.sRef & "|cri_cle2=" & cra.hClé2 & "|CP saisi=" & cra.hCadrePrél
      bCheckAlertesSodexho = False
    End If
  End If
End Function


' =============================================================
' Validation de la saisie
' A priori la personne ayant fait la saisie ne peut pas valider, mais il suffit
' de valider une deuxième fois pour que ça passe…

Private Sub DoValidation()
  If bBlocageEnCours Then
    MsgBox2i "CR104"
    'MsgBox "Validation non disponible, attendez quelques secondes…", vbInformation, sNomApp
    Exit Sub
  End If

  If bDirty Then
    MsgBox2i "CR105"
    'MsgBox "Les informations ont été modifiées. Vous devez enregistrer avant de valider.", vbInformation, sNomApp
    Exit Sub
  End If
  
  If cra.cEtatPH = "" Then
    MsgBox2i "CR106"
    'MsgBox "Impossible de valider un nouveau RA qui n'a pas été enregistré !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  If cra.cEtatPH > "2" Then
    MsgBox2i "CR107"
    'MsgBox "RA déjà validé !", vbExclamation, sNomApp
    Exit Sub
  End If
    
  ' Mécanisme pas trop rigide dissuadant la personne ayant fait la saisie de valider
  Static iNbMsg As Integer
  If iNbMsg = 0 And cra.hOperSaisPH = iNumOpérateur And cra.hOperSaisPH <> 46 And chkSaisieValidée.Value = vbUnchecked Then
    MsgBox2i "CR108"
    'MsgBox "La personne qui a fait la saisie ne peut pas valider la partie haute !", vbExclamation, sNomApp
    iNbMsg = iNbMsg + 1
    Exit Sub
  End If
  
  ' Contrôles spécifiques pour la validation
  If Not bContrôleValidation Then Exit Sub
  
  
  ' On valide
  cra.cEtatPH = "3"   ' Validé
  cra.hOperValPH = iNumOpérateur
  cra.dDateValPH = Now
  
  ' et on l'affiche
  txtEtatPH = cra.cEtatPH
  txtNomEtatPH = sLibelléEtatPH(cra.cEtatPH)
  txtOperValPH = iNumOpérateur
  txtNomValPH = sNomOpérateur
  txtDateValPH = Now
  
  ValideRA iTable, cra
  
  ' On passe en mode visualisation, pour ne rien modifier après une validation
  InitVisualisation
End Sub


Private Sub DoAnnulerValidation()
  If bBlocageEnCours Then
    MsgBox2i "CR109"
    'MsgBox "Annulation de la validation non disponible, attendez quelques secondes…", vbInformation, sNomApp
    Exit Sub
  End If

  If cra.cEtatPH <> "3" Then
    MsgBox2i "CR110"
    'MsgBox "RA non validé !", vbExclamation, sNomApp
    Exit Sub
  End If

  If cra.cEtatLabo >= "3" Then
    MsgBox2i "CR111"
    'MsgBox "Strictement impossible d'annuler la validation d'un RA déjà validé par le labo", vbExclamation, sNomApp
    Exit Sub
  End If
  
  Dim iRéponse As VbMsgBoxResult
  Dim sMsg As String
  sMsg = sGetIntlLib("CR112", "Question 112")
  iRéponse = MsgBox(sMsg, vbQuestion + vbYesNo, sNomApp)
  'iRéponse = MsgBox("Attention, l'annulation de validation d'un RA peut perturber le fonctionnement des analyses." & vbCrLf & "Prévenir impérativement le laboratoire en cas de modification des informations de l'onglet Analyse, ou en cas de suppression de RA / modification d'établissement ou de référence avant que l'analyse soit lancée." & vbCrLf & vbCrLf & _
      "Voulez-vous continuer ?", vbQuestion + vbYesNo, sNomApp)
  If iRéponse = vbNo Then Exit Sub
  
  ' On annule la validation
  cra.cEtatPH = "2"   ' Pas encore validé
  cra.hOperValPH = Null
  cra.dDateValPH = Null
  
  ' et on l'affiche (en fait inutile, on ferme…)
  txtEtatPH = cra.cEtatPH
  txtNomEtatPH = sLibelléEtatPH(cra.cEtatPH)
  txtOperValPH = ""
  txtNomValPH = ""
  txtDateValPH = ""
  
  ValideRA iTable, cra     ' C'est la même fonction qui valide et qui invalide
  
  ' et on ferme le RA, pour forcer la relecture ultérieure
  Unload Me
End Sub


' =============================================================
' Mécanisme bDirty

Public Sub SetDirty()
  If Not bModeChargement Then
    If Not bDirty Then
      bDirty = True
      Caption = sTitreFenêtre & sGetIntlLib("RAtxtDirty", " [Modifié]")
      
      cmdEnregistrer.Enabled = True
      cmdEnregistrerQuitter.Enabled = True
      tbBoutons.Buttons("Enregistrer").Enabled = True
      tbBoutons.Buttons("EnregistrerQuitter").Enabled = True
    End If
  End If
End Sub

' Affecte un numéro de FRT au RA courant, si nécessaire en le générant
Private Sub AffecteNuméroFRT()
  If iNumFRTCourante = 0 Then iNumFRTCourante = GetNumFRT
  cra.iNumFRT = iNumFRTCourante
  txtNumFRT = iNumFRTCourante
  AjouteRéférenceFRT cra.sRef
End Sub

Private Sub btnDétailFRT_Click()
  frmDétailFRT.Affiche cra.iNumFRT
End Sub

Private Sub btnNouveau_Click(Index As Integer)
  Select Case btnNouveau(Index).Tag
    Case "classedoc":   Nouveau "Définit le type d'analyse, pour permettre un pointage automatique des plannings et une facturation automatique.|Automatiquement défini à partir du critère dans la plupart des cas, sauf pour certains critères spéciaux où la classe doit être sélectionnée manuellement.|La classe CR ne doit être utilisée qu'en dernier recours, quand aucune classe ne correspond (ex: prélèvements d'atmosphère)"
    Case "prix":        Nouveau "Permet de préciser un prix spécifique d'analyse, ou 0 pour une analyse gratuite.|Laisser le champ vide pour une facturation ordinaire."
  End Select
End Sub

Private Sub chkSaisieValidée_Click()
  SetDirty
End Sub

' Récupère la liste des germes précédents
Private Sub cmdF5Analyse_Click()
  If craF5.sCritère = "" Then
    MsgBox2i "CR113"
    'MsgBox "Il n'y a pas eu d'enregistrement de RA depuis le lancement du programme, donc il n'y a pas de valeurs à récupérer.", vbExclamation, sNomApp
    Exit Sub
  End If
  
  If cra.iMode = meCréation Or cra.iMode = meModification Then
    txtCritère_KeyDown vbKeyF5, 0
    cra.hVerCrit = craF5.hVerCrit
    txtVerCrit = craF5.hVerCrit
    txtRevivification = craF5.iRevivification
    cboMMéthode_KeyDown vbKeyF5, 0
    cra.cStatusModif = craF5.cStatusModif
    chkIE = IIf(craF5.bIE, vbChecked, vbUnchecked)
    chkFax = IIf(craF5.bFax, vbChecked, vbUnchecked)
    chkCongelé = IIf(craF5.bEchCongelé, vbChecked, vbUnchecked)
    txtOptionsLabo_KeyDown vbKeyF5, 0
    txtRemarquesLabo_KeyDown vbKeyF5, 0
    txtPrixSpécifique_KeyDown vbKeyF5, 0
    bdcDevise_KeyDown vbKeyF5, 0
    txtTraitéPar_KeyDown vbKeyF5, 0
    txtDateDebAnPrévue_KeyDown vbKeyF5, 0
    Set cra.cGermes = Nothing
    If craF5.cGermes Is Nothing Then
      MsgBox2i "CR114"
      'MsgBox "Il n'y a pas de liste de germes précédente.", vbInformation, sNomApp
    Else
      Set cra.cGermes = craF5.cGermes
      
      ' On efface les résultats précédents, 5/2/2000 PV
      Dim g As GermeRecherché
      Dim b As Boîte
      For Each g In cra.cGermes
        g.SetRésultatDéfaut
        For Each b In g.cBoîtes
          b.SetBoîteVide
        Next
      Next
      
      AfficheGermes
      
      btnLireGermes.Enabled = False
      cra.iModeGermes = mgLu
      cra.iModeBoîtes = mbModifié
      AfficheModeBoîtes
      AfficheModeGermes
    End If
    bdcClasseDoc_KeyDown vbKeyF5, 0
  End If
End Sub

Private Sub cmdF5Tête_Click()
  If craF5.sCritère = "" Then
    MsgBox2i "CR113"
    'MsgBox "Il n'y a pas eu d'enregistrement de RA depuis le lancement du programme, donc il n'y a pas de valeurs à récupérer.", vbExclamation, sNomApp
    Exit Sub
  End If
  
  txtNumPro_KeyDown vbKeyF5, 0
  txtComplémentNom_KeyDown vbKeyF5, 0
  txtObs_KeyDown vbKeyF5, 0
  txtDatePrélèvement_KeyDown vbKeyF5, 0
  txtHeurePrélèvement_KeyDown vbKeyF5, 0
  txtTempératureProduit_KeyDown vbKeyF5, 0
  txtTempératureAmbiance_KeyDown vbKeyF5, 0
  txtTempératureRéception_KeyDown vbKeyF5, 0
  txtDatePréparation_KeyDown vbKeyF5, 0
  txtHeurePréparation_KeyDown vbKeyF5, 0
  txtCodeArticle_KeyDown vbKeyF5, 0
  txtCodeFamille_KeyDown vbKeyF5, 0
  txtNumlip_KeyDown vbKeyF5, 0
  txtNumCdt_KeyDown vbKeyF5, 0
  txtNumFab_KeyDown vbKeyF5, 0
  txtNumDis_KeyDown vbKeyF5, 0
  txtDateFabrication_KeyDown vbKeyF5, 0
  txtDateLivraison_KeyDown vbKeyF5, 0
  txtDateRéceptionClient_KeyDown vbKeyF5, 0
  txtDateConditionnement_KeyDown vbKeyF5, 0
  txtDateDLC_KeyDown vbKeyF5, 0
  txtDateDLUO_KeyDown vbKeyF5, 0
  txtIdLot_KeyDown vbKeyF5, 0
  txtCodeEmballeur_KeyDown vbKeyF5, 0
  txtDateRetrait_KeyDown vbKeyF5, 0
  txtDLC2_KeyDown vbKeyF5, 0
  txtCodeFamille_KeyDown vbKeyF5, 0
  txtNumcpr_KeyDown vbKeyF5, 0
  txtRefOrigine_KeyDown vbKeyF5, 0
  txtCodeFabricant_KeyDown vbKeyF5, 0
  txtOptionsEdition_KeyDown vbKeyF5, 0
  txtMarque_KeyDown vbKeyF5, 0
  txtUV_KeyDown vbKeyF5, 0
  txtDateRéception_KeyDown vbKeyF5, 0
  txtHeureRéception_KeyDown vbKeyF5, 0
  txtAspect_KeyDown vbKeyF5, 0
  txtSecteurPrél_KeyDown vbKeyF5, 0
  txtÉtatPhy_KeyDown vbKeyF5, 0
  txtIntOpér_KeyDown vbKeyF5, 0
  txtInfo1_KeyDown vbKeyF5, 0
  txtInfo2_KeyDown vbKeyF5, 0
  txtCondPrél_KeyDown vbKeyF5, 0
  txtContenant_KeyDown vbKeyF5, 0
  txtÉtatDiv_KeyDown vbKeyF5, 0
  txtNivÉlabo_KeyDown vbKeyF5, 0
  txtTechFab_KeyDown vbKeyF5, 0
  txtDLC2_KeyDown vbKeyF5, 0
  txtDateDéconditionnement_KeyDown vbKeyF5, 0
End Sub


Private Sub cmdF5Valeur_Click()
  SendKeys "{F5}"
End Sub

' ================================================================================
' Menu spécial

Private Sub cmdForcerRattachementFRTCourante_Click()
  Dim iRep As VbMsgBoxResult
  Dim sMsg As String
  sMsg = sGetIntlLib("CR116", "Question 116")
  iRep = MsgBox(sMsg, vbInformation + vbYesNo, sNomApp)
  'iRep = MsgBox("Cette commande permet de forcer le rattachement du RA actuel à la FRT courante si ce RA n'est pas déjà rattaché à une FRT, suite par exemple à une modification du champ TraitéPar." & vbCrLf & vbCrLf & "Voulez-vous continuer ?", vbInformation + vbYesNo, sNomApp)
  If iRep = vbNo Then Exit Sub
  
  If cra.iMode = meVisualisation Then
    MsgBox2i "CR117"
    'MsgBox "Modification interdite en mode visualisation !", vbInformation, sNomApp
    Exit Sub
  End If

  ' On contrôle les données et on les transfère dans la structure RA
  If Not bContrôle Then
    MsgBox2i "CR118"
    'MsgBox "Rattachement impossible tant qu'il y a des erreurs dans les données !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  If cra.iNumFRT > 0 Then
    MsgBox2i "CR119", cra.iNumFRT
    'MsgBox "Rattachement impossible ! Ce RA est déjà attaché à la FRT " & cra.iNumFRT, vbExclamation, sNomApp
    Exit Sub
  End If
  
  If bAnalyseCommencée(cra.iNumSérie) Then
    MsgBox2i "CR120", cra.iNumSérie
    'MsgBox "Rattachement impossible ! Ce RA est déjà pris en charge par le labo dans la série " & cra.iNumSérie, vbExclamation, sNomApp
    Exit Sub
  End If
  
  If cra.dDateDebAnPrévue <> Today Then
    MsgBox2i "CR121"
    'MsgBox "Rattachement impossible ! On ne peut affecter un n° de FRT que si la date de début d'analyse prévue est la date du jour !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  AffecteNuméroFRT
  SetDirty
  MsgBox2i "CR122", cra.iNumFRT
  'MsgBox "RA rattaché à la FRT " & cra.iNumFRT & vbCrLf & "La modification ne sera effective qu'après enregistrement du RA.", vbInformation, sNomApp
End Sub


Private Sub cmdEffacerNuméroFRT_Click()
  Dim iRep As VbMsgBoxResult
  Dim sMsg As String
  sMsg = sGetIntlLib("CR123", "Question 123")
  iRep = MsgBox(sMsg, vbInformation + vbYesNo, sNomApp)
  'iRep = MsgBox("Cette commande permet d'effacer le numéro de FRT, à condition que le labo n'ait pas lancé l'analyse. A n'utiliser qu'après avoir prévenu le labo !" & vbCrLf & vbCrLf & "Voulez-vous continuer ?", vbInformation + vbYesNo, sNomApp)
  If iRep = vbNo Then Exit Sub
  
  If cra.iMode = meVisualisation Then
    MsgBox2i "CR124"
    'MsgBox "Modification interdite en mode visualisation !", vbInformation, sNomApp
    Exit Sub
  End If
  
  If cra.iNumFRT <= 0 Then
    MsgBox2i "CR125"
    'MsgBox "Effacement impossible ! Ce RA n'est pas rattaché à une FRT.", vbExclamation, sNomApp
    Exit Sub
  End If
  
  If bAnalyseCommencée(cra.iNumSérie) Then
    MsgBox2i "CR126", cra.iNumSérie
    'MsgBox "Effacement impossible ! Ce RA est déjà pris en charge par le labo dans la série " & cra.iNumSérie, vbExclamation, sNomApp
    Exit Sub
  End If
  
  cra.iNumFRT = Null
  txtNumFRT = ""
  SetDirty
  MsgBox2i "CR127"
  'MsgBox "Numéro de FRT effacé." & vbCrLf & "La modification ne sera effective qu'après enregistrement du RA.", vbInformation, sNomApp
End Sub

Private Sub cmdMémoriser_Click()
  ' On mémorise les données pour le mécanisme de rappel F5
  Set craF5 = cra
End Sub

Private Sub cmdTrafiquerFRT_Click()
  If cra.iMode = meVisualisation Then
    MsgBox2i "CR128"
    'MsgBox "Modification interdite en mode visualisation !", vbInformation, sNomApp
    Exit Sub
  End If
  
  Dim sRep As String
  
  sRep = InputBox(sGetIntlLib("RAtxtTrafFRT", "Entrez le n° de FRT à appliquer pour ce RA, 0 pour effacer"), sNomApp)
  If sRep = "" Then Exit Sub
  
  If Not IsNumeric(sRep) Then
    MsgBox2i "CR129"
    'MsgBox "Ok, on a dit pas de contrôles, mais entrez au minimum une valeur numérique !!!", vbExclamation, sNomApp
    Exit Sub
  End If

  Dim iRep As Long
  iRep = Val(sRep)
  If iRep < 1 Or iRep <> Int(iRep) Then
    MsgBox2i "CR130"
    'MsgBox "Ok, on a dit pas de contrôle, mais entrez au minimum un n° de FRT correct !!!", vbExclamation, sNomApp
    Exit Sub
  End If
  
  If iRep = 0 Then
    cra.iNumFRT = Null
    txtNumFRT = ""
  Else
    cra.iNumFRT = iRep
    txtNumFRT = iRep
  End If
  SetDirty
End Sub


' ================================================================================

Private Sub cmdSuivant_Click()
  Unload Me
  
  ' On vérifie si la forme est réellement déchargée
  Dim f As Form
  For Each f In Forms
    If f Is Me Then
      ' Déchargement interrompu !
      Exit Sub
    End If
  Next
  
  ' Déchargement bien effectué
  frmRecherche.Suivant
End Sub


Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If bBlocageEnCours Or Left(Caption, 9) = sGetIntlLib("CO101", "Patientez") Then
    MsgBox2i "CR131"
    'MsgBox "Du calme ! Attendez la fin du chargement des données avant de fermer la fenêtre !", vbExclamation, sNomApp
    Cancel = 1
    Exit Sub
  End If
  
  If bDirty Then
    Dim i As VbMsgBoxResult
    Dim sMsg As String
    sMsg = sprintf(sGetIntlLib("CR132", "Question 132"), cra.sRef)
    i = MsgBox(sMsg, vbQuestion + vbYesNoCancel, sNomApp)
    'i = MsgBox("Les données du RA " & cra.sRef & " ont changé." & vbCrLf & vbCrLf & "Voulez-vous enregistrer les modifications ?", vbQuestion + vbYesNoCancel, sNomApp)
    If i = vbCancel Then
      Cancel = 1
      Exit Sub
    End If
    
    If i = vbYes Then
      If Not bPrépareEnregistrer Then
        Cancel = 1
        Exit Sub
      End If
      DoEnregistrer
    End If
  End If

  Cancel = 0
  
  ' Mise à jour du status sur la feuille d'accueil
  frmRecherche.MAJStatus cra.sRef, ""
  ' Et on libère le verrou sur la référence
  LibèreVerrou cra.sRef
End Sub



' =============================================================
' Code général de la grille

Private Sub tbBoutons_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Key
    Case "Contrôler": cmdContrôler_Click
    Case "Valider": cmdValider_Click
    Case "Enregistrer": cmdEnregistrer_Click
    Case "EnregistrerQuitter": cmdEnregistrerQuitter_Click
    Case "Quitter": Unload Me
    Case "Suivant": cmdSuivant_Click
    Case "Supprimer": cmdSupprimer_Click
    Case Else: MsgBox "tbBoutons_ButtonClick: Bouton '" & Button.Key & "' inconnu !", vbCritical, sNomApp: Stop
  End Select
End Sub

Private Sub tbBoutons_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then PopupMenu mnuBarreBoutons
End Sub

Private Sub mnuBarreBoutons_Click()
  cmdEtiquettes.Checked = bAfficherEtiquettesDeBoutons
End Sub

' L'effacement de la barre de boutons est sous-traité plus haut
Private Sub cmdBarreStandard_Click()
  frmOptions.PasDeBarreDeBoutons
  frmRecherche.DoOptionsAffichage
End Sub

Private Sub cmdEtiquettes_Click()
  frmOptions.AfficherEtiquettesDeBoutons Not cmdEtiquettes.Checked
  frmRecherche.DoOptionsAffichage
End Sub

Private Sub cmdContrôler_Click()
  bContrôle
End Sub

Private Sub cmdValider_Click()
  DoValidation
End Sub

Private Sub cmdAnnulerValidation_Click()
  DoAnnulerValidation
End Sub


Private Sub AfficheModeBoîtes()
  Select Case cra.iModeBoîtes
    Case mbNonLu:    lblModeBoîtes = sGetIntlLib("RAtxtBoîNonLu", "Boîtes non lues")
    Case mbLu:       lblModeBoîtes = sGetIntlLib("RAtxtBoîLu", "Boîtes lues, non modifiées")
    Case mbModifié:  lblModeBoîtes = sGetIntlLib("RAtxtBoîModif", "Boîtes lues et modifiées")
    Case mbProblème: lblModeBoîtes = sGetIntlLib("RAtxtBoîProb", "Problème à la lecture")
  End Select
End Sub

Private Sub AfficheModeGermes()
  Select Case cra.iModeGermes
    Case mgNonLu:    lblModeGermes = sGetIntlLib("RAtxtGerNonLu", "Germes non lus")
    Case mgLu:       lblModeGermes = sGetIntlLib("RAtxtGerLu", "Germes lus")
    Case mgModifié:  lblModeGermes = sGetIntlLib("RAtxtGermodif", "Germes lus et modifiés")
  End Select
End Sub

Private Sub AfficheStatusModif()
  txtStatusModif = NV(cra.cStatusModif)
End Sub


Private Sub DoEnregistrer()
  ' On met à jour la traçabilité de la partie haute
  ' DateSaisPH contient la date de 1ère saisie, et n'est pas mis à jour
  ' lors de modifications ultérieures (voulu, sinon après les corrections avant
  ' validation, la validation serait refusée…)
  If VarType(cra.hOperSaisPH) = vbNull Or cra.hOperSaisPH = 0 Then
    cra.hOperSaisPH = iNumOpérateur
    ' On laisse le démon affecter la date de création
    ' et on l'affiche
    txtOperSaisPH = iNumOpérateur
    txtNomSaisPH = sNomOpérateur
    txtDateSaisPH = Now
  End If
  
  ' Mise à jour de l'état
  If cra.cEtatPH = "" Or cra.cEtatPH = "1" Then
    cra.cEtatPH = "2"
  End If
  ' On affiche la mise à jour de l'état de la tête
  txtEtatPH = cra.cEtatPH
  txtNomEtatPH = sLibelléEtatPH(cra.cEtatPH)
  
  
  ' Si nécessaire, on affecte le n° de FRT
  If cra.iNumFRT = 0 And IsNull(cra.iTraitéPar) And (cra.iNumSérie = 0 Or cra.iNumSérie = -1) And (cra.dDateDebAnPrévue = Today) Then
    AffecteNuméroFRT
  End If
  
  ' Et enfin écriture du RA
  EcritRA iTable, cra
  txtCOFRAC = cra.cCofrac   ' Mis à jour lors de l'écriture
  ' Et des boîtes, si nécessaire
  If cra.iModeBoîtes = mbModifié Then
    EcritBoîtes cra
    AfficheModeBoîtes
  End If
  
  ' Pour que le démon ne corrige plus la date (il ne génère la date que si elle vaut NULL)
  cra.dDateSaisPH = Now
  
  ' On peut effacer le mode bDirty
  ' Ok méthode un peu brutale, vu le travail fait dans InitXXX
  bDirty = False
  
  If cra.iMode = meCréation Or cra.iMode = meModification Then
    InitModification
  ElseIf cra.iMode = meModificationSpéciale Then
    InitModificationSpéciale
  Else
    InitModificationRéduite
  End If
  
  ' Mise à jour du status sur la feuille d'accueil (provisoire)
  ' Le status réel sera mis à jour quand le feuille sera déchargée
  frmRecherche.MAJStatus cra.sRef, sGetIntlLib("RAtxtEnreg", "RA enregistré")
  
  ' Nouveau mécanisme pour gagner du temps
  If chkSaisieValidée Then DoValidation
End Sub


Private Sub cmdAbandonnerQuitter_Click()
  ' Identique à la fermeture Alt+F4
  Unload Me
End Sub


Private Function bPrépareEnregistrer() As Boolean
  If bBlocageEnCours Then
    MsgBox2i "CR133"
    'MsgBox "Enregistrement non disponible, attendez quelques secondes…", vbInformation, sNomApp
    bPrépareEnregistrer = False
    Exit Function
  End If
  
  If cra.iMode = meVisualisation Then
    MsgBox2i "CR134"
    'MsgBox "Pas d'enregistrement en mode visualisation !", vbInformation, sNomApp
    bPrépareEnregistrer = False
    Exit Function
  End If
  
  If Not bContrôle Then
    MsgBox2i "CR135"
    'MsgBox "Des erreurs ont été détectées lors du contrôle, l'enregistrement a été annulé.", vbInformation, sNomApp
    bPrépareEnregistrer = False
    Exit Function
  End If

  bPrépareEnregistrer = True
End Function

Private Sub cmdEnregistrerQuitter_Click()
  If Not bDirty Then
    MsgBox2i "CR136"
    'MsgBox "Le RA n'a pas été modifié, il n'y a rien à enregistrer." & vbCrLf & vbCrLf & "Dans une telle situation, pour fermer la fenêtre du RA, utilisez de préférence la case de fermeture en haut à droite, ou les touches Alt+F4 ou F3.", vbInformation, sNomApp
  End If
  
  If bPrépareEnregistrer Then
    DoEnregistrer
    Unload Me
  End If
End Sub

Private Sub cmdEnregistrer_Click()
  If bPrépareEnregistrer Then DoEnregistrer
End Sub


Private Sub cmdSupprimer_Click()
  If bBlocageEnCours Then
    MsgBox2i "CR137"
    'MsgBox "Suppression non disponible, attendez quelques secondes…", vbInformation, sNomApp
    Exit Sub
  End If
  
  If cra.iMode = meVisualisation Then
    MsgBox2i "CR138"
    'MsgBox "Suppression interdite en mode visualisation !", vbInformation, sNomApp
    Exit Sub
  End If
  
  If cra.cEtatPH > "2" Then
    MsgBox2i "CR139"
    'MsgBox "RA validé, suppression impossible !", vbInformation, sNomApp
    Exit Sub
  End If
    
  If cra.cEtatPH = "" Then
    MsgBox2i "CR140"
    'MsgBox "RA non enregistré, il n'a pas besoin d'être supprimé !" & vbCrLf & "Fermez la fenêtre pour supprimer ce RA.", vbInformation, sNomApp
    Exit Sub
  End If
  
  ' Suppression de RA saisi un autre jour: Op privilégiée spécifique à la France
  If cSystèmeCA Like "[WGPTCHRO]" Then
    If CDate(Int(cra.dDateSaisPH)) <> Today Then
      'OPCR01: Effacement d'analyse dans SCRAW (non transmis automatiquement au secrétariat)
      If Not bOkAccèsPrivilégié(txtRéférence.Text, "OPCR01") Then Exit Sub
    End If
  End If
  
  ' Garde-fou (et autres erreurs de clics…)
  Dim iRep As VbMsgBoxResult
  Dim sMsg As String
  sMsg = sprintf(sGetIntlLib("CR141", "Question 141"), cra.sRef)
  iRep = MsgBox(sMsg, vbQuestion + vbYesNo + vbDefaultButton2, sNomApp)
  'iRep = MsgBox("Êtes-vous sûr de vouloir supprimer le RA et les boîtes de la référence " & cra.sRef & " ?", vbQuestion + vbYesNo + vbDefaultButton2, sNomApp)
  If iRep = vbNo Then Exit Sub
  
  ' Suppression à proprement parler
  DétruitRA iTable, cra.sRef
  If cra.iModeBoîtes <> mbProblème Then
    DétruitBoîtes cra.sRef
  End If
  
  ' On détruit éventuellement la référence de la liste des FRT
  EnlèveRéférenceFRT cra.sRef
  
  If cra.iModeBoîtes <> mbProblème Then
    MsgBox2i "CR142", cra.sRef
    'MsgBox "Le RA " & cra.sRef & " et la liste des boîtes ont été supprimés.", vbInformation, sNomApp
  Else
    MsgBox2i "CR143", cra.sRef
    'MsgBox "Le RA " & cra.sRef & " a été supprimé, la liste des boîtes a été conservée.", vbInformation, sNomApp
  End If
  
  ' Fermeture de la fenêtre, sans sauvegarde !
  bDirty = False  ' De façon à ne pas proposer l'enregistrement après la suppression !
  cmdAbandonnerQuitter_Click
End Sub


Private Sub cmdAPropos_Click()
  frmAPropos.Show vbModal
End Sub


' =============================================================
' Menu recherche

Private Sub cmdRechConclusion_Click()
  Dim c As Conclusion
  Set c = frmRechercheConclusion.Cherche()
  If Not c Is Nothing Then
    MsgBox2i "CR144", c.con_indice, c.con_libelle
    'MsgBox "Conclusion sélectionnée " & c.con_indice & ": " & c.con_libelle, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechDate_Click()
  Dim d As String
  d = frmRechercheDate.Cherche(Today)
  If d <> "" Then
    MsgBox2i "CR145", Format(d, "dd/mm/yyyy")
    'MsgBox "Date sélectionnée: " & Format(d, "dd/mm/yyyy"), vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechDistrib_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim d As Distributeur
  Set d = frmRechercheDistributeur.Cherche()
  If Not d Is Nothing Then
    MsgBox2i "CR146", d.dis_numdis, d.dis_nom
    'MsgBox "Distributeur sélectionné " & d.dis_numdis & ": " & d.dis_nom, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechEtablissement_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim e As Etablissement, c As Collection
  Set c = frmRechercheEtablissement.Cherche2()
  Dim sMessage As String
  For Each e In c
    sMessage = sMessage & vbCrLf & e.etb_numetb & ": " & e.etb_prefixe & " " & e.etb_nom
  Next
  If sMessage <> "" Then
    MsgBox2i "CR147", sMessage
    'MsgBox "Établissement(s) sélectionné(s) :" & sMessage, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechFabricant_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim f As Fabricant
  Set f = frmRechercheFabricant.Cherche()
  If Not f Is Nothing Then
    MsgBox2i "CR148", f.fab_numfab, f.fab_nom
    'MsgBox "Fabricant sélectionné " & f.fab_numfab & ": " & f.fab_nom, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechProduit_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim p As Produit
  Set p = frmRechercheProduit.Cherche()
  If Not p Is Nothing Then
    MsgBox2i "CR149", p.pro_numpro, p.pro_nom
    'MsgBox "Produit sélectionné " & p.pro_numpro & ": " & p.pro_nom, vbInformation, sNomApp
  End If
End Sub


Private Sub cmdLibelléRA_Click(Index As Integer)
  Dim l As LibelléRA
  Set l = frmRechercheLibelléRA.Cherche(Index)
  If Not l Is Nothing Then
    MsgBox2i "CR150", l.lcr_indice, l.lcr_libelle
    'MsgBox "Libellé sélectionné " & l.lcr_indice & ": " & l.lcr_libelle, vbInformation, sNomApp
  End If
End Sub




' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

' Champs d'affichage / saisie

' =============================================================
' Utilitaires

' Public car appelé depuis frmComptage
Public Sub calendrier(cd As ChampDate)
  Dim d As String
  d = frmRechercheDate.Cherche(cd.DateSaisie)
  If d <> "" Then
    cd.DateSaisie = d
    cd.SelStart = 0
    cd.SelLength = 99
  End If
End Sub


'========================================================
' N° de produit
' Double mécanisme de recherche

Private Sub RechercheProduit()
  Dim p As Produit
  
  If txtNumPro = "-1" Then
    MsgBox2i "CR151"
    'MsgBox "Attention, la saisie d'un produit classique remplacera le produit-critère et le type actuellement saisis.", vbInformation, sNomApp
  End If
  
  Set p = frmRechercheProduit.Cherche()
  If Not p Is Nothing Then
    txtNumPro = p.pro_numpro
    txtNomPro = p.pro_nom
    If Not IsNull(p.pro_etat) Then txtNomPro = txtNomPro & " «État " & p.pro_etat & "»"
    txtCritèreInfo = p.pro_critere
  End If
End Sub

Private Sub RechercheProduitCritère()
  Dim sNomPro As String, sDéfaut As String
  
  ' Contrôle de l'option-labo Z
  If InStr(1, txtOptionsLabo, "Z") <> 0 Then
    If Not bOkAccèsPrivilégié(txtRéférence.Text, "OPCR02") Then Exit Sub
  End If
  
  If txtNumPro <> "" And txtNumPro <> "-1" Then
    MsgBox2i "CR152"
    'MsgBox "Attention, la saisie d'un produit-critère remplacera le produit actuellement saisi.", vbInformation, sNomApp
    sDéfaut = txtCritèreInfo
  Else
    sDéfaut = txtNomPro
  End If
  
  sNomPro = frmSaisieProCrit.Saisie(sDéfaut)
  If sNomPro <> "" Then
    txtNumPro = -1
    txtNomPro = sNomPro
    Dim iPosV As Integer
    iPosV = InStr(sNomPro, ",")
    If iPosV > 0 Then
      txtCritèreInfo = Left(sNomPro, iPosV - 1)
    Else
      txtCritèreInfo = sNomPro
    End If
    SetDirty        ' Au cas où le n° de produit était déjà à -1
  End If
End Sub


Private Sub txtNumPro_Change()
  txtNomPro = ""
  txtCritèreInfo = ""
  SetDirty
End Sub

Private Function bCheckNumPro(bMessage As Boolean) As Boolean
  bCheckNumPro = False
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtNumPro) Then
    bOk = False
  Else
    If txtNumPro < -1 Or txtNumPro > 100000 Or txtNumPro = 0 Then
      bOk = False
    Else
      If txtNumPro <> CStr(CLng(txtNumPro)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomPro = ""
    txtCritèreInfo = ""
    If bMessage Then
      Focus txtNumPro
      MsgBox2i "CO004", txtNumPro
      'MsgBox "Numéro de produit invalide.", vbExclamation, sNomApp
      txtNumPro.SetFocus
    End If
    Exit Function
  End If
  
  ' Cas spécial du produit -1
  ' On vérifie que la saisie du -1 n'a pas été directe,
  ' ce qui ferait qu'on n'aurait pas le critère dans le champ NomPro
  If txtNumPro = -1 Then      ' On est sûr que le champ est numérique
    Dim iPosV As Integer
    Dim sCrit As String, sType As String
    
    iPosV = InStr(txtNomPro, ",")
    If iPosV > 0 Then
      sCrit = Left(txtNomPro, iPosV - 1)
      sType = Mid(txtNomPro, iPosV + 1)
    Else
      sCrit = txtNomPro
      sType = ""
    End If
    
    If sCrit = "" Then
      If bMessage Then
        Focus txtNumPro
        MsgBox2i "CR154"
        'MsgBox "Numéro de produit invalide." & vbCrLf & _
          "La saisie du n° -1 ne peut pas être effectuée directement, il faut passer par la boîte de dialogue de saisie d'un produit-critère, accessible avec Maj+F4.", vbExclamation, sNomApp
      End If
      Exit Function
    End If
    
    ' Ok, on met à jour la structure de données
    cra.iPro = -1
    cra.sNomPro = txtNomPro
    cra.sCritèreInfo = sCrit

    If sType = "" Then
      sType = "4.20.1.1.10"
      txtNomPro = sCrit & ", " & sType
      cra.sNomPro = txtNomPro
      cra.t1 = 4
      cra.t2 = 20
      cra.t3 = 1
      cra.t4 = 1
      cra.t5 = 10
    Else
      Dim pp As Integer
      pp = InStr(sType, "."): Mid(sType, pp, 1) = ":": cra.t1 = Val(sType): sType = Mid(sType, pp + 1)
      pp = InStr(sType, "."): Mid(sType, pp, 1) = ":": cra.t2 = Val(sType): sType = Mid(sType, pp + 1)
      pp = InStr(sType, "."): Mid(sType, pp, 1) = ":": cra.t3 = Val(sType): sType = Mid(sType, pp + 1)
      pp = InStr(sType, "."): Mid(sType, pp, 1) = ":": cra.t4 = Val(sType): sType = Mid(sType, pp + 1)
      cra.t5 = Val(sType)
    End If
  
  Else  ' N° de produit classique
  
    Dim p As Produit
    Set p = LireProduit(txtNumPro)
    If p Is Nothing Then
      txtNomPro = ""
      txtCritèreInfo = ""
      If bMessage Then
        Focus txtNumPro
        MsgBox2i "CO005", txtNumPro
        'MsgBox "Produit inexistant.", vbExclamation, sNomApp
      End If
      Exit Function
    End If
    
    If p.pro_etat = "S" Or p.pro_etat = "Z" Then
      txtNomPro = ""
      txtCritèreInfo = ""
      If bMessage Then
        Focus txtNumPro
        MsgBox2i "CR156", p.pro_numpro, p.pro_nom
        'MsgBox "Produit supprimé." & vbCrLf & vbCrLf & "Le produit " & p.pro_numpro & ": " & p.pro_nom & " est à l'état supprimé dans le fichier produit, il ne peut pas être utilisé." & vbCrLf & vbCrLf & "Choisissez un autre produit.", vbExclamation, sNomApp
      End If
      Exit Function
    End If
    
    ' Ok, on met à jour les contrôles associés
    ' Pas de mise à jour pour les saisies antérieures au 3/7/2000
    If txtNomPro = "" Or cra.dDateTour >= #7/3/2000# Then
      txtNomPro = p.pro_nom
      If Not IsNull(p.pro_etat) And Not txtNumPro.Locked Then
        txtNomPro = sprintf(sGetIntlLib("RAtxtEtatP", "%1 «État %2»"), txtNomPro, p.pro_etat)
      End If
    End If
    If txtCritèreInfo = "" Or cra.dDateTour >= #7/3/2000# Then
      txtCritèreInfo = p.pro_critere
    End If
    
    ' et la structure de données
    cra.iPro = CLng(txtNumPro)
    cra.sNomPro = p.pro_nom
    cra.sCritèreInfo = p.pro_critere
    cra.t1 = p.pro_t1
    cra.t2 = p.pro_t2
    cra.t3 = p.pro_t3
    cra.t4 = p.pro_t4
    cra.t5 = p.pro_t5
    
    ' Traçabilité éventuelle
'    If bShiftPressed Then
'      MsgBox "Trace produit" & vbCrLf & vbCrLf & _
'        "pro_numpro: " & p.pro_numpro & vbCrLf & _
'        "pro_nom: " & p.pro_nom & vbCrLf & _
'        "pro_critere: " & p.pro_critere & vbCrLf & _
'        "pro_t1: " & p.pro_t1 & vbCrLf & _
'        "pro_t2: " & p.pro_t2 & vbCrLf & _
'        "pro_t3: " & p.pro_t3 & vbCrLf & _
'        "pro_t4: " & p.pro_t4 & vbCrLf & _
'        "pro_t5: " & p.pro_t5, vbInformation, sNomApp
'    End If
  End If
  
  ' Pour simplifier la saisie…
  If cra.t1 = 4 And txtSecteurPrél = "" And (cra.iMode = meCréation Or cra.iMode = meModification) Then
    txtSecteurPrél = "4"
    bCheckSecteurPrélèvement False
  End If

  bCheckNumPro = True
End Function

Private Sub txtNumPro_GotFocus()
  AutoSelect txtNumPro
  SetLib sbStatus, "SimpleText", "CPtxtNumPro.tag"
  'sbStatus.SimpleText = "Entrez le numéro du produit, F4 pour une recherche produit, Maj+F4 pour une recherche critère."
End Sub

Private Sub txtNumPro_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc("%") Then
    KeyAscii = 0
    frmAssistantCodeBarre.AssistantCodeBarre Me
  End If
End Sub

Private Sub txtNumPro_LostFocus()
  If bBlocageEnCours Then
    ActionSuivante Me, "txtNumPro_LostFocus"
    Exit Sub
  End If

  If bCheckNumPro(False) Or txtNumPro = "" Then
    txtNumPro.ForeColor = &H80000008
  Else
    txtNumPro.ForeColor = &HFF&
  End If
End Sub

Private Sub txtNumPro_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtNumPro.Locked = False Then RechercheProduit
  If KeyCode = vbKeyF4 And Shift = 1 And txtNumPro.Locked = False Then RechercheProduitCritère
  If KeyCode = vbKeyF5 And Shift = 0 And txtNumPro.Locked = False Then
    txtNumPro = craF5.iPro
    txtNomPro = craF5.sNomPro
    txtCritèreInfo = craF5.sCritèreInfo
  End If
End Sub

Private Sub txtNumPro_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  iShift = Shift
End Sub

Private Sub txtNumPro_DblClick()
  txtNumPro_KeyDown vbKeyF4, iShift
End Sub


' ===============================================================
' Complément du nom

Private Sub txtComplémentNom_GotFocus()
  AutoSelect txtComplémentNom
  SetLib sbStatus, "SimpleText", "CPtxtCompNom.tag"
  'sbStatus.SimpleText = "Libellé complémentaire à droite du nom de produit. S'il commence par !, le nom du produit est masqué."
End Sub

Private Sub txtComplémentNom_LostFocus()
  If bBlocageEnCours Then
    ActionSuivante Me, "txtComplémentNom_LostFocus"
    Exit Sub
  End If
  
  bCheckComplémentNom False
End Sub

Private Sub txtComplémentNom_Change()
  Static bBlanc1 As Boolean, bBlanc2 As Boolean
  
  ' Réinitialisation du mécanisme
  If txtComplémentNom = "" Then
    bBlanc1 = False
    bBlanc2 = False
  End If

  ' Mécanisme pour faire suivre un / ou un ! d'un espace…
  If (txtComplémentNom = "/" Or txtComplémentNom = "!") And bBlanc1 = False Then
    txtComplémentNom = txtComplémentNom & " "
    txtComplémentNom.SelStart = 99
    bBlanc1 = True
  End If
  
  ' Et juste d'un seul !
  If (txtComplémentNom = "/  " Or txtComplémentNom = "!  ") And bBlanc2 = False Then
    txtComplémentNom = Left(txtComplémentNom, 2)
    txtComplémentNom.SelStart = 99
    bBlanc2 = True
  End If

  If Left(txtComplémentNom, 1) = "!" Then
    txtComplémentNom.MaxLength = 60
  Else
    txtComplémentNom.MaxLength = 70 - Len(txtNomPro)
    If txtComplémentNom.MaxLength > 60 Then txtComplémentNom.MaxLength = 60
  End If
  SetDirty
End Sub

Private Function bCheckComplémentNom(bMessage As Boolean) As Boolean
  bCheckComplémentNom = False
  
  If Left(txtNomPro, 1) <> "!" And Left(txtComplémentNom, 1) <> "!" And Len(txtComplémentNom) + Len(txtNomPro) > 70 Then
    If bMessage Then
      Focus txtComplémentNom
      MsgBox2i "CR157"
      'MsgBox "Complément de nom trop long.", vbExclamation, sNomApp
    End If
    Exit Function
  End If
  
  ' Orthographe
  sOrthComplémentNom = sOrthographe(txtComplémentNom)
  lblOrthographe = sOrthComplémentNom & " " & sOrthObs
  
  ' Mise à jour de la structure de données
  cra.sCplNom = txtComplémentNom
  
  bCheckComplémentNom = True
End Function

Private Sub txtComplémentNom_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtNumPro.Locked = False Then txtComplémentNom = craF5.sCplNom
End Sub


' ===============================================================
' Observations

Private Sub txtObs_GotFocus()
  AutoSelect txtObs
  SetLib sbStatus, "SimpleText", "CPtxtObs.tag"
  'sbStatus.SimpleText = "Entrez le libellé qui doit apparaître sur la ligne sous le nom de produit."
End Sub

Private Sub txtObs_LostFocus()
  If bBlocageEnCours Then
    ActionSuivante Me, "txtObs_LostFocus"
    Exit Sub
  End If
  
  bCheckObs False
End Sub

Private Function bCheckObs(bMessage As Boolean) As Boolean
  ' Orthographe
  sOrthObs = sOrthographe(txtObs)
  lblOrthographe = sOrthComplémentNom & " " & sOrthObs
  
  ' On vérifie qu'il n'y a pas plus de 2 |, sinon message d'avertissement
  Dim p As Integer
  Dim nbBarre As Integer
  p = 0
  nbBarre = 0
  Do
    p = InStr(p + 1, txtObs.Text, "|")
    If p = 0 Then Exit Do
    nbBarre = nbBarre + 1
  Loop
  If nbBarre > 2 Then
    If bMessage Then
      Focus txtObs
      ' Avertissement: Il y a plus de deux retours à la ligne forcés dans les interventions. L'impression définitve risque d'être incorrecte, en particulier si l'analyse concerne beaucoup de paramètres.
      MsgBox2i "CR333"
    End If
  End If

  ' Mise à jour de la structure de données
  cra.sObs = txtObs
  
  bCheckObs = True
End Function

Private Sub txtObs_Change()
  SetDirty
End Sub

Private Sub txtObs_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtNumPro.Locked = False Then txtObs = craF5.sObs
End Sub


' ===============================================================
' Date de prélèvement

Private Function bCheckDate(ByVal sPage As String, d As ChampDate, ByRef vDate As Variant, ByVal sLibellé As String, ByVal bMessage As Boolean) As Boolean
  
  If d.DateSaisie <> "" Then
    If Not IsDate(d.DateSaisie) Then
      If bMessage Then
        bCheckDate = False
        Focus d, sPage
        MsgBox2i "CO004", sLibellé
        'MsgBox sLibellé & " invalide.", vbExclamation, sNomApp
      End If
      Exit Function
    End If
  End If
  
  ' Mise à jour de la structure de données
  vDate = DVN(d.DateSaisie)
  
  bCheckDate = True
End Function


Private Sub txtDatePrélèvement_GotFocus()
  AutoSelect txtDatePrélèvement
  SetLib sbStatus, "SimpleText", "RAtxtDP.tag"
  'sbStatus.SimpleText = "Entrez la date de prélèvement, F4 pour le calendrier."
  End Sub

Private Sub txtDatePrélèvement_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDatePrélèvement.Locked = False Then calendrier txtDatePrélèvement
  If KeyCode = vbKeyF5 And Shift = 0 And txtDatePrélèvement.Locked = False Then txtDatePrélèvement.DateSaisie = craF5.dDatePrél
End Sub

Private Sub txtDatePrélèvement_DblClick()
  If Not txtDatePrélèvement.Locked Then calendrier txtDatePrélèvement
End Sub

Private Function bCheckDatePrélèvement(bMessage As Boolean) As Boolean
  If txtDatePrélèvement.DateSaisie = "" Then
    If bMessage Then
      Focus txtDatePrélèvement
      MsgBox2i "CR159"
      'MsgBox "La date de prélèvement est obligatoire.", vbExclamation, sNomApp
    End If
    bCheckDatePrélèvement = False
    Exit Function
  End If

  Dim d
  bCheckDatePrélèvement = bCheckDate("Tête", txtDatePrélèvement, d, "Date de prélèvement", bMessage)
  If IsEmpty(d) Then Exit Function      ' Date invalide
  
  If d = dAbsence Then
    If bMessage Then
      Focus txtDatePrélèvement
      MsgBox2i "CO004", txtDatePrélèvement
      'MsgBox "Date de prélèvement invalide.", vbExclamation, sNomApp
      txtDatePrélèvement.SetFocus
    End If
    bCheckDatePrélèvement = False
    Exit Function
  End If
  
  ' On vérifie si les autres échantillons ont été prélevés à la même date
  ContrôleDDP cra.sRef, d
  
  ' On vérifie si l'établissement n'est pas planifié le même jour sous une autre référence
  ContrôleEtablissementMêmeJour cra.sEtb, d, Left(cra.sRef, Len(cra.sRef) - 2)
  
  cra.dDatePrél = d
End Function

Private Sub txtDatePrélèvement_Change()
  SetDirty
End Sub


' ===============================================================
' Heure de prélèvement

Private Sub txtHeurePrélèvement_GotFocus()
  AutoSelect txtHeurePrélèvement
  SetLib sbStatus, "SimpleText", "RAtxtHP.tag"
  'sbStatus.SimpleText = "Entrez l'heure de prélèvement."
End Sub

Private Function bCheckHeurePrélèvement(bMessage As Boolean) As Boolean
  If txtHeurePrélèvement.HeureSaisie = "ERR" Then
    If bMessage Then
      bCheckHeurePrélèvement = False
      Focus txtHeurePrélèvement
      MsgBox2i "CO004", txtHeurePrélèvement
      'MsgBox "Heure de prélèvement invalide.", vbExclamation, sNomApp
      txtHeurePrélèvement.SetFocus
    End If
    Exit Function
  End If
  
  ' Mise à jour de la structure de données
  cra.hHeurePrél = VN(txtHeurePrélèvement.HeureSaisie)
  
  ' Tests de vraisemblance
  If IsNumeric(cra.hHeurePrél) Then
    If cra.hHeurePrél < 600 Or cra.hHeurePrél > 2000 Then
      If bMessage Then
        MsgBox2i "CR162"
        'MsgBox "Avertissement: Prélèvement avant 6:00 ou après 20:00. Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
      End If
    End If
  End If
  
  bCheckHeurePrélèvement = True
End Function

Private Sub txtHeurePrélèvement_Change()
  SetDirty
End Sub

Private Sub txtHeurePrélèvement_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtHeurePrélèvement.Locked = False Then txtHeurePrélèvement.HeureSaisie = craF5.hHeurePrél
End Sub


' ===============================================================
' Température produit

Private Function bCheckTempérature(t As ChampTempérature, dTemp As Variant, ByVal sLibellé As String, ByVal bMessage As Boolean) As Boolean
  If t.Température <> "" Then
    If Not IsNumeric(t.Température) Then
      If bMessage Then
        bCheckTempérature = False
        Focus t
        MsgBox2i "CR163", sLibellé
        'MsgBox "Température " & sLibellé & " invalide.", vbExclamation, sNomApp
      End If
      Exit Function
    End If
  End If
  
  ' Mise à jour de la structure de données
  If t.Température = "" Then
    dTemp = Null
  Else
    dTemp = CSng(t.Température)
  End If
  
  bCheckTempérature = True
End Function

Private Sub txtTempératureProduit_GotFocus()
  AutoSelect txtTempératureProduit
  SetLib sbStatus, "SimpleText", "RAtxtTP.tag"
  'sbStatus.SimpleText = "Entrez la température du produit."
End Sub

Private Function bCheckTempératureProduit(bMessage As Boolean) As Boolean
  Dim t
  bCheckTempératureProduit = bCheckTempérature(txtTempératureProduit, t, "produit", bMessage)
  cra.dTemp = t
End Function

Private Sub txtTempératureProduit_Change()
  SetDirty
End Sub

Private Sub txtTempératureProduit_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtTempératureProduit.Locked = False Then txtTempératureProduit.Température = craF5.dTemp
  If KeyCode = vbKeyF4 And Shift = 1 And txtTempératureProduit.Locked = True And (cra.iMode = meModificationRéduite Or cra.iMode = meModificationSpéciale) Then
    Dim t
    t = InputBox(sGetIntlLib("RAtxtTP", "ATTENTION - Modification de la température en mode saisie restreinte" & vbCrLf & vbCrLf & _
      "Cette opération est sous votre responsabilité. Assurez-vous auprès du laboratoire que la modification n'a pas d'influence sur l'analyse." & vbCrLf & vbCrLf & _
      "Nouvelle température, ou + pour effacer ?"), sNomApp, txtTempératureProduit.Température)
    't = InputBox("ATTENTION - Modification de la température en mode saisie restreinte" & vbCrLf & vbCrLf & _
      "Cette opération est sous votre responsabilité. Assurez-vous auprès du laboratoire que la modification n'a pas d'influence sur l'analyse." & vbCrLf & vbCrLf & _
      "Nouvelle température, ou + pour effacer ?", sNomApp, txtTempératureProduit.Température)
    If t = "" Then Exit Sub
    Dim p As Integer
    p = InStr(t, ".")
    If p <> 0 Then Mid(t, p, 1) = ","
    If t = "+" Then t = ""
    txtTempératureProduit.Température = t
    txtTempératureProduit.SelStart = 0
    txtTempératureProduit.SelLength = 99
  End If
End Sub


' ===============================================================
' Température ambiance

Private Sub txtTempératureAmbiance_GotFocus()
  AutoSelect txtTempératureAmbiance
  SetLib sbStatus, "SimpleText", "RAtxtTA.tag"
  'sbStatus.SimpleText = "Entrez la température d'ambiance."
End Sub

Private Function bCheckTempératureAmbiance(bMessage As Boolean) As Boolean
  Dim t
  bCheckTempératureAmbiance = bCheckTempérature(txtTempératureAmbiance, t, "ambiance", bMessage)
  cra.dTamb = t
End Function

Private Sub txtTempératureAmbiance_Change()
  SetDirty
End Sub

Private Sub txtTempératureAmbiance_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtTempératureAmbiance.Locked = False Then txtTempératureAmbiance.Température = craF5.dTamb
End Sub


' ===============================================================
' Température à réception

Private Sub txtTempératureRéception_GotFocus()
  AutoSelect txtTempératureRéception
  SetLib sbStatus, "SimpleText", "RAtxtTR.tag"
  'sbStatus.SimpleText = "Entrez la température de l'échantillon à réception."
End Sub

Private Function bCheckTempératureRéception(bMessage As Boolean) As Boolean
  Dim t
  bCheckTempératureRéception = bCheckTempérature(txtTempératureRéception, t, "réception", bMessage)
  cra.dTrec = t
End Function

Private Sub txtTempératureRéception_Change()
  SetDirty
End Sub

Private Sub txtTempératureRéception_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtTempératureRéception.Locked = False Then txtTempératureRéception.Température = craF5.dTrec
End Sub


' ===============================================================
' Date de préparation

Private Sub txtDatePréparation_GotFocus()
  AutoSelect txtDatePréparation
  SetLib sbStatus, "SimpleText", "RAtxtDPp.tag"
  'sbStatus.SimpleText = "Entrez la date de préparation, F4 pour le calendrier."
End Sub

Private Sub txtDatePréparation_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDatePréparation.Locked = False Then calendrier txtDatePréparation
If KeyCode = vbKeyF5 And Shift = 0 And txtDatePréparation.Locked = False Then txtDatePréparation.DateSaisie = craF5.dDatePrép
End Sub

Private Sub txtDatePréparation_DblClick()
  If Not txtDatePréparation.Locked Then calendrier txtDatePréparation
End Sub

Private Function bCheckDatePréparation(bMessage As Boolean) As Boolean
  Dim d
  d = cra.dDatePrép
  bCheckDatePréparation = bCheckDate("Tête", txtDatePréparation, d, "Date de préparation", bMessage)
  cra.dDatePrép = d
End Function

Private Sub txtDatePréparation_Change()
  SetDirty
End Sub


' ===============================================================
' Heure de Préparation

Private Sub txtHeurePréparation_GotFocus()
  AutoSelect txtHeurePréparation
  SetLib sbStatus, "SimpleText", "RAtxtHPp.tag"
  'sbStatus.SimpleText = "Entrez l'heure de préparation."
End Sub

Private Function bCheckHeurePréparation(bMessage As Boolean) As Boolean
  If txtHeurePréparation.HeureSaisie = "ERR" Then
    If bMessage Then
      bCheckHeurePréparation = False
      Focus txtHeurePréparation
      MsgBox2i "CO004", txtHeurePréparation.HeureSaisie
      'MsgBox "Heure de préparation invalide.", vbExclamation, sNomApp
      txtHeurePréparation.SetFocus
    End If
    Exit Function
  End If
  
  ' Mise à jour de la structure de données
  cra.hHeurePrép = VN(txtHeurePréparation.HeureSaisie)
  
  ' Tests de vraisemblance
  If IsNumeric(cra.hHeurePrép) Then
    If cra.hHeurePrép < 600 Or cra.hHeurePrép > 2000 Then
      If bMessage Then
        MsgBox2i "CR165"
        'MsgBox "Avertissement: Préparation avant 6:00 ou après 20:00. Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
      End If
    End If
  End If
  
  bCheckHeurePréparation = True
End Function

Private Sub txtHeurePréparation_Change()
  SetDirty
End Sub

Private Sub txtHeurePréparation_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtHeurePréparation.Locked = False Then txtHeurePréparation.HeureSaisie = craF5.hHeurePrép
End Sub


' ===============================================================
' Code article

Private Sub txtCodeArticle_GotFocus()
  AutoSelect txtCodeArticle
  SetLib sbStatus, "SimpleText", "RAtxtCA.tag"
  'sbStatus.SimpleText = "Entrez le code article."
End Sub

Private Function bCheckCodeArticle(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.sCodeArt = txtCodeArticle
  
  bCheckCodeArticle = True
End Function

Private Sub txtCodeArticle_Change()
  SetDirty
End Sub

Private Sub txtCodeArticle_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtCodeArticle.Locked = False Then txtCodeArticle = craF5.sCodeArt
End Sub


' ===============================================================
' Code famille

Private Sub txtCodeFamille_GotFocus()
  AutoSelect txtCodeFamille
  SetLib sbStatus, "SimpleText", "RAtxtCF.tag"
  'sbStatus.SimpleText = "Entrez le code famille."
End Sub

Private Function bCheckCodeFamille(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.sCodeFamille = txtCodeFamille
  
  bCheckCodeFamille = True
End Function

Private Sub txtCodeFamille_Change()
  SetDirty
End Sub

Private Sub txtCodeFamille_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtCodeFamille.Locked = False Then txtCodeFamille = craF5.sCodeFamille
End Sub


' ===============================================================
' N° de lieu de prélèvement (conditions de prélèvement)

Private Sub RechercheLieuDePrélèvement()
  Dim p As LibelléRA
  Set p = frmRechercheLibelléRA.Cherche(rLieuPrélèvement)
  If Not p Is Nothing Then
    txtNumLip = p.lcr_indice
    txtNomLip = p.lcr_libelle
  End If
End Sub

Private Sub txtNumlip_Change()
  txtNomLip = ""
  SetDirty
End Sub

Private Function bCheckLieuDePrélèvement(bMessage As Boolean) As Boolean
  If txtNumLip = "" Then
    cra.hLieuPrél = Null
    bCheckLieuDePrélèvement = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtNumLip) Then
    bOk = False
  Else
    If txtNumLip < 1 Or txtNumLip > 1000 Then
      bOk = False
    Else
      If txtNumLip <> CStr(CInt(txtNumLip)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomLip = ""
    If bMessage Then
      Focus txtNumLip
      MsgBox2i "CO004", txtNumLip
      'MsgBox "Numéro de lieu de prélèvement invalide.", vbExclamation, sNomApp
      txtNumLip.SetFocus
    End If
    bCheckLieuDePrélèvement = False
    Exit Function
  End If
  
  Dim p As LibelléRA
  Set p = LireLibelléRA(rLieuPrélèvement, txtNumLip)
  If p Is Nothing Then
    txtNomLip = ""
    If bMessage Then
      Focus txtNumLip
      MsgBox2i "CO005", txtNumLip
      'MsgBox "Lieu de prélèvement inexistant.", vbExclamation, sNomApp
      txtNumLip.SetFocus
    End If
    bCheckLieuDePrélèvement = False
    Exit Function
  End If
  
  If Not bContrôleVieuxLibellé(txtNumLip, "lieu de prélèvement", p.lcr_libelle, bMessage) Then
    bCheckLieuDePrélèvement = False
    Exit Function
  End If
  
  
  ' Mise à jour de la structure de données
  cra.hLieuPrél = VN(txtNumLip)
  
  ' Petit avertissement…
  If cra.hLieuPrél = 1 Then
    MsgBox2i "CR169"
    'MsgBox "Avertissement: Il est inutile de saisir le lieu de prélèvement 1, il est conseillé de laisser le champ vide dans ce cas.", vbInformation, sNomApp
  End If

  txtNomLip = p.lcr_libelle
  bCheckLieuDePrélèvement = True
End Function

Private Sub txtNumlip_GotFocus()
  AutoSelect txtNumLip
  SetLib sbStatus, "SimpleText", "RAtxtLip.tag"
  'sbStatus.SimpleText = "Entrez le numéro du lieu de prélèvement (conditions de prélèvement), F4 pour une recherche."
End Sub

Private Sub txtNumlip_LostFocus()
  If bCheckLieuDePrélèvement(False) Or txtNumLip = "" Then
    txtNumLip.ForeColor = &H80000008
  Else
    txtNumLip.ForeColor = &HFF&
  End If
End Sub

Private Sub txtNumlip_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtNumLip.Locked = False Then RechercheLieuDePrélèvement
  If KeyCode = vbKeyF5 And Shift = 0 And txtNumLip.Locked = False Then txtNumLip = NV(craF5.hLieuPrél)
End Sub

Private Sub txtNumlip_DblClick()
  txtNumlip_KeyDown vbKeyF4, iShift
End Sub


' ===============================================================
' N° de Conditionnement

Private Sub RechercheConditionnement()
  Dim p As LibelléRA
  Set p = frmRechercheLibelléRA.Cherche(rModeConditionnement)
  If Not p Is Nothing Then
    txtNumCdt = p.lcr_indice
    txtNomCdt = p.lcr_libelle
  End If
End Sub

Private Sub txtNumcdt_Change()
  txtNomCdt = ""
  SetDirty
End Sub

Private Function bCheckConditionnement(bMessage As Boolean) As Boolean
  If txtNumCdt = "" Then
    cra.hCondit = Null
    bCheckConditionnement = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtNumCdt) Then
    bOk = False
  Else
    If txtNumCdt < 1 Or txtNumCdt > 1000 Then
      bOk = False
    Else
      If txtNumCdt <> CStr(CInt(txtNumCdt)) Then bOk = False
    End If
  End If

  If Not bOk Then
    txtNomCdt = ""
    If bMessage Then
      Focus txtNumCdt
      MsgBox2i "CO004", txtNumCdt
      'MsgBox "Numéro de conditionnement invalide.", vbExclamation, sNomApp
      txtNumCdt.SetFocus
    End If
    bCheckConditionnement = False
    Exit Function
  End If
  
  Dim p As LibelléRA
  Set p = LireLibelléRA(rModeConditionnement, txtNumCdt)
  If p Is Nothing Then
    txtNomCdt = ""
    If bMessage Then
      Focus txtNumCdt
      MsgBox2i "CO005", txtNumCdt
      'MsgBox "Conditionnement inexistant.", vbExclamation, sNomApp
      txtNumCdt.SetFocus
    End If
    bCheckConditionnement = False
    Exit Function
  End If

  If Not bContrôleVieuxLibellé(txtNumCdt, "conditionnement", p.lcr_libelle, bMessage) Then
    bCheckConditionnement = False
    Exit Function
  End If


  ' Mise à jour de la structure de données
  cra.hCondit = VN(txtNumCdt)

  ' Petit avertissement…
  If cra.hCondit = 1 Then
    MsgBox2i "CR172"
    'MsgBox "Avertissement: Il est inutile de saisir le n° de conditionnement 1, il est conseillé de laisser le champ vide dans ce cas.", vbInformation, sNomApp
  End If

  txtNomCdt = p.lcr_libelle
  bCheckConditionnement = True
End Function

Private Sub txtNumCdt_GotFocus()
  AutoSelect txtNumCdt
  SetLib sbStatus, "SimpleText", "RAtxtCdt.tag"
  'sbStatus.SimpleText = "Entrez le numéro du conditionnement, F4 pour une recherche."
End Sub

Private Sub txtNumCdt_LostFocus()
  If bCheckConditionnement(False) Or txtNumCdt = "" Then
    txtNumCdt.ForeColor = &H80000008
  Else
    txtNumCdt.ForeColor = &HFF&
  End If
End Sub

Private Sub txtNumCdt_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtNumCdt.Locked = False Then RechercheConditionnement
  If KeyCode = vbKeyF5 And Shift = 0 And txtNumCdt.Locked = False Then txtNumCdt = NV(craF5.hCondit)
End Sub

Private Sub txtNumCdt_DblClick()
  txtNumCdt_KeyDown vbKeyF4, iShift
End Sub


' ===============================================================
' N° de fabricant

Private Sub RechercheFabricant()
  If txtNumFab = "-1" Then
    MsgBox2i "CR173"
    'MsgBox "Attention, la saisie d'un fabricant fichier remplacera le fabricant libre actuellement saisi.", vbInformation, sNomApp
  End If
  
  Dim p As Fabricant
  Set p = frmRechercheFabricant.Cherche()
  If Not p Is Nothing Then
    txtNumFab = p.fab_numfab
    txtNomFab = p.fab_nom
  End If
End Sub

Private Sub SaisieFabricantLibre()
  If IsNumeric(txtNumFab) And txtNumFab <> "-1" Then
    MsgBox2i "CR174"
    'MsgBox "Attention, la saisie d'un fabricant libre remplacera le fabricant du fichier actuellement saisi.", vbInformation, sNomApp
  End If
  
  Dim sNomFab As String
  sNomFab = InputBox(sGetIntlLib("RAtxtSaiFab", "Saisie libre d'un fabricant" & vbCrLf & vbCrLf & "Entrez le nom du fabricant"), sNomApp, txtNomFab)
  If sNomFab <> "" Then
    txtNumFab = -1
    txtNomFab = sNomFab
    SetDirty        ' Au cas où le n° était déjà à -1
  End If
End Sub

Private Sub txtNumFab_Change()
  txtNomFab = ""
  SetDirty
End Sub

Private Function bCheckFabricant(bMessage As Boolean) As Boolean
  ' Cas vide
  If txtNumFab = "" Then
    cra.iFab = Null
    cra.sNomFab = Null      ' Mis à jour le 1/12/1997
    bCheckFabricant = True
    Exit Function
  End If

  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtNumFab) Then
    bOk = False
  Else
    If txtNumFab < -1 Or txtNumFab > 100000 Or txtNumFab = 0 Then
      bOk = False
    Else
      If txtNumFab <> CStr(CLng(txtNumFab)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomFab = ""
    If bMessage Then
      Focus txtNumFab
      MsgBox2i "CO004", txtNumFab
      'MsgBox "Numéro de fabricant invalide.", vbExclamation, sNomApp
      txtNumFab.SetFocus
    End If
    bCheckFabricant = False
    Exit Function
  End If
  
  ' Cas spécial du n° -1
  If txtNumFab = -1 Then
    ' Fabricant libre
    If txtNomFab = "" Then
      MsgBox2i "CR176"
      'MsgBox "Numéro de fabricant invalide." & vbCrLf & _
          "La saisie du n° -1 ne peut pas être effectuée directement, il faut passer par la boîte de saisie d'un fabricant libre, accessible avec Maj+F4.", vbExclamation, sNomApp
      bCheckFabricant = False
      Exit Function
    End If
    
    ' Mise à jour de la structure de données
    cra.iFab = -1
    cra.sNomFab = txtNomFab
  Else  ' Fabricant du fichier
  
    Dim p As Fabricant
    Set p = LireFabricant(txtNumFab)
    If p Is Nothing Then
      txtNomFab = ""
      If bMessage Then
        Focus txtNumFab
        MsgBox2i "CO005", txtNumFab
        'MsgBox "Fabricant inexistant.", vbExclamation, sNomApp
        txtNumFab.SetFocus
      End If
      bCheckFabricant = False
      Exit Function
    End If
    
    If p.fab_etat = "S" Then
      txtNomFab = ""
      If bMessage Then
        Focus txtNumFab
        MsgBox2i "CR178", p.fab_numfab, p.fab_nom
        'MsgBox "Fabricant supprimé." & vbCrLf & vbCrLf & "Le fabricant " & p.fab_numfab & ": " & p.fab_nom & " est à l'état supprimé dans le fichier fabricant, il ne peut pas être utilisé. Choisissez un autre fabricant.", vbExclamation, sNomApp
      End If
      Exit Function
    End If
    
    ' Mise à jour de la structure de données
    cra.iFab = VN(txtNumFab)
    cra.sNomFab = p.fab_nom
    txtNomFab = p.fab_nom
  End If

  bCheckFabricant = True
End Function

Private Sub txtNumFab_GotFocus()
  AutoSelect txtNumFab
  SetLib sbStatus, "SimpleText", "RAtxtFab.tag"
  'sbStatus.SimpleText = "Entrez le numéro du fabricant, F4 pour une recherche, Maj+F4 pour une saisie libre."
End Sub

Private Sub txtNumFab_LostFocus()
  If bBlocageEnCours Then
    ActionSuivante Me, "txtNumFab_LostFocus"
    Exit Sub
  End If

  If bCheckFabricant(False) Or txtNumFab = "" Then
    txtNumFab.ForeColor = &H80000008
  Else
    txtNumFab.ForeColor = &HFF&
  End If
End Sub


Private Sub txtNumFab_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtNumFab.Locked = False Then RechercheFabricant
  If KeyCode = vbKeyF4 And Shift = 1 And txtNumFab.Locked = False Then SaisieFabricantLibre
  If KeyCode = vbKeyF5 And Shift = 0 And txtNumFab.Locked = False Then
    txtNumFab = NV(craF5.iFab)
    txtNomFab = NV(craF5.sNomFab)
  End If
End Sub

Private Sub txtNumFab_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  iShift = Shift
End Sub

Private Sub txtNumFab_DblClick()
  txtNumFab_KeyDown vbKeyF4, iShift
End Sub


' ===============================================================
' N° de Distributeur

Private Sub RechercheDistributeur()
  If txtNumDis = "-1" Then
    MsgBox2i "CR179"
    'MsgBox "Attention, la saisie d'un distributeur fichier remplacera le distributeur libre actuellement saisi.", vbInformation, sNomApp
  End If
  
  Dim p As Distributeur
  Set p = frmRechercheDistributeur.Cherche()
  If Not p Is Nothing Then
    txtNumDis = p.dis_numdis
    txtNomDis = p.dis_nom
  End If
End Sub

Private Sub SaisieDistributeurLibre()
  If IsNumeric(txtNumDis) And txtNumDis <> "-1" Then
    MsgBox2i "CR180"
    'MsgBox "Attention, la saisie d'un distributeur libre remplacera le distributeur du fichier actuellement saisi.", vbInformation, sNomApp
  End If
  
  Dim sNomDis As String
  sNomDis = InputBox(sGetIntlLib("RAtxtSaiDis", "Saisie libre d'un distributeur" & vbCrLf & vbCrLf & "Entrez le nom du distributeur"), sNomApp, txtNomDis)
  If sNomDis <> "" Then
    txtNumDis = -1
    txtNomDis = sNomDis
    SetDirty        ' Au cas où le n° était déjà à -1
  End If
End Sub


Private Sub txtNumDis_Change()
  txtNomDis = ""
  SetDirty
End Sub

Private Function bCheckDistributeur(bMessage As Boolean) As Boolean
  ' Cas vide
  If txtNumDis = "" Then
    cra.iDis = Null
    cra.sNomDis = Null          ' Mis à jour le 1/12/1997
    bCheckDistributeur = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtNumDis) Then
    bOk = False
  Else
    If txtNumDis < -1 Or txtNumDis > 100000 Or txtNumDis = 0 Then
      bOk = False
    Else
      If txtNumDis <> CStr(CLng(txtNumDis)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomDis = ""
    If bMessage Then
      Focus txtNumDis
      MsgBox2i "CO004", txtNumDis
      'MsgBox "Numéro de Distributeur invalide.", vbExclamation, sNomApp
      txtNumDis.SetFocus
    End If
    bCheckDistributeur = False
    Exit Function
  End If
  
  ' Cas spécial du n° -1
  If txtNumDis = -1 Then
    ' Distributeur libre
    If txtNomDis = "" Then
      MsgBox2i "CR182"
      'MsgBox "Numéro de distributeur invalide." & vbCrLf & _
          "La saisie du n° -1 ne peut pas être effectuée directement, il faut passer par la boîte de saisie d'un distributeur libre, accessible avec Maj+F4.", vbExclamation, sNomApp
      bCheckDistributeur = False
      Exit Function
    End If
    
    ' Mise à jour de la structure de données
    cra.iDis = -1
    cra.sNomDis = txtNomDis
  Else  ' Distributeur du fichier
    
    Dim p As Distributeur
    Set p = LireDistributeur(txtNumDis)
    If p Is Nothing Then
      txtNomDis = ""
      If bMessage Then
        Focus txtNumDis
        MsgBox2i "CO005", txtNumDis
        'MsgBox "Distributeur inexistant.", vbExclamation, sNomApp
        txtNumDis.SetFocus
      End If
      bCheckDistributeur = False
      Exit Function
    End If
  
    If p.dis_etat = "S" Then
      txtNomDis = ""
      If bMessage Then
        Focus txtNumDis
        MsgBox2i "CR184", p.dis_numdis, p.dis_nom
        'MsgBox "Distributeur supprimé." & vbCrLf & vbCrLf & "Le distributeur " & p.dis_numdis & ": " & p.dis_nom & " est à l'état supprimé dans le fichier distributeur, il ne peut pas être utilisé. Choisissez un autre distributeur.", vbExclamation, sNomApp
      End If
      Exit Function
    End If
  
    ' Mise à jour de la structure de données
    cra.iDis = VN(txtNumDis)
    cra.sNomDis = p.dis_nom
    txtNomDis = p.dis_nom
  End If
  
  bCheckDistributeur = True
End Function

Private Sub txtNumDis_GotFocus()
  AutoSelect txtNumDis
  SetLib sbStatus, "SimpleText", "RAtxtDis.tag"
  'sbStatus.SimpleText = "Entrez le numéro du distributeur, F4 pour une recherche, Maj+F4 pour une saisie libre."
End Sub

Private Sub txtNumDis_LostFocus()
  If bBlocageEnCours Then
    ActionSuivante Me, "txtNumDis_LostFocus"
    Exit Sub
  End If

  If bCheckDistributeur(False) Or txtNumDis = "" Then
    txtNumDis.ForeColor = &H80000008
  Else
    txtNumDis.ForeColor = &HFF&
  End If
End Sub


Private Sub txtNumDis_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtNumDis.Locked = False Then RechercheDistributeur
  If KeyCode = vbKeyF4 And Shift = 1 And txtNumDis.Locked = False Then SaisieDistributeurLibre
  If KeyCode = vbKeyF5 And Shift = 0 And txtNumDis.Locked = False Then
    txtNumDis = NV(craF5.iDis)
    txtNomDis = NV(craF5.sNomDis)
  End If
End Sub

Private Sub txtNumDis_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  iShift = Shift
End Sub

Private Sub txtNumDis_DblClick()
  txtNumDis_KeyDown vbKeyF4, iShift
End Sub


' ===============================================================
' Date de fabrication

Private Sub txtDateFabrication_GotFocus()
  AutoSelect txtDateFabrication
  SetLib sbStatus, "SimpleText", "RAtxtDF.tag"
  'sbStatus.SimpleText = "Entrez la date de fabrication, F4 pour le calendrier."
End Sub

Private Sub txtDateFabrication_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDateFabrication.Locked = False Then calendrier txtDateFabrication
  If KeyCode = vbKeyF5 And Shift = 0 And txtDateFabrication.Locked = False Then txtDateFabrication.DateSaisie = craF5.dDateFab
End Sub

Private Sub txtDateFabrication_DblClick()
  If Not txtDateFabrication.Locked Then calendrier txtDateFabrication
End Sub

Private Function bCheckDateFabrication(bMessage As Boolean) As Boolean
  Dim d
  d = cra.dDateFab
  bCheckDateFabrication = bCheckDate("Tête", txtDateFabrication, d, "Date de fabrication", bMessage)
  cra.dDateFab = d
End Function

Private Sub txtDateFabrication_Change()
  SetDirty
End Sub


' ===============================================================
' Date de livraison

Private Sub txtDateLivraison_GotFocus()
  AutoSelect txtDateLivraison
  SetLib sbStatus, "SimpleText", "RAtxtDL.tag"
End Sub

Private Sub txtDateLivraison_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDateLivraison.Locked = False Then calendrier txtDateLivraison
  If KeyCode = vbKeyF5 And Shift = 0 And txtDateLivraison.Locked = False Then txtDateLivraison.DateSaisie = craF5.dDateLivr
End Sub

Private Sub txtDateLivraison_DblClick()
  If Not txtDateLivraison.Locked Then calendrier txtDateLivraison
End Sub

Private Function bCheckDateLivraison(bMessage As Boolean) As Boolean
  Dim d
  d = cra.dDateLivr
  bCheckDateLivraison = bCheckDate("Tête", txtDateLivraison, d, "Date de livraison", bMessage)
  cra.dDateLivr = d
End Function

Private Sub txtDateLivraison_Change()
  SetDirty
End Sub


' ===============================================================
' Date de livraison

Private Sub txtDateRéceptionClient_GotFocus()
  AutoSelect txtDateRéceptionClient
  SetLib sbStatus, "SimpleText", "RAtxtDRC.tag"
End Sub

Private Sub txtDateRéceptionClient_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDateRéceptionClient.Locked = False Then calendrier txtDateRéceptionClient
  If KeyCode = vbKeyF5 And Shift = 0 And txtDateRéceptionClient.Locked = False Then txtDateRéceptionClient.DateSaisie = craF5.dDateRécepCli
End Sub

Private Sub txtDateRéceptionClient_DblClick()
  If Not txtDateRéceptionClient.Locked Then calendrier txtDateRéceptionClient
End Sub

Private Function bCheckDateRéceptionClient(bMessage As Boolean) As Boolean
  Dim d
  d = cra.dDateRécepCli
  bCheckDateRéceptionClient = bCheckDate("Tête", txtDateRéceptionClient, d, "Date de réception client", bMessage)
  cra.dDateRécepCli = d
End Function

Private Sub txtDateRéceptionClient_Change()
  SetDirty
End Sub


' ===============================================================
' Date de conditionnement

Private Sub txtDateConditionnement_GotFocus()
  AutoSelect txtDateConditionnement
  SetLib sbStatus, "SimpleText", "RAtxtDC.tag"
  'sbStatus.SimpleText = "Entrez la date de conditionnement, F4 pour le calendrier."
End Sub

Private Sub txtDateConditionnement_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDateConditionnement.Locked = False Then calendrier txtDateConditionnement
  If KeyCode = vbKeyF5 And Shift = 0 And txtDateConditionnement.Locked = False Then txtDateConditionnement.DateSaisie = craF5.dDateCond
End Sub

Private Sub txtDateConditionnement_DblClick()
  If Not txtDateConditionnement.Locked Then calendrier txtDateConditionnement
End Sub

Private Function bCheckDateConditionnement(bMessage As Boolean) As Boolean
  Dim d
  d = cra.dDateCond
  bCheckDateConditionnement = bCheckDate("Tête", txtDateConditionnement, d, "Date de conditionnement", bMessage)
  cra.dDateCond = d
End Function

Private Sub txtDateConditionnement_Change()
  SetDirty
End Sub


' ===============================================================
' Date de déconditionnement

Private Sub txtDateDéconditionnement_GotFocus()
  AutoSelect txtDateDéconditionnement
  SetLib sbStatus, "SimpleText", "RAtxtDD.tag"
  'sbStatus.SimpleText = "Entrez la date de déconditionnement [inutilisée], F4 pour le calendrier."
End Sub

Private Sub txtDateDéconditionnement_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDateDéconditionnement.Locked = False Then calendrier txtDateDéconditionnement
  If KeyCode = vbKeyF5 And Shift = 0 And txtDateDéconditionnement.Locked = False Then txtDateDéconditionnement.DateSaisie = NV(craF5.dDateDécond)
End Sub

Private Sub txtDateDéconditionnement_DblClick()
  If Not txtDateDéconditionnement.Locked Then calendrier txtDateDéconditionnement
End Sub

Private Function bCheckDateDéconditionnement(bMessage As Boolean) As Boolean
  Dim d
  d = cra.dDateDécond
  bCheckDateDéconditionnement = bCheckDate("Tête", txtDateDéconditionnement, d, "Date de Déconditionnement", bMessage)
  cra.dDateDécond = d
End Function

Private Sub txtDateDéconditionnement_Change()
  SetDirty
End Sub


' ===============================================================
' DLC

Private Sub txtDateDLC_GotFocus()
  AutoSelect txtDateDLC
  SetLib sbStatus, "SimpleText", "RAtxtDLC.tag"
  'sbStatus.SimpleText = "Entrez la DLC (ou la DLUO)."
End Sub

Private Function bCheckDateDLC(bMessage As Boolean) As Boolean
  ' La DLC est un texte !
  
  ' Mise à jour de la structure de données
  cra.sDlc = txtDateDLC
  
  bCheckDateDLC = True
End Function

Private Sub txtDateDLC_Change()
  SetDirty
End Sub

Private Sub txtDateDLC_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtDateDLC.Locked = False Then txtDateDLC = craF5.sDlc
End Sub


' ===============================================================
' DLUO

Private Sub txtDateDLUO_GotFocus()
  AutoSelect txtDateDLUO
  SetLib sbStatus, "SimpleText", "RAtxtDLUO.tag"
  'sbStatus.SimpleText = "Entrez la DLUO."
End Sub

Private Function bCheckDateDLUO(bMessage As Boolean) As Boolean
  ' La DLUO est un texte !
  
  ' Mise à jour de la structure de données
  cra.sDluo = txtDateDLUO
  
  bCheckDateDLUO = True
End Function

Private Sub txtDateDLUO_Change()
  SetDirty
End Sub

Private Sub txtDateDLUO_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtDateDLUO.Locked = False Then txtDateDLUO = craF5.sDluo
End Sub



' ===============================================================
' Identification de lot (Lot de fabrication)

Private Sub txtIdLot_GotFocus()
  AutoSelect txtIdLot
  SetLib sbStatus, "SimpleText", "RAtxtIdLot.tag"
  'sbStatus.SimpleText = "Entrez l'identification de lot."
End Sub

Private Function bCheckIdLot(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.sIdlot = txtIdLot
  
  bCheckIdLot = True
End Function

Private Sub txtIdLot_Change()
  ' Mécanisme qui élimine les blancs superflus dans CB+n et CH+n (McDonald's)
  If (Left(txtIdLot, 5) = "CB + " Or Left(txtIdLot, 5) = "CH + ") Then
    txtIdLot = Left(txtIdLot, 2) & "+" & Mid(txtIdLot, 6)
    txtComplémentNom.SelStart = 99
  End If

  SetDirty
End Sub

Private Sub txtIdLot_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtIdLot.Locked = False Then txtIdLot = craF5.sIdlot
End Sub



' ===============================================================
' Code emballeur

Private Sub txtCodeEmballeur_GotFocus()
  AutoSelect txtCodeEmballeur
  SetLib sbStatus, "SimpleText", "RAtxtCE.tag"
  'sbStatus.SimpleText = "Entrez le code emballeur."
End Sub

Private Function bCheckCodeEmballeur(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.sCodeEmb = txtCodeEmballeur
  
  bCheckCodeEmballeur = True
End Function

Private Sub txtCodeEmballeur_Change()
  SetDirty
End Sub

Private Sub txtCodeEmballeur_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtCodeEmballeur.Locked = False Then txtCodeEmballeur = craF5.sCodeEmb
End Sub


' ===============================================================
' DLC secondaire

Private Sub txtDLC2_GotFocus()
  AutoSelect txtDLC2
  SetLib sbStatus, "SimpleText", "RAtxtDLC2.tag"
  'sbStatus.SimpleText = "Entrez la DLC secondaire."
End Sub

Private Function bCheckDLC2(bMessage As Boolean) As Boolean
  ' La DLC secondaire est un texte
  
  ' Mise à jour de la structure de données
  cra.sDLC2 = txtDLC2
  bCheckDLC2 = True
End Function

Private Sub txtDLC2_Change()
  SetDirty
End Sub

Private Sub txtDLC2_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtDLC2.Locked = False Then txtDLC2 = craF5.sDLC2
End Sub



' ===============================================================
' Date de retrait

Private Sub txtDateRetrait_GotFocus()
  AutoSelect txtDateRetrait
  SetLib sbStatus, "SimpleText", "RAtxtDR.tag"
  'sbStatus.SimpleText = "Entrez la date de retrait."
End Sub

Private Function bCheckDateRetrait(bMessage As Boolean) As Boolean
  ' La date de retrait est un texte !
  
  ' Mise à jour de la structure de données
  cra.sDateRetrait = txtDateRetrait
  
  bCheckDateRetrait = True
End Function

Private Sub txtDateRetrait_Change()
  SetDirty
End Sub

Private Sub txtDateRetrait_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtDateRetrait.Locked = False Then txtDateRetrait = craF5.sDateRetrait
End Sub



' ===============================================================
' N° de cadre de prélèvement

Private Sub RechercheCadreDePrélèvement()
  Dim p As LibelléRA
  Set p = frmRechercheLibelléRA.Cherche(rCadrePrélèvement)
  If Not p Is Nothing Then
    txtNumCpr = p.lcr_indice
    txtNomCpr = p.lcr_libelle
  End If
End Sub

Private Sub txtNumcpr_Change()
  txtNomCpr = ""
  SetDirty
End Sub

Private Function bCheckCadreDePrélèvement(bMessage As Boolean) As Boolean
  Dim bOk As Boolean
  
  bOk = True
  If Not IsNumeric(txtNumCpr) Then
    bOk = False
  Else
    If txtNumCpr < 1 Or txtNumCpr > 1000 Then
      bOk = False
    Else
      If txtNumCpr <> CStr(CInt(txtNumCpr)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomCpr = ""
    If bMessage Then
      Focus txtNumCpr
      MsgBox2i "CR186"
      'MsgBox "Numéro de cadre de prélèvement invalide." & vbCrLf & "Le cadre de prélèvement est obligatoire.", vbExclamation, sNomApp
    End If
    bCheckCadreDePrélèvement = False
    Exit Function
  End If
  
  Dim p As LibelléRA
  Set p = LireLibelléRA(rCadrePrélèvement, txtNumCpr)
  If p Is Nothing Then
    txtNomCpr = ""
    If bMessage Then
      Focus txtNumCpr
      MsgBox2i "CO005", txtNumCpr
      'MsgBox "Cadre de prélèvement inexistant.", vbExclamation, sNomApp
      txtNumCpr.SetFocus
    End If
    bCheckCadreDePrélèvement = False
    Exit Function
  End If
  
  
  If Not bContrôleVieuxLibellé(txtNumCpr, "cadre de prélèvement", p.lcr_libelle, bMessage) Then
    bCheckCadreDePrélèvement = False
    Exit Function
  End If

  
  ' Mise à jour de la structure de données
  cra.hCadrePrél = VN(txtNumCpr)

  txtNomCpr = p.lcr_libelle
  bCheckCadreDePrélèvement = True
End Function

Private Sub txtNumcpr_GotFocus()
  AutoSelect txtNumCpr
  SetLib sbStatus, "SimpleText", "RAtxtCpr.tag"
  'sbStatus.SimpleText = "Entrez le numéro du cadre de prélèvement, F4 pour une recherche."
End Sub

Private Sub txtNumcpr_LostFocus()
  If bCheckCadreDePrélèvement(False) Or txtNumCpr = "" Then
    txtNumCpr.ForeColor = &H80000008
  Else
    txtNumCpr.ForeColor = &HFF&
  End If
End Sub

Private Sub txtNumcpr_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtNumCpr.Locked = False Then RechercheCadreDePrélèvement
  If KeyCode = vbKeyF5 And Shift = 0 And txtNumCpr.Locked = False Then txtNumCpr = craF5.hCadrePrél
End Sub

Private Sub txtNumcpr_DblClick()
  txtNumcpr_KeyDown vbKeyF4, iShift
End Sub



' ===============================================================
' Référence d'origine

Private Sub txtRefOrigine_GotFocus()
  AutoSelect txtRefOrigine
  SetLib sbStatus, "SimpleText", "RAtxtRefO.tag"
  'sbStatus.SimpleText = "Entrez la référence d'origine, en cas de contre-analyse."
End Sub

Private Function bCheckRefOrigine(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.sRef0 = txtRefOrigine
  
  bCheckRefOrigine = True
End Function

Private Sub txtRefOrigine_Change()
  SetDirty
End Sub

Private Sub txtRefOrigine_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtRefOrigine.Locked = False Then txtRefOrigine = craF5.sRef0
End Sub



' ===============================================================
' Code fabricant

Private Sub txtCodeFabricant_GotFocus()
  AutoSelect txtCodeFabricant
  SetLib sbStatus, "SimpleText", "RAtxtCFab.tag"
  'sbStatus.SimpleText = "Entrez le code fabricant (code interne au fabricant, pas le n° du ficheir fabricant)."
End Sub

Private Function bCheckCodeFabricant(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.sCodeFab = txtCodeFabricant
  
  bCheckCodeFabricant = True
End Function

Private Sub txtCodeFabricant_Change()
  SetDirty
End Sub

Private Sub txtCodeFabricant_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtCodeFabricant.Locked = False Then txtCodeFabricant = craF5.sCodeFab
End Sub



' ===============================================================
' Options d'édition du RA

Private Sub SaisieOptionsEdition()
  Dim o As String
  o = frmOptionsRA.OptionsEdition(txtOptionsEdition)
  If o <> "*" Then
    txtOptionsEdition = o
    txtOptionsEdition.SelStart = 0
    txtOptionsEdition.SelLength = 99
  End If
End Sub

Private Sub txtOptionsEdition_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtOptionsEdition.Locked = False Then SaisieOptionsEdition
  If KeyCode = vbKeyF5 And Shift = 0 And txtOptionsEdition.Locked = False Then txtOptionsEdition = craF5.sOptionsEdition
End Sub

Private Sub txtOptionsEdition_DblClick()
  If txtOptionsEdition.Locked = False Then SaisieOptionsEdition
End Sub

Private Sub txtOptionsEdition_GotFocus()
  AutoSelect txtOptionsEdition
  SetLib sbStatus, "SimpleText", "RAtxtOE.tag"
  'sbStatus.SimpleText = "Entrez les options d'édition du RA, F4 pour le détail."
End Sub

Private Function bCheckOptionsEdition(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.sOptionsEdition = txtOptionsEdition
  
  If InStr(txtOptionsEdition, "Z") <> 0 And Left(txtPréfixe, 3) <> "MAC" Then
    Dim sMessage As String
    sMessage = sGetIntlLib("RAtxtChkOE", "PROBLÈME DE COHÉRENCE" & vbCrLf & vbCrLf & "Option d'édition cryptée (Z) et établissement non McDonald's (prefixe pas en MAC*)." & vbCrLf & vbCrLf & "S'il ne s'agit pas d'une erreur de saisie, prévenez impérativement la DI.")
    DémonJournalUnix "OptionsEdition", "Erreur interne", sMessage
    MsgBox sMessage, vbExclamation, sNomApp
  End If
  
  bCheckOptionsEdition = True
End Function

Private Sub txtOptionsEdition_Change()
  SetDirty
End Sub



' ===============================================================
' Marque

Private Sub txtMarque_GotFocus()
  AutoSelect txtMarque
  SetLib sbStatus, "SimpleText", "RAtxtMarque.tag"
  'sbStatus.SimpleText = "Entrez la marque de l'échantillon."
End Sub

Private Function bCheckMarque(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.sMarque = txtMarque
  
  bCheckMarque = True
End Function

Private Sub txtMarque_Change()
  SetDirty
End Sub

Private Sub txtMarque_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtMarque.Locked = False Then txtMarque = craF5.sMarque
End Sub


' ===============================================================
' Unité de vente

Private Sub txtUV_GotFocus()
  AutoSelect txtUV
  SetLib sbStatus, "SimpleText", "RAtxtUV.tag"
  'sbStatus.SimpleText = "Entrez l'unité de vente de l'échantillon."
End Sub

Private Function bCheckUV(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.sUv = txtUV

  bCheckUV = True
End Function

Private Sub txtUV_Change()
  SetDirty
End Sub

Private Sub txtUV_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtUV.Locked = False Then txtUV = craF5.sUv
End Sub


' ===============================================================
' Date de réception

Private Sub txtDateRéception_GotFocus()
  AutoSelect txtDateRéception
  SetLib sbStatus, "SimpleText", "RAtxtDRéc.tag"
  'sbStatus.SimpleText = "Entrez la date de réception, F4 pour le calendrier."
End Sub

Private Sub txtDateRéception_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDateRéception.Locked = False Then calendrier txtDateRéception
  If KeyCode = vbKeyF5 And Shift = 0 And txtDateRéception.Locked = False Then txtDateRéception.DateSaisie = craF5.dDateRécep
End Sub

Private Sub txtDateRéception_DblClick()
  If Not txtDateRéception.Locked Then calendrier txtDateRéception
End Sub

Private Function bCheckDateRéception(bMessage As Boolean) As Boolean
  Dim d
  d = cra.dDateRécep
  bCheckDateRéception = bCheckDate("Tête", txtDateRéception, d, "Date de réception", bMessage)
  cra.dDateRécep = d
End Function

Private Sub txtDateRéception_Change()
  SetDirty
End Sub


' ===============================================================
' Heure de réception

Private Sub txtHeureRéception_GotFocus()
  AutoSelect txtHeureRéception
  SetLib sbStatus, "SimpleText", "RAtxtHR.tag"
  'sbStatus.SimpleText = "Entrez l'heure de réception."
End Sub

Private Function bCheckHeureRéception(bMessage As Boolean) As Boolean
  If txtHeureRéception.HeureSaisie = "ERR" Then
    If bMessage Then
      bCheckHeureRéception = False
      Focus txtHeureRéception
      MsgBox2i "CO004", txtHeureRéception
      'MsgBox "Heure de Réception invalide.", vbExclamation, sNomApp
      txtHeureRéception.SetFocus
    End If
    Exit Function
  End If
  
  ' Mise à jour de la structure de données
  cra.hHeureRécep = VN(txtHeureRéception.HeureSaisie)
  
'  ' Tests de vraisemblance
'  If IsNumeric(cra.hHeureRécep) Then
'    If cra.hHeureRécep < 600 Or cra.hHeureRécep > 2000 Then
'      If bMessage Then
'        MsgBox2i "CR162"
'        'MsgBox "Avertissement: Réception avant 6:00 ou après 20:00. Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
'      End If
'    End If
'  End If
  
  bCheckHeureRéception = True
End Function

Private Sub txtHeureRéception_Change()
  SetDirty
End Sub

Private Sub txtHeureRéception_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtHeureRéception.Locked = False Then txtHeureRéception.HeureSaisie = craF5.hHeureRécep
End Sub


' ===============================================================
' Aspect échantillon

Private Sub RechercheAspectÉchantillon()
  Dim p As LibelléRA
  Set p = frmRechercheLibelléRA.Cherche(rAspectEchantillon)
  If Not p Is Nothing Then
    txtAspect = p.lcr_indice
    txtNomAspect = p.lcr_libelle
  End If
End Sub

Private Sub txtAspect_Change()
  txtNomAspect = ""
  SetDirty
End Sub

Private Function bCheckAspectÉchantillon(bMessage As Boolean) As Boolean
  If txtAspect = "" Then
    cra.hAspect = Null
    bCheckAspectÉchantillon = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtAspect) Then
    bOk = False
  Else
    If txtAspect < 1 Or txtAspect > 1000 Then
      bOk = False
    Else
      If txtAspect <> CStr(CInt(txtAspect)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomAspect = ""
    If bMessage Then
      Focus txtAspect
      MsgBox2i "CO004", txtAspect
      'MsgBox "Numéro d'aspect échantillon invalide.", vbExclamation, sNomApp
      txtAspect.SetFocus
    End If
    bCheckAspectÉchantillon = False
    Exit Function
  End If
  
  Dim p As LibelléRA
  Set p = LireLibelléRA(rAspectEchantillon, txtAspect)
  If p Is Nothing Then
    txtNomAspect = ""
    If bMessage Then
      Focus txtAspect
      MsgBox2i "CO005", txtAspect
      'MsgBox "Aspect échantillon inexistant.", vbExclamation, sNomApp
      txtAspect.SetFocus
    End If
    bCheckAspectÉchantillon = False
    Exit Function
  End If
  
 If Not bContrôleVieuxLibellé(txtAspect, "aspect échantillon", p.lcr_libelle, bMessage) Then
    bCheckAspectÉchantillon = False
    Exit Function
  End If

  
  ' Mise à jour de la structure de données
  cra.hAspect = VN(txtAspect)

  txtNomAspect = p.lcr_libelle
  bCheckAspectÉchantillon = True
End Function

Private Sub txtAspect_GotFocus()
  AutoSelect txtAspect
  SetLib sbStatus, "SimpleText", "RAtxtAspect.tag"
  'sbStatus.SimpleText = "Entrez le numéro de l'aspect, F4 pour une recherche."
End Sub

Private Sub txtAspect_LostFocus()
  If bCheckAspectÉchantillon(False) Or txtAspect = "" Then
    txtAspect.ForeColor = &H80000008
  Else
    txtAspect.ForeColor = &HFF&
  End If
End Sub

Private Sub txtAspect_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtAspect.Locked = False Then RechercheAspectÉchantillon
  If KeyCode = vbKeyF5 And Shift = 0 And txtAspect.Locked = False Then txtAspect = NV(craF5.hAspect)
End Sub

Private Sub txtAspect_DblClick()
  txtAspect_KeyDown vbKeyF4, iShift
End Sub



' ===============================================================
' Niveau d'élaboration

Private Sub RechercheNiveauÉlaboration()
  Dim p As LibelléRA
  Set p = frmRechercheLibelléRA.Cherche(rNiveauÉlaboration)
  If Not p Is Nothing Then
    txtNivÉlabo = p.lcr_indice
    txtNomNivÉlabo = p.lcr_libelle
  End If
End Sub

Private Sub txtNivÉlabo_Change()
  txtNomNivÉlabo = ""
  SetDirty
End Sub

Private Function bCheckNiveauÉlaboration(bMessage As Boolean) As Boolean
  If txtNivÉlabo = "" Then
    cra.hNiveauÉlaboration = Null
    bCheckNiveauÉlaboration = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtNivÉlabo) Then
    bOk = False
  Else
    If txtNivÉlabo < 1 Or txtNivÉlabo > 1000 Then
      bOk = False
    Else
      If txtNivÉlabo <> CStr(CInt(txtNivÉlabo)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomNivÉlabo = ""
    If bMessage Then
      Focus txtNivÉlabo
      MsgBox2i "CO004", txtNivÉlabo
      'MsgBox "Code de niveau d'élaboration invalide.", vbExclamation, sNomApp
      txtNivÉlabo.SetFocus
    End If
    bCheckNiveauÉlaboration = False
    Exit Function
  End If
  
  Dim p As LibelléRA
  Set p = LireLibelléRA(rNiveauÉlaboration, txtNivÉlabo)
  If p Is Nothing Then
    txtNomNivÉlabo = ""
    If bMessage Then
      Focus txtNivÉlabo
      MsgBox2i "CO005", txtNivÉlabo
      'MsgBox "Niveau d'élaboration inexistant.", vbExclamation, sNomApp
      txtNivÉlabo.SetFocus
    End If
    bCheckNiveauÉlaboration = False
    Exit Function
  End If
  
  If Not bContrôleVieuxLibellé(txtNivÉlabo, "niveau d'élaboration", p.lcr_libelle, bMessage) Then
    bCheckNiveauÉlaboration = False
    Exit Function
  End If
  
  
  ' Mise à jour de la structure de données
  cra.hNiveauÉlaboration = VN(txtNivÉlabo)

  txtNomNivÉlabo = p.lcr_libelle
  bCheckNiveauÉlaboration = True
End Function

Private Sub txtNivÉlabo_GotFocus()
  AutoSelect txtNivÉlabo
  SetLib sbStatus, "SimpleText", "RAtxtNivÉlabo.tag"
  'sbStatus.SimpleText = "Entrez le numéro de niveau d'élaboration, F4 pour une recherche."
End Sub

Private Sub txtNivÉlabo_LostFocus()
  If bCheckNiveauÉlaboration(False) Or txtNivÉlabo = "" Then
    txtNivÉlabo.ForeColor = &H80000008
  Else
    txtNivÉlabo.ForeColor = &HFF&
  End If
End Sub

Private Sub txtNivÉlabo_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtNivÉlabo.Locked = False Then RechercheNiveauÉlaboration
  If KeyCode = vbKeyF5 And Shift = 0 And txtNivÉlabo.Locked = False Then txtNivÉlabo = NV(craF5.hNiveauÉlaboration)
End Sub

Private Sub txtNivÉlabo_DblClick()
  txtNivÉlabo_KeyDown vbKeyF4, iShift
End Sub



' ===============================================================
' État physique

Private Sub RechercheÉtatPhysique()
  Dim p As LibelléRA
  Set p = frmRechercheLibelléRA.Cherche(rÉtatPhysique)
  If Not p Is Nothing Then
    txtÉtatPhy = p.lcr_indice
    txtNomÉtatPhy = p.lcr_libelle
  End If
End Sub

Private Sub txtÉtatPhy_Change()
  txtNomÉtatPhy = ""
  SetDirty
End Sub

Private Function bCheckÉtatPhysique(bMessage As Boolean) As Boolean
  If txtÉtatPhy = "" Then
    cra.hÉtatPhysique = Null
    bCheckÉtatPhysique = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtÉtatPhy) Then
    bOk = False
  Else
    If txtÉtatPhy < 1 Or txtÉtatPhy > 1000 Then
      bOk = False
    Else
      If txtÉtatPhy <> CStr(CInt(txtÉtatPhy)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomÉtatPhy = ""
    If bMessage Then
      Focus txtÉtatPhy
      MsgBox2i "CO004", txtÉtatPhy
      'MsgBox "Code d'état physique invalide.", vbExclamation, sNomApp
      txtÉtatPhy.SetFocus
    End If
    bCheckÉtatPhysique = False
    Exit Function
  End If
  
  Dim p As LibelléRA
  Set p = LireLibelléRA(rÉtatPhysique, txtÉtatPhy)
  If p Is Nothing Then
    txtNomÉtatPhy = ""
    If bMessage Then
      Focus txtÉtatPhy
      MsgBox2i "CO005", txtÉtatPhy
      'MsgBox "État physique inexistant.", vbExclamation, sNomApp
      txtÉtatPhy.SetFocus
    End If
    bCheckÉtatPhysique = False
    Exit Function
  End If
  
  If Not bContrôleVieuxLibellé(txtÉtatPhy, "état physique", p.lcr_libelle, bMessage) Then
    bCheckÉtatPhysique = False
    Exit Function
  End If

  
  ' Mise à jour de la structure de données
  cra.hÉtatPhysique = VN(txtÉtatPhy)

  txtNomÉtatPhy = p.lcr_libelle
  bCheckÉtatPhysique = True
End Function

Private Sub txtÉtatPhy_GotFocus()
  AutoSelect txtÉtatPhy
  SetLib sbStatus, "SimpleText", "RAtxtÉtatPhy.tag"
  'sbStatus.SimpleText = "Entrez le numéro d'état physique, F4 pour une recherche."
End Sub

Private Sub txtÉtatPhy_LostFocus()
  If bCheckÉtatPhysique(False) Or txtÉtatPhy = "" Then
    txtÉtatPhy.ForeColor = &H80000008
  Else
    txtÉtatPhy.ForeColor = &HFF&
  End If
End Sub

Private Sub txtÉtatPhy_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtÉtatPhy.Locked = False Then RechercheÉtatPhysique
  If KeyCode = vbKeyF5 And Shift = 0 And txtÉtatPhy.Locked = False Then txtÉtatPhy = NV(craF5.hÉtatPhysique)
End Sub

Private Sub txtÉtatPhy_DblClick()
  txtÉtatPhy_KeyDown vbKeyF4, iShift
End Sub



' ===============================================================
' Contenant

Private Sub RechercheContenant()
  Dim p As LibelléRA
  Set p = frmRechercheLibelléRA.Cherche(rContenant)
  If Not p Is Nothing Then
    txtContenant = p.lcr_indice
    txtNomContenant = p.lcr_libelle
  End If
End Sub

Private Sub txtContenant_Change()
  txtNomContenant = ""
  SetDirty
End Sub

Private Function bCheckContenant(bMessage As Boolean) As Boolean
  If txtContenant = "" Then
    cra.hContenant = Null
    bCheckContenant = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtContenant) Then
    bOk = False
  Else
    If txtContenant < 1 Or txtContenant > 1000 Then
      bOk = False
    Else
      If txtContenant <> CStr(CInt(txtContenant)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomContenant = ""
    If bMessage Then
      Focus txtContenant
      MsgBox2i "CO004", txtContenant
      'MsgBox "Code de contenant invalide.", vbExclamation, sNomApp
      txtContenant.SetFocus
    End If
    bCheckContenant = False
    Exit Function
  End If
  
  Dim p As LibelléRA
  Set p = LireLibelléRA(rContenant, txtContenant)
  If p Is Nothing Then
    txtNomContenant = ""
    If bMessage Then
      Focus txtContenant
      MsgBox2i "CO005", txtContenant
      'MsgBox "Contenant inexistant.", vbExclamation, sNomApp
      txtContenant.SetFocus
    End If
    bCheckContenant = False
    Exit Function
  End If
  
  If Not bContrôleVieuxLibellé(txtContenant, "contenant", p.lcr_libelle, bMessage) Then
    bCheckContenant = False
    Exit Function
  End If
  
  
  ' Mise à jour de la structure de données
  cra.hContenant = VN(txtContenant)

  txtNomContenant = p.lcr_libelle
  bCheckContenant = True
End Function

Private Sub txtContenant_GotFocus()
  AutoSelect txtContenant
  SetLib sbStatus, "SimpleText", "RAtxtConte.tag"
  'sbStatus.SimpleText = "Entrez le numéro de contenant, F4 pour une recherche."
End Sub

Private Sub txtContenant_LostFocus()
  If bCheckContenant(False) Or txtContenant = "" Then
    txtContenant.ForeColor = &H80000008
  Else
    txtContenant.ForeColor = &HFF&
  End If
End Sub

Private Sub txtContenant_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtContenant.Locked = False Then RechercheContenant
  If KeyCode = vbKeyF5 And Shift = 0 And txtContenant.Locked = False Then txtContenant = NV(craF5.hContenant)
End Sub

Private Sub txtContenant_DblClick()
  txtContenant_KeyDown vbKeyF4, iShift
End Sub



' ===============================================================
' État de division

Private Sub RechercheÉtatDivision()
  Dim p As LibelléRA
  Set p = frmRechercheLibelléRA.Cherche(rÉtatdivision)
  If Not p Is Nothing Then
    txtÉtatDiv = p.lcr_indice
    txtNomÉtatDiv = p.lcr_libelle
  End If
End Sub

Private Sub txtÉtatDiv_Change()
  txtNomÉtatDiv = ""
  SetDirty
End Sub

Private Function bCheckÉtatDivision(bMessage As Boolean) As Boolean
  If txtÉtatDiv = "" Then
    cra.hÉtatDivision = Null
    bCheckÉtatDivision = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtÉtatDiv) Then
    bOk = False
  Else
    If txtÉtatDiv < 1 Or txtÉtatDiv > 1000 Then
      bOk = False
    Else
      If txtÉtatDiv <> CStr(CInt(txtÉtatDiv)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomÉtatDiv = ""
    If bMessage Then
      Focus txtÉtatDiv
      MsgBox2i "CO004", txtÉtatDiv
      'MsgBox "Code d'état division invalide.", vbExclamation, sNomApp
      txtÉtatDiv.SetFocus
    End If
    bCheckÉtatDivision = False
    Exit Function
  End If
  
  Dim p As LibelléRA
  Set p = LireLibelléRA(rÉtatdivision, txtÉtatDiv)
  If p Is Nothing Then
    txtNomÉtatDiv = ""
    If bMessage Then
      Focus txtÉtatDiv
      MsgBox2i "CO005", txtÉtatDiv
      'MsgBox "État division inexistant.", vbExclamation, sNomApp
      txtÉtatDiv.SetFocus
    End If
    bCheckÉtatDivision = False
    Exit Function
  End If
  
  If Not bContrôleVieuxLibellé(txtÉtatDiv, "état de division", p.lcr_libelle, bMessage) Then
    bCheckÉtatDivision = False
    Exit Function
  End If

  
  ' Mise à jour de la structure de données
  cra.hÉtatDivision = VN(txtÉtatDiv)

  txtNomÉtatDiv = p.lcr_libelle
  bCheckÉtatDivision = True
End Function

Private Sub txtÉtatDiv_GotFocus()
  AutoSelect txtÉtatDiv
  SetLib sbStatus, "SimpleText", "RAtxtÉtatDiv.tag"
  'sbStatus.SimpleText = "Entrez le numéro d'état division, F4 pour une recherche."
End Sub

Private Sub txtÉtatDiv_LostFocus()
  If bCheckÉtatDivision(False) Or txtÉtatDiv = "" Then
    txtÉtatDiv.ForeColor = &H80000008
  Else
    txtÉtatDiv.ForeColor = &HFF&
  End If
End Sub

Private Sub txtÉtatDiv_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtÉtatDiv.Locked = False Then RechercheÉtatDivision
  If KeyCode = vbKeyF5 And Shift = 0 And txtÉtatDiv.Locked = False Then txtÉtatDiv = NV(craF5.hÉtatDivision)
End Sub

Private Sub txtÉtatDiv_DblClick()
  txtÉtatDiv_KeyDown vbKeyF4, iShift
End Sub



' ===============================================================
' Technologie de fabrication

Private Sub RechercheTechnologieFabrication()
  Dim p As LibelléRA
  Set p = frmRechercheLibelléRA.Cherche(rTechnologieFabrication)
  If Not p Is Nothing Then
    txtTechFab = p.lcr_indice
    txtNomTechFab = p.lcr_libelle
  End If
End Sub

Private Sub txtTechFab_Change()
  txtNomTechFab = ""
  SetDirty
End Sub

Private Function bCheckTechnologieFabrication(bMessage As Boolean) As Boolean
  If txtTechFab = "" Then
    cra.hTechnologieFabrication = Null
    bCheckTechnologieFabrication = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtTechFab) Then
    bOk = False
  Else
    If txtTechFab < 1 Or txtTechFab > 1000 Then
      bOk = False
    Else
      If txtTechFab <> CStr(CInt(txtTechFab)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomTechFab = ""
    If bMessage Then
      Focus txtTechFab
      MsgBox2i "CO004", txtTechFab
      'MsgBox "Code de technologie de fabrication invalide.", vbExclamation, sNomApp
      txtTechFab.SetFocus
    End If
    bCheckTechnologieFabrication = False
    Exit Function
  End If
  
  Dim p As LibelléRA
  Set p = LireLibelléRA(rTechnologieFabrication, txtTechFab)
  If p Is Nothing Then
    txtNomTechFab = ""
    If bMessage Then
      Focus txtTechFab
      MsgBox2i "CO005", txtTechFab
      'MsgBox "technologie de fabrication inexistant.", vbExclamation, sNomApp
      txtTechFab.SetFocus
    End If
    bCheckTechnologieFabrication = False
    Exit Function
  End If
  
  If Not bContrôleVieuxLibellé(txtTechFab, "technologie de fabrication", p.lcr_libelle, bMessage) Then
    bCheckTechnologieFabrication = False
    Exit Function
  End If
  
  
  ' Mise à jour de la structure de données
  cra.hTechnologieFabrication = VN(txtTechFab)

  txtNomTechFab = p.lcr_libelle
  bCheckTechnologieFabrication = True
End Function

Private Sub txtTechFab_GotFocus()
  AutoSelect txtTechFab
  SetLib sbStatus, "SimpleText", "RAtxtTechFab.tag"
  'sbStatus.SimpleText = "Entrez le numéro de technologie de fabrication, F4 pour une recherche."
End Sub

Private Sub txtTechFab_LostFocus()
  If bCheckTechnologieFabrication(False) Or txtTechFab = "" Then
    txtTechFab.ForeColor = &H80000008
  Else
    txtTechFab.ForeColor = &HFF&
  End If
End Sub

Private Sub txtTechFab_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtTechFab.Locked = False Then RechercheTechnologieFabrication
  If KeyCode = vbKeyF5 And Shift = 0 And txtTechFab.Locked = False Then txtTechFab = NV(craF5.hTechnologieFabrication)
End Sub

Private Sub txtTechFab_DblClick()
  txtTechFab_KeyDown vbKeyF4, iShift
End Sub



' ===============================================================
' Secteur de prélèvement

Private Sub RechercheSecteurPrélèvement()
  Dim p As LibelléRA
  Set p = frmRechercheLibelléRA.Cherche(rSecteurPrélèvement)
  If Not p Is Nothing Then
    txtSecteurPrél = p.lcr_indice
    txtNomSecteurPrél = p.lcr_libelle
  End If
End Sub

Private Sub txtSecteurPrél_Change()
  txtNomSecteurPrél = ""
  SetDirty
End Sub

Private Function bCheckSecteurPrélèvement(bMessage As Boolean) As Boolean
  If txtSecteurPrél = "" Then
    cra.hSecteurPrél = Null
    bCheckSecteurPrélèvement = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtSecteurPrél) Then
    bOk = False
  Else
    If txtSecteurPrél < 1 Or txtSecteurPrél > 10 Then
      bOk = False
    Else
      If txtSecteurPrél <> CStr(CInt(txtSecteurPrél)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomSecteurPrél = ""
    If bMessage Then
      Focus txtSecteurPrél
      MsgBox2i "CO004", txtSecteurPrél
      'MsgBox "Code secteur de prélèvement invalide.", vbExclamation, sNomApp
      txtSecteurPrél.SetFocus
    End If
    bCheckSecteurPrélèvement = False
    Exit Function
  End If
  
  Dim p As LibelléRA
  Set p = LireLibelléRA(rSecteurPrélèvement, txtSecteurPrél)
  If p Is Nothing Then
    txtNomSecteurPrél = ""
    If bMessage Then
      Focus txtSecteurPrél
      MsgBox2i "CO005", txtSecteurPrél
      'MsgBox "Code secteur de prélèvement inexistant.", vbExclamation, sNomApp
      txtSecteurPrél.SetFocus
    End If
    bCheckSecteurPrélèvement = False
    Exit Function
  End If
  
  If Not bContrôleVieuxLibellé(txtSecteurPrél, "secteur de prélèvement", p.lcr_libelle, bMessage) Then
    bCheckSecteurPrélèvement = False
    Exit Function
  End If
  
  
  ' On vérifie la cohérence par rapport au fichier produit
  If cra.t1 = 4 And VN(txtSecteurPrél) <> 4 Then
    If bMessage Then
      MsgBox2i "CR202"
      'MsgBox "Avertissement: Le produit fait partie du secteur 4 (prélèvements autres et spécifiques clients) alors que le secteur de prélèvement indiqué n'est pas de 4." & vbCrLf & vbCrLf & "Vérifiez que cette incohérence est voulue !", vbInformation, sNomApp
    End If
  End If
  
  
  ' Mise à jour de la structure de données
  cra.hSecteurPrél = VN(txtSecteurPrél)

  txtNomSecteurPrél = p.lcr_libelle
  bCheckSecteurPrélèvement = True
End Function

Private Sub txtSecteurPrél_GotFocus()
  AutoSelect txtSecteurPrél
  SetLib sbStatus, "SimpleText", "RAtxtSecPrél.tag"
  'sbStatus.SimpleText = "Entrez le numéro de code secteur de prélèvement, F4 pour une recherche."
End Sub

Private Sub txtSecteurPrél_LostFocus()
  If bCheckSecteurPrélèvement(False) Or txtSecteurPrél = "" Then
    txtSecteurPrél.ForeColor = &H80000008
  Else
    txtSecteurPrél.ForeColor = &HFF&
  End If
End Sub

Private Sub txtSecteurPrél_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtSecteurPrél.Locked = False Then RechercheSecteurPrélèvement
  If KeyCode = vbKeyF5 And Shift = 0 And txtSecteurPrél.Locked = False Then txtSecteurPrél = NV(craF5.hSecteurPrél)
End Sub

Private Sub txtSecteurPrél_DblClick()
  txtSecteurPrél_KeyDown vbKeyF4, iShift
End Sub


' ===============================================================
' Conditions de prélèvement

Private Sub RechercheConditionsPrélèvement()
  Dim p As LibelléRA
  Set p = frmRechercheLibelléRA.Cherche(rConditionsPrélèvement)
  If Not p Is Nothing Then
    txtCondPrél = p.lcr_indice
    txtNomCondPrél = p.lcr_libelle
  End If
End Sub

Private Sub txtCondPrél_Change()
  txtNomCondPrél = ""
  SetDirty
End Sub

Private Function bCheckConditionsPrélèvement(bMessage As Boolean) As Boolean
  If txtCondPrél = "" Then
    cra.hCondPrél = Null
    bCheckConditionsPrélèvement = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtCondPrél) Then
    bOk = False
  Else
    If txtCondPrél < 1 Or txtCondPrél > 1000 Then
      bOk = False
    Else
      If txtCondPrél <> CStr(CInt(txtCondPrél)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomCondPrél = ""
    If bMessage Then
      Focus txtCondPrél
      MsgBox2i "CO004", txtCondPrél
      'MsgBox "Code condition de prélèvement invalide.", vbExclamation, sNomApp
      txtCondPrél.SetFocus
    End If
    bCheckConditionsPrélèvement = False
    Exit Function
  End If
  
  Dim p As LibelléRA
  Set p = LireLibelléRA(rConditionsPrélèvement, txtCondPrél)
  If p Is Nothing Then
    txtNomCondPrél = ""
    If bMessage Then
      Focus txtCondPrél
      MsgBox2i "CO005", txtCondPrél
      'MsgBox "Condition de prélèvement inexistante.", vbExclamation, sNomApp
      txtCondPrél.SetFocus
    End If
    bCheckConditionsPrélèvement = False
    Exit Function
  End If
  
  If Not bContrôleVieuxLibellé(txtCondPrél, "condition de prélèvement", p.lcr_libelle, bMessage) Then
    bCheckConditionsPrélèvement = False
    Exit Function
  End If

  
  ' Mise à jour de la structure de données
  cra.hCondPrél = VN(txtCondPrél)

  txtNomCondPrél = p.lcr_libelle
  bCheckConditionsPrélèvement = True
End Function

Private Sub txtCondPrél_GotFocus()
  AutoSelect txtCondPrél
  SetLib sbStatus, "SimpleText", "RAtxtCondPrél.tag"
  'sbStatus.SimpleText = "Entrez le numéro de condition de prélèvement, F4 pour une recherche."
End Sub

Private Sub txtCondPrél_LostFocus()
  If bCheckConditionsPrélèvement(False) Or txtCondPrél = "" Then
    txtCondPrél.ForeColor = &H80000008
  Else
    txtCondPrél.ForeColor = &HFF&
  End If
End Sub

Private Sub txtCondPrél_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtCondPrél.Locked = False Then RechercheConditionsPrélèvement
  If KeyCode = vbKeyF5 And Shift = 0 And txtCondPrél.Locked = False Then txtCondPrél = NV(craF5.hCondPrél)
End Sub

Private Sub txtCondPrél_DblClick()
  txtCondPrél_KeyDown vbKeyF4, iShift
End Sub


' ===============================================================
' Intervention opérateur

Private Sub RechercheInterventionOpérateur()
  Dim p As LibelléRA
  Set p = frmRechercheLibelléRA.Cherche(rInterventionOpérateur)
  If Not p Is Nothing Then
    txtIntOpér = p.lcr_indice
    txtNomIntOpér = p.lcr_libelle
  End If
End Sub

Private Sub txtIntOpér_Change()
  txtNomIntOpér = ""
  SetDirty
End Sub

Private Function bCheckInterventionOpérateur(bMessage As Boolean) As Boolean
  If txtIntOpér = "" Then
    cra.hInterventionOpérateur = Null
    bCheckInterventionOpérateur = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtIntOpér) Then
    bOk = False
  Else
    If txtIntOpér < 1 Or txtIntOpér > 1000 Then
      bOk = False
    Else
      If txtIntOpér <> CStr(CInt(txtIntOpér)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomIntOpér = ""
    If bMessage Then
      Focus txtIntOpér
      MsgBox2i "CO004", txtIntOpér
      'MsgBox "Code intervention opérateur invalide.", vbExclamation, sNomApp
      txtIntOpér.SetFocus
    End If
    bCheckInterventionOpérateur = False
    Exit Function
  End If
  
  Dim p As LibelléRA
  Set p = LireLibelléRA(rInterventionOpérateur, txtIntOpér)
  If p Is Nothing Then
    txtNomIntOpér = ""
    If bMessage Then
      Focus txtIntOpér
      MsgBox2i "CO005", txtIntOpér
      'MsgBox "Code intervention opérateur inexistante", vbExclamation, sNomApp
      txtIntOpér.SetFocus
    End If
    bCheckInterventionOpérateur = False
    Exit Function
  End If
  
  If Not bContrôleVieuxLibellé(txtIntOpér, "intervention opérateur", p.lcr_libelle, bMessage) Then
    bCheckInterventionOpérateur = False
    Exit Function
  End If
  
  
  ' Mise à jour de la structure de données
  cra.hInterventionOpérateur = VN(txtIntOpér)

  txtNomIntOpér = p.lcr_libelle
  bCheckInterventionOpérateur = True
End Function

Private Sub txtIntOpér_GotFocus()
  AutoSelect txtIntOpér
  SetLib sbStatus, "SimpleText", "RAtxtIntOpér.tag"
  'sbStatus.SimpleText = "Entrez le numéro d'intervention opérateur, F4 pour une recherche."
End Sub

Private Sub txtIntOpér_LostFocus()
  If bCheckInterventionOpérateur(False) Or txtIntOpér = "" Then
    txtIntOpér.ForeColor = &H80000008
  Else
    txtIntOpér.ForeColor = &HFF&
  End If
End Sub

Private Sub txtIntOpér_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtIntOpér.Locked = False Then RechercheInterventionOpérateur
  If KeyCode = vbKeyF5 And Shift = 0 And txtIntOpér.Locked = False Then txtIntOpér = NV(craF5.hInterventionOpérateur)
End Sub

Private Sub txtIntOpér_DblClick()
  txtIntOpér_KeyDown vbKeyF4, iShift
End Sub


' ===============================================================
' Infos de rab

Private Sub txtInfo1_Change()
  SetDirty
End Sub

Private Sub txtInfo2_Change()
  SetDirty
End Sub

Private Function bCheckInfosRab1(bMessage As Boolean) As Boolean
  If txtInfo1 <> "" Then
    Dim bOk As Boolean
    bOk = True
    If Not IsNumeric(txtInfo1) Then
      bOk = False
    Else
      If txtInfo1 < 1 Or txtInfo1 > 1000 Then
        bOk = False
      Else
        If txtInfo1 <> CStr(CInt(txtInfo1)) Then bOk = False
      End If
    End If
    
    If Not bOk Then
      If bMessage Then
        Focus txtInfo1
        MsgBox2i "CO003", txtInfo1    ' %1 n'est pas un nombre correct.
        txtInfo1.SetFocus
      End If
      bCheckInfosRab1 = False
      Exit Function
    End If
  End If
  
  ' Mise à jour de la structure de données
  cra.iInfo1 = VN(txtInfo1)

  bCheckInfosRab1 = True
End Function


Private Function bCheckInfosRab2(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.sInfo2 = txtInfo2

  bCheckInfosRab2 = True
End Function


Private Sub txtInfo1_GotFocus()
  AutoSelect txtInfo1
  SetLib sbStatus, "SimpleText", "RAtxtInfo1.tag"
  'sbStatus.SimpleText = "Info complémentaire 1, numérique"
End Sub

Private Sub txtInfo2_GotFocus()
  AutoSelect txtInfo2
  SetLib sbStatus, "SimpleText", "RAtxtInfo2.tag"
  'sbStatus.SimpleText = "Info complémentaire 2, 10 caractères maximum"
End Sub

Private Sub txtInfo1_LostFocus()
  If bCheckInfosRab1(False) Or txtInfo1 = "" Then
    txtInfo1.ForeColor = &H80000008
  Else
    txtInfo1.ForeColor = &HFF&
  End If
End Sub

Private Sub txtInfo1_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtInfo1.Locked = False Then txtInfo1 = NV(craF5.iInfo1)
End Sub

Private Sub txtInfo2_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtInfo2.Locked = False Then txtInfo2 = NV(craF5.sInfo2)
End Sub


' ===============================================================
' Infos nouveaux produits

Private Function bCheckNouveauxProduits(bMessage As Boolean) As Boolean
  ' Les contrôles ne portent que sur les prélèvements à compter du 1/1/99
  ' Non: sur test sur t1 uniquement !
  
  ' S'il s'agit d'un produit avec t1 défini, pas de contrôle
  If cra.t1 > 0 Then
    If cra.t1 < 4 And cra.dDatePrél >= #1/1/1999# Then
      If bMessage Then
        MsgBox2i "CR208"
        'Ancien produit, utilisation impossible
        If Not bShiftPressed Then
          bCheckNouveauxProduits = False
          Exit Function
        End If
      End If
    End If
    bCheckNouveauxProduits = True
    Exit Function
  End If

    
  If IsNull(cra.hSecteurPrél) Then
    If bMessage Then
      Focus txtSecteurPrél
      MsgBox2i "CR209", cra.t1
      'MsgBox "Le secteur de prélèvement [7] est OBLIGATOIRE avec le nouveau fichier produit (cra.t1=" & cra.t1 & ").", vbExclamation, sNomApp
    End If
    bCheckNouveauxProduits = False
    Exit Function
  End If
  
  If IsNull(cra.hÉtatPhysique) Then
    If bMessage Then
      Focus txtÉtatPhy
      MsgBox2i "CR210", cra.t1
      'MsgBox "L'état physique [8] est OBLIGATOIRE avec le nouveau fichier produit (cra.t1=" & cra.t1 & ").", vbExclamation, sNomApp
    End If
    bCheckNouveauxProduits = False
    Exit Function
  End If
  
  If IsNull(cra.hInterventionOpérateur) Then
    If bMessage Then
      Focus txtIntOpér
      MsgBox2i "CR211", cra.t1
      'MsgBox "Le code intervention opérateur [9] est OBLIGATOIRE avec le nouveau fichier produit (cra.t1=" & cra.t1 & ").", vbExclamation, sNomApp
    End If
    bCheckNouveauxProduits = False
    Exit Function
  End If
  
  
  ' Règles de cohérence (doc JPVP)
  If cra.hSecteurPrél = 1 And cra.hInterventionOpérateur <> 1 Then
    If bMessage Then
      Focus txtIntOpér
      MsgBox2i "CR212"
      'MsgBox "Attention, problème de cohérence" & vbCrLf & vbCrLf & "Quand le secteur de prélèvement est 1 (Fabrication IAA), le code intervention opérateur doit être 1 (Préparation sur place).", vbExclamation, sNomApp
    End If
    bCheckNouveauxProduits = False
    Exit Function
  End If
    
  If cra.hSecteurPrél = 2 And cra.hInterventionOpérateur <> 2 Then
    If bMessage Then
      Focus txtIntOpér
      MsgBox2i "CR213"
      'MsgBox "Attention, problème de cohérence" & vbCrLf & vbCrLf & "Quand le secteur de prélèvement est 2 (Négoce non manipulé), le code intervention opérateur doit être 2 (Négoce non manipulé).", vbExclamation, sNomApp
    End If
    bCheckNouveauxProduits = False
    Exit Function
  End If
    
  If cra.hSecteurPrél = 3 And cra.hInterventionOpérateur = 2 Then
    If bMessage Then
      Focus txtIntOpér
      MsgBox2i "CR214"
      'MsgBox "Attention, problème de cohérence" & vbCrLf & vbCrLf & "Quand le secteur de prélèvement est 3 (Fabrication sur place/Négoce manipulé), le code intervention opérateur doit être 1 ou 3 (Préparation sur place ou Négoce manipulé).", vbExclamation, sNomApp
    End If
    bCheckNouveauxProduits = False
    Exit Function
  End If
  
  bCheckNouveauxProduits = True
End Function


' ===============================================================
' Conclusion
' Ne fait pas partie des champs modifiables, mais permet une initialisation
' identique à celle des autres champs

Private Function bCheckConclusion(bMessage As Boolean) As Boolean
  If Not IsNumeric(txtNumCon) Then
    txtNomCon = ""
    If bMessage Then
      Focus txtNumCon
      MsgBox2i "CO004", txtNumCon
      'MsgBox "Numéro de conclusion invalide.", vbExclamation, sNomApp
      txtNumCon.SetFocus
    End If
    bCheckConclusion = False
    Exit Function
  End If
  
  Dim p As Conclusion
  Set p = LireConclusion(txtNumCon)
  If p Is Nothing Then
    txtNomCon = ""
    If bMessage Then
      Focus txtNumCon
      MsgBox2i "CO005", txtNumCon
      'MsgBox "Conclusion inexistante.", vbExclamation, sNomApp
      txtNumCon.SetFocus
    End If
    bCheckConclusion = False
    Exit Function
  End If

  txtNomCon = p.con_libelle
  bCheckConclusion = True
End Function


' ===============================================================
' Contrôles complémentaires de dates

Private Function bAnalyseCommencée(iNumSérie As Variant) As Boolean
  If IsNumeric(iNumSérie) Then
    bAnalyseCommencée = iNumSérie <> 0 And iNumSérie <> -1
  Else
    bAnalyseCommencée = False
  End If
End Function

Private Function bCheckDate2() As Boolean
  If cra.dDateDebAnPrévue < cra.dDatePrél Then
    MsgBox2i "CR217"
    'MsgBox "Difficile d'avoir une date de début d'analyse antérieure à la date de prélèvement !", vbExclamation, sNomApp
    bCheckDate2 = False
    Exit Function
  End If
  
  ' Les tests d'analyses différées ne s'appliquent pas aux critères OGM
  If Not cra.sCritère Like "OGM*" Then
  
    ' Dans le cas d'un test(cadre de prélèvement 7), d'une analyse à la DLC (cadre de prélèvement 8),
    ' un test de stabilité (36), une analyse différée (37) ou un test de vieillissement (44), on vérifie que la date
    ' de début d'analyse prévue est dans les deux mois qui suivent la saisie
    If cra.hCadrePrél = 7 Or cra.hCadrePrél = 8 Or cra.hCadrePrél = 36 Or cra.hCadrePrél = 37 Or cra.hCadrePrél = 44 Then
      Dim dS As Date
      dS = cra.dDateSaisPH
      If dS = 0 Then dS = Now   ' Cas de la 1ère saisie avant enregistrement
      
      If cra.dDateDebAnPrévue > dS + 2 * 31 Then
        MsgBox2i "CR218"
        'MsgBox "Analyse à la DLC, test, test de stabilité ou analyse différée plus de 2 mois par rapport à la date de saisie ???" & vbCrLf & "Il n'est pas possible de saisir une analyse plus de deux mois d'avance.", vbExclamation, sNomApp
        bCheckDate2 = False
        If Not bShiftPressed Then Exit Function
      End If
      
      ' Message débrayé pour le cadre de prélèvement test
      If cra.dDateDebAnPrévue = Today And Not bAnalyseCommencée(cra.iNumSérie) And cra.hCadrePrél <> 7 Then
        MsgBox2i "CR219"
        'MsgBox "Avertissement: Analyse à la DLC, test de stabilité ou analyse différée avec une date de début d'analyse prévue pour aujourd'hui. Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
      End If
    Else    ' Tous les autres cadres de prélèvement
      If cra.dDateDebAnPrévue > cra.dDatePrél + 5 Then
        MsgBox2i "CR220"
        'MsgBox "Analyse «à délai normal» avec une date de début d'analyse prévue plus de 5 jours après la date de prélèvement ???" _
          & vbCrLf & vbCrLf & "Les cadres de prélèvement 7:«test», 8:«à la DLC», 36:«test de stabilité», 37:«analyse différée» et 44:"test de vieillissement" désactivent ce contrôle.", vbExclamation, sNomApp
        bCheckDate2 = False
        If Not bShiftPressed Then Exit Function
      End If
    
      If cra.dDateDebAnPrévue > Today + 5 Then
        MsgBox2i "CR221"
        'MsgBox "Analyse «à délai normal» avec une date de début d'analyse prévue dans plus de 5 jours ???" _
          & vbCrLf & vbCrLf & "Les cadres de prélèvement 7:«test», 8:«à la DLC», 36:«test de stabilité», 37:«analyse différée» et 44:«Test de vieillissement» désactivent ce contrôle.", vbExclamation, sNomApp
        bCheckDate2 = False
        If Not bShiftPressed Then Exit Function
      End If
    End If
  
  End If
  
  If cra.dDateDebAnPrévue > Today And cra.iNumFRT > 0 Then
    MsgBox2i "CR222", Format(cra.dDateDebAnPrévue, "dd/mm/yyyy")
    'MsgBox "Avertissement: La date de début d'analyse est différée, et il y a déjà un numéro de FRT (probablement suite à une modification de la date de début d'analyse, ou à l'attribution forcée d'un n° de FRT)." & vbCrLf & "Effacez le n° de FRT si vous voulez que l'échantillon soit sélectionné dans la liste des analyses à échéance du " & Format(cra.dDateDebAnPrévue, "dd/mm/yyyy") & ".", vbInformation, sNomApp
  End If
  
  bCheckDate2 = True
End Function


' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

' Onglet analyse

Private Sub DésactiveBoutonsGermes()
  fgGermes.Enabled = False
  fgBoîtes.Enabled = False
  btnAjouteGerme.Enabled = False
  btnEnlèveGerme.Enabled = False
  btnModifieGerme.Enabled = False
  btnAjouteBoîte.Enabled = False
  btnEnlèveBoîte.Enabled = False
  btnModifieBoîte.Enabled = False
End Sub


Private Sub InvalideGermes()
  DésactiveBoutonsGermes
  
  fgGermes.Rows = 1
  fgBoîtes.Rows = 1
  fgGermes.HighLight = flexHighlightNever
  fgBoîtes.HighLight = flexHighlightNever
  
  txtTitreCritère = ""
  txtVerCrit = ""
  txtRevivification = ""
  bdcClasseDoc.ListIndex = -1
  
  btnLireGermes.Enabled = True
  cra.iModeGermes = mgNonLu
  AfficheModeGermes
  
  txtStatusModif = ""
  cra.cStatusModif = Null
  AfficheStatusModif
  
  SetDirty
End Sub

Private Sub ChangeCouleurGerme(ByVal iCouleur As Long)
  Dim iCol As Integer
  
  For iCol = 0 To 4
    fgGermes.col = iCol
    fgGermes.CellBackColor = iCouleur
  Next
End Sub


Private Sub MajAffichageGerme(iRow As Integer)
  Dim g As GermeRecherché
  Set g = cra.cGermes(iRow)
  fgGermes.TextMatrix(iRow, 0) = g.iGerme & ":" & g.cStatus & g.sAbrégéLabo
End Sub


Private Sub AfficheGermes()
  txtTitreCritère = cra.sTitreCritère
  txtVerCrit = NV(cra.hVerCrit)
  bdcClasseDoc = NV(cra.sClasseDoc)

  fgGermes.Rows = MAXLIGNERES + 1
  fgGermes.Enabled = True
  fgGermes.HighLight = flexHighlightNever
  
  btnAjouteGerme.Enabled = True
  btnEnlèveGerme.Enabled = True
  btnModifieGerme.Enabled = True
  
  btnAjouteBoîte.Enabled = True
  
  Dim g As GermeRecherché
  Dim l As Integer
  l = 1
  For Each g In cra.cGermes

    fgGermes.TextMatrix(l, 0) = g.iGerme & ":" & g.cStatus & g.sAbrégéLabo
    fgGermes.TextMatrix(l, 1) = g.sMéthode
    fgGermes.TextMatrix(l, 2) = g.sUnité
    fgGermes.TextMatrix(l, 3) = sFormateRésultat(g.m)
    fgGermes.TextMatrix(l, 4) = sFormateRésultat(g.s)
    
    AfficheRésultats l, g
    
    ' Fond rouge pour les germes sans boîte
    If g.cBoîtes.Count = 0 Then
      fgGermes.Row = l
      ChangeCouleurGerme RGB(255, 200, 200)   ' Rouge
    End If

    l = l + 1
  Next
  
  ' Les deux bocs suivants étaient en commentaire
  ' --> 1er germe sélectionné sans affichage des boîtes...
  ' Remis en service le 5/2/00 PV
  
  ' On remet la sélection sur la première ligne
  fgGermes.Row = 0
  fgGermes.col = 0
  fgGermes.ColSel = 4
  fgGermes.HighLight = flexHighlightAlways
  
  ' On affiche les boîtes
  fgBoîtes.Enabled = True
  fgBoîtes.HighLight = flexHighlightAlways
  fgGermes_SelChange
  
  AfficheModeGermes
End Sub


Private Sub btnLireGermes_GotFocus()
  SetLib sbStatus, "SimpleText", "RAbtnLG.tag"
  'sbStatus.SimpleText = "Cliquez sur ce bouton pour générer la liste des germes et des boîtes."
End Sub


Private Function bLireGermes() As Boolean
  Dim iVerCrit As Integer
  
  If txtVerCrit = "" Then
    iVerCrit = 0
  Else
    iVerCrit = CInt(txtVerCrit)
  End If
  
  Dim sMM1 As String
  sMM1 = cboMMéthode
  
  Dim cr As RA
  Set cr = LireCritèreDilutions(txtCritère, iVerCrit, sMM1, txtOptionsLabo)
  
  If Not cr Is Nothing Then
    bLireGermes = True
    
    ' On copie la liste des germes et des dilutions de la structure cr dans la
    ' structure cra
    Set cra.cGermes = Nothing
    Set cra.cGermes = cr.cGermes
    cra.hVerCrit = cr.hVerCrit
    cra.sTitreCritère = cr.sTitreCritère
    cra.iRevivification = cr.iRevivification
    cra.hClé2 = cr.hClé2
    If txtCritère <> "W6" Then
      cra.sClasseDoc = cr.sClasseDoc
    End If
    
    cra.cStatusModif = "N"            ' Critère original
    AfficheStatusModif

    ' Fusion des options du critère dans optionslabo
    ' Uniquement si le critère a changé, de façon à éviter les conflits de double modification
    ' sur les options manuelles / issues du critère, comme l'option D
    Static sCacheCritère As String
    If txtCritère <> sCacheCritère Then
      sCacheCritère = txtCritère
      Dim sOptions As String
      sOptions = txtOptionsLabo       ' On part de ce qui est affiché -- vérifier si c'est toujours Ok
      RetireLettres sOptions, "DRN"
      AjouteLettres sOptions, cr.sOptionsLabo
      cra.sOptionsLabo = sOptions
      txtOptionsLabo = sOptions
    End If
    
    cra.iModeGermes = cr.iModeGermes
    If cra.iModeBoîtes <> mbProblème Then
      cra.iModeBoîtes = mbModifié
      AfficheModeBoîtes
    Else
      ' En cas de problème sur la liste des boîtes, on efface la liste des boîtes
      Dim g As GermeRecherché
      For Each g In cra.cGermes
        Set g.cBoîtes = Nothing
      Next
    End If
    
    ' Mise à jour de l'affichage
    AfficheGermes
    txtVerCrit = cr.hVerCrit
    txtTitreCritère = cr.sTitreCritère
    txtRevivification = cr.iRevivification
    If txtCritère <> "W6" Then
      bdcClasseDoc = cr.sClasseDoc
    End If
    
    ' Quelques automatismes spéciaux (PV 13/1/01)
    ' Huiles
    If StrComp(cr.sClasseDoc, "Hu", vbTextCompare) = 0 Then
      If txtTraitéPar = "" Then cra.iTraitéPar = 1: txtTraitéPar = "1"
    End If
    If StrComp(cr.sClasseDoc, "Ch", vbTextCompare) = 0 Then
      If txtTraitéPar = "" Then cra.iTraitéPar = 2: txtTraitéPar = "2"
    End If
    If StrComp(cr.sClasseDoc, "BM", vbTextCompare) = 0 Then
      If txtTraitéPar = "" Then cra.iTraitéPar = 3: txtTraitéPar = "3"
    End If
    
    
    fgBoîtes.Enabled = True
    btnLireGermes.Enabled = False
  Else
    bLireGermes = False
  End If

End Function


Private Sub btnLireGermes_Click()
  ' Contrôles élémentaires
  If txtCritère = "" Then
    MsgBox2i "CR223"
    'MsgBox "Saisissez le critère !", vbExclamation, sNomApp
    Exit Sub
  End If
  If cboMMéthode = "" Then
    MsgBox2i "CR224"
    'MsgBox "Saisissez la métaméthode !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  ' On désactive le bouton de lecture des germes pour éviter une lecture pendant la recherche
  btnLireGermes.Visible = False
    
  ' Par sécurité, on désactive les contrôles qui ont pour effet d'invalider la liste des germes
  txtCritère.Locked = True  ' Pas enabled pour ne pas empêcher l'arrivée du focus !
  cboMMéthode.Enabled = False
  txtOptionsLabo.Enabled = False
  
  If Not bLireGermes Then
    MsgBox2i "CR225"
    'MsgBox "Échec à la lecture du critère !", vbExclamation, sNomApp
  End If
  
  ' On réactive les contrôles "à risque"
  btnLireGermes.Visible = True
  txtCritère.Locked = False
  cboMMéthode.Enabled = True
  txtOptionsLabo.Enabled = True
End Sub


' ===============================================================
' Critère

Private Sub txtCritère_Change()
  If bModeChargement Then Exit Sub
  
  InvalideGermes
  
  ' On convertit en majuscules
  If txtCritère <> UCase(txtCritère) Then
    Dim sStart As Integer, sLength As Integer
    sStart = txtCritère.SelStart
    sLength = txtCritère.SelLength
    txtCritère = UCase(txtCritère)
    txtCritère.SelStart = sStart
    txtCritère.SelLength = sLength
  End If
  
  ' Petite verrue pour le critère TIAC, on impose la méthode AFNOR
  If txtCritère = "TIAC" Then cboMMéthode = "A"
  
  If txtCritère = "W8" Or txtCritère = "W9" Or txtCritère = "W11" Or txtCritère = "W12" Or txtCritère = "W20" Or txtCritère = "W21" Or txtCritère = "W22" Then
    If InStr(txtOptionsEdition, "L") = 0 Then txtOptionsEdition = txtOptionsEdition & "L"
  Else
    Dim p As Integer
    p = InStr(txtOptionsEdition, "L")
    If p <> 0 Then txtOptionsEdition = Left(txtOptionsEdition, p - 1) & Mid(txtOptionsEdition, p + 1)
  End If
End Sub


Private Sub txtCritère_GotFocus()
  AutoSelect txtCritère
  SetLib sbStatus, "SimpleText", "RAtxtCritère.tag"
  'sbStatus.SimpleText = "Entrez le critère d'analyse requis."
End Sub

Private Function bCheckCritère(bMessage As Boolean) As Boolean
  If txtCritère = "" Then
    If bMessage Then
      Focus txtCritère
      MsgBox2i "CR226"
      'MsgBox "Le critère est obligatoire.", vbExclamation, sNomApp
    End If
    bCheckCritère = False
    Exit Function
  End If
  
  If cra.iModeGermes = mgNonLu Then
    If Not bLireGermes Then
      If bMessage Then
        Focus txtCritère
        MsgBox2i "CO005", txtCritère
        'MsgBox "Critère inexistant.", vbExclamation, sNomApp
        txtCritère.SetFocus
      End If
      bCheckCritère = False
      Exit Function
    End If
    
  End If
  
  ' Mise à jour de la structure de données
  cra.sCritère = txtCritère
  
  ' Avertissement Listeria…
  If InStr(cra.sOptionsEdition, "L") <> 0 And txtCritère <> "W8" And txtCritère <> "W9" And txtCritère <> "W11" And txtCritère <> "W12" And txtCritère <> "W20" And txtCritère <> "W21" And txtCritère <> "W22" Then
    If bMessage Then
      MsgBox2i "CR228"
      'MsgBox "Avertissement: L'option d'édition L (Listéria) est sélectionnée, alors que le critère n'est ni W8, ni W9, ni W11, ni W12, ni W20, ni W21, ni W22. Vérifiez que c'est normal.", vbInformation, sNomApp
    End If
  End If
  
  bCheckCritère = True
End Function

Private Sub txtCritère_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtCritère.Locked = False Then MsgBox2i "CR153"
                                                                        'MsgBox "Perdu !  Il n'y a pas de mécanisme de recherche de critère !" & vbCrLf & "Il va falloir saisir le critère «à la main»…", vbExclamation, sNomApp
  If KeyCode = vbKeyF5 And Shift = 0 And txtCritère.Locked = False Then txtCritère = craF5.sCritère
End Sub


' ===============================================================
' Classe de document

Private Sub bdcClasseDoc_GotFocus()
  SetLib sbStatus, "SimpleText", "RAbdcClasse.tag"
End Sub

Private Sub bdcClasseDoc_LostFocus()
  bdcClasseDoc.Synchronise
End Sub

Private Sub bdcClasseDoc_Change()
  SetDirty
End Sub

Private Sub bdcClasseDoc_Click()
  SetDirty
End Sub

Private Function bCheckClasseDoc(bMessage As Boolean) As Boolean
  If bdcClasseDoc.ListIndex < 0 Then
    If bMessage Then
      bCheckClasseDoc = False
      Focus bdcClasseDoc
      MsgBox2i "CR229x"
      'Classe invalide, choisissez un élément de la liste.
    End If
    Exit Function
  End If
  
  If StrComp(bdcClasseDoc, "Ch", vbTextCompare) = 0 And cSystèmeCA Like "[CTH]" Then
    If bMessage Then
      bCheckClasseDoc = False
      Focus bdcClasseDoc
      MsgBox2i "CR229y"
      'Pas de labo de chimie sur Cergy, Roanne, La Rochelle: La classe de document Ch est invalide.
    End If
    Exit Function
  End If
  
  ' Mise à jour de la structure de données
  cra.sClasseDoc = bdcClasseDoc

  bCheckClasseDoc = True
End Function

Private Sub bdcClasseDoc_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And bdcClasseDoc.Locked = False Then
    bdcClasseDoc = craF5.sClasseDoc
  End If
End Sub


' ===============================================================
' Méthode d'analyse

Private Sub cboMMéthode_GotFocus()
  SetLib sbStatus, "SimpleText", "RAtxtMM.tag"
  'sbStatus.SimpleText = "Entrez la méthode d'analyse, F4 pour ouvrir la liste."
End Sub

Private Sub cboMMéthode_LostFocus()
  cboMMéthode.Synchronise
End Sub

' Souris
Private Sub cboMMéthode_Click()
  If bModeChargement Then Exit Sub
  InvalideGermes
End Sub

' Clavier
Private Sub cboMMéthode_Change()
  If bModeChargement Then Exit Sub
  InvalideGermes
End Sub

Private Function bCheckMMéthode(bMessage As Boolean) As Boolean
  If cboMMéthode = "" Or cboMMéthode < "A" Or cboMMéthode > "Z" Then
    If bMessage Then
      bCheckMMéthode = False
      Focus cboMMéthode
      MsgBox2i "CR229"
      'MsgBox "La méta-méthode est obligatoire.", vbExclamation, sNomApp
    End If
    Exit Function
  End If
  
  ' Mise à jour de la structure de données
  cra.cMMéthode = cboMMéthode

  bCheckMMéthode = True
End Function

Private Sub cboMMéthode_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And cboMMéthode.Locked = False Then
    cboMMéthode = craF5.cMMéthode
  End If
End Sub


' ===============================================================
' Options du labo

Private Sub SaisieOptionsLabo()
  Dim o As String
  o = frmOptionsRA.OptionsLabo(txtOptionsLabo)
  If o <> "*" Then
    txtOptionsLabo = o
    txtOptionsLabo.SelStart = 0
    txtOptionsLabo.SelLength = 99
  End If
End Sub

Private Sub txtOptionsLabo_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtOptionsLabo.Locked = False Then SaisieOptionsLabo
  If KeyCode = vbKeyF5 And Shift = 0 And txtOptionsLabo.Locked = False Then txtOptionsLabo = craF5.sOptionsLabo
  If KeyCode = vbKeyF4 And Shift = 1 And cra.iMode = meModificationSpéciale Then SaisieOptionsLabo
End Sub

Private Sub txtOptionsLabo_DblClick()
  If txtOptionsLabo.Locked = False Then SaisieOptionsLabo
End Sub

Private Sub txtOptionsLabo_GotFocus()
  AutoSelect txtOptionsLabo
  SetLib sbStatus, "SimpleText", "RAtxtOptL.tag"
  'sbStatus.SimpleText = "Entrez les options du labo (options d'analyse), F4 pour le détail."
End Sub

Private Sub txtOptionsLabo_Change()
  Static sOldOptions As String
  
  If bModeChargement Or cra.iModeGermes = mgNonLu Then
    sOldOptions = txtOptionsLabo
    Exit Sub
  End If
  
  ' Les changements d'options U, S et C nécessitent une relecture du critère
  If Sgn(InStr(sOldOptions, "U")) <> Sgn(InStr(txtOptionsLabo, "U")) Or Sgn(InStr(sOldOptions, "S")) <> Sgn(InStr(txtOptionsLabo, "S")) Or Sgn(InStr(sOldOptions, "C")) <> Sgn(InStr(txtOptionsLabo, "C")) Then
    Dim iRéponse As VbMsgBoxResult
    Dim sMsg As String
    sMsg = sGetIntlLib("CR230", "Question 230")
    iRéponse = MsgBox(sMsg, vbQuestion + vbYesNo, sNomApp)
    'iRéponse = MsgBox("Attention, vous avez modifié une des options U, S ou C. Cela entraînera une relecture du critère, et la perte des modifications manuelles qui ont éventuellement été apportées à la liste des germes et/ou des boîtes." & vbCrLf & vbCrLf & _
      "Voulez-vous continuer ?", vbQuestion + vbYesNo, sNomApp)
    If iRéponse = vbNo Then
      bModeChargement = True
      txtOptionsLabo = sOldOptions
      bModeChargement = False
      Exit Sub
    End If
    
    InvalideGermes
  End If
  
  sOldOptions = txtOptionsLabo
  SetDirty
End Sub

Private Function bCheckOptionsLabo(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.sOptionsLabo = txtOptionsLabo
  
  If InStr(cra.sOptionsLabo, "N") <> 0 And IsNull(cra.dTemp) Then
    MsgBox2i "CR231"
    'MsgBox "Avertissement: L'option de critère N (à revivifier pour les échantillons de température inférieure ou égale à -10°C) est positionnée, mais la température produit n'est pas définie." & vbCrLf & vbCrLf & _
      "Prévenez le labo, afin qu'il détermine si l'échantillon doit être revivifié ou non, faute de quoi, l'échantillon pourra ne pas être traité correctement.", vbInformation, sNomApp
  End If
  
  bCheckOptionsLabo = True
End Function

' ===============================================================
' Case à cocher IE

Private Sub chkIE_GotFocus()
  SetLib sbStatus, "SimpleText", "RAtxtchkIE.tag"
  'sbStatus.SimpleText = "Cocher dans le cas d'une IE."
End Sub

Private Function bCheckIE(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.bIE = IIf(chkIE = vbChecked, True, False)
  
  ' On vérifie la cohérence avec le cadre de prélèvement
  ' C'est peut-être un test à assouplir (possibilité de passer outre)
  If cra.bIE And cra.hCadrePrél <> 3 Then
    MsgBox2i "CR232"
    'MsgBox "Attention ! Le cadre de prélèvement sélectionné n'est pas de type intervention exceptionnelle, alors que la case IE est cochée…" & vbCrLf & vbCrLf & "Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
  End If
  
  If Not cra.bIE And cra.hCadrePrél = 3 Then
    MsgBox2i "CR233"
    'MsgBox "Attention ! Le cadre de prélèvement sélectionné est de type intervention exceptionnelle, alors que la case IE n'est pas cochée…" & vbCrLf & vbCrLf & "Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
  End If

  bCheckIE = True
End Function

Private Sub chkIE_Click()
  SetDirty
End Sub


' ===============================================================
' Case à cocher Fax

Private Sub chkFax_GotFocus()
  SetLib sbStatus, "SimpleText", "RAtxtchkFax.tag"
  'sbStatus.SimpleText = "Cocher quand les résultats doivent être transmis par fax."
End Sub

Private Function bCheckFax(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.bFax = IIf(chkFax = vbChecked, True, False)
  
  bCheckFax = True
End Function

Private Sub chkFax_Click()
  SetDirty
End Sub


' ===============================================================
' Case à cocher Échantillon congelé

Private Sub chkCongelé_GotFocus()
  SetLib sbStatus, "SimpleText", "RAtxtchkCong.tag"
  'sbStatus.SimpleText = "Cocher si l'échantillon est congelé."
End Sub

Private Function bCheckCongelé(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.bEchCongelé = IIf(chkCongelé, True, False)
  
  bCheckCongelé = True
End Function

Private Sub chkCongelé_Click()
  SetDirty
End Sub



' ===============================================================
' Remarques labo

Private Sub txtRemarquesLabo_GotFocus()
  AutoSelect txtRemarquesLabo
  SetLib sbStatus, "SimpleText", "RAtxtRemL.tag"
  'sbStatus.SimpleText = "Entrez un commentaire libre. Le texte qui suit un ! est imprimé sur l'exemplaire client."
End Sub

Private Function bCheckRemarquesLabo(bMessage As Boolean) As Boolean
  ' Mise à jour de la structure de données
  cra.sRemarques = txtRemarquesLabo
  
  bCheckRemarquesLabo = True
End Function

Private Sub txtRemarquesLabo_Change()
  SetDirty
End Sub

Private Sub txtRemarquesLabo_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtRemarquesLabo.Locked = False Then txtRemarquesLabo = craF5.sRemarques
End Sub


' ===============================================================
' Prix spécifique

Private Sub txtPrixSpécifique_GotFocus()
  AutoSelect txtPrixSpécifique
  SetLib sbStatus, "SimpleText", "RAtxtPrix.tag"
End Sub

Private Function bCheckPrixSpécifique(bMessage As Boolean) As Boolean
  If txtPrixSpécifique <> "" Then
    If Not IsNumeric(txtPrixSpécifique) Then
      If bMessage Then
        bCheckPrixSpécifique = False
        Focus txtPrixSpécifique
        MsgBox2i "CR163P"
      End If
      Exit Function
    End If
  End If
  
  ' Mise à jour de la structure de données
  If txtPrixSpécifique = "" Then
    cra.dPrix = Null
  Else
    cra.dPrix = CSng(txtPrixSpécifique)
  End If
  
  bCheckPrixSpécifique = True
End Function

Private Sub txtPrixSpécifique_Change()
  SetDirty
End Sub

Private Sub txtPrixSpécifique_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtPrixSpécifique.Locked = False Then txtPrixSpécifique = NV(craF5.dPrix)
End Sub


' ===============================================================
' Devise

Private Sub bdcDevise_GotFocus()
  AutoSelect bdcDevise
  SetLib sbStatus, "SimpleText", "RAbdcDevise.tag"
End Sub

Private Sub bdcDevise_LostFocus()
  bdcDevise.Synchronise
End Sub

Private Function bCheckDevise(bMessage As Boolean) As Boolean
  ' On râle si prix sans devise, devise sans prix, ou devise inconnue
  If bdcDevise.ListIndex < 0 Then bdcDevise.Synchronise
  If (IsNull(cra.dPrix) And bdcDevise.ListIndex <> 0) Or bdcDevise.ListIndex < 0 Or ((Not IsNull(cra.dPrix)) And bdcDevise.ListIndex = 0) Then
    If bMessage Then
      bCheckDevise = False
      Focus bdcDevise
      MsgBox2i "CR163P"
    End If
    Exit Function
  End If
  
  ' Mise à jour de la structure de données
  If Trim(bdcDevise) = "" Then
    cra.cDevise = ""
  Else
    cra.cDevise = bdcDevise
  End If
  
  bCheckDevise = True
End Function

Private Sub bdcDevise_Change()
  SetDirty
End Sub

Private Sub bdcDevise_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And bdcDevise.Locked = False Then bdcDevise = craF5.cDevise
End Sub


' ===============================================================
' Traité par

Private Sub txtTraitéPar_GotFocus()
  AutoSelect txtTraitéPar
  SetLib sbStatus, "SimpleText", "RAtxtTraPar.tag"
  'sbStatus.SimpleText = "Entrez le code de traitement d'échantillon. 1 indique que l'échantillon n'est pas analysé."
End Sub

Private Function bCheckTraitéPar(bMessage As Boolean) As Boolean
  If txtTraitéPar <> "" And txtTraitéPar <> "1" And txtTraitéPar <> "2" And txtTraitéPar <> "3" Then
    MsgBox2i "CR234"
    'MsgBox "Les seules valeurs permises dans le champ traitépar sont 1 et vide.", vbExclamation, sNomApp
    bCheckTraitéPar = False
    Exit Function
  End If
  
  If (InStr(cra.sOptionsEdition, "T") <> 0 Or InStr(cra.sOptionsLabo, "T") <> 0) And txtTraitéPar <> "1" Then
    MsgBox2i "CR235"
    'MsgBox "Problème de cohérence: l'option T (traité par le SL) est positionnée dans les options labo ou les options d'édition, mais le champ Traité par est vide, ce qui indique que l'analyse est traitée par le labo…", vbExclamation, sNomApp
    bCheckTraitéPar = False
    Exit Function
  End If
  
  ' Mise à jour de la structure de données
  cra.iTraitéPar = VN(txtTraitéPar)
  
  bCheckTraitéPar = True
End Function

Private Sub txtTraitéPar_Change()
  SetDirty
End Sub

Private Sub txtTraitéPar_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtTraitéPar.Locked = False Then txtTraitéPar = NV(craF5.iTraitéPar)
End Sub


' ===============================================================
' Date de début d'analyse prévue

Private Sub txtDateDebAnPrévue_GotFocus()
  AutoSelect txtDateDebAnPrévue
  SetLib sbStatus, "SimpleText", "RAtxtDDAP.tag"
  'sbStatus.SimpleText = "Entrez la date d'analyse prévue, en principe le jour même, ou la DLC pour les analyses à la DLC."
End Sub

Private Sub txtDateDebAnPrévue_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDateDebAnPrévue.Locked = False Then calendrier txtDateDebAnPrévue
  If KeyCode = vbKeyF5 And Shift = 0 And txtDateDebAnPrévue.Locked = False Then txtDateDebAnPrévue.DateSaisie = NV(craF5.dDateDebAnPrévue)
End Sub

Private Sub txtDateDebAnPrévue_DblClick()
  If Not txtDateDebAnPrévue.Locked Then calendrier txtDateDebAnPrévue
End Sub

Private Sub txtDateDebAnPrévue_Change()
  SetDirty
End Sub

Private Function bCheckDateDebAnPrévue(bMessage As Boolean) As Boolean
  If txtDateDebAnPrévue.DateSaisie = "" Then
    If bMessage Then
      Focus txtDateDebAnPrévue, "Analyse"
      MsgBox2i "CR236"
      'MsgBox "La date de début d'analyse prévue est obligatoire.", vbExclamation, sNomApp
    End If
    bCheckDateDebAnPrévue = False
    Exit Function
  End If

  Dim d
  bCheckDateDebAnPrévue = bCheckDate("Analyse", txtDateDebAnPrévue, d, "Date de début d'analyse prévue", bMessage)
  If IsEmpty(d) Then Exit Function      ' Date invalide

  If IsDate(d) Then
    If d = dAbsence Then
      If bMessage Then
        Focus txtDateDebAnPrévue, "Analyse"
        MsgBox2i "CR237"
        'MsgBox "«ABSENCE» est une date de début d'analyse prévue invalide.", vbExclamation, sNomApp
      End If
      bCheckDateDebAnPrévue = False
      Exit Function
    End If
    
    If Weekday(d) = vbSunday Then
      If bMessage Then
        MsgBox2i "CR238"
        'MsgBox "Avertissement: La date de début d'analyse prévue tombe un dimanche. Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
      End If
    End If
    
    ' Test débrayé pour La Rochelle
    If Weekday(d) = vbMonday And cSystèmeCA <> "T" And cSystèmeCA <> "C" Then
      If bMessage Then
        MsgBox2i "CR239"
        'MsgBox "Avertissement: La date de début d'analyse prévue tombe un lundi. Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
      End If
    End If
    
    Dim sFête As String
    If IsJourFérié(d, sFête) Then
      If bMessage Then
        MsgBox2i "CR240", sFête
        'MsgBox "Avertissement: La date de début d'analyse prévue tombe un jour férié (" & sFête & "). Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
      End If
    End If
  End If
  
  cra.dDateDebAnPrévue = d
End Function


' ===============================================================
' Liste des germes

Private Function bCheckGermes(bMessage As Boolean) As Boolean
  If btnLireGermes.Visible And btnLireGermes.Enabled Then
    bCheckGermes = bLireGermes
  Else
    bCheckGermes = True
  End If
  
  ' Cas absurde: pas de germes !
  If cra.cGermes.Count = 0 Then
    MsgBox2i "CR241"
    'MsgBox "Problème: RA sans aucun germe !", vbExclamation, sNomApp
    bCheckGermes = False
    Exit Function
  End If
  
  ' On signale s'il y a un germe sans boîtes
  Dim g As GermeRecherché
  Dim bGermeSansBoîtes As Boolean
  bGermeSansBoîtes = False
  For Each g In cra.cGermes
    If g.cBoîtes.Count = 0 Then
      bGermeSansBoîtes = True
      Exit For
    End If
  Next
  
  If bGermeSansBoîtes And InStr(cra.sOptionsLabo, "D") = 0 Then
    MsgBox2i "CR242"
    'MsgBox "Avertissement: Le RA contient des germes sans boîtes (germes affichés sur fond rouge)." & vbCrLf & "Assurez-vous que c'est voulu, sinon le labo n'aura ni boîtes ni étiquettes pour ce germe.", vbInformation, sNomApp
    DémonJournalUnix "ContrôleCRA", "Avertissement", "RA avec germes sans boîtes Ref=" & cra.sRef
  End If
End Function

Private Sub fgGermes_GotFocus()
  sbStatus.SimpleText = ""
  fgGermes.HighLight = flexHighlightAlways
  fgGermes.BackColorSel = &H8000000D
End Sub

Private Sub fgGermes_LostFocus()
  fgGermes.BackColorSel = &H808080
End Sub

Private Sub fgGermes_SelChange()
  fgGermes.RowSel = fgGermes.Row
  
  fgBoîtes.Rows = 1
  fgBoîtes.HighLight = flexHighlightNever
  btnEnlèveBoîte.Enabled = False
  btnModifieBoîte.Enabled = False
  
  If fgGermes.Row = 0 Or fgGermes.TextMatrix(fgGermes.Row, 0) = "" Then
    btnAjouteBoîte.Enabled = False
    fgBoîtes.Enabled = False
  Else
    fgBoîtes.Rows = 1 + cra.cGermes(fgGermes.Row).cBoîtes.Count
  
    Dim b As Boîte, g As GermeRecherché
    Set g = cra.cGermes(fgGermes.Row)
    Dim i As Integer
    i = 1
    For Each b In g.cBoîtes
      AfficheBoîte i, b
      i = i + 1
    Next
    btnAjouteBoîte.Enabled = True
    fgBoîtes.Enabled = True
    
    ' 0 ou 1 ligne dans le flexgrid + PgPrec --> espace de pile insuffisant !
    If fgBoîtes.Rows < 3 Then fgBoîtes.Rows = 3
  End If
End Sub


Private Sub btnEnlèveGerme_Click()
  If fgGermes.TextMatrix(fgGermes.Row, 0) <> "" Then
    cra.cGermes.Remove fgGermes.Row
    fgGermes.RemoveItem fgGermes.Row
    fgGermes.Rows = MAXLIGNERES + 1
    fgGermes_SelChange
    
    fgRésultat.RemoveItem fgGermes.Row
    fgRésultat.Rows = MAXLIGNERES + 1

    ' Mise à jour et affichage du mode en mémoire
    cra.cStatusModif = "O"              ' Critère modifié
    AfficheStatusModif
    
    cra.iModeGermes = mgModifié
    AfficheModeGermes
    If cra.iModeBoîtes = mbLu Then
      cra.iModeBoîtes = mbModifié
      AfficheModeBoîtes
    End If
    SetDirty
  End If
End Sub


Private Sub ModifieGerme()
  If bBlocageEnCours Then Beep: Exit Sub
  
  ' Cas de la ligne vide
  If fgGermes.TextMatrix(fgGermes.Row, 0) = "" Then Exit Sub
  
  Dim sMM1 As String
  sMM1 = cboMMéthode
  
  Dim g As GermeRecherché
  Set g = frmAjoutGerme.Modifie(sMM1, cra.cGermes(fgGermes.Row))
  If Not g Is Nothing Then
    cra.cGermes(fgGermes.Row).sUnité = g.sUnité
    cra.cGermes(fgGermes.Row).m = g.m
    cra.cGermes(fgGermes.Row).s = g.s
    cra.cGermes(fgGermes.Row).sSensibilité = g.sSensibilité
    cra.cGermes(fgGermes.Row).dPrix = g.dPrix
    cra.cGermes(fgGermes.Row).cDevise = g.cDevise
    
    ' On met à jour l'affichage de la liste des germes
    fgGermes.TextMatrix(fgGermes.Row, 2) = g.sUnité
    fgGermes.TextMatrix(fgGermes.Row, 3) = g.m
    fgGermes.TextMatrix(fgGermes.Row, 4) = g.s
    
    ' Si germe 7 (salmonelles), on reporte l'unité en tant que légende des boîtes
    If Abs(g.iGerme) = 7 Then
      Dim b As Boîte
      For Each b In cra.cGermes(fgGermes.Row).cBoîtes
        b.boi_legende = g.sUnité
      Next
      fgGermes_SelChange    ' Réaffiche la liste des boîtes
    End If
    
    ' On met à jour l'affichage du résultat
    fgRésultat.TextMatrix(fgGermes.Row, 1) = sFormateRésultat(g.sRésultat)
    
    ' Mise à jour et affichage du mode en mémoire
    cra.cStatusModif = "O"              ' Critère modifié
    AfficheStatusModif
    
    cra.iModeGermes = mgModifié
    cra.cGermes(fgGermes.Row).bGermeModifié = True
    AfficheModeGermes
    SetDirty
  End If
End Sub


Sub AjouteGerme()
  Dim iRang As Integer
  
  For iRang = 1 To MAXLIGNERES
    If fgGermes.TextMatrix(iRang, 0) = "" Then Exit For
  Next
  If iRang > MAXLIGNERES Then
    MsgBox2i "CR243"
    'MsgBox "Nombre maximum de germes atteint !", vbExclamation, sNomApp
    Exit Sub
  End If

  Dim g As GermeRecherché
  Dim sMM1 As String
  sMM1 = cboMMéthode

  Set g = frmAjoutGerme.Ajout(sMM1)
  If Not g Is Nothing Then
    Dim i As Integer
    For i = 1 To iRang - 1
      If Val(fgGermes.TextMatrix(i, 0)) = g.iGerme Then
        MsgBox2i "CR244", g.iGerme
        'MsgBox "Le germe " & g.iGerme & " est déjà présent dans la liste !", vbExclamation, sNomApp
        Exit Sub
      End If
    Next
    
    ' On l'ajoute à la collection
    cra.cGermes.AddGermeRecherché g
    
    ' On met à jour l'affichage
    fgGermes.TextMatrix(iRang, 0) = g.iGerme & ":" & g.cStatus & g.sAbrégéLabo
    fgGermes.TextMatrix(iRang, 1) = g.sMéthode
    fgGermes.TextMatrix(iRang, 2) = g.sUnité
    fgGermes.TextMatrix(iRang, 3) = g.m
    fgGermes.TextMatrix(iRang, 4) = g.s
    
    ' On met à jour les résultats
    AfficheRésultats iRang, g
    
    ' Si nécessaire, on réaffiche la liste des boîtes
    If iRang = fgGermes.Row Then fgGermes_SelChange
    
    ' Mise à jour et affichage du mode en mémoire
    cra.cStatusModif = "O"              ' Critère modifié
    AfficheStatusModif
    
    cra.iModeGermes = mgModifié
    AfficheModeGermes
    If cra.iModeBoîtes = mbLu Then
      cra.iModeBoîtes = mbModifié
      AfficheModeBoîtes
    End If
    SetDirty
  End If
  
End Sub

Private Sub fgGermes_DblClick()
  If btnModifieGerme.Enabled And btnModifieGerme.Visible Then
    ModifieGerme
  Else
    If cra.iMode = meModificationRéduite And bShiftPressed Then ModifieGerme
  End If
End Sub

Private Sub btnModifieGerme_Click()
  ModifieGerme
End Sub

Private Sub btnAjouteGerme_Click()
  If bBlocageEnCours Then Beep: Exit Sub
  AjouteGerme
End Sub
  
  
' Focus
Private Sub btnAjouteGerme_GotFocus()
  sbStatus.SimpleText = ""
End Sub
 
Private Sub btnEnlèveGerme_GotFocus()
  sbStatus.SimpleText = ""
End Sub

Private Sub btnModifieGerme_GotFocus()
  sbStatus.SimpleText = ""
End Sub



' ===============================================================
' Liste des boîtes

Private Function bCheckBoîtes(bMessage As Boolean) As Boolean
  ' Si la liste des boîtes est vide on vérifie que l'option D est positionnée
  ' On ne tient pas compte du champ TraitéPar
  ' Si les données sont incohérentes, on n'exige pas l'option D.
  
  Dim g As GermeRecherché
  Dim iNbBoîtes As Integer
  For Each g In cra.cGermes
    iNbBoîtes = iNbBoîtes + g.cBoîtes.Count
  Next
  If iNbBoîtes = 0 And InStr(cra.sOptionsLabo, "D") = 0 And cra.iModeBoîtes <> mbProblème Then
    Dim iRep As VbMsgBoxResult
    Dim sMsg As String
    sMsg = sGetIntlLib("CR245", "Question 245")
    iRep = MsgBox(sMsg, vbQuestion + vbYesNo + vbDefaultButton2, sNomApp)
    'iRep = MsgBox("Pas de boîtes, et l'option labo D n'est pas positionnée !" & vbCrLf & vbCrLf & "Voulez-vous continuer ?", vbQuestion + vbYesNo + vbDefaultButton2, sNomApp)
    If iRep = vbNo Then
      bCheckBoîtes = False
      Exit Function
    End If
  End If
  
  bCheckBoîtes = True
End Function


Private Sub fgBoîtes_GotFocus()
  sbStatus.SimpleText = ""
  fgBoîtes.HighLight = flexHighlightAlways
  btnEnlèveBoîte.Enabled = True
  btnModifieBoîte.Enabled = True
  fgBoîtes.BackColorSel = &H8000000D
End Sub

Private Sub fgBoîtes_LostFocus()
  fgBoîtes.BackColorSel = &H808080
End Sub

Private Sub fgBoîtes_SelChange()
  fgBoîtes.RowSel = fgBoîtes.Row
End Sub

Private Sub btnEnlèveBoîte_Click()
  If fgBoîtes.Rows > 1 Then
    ' Protection ligne vide
    If fgBoîtes.TextMatrix(fgBoîtes.Row, 0) <> "" Then
      cra.cGermes(fgGermes.Row).cBoîtes.Remove fgBoîtes.Row
      cra.cGermes(fgGermes.Row).bGermeModifié = True
      If fgBoîtes.Rows = 2 Then
        fgBoîtes.Rows = 1
        fgBoîtes.HighLight = flexHighlightNever
        btnEnlèveBoîte.Enabled = False
        btnModifieBoîte.Enabled = False
      Else
        fgBoîtes.RemoveItem fgBoîtes.Row
        ' 1 ligne dans le flexgrid + PgPrec --> espace de pile insuffisant !
        If fgBoîtes.Rows = 2 Then fgBoîtes.Rows = 3
      End If
    End If
    
    ' Mise à jour de l'affichage
    If cra.cGermes(fgGermes.Row).cBoîtes.Count = 0 Then
      ChangeCouleurGerme RGB(255, 200, 200)   ' Rouge
    End If
    MajAffichageGerme fgGermes.Row
   
    ' On met à jour l'indicateur d'état
    cra.cStatusModif = "O"              ' Critère modifié
    AfficheStatusModif
    
    cra.iModeBoîtes = mbModifié
    AfficheModeBoîtes
    SetDirty
  End If
End Sub

Private Sub btnAjouteBoîte_Click()
  Dim b As Boîte

  ' Milieu par défaut: le  même que pour la première boîte si elle existe
  Dim iMilieuDéfaut As Integer
  If cra.cGermes(fgGermes.Row).cBoîtes.Count > 0 Then
    iMilieuDéfaut = cra.cGermes(fgGermes.Row).cBoîtes(1).boi_milieu
  Else
    iMilieuDéfaut = 0
  End If
  
  Set b = frmAjoutBoîte.Ajout(iMilieuDéfaut, cra.cGermes(fgGermes.Row))
  If Not b Is Nothing Then

    ' On l'ajoute à la collection
    cra.cGermes(fgGermes.Row).cBoîtes.AddBoîte b
    cra.cGermes(fgGermes.Row).bGermeModifié = True
    
    ' Si c'est la première boîte, le germe peut redevenir de couleur normale
    If cra.cGermes(fgGermes.Row).cBoîtes.Count = 1 Then
      ChangeCouleurGerme 0    ' Couleur par défaut
    End If
    
    fgBoîtes.Rows = cra.cGermes(fgGermes.Row).cBoîtes.Count + 1
    ' 1 ligne dans le flexgrid + PgPrec --> espace de pile insuffisant !
    If fgBoîtes.Rows < 3 Then fgBoîtes.Rows = 3

    ' On met à jour l'affichage
    AfficheBoîte cra.cGermes(fgGermes.Row).cBoîtes.Count, b
    MajAffichageGerme fgGermes.Row
    
    ' On met à jour l'indicateur d'état
    cra.cStatusModif = "O"              ' Critère modifié
    AfficheStatusModif
    
    cra.iModeBoîtes = mbModifié
    AfficheModeBoîtes
    SetDirty
  End If
End Sub

Private Sub AfficheBoîte(iRow As Integer, b As Boîte)
  fgBoîtes.TextMatrix(iRow, 0) = b.boi_milieu & ": " & LireMilieu(b.boi_milieu).mil_abrege
  fgBoîtes.TextMatrix(iRow, 1) = b.boi_dilution
  fgBoîtes.TextMatrix(iRow, 2) = NV(b.boi_quantite)
  fgBoîtes.TextMatrix(iRow, 3) = b.boi_facteur
  fgBoîtes.TextMatrix(iRow, 4) = b.boi_numboite
  fgBoîtes.TextMatrix(iRow, 5) = b.boi_typemarquage & " / " & b.boi_typeboite
  fgBoîtes.TextMatrix(iRow, 6) = b.boi_legende
End Sub

Private Sub ModifieBoîte()
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim b As Boîte, bo As Boîte
  Dim g As GermeRecherché
  
  ' Protection ligne vide
  If fgBoîtes.TextMatrix(fgBoîtes.Row, 0) = "" Then Exit Sub
  
  Set g = cra.cGermes(fgGermes.Row)
  Set bo = g.cBoîtes(fgBoîtes.Row)
  Set b = frmAjoutBoîte.Modifie(bo, g, fgBoîtes.Row)
  If Not b Is Nothing Then
    ' On met à jour la boîte modifiée
    bo.boi_dilution = b.boi_dilution
    bo.boi_facteur = b.boi_facteur
    bo.boi_legende = b.boi_legende
    bo.boi_milieu = b.boi_milieu
    bo.boi_numboite = b.boi_numboite
    bo.boi_quantite = b.boi_quantite
    bo.boi_typeboite = b.boi_typeboite
    bo.boi_typemarquage = b.boi_typemarquage
    
    ' Flag modifié
    cra.cGermes(fgGermes.Row).bGermeModifié = True
  
    ' On met à jour l'affichage
    AfficheBoîte fgBoîtes.Row, b
    MajAffichageGerme fgGermes.Row
    
    ' On met à jour l'indicateur d'état
    cra.cStatusModif = "O"              ' Critère modifié
    AfficheStatusModif
    
    cra.iModeBoîtes = mbModifié
    AfficheModeBoîtes
    SetDirty
  End If
End Sub


Private Sub fgBoîtes_DblClick()
  If btnModifieBoîte.Visible And btnModifieBoîte.Enabled Then ModifieBoîte
End Sub

Private Sub btnModifieBoîte_Click()
  ModifieBoîte
End Sub

' Focus
Private Sub btnEnlèveBoîte_GotFocus()
  sbStatus.SimpleText = ""
End Sub

Private Sub btnAjouteBoîte_GotFocus()
  sbStatus.SimpleText = ""
End Sub

Private Sub btnModifieBoîte_GotFocus()
  sbStatus.SimpleText = ""
End Sub


' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Résultats

Private Sub AfficheRésultats(iLigne As Integer, g As GermeRecherché)
  fgRésultat.TextMatrix(iLigne, 0) = sLibelléGerme(g.iGerme) & " " & g.sUnité & " (" & g.sMéthode & ")"
  fgRésultat.TextMatrix(iLigne, 1) = sFormateRésultat(g.sRésultat)
  fgRésultat.TextMatrix(iLigne, 2) = sFormateRésultat(g.m)
  fgRésultat.TextMatrix(iLigne, 3) = sLibelléCPar(g.iCPar)
  fgRésultat.TextMatrix(iLigne, 4) = g.cEtatLabo
  
  ' Ombrage des résultats non satisfaisants
  fgRésultat.Row = iLigne
  Dim iCol As Integer
  For iCol = 0 To 4
    fgRésultat.col = iCol
    If g.iCPar >= 5 Then
      fgRésultat.CellBackColor = RGB(255, 200, 200)   ' Rouge
    ElseIf g.iCPar >= 3 Then
      fgRésultat.CellBackColor = RGB(255, 255, 200)   ' Jaune
    Else
      fgRésultat.CellBackColor = 0                    ' Couleur standard d'après la doc
    End If
  Next
End Sub


' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Code global de la feuille


' Changement d'onglet avec PgPrec/PgSuiv
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyPageUp Then
    If tsTab.SelectedItem.Index > 1 Then Page tsTab.SelectedItem.Index - 1
    KeyCode = 0
  ElseIf KeyCode = vbKeyPageDown Then
    If tsTab.SelectedItem.Index < tsTab.Tabs.Count Then Page tsTab.SelectedItem.Index + 1
    KeyCode = 0
  End If
End Sub


' Active un contrôle en affichant la bonne page si nécessaire
' On ne peut pas déclarer "c as Control", ça ne marche pas avec un contrôle utilisateur (ChampDate par exemple)
Private Sub Focus(c, Optional ByVal sPage As String)
  
  If sPage = "" Then
    If c Is txtNumPro Or c Is txtComplémentNom Or c Is txtObs Or TypeOf c Is ChampDate Or TypeOf c Is ChampTempérature _
      Or c Is txtCodeArticle Or c Is txtCodeFamille Or c Is txtNumLip Or c Is txtNumCdt Or c Is txtNumFab Or c Is txtNumDis Or c Is txtDateDLC Or c Is txtDateDLUO _
      Or c Is txtIdLot Or c Is txtCodeEmballeur Or c Is txtDateRetrait Or c Is txtDLC2 Or c Is txtNumCpr Or c Is txtRefOrigine Or c Is txtCodeFabricant _
      Or c Is txtOptionsEdition Or c Is txtMarque Or c Is txtUV Or c Is txtAspect _
      Or c Is txtNivÉlabo Or c Is txtÉtatPhy Or c Is txtContenant Or c Is txtÉtatDiv Or c Is txtTechFab Or c Is txtSecteurPrél Or c Is txtCondPrél Or c Is txtInfo1 Or c Is txtInfo2 _
      Or c Is txtHeurePrélèvement Or c Is txtHeurePréparation Or c Is txtIntOpér _
      Or c Is txtDateRéception Or c Is txtHeureRéception Then
      sPage = "Tête"
    ElseIf c Is txtCritère Or c Is cboMMéthode Or c Is txtOptionsLabo Or c Is chkIE Or c Is chkFax Or c Is txtRemarquesLabo Or c Is txtPrixSpécifique Or c Is bdcDevise Or c Is txtTraitéPar Or c Is txtDateDebAnPrévue Or c Is bdcClasseDoc Then
      sPage = "Analyse"
    Else
      MsgBox2i "CR246", c.Name
      'MsgBox "Contrôle '" & c.Name & "' non pris en charge dans Focus !", vbCritical, sNomApp
      ' On reste sur la  page courante
      sPage = tsTab.SelectedItem
    End If
  End If
  
  ' Si la page courante n'est pas la bonne, on change de page
  If tsTab.SelectedItem.Key <> sPage Then Page sPage
  
  ' On active le contrôle
  c.SetFocus
End Sub


Private Sub Form_Paint()
  Line (0, 0)-Step(ScaleWidth, 0), vbButtonShadow
  Line (0, 1)-Step(ScaleWidth, 0), vb3DHighlight
  
  If (bAfficherBarreDeBoutons) Then
    Line (0, tbBoutons.height)-Step(ScaleWidth, 0), vbButtonShadow
    Line (0, tbBoutons.height + 1)-Step(ScaleWidth, 0), vb3DHighlight
  End If
End Sub

Private Function LTop(iLigne As Integer) As Integer
'  If iLigne >= 8 Then
'    LTop = 1380 + 7 * 510 + (iLigne - 8) * 350
'  Else
    LTop = 1380 + (iLigne - 1) * 540
'  End If
End Function

Private Function NextTabIndex() As Integer
  iTabIndex = iTabIndex + 1
  NextTabIndex = iTabIndex - 1
End Function

Private Sub PlaceLabel(iLigne As Integer, iColonne As Integer, lbl As Label)
  lbl.Move (iColonne - 1) * tsTab.ClientWidth * Screen.TwipsPerPixelX / 3, LTop(iLigne) + 60
  lbl.TabIndex = NextTabIndex
End Sub

Private Sub PlaceDate2(iLigne As Integer, iColonne As Integer, c1 As Control, Optional c2 As Control)
  Dim x3 As Integer, wChamp As Integer
  x3 = (tsTab.ClientWidth * Screen.TwipsPerPixelX) / 3
  wChamp = x3 - 1860
  
  c1.Left = (iColonne - 1) * tsTab.ClientWidth * Screen.TwipsPerPixelX / 3 + 1860
  c1.Top = LTop(iLigne)
  c1.Width = wChamp / 2 - 40
  c1.TabIndex = NextTabIndex
  If Not c2 Is Nothing Then
    c2.Left = (iColonne - 1) * tsTab.ClientWidth * Screen.TwipsPerPixelX / 3 + 1860 + wChamp / 2
    c2.Top = LTop(iLigne)
    c2.Width = wChamp / 2 - 40
    c2.TabIndex = NextTabIndex
  End If
End Sub

Private Sub PlaceTempé(iLigne As Integer, iColonne As Integer, t1 As Control, t2 As Control, t3 As Control)
  Dim x3 As Integer, wChamp As Integer
  x3 = (tsTab.ClientWidth * Screen.TwipsPerPixelX) / 3
  wChamp = x3 - 1860

  t1.Top = LTop(iLigne)
  t2.Top = LTop(iLigne)
  t3.Top = LTop(iLigne)
  
  t1.Width = wChamp / 3 - 40
  t2.Width = wChamp / 3 - 40
  t3.Width = wChamp / 3 - 40

  t1.Left = (iColonne - 1) * tsTab.ClientWidth * Screen.TwipsPerPixelX / 3 + 1860
  t2.Left = (iColonne - 1) * tsTab.ClientWidth * Screen.TwipsPerPixelX / 3 + 1860 + wChamp / 3
  t3.Left = (iColonne - 1) * tsTab.ClientWidth * Screen.TwipsPerPixelX / 3 + 1860 + 2 * wChamp / 3
  
  t1.TabIndex = NextTabIndex
  t2.TabIndex = NextTabIndex
  t3.TabIndex = NextTabIndex
End Sub

Private Sub PlaceNoNom(iLigne As Integer, iColonne As Integer, tNum As TextBox, tNom As TextBox)
  Dim x3 As Integer, wChamp As Integer
  x3 = (tsTab.ClientWidth * Screen.TwipsPerPixelX) / 3
  wChamp = x3 - 1860
  
  tNum.Top = LTop(iLigne)
  tNom.Top = LTop(iLigne)
  
  tNum.Left = (iColonne - 1) * tsTab.ClientWidth * Screen.TwipsPerPixelX / 3 + 1860
  tNum.Width = 720
  tNom.Left = (iColonne - 1) * tsTab.ClientWidth * Screen.TwipsPerPixelX / 3 + 1860 + 740
  tNom.Width = Max(wChamp - 780, 1)
  tNom.height = 520
  
  tNum.TabIndex = NextTabIndex
  tNom.TabIndex = NextTabIndex
End Sub

Private Sub PlaceChamp(iLigne As Integer, iColonne As Integer, c As TextBox)
  Dim x3 As Integer, wChamp As Integer
  x3 = (tsTab.ClientWidth * Screen.TwipsPerPixelX) / 3
  wChamp = x3 - 1860
  
  c.Top = LTop(iLigne)
  c.Left = (iColonne - 1) * tsTab.ClientWidth * Screen.TwipsPerPixelX / 3 + 1860
  c.Width = wChamp - 40
  c.TabIndex = NextTabIndex
End Sub


Private Sub Form_Resize()
  If ScaleHeight < 250 Or ScaleWidth < 550 Then Exit Sub
  
  Dim vOff As Integer
  
  If bAfficherBarreDeBoutons Then
    vOff = tbBoutons.height
  Else
    vOff = 0
  End If
  
  ' On retaille le tabstrip…
  tsTab.Move 4, vOff + 55, ScaleWidth - 8, ScaleHeight - vOff - 80
  
  ' Les champs fixes du haut
  lblRéférence.Top = 52 + vOff - 42
  txtRéférence.Top = 48 + vOff - 42
  chkSaisieValidée.Top = 52 + vOff - 42
  lblEtablissement.Top = 76 + vOff - 42
  txtNumEtb.Top = 72 + vOff - 41
  txtPréfixe.Top = 72 + vOff - 42
  txtNomEtb.Top = 72 + vOff - 42
  If ScaleWidth - txtNomEtb.Left - 11 > 0 Then txtNomEtb.Width = ScaleWidth - txtNomEtb.Left - 8
  
  ' Puis les frames contenant les contrôles
  Dim f As Frame
  For Each f In fraFeuille
    f.Move tsTab.ClientLeft + 2, tsTab.ClientTop + 6, tsTab.ClientWidth - 2, tsTab.ClientHeight - 4
  Next
  
  ' Retaille à l'intérieur des conteneurs
  ' Onglet divers
  fraPH.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - 2 * fraPH.Left - 80
  fraLabo.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - 2 * fraLabo.Left - 80
  If fraPH.Width - txtNomEtatPH.Left - 100 > 0 Then
    txtNomEtatPH.Width = fraPH.Width - txtNomEtatPH.Left - 100
    txtNomEtatLabo.Width = fraLabo.Width - txtNomEtatLabo.Left - 100
  End If
  If fraPH.Width - txtNomSaisPH.Left - 100 > 0 Then
    txtNomSaisPH.Width = fraPH.Width - txtNomSaisPH.Left - 100
    txtNomValPH.Width = fraPH.Width - txtNomValPH.Left - 100
    txtNomSaisLabo.Width = fraLabo.Width - txtNomSaisLabo.Left - 100
    txtNomValLabo.Width = fraLabo.Width - txtNomValLabo.Left - 100
    txtNomValLabo0.Width = fraLabo.Width - txtNomValLabo0.Left - 100
  End If
  
  ' Planning
  txtNomPers.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtNomPers.Left - 80
  txtNomCp.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtNomCp.Left - 80
  
  ' Résultats
  txtNomCon.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtNomCon.Left - 80
  
  ' Analyse
  txtTitreCritère.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtTitreCritère.Left - 80
  txtRemarquesLabo.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtRemarquesLabo.Left - 80
  
  ' Champs roses --> en blanc
  Dim c As Control
  On Error Resume Next
  For Each c In Controls
    If TypeOf c Is TextBox Or TypeOf c Is ChampHeure Then
      If (Not c Is txtSecteurPrél) And (Not c Is txtIntOpér) And (Not c Is txtInfo1) And (Not c Is txtInfo2) Then
        If c.BackColor = &HC0E0FF Then c.BackColor = &H80000005
      End If
    End If
  Next
  On Error GoTo 0
  
  ' Retaille des champs du haut
  txtNomPro.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtNomPro.Left - 1250
  txtCritèreInfo.Left = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtCritèreInfo.Width - 40
  txtComplémentNom.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtComplémentNom.Left - 40
  txtObs.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtObs.Left - 40
  
  
  ' Champs de l'onglet tête
  iTabIndex = lblTête(3).TabIndex
  
  PlaceLabel 1, 1, lblTête(3)   ' Date+heure prél
  PlaceDate2 1, 1, txtDatePrélèvement, txtHeurePrélèvement
  PlaceLabel 2, 1, lblTête(4)   ' T° prod/amb/réc.
  PlaceTempé 2, 1, txtTempératureProduit, txtTempératureAmbiance, txtTempératureRéception
  PlaceLabel 3, 1, lblTête(30)  ' Secteur de prélèvement
  PlaceNoNom 3, 1, txtSecteurPrél, txtNomSecteurPrél
  PlaceLabel 4, 1, lblTête(26)  ' État physique
  PlaceNoNom 4, 1, txtÉtatPhy, txtNomÉtatPhy
  PlaceLabel 5, 1, lblTête(33)  ' Int. opérateur
  PlaceNoNom 5, 1, txtIntOpér, txtNomIntOpér
  PlaceLabel 6, 1, lblTête(18)  ' Cadre de prélèv.
  PlaceNoNom 6, 1, txtNumCpr, txtNomCpr
  
  PlaceLabel 1, 2, lblTête(5)   ' Date préparation
  PlaceDate2 1, 2, txtDatePréparation, txtHeurePréparation
  PlaceLabel 2, 2, lblTête(34)  ' Date de déconditionnement
  PlaceDate2 2, 2, txtDateDéconditionnement
  PlaceLabel 3, 2, lblTête(7)   ' Lieu de prél
  PlaceNoNom 3, 2, txtNumLip, txtNomLip
  PlaceLabel 4, 2, lblTête(31)  ' Cond. de prél.
  PlaceNoNom 4, 2, txtCondPrél, txtNomCondPrél
  PlaceLabel 5, 2, lblTête(8)   ' Conditionnement
  PlaceNoNom 5, 2, txtNumCdt, txtNomCdt
  PlaceLabel 6, 2, lblTête(27)  ' Contenant
  PlaceNoNom 6, 2, txtContenant, txtNomContenant
  PlaceLabel 7, 2, lblTête(28)  ' État de division
  PlaceNoNom 7, 2, txtÉtatDiv, txtNomÉtatDiv
  PlaceLabel 8, 2, lblTête(25)  ' Niv. d'élaboration
  PlaceNoNom 8, 2, txtNivÉlabo, txtNomNivÉlabo
  PlaceLabel 9, 2, lblTête(29)  ' Technologie de fab
  PlaceNoNom 9, 2, txtTechFab, txtNomTechFab
  
  PlaceLabel 1, 3, lblTête(9)   ' Fabricant
  PlaceNoNom 1, 3, txtNumFab, txtNomFab
  PlaceLabel 2, 3, lblTête(11)  ' Date fab/Date de cond
  PlaceDate2 2, 3, txtDateFabrication, txtDateConditionnement
  PlaceLabel 3, 3, lblTête(13)  ' Identification lot
  PlaceChamp 3, 3, txtIdLot
  PlaceLabel 4, 3, lblTête(14) ' DLC / DL&UO
  PlaceDate2 4, 3, txtDateDLC, txtDateDLUO
  PlaceLabel 5, 3, lblTête(15)  ' Date de retrait
  PlaceDate2 5, 3, txtDLC2, txtDateRetrait
  PlaceLabel 6, 3, lblTête(6)   ' Code article
  PlaceChamp 6, 3, txtCodeArticle
  PlaceLabel 7, 3, lblTête(35)   ' Code famille
  PlaceChamp 7, 3, txtCodeFamille
  PlaceLabel 8, 3, lblTête(21)  ' Marque
  PlaceChamp 8, 3, txtMarque
  PlaceLabel 9, 3, lblTête(22)  ' Unité de vente
  PlaceChamp 9, 3, txtUV
  PlaceLabel 10, 3, lblTête(10)  ' Distributeur
  PlaceNoNom 10, 3, txtNumDis, txtNomDis
  PlaceLabel 11, 3, lblTête(12)  ' Date livraison
  PlaceDate2 11, 3, txtDateLivraison, txtDateRéceptionClient
  
  PlaceLabel 7, 1, lblTête(19)  ' Code fabricant
  PlaceChamp 7, 1, txtCodeFabricant
  PlaceLabel 8, 1, lblTête(16)  ' Code emballeur
  PlaceChamp 8, 1, txtCodeEmballeur
  PlaceLabel 9, 1, lblTête(32) ' Info Rab
  PlaceDate2 9, 1, txtInfo1, txtInfo2
  PlaceLabel 10, 1, lblTête(20) ' Options édition
  PlaceChamp 10, 1, txtOptionsEdition
  PlaceLabel 11, 1, lblTête(17) ' Référence ori&gine
  PlaceChamp 11, 1, txtRefOrigine
  
  PlaceLabel 10, 2, lblTête(24)  ' Aspect échantillon
  PlaceNoNom 10, 2, txtAspect, txtNomAspect
  PlaceLabel 11, 2, lblTête(23) ' Date de r&éception
  PlaceDate2 11, 2, txtDateRéception, txtHeureRéception
End Sub


Public Sub AjusterBarreBoutonsRA()
  If bAfficherEtiquettesDeBoutons Then
    
    SetLib tbBoutons.Buttons("Contrôler"), "Caption", "RAtbContrôler"
    SetLib tbBoutons.Buttons("Valider"), "Caption", "RAtbValider"
    SetLib tbBoutons.Buttons("Enregistrer"), "Caption", "RAtbEnregistrer"
    SetLib tbBoutons.Buttons("EnregistrerQuitter"), "Caption", "RAtbEnregistrerQuit"
    SetLib tbBoutons.Buttons("Quitter"), "Caption", "RAtbQuitter"
    SetLib tbBoutons.Buttons("Suivant"), "Caption", "RAtbSuivant"
    SetLib tbBoutons.Buttons("Supprimer"), "Caption", "RAtbSupprimer"
    
    
  Else
    Dim b As Button
    For Each b In tbBoutons.Buttons
      b.Caption = ""
    Next
  End If
  DoEvents    ' Sinon la propriété height n'est pas mise à jour !

  ' On masque/affiche la barre de boutons
  If bAfficherBarreDeBoutons And Not tbBoutons.Enabled Then
    lblRéférence.Top = lblRéférence.Top + tbBoutons.height
    txtRéférence.Top = txtRéférence.Top + tbBoutons.height
    chkSaisieValidée.Top = chkSaisieValidée.Top + tbBoutons.height
    lblEtablissement.Top = lblEtablissement.Top + tbBoutons.height
    txtNumEtb.Top = txtNumEtb.Top + tbBoutons.height
    txtPréfixe.Top = txtPréfixe.Top + tbBoutons.height
    txtNomEtb.Top = txtNomEtb.Top + tbBoutons.height
    tsTab.Top = tsTab.Top + tbBoutons.height

    tbBoutons.Visible = True
    tbBoutons.Enabled = True
    Exit Sub
  End If
  
  If Not bAfficherBarreDeBoutons And tbBoutons.Enabled Then
    tbBoutons.Visible = False
    tbBoutons.Enabled = False
    
    lblRéférence.Top = lblRéférence.Top - tbBoutons.height
    txtRéférence.Top = txtRéférence.Top - tbBoutons.height
    chkSaisieValidée.Top = chkSaisieValidée.Top - tbBoutons.height
    lblEtablissement.Top = lblEtablissement.Top - tbBoutons.height
    txtNumEtb.Top = txtNumEtb.Top - tbBoutons.height
    txtPréfixe.Top = txtPréfixe.Top - tbBoutons.height
    txtNomEtb.Top = txtNomEtb.Top - tbBoutons.height
    tsTab.Top = tsTab.Top - tbBoutons.height
  End If

  Cls
  Form_Resize
End Sub



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
  ' Affecte la nouvelle valeur à iCurFrame.
  iCurFrame = tsTab.SelectedItem.Index

  ' Accompagnement du focus
  ' Ça serait pas mal de mémoriser page par page le contrôle qui a le focus au moment
  ' du changement de focus, de façon à restaurer le focus sur ce contrôle
  ' mais il faut traiter le fait que c'est le contrôle tabstop qui prend le focus
  ' quand on clique dessus (pas sûr il me semble, c'est au 2ème clic qu'il prend le focus !!!)
  DoEvents
  Select Case tsTab.SelectedItem.Key
    Case "Tête": txtNumPro.SetFocus
    Case "Analyse": txtCritère.SetFocus
    Case "Résultats": txtNumCon.SetFocus
    Case "Planning": txtDateTournée.SetFocus
    Case "Divers": txtTimestamp.SetFocus
    Case Else: Stop
  End Select
  
End Sub


' ===============================================================
' Bouclage du focus sur les diverses pages

Private Sub txtBouclageFocus_GotFocus(Index As Integer)
  Select Case Index
    ' Tête
    Case 0: txtInfo2.SetFocus
    Case 1: txtNumPro.SetFocus
    
    ' Analyse
    Case 2: txtTraitéPar.SetFocus   ' En fait les tableaux de germes, mais c'est pas sûr qu'ils soient actifs…
    Case 3: txtCritère.SetFocus
    
    ' Résultats
    Case 4: txtNumCon.SetFocus
    Case 5: txtNumCon.SetFocus

    ' Planning
    Case 6: txtDateTournée.SetFocus
    Case 7: txtDateTournée.SetFocus

    ' Divers
    Case 8: txtEtatPH.SetFocus
    Case 9: txtEtatPH.SetFocus
    
    Case Else: Stop
  End Select
End Sub


Private Sub Form_Load()
  Internationalisation
  Dim iNiveau As Integer
  iNiveau = NZ(UtiParNuméro(iNumOpérateur).uti_niveau)
  mnuAvancé.Visible = (iNiveau And 16) <> 0
  
  ' On rend invisibles les pièges à focus (le fond est visible sur la feuille pour le développement)
  Dim ct As TextBox
  For Each ct In txtBouclageFocus
    ct.BackColor = &H8000000F
  Next
  
  ' On remplace les | des libellés par des retours à la ligne
  Dim l As Label, p As Integer
  For Each l In lblTête
    p = InStr(l, "|")
    If p <> 0 Then l = Subst(l, "|", vbCrLf)
  Next
  
  ' On ajuste en fonction du nombre max de germes
  fgRésultat.Rows = MAXLIGNERES + 1
  fgGermes.Rows = MAXLIGNERES + 1
  
  ' Remplissage des combos
  Dim cMM As Integer
  For cMM = Asc("A") To Asc("Z")
    cboMMéthode.AddItem Chr(cMM), sLibelléMétaméthode(Chr(cMM))
  Next
  
  '$$ A généraliser
  bdcDevise.AddItem "", ""
  bdcDevise.AddItem "F", "Franc"
  bdcDevise.AddItem "E", "Euro"
  
  '$$ A internationaliser
  bdcClasseDoc.AddItem "AB", "Analyse Bactério Standard"
  bdcClasseDoc.AddItem "BS", "Bactério Spéciale"
  bdcClasseDoc.AddItem "FS", "Frottis de surface"
  bdcClasseDoc.AddItem "Li", "Listéria"
  bdcClasseDoc.AddItem "Hu", "Huile"
  bdcClasseDoc.AddItem "Ch", "Chimie"
  bdcClasseDoc.AddItem "CR", "Compte-Rendu générique (autre)"
  bdcClasseDoc.AddItem "BM", "Biologie Moléculaire"
'  bdcClasseDoc.AddItem "ES", "ESB (Prionics-Check)"
  bdcClasseDoc.AddItem "AV", "ABVT"
  bdcClasseDoc.AddItem "Le", "légionelles"
  
  fgGermes_LostFocus
  
  ' On met les frames en tête de pile d'affichage, sinon certains sont derrière le tsTab
  Dim f As Frame
  For Each f In fraFeuille
    f.ZOrder 0
  Next
  
  AjusterBarreBoutonsRA
  Show

  iCurFrame = -1   ' Pour forcer le passage à la page 0
  Page "Tête"
  ChargeContrôles
  bDirty = False
  chkSaisieValidée.Value = vbUnchecked
  
  Refresh
  DoEvents
  
  Select Case cra.iMode
    Case meCréation: InitCréation
    Case meModification: InitModification
    Case meModificationRéduite: InitModificationRéduite
    Case meModificationSpéciale: InitModificationSpéciale
    Case meVisualisation: InitVisualisation
    Case Else: Stop
  End Select
  
  AfficheModeBoîtes
  
  ' Test pour voir si le pb du bDirty de Christelle ne vient pas du DoEvents plus haut
  If bDirty Then
    MsgBox2i "CR247"
    'MsgBox "PROBLEME INTERNE - bDirty est positionné en fin de Form_Load" & vbCrLf & vbCrLf & "Ne tapez pas si vite !" & vbCrLf & "Attendez que le sablier ait disparu pour saisir les données !!!", vbCritical, sNomApp
    bDirty = False
  End If
End Sub


' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Remplissage / activation des champs

Private Sub InitCréation()
  sTitreFenêtre = "Nouveau RA"
  Caption = sTitreFenêtre
  chkSaisieValidée.Enabled = True
  
  cmdSupprimer.Enabled = False            ' Pas de suppression
  tbBoutons.Buttons("Supprimer").Enabled = False
  tbBoutons.Buttons("Enregistrer").Enabled = False
  tbBoutons.Buttons("EnregistrerQuitter").Enabled = False
  cmdAnnulerValidation.Enabled = False
  
  ' Tous les champs sont actifs
  
  ' Tête
  txtNumPro.Locked = False
  txtComplémentNom.Locked = False
  txtObs.Locked = False
  txtDatePrélèvement.Locked = False
  txtHeurePrélèvement.Locked = False
  txtTempératureProduit.Locked = False
  txtTempératureAmbiance.Locked = False
  txtTempératureRéception.Locked = False
  txtDatePréparation.Locked = False
  txtHeurePréparation.Locked = False
  txtCodeArticle.Locked = False
  txtCodeFamille.Locked = False
  txtNumLip.Locked = False
  txtNumCdt.Locked = False
  txtNumFab.Locked = False
  txtNumDis.Locked = False
  txtDateFabrication.Locked = False
  txtDateLivraison.Locked = False
  txtDateRéceptionClient.Locked = False
  txtDateConditionnement.Locked = False
  txtDateDéconditionnement.Locked = False
  txtDateDLC.Locked = False
  txtDateDLUO.Locked = False
  txtDLC2.Locked = False
  txtCodeFamille.Locked = False
  txtIdLot.Locked = False
  txtCodeEmballeur.Locked = False
  txtDateRetrait.Locked = False
  txtNumCpr.Locked = False
  txtRefOrigine.Locked = False
  txtOptionsEdition.Locked = False
  txtCodeFabricant.Locked = False
  txtMarque.Locked = False
  txtUV.Locked = False
  txtDateRéception.Locked = False
  txtHeureRéception.Locked = False
  txtAspect.Locked = False
  
  txtSecteurPrél.Locked = False
  txtÉtatPhy.Locked = False
  txtIntOpér.Locked = False
  txtCondPrél.Locked = False
  txtContenant.Locked = False
  txtÉtatDiv.Locked = False
  txtNivÉlabo.Locked = False
  txtTechFab.Locked = False
  txtInfo1.Locked = False
  txtInfo2.Locked = False

  
  ' Analyse
  txtCritère.Locked = False
  cboMMéthode.Locked = False
  bdcClasseDoc.Locked = False
  txtOptionsLabo.Locked = False
  txtRemarquesLabo.Locked = False
  txtPrixSpécifique.Locked = False
  bdcDevise.Locked = False
  chkIE.Enabled = True
  chkFax.Enabled = True
  chkCongelé.Enabled = True
  txtTraitéPar.Locked = False
  txtDateDebAnPrévue.Locked = False
  btnLireGermes.Visible = True
  btnAjouteGerme.Visible = True
  btnEnlèveGerme.Visible = True
  btnModifieGerme.Visible = True
  btnAjouteBoîte.Visible = True
  btnEnlèveBoîte.Visible = True
  btnModifieBoîte.Visible = True
  
  DésactiveBoutonsGermes
  
  '' Résultats
  'BlocRésultatsVisible False
End Sub



Private Sub InitModification()
  sTitreFenêtre = sGetIntlLib("RAtxtInitModif", "Modification d'un RA")
  Caption = sTitreFenêtre
  
  chkSaisieValidée.Enabled = True
  cmdSupprimer.Enabled = True
  tbBoutons.Buttons("Supprimer").Enabled = True
  tbBoutons.Buttons("Enregistrer").Enabled = False
  tbBoutons.Buttons("EnregistrerQuitter").Enabled = False
  cmdAnnulerValidation.Enabled = False

  ' Certains champs sont actifs, selon ce qui a déjà été fait
  ' Pour commencer tout est actif…

  ' Tête
  txtNumPro.Locked = False
  txtComplémentNom.Locked = False
  txtObs.Locked = False
  txtDatePrélèvement.Locked = False
  txtHeurePrélèvement.Locked = False
  txtTempératureProduit.Locked = False
  txtTempératureAmbiance.Locked = False
  txtTempératureRéception.Locked = False
  txtDatePréparation.Locked = False
  txtHeurePréparation.Locked = False
  txtCodeArticle.Locked = False
  txtCodeFamille.Locked = False
  txtNumLip.Locked = False
  txtNumCdt.Locked = False
  txtNumFab.Locked = False
  txtNumDis.Locked = False
  txtDateFabrication.Locked = False
  txtDateLivraison.Locked = False
  txtDateRéceptionClient.Locked = False
  txtDateConditionnement.Locked = False
  txtDateDéconditionnement.Locked = False
  txtDateDLC.Locked = False
  txtDateDLUO.Locked = False
  txtDLC2.Locked = False
  txtCodeFamille.Locked = False
  txtIdLot.Locked = False
  txtCodeEmballeur.Locked = False
  txtDateRetrait.Locked = False
  txtNumCpr.Locked = False
  txtRefOrigine.Locked = False
  txtOptionsEdition.Locked = False
  txtCodeFabricant.Locked = False
  txtMarque.Locked = False
  txtUV.Locked = False
  txtDateRéception.Locked = False
  txtHeureRéception.Locked = False
  txtAspect.Locked = False
  txtSecteurPrél.Locked = False
  txtÉtatPhy.Locked = False
  txtIntOpér.Locked = False
  txtCondPrél.Locked = False
  txtContenant.Locked = False
  txtÉtatDiv.Locked = False
  txtNivÉlabo.Locked = False
  txtTechFab.Locked = False
  txtInfo1.Locked = False
  txtInfo2.Locked = False

  
  ' Analyse
  txtCritère.Locked = False
  cboMMéthode.Locked = False
  bdcClasseDoc.Locked = False
  txtOptionsLabo.Locked = False
  txtRemarquesLabo.Locked = False
  txtPrixSpécifique.Locked = False
  bdcDevise.Locked = False
  chkIE.Enabled = True
  chkFax.Enabled = True
  chkCongelé.Enabled = True
  txtTraitéPar.Locked = False
  txtDateDebAnPrévue.Locked = False
  btnLireGermes.Visible = True
  
  btnLireGermes.Enabled = False       ' Par défaut, pas à relire
  
  btnAjouteGerme.Visible = True
  btnEnlèveGerme.Visible = True
  btnModifieGerme.Visible = True
  
  If cra.iModeBoîtes = mbProblème Then
    btnAjouteBoîte.Visible = False
    btnEnlèveBoîte.Visible = False
    btnModifieBoîte.Visible = False
    lblAnalyse(6) = sGetIntlLib("RAtxtAnalyse(6)", "Problème à la lecture des boîtes")
  Else
    btnAjouteBoîte.Visible = True
    btnEnlèveBoîte.Visible = True
    btnModifieBoîte.Visible = True
  End If
  
  '' Résultats
  'BlocRésultatsVisible True
End Sub


Private Sub InitModificationRéduite()
  InitModificationRéduiteSpéciale meModificationRéduite
End Sub

Private Sub InitModificationSpéciale()
  InitModificationRéduiteSpéciale meModificationSpéciale
End Sub


Private Sub InitModificationRéduiteSpéciale(meMode As eModeEdition)
  If meMode = meModificationRéduite Then
    sTitreFenêtre = sGetIntlLib("RAtxtInitModifR", "Saisie restreinte d'un RA")
    chkSaisieValidée.Enabled = True
  Else
    sTitreFenêtre = sGetIntlLib("RAtxtInitModifS", "*** MODIFICATION SPÉCIALE ***")
    chkSaisieValidée.Enabled = False
  End If
  Caption = sTitreFenêtre

  chkSaisieValidée.Enabled = False
  cmdSupprimer.Enabled = False            ' Pas de suppression une fois pris en charge par le labo
  tbBoutons.Buttons("Supprimer").Enabled = False
  tbBoutons.Buttons("Enregistrer").Enabled = False
  tbBoutons.Buttons("EnregistrerQuitter").Enabled = False
  cmdAnnulerValidation.Enabled = False
  
  ' Critère / germe / boîtes sont inactifs

  ' Tête
  txtNumPro.Locked = False
  txtComplémentNom.Locked = False
  txtObs.Locked = False
  txtDatePrélèvement.Locked = False
  txtHeurePrélèvement.Locked = False
  txtTempératureProduit.Locked = True
  txtTempératureAmbiance.Locked = False
  txtTempératureRéception.Locked = False
  txtDatePréparation.Locked = False
  txtHeurePréparation.Locked = False
  txtCodeArticle.Locked = False
  txtCodeFamille.Locked = False
  txtNumLip.Locked = False
  txtNumCdt.Locked = False
  txtNumFab.Locked = False
  txtNumDis.Locked = False
  txtDateFabrication.Locked = False
  txtDateLivraison.Locked = False
  txtDateRéceptionClient.Locked = False
  txtDateConditionnement.Locked = False
  txtDateDéconditionnement.Locked = False
  txtDateDLC.Locked = False
  txtDateDLUO.Locked = False
  txtDLC2.Locked = False
  txtCodeFamille.Locked = False
  txtIdLot.Locked = False
  txtCodeEmballeur.Locked = False
  txtDateRetrait.Locked = False
  txtNumCpr.Locked = False
  txtRefOrigine.Locked = False
  txtOptionsEdition.Locked = False
  txtCodeFabricant.Locked = False
  txtMarque.Locked = False
  txtUV.Locked = False
  txtDateRéception.Locked = False
  txtHeureRéception.Locked = False
  txtAspect.Locked = False
  
  txtSecteurPrél.Locked = False
  txtÉtatPhy.Locked = False
  txtIntOpér.Locked = False
  txtCondPrél.Locked = False
  txtContenant.Locked = False
  txtÉtatDiv.Locked = False
  txtNivÉlabo.Locked = False
  txtTechFab.Locked = False
  txtInfo1.Locked = False
  txtInfo2.Locked = False
  
  ' Analyse
  txtCritère.Locked = True
  cboMMéthode.Locked = True
  bdcClasseDoc.Locked = False     ' La classe peut être modifiée, elle n'influence pas le labo
  
  txtOptionsLabo.Locked = True
  txtTraitéPar.Locked = True
  txtDateDebAnPrévue.Locked = True
  ' Tolérance pour ces champs
  txtRemarquesLabo.Locked = False
  txtPrixSpécifique.Locked = False
  bdcDevise.Locked = False
  chkIE.Enabled = True
  chkFax.Enabled = True
  chkCongelé.Enabled = True
  
  ' Pas de modification permise pour les germes et les boîtes en mode restreint
  btnLireGermes.Visible = False
  btnAjouteGerme.Visible = False
  btnEnlèveGerme.Visible = False
  btnModifieGerme.Visible = False
  
  btnAjouteBoîte.Visible = False
  btnEnlèveBoîte.Visible = False
  btnModifieBoîte.Visible = False
  
  '' Résultats
  'BlocRésultatsVisible True
End Sub



Private Sub InitVisualisation()
  sTitreFenêtre = sGetIntlLib("RAtxtVisual", "Visualisation d'un RA")
  Caption = sTitreFenêtre
  
  chkSaisieValidée.Enabled = False
  cmdValider.Enabled = False
  cmdEnregistrer.Enabled = False          ' Pas d'enregistrement !
  cmdEnregistrerQuitter.Enabled = False   ' Pas d'enregistrement !
  cmdSupprimer.Enabled = False            ' Pas de suppression
  cmdAnnulerValidation.Enabled = True
  
  tbBoutons.Buttons("Valider").Enabled = False
  tbBoutons.Buttons("Enregistrer").Enabled = False
  tbBoutons.Buttons("EnregistrerQuitter").Enabled = False
  tbBoutons.Buttons("Supprimer").Enabled = False
      
  ' Aucun champ n'est actif
  
  ' Tête
  txtNumPro.Locked = True
  txtComplémentNom.Locked = True
  txtObs.Locked = True
  txtDatePrélèvement.Locked = True
  txtHeurePrélèvement.Locked = True
  txtTempératureProduit.Locked = True
  txtTempératureAmbiance.Locked = True
  txtTempératureRéception.Locked = True
  txtDatePréparation.Locked = True
  txtHeurePréparation.Locked = True
  txtCodeArticle.Locked = True
  txtCodeFamille.Locked = True
  txtNumLip.Locked = True
  txtNumCdt.Locked = True
  txtNumFab.Locked = True
  txtNumDis.Locked = True
  txtDateFabrication.Locked = True
  txtDateLivraison.Locked = True
  txtDateRéceptionClient.Locked = True
  txtDateConditionnement.Locked = True
  txtDateDéconditionnement.Locked = True
  txtDateDLC.Locked = True
  txtDateDLUO.Locked = True
  txtDLC2.Locked = True
  txtCodeFamille.Locked = True
  txtIdLot.Locked = True
  txtCodeEmballeur.Locked = True
  txtDateRetrait.Locked = True
  txtNumCpr.Locked = True
  txtRefOrigine.Locked = True
  txtOptionsEdition.Locked = True
  txtCodeFabricant.Locked = True
  txtMarque.Locked = True
  txtUV.Locked = True
  txtDateRéception.Locked = True
  txtHeureRéception.Locked = True
  txtAspect.Locked = True
  
  txtSecteurPrél.Locked = True
  txtÉtatPhy.Locked = True
  txtIntOpér.Locked = True
  txtCondPrél.Locked = True
  txtContenant.Locked = True
  txtÉtatDiv.Locked = True
  txtNivÉlabo.Locked = True
  txtTechFab.Locked = True
  txtInfo1.Locked = True
  txtInfo2.Locked = True
  
  ' Analyse
  txtCritère.Locked = True
  cboMMéthode.Locked = True
  bdcClasseDoc.Locked = True
  txtOptionsLabo.Locked = True
  txtRemarquesLabo.Locked = True
  txtPrixSpécifique.Locked = True
  bdcDevise.Locked = True
  chkIE.Enabled = False
  chkFax.Enabled = False
  chkCongelé.Enabled = False
  txtTraitéPar.Locked = True
  txtDateDebAnPrévue.Locked = True
  btnLireGermes.Visible = False
  btnAjouteGerme.Visible = False
  btnEnlèveGerme.Visible = False
  btnModifieGerme.Visible = False
  btnAjouteBoîte.Visible = False
  btnEnlèveBoîte.Visible = False
  btnModifieBoîte.Visible = False
End Sub


Private Sub ChargeContrôles()
  bModeChargement = True
  
  ' Partie commune
  txtRéférence = cra.sRef
  txtNumEtb = cra.sEtb
  Dim e As Etablissement
  If cra.sEtb = "0" Then
    Set e = New Etablissement
    e.etb_prefixe = "AC"
    e.etb_nom = sGetIntlLib("CRtxtEtb", "ÉTABLISSEMENT EN COURS DE CRÉATION")
  Else
    Set e = LireEtablissement(cra.sEtb, False)
  End If
  If Not e Is Nothing Then
    txtPréfixe = e.etb_prefixe
    txtNomEtb = e.etb_nom
  End If

  ' Page tête
  txtNumPro = NV(cra.iPro)
  txtNomPro = cra.sNomPro
  txtCritèreInfo = cra.sCritèreInfo
  
  txtComplémentNom = cra.sCplNom
  bCheckComplémentNom False
  txtObs = cra.sObs
  bCheckObs False
  
  txtDatePrélèvement.DateSaisie = cra.dDatePrél
  txtHeurePrélèvement.HeureSaisie = NV(cra.hHeurePrél)
  txtTempératureProduit.Température = cra.dTemp
  txtTempératureAmbiance.Température = cra.dTamb
  txtTempératureRéception.Température = cra.dTrec
  
  txtDatePréparation.DateSaisie = cra.dDatePrép
  txtHeurePréparation.HeureSaisie = NV(cra.hHeurePrép)
  txtCodeArticle = cra.sCodeArt
  txtCodeFamille = cra.sCodeFamille
  
  txtNumLip = NV(cra.hLieuPrél)
  bCheckLieuDePrélèvement False
  txtNumCdt = NV(cra.hCondit)
  bCheckConditionnement False
  
  txtNumFab = NV(cra.iFab)
  txtNomFab = cra.sNomFab
  txtNumDis = NV(cra.iDis)
  txtNomDis = cra.sNomDis
  
  txtDateFabrication.DateSaisie = cra.dDateFab
  txtDateLivraison.DateSaisie = cra.dDateLivr
  txtDateRéceptionClient.DateSaisie = cra.dDateRécepCli
  
  txtDateConditionnement.DateSaisie = cra.dDateCond
  txtDateDéconditionnement.DateSaisie = cra.dDateDécond
  txtDateDLC = cra.sDlc    ' Pas une date dans la structure RA
  txtDateDLUO = cra.sDluo
  txtDLC2 = cra.sDLC2
  txtCodeFamille = cra.sCodeFamille

  txtIdLot = cra.sIdlot
  txtCodeEmballeur = cra.sCodeEmb
  
  txtDateRetrait = cra.sDateRetrait
  txtNumCpr = NZ(cra.hCadrePrél)
  bCheckCadreDePrélèvement False
  
  txtRefOrigine = cra.sRef0
  
  txtCodeFabricant = cra.sCodeFab
  txtOptionsEdition = cra.sOptionsEdition
  
  txtMarque = cra.sMarque
  txtUV = cra.sUv
  
  txtDateRéception.DateSaisie = cra.dDateRécep
  txtHeureRéception.HeureSaisie = cra.hHeureRécep
  txtAspect = NV(cra.hAspect)
  bCheckAspectÉchantillon False
  
  txtNivÉlabo = NV(cra.hNiveauÉlaboration)
  bCheckNiveauÉlaboration False
  txtÉtatPhy = NV(cra.hÉtatPhysique)
  bCheckÉtatPhysique False
  
  txtContenant = NV(cra.hContenant)
  bCheckContenant False
  txtÉtatDiv = NV(cra.hÉtatDivision)
  bCheckÉtatDivision False
  
  txtTechFab = NV(cra.hTechnologieFabrication)
  bCheckTechnologieFabrication False
  txtSecteurPrél = NV(cra.hSecteurPrél)
  bCheckSecteurPrélèvement False
  
  txtCondPrél = NV(cra.hCondPrél)
  bCheckConditionsPrélèvement False
  txtInfo1 = NV(cra.iInfo1)
  txtInfo2 = cra.sInfo2

  txtIntOpér = NV(cra.hInterventionOpérateur)
  bCheckInterventionOpérateur False
  
  
  ' =============================================
  ' Analyse
  
  txtCritère = cra.sCritère
  txtVerCrit = NV(cra.hVerCrit)
  txtStatusModif = NV(cra.cStatusModif)
  txtRevivification = cra.iRevivification
  
  txtNumSérie = NV(cra.iNumSérie)
  txtRangEchSérie = NV(cra.iRangEchSérie)
  
  cboMMéthode = cra.cMMéthode
  bdcClasseDoc = cra.sClasseDoc
  
  txtOptionsLabo = cra.sOptionsLabo
  chkIE = IIf(cra.bIE, vbChecked, vbUnchecked)
  chkFax = IIf(cra.bFax, vbChecked, vbUnchecked)
  chkCongelé = IIf(cra.bEchCongelé, vbChecked, vbUnchecked)
  txtRemarquesLabo = cra.sRemarques
  txtPrixSpécifique = NV(cra.dPrix)
  bdcDevise = NV(cra.cDevise)
  txtTraitéPar = NV(cra.iTraitéPar)
  txtDateDebAnPrévue.DateSaisie = NV(cra.dDateDebAnPrévue)
  
  ' Liste des germes
  If txtCritère <> "" Then AfficheGermes
  
  
  ' =============================================
  ' Page résultats
  
  txtNumCon = NV(cra.hConcl)
  bCheckConclusion False
  txtCPrin = NV(cra.hCPrin)
  txtNomCPrin = sLibelléCPrin(cra.hCPrin)
  txtNumConInfo = NV(cra.hConclInfo)
  txtCPrinInfo = NV(cra.hCPrinInfo)
  txtCTrafiquée = IIf(cra.bConclTrafiquée, "O", "N")
  
  Dim g As GermeRecherché
  Dim iLigne As Integer
  iLigne = 1
  If Not cra.cGermes Is Nothing Then
    For Each g In cra.cGermes
      AfficheRésultats iLigne, g
      iLigne = iLigne + 1
    Next
  End If
  
  
  ' =============================================
  ' Page planning
  
  txtDateTournée = NV(cra.dDateTour)
  txtPers = cra.hPers
  If cra.hPers > 0 Then txtNomPers = sNomUtilisateur(cra.hPers)
  txtCP = cra.hCp
  txtiEtb(0) = cra.sEtb
  txtiEtb(1) = NV(cra.iSec)
  txtiEtb(2) = NV(cra.iDrg)
  txtiEtb(3) = NV(cra.iDna)
  txtiEtb(4) = NV(cra.iGrp)
  
  txtLangue = cra.cLangue
  txtNomLangue = sLibelléLangue(cra.cLangue)
  
  
  ' =============================================
  ' Page divers
  
  txtEtatPH = cra.cEtatPH
  txtNomEtatPH = sLibelléEtatPH(cra.cEtatPH)
  txtDateSaisPH = NV(cra.dDateSaisPH)
  txtOperSaisPH = NV(cra.hOperSaisPH)
  txtNomSaisPH = sNomUtilisateur(cra.hOperSaisPH)
  txtDateValPH = NV(cra.dDateValPH)
  txtOperValPH = NV(cra.hOperValPH)
  txtNomValPH = sNomUtilisateur(cra.hOperValPH)
  
  txtEtatLabo = cra.cEtatLabo
  txtNomEtatLabo = sLibelléEtatLabo(cra.cEtatLabo)
  txtDateSaisLabo = NV(cra.dDateSaisLabo)
  txtOperSaisLabo = NV(cra.hOperSaisLabo)
  txtNomSaisLabo = sNomUtilisateur(cra.hOperSaisLabo)
  txtDateValLabo0 = NV(cra.dDateValLabo0)
  txtOperValLabo0 = NV(cra.hOperValLabo0)
  txtNomValLabo0 = sNomUtilisateur(cra.hOperValLabo0)
  txtDateValLabo = NV(cra.dDateValLabo)
  txtOperValLabo = NV(cra.hOperValLabo)
  txtNomValLabo = sNomUtilisateur(cra.hOperValLabo)
  
  txtDateDebAn = NV(cra.dDateDebAn)
'  txtDateFinAn = NV(cra.dDateFinAn)
  txtLieuAn = cra.cLieuAn
  txtNomLieuAn = sLibelléLieuAnalyse(cra.cLieuAn)
  
  txtCOFRAC = cra.cCofrac
  txtNumFRT = NV(cra.iNumFRT)
  txtCorrection = NV(cra.cCorrection)
  txtTimestamp = NV(cra.dTimeStamp)
  txtDateCRA = NV(cra.dDateCra)
  
  bModeChargement = False
End Sub


' ============================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "RACaption"
  
  SetLib btnLireGermes, "Caption", "btnLireGermes"
  SetLib btnAjouteGerme, "Caption", "btnAjouteGerme"
  SetLib btnAjouteGerme, "ToolTipText", "btnAjouteGerme.tt"
  SetLib btnEnlèveGerme, "Caption", "btnEnlèveGerme"
  SetLib btnEnlèveGerme, "ToolTipText", "btnEnlèveGerme.tt"
  SetLib btnModifieGerme, "Caption", "btnModifieGerme"
  SetLib btnModifieGerme, "ToolTipText", "btnModifieGerme.tt"
  SetLib btnAjouteBoîte, "Caption", "btnAjouteBoîte"
  SetLib btnAjouteBoîte, "ToolTipText", "btnAjouteBoîte.tt"
  SetLib btnEnlèveBoîte, "Caption", "btnEnlèveBoîte"
  SetLib btnEnlèveBoîte, "ToolTipText", "btnEnlèveBoîte.tt"
  SetLib btnModifieBoîte, "Caption", "btnModifieBoîte"
  SetLib btnModifieBoîte, "ToolTipText", "btnModifieBoîte.tt"
  SetLib btnDétailFRT, "Caption", "btnDétailFRT"
  SetLib btnDétailFRT, "ToolTipText", "btnDétailFRT.tt"
  
  SetLib mnuRA, "Caption", "RAmnuCRA"
  SetLib cmdContrôler, "Caption", "RAcmdContrôler"
  SetLib cmdValider, "Caption", "RAcmdValider"
  SetLib cmdAnnulerValidation, "Caption", "RAcmdAnnulerValidat"
  SetLib cmdEnregistrer, "Caption", "RAcmdEnregistrer"
  SetLib cmdEnregistrerQuitter, "Caption", "RAcmdEnregistrerQuit"
  SetLib cmdAbandonnerQuitter, "Caption", "RAcmdAbandonnerQuit"
  SetLib cmdSuivant, "Caption", "RAcmdSuivant"
  SetLib cmdSupprimer, "Caption", "RAcmdSupprimer"
  
  SetLib mnuF5, "Caption", "RAmnuF5"
  'SetLib cmdF5Valeur, "Caption", "RAcmdF5Valeur"
  cmdF5Valeur.Caption = sLibelléErcem("RAcmdF5Valeur", "&Valeur précédente du champ") & vbTab & "F5"
  SetLib cmdF5Tête, "Caption", "RAcmdF5Tête"
  SetLib cmdF5Analyse, "Caption", "RAcmdF5Analyse"
  
  SetLib mnuRech, "Caption", "RAmnuRech"
  SetLib cmdRechEtablissement, "Caption", "RAcmdRechEtablis"
  SetLib cmdRechDate, "Caption", "RAcmdRechDate"
  SetLib cmdRechProduit, "Caption", "RAcmdRechProduit"
  SetLib cmdRechFabricant, "Caption", "RAcmdRechFabricant"
  SetLib cmdRechDistrib, "Caption", "RAcmdRechDistrib"
  SetLib cmdRechConclusion, "Caption", "RAcmdRechConclusion"
  SetLib cmdLibelléRA(1), "Caption", "RAcmdLibelléRA(1)"
  SetLib cmdLibelléRA(2), "Caption", "RAcmdLibelléRA(2)"
  SetLib cmdLibelléRA(3), "Caption", "RAcmdLibelléRA(3)"
  SetLib cmdLibelléRA(4), "Caption", "RAcmdLibelléRA(4)"
  SetLib cmdLibelléRA(5), "Caption", "RAcmdLibelléRA(5)"
  SetLib cmdLibelléRA(6), "Caption", "RAcmdLibelléRA(6)"
  SetLib cmdLibelléRA(7), "Caption", "RAcmdLibelléRA(7)"
  SetLib cmdLibelléRA(8), "Caption", "RAcmdLibelléRA(8)"
  SetLib cmdLibelléRA(9), "Caption", "RAcmdLibelléRA(9)"
  SetLib cmdLibelléRA(10), "Caption", "RAcmdLibelléRA(10)"
  SetLib cmdLibelléRA(11), "Caption", "RAcmdLibelléRA(11)"
  SetLib cmdLibelléRA(12), "Caption", "RAcmdLibelléRA(12)"
  
  SetLib mnuAvancé, "Caption", "RAmnuAvancé"
  SetLib cmdForcerRattachementFRTCourante, "Caption", "RAcmdForcerRattacFRT"
  SetLib cmdEffacerNuméroFRT, "Caption", "RAcmdEffNuméroFRT"
  SetLib cmdTrafiquerFRT, "Caption", "RAcmdTrafiquerFRT"
  
  SetLib mnuAide, "Caption", "RAmnuAide"
  SetLib cmdAideSommaire, "Caption", "RAcmdAideSommaire"
  SetLib cmdAideContextuelle, "Caption", "RAcmdAideContextuel"
  SetLib cmdAPropos, "Caption", "RAcmdAPropos"
  
  SetLib mnuBarreBoutons, "Caption", "RAmnuBarreBoutons"
  SetLib cmdBarreStandard, "Caption", "RAcmdBarreStandard"
  SetLib cmdEtiquettes, "Caption", "RAcmdEtiquettes"
  
  
  SetLib lblRéférence, "Caption", "RAlblRéférence"
  SetLib chkSaisieValidée, "Caption", "RAchkSaisVal"
  SetLib lblEtablissement, "Caption", "RAlblEtablissement"
  
  ' Onglet Tête
  SetLib lblTête(0), "Caption", "RAlblTête(0)"
  SetLib lblTête(1), "Caption", "RAlblTête(1)"
  SetLib lblTête(2), "Caption", "RAlblTête(2)"
  SetLib lblTête(3), "Caption", "RAlblTête(3)"
  SetLib lblTête(4), "Caption", "RAlblTête(4)"
  SetLib lblTête(5), "Caption", "RAlblTête(5)"
  SetLib lblTête(6), "Caption", "RAlblTête(6)"
  SetLib lblTête(7), "Caption", "RAlblTête(7)"
  SetLib lblTête(8), "Caption", "RAlblTête(8)"
  SetLib lblTête(9), "Caption", "RAlblTête(9)"
  SetLib lblTête(10), "Caption", "RAlblTête(10)"
  SetLib lblTête(11), "Caption", "RAlblTête(11)"
  SetLib lblTête(12), "Caption", "RAlblTête(12)"
  SetLib lblTête(13), "Caption", "RAlblTête(13)"
  SetLib lblTête(14), "Caption", "RAlblTête(14)"
  SetLib lblTête(15), "Caption", "RAlblTête(15)"
  SetLib lblTête(16), "Caption", "RAlblTête(16)"
  SetLib lblTête(17), "Caption", "RAlblTête(17)"
  SetLib lblTête(18), "Caption", "RAlblTête(18)"
  SetLib lblTête(19), "Caption", "RAlblTête(19)"
  SetLib lblTête(20), "Caption", "RAlblTête(20)"
  SetLib lblTête(21), "Caption", "RAlblTête(21)"
  SetLib lblTête(22), "Caption", "RAlblTête(22)"
  SetLib lblTête(23), "Caption", "RAlblTête(23)"
  SetLib lblTête(24), "Caption", "RAlblTête(24)"
  SetLib lblTête(25), "Caption", "RAlblTête(25)"
  SetLib lblTête(26), "Caption", "RAlblTête(26)"
  SetLib lblTête(27), "Caption", "RAlblTête(27)"
  SetLib lblTête(28), "Caption", "RAlblTête(28)"
  SetLib lblTête(29), "Caption", "RAlblTête(29)"
  SetLib lblTête(30), "Caption", "RAlblTête(30)"
  SetLib lblTête(31), "Caption", "RAlblTête(31)"
  SetLib lblTête(32), "Caption", "RAlblTête(32)"
  SetLib lblTête(33), "Caption", "RAlblTête(33)"
  SetLib lblTête(34), "Caption", "RAlblTête(34)"
  SetLib lblTête(35), "Caption", "RAlblTête(35)"
  
 ' Onglet Analyse
  SetLib lblAnalyse(0), "Caption", "RAlblAnalyse(0)"
  SetLib lblAnalyse(1), "Caption", "RAlblAnalyse(1)"
  SetLib lblAnalyse(2), "Caption", "RAlblAnalyse(2)"
  SetLib lblAnalyse(3), "Caption", "RAlblAnalyse(3)"
  SetLib lblAnalyse(4), "Caption", "RAlblAnalyse(4)"
  SetLib lblAnalyse(5), "Caption", "RAlblAnalyse(5)"
  SetLib lblAnalyse(6), "Caption", "RAlblAnalyse(6)"
  SetLib lblAnalyse(7), "Caption", "RAlblAnalyse(7)"
  SetLib lblAnalyse(8), "Caption", "RAlblAnalyse(8)"
  SetLib lblAnalyse(9), "Caption", "RAlblAnalyse(9)"
  SetLib lblAnalyse(10), "Caption", "RAlblAnalyse(10)"
  SetLib lblAnalyse(11), "Caption", "RAlblAnalyse(11)"
  SetLib lblAnalyse(12), "Caption", "RAlblAnalyse(12)"
  SetLib lblAnalyse(13), "Caption", "RAlblAnalyse(13)"
  SetLib chkIE, "Caption", "RAchkIE"
  SetLib chkFax, "Caption", "RAchkFax"
  SetLib chkCongelé, "Caption", "RAchkCongelé"
  SetLib lblModeBoîtes, "Caption", "RAlblModeBoîtes"
  SetLib lblModeGermes, "Caption", "RAlblModeGermes"
  
  ' Onglet Résultats
  SetLib lblTitreRésultats, "Caption", "RAlblTitreRésultats"
  SetLib lblRésultats(0), "Caption", "RAlblRésultats(0)"
  SetLib lblRésultats(1), "Caption", "RAlblRésultats(1)"
  SetLib lblRésultats(2), "Caption", "RAlblRésultats(2)"
  SetLib lblRésultats(3), "Caption", "RAlblRésultats(3)"
  SetLib lblRésultats(11), "Caption", "RAlblRésultats(11)"
  
  ' Onglet Planning
  SetLib lblPlanning(0), "Caption", "RAlblPlanning(0)"
  SetLib lblPlanning(1), "Caption", "RAlblPlanning(1)"
  SetLib lblPlanning(2), "Caption", "RAlblPlanning(2)"
  SetLib lblPlanning(12), "Caption", "RAlblPlanning(12)"
  SetLib lblPlanning(13), "Caption", "RAlblPlanning(13)"
  SetLib lblPlanning(14), "Caption", "RAlblPlanning(14)"
  SetLib lblPlanning(15), "Caption", "RAlblPlanning(15)"
  SetLib lblPlanning(16), "Caption", "RAlblPlanning(16)"
  SetLib lblPlanning(3), "Caption", "RAlblPlanning(3)"
    
  ' Onglet Divers
  SetLib fraPH, "Caption", "RAfraPH"
  SetLib lblTraçabilité(7), "Caption", "RAlblTraçabilité(7)"
  SetLib lblTraçabilité(2), "Caption", "RAlblTraçabilité(2)"
  SetLib lblTraçabilité(3), "Caption", "RAlblTraçabilité(3)"
  SetLib fraLabo, "Caption", "RAfraLabo"
  SetLib lblTraçabilité(8), "Caption", "RAlblTraçabilité(8)"
  SetLib lblTraçabilité(4), "Caption", "RAlblTraçabilité(4)"
  SetLib lblTraçabilité(6), "Caption", "RAlblTraçabilité(6)"
  SetLib lblTraçabilité(11), "Caption", "RAlblTraçabilité(11)"
  SetLib lblTraçabilité(9), "Caption", "RAlblTraçabilité(9)"
  SetLib lblTraçabilité(13), "Caption", "RAlblTraçabilité(13)"
  SetLib lblTraçabilité(10), "Caption", "RAlblTraçabilité(10)"
  SetLib lblTraçabilité(5), "Caption", "RAlblTraçabilité(5)"
  SetLib lblTraçabilité(0), "Caption", "RAlblTraçabilité(0)"
  SetLib lblTraçabilité(12), "Caption", "RAlblTraçabilité(12)"
  SetLib lblTraçabilité(1), "Caption", "RAlblTraçabilité(1)"
 
 
  ' Nom des onglets
  SetLib tsTab.Tabs(1), "Caption", "RAtsTête"
  SetLib tsTab.Tabs(1), "ToolTipText", "RAtsTête.tt"
  SetLib tsTab.Tabs(2), "Caption", "RAtsAnalyse"
  SetLib tsTab.Tabs(2), "ToolTipText", "RAtsAnalyse.tt"
  SetLib tsTab.Tabs(3), "Caption", "RAtsRésultats"
  SetLib tsTab.Tabs(3), "ToolTipText", "RAtsRésultats.tt"
  SetLib tsTab.Tabs(4), "Caption", "RAtsplanning"
  SetLib tsTab.Tabs(4), "ToolTipText", "RAtsplanning.tt"
  SetLib tsTab.Tabs(5), "Caption", "RAtsDivers"
  SetLib tsTab.Tabs(5), "ToolTipText", "RAtsDivers.tt"
 
  ' Tool Tip des boutons
  SetLib tbBoutons.Buttons("Contrôler"), "ToolTipText", "RAtbContrôler.tt"
  SetLib tbBoutons.Buttons("Valider"), "ToolTipText", "RAtbValider.tt"
  SetLib tbBoutons.Buttons("Enregistrer"), "ToolTipText", "RAtbEnregistrer.tt"
  SetLib tbBoutons.Buttons("EnregistrerQuitter"), "ToolTipText", "RAtbEnregQuit.tt"
  SetLib tbBoutons.Buttons("Quitter"), "ToolTipText", "RAtbQuitter.tt"
  SetLib tbBoutons.Buttons("Suivant"), "ToolTipText", "RAtbSuivant.tt"
  SetLib tbBoutons.Buttons("Supprimer"), "ToolTipText", "RAtbSupprimer.tt"
    
  ' En-Tête du tableau Ajout Germe
  Dim sMsg1 As String
  sMsg1 = sGetIntlLib("RAtêteGermes", "<Germe    |Méth|Unité         |>m             |>Seuil         ")
  fgGermes.FormatString = Subst(sMsg1, vbCrLf, "|")
 
  ' En-Tête du tableau Ajout Milieu
  Dim sMsg2 As String
  sMsg2 = sGetIntlLib("RAtêteMilieu", "<Milieu    |>Dil  |>Qté  |>Facteur  |>No b|<Type  |Légende")
  fgBoîtes.FormatString = Subst(sMsg2, vbCrLf, "|")
  
   ' En-Tête du tableau Résultats
  Dim sMsg3 As String
  sMsg3 = sGetIntlLib("RAtêteRésultats", "<Germe                                                                        |>Résultat    |>Critère      |<CPar |^Etat")
  fgRésultat.FormatString = Subst(sMsg3, vbCrLf, "|")
End Sub

