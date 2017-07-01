VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmRA 
   Caption         =   "Patientez, chargement du RA en cours�"
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
   Begin VB.CheckBox chkSaisieValid�e 
      Caption         =   "Saisie valid�e"
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
            Key             =   "Contr�ler"
            Object.ToolTipText     =   "Contr�ler la coh�rence entre les champs"
            ImageKey        =   "imgContr�ler"
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
            Object.ToolTipText     =   "Fermer la fen�tre sans enregistrer (F3 ou Alt+F4)"
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
            Object.ToolTipText     =   "Supprimer le CRA courant et la liste de bo�tes"
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
      Begin VB.TextBox txtDateTourn�e 
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
         Caption         =   "Langue d'�dition :"
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
         Caption         =   "Date tourn�e :"
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
      Begin VB.TextBox txtCTrafiqu�e 
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
      Begin MSFlexGridLib.MSFlexGrid fgR�sultat 
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
         FormatString    =   "<Germe                                                                        |>R�sultat    |>Crit�re      |<CPar |^Etat"
      End
      Begin VB.Label lblTitreR�sultats 
         AutoSize        =   -1  'True
         Caption         =   "R�sultats :"
         Height          =   210
         Left            =   0
         TabIndex        =   183
         Tag             =   "204"
         Top             =   0
         Width           =   1020
      End
      Begin VB.Label lblR�sultats 
         AutoSize        =   -1  'True
         Caption         =   "C. trafiqu�e :"
         Height          =   210
         Index           =   11
         Left            =   0
         TabIndex        =   196
         Tag             =   "204"
         Top             =   4920
         Width           =   1245
      End
      Begin VB.Label lblR�sultats 
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
      Begin VB.Label lblR�sultats 
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
      Begin VB.Label lblR�sultats 
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
      Begin VB.Label lblR�sultats 
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
   Begin VB.TextBox txtR�f�rence 
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
   Begin VB.TextBox txtPr�fixe 
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
      Begin VB.CommandButton btnD�tailFRT 
         Caption         =   "D�tail�"
         Height          =   315
         Left            =   2700
         TabIndex        =   243
         ToolTipText     =   "Affiche des infos sur la FRT indiqu�e"
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
         Begin VB.Label lblTra�abilit� 
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
         Begin VB.Label lblTra�abilit� 
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
         Begin VB.Label lblTra�abilit� 
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
         Begin VB.Label lblTra�abilit� 
            AutoSize        =   -1  'True
            Caption         =   "D�but analyse :"
            Height          =   210
            Index           =   4
            Left            =   120
            TabIndex        =   218
            Tag             =   "204"
            Top             =   660
            Width           =   1500
         End
         Begin VB.Label lblTra�abilit� 
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
         Begin VB.Label lblTra�abilit� 
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
         Begin VB.Label lblTra�abilit� 
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
         Begin VB.Label lblTra�abilit� 
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
         Begin VB.Label lblTra�abilit� 
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
      Begin VB.Label lblTra�abilit� 
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
      Begin VB.Label lblTra�abilit� 
         AutoSize        =   -1  'True
         Caption         =   "N� FRT :"
         Height          =   210
         Index           =   12
         Left            =   0
         TabIndex        =   241
         Tag             =   "204"
         Top             =   4860
         Width           =   765
      End
      Begin VB.Label lblTra�abilit� 
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
      Begin VB.Label lblTra�abilit� 
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
      Begin VB.Label lblTra�abilit� 
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
            Caption         =   "T�te"
            Key             =   "T�te"
            Object.ToolTipText     =   "Partie haute du CRA"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Analyse"
            Key             =   "Analyse"
            Object.ToolTipText     =   "Informations relatives � l'analyse"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "R�sultats"
            Key             =   "R�sultats"
            Object.ToolTipText     =   "R�sultats de l'analyse"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Planning"
            Key             =   "Planning"
            Object.ToolTipText     =   "Informations relatives � la planification"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Divers"
            Key             =   "Divers"
            Object.ToolTipText     =   "Tra�abilit� de l'�chantillon"
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
      Begin VB.TextBox txtPrixSp�cifique 
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
      Begin VB.TextBox txtTrait�Par 
         Height          =   315
         Left            =   1860
         MaxLength       =   5
         TabIndex        =   131
         Tag             =   "200"
         Top             =   1800
         Width           =   555
      End
      Begin VB.CheckBox chkCongel� 
         Caption         =   "Co&ngel� par le labo"
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
      Begin VB.CommandButton btnModifieBo�te 
         Caption         =   "m"
         Height          =   315
         Left            =   7680
         TabIndex        =   148
         ToolTipText     =   "Modifie une bo�te de la liste"
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
      Begin VB.TextBox txtRangEchS�rie 
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
      Begin VB.TextBox txtNumS�rie 
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
      Begin VB.TextBox txtCrit�re 
         Height          =   315
         Left            =   1860
         MaxLength       =   10
         TabIndex        =   104
         Tag             =   "200"
         Top             =   0
         Width           =   1395
      End
      Begin VB.TextBox txtTitreCrit�re 
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
      Begin VB.CommandButton btnEnl�veGerme 
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
      Begin VB.CommandButton btnAjouteBo�te 
         Caption         =   "+"
         Height          =   315
         Left            =   6840
         TabIndex        =   146
         ToolTipText     =   "Ajoute une bo�te � la liste"
         Top             =   2220
         Width           =   315
      End
      Begin VB.CommandButton btnEnl�veBo�te 
         Caption         =   "-"
         Height          =   315
         Left            =   7260
         TabIndex        =   147
         ToolTipText     =   "Retire une bo�te de la liste"
         Top             =   2220
         Width           =   315
      End
      Begin MSFlexGridLib.MSFlexGrid fgBo�tes 
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
         FormatString    =   "<Milieu    |>Dil  |>Qt�  |>Facteur  |>No b|<Type  |L�gende"
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
         FormatString    =   "<Germe    |M�th|Unit�         |>m             |>Seuil         "
      End
      Begin SCRAW.ChampDate txtDateDebAnPr�vue 
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
      Begin SCRAW.BDCombo cboMM�thode 
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
         ToolTipText     =   "Cliquez pour voir le r�le de ce nouveau champ"
         Top             =   720
         Visible         =   0   'False
         Width           =   405
         _ExtentX        =   714
         _ExtentY        =   556
         _Version        =   393216
         Caption         =   "�"
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
         ToolTipText     =   "Cliquez pour voir le r�le de ce nouveau champ"
         Top             =   1800
         Visible         =   0   'False
         Width           =   405
         _ExtentX        =   714
         _ExtentY        =   556
         _Version        =   393216
         Caption         =   "�"
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
         Caption         =   "Prix sp�cifique :"
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
         Caption         =   "&Date de d�but d'analyse pr�vue :"
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
      Begin VB.Label lblModeBo�tes 
         AutoSize        =   -1  'True
         Caption         =   "Mode des bo�tes"
         Height          =   210
         Left            =   5100
         TabIndex        =   199
         Top             =   4740
         Width           =   1560
      End
      Begin VB.Label lblAnalyse 
         AutoSize        =   -1  'True
         Caption         =   "&Trait� par :"
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
         Caption         =   "N� s�rie :"
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
         Caption         =   "Crit&�re :"
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
         Caption         =   "MM�thod&e :"
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
         Caption         =   "Liste des &bo�tes :"
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
      Begin VB.TextBox txtNomIntOp�r 
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
      Begin VB.TextBox txtIntOp�r 
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
      Begin VB.TextBox txtCondPr�l 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   1860
         TabIndex        =   88
         Tag             =   "200"
         Top             =   7560
         Width           =   720
      End
      Begin VB.TextBox txtNomCondPr�l 
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
      Begin VB.TextBox txtSecteurPr�l 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   6960
         TabIndex        =   85
         Tag             =   "200"
         Top             =   6960
         Width           =   720
      End
      Begin VB.TextBox txtNomSecteurPr�l 
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
      Begin VB.TextBox txt�tatDiv 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   6960
         TabIndex        =   79
         Tag             =   "200"
         Top             =   6420
         Width           =   720
      End
      Begin VB.TextBox txtNom�tatDiv 
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
      Begin VB.TextBox txtNom�tatPhy 
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
      Begin VB.TextBox txt�tatPhy 
         BackColor       =   &H00C0E0FF&
         Height          =   315
         Left            =   6960
         TabIndex        =   73
         Tag             =   "200"
         Top             =   5880
         Width           =   720
      End
      Begin VB.TextBox txtNomNiv�labo 
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
      Begin VB.TextBox txtNiv�labo 
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
      Begin VB.TextBox txtCompl�mentNom 
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
      Begin VB.TextBox txtCrit�reInfo 
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
      Begin SCRAW.ChampTemp�rature txtTemp�ratureProduit 
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
      Begin SCRAW.ChampHeure txtHeurePr�l�vement 
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
      Begin SCRAW.ChampDate txtDatePr�l�vement 
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
      Begin SCRAW.ChampDate txtDatePr�paration 
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
      Begin SCRAW.ChampTemp�rature txtTemp�ratureAmbiance 
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
      Begin SCRAW.ChampTemp�rature txtTemp�ratureR�ception 
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
      Begin SCRAW.ChampDate txtDateR�ception 
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
      Begin SCRAW.ChampHeure txtHeurePr�paration 
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
      Begin SCRAW.ChampDate txtDateD�conditionnement 
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
      Begin SCRAW.ChampHeure txtHeureR�ception 
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
      Begin SCRAW.ChampDate txtDateR�ceptionClient 
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
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "Date d�condit. :|[13]"
         Height          =   210
         Index           =   34
         Left            =   0
         TabIndex        =   122
         Tag             =   "204"
         Top             =   3420
         Width           =   1980
      End
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "Int. op�rateur :|[9]"
         Height          =   210
         Index           =   33
         Left            =   0
         TabIndex        =   95
         Tag             =   "204"
         Top             =   8160
         Width           =   1815
      End
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "Cond. de pr�l. :|[15]"
         Height          =   210
         Index           =   31
         Left            =   0
         TabIndex        =   87
         Tag             =   "204"
         Top             =   7620
         Width           =   1935
      End
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "Secteur pr�l�v. :|[7]"
         Height          =   210
         Index           =   30
         Left            =   5100
         TabIndex        =   84
         Tag             =   "204"
         Top             =   7020
         Width           =   1905
      End
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "�tat de division :|[18]"
         Height          =   210
         Index           =   28
         Left            =   5100
         TabIndex        =   78
         Tag             =   "204"
         Top             =   6480
         Width           =   2055
      End
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "�tat physique :|[8]"
         Height          =   210
         Index           =   26
         Left            =   5100
         TabIndex        =   72
         Tag             =   "204"
         Top             =   5940
         Width           =   1785
      End
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "Niv. d'�laboration :|[19]"
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
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "Date de r&�ception :"
         Height          =   210
         Index           =   23
         Left            =   0
         TabIndex        =   63
         Tag             =   "204"
         Top             =   5400
         Width           =   1830
      End
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "Aspect �chantillon :|[34]"
         Height          =   210
         Index           =   24
         Left            =   5100
         TabIndex        =   66
         Tag             =   "204"
         Top             =   5385
         Width           =   2310
      End
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "Unit� de vente :|[30]"
         Height          =   210
         Index           =   22
         Left            =   5100
         TabIndex        =   61
         Tag             =   "204"
         Top             =   5025
         Width           =   1995
      End
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "Comp&l�ment nom :"
         Height          =   210
         Index           =   1
         Left            =   0
         TabIndex        =   5
         Tag             =   "204"
         Top             =   420
         Width           =   1785
      End
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "Date+heure pr�l :|[5]"
         Height          =   210
         Index           =   3
         Left            =   0
         TabIndex        =   9
         Tag             =   "204"
         Top             =   1440
         Width           =   2040
      End
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "D&ate pr�paration :|[12]"
         Height          =   210
         Index           =   5
         Left            =   0
         TabIndex        =   16
         Tag             =   "204"
         Top             =   1800
         Width           =   2220
      End
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "T&� prod/amb/r�c. :|[6]"
         Height          =   210
         Index           =   4
         Left            =   5100
         TabIndex        =   12
         Tag             =   "204"
         Top             =   1440
         Width           =   2085
      End
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "Lieu d&e pr�l :[14]"
         Height          =   210
         Index           =   7
         Left            =   0
         TabIndex        =   21
         Tag             =   "204"
         Top             =   2160
         Width           =   1635
      End
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "Cadre de pr�l&�v. :|[10]"
         Height          =   210
         Index           =   18
         Left            =   5100
         TabIndex        =   52
         Tag             =   "204"
         Top             =   4320
         Width           =   2175
      End
      Begin VB.Label lblT�te 
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
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "R�f�rence ori&gine :"
         Height          =   210
         Index           =   17
         Left            =   0
         TabIndex        =   50
         Tag             =   "204"
         Top             =   4320
         Width           =   1785
      End
      Begin VB.Label lblT�te 
         AutoSize        =   -1  'True
         Caption         =   "Option&s �dition :"
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
            Key             =   "imgContr�ler"
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
   Begin VB.Label lblR�f�rence 
      AutoSize        =   -1  'True
      Caption         =   "R�f�rence :"
      Height          =   210
      Left            =   180
      TabIndex        =   160
      Tag             =   "228"
      Top             =   600
      Width           =   1080
   End
   Begin VB.Label lblEtablissement 
      AutoSize        =   -1  'True
      Caption         =   "�tabliss. :"
      Height          =   210
      Left            =   180
      TabIndex        =   157
      Tag             =   "204"
      Top             =   960
      Width           =   930
   End
   Begin VB.Menu mnuRA 
      Caption         =   "&RA"
      Begin VB.Menu cmdContr�ler 
         Caption         =   "&Contr�ler"
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
      Begin VB.Menu cmdM�moriser 
         Caption         =   "&M�moriser"
         Shortcut        =   ^{F5}
      End
      Begin VB.Menu sepF5 
         Caption         =   "-"
      End
      Begin VB.Menu cmdF5Valeur 
         Caption         =   "&Valeur m�moris�e du champ"
      End
      Begin VB.Menu cmdF5T�te 
         Caption         =   "&T�te m�moris�e"
         Shortcut        =   +{F5}
      End
      Begin VB.Menu cmdF5Analyse 
         Caption         =   "&Analyse pr�c�dente"
      End
   End
   Begin VB.Menu mnuRech 
      Caption         =   "Rec&herche"
      Begin VB.Menu cmdRechEtablissement 
         Caption         =   "&Etablissement�"
      End
      Begin VB.Menu cmdRechDate 
         Caption         =   "D&ate�"
      End
      Begin VB.Menu cmdRechProduit 
         Caption         =   "&Produit�"
      End
      Begin VB.Menu cmdRechFabricant 
         Caption         =   "&Fabricant�"
      End
      Begin VB.Menu cmdRechDistrib 
         Caption         =   "&Distributeur�"
      End
      Begin VB.Menu cmdRechConclusion 
         Caption         =   "Conc&lusion�"
      End
      Begin VB.Menu sepa 
         Caption         =   "-"
      End
      Begin VB.Menu cmdLibell�RA 
         Caption         =   "&1. Stade de pr�l�vement"
         Index           =   1
      End
      Begin VB.Menu cmdLibell�RA 
         Caption         =   "&2. Intervention op�rateur"
         Index           =   2
      End
      Begin VB.Menu cmdLibell�RA 
         Caption         =   "&3. Mode de conditionnement"
         Index           =   3
      End
      Begin VB.Menu cmdLibell�RA 
         Caption         =   "&4. Niveau d'�laboration"
         Index           =   4
      End
      Begin VB.Menu cmdLibell�RA 
         Caption         =   "&5. �tat de division"
         Index           =   5
      End
      Begin VB.Menu cmdLibell�RA 
         Caption         =   "&6. �tat physique"
         Index           =   6
      End
      Begin VB.Menu cmdLibell�RA 
         Caption         =   "&7. Technologie de fabrication"
         Index           =   7
      End
      Begin VB.Menu cmdLibell�RA 
         Caption         =   "&8. Aspect de l'�chantillon"
         Index           =   8
      End
      Begin VB.Menu cmdLibell�RA 
         Caption         =   "&9. Conditions de pr�l�vement"
         Index           =   9
      End
      Begin VB.Menu cmdLibell�RA 
         Caption         =   "10. Cadre du pr�l�vement"
         Index           =   10
      End
      Begin VB.Menu cmdLibell�RA 
         Caption         =   "11. Lieu de pr�l�vement"
         Index           =   11
      End
      Begin VB.Menu cmdLibell�RA 
         Caption         =   "12. &Contenant"
         Index           =   12
      End
   End
   Begin VB.Menu mnuAvanc� 
      Caption         =   "Avanc&�"
      Begin VB.Menu cmdForcerRattachementFRTCourante 
         Caption         =   "&Forcer le rattachement � la FRT courante"
      End
      Begin VB.Menu cmdEffacerNum�roFRT 
         Caption         =   "&Effacer le rattachement � la FRT"
      End
      Begin VB.Menu cmdTrafiquerFRT 
         Caption         =   "&Trafiquer le n� de FRT sans contr�le"
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
         Caption         =   "&A propos de�"
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
         Caption         =   "&Afficher les �tiquettes"
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
'  1/12/1997 PV Bug effacement fabricant et distributeur r�gl�
'  4/12/1997 PV Contr�le des DLC pour le cadre de pr�l�vement 8
' 12/12/1997 PV Message si DatePrel<now-4j et pas analyse � la DLC(cpr=8) ou exp�rimentale(cpr=5)
' 16/12/1997 PV Contr�le de date de pr�l�vement d�bray� (Langlais)�
' 22/12/1997 PV Date de d�but d'analyse pr�vue; cadre de pr�l�vement 37 (analyse diff�r�e)
'  9/01/1998 PV Effacement de n� de FRT
' 27/01/1998 PV Possibilit� de passer outre l'absence d'option D sans bo�tes
' 30/01/1998 PV W12: Crit�re List�ria; avertissement si n� de FRT et analyse future
'  2/02/1998 PV Message si etb planifi� sous une autre r�f�rence, si date de pr�l�vement pas homog�ne,
' 12/02/1998 PV Date d'analyse pr�vue un lundi
' 20/02/1998 PV bCheckIE n'est plus bloquant
' 22/07/1998 PV Message en cas de germe sans bo�te
' 27/07/1998 PV Champs suppl�mentaires
'  7/08/1998 PV Intervention op�rateur
' 10/08/1998 PV Heure de pr�paration; fin des champs non imprim�s en jaune
' 26/08/1998 PV Tous les champs pris en compte dans Focus
'  2/09/1998 PV On efface le n� de produit si crit�re produit<>crit�re labo
' 15/10/1998 PV Champ cCorrection
' 29/10/1998 PV Contr�le option �dition Z uniquement si McDo
'  2/11/1998 PV Listeria W20, W21, W22 (saisie crit�re / option L)
' 17/12/1998 PV Nouveau fichier produits; pr�sentation 3col "nouveau"; DLC secondaire�
' 21/12/1998 PV 1.4: Nouveaux fichiers satellites; vieux libell�s connen�ant par !; nouveaux produits avec t1=0
'  6/01/1999 PV Gestion locale du [�tat X] dans le nom de produit; gestion de la date de d�conditionnement; F5 pour les nouveaux champs
'  8/01/1999 PV Verrouillage des nouveaux champs, ��tat � �limin�, pb date pr�l invalide
' 22/01/1999 PV M�tam�thode B, AFNOR Bis
' 10/02/1999 NC Internationalisation
' 29/03/1999 PV 26 m�tam�thodes
' 29/04/1999 PV D�lai des analyses courantes � 5 jours
'  3/05/1999 PV Fin de l'ancien fichier produit
' 18/11/1999 PV bCheckAlertesSodexho
'  5/02/2000 PV On efface les r�sultats pr�c�dents en cas de "F5 analyse"...
'  5/02/2000 PV Si option labo D, pas d'avertissement pour germes sans bo�tes
'  4/07/2000 PV Pas de mise � jour nompro/crit�re info pour les saisies ant�rieures au 3/7/2000
'  3/12/2000 PV Classe de document
'  5/12/2000 PV +HeureR�ception; activation DLC2, famille, date d�conditionnement; Gestion du prix sp�cifique; Date de r�ception client
'  5/02/2001 PV Recopie de cStatusModif dans la recopie du corps
' 23/05/2001 PV Pas de classe Ch sur tripoli/co2/hagar
'  5/06/2001 PV Affectation autoris�e des crit�res OGM*
' 17/07/2001 PV La suppression de RA saisi le jour m�me n'est plus une Op privil�gi�e
'  3/08/2001 PV Classe de document Le (Legionelles)
'  7/08/2001 PV Contr�le de plus de deux | dans les obs
' 20/08/2001 PV bCrit�reImposable r��crit en se basant sur la classe de document
' 23/11/2001 PV Contr�les cra.dDatePr�l<=cra.dDateR�cep, cra.dDateR�cep<=cra.dDateDebAnPr�vue et cra.dDateR�cep<=cra.dDateDebAn


Option Explicit

Private iCurFrame As Integer    ' Cadre courant visible

' Structure de donn�es associ�e � la feuille
Public iTable As eTableRA      ' Table d'origine des donn�es
Public cra As New RA

' Pour ne pas effacer les germes lors de l'initialisation des champs crit�re, MM�thode, �
Private bModeChargement As Boolean

' Gestion et affichage de l'indicateur de modification des donn�es
Private sTitreFen�tre As String
Private bDirty As Boolean

' Pour conna�tre l'�tat du shift lors d'un double-clic, on m�morise le param�tre
' button lors d'un �v�nement MouseDown�
Private iShift As Integer

' Orthographe
Dim sOrthCompl�mentNom As String
Dim sOrthObs As String

Dim iTabIndex As Integer


'========================================================
' Protection contre les probl�mes de r�-entrance, m�canisme g�n�ral

Sub DoActionSuivante(ByVal sAction As String)
  Select Case sAction
    Case "txtNumPro_LostFocus": txtNumPro_LostFocus
    Case "txtNumFab_LostFocus": txtNumFab_LostFocus
    Case "txtNumDis_LostFocus": txtNumDis_LostFocus
    Case "txtCompl�mentNom_LostFocus": txtCompl�mentNom_LostFocus
    Case "txtObs_LostFocus": txtObs_LostFocus
    Case Else: MsgBox "frmRA.DoActionSuivante: Action suivante " & sAction & " inconnue !", vbCritical, sNomApp: Stop
  End Select
End Sub


'========================================================

Private Function bContr�le() As Boolean
  bContr�le = False

  ' Contr�les individuels des champs, et transfert dans la structure de donn�es
  
  ' T�te
  If Not bCheckNumPro(True) Then Exit Function
  If Not bCheckCompl�mentNom(True) Then Exit Function
  If Not bCheckObs(True) Then Exit Function
  If Not bCheckDatePr�l�vement(True) Then Exit Function
  If Not bCheckHeurePr�l�vement(True) Then Exit Function
  If Not bCheckTemp�ratureProduit(True) Then Exit Function
  If Not bCheckTemp�ratureAmbiance(True) Then Exit Function
  If Not bCheckTemp�ratureR�ception(True) Then Exit Function
  If Not bCheckDatePr�paration(True) Then Exit Function
  If Not bCheckHeurePr�paration(True) Then Exit Function
  If Not bCheckCodeArticle(True) Then Exit Function
  If Not bCheckCodeFamille(True) Then Exit Function
  If Not bCheckLieuDePr�l�vement(True) Then Exit Function
  If Not bCheckConditionnement(True) Then Exit Function
  If Not bCheckInterventionOp�rateur(True) Then Exit Function
  If Not bCheckFabricant(True) Then Exit Function
  If Not bCheckDistributeur(True) Then Exit Function
  If Not bCheckDateFabrication(True) Then Exit Function
  If Not bCheckDateLivraison(True) Then Exit Function
  If Not bCheckDateR�ceptionClient(True) Then Exit Function
  If Not bCheckDateConditionnement(True) Then Exit Function
  If Not bCheckDateD�conditionnement(True) Then Exit Function
  If Not bCheckDateDLC(True) Then Exit Function
  If Not bCheckDateDLUO(True) Then Exit Function
  If Not bCheckIdLot(True) Then Exit Function
  If Not bCheckCodeEmballeur(True) Then Exit Function
  If Not bCheckDLC2(True) Then Exit Function
  If Not bCheckDateRetrait(True) Then Exit Function
  If Not bCheckCadreDePr�l�vement(True) Then Exit Function
  If Not bCheckRefOrigine(True) Then Exit Function
  If Not bCheckCodeFabricant(True) Then Exit Function
  If Not bCheckOptionsEdition(True) Then Exit Function
  If Not bCheckMarque(True) Then Exit Function
  If Not bCheckUV(True) Then Exit Function
  If Not bCheckDateR�ception(True) Then Exit Function
  If Not bCheckHeureR�ception(True) Then Exit Function
  If Not bCheckAspect�chantillon(True) Then Exit Function
  If Not bCheckNiveau�laboration(True) Then Exit Function
  If Not bCheck�tatPhysique(True) Then Exit Function
  If Not bCheckContenant(True) Then Exit Function
  If Not bCheck�tatDivision(True) Then Exit Function
  If Not bCheckTechnologieFabrication(True) Then Exit Function
  If Not bCheckSecteurPr�l�vement(True) Then Exit Function
  If Not bCheckConditionsPr�l�vement(True) Then Exit Function
  If Not bCheckInfosRab1(True) Then Exit Function
  If Not bCheckInfosRab2(True) Then Exit Function
  If Not bCheckNouveauxProduits(True) Then Exit Function
  
  
  ' Analyse
  If Not bCheckMM�thode(True) Then Exit Function
  If Not bCheckCrit�re(True) Then Exit Function
  If Not bCheckOptionsLabo(True) Then Exit Function
  If Not bCheckIE(True) Then Exit Function
  If Not bCheckFax(True) Then Exit Function
  If Not bCheckCongel�(True) Then Exit Function
  If Not bCheckRemarquesLabo(True) Then Exit Function
  If Not bCheckPrixSp�cifique(True) Then Exit Function
  If Not bCheckDevise(True) Then Exit Function
  If Not bCheckTrait�Par(True) Then Exit Function
  If Not bCheckDateDebAnPr�vue(True) Then Exit Function
  If Not bCheckGermes(True) Then Exit Function
  If Not bCheckBo�tes(True) Then Exit Function
  If Not bCheckDate2() Then Exit Function     ' Date de d�b analyse pr�vue / jour
  If Not bCheckClasseDoc(True) Then Exit Function
  
  ' Contr�les de coh�rence crois�s
  If Not bCheckCrit�reProduitAnalyse(True) Then Exit Function
  
  ' Quelques contr�les d'ant�riorit� de dates, la biblio libcra en fera d'autres
  If Not bChekAnt�riorit�Date(cra.dDatePr�l, Today, "date de pr�l�vement", "date du jour") Then Exit Function
  If Not bChekAnt�riorit�Date(cra.dDatePr�l, cra.dDateR�cep, "date de pr�l�vement", "date de r�ception labo") Then Exit Function
  If Not bChekAnt�riorit�Date(cra.dDateR�cep, cra.dDateDebAnPr�vue, "date de r�ception labo", "date d'analyse (pr�vue)") Then Exit Function
  If Not bChekAnt�riorit�Date(cra.dDateR�cep, cra.dDateDebAn, "date de r�ception labo", "date d'analyse (r�elle)") Then Exit Function
  bChekAnt�riorit�Date cra.dDatePr�l, cra.sDlc, "date de pr�l�vement", "DLC", True
  If Not bChekAnt�riorit�Date(cra.dDatePr�p, cra.dDatePr�l, "date de pr�paration", "date de pr�l�vement") Then Exit Function
  If Not bChekAnt�riorit�Date(cra.dDateFab, cra.dDatePr�l, "date de fabrication", "date de pr�l�vement") Then Exit Function
  If Not bChekAnt�riorit�Date(cra.dDateFab, cra.dDateCond, "date de fabrication", "date de conditionnement") Then Exit Function
  If Not bChekAnt�riorit�Date(cra.dDateCond, cra.dDatePr�l, "date de conditionnement", "date de pr�l�vement") Then Exit Function
  If Not bChekAnt�riorit�Date(cra.dDateLivr, cra.dDatePr�l, "date de livraison", "date de pr�l�vement") Then Exit Function
  If Not bChekAnt�riorit�Date(cra.dDateR�cepCli, cra.dDatePr�l, "date de r�ception client", "date de pr�l�vement") Then Exit Function
  If Not bChekAnt�riorit�Date(cra.dDateFab, cra.dDateLivr, "date de fabrication", "date de livraison") Then Exit Function
  If Not bChekAnt�riorit�Date(cra.dDateFab, cra.sDlc, "date de fabrication", "DLC") Then Exit Function
  If Not bChekAnt�riorit�Date(cra.dDateFab, cra.sDluo, "date de fabrication", "DLUO") Then Exit Function
  If Not bChekAnt�riorit�Date(cra.dDateLivr, cra.sDlc, "date de livraison", "DLC") Then Exit Function
  If Not bChekAnt�riorit�Date(cra.dDateLivr, cra.sDluo, "date de livraison", "DLUO") Then Exit Function
  
  ' Tests sp�cifiques
  bCheckAlertesSodexho True, False
  
  bContr�le = True
End Function


Private Function bContr�leValidation() As Boolean
  bContr�leValidation = False
  If Not bCheckAlertesSodexho(True, True) Then Exit Function

  bContr�leValidation = True
End Function



Private Function bChekAnt�riorit�Date(ByVal d1, ByVal d2, ByVal sD1 As String, ByVal sD2 As String, Optional bInformation As Boolean = False) As Boolean
  ' Pour DLC et DLUO, on autorise les dates compactes (ex: 280798)
  If Not IsDate(d2) Then
    If IsNull(d2) Then bChekAnt�riorit�Date = True: Exit Function
    If IsDateCompacte(d2) Then d2 = dD�codeDate(d2)
  End If
  
  If IsDate(d1) Then
    If IsDate(d2) Then
      If d1 = dAbsence Or d2 = dAbsence Then    ' Pas de contr�le par rapport � ABSENCE
        bChekAnt�riorit�Date = True
        Exit Function
      End If
      If CDate(d1) > CDate(d2) Then
        If bInformation Then
          MsgBox2i "CR100", sD1, sD2
          'MsgBox "Avertissement: La " & sD1 & " est post�rieure � la " & sD2 & "." & vbCrLf & vbCrLf & "V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
        Else
          MsgBox2i "CR101", sD1, sD2
          'MsgBox "La " & sD1 & " doit �tre ant�rieure � la " & sD2 & ".", vbExclamation, sNomApp
        End If
        If bShiftPressed Then
          bChekAnt�riorit�Date = True   ' Passe-droit
        Else
          bChekAnt�riorit�Date = False
        End If
        Exit Function
      End If
    End If
  End If
  bChekAnt�riorit�Date = True
End Function


' D�termine s'il s'agit d'un vieux libell�
Private Function bContr�leVieuxLibell�(txtField As TextBox, sFichier As String, sLibell� As String, bMessage As Boolean) As Boolean
  ' Avant le 1/1/99, pas de contr�le
  If cra.dDatePr�l < #1/1/1999# Then
    bContr�leVieuxLibell� = True
    Exit Function
  End If
  
  ' Contr�le non bloquant pour l'instant
  If Left(sLibell�, 1) = "!" Then
    If bMessage Then
          MsgBox2i "CR102", sFichier
          'MsgBox "Avertissement: Code " & sFichier & " incorrect !" & vbCrLf & vbCrLf & "Il s'agit d'un ancien libell� qui ne devrait plus �tre utilis�. L'utilisation de ce libell� sera impossible dans quelques jours." & vbCrLf & vbCrLf & "Pr�venez le pr�leveur et/ou la DOP.", vbInformation, sNomApp
    End If
  End If
  
  bContr�leVieuxLibell� = True
End Function


' Retourne vrai si le crit�re peut �tre impos� sur l'onglet labo
' Ok pour TIAC et les classes BM et Li
' On g�re un cache local en m�moire
Private Function bCrit�reImposable(s As String) As Boolean
  If s = "TIAC" Then
    bCrit�reImposable = True
    Exit Function
  End If
  
  Static colCacheCrit�resAutoris�s As New Collection
  
  ' On cherche d'abord dans le cache...
  Dim bRes As Boolean
  On Error Resume Next
  bRes = colCacheCrit�resAutoris�s(s)
  If Err = 0 Then
    bCrit�reImposable = bRes
    Exit Function
  End If
  On Error GoTo 0
  
  ' Puis on interroge le d�mon
  Dim sClasse As String
  sClasse = sLireCrit�reClasseDoc(s)
  bRes = UCase(sClasse) = "LI" Or UCase(sClasse) = "BM"
  colCacheCrit�resAutoris�s.Add bRes, s
  bCrit�reImposable = bRes
  
'  bCrit�reImposable = s = "W6" Or s = "W8" Or s = "W9" Or s = "W11" Or s = "W12" Or s = "W20" Or s = "W21" Or s = "W22" Or s = "TIAC" Or _
'    s = "W35" Or s = "W37" Or s = "W38" Or _
'    s = "FB297" Or s = "FB298" Or s = "FB299" Or s = "FB333" Or s = "FB348" Or s = "FB692" Or _
'    s = "FB712" Or s = "FB713" Or s = "FB714" Or s = "FB715" Or s = "FB716" Or s = "FB722" Or _
'    s = "FB723" Or s = "FB732" Or s = "FB793" Or s = "FB809" Or s = "FB819" Or s = "FB820" Or _
'    s = "FB846" Or s = "FB848" Or s = "FB858" Or s = "FB861" Or s = "FB873" Or s = "FB968" Or _
'    s Like "OGM*"
End Function


' Compare le crit�re du produit et le crit�re demand� pour l'analyse
' Ne compare que les parties avant un point
' Tol�rance pour les analyses  W6, W8, W9, W11, W12, W20, W21, W22 et TIAC
Private Function bCheckCrit�reProduitAnalyse(bMessage As Boolean) As Boolean
  Dim sCrit�rePro As String, sCrit�reAnalyse As String
  Dim p As Integer
  
  sCrit�rePro = txtCrit�reInfo
  p = InStr(sCrit�rePro, ".")
  If p > 1 Then sCrit�rePro = Left(sCrit�rePro, p - 1)
  sCrit�reAnalyse = txtCrit�re
  p = InStr(sCrit�reAnalyse, ".")
  If p > 1 Then sCrit�reAnalyse = Left(sCrit�reAnalyse, p - 1)
  
  If bCrit�reImposable(sCrit�reAnalyse) Then
    bCheckCrit�reProduitAnalyse = True
    Exit Function
  End If
  
  If sCrit�rePro <> sCrit�reAnalyse Then
    MsgBox2i "CR103b"
    ' Attention, le crit�re associ� au produit est incompatible avec le crit�re d'analyse demand�.||Seuls les crit�res associ�s � la classe Li peuvent �tre affect�s ind�pendamment du crit�re du produit.||Vous devez ressaisir le n� de produit et le crit�re.
    txtNumPro = ""
    txtNomPro = ""
    txtCrit�reInfo = ""
    txtCrit�re = ""
    bCheckCrit�reProduitAnalyse = False
    Focus txtNumPro
    Exit Function
  End If
  
  bCheckCrit�reProduitAnalyse = True
End Function


Private Function bCheckAlertesSodexho(bMessage As Boolean, bModeValidation As Boolean) As Boolean
  bCheckAlertesSodexho = True
  If cra.sEtb = "1212" Or cra.iSec = 27257 Then ' A remplacer par une option
    Dim sMsg As String
    If cra.hCl�2 = 1 And cra.hCadrePr�l <> 33 Then
      sMsg = "Pour ce crit�re, le cadre de pr�l�vement devrait �tre '33: Sodexho Mati�re premi�re � cuire'."
    End If
    If cra.hCl�2 = 2 And cra.hCadrePr�l <> 34 Then
      sMsg = "Pour ce crit�re, le cadre de pr�l�vement devrait �tre '34: Sodexho Produit � consommer en l'�tat'."
    End If
    If sMsg <> "" Then
      sMsg = "ALERTE SODEXHO " & IIf(bModeValidation, "Validation", "Saisie") & vbCrLf & vbCrLf & sMsg
      If bModeValidation Then
        sMsg = sMsg & vbCrLf & "Validation interdite, contactez la DOP."
      Else
        sMsg = sMsg & vbCrLf & "V�rifiez imp�rativement aupr�s de la DOP avant la validation d�finitive."
      End If
      MsgBox sMsg, IIf(bModeValidation, vbExclamation, vbInformation), App.Title
      D�monJournalUnix "Alerte Sodexho", "", sMsg & "|ref=" & cra.sRef & "|cri_cle2=" & cra.hCl�2 & "|CP saisi=" & cra.hCadrePr�l
      bCheckAlertesSodexho = False
    End If
  End If
End Function


' =============================================================
' Validation de la saisie
' A priori la personne ayant fait la saisie ne peut pas valider, mais il suffit
' de valider une deuxi�me fois pour que �a passe�

Private Sub DoValidation()
  If bBlocageEnCours Then
    MsgBox2i "CR104"
    'MsgBox "Validation non disponible, attendez quelques secondes�", vbInformation, sNomApp
    Exit Sub
  End If

  If bDirty Then
    MsgBox2i "CR105"
    'MsgBox "Les informations ont �t� modifi�es. Vous devez enregistrer avant de valider.", vbInformation, sNomApp
    Exit Sub
  End If
  
  If cra.cEtatPH = "" Then
    MsgBox2i "CR106"
    'MsgBox "Impossible de valider un nouveau RA qui n'a pas �t� enregistr� !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  If cra.cEtatPH > "2" Then
    MsgBox2i "CR107"
    'MsgBox "RA d�j� valid� !", vbExclamation, sNomApp
    Exit Sub
  End If
    
  ' M�canisme pas trop rigide dissuadant la personne ayant fait la saisie de valider
  Static iNbMsg As Integer
  If iNbMsg = 0 And cra.hOperSaisPH = iNumOp�rateur And cra.hOperSaisPH <> 46 And chkSaisieValid�e.Value = vbUnchecked Then
    MsgBox2i "CR108"
    'MsgBox "La personne qui a fait la saisie ne peut pas valider la partie haute !", vbExclamation, sNomApp
    iNbMsg = iNbMsg + 1
    Exit Sub
  End If
  
  ' Contr�les sp�cifiques pour la validation
  If Not bContr�leValidation Then Exit Sub
  
  
  ' On valide
  cra.cEtatPH = "3"   ' Valid�
  cra.hOperValPH = iNumOp�rateur
  cra.dDateValPH = Now
  
  ' et on l'affiche
  txtEtatPH = cra.cEtatPH
  txtNomEtatPH = sLibell�EtatPH(cra.cEtatPH)
  txtOperValPH = iNumOp�rateur
  txtNomValPH = sNomOp�rateur
  txtDateValPH = Now
  
  ValideRA iTable, cra
  
  ' On passe en mode visualisation, pour ne rien modifier apr�s une validation
  InitVisualisation
End Sub


Private Sub DoAnnulerValidation()
  If bBlocageEnCours Then
    MsgBox2i "CR109"
    'MsgBox "Annulation de la validation non disponible, attendez quelques secondes�", vbInformation, sNomApp
    Exit Sub
  End If

  If cra.cEtatPH <> "3" Then
    MsgBox2i "CR110"
    'MsgBox "RA non valid� !", vbExclamation, sNomApp
    Exit Sub
  End If

  If cra.cEtatLabo >= "3" Then
    MsgBox2i "CR111"
    'MsgBox "Strictement impossible d'annuler la validation d'un RA d�j� valid� par le labo", vbExclamation, sNomApp
    Exit Sub
  End If
  
  Dim iR�ponse As VbMsgBoxResult
  Dim sMsg As String
  sMsg = sGetIntlLib("CR112", "Question 112")
  iR�ponse = MsgBox(sMsg, vbQuestion + vbYesNo, sNomApp)
  'iR�ponse = MsgBox("Attention, l'annulation de validation d'un RA peut perturber le fonctionnement des analyses." & vbCrLf & "Pr�venir imp�rativement le laboratoire en cas de modification des informations de l'onglet Analyse, ou en cas de suppression de RA / modification d'�tablissement ou de r�f�rence avant que l'analyse soit lanc�e." & vbCrLf & vbCrLf & _
      "Voulez-vous continuer ?", vbQuestion + vbYesNo, sNomApp)
  If iR�ponse = vbNo Then Exit Sub
  
  ' On annule la validation
  cra.cEtatPH = "2"   ' Pas encore valid�
  cra.hOperValPH = Null
  cra.dDateValPH = Null
  
  ' et on l'affiche (en fait inutile, on ferme�)
  txtEtatPH = cra.cEtatPH
  txtNomEtatPH = sLibell�EtatPH(cra.cEtatPH)
  txtOperValPH = ""
  txtNomValPH = ""
  txtDateValPH = ""
  
  ValideRA iTable, cra     ' C'est la m�me fonction qui valide et qui invalide
  
  ' et on ferme le RA, pour forcer la relecture ult�rieure
  Unload Me
End Sub


' =============================================================
' M�canisme bDirty

Public Sub SetDirty()
  If Not bModeChargement Then
    If Not bDirty Then
      bDirty = True
      Caption = sTitreFen�tre & sGetIntlLib("RAtxtDirty", " [Modifi�]")
      
      cmdEnregistrer.Enabled = True
      cmdEnregistrerQuitter.Enabled = True
      tbBoutons.Buttons("Enregistrer").Enabled = True
      tbBoutons.Buttons("EnregistrerQuitter").Enabled = True
    End If
  End If
End Sub

' Affecte un num�ro de FRT au RA courant, si n�cessaire en le g�n�rant
Private Sub AffecteNum�roFRT()
  If iNumFRTCourante = 0 Then iNumFRTCourante = GetNumFRT
  cra.iNumFRT = iNumFRTCourante
  txtNumFRT = iNumFRTCourante
  AjouteR�f�renceFRT cra.sRef
End Sub

Private Sub btnD�tailFRT_Click()
  frmD�tailFRT.Affiche cra.iNumFRT
End Sub

Private Sub btnNouveau_Click(Index As Integer)
  Select Case btnNouveau(Index).Tag
    Case "classedoc":   Nouveau "D�finit le type d'analyse, pour permettre un pointage automatique des plannings et une facturation automatique.|Automatiquement d�fini � partir du crit�re dans la plupart des cas, sauf pour certains crit�res sp�ciaux o� la classe doit �tre s�lectionn�e manuellement.|La classe CR ne doit �tre utilis�e qu'en dernier recours, quand aucune classe ne correspond (ex: pr�l�vements d'atmosph�re)"
    Case "prix":        Nouveau "Permet de pr�ciser un prix sp�cifique d'analyse, ou 0 pour une analyse gratuite.|Laisser le champ vide pour une facturation ordinaire."
  End Select
End Sub

Private Sub chkSaisieValid�e_Click()
  SetDirty
End Sub

' R�cup�re la liste des germes pr�c�dents
Private Sub cmdF5Analyse_Click()
  If craF5.sCrit�re = "" Then
    MsgBox2i "CR113"
    'MsgBox "Il n'y a pas eu d'enregistrement de RA depuis le lancement du programme, donc il n'y a pas de valeurs � r�cup�rer.", vbExclamation, sNomApp
    Exit Sub
  End If
  
  If cra.iMode = meCr�ation Or cra.iMode = meModification Then
    txtCrit�re_KeyDown vbKeyF5, 0
    cra.hVerCrit = craF5.hVerCrit
    txtVerCrit = craF5.hVerCrit
    txtRevivification = craF5.iRevivification
    cboMM�thode_KeyDown vbKeyF5, 0
    cra.cStatusModif = craF5.cStatusModif
    chkIE = IIf(craF5.bIE, vbChecked, vbUnchecked)
    chkFax = IIf(craF5.bFax, vbChecked, vbUnchecked)
    chkCongel� = IIf(craF5.bEchCongel�, vbChecked, vbUnchecked)
    txtOptionsLabo_KeyDown vbKeyF5, 0
    txtRemarquesLabo_KeyDown vbKeyF5, 0
    txtPrixSp�cifique_KeyDown vbKeyF5, 0
    bdcDevise_KeyDown vbKeyF5, 0
    txtTrait�Par_KeyDown vbKeyF5, 0
    txtDateDebAnPr�vue_KeyDown vbKeyF5, 0
    Set cra.cGermes = Nothing
    If craF5.cGermes Is Nothing Then
      MsgBox2i "CR114"
      'MsgBox "Il n'y a pas de liste de germes pr�c�dente.", vbInformation, sNomApp
    Else
      Set cra.cGermes = craF5.cGermes
      
      ' On efface les r�sultats pr�c�dents, 5/2/2000 PV
      Dim g As GermeRecherch�
      Dim b As Bo�te
      For Each g In cra.cGermes
        g.SetR�sultatD�faut
        For Each b In g.cBo�tes
          b.SetBo�teVide
        Next
      Next
      
      AfficheGermes
      
      btnLireGermes.Enabled = False
      cra.iModeGermes = mgLu
      cra.iModeBo�tes = mbModifi�
      AfficheModeBo�tes
      AfficheModeGermes
    End If
    bdcClasseDoc_KeyDown vbKeyF5, 0
  End If
End Sub

Private Sub cmdF5T�te_Click()
  If craF5.sCrit�re = "" Then
    MsgBox2i "CR113"
    'MsgBox "Il n'y a pas eu d'enregistrement de RA depuis le lancement du programme, donc il n'y a pas de valeurs � r�cup�rer.", vbExclamation, sNomApp
    Exit Sub
  End If
  
  txtNumPro_KeyDown vbKeyF5, 0
  txtCompl�mentNom_KeyDown vbKeyF5, 0
  txtObs_KeyDown vbKeyF5, 0
  txtDatePr�l�vement_KeyDown vbKeyF5, 0
  txtHeurePr�l�vement_KeyDown vbKeyF5, 0
  txtTemp�ratureProduit_KeyDown vbKeyF5, 0
  txtTemp�ratureAmbiance_KeyDown vbKeyF5, 0
  txtTemp�ratureR�ception_KeyDown vbKeyF5, 0
  txtDatePr�paration_KeyDown vbKeyF5, 0
  txtHeurePr�paration_KeyDown vbKeyF5, 0
  txtCodeArticle_KeyDown vbKeyF5, 0
  txtCodeFamille_KeyDown vbKeyF5, 0
  txtNumlip_KeyDown vbKeyF5, 0
  txtNumCdt_KeyDown vbKeyF5, 0
  txtNumFab_KeyDown vbKeyF5, 0
  txtNumDis_KeyDown vbKeyF5, 0
  txtDateFabrication_KeyDown vbKeyF5, 0
  txtDateLivraison_KeyDown vbKeyF5, 0
  txtDateR�ceptionClient_KeyDown vbKeyF5, 0
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
  txtDateR�ception_KeyDown vbKeyF5, 0
  txtHeureR�ception_KeyDown vbKeyF5, 0
  txtAspect_KeyDown vbKeyF5, 0
  txtSecteurPr�l_KeyDown vbKeyF5, 0
  txt�tatPhy_KeyDown vbKeyF5, 0
  txtIntOp�r_KeyDown vbKeyF5, 0
  txtInfo1_KeyDown vbKeyF5, 0
  txtInfo2_KeyDown vbKeyF5, 0
  txtCondPr�l_KeyDown vbKeyF5, 0
  txtContenant_KeyDown vbKeyF5, 0
  txt�tatDiv_KeyDown vbKeyF5, 0
  txtNiv�labo_KeyDown vbKeyF5, 0
  txtTechFab_KeyDown vbKeyF5, 0
  txtDLC2_KeyDown vbKeyF5, 0
  txtDateD�conditionnement_KeyDown vbKeyF5, 0
End Sub


Private Sub cmdF5Valeur_Click()
  SendKeys "{F5}"
End Sub

' ================================================================================
' Menu sp�cial

Private Sub cmdForcerRattachementFRTCourante_Click()
  Dim iRep As VbMsgBoxResult
  Dim sMsg As String
  sMsg = sGetIntlLib("CR116", "Question 116")
  iRep = MsgBox(sMsg, vbInformation + vbYesNo, sNomApp)
  'iRep = MsgBox("Cette commande permet de forcer le rattachement du RA actuel � la FRT courante si ce RA n'est pas d�j� rattach� � une FRT, suite par exemple � une modification du champ Trait�Par." & vbCrLf & vbCrLf & "Voulez-vous continuer ?", vbInformation + vbYesNo, sNomApp)
  If iRep = vbNo Then Exit Sub
  
  If cra.iMode = meVisualisation Then
    MsgBox2i "CR117"
    'MsgBox "Modification interdite en mode visualisation !", vbInformation, sNomApp
    Exit Sub
  End If

  ' On contr�le les donn�es et on les transf�re dans la structure RA
  If Not bContr�le Then
    MsgBox2i "CR118"
    'MsgBox "Rattachement impossible tant qu'il y a des erreurs dans les donn�es !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  If cra.iNumFRT > 0 Then
    MsgBox2i "CR119", cra.iNumFRT
    'MsgBox "Rattachement impossible ! Ce RA est d�j� attach� � la FRT " & cra.iNumFRT, vbExclamation, sNomApp
    Exit Sub
  End If
  
  If bAnalyseCommenc�e(cra.iNumS�rie) Then
    MsgBox2i "CR120", cra.iNumS�rie
    'MsgBox "Rattachement impossible ! Ce RA est d�j� pris en charge par le labo dans la s�rie " & cra.iNumS�rie, vbExclamation, sNomApp
    Exit Sub
  End If
  
  If cra.dDateDebAnPr�vue <> Today Then
    MsgBox2i "CR121"
    'MsgBox "Rattachement impossible ! On ne peut affecter un n� de FRT que si la date de d�but d'analyse pr�vue est la date du jour !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  AffecteNum�roFRT
  SetDirty
  MsgBox2i "CR122", cra.iNumFRT
  'MsgBox "RA rattach� � la FRT " & cra.iNumFRT & vbCrLf & "La modification ne sera effective qu'apr�s enregistrement du RA.", vbInformation, sNomApp
End Sub


Private Sub cmdEffacerNum�roFRT_Click()
  Dim iRep As VbMsgBoxResult
  Dim sMsg As String
  sMsg = sGetIntlLib("CR123", "Question 123")
  iRep = MsgBox(sMsg, vbInformation + vbYesNo, sNomApp)
  'iRep = MsgBox("Cette commande permet d'effacer le num�ro de FRT, � condition que le labo n'ait pas lanc� l'analyse. A n'utiliser qu'apr�s avoir pr�venu le labo !" & vbCrLf & vbCrLf & "Voulez-vous continuer ?", vbInformation + vbYesNo, sNomApp)
  If iRep = vbNo Then Exit Sub
  
  If cra.iMode = meVisualisation Then
    MsgBox2i "CR124"
    'MsgBox "Modification interdite en mode visualisation !", vbInformation, sNomApp
    Exit Sub
  End If
  
  If cra.iNumFRT <= 0 Then
    MsgBox2i "CR125"
    'MsgBox "Effacement impossible ! Ce RA n'est pas rattach� � une FRT.", vbExclamation, sNomApp
    Exit Sub
  End If
  
  If bAnalyseCommenc�e(cra.iNumS�rie) Then
    MsgBox2i "CR126", cra.iNumS�rie
    'MsgBox "Effacement impossible ! Ce RA est d�j� pris en charge par le labo dans la s�rie " & cra.iNumS�rie, vbExclamation, sNomApp
    Exit Sub
  End If
  
  cra.iNumFRT = Null
  txtNumFRT = ""
  SetDirty
  MsgBox2i "CR127"
  'MsgBox "Num�ro de FRT effac�." & vbCrLf & "La modification ne sera effective qu'apr�s enregistrement du RA.", vbInformation, sNomApp
End Sub

Private Sub cmdM�moriser_Click()
  ' On m�morise les donn�es pour le m�canisme de rappel F5
  Set craF5 = cra
End Sub

Private Sub cmdTrafiquerFRT_Click()
  If cra.iMode = meVisualisation Then
    MsgBox2i "CR128"
    'MsgBox "Modification interdite en mode visualisation !", vbInformation, sNomApp
    Exit Sub
  End If
  
  Dim sRep As String
  
  sRep = InputBox(sGetIntlLib("RAtxtTrafFRT", "Entrez le n� de FRT � appliquer pour ce RA, 0 pour effacer"), sNomApp)
  If sRep = "" Then Exit Sub
  
  If Not IsNumeric(sRep) Then
    MsgBox2i "CR129"
    'MsgBox "Ok, on a dit pas de contr�les, mais entrez au minimum une valeur num�rique !!!", vbExclamation, sNomApp
    Exit Sub
  End If

  Dim iRep As Long
  iRep = Val(sRep)
  If iRep < 1 Or iRep <> Int(iRep) Then
    MsgBox2i "CR130"
    'MsgBox "Ok, on a dit pas de contr�le, mais entrez au minimum un n� de FRT correct !!!", vbExclamation, sNomApp
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
  
  ' On v�rifie si la forme est r�ellement d�charg�e
  Dim f As Form
  For Each f In Forms
    If f Is Me Then
      ' D�chargement interrompu !
      Exit Sub
    End If
  Next
  
  ' D�chargement bien effectu�
  frmRecherche.Suivant
End Sub


Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If bBlocageEnCours Or Left(Caption, 9) = sGetIntlLib("CO101", "Patientez") Then
    MsgBox2i "CR131"
    'MsgBox "Du calme ! Attendez la fin du chargement des donn�es avant de fermer la fen�tre !", vbExclamation, sNomApp
    Cancel = 1
    Exit Sub
  End If
  
  If bDirty Then
    Dim i As VbMsgBoxResult
    Dim sMsg As String
    sMsg = sprintf(sGetIntlLib("CR132", "Question 132"), cra.sRef)
    i = MsgBox(sMsg, vbQuestion + vbYesNoCancel, sNomApp)
    'i = MsgBox("Les donn�es du RA " & cra.sRef & " ont chang�." & vbCrLf & vbCrLf & "Voulez-vous enregistrer les modifications ?", vbQuestion + vbYesNoCancel, sNomApp)
    If i = vbCancel Then
      Cancel = 1
      Exit Sub
    End If
    
    If i = vbYes Then
      If Not bPr�pareEnregistrer Then
        Cancel = 1
        Exit Sub
      End If
      DoEnregistrer
    End If
  End If

  Cancel = 0
  
  ' Mise � jour du status sur la feuille d'accueil
  frmRecherche.MAJStatus cra.sRef, ""
  ' Et on lib�re le verrou sur la r�f�rence
  Lib�reVerrou cra.sRef
End Sub



' =============================================================
' Code g�n�ral de la grille

Private Sub tbBoutons_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Key
    Case "Contr�ler": cmdContr�ler_Click
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

' L'effacement de la barre de boutons est sous-trait� plus haut
Private Sub cmdBarreStandard_Click()
  frmOptions.PasDeBarreDeBoutons
  frmRecherche.DoOptionsAffichage
End Sub

Private Sub cmdEtiquettes_Click()
  frmOptions.AfficherEtiquettesDeBoutons Not cmdEtiquettes.Checked
  frmRecherche.DoOptionsAffichage
End Sub

Private Sub cmdContr�ler_Click()
  bContr�le
End Sub

Private Sub cmdValider_Click()
  DoValidation
End Sub

Private Sub cmdAnnulerValidation_Click()
  DoAnnulerValidation
End Sub


Private Sub AfficheModeBo�tes()
  Select Case cra.iModeBo�tes
    Case mbNonLu:    lblModeBo�tes = sGetIntlLib("RAtxtBo�NonLu", "Bo�tes non lues")
    Case mbLu:       lblModeBo�tes = sGetIntlLib("RAtxtBo�Lu", "Bo�tes lues, non modifi�es")
    Case mbModifi�:  lblModeBo�tes = sGetIntlLib("RAtxtBo�Modif", "Bo�tes lues et modifi�es")
    Case mbProbl�me: lblModeBo�tes = sGetIntlLib("RAtxtBo�Prob", "Probl�me � la lecture")
  End Select
End Sub

Private Sub AfficheModeGermes()
  Select Case cra.iModeGermes
    Case mgNonLu:    lblModeGermes = sGetIntlLib("RAtxtGerNonLu", "Germes non lus")
    Case mgLu:       lblModeGermes = sGetIntlLib("RAtxtGerLu", "Germes lus")
    Case mgModifi�:  lblModeGermes = sGetIntlLib("RAtxtGermodif", "Germes lus et modifi�s")
  End Select
End Sub

Private Sub AfficheStatusModif()
  txtStatusModif = NV(cra.cStatusModif)
End Sub


Private Sub DoEnregistrer()
  ' On met � jour la tra�abilit� de la partie haute
  ' DateSaisPH contient la date de 1�re saisie, et n'est pas mis � jour
  ' lors de modifications ult�rieures (voulu, sinon apr�s les corrections avant
  ' validation, la validation serait refus�e�)
  If VarType(cra.hOperSaisPH) = vbNull Or cra.hOperSaisPH = 0 Then
    cra.hOperSaisPH = iNumOp�rateur
    ' On laisse le d�mon affecter la date de cr�ation
    ' et on l'affiche
    txtOperSaisPH = iNumOp�rateur
    txtNomSaisPH = sNomOp�rateur
    txtDateSaisPH = Now
  End If
  
  ' Mise � jour de l'�tat
  If cra.cEtatPH = "" Or cra.cEtatPH = "1" Then
    cra.cEtatPH = "2"
  End If
  ' On affiche la mise � jour de l'�tat de la t�te
  txtEtatPH = cra.cEtatPH
  txtNomEtatPH = sLibell�EtatPH(cra.cEtatPH)
  
  
  ' Si n�cessaire, on affecte le n� de FRT
  If cra.iNumFRT = 0 And IsNull(cra.iTrait�Par) And (cra.iNumS�rie = 0 Or cra.iNumS�rie = -1) And (cra.dDateDebAnPr�vue = Today) Then
    AffecteNum�roFRT
  End If
  
  ' Et enfin �criture du RA
  EcritRA iTable, cra
  txtCOFRAC = cra.cCofrac   ' Mis � jour lors de l'�criture
  ' Et des bo�tes, si n�cessaire
  If cra.iModeBo�tes = mbModifi� Then
    EcritBo�tes cra
    AfficheModeBo�tes
  End If
  
  ' Pour que le d�mon ne corrige plus la date (il ne g�n�re la date que si elle vaut NULL)
  cra.dDateSaisPH = Now
  
  ' On peut effacer le mode bDirty
  ' Ok m�thode un peu brutale, vu le travail fait dans InitXXX
  bDirty = False
  
  If cra.iMode = meCr�ation Or cra.iMode = meModification Then
    InitModification
  ElseIf cra.iMode = meModificationSp�ciale Then
    InitModificationSp�ciale
  Else
    InitModificationR�duite
  End If
  
  ' Mise � jour du status sur la feuille d'accueil (provisoire)
  ' Le status r�el sera mis � jour quand le feuille sera d�charg�e
  frmRecherche.MAJStatus cra.sRef, sGetIntlLib("RAtxtEnreg", "RA enregistr�")
  
  ' Nouveau m�canisme pour gagner du temps
  If chkSaisieValid�e Then DoValidation
End Sub


Private Sub cmdAbandonnerQuitter_Click()
  ' Identique � la fermeture Alt+F4
  Unload Me
End Sub


Private Function bPr�pareEnregistrer() As Boolean
  If bBlocageEnCours Then
    MsgBox2i "CR133"
    'MsgBox "Enregistrement non disponible, attendez quelques secondes�", vbInformation, sNomApp
    bPr�pareEnregistrer = False
    Exit Function
  End If
  
  If cra.iMode = meVisualisation Then
    MsgBox2i "CR134"
    'MsgBox "Pas d'enregistrement en mode visualisation !", vbInformation, sNomApp
    bPr�pareEnregistrer = False
    Exit Function
  End If
  
  If Not bContr�le Then
    MsgBox2i "CR135"
    'MsgBox "Des erreurs ont �t� d�tect�es lors du contr�le, l'enregistrement a �t� annul�.", vbInformation, sNomApp
    bPr�pareEnregistrer = False
    Exit Function
  End If

  bPr�pareEnregistrer = True
End Function

Private Sub cmdEnregistrerQuitter_Click()
  If Not bDirty Then
    MsgBox2i "CR136"
    'MsgBox "Le RA n'a pas �t� modifi�, il n'y a rien � enregistrer." & vbCrLf & vbCrLf & "Dans une telle situation, pour fermer la fen�tre du RA, utilisez de pr�f�rence la case de fermeture en haut � droite, ou les touches Alt+F4 ou F3.", vbInformation, sNomApp
  End If
  
  If bPr�pareEnregistrer Then
    DoEnregistrer
    Unload Me
  End If
End Sub

Private Sub cmdEnregistrer_Click()
  If bPr�pareEnregistrer Then DoEnregistrer
End Sub


Private Sub cmdSupprimer_Click()
  If bBlocageEnCours Then
    MsgBox2i "CR137"
    'MsgBox "Suppression non disponible, attendez quelques secondes�", vbInformation, sNomApp
    Exit Sub
  End If
  
  If cra.iMode = meVisualisation Then
    MsgBox2i "CR138"
    'MsgBox "Suppression interdite en mode visualisation !", vbInformation, sNomApp
    Exit Sub
  End If
  
  If cra.cEtatPH > "2" Then
    MsgBox2i "CR139"
    'MsgBox "RA valid�, suppression impossible !", vbInformation, sNomApp
    Exit Sub
  End If
    
  If cra.cEtatPH = "" Then
    MsgBox2i "CR140"
    'MsgBox "RA non enregistr�, il n'a pas besoin d'�tre supprim� !" & vbCrLf & "Fermez la fen�tre pour supprimer ce RA.", vbInformation, sNomApp
    Exit Sub
  End If
  
  ' Suppression de RA saisi un autre jour: Op privil�gi�e sp�cifique � la France
  If cSyst�meCA Like "[WGPTCHRO]" Then
    If CDate(Int(cra.dDateSaisPH)) <> Today Then
      'OPCR01: Effacement d'analyse dans SCRAW (non transmis automatiquement au secr�tariat)
      If Not bOkAcc�sPrivil�gi�(txtR�f�rence.Text, "OPCR01") Then Exit Sub
    End If
  End If
  
  ' Garde-fou (et autres erreurs de clics�)
  Dim iRep As VbMsgBoxResult
  Dim sMsg As String
  sMsg = sprintf(sGetIntlLib("CR141", "Question 141"), cra.sRef)
  iRep = MsgBox(sMsg, vbQuestion + vbYesNo + vbDefaultButton2, sNomApp)
  'iRep = MsgBox("�tes-vous s�r de vouloir supprimer le RA et les bo�tes de la r�f�rence " & cra.sRef & " ?", vbQuestion + vbYesNo + vbDefaultButton2, sNomApp)
  If iRep = vbNo Then Exit Sub
  
  ' Suppression � proprement parler
  D�truitRA iTable, cra.sRef
  If cra.iModeBo�tes <> mbProbl�me Then
    D�truitBo�tes cra.sRef
  End If
  
  ' On d�truit �ventuellement la r�f�rence de la liste des FRT
  Enl�veR�f�renceFRT cra.sRef
  
  If cra.iModeBo�tes <> mbProbl�me Then
    MsgBox2i "CR142", cra.sRef
    'MsgBox "Le RA " & cra.sRef & " et la liste des bo�tes ont �t� supprim�s.", vbInformation, sNomApp
  Else
    MsgBox2i "CR143", cra.sRef
    'MsgBox "Le RA " & cra.sRef & " a �t� supprim�, la liste des bo�tes a �t� conserv�e.", vbInformation, sNomApp
  End If
  
  ' Fermeture de la fen�tre, sans sauvegarde !
  bDirty = False  ' De fa�on � ne pas proposer l'enregistrement apr�s la suppression !
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
    'MsgBox "Conclusion s�lectionn�e " & c.con_indice & ": " & c.con_libelle, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechDate_Click()
  Dim d As String
  d = frmRechercheDate.Cherche(Today)
  If d <> "" Then
    MsgBox2i "CR145", Format(d, "dd/mm/yyyy")
    'MsgBox "Date s�lectionn�e: " & Format(d, "dd/mm/yyyy"), vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechDistrib_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim d As Distributeur
  Set d = frmRechercheDistributeur.Cherche()
  If Not d Is Nothing Then
    MsgBox2i "CR146", d.dis_numdis, d.dis_nom
    'MsgBox "Distributeur s�lectionn� " & d.dis_numdis & ": " & d.dis_nom, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechEtablissement_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim e As Etablissement, c As Collection
  Set c = frmRechercheEtablissement.Cherche2()
  Dim sMessage As String
  For Each e In c
    sMessage = sMessage & vbCrLf & e.etb_numetb & ": " & e.etb_prefixe & " " & e.etb_nom
  Next
  If sMessage <> "" Then
    MsgBox2i "CR147", sMessage
    'MsgBox "�tablissement(s) s�lectionn�(s) :" & sMessage, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechFabricant_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim f As Fabricant
  Set f = frmRechercheFabricant.Cherche()
  If Not f Is Nothing Then
    MsgBox2i "CR148", f.fab_numfab, f.fab_nom
    'MsgBox "Fabricant s�lectionn� " & f.fab_numfab & ": " & f.fab_nom, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechProduit_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim p As Produit
  Set p = frmRechercheProduit.Cherche()
  If Not p Is Nothing Then
    MsgBox2i "CR149", p.pro_numpro, p.pro_nom
    'MsgBox "Produit s�lectionn� " & p.pro_numpro & ": " & p.pro_nom, vbInformation, sNomApp
  End If
End Sub


Private Sub cmdLibell�RA_Click(Index As Integer)
  Dim l As Libell�RA
  Set l = frmRechercheLibell�RA.Cherche(Index)
  If Not l Is Nothing Then
    MsgBox2i "CR150", l.lcr_indice, l.lcr_libelle
    'MsgBox "Libell� s�lectionn� " & l.lcr_indice & ": " & l.lcr_libelle, vbInformation, sNomApp
  End If
End Sub




' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

' Champs d'affichage / saisie

' =============================================================
' Utilitaires

' Public car appel� depuis frmComptage
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
' N� de produit
' Double m�canisme de recherche

Private Sub RechercheProduit()
  Dim p As Produit
  
  If txtNumPro = "-1" Then
    MsgBox2i "CR151"
    'MsgBox "Attention, la saisie d'un produit classique remplacera le produit-crit�re et le type actuellement saisis.", vbInformation, sNomApp
  End If
  
  Set p = frmRechercheProduit.Cherche()
  If Not p Is Nothing Then
    txtNumPro = p.pro_numpro
    txtNomPro = p.pro_nom
    If Not IsNull(p.pro_etat) Then txtNomPro = txtNomPro & " ��tat " & p.pro_etat & "�"
    txtCrit�reInfo = p.pro_critere
  End If
End Sub

Private Sub RechercheProduitCrit�re()
  Dim sNomPro As String, sD�faut As String
  
  ' Contr�le de l'option-labo Z
  If InStr(1, txtOptionsLabo, "Z") <> 0 Then
    If Not bOkAcc�sPrivil�gi�(txtR�f�rence.Text, "OPCR02") Then Exit Sub
  End If
  
  If txtNumPro <> "" And txtNumPro <> "-1" Then
    MsgBox2i "CR152"
    'MsgBox "Attention, la saisie d'un produit-crit�re remplacera le produit actuellement saisi.", vbInformation, sNomApp
    sD�faut = txtCrit�reInfo
  Else
    sD�faut = txtNomPro
  End If
  
  sNomPro = frmSaisieProCrit.Saisie(sD�faut)
  If sNomPro <> "" Then
    txtNumPro = -1
    txtNomPro = sNomPro
    Dim iPosV As Integer
    iPosV = InStr(sNomPro, ",")
    If iPosV > 0 Then
      txtCrit�reInfo = Left(sNomPro, iPosV - 1)
    Else
      txtCrit�reInfo = sNomPro
    End If
    SetDirty        ' Au cas o� le n� de produit �tait d�j� � -1
  End If
End Sub


Private Sub txtNumPro_Change()
  txtNomPro = ""
  txtCrit�reInfo = ""
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
    txtCrit�reInfo = ""
    If bMessage Then
      Focus txtNumPro
      MsgBox2i "CO004", txtNumPro
      'MsgBox "Num�ro de produit invalide.", vbExclamation, sNomApp
      txtNumPro.SetFocus
    End If
    Exit Function
  End If
  
  ' Cas sp�cial du produit -1
  ' On v�rifie que la saisie du -1 n'a pas �t� directe,
  ' ce qui ferait qu'on n'aurait pas le crit�re dans le champ NomPro
  If txtNumPro = -1 Then      ' On est s�r que le champ est num�rique
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
        'MsgBox "Num�ro de produit invalide." & vbCrLf & _
          "La saisie du n� -1 ne peut pas �tre effectu�e directement, il faut passer par la bo�te de dialogue de saisie d'un produit-crit�re, accessible avec Maj+F4.", vbExclamation, sNomApp
      End If
      Exit Function
    End If
    
    ' Ok, on met � jour la structure de donn�es
    cra.iPro = -1
    cra.sNomPro = txtNomPro
    cra.sCrit�reInfo = sCrit

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
  
  Else  ' N� de produit classique
  
    Dim p As Produit
    Set p = LireProduit(txtNumPro)
    If p Is Nothing Then
      txtNomPro = ""
      txtCrit�reInfo = ""
      If bMessage Then
        Focus txtNumPro
        MsgBox2i "CO005", txtNumPro
        'MsgBox "Produit inexistant.", vbExclamation, sNomApp
      End If
      Exit Function
    End If
    
    If p.pro_etat = "S" Or p.pro_etat = "Z" Then
      txtNomPro = ""
      txtCrit�reInfo = ""
      If bMessage Then
        Focus txtNumPro
        MsgBox2i "CR156", p.pro_numpro, p.pro_nom
        'MsgBox "Produit supprim�." & vbCrLf & vbCrLf & "Le produit " & p.pro_numpro & ": " & p.pro_nom & " est � l'�tat supprim� dans le fichier produit, il ne peut pas �tre utilis�." & vbCrLf & vbCrLf & "Choisissez un autre produit.", vbExclamation, sNomApp
      End If
      Exit Function
    End If
    
    ' Ok, on met � jour les contr�les associ�s
    ' Pas de mise � jour pour les saisies ant�rieures au 3/7/2000
    If txtNomPro = "" Or cra.dDateTour >= #7/3/2000# Then
      txtNomPro = p.pro_nom
      If Not IsNull(p.pro_etat) And Not txtNumPro.Locked Then
        txtNomPro = sprintf(sGetIntlLib("RAtxtEtatP", "%1 ��tat %2�"), txtNomPro, p.pro_etat)
      End If
    End If
    If txtCrit�reInfo = "" Or cra.dDateTour >= #7/3/2000# Then
      txtCrit�reInfo = p.pro_critere
    End If
    
    ' et la structure de donn�es
    cra.iPro = CLng(txtNumPro)
    cra.sNomPro = p.pro_nom
    cra.sCrit�reInfo = p.pro_critere
    cra.t1 = p.pro_t1
    cra.t2 = p.pro_t2
    cra.t3 = p.pro_t3
    cra.t4 = p.pro_t4
    cra.t5 = p.pro_t5
    
    ' Tra�abilit� �ventuelle
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
  
  ' Pour simplifier la saisie�
  If cra.t1 = 4 And txtSecteurPr�l = "" And (cra.iMode = meCr�ation Or cra.iMode = meModification) Then
    txtSecteurPr�l = "4"
    bCheckSecteurPr�l�vement False
  End If

  bCheckNumPro = True
End Function

Private Sub txtNumPro_GotFocus()
  AutoSelect txtNumPro
  SetLib sbStatus, "SimpleText", "CPtxtNumPro.tag"
  'sbStatus.SimpleText = "Entrez le num�ro du produit, F4 pour une recherche produit, Maj+F4 pour une recherche crit�re."
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
  If KeyCode = vbKeyF4 And Shift = 1 And txtNumPro.Locked = False Then RechercheProduitCrit�re
  If KeyCode = vbKeyF5 And Shift = 0 And txtNumPro.Locked = False Then
    txtNumPro = craF5.iPro
    txtNomPro = craF5.sNomPro
    txtCrit�reInfo = craF5.sCrit�reInfo
  End If
End Sub

Private Sub txtNumPro_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  iShift = Shift
End Sub

Private Sub txtNumPro_DblClick()
  txtNumPro_KeyDown vbKeyF4, iShift
End Sub


' ===============================================================
' Compl�ment du nom

Private Sub txtCompl�mentNom_GotFocus()
  AutoSelect txtCompl�mentNom
  SetLib sbStatus, "SimpleText", "CPtxtCompNom.tag"
  'sbStatus.SimpleText = "Libell� compl�mentaire � droite du nom de produit. S'il commence par !, le nom du produit est masqu�."
End Sub

Private Sub txtCompl�mentNom_LostFocus()
  If bBlocageEnCours Then
    ActionSuivante Me, "txtCompl�mentNom_LostFocus"
    Exit Sub
  End If
  
  bCheckCompl�mentNom False
End Sub

Private Sub txtCompl�mentNom_Change()
  Static bBlanc1 As Boolean, bBlanc2 As Boolean
  
  ' R�initialisation du m�canisme
  If txtCompl�mentNom = "" Then
    bBlanc1 = False
    bBlanc2 = False
  End If

  ' M�canisme pour faire suivre un / ou un ! d'un espace�
  If (txtCompl�mentNom = "/" Or txtCompl�mentNom = "!") And bBlanc1 = False Then
    txtCompl�mentNom = txtCompl�mentNom & " "
    txtCompl�mentNom.SelStart = 99
    bBlanc1 = True
  End If
  
  ' Et juste d'un seul !
  If (txtCompl�mentNom = "/  " Or txtCompl�mentNom = "!  ") And bBlanc2 = False Then
    txtCompl�mentNom = Left(txtCompl�mentNom, 2)
    txtCompl�mentNom.SelStart = 99
    bBlanc2 = True
  End If

  If Left(txtCompl�mentNom, 1) = "!" Then
    txtCompl�mentNom.MaxLength = 60
  Else
    txtCompl�mentNom.MaxLength = 70 - Len(txtNomPro)
    If txtCompl�mentNom.MaxLength > 60 Then txtCompl�mentNom.MaxLength = 60
  End If
  SetDirty
End Sub

Private Function bCheckCompl�mentNom(bMessage As Boolean) As Boolean
  bCheckCompl�mentNom = False
  
  If Left(txtNomPro, 1) <> "!" And Left(txtCompl�mentNom, 1) <> "!" And Len(txtCompl�mentNom) + Len(txtNomPro) > 70 Then
    If bMessage Then
      Focus txtCompl�mentNom
      MsgBox2i "CR157"
      'MsgBox "Compl�ment de nom trop long.", vbExclamation, sNomApp
    End If
    Exit Function
  End If
  
  ' Orthographe
  sOrthCompl�mentNom = sOrthographe(txtCompl�mentNom)
  lblOrthographe = sOrthCompl�mentNom & " " & sOrthObs
  
  ' Mise � jour de la structure de donn�es
  cra.sCplNom = txtCompl�mentNom
  
  bCheckCompl�mentNom = True
End Function

Private Sub txtCompl�mentNom_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtNumPro.Locked = False Then txtCompl�mentNom = craF5.sCplNom
End Sub


' ===============================================================
' Observations

Private Sub txtObs_GotFocus()
  AutoSelect txtObs
  SetLib sbStatus, "SimpleText", "CPtxtObs.tag"
  'sbStatus.SimpleText = "Entrez le libell� qui doit appara�tre sur la ligne sous le nom de produit."
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
  lblOrthographe = sOrthCompl�mentNom & " " & sOrthObs
  
  ' On v�rifie qu'il n'y a pas plus de 2 |, sinon message d'avertissement
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
      ' Avertissement: Il y a plus de deux retours � la ligne forc�s dans les interventions. L'impression d�finitve risque d'�tre incorrecte, en particulier si l'analyse concerne beaucoup de param�tres.
      MsgBox2i "CR333"
    End If
  End If

  ' Mise � jour de la structure de donn�es
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
' Date de pr�l�vement

Private Function bCheckDate(ByVal sPage As String, d As ChampDate, ByRef vDate As Variant, ByVal sLibell� As String, ByVal bMessage As Boolean) As Boolean
  
  If d.DateSaisie <> "" Then
    If Not IsDate(d.DateSaisie) Then
      If bMessage Then
        bCheckDate = False
        Focus d, sPage
        MsgBox2i "CO004", sLibell�
        'MsgBox sLibell� & " invalide.", vbExclamation, sNomApp
      End If
      Exit Function
    End If
  End If
  
  ' Mise � jour de la structure de donn�es
  vDate = DVN(d.DateSaisie)
  
  bCheckDate = True
End Function


Private Sub txtDatePr�l�vement_GotFocus()
  AutoSelect txtDatePr�l�vement
  SetLib sbStatus, "SimpleText", "RAtxtDP.tag"
  'sbStatus.SimpleText = "Entrez la date de pr�l�vement, F4 pour le calendrier."
  End Sub

Private Sub txtDatePr�l�vement_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDatePr�l�vement.Locked = False Then calendrier txtDatePr�l�vement
  If KeyCode = vbKeyF5 And Shift = 0 And txtDatePr�l�vement.Locked = False Then txtDatePr�l�vement.DateSaisie = craF5.dDatePr�l
End Sub

Private Sub txtDatePr�l�vement_DblClick()
  If Not txtDatePr�l�vement.Locked Then calendrier txtDatePr�l�vement
End Sub

Private Function bCheckDatePr�l�vement(bMessage As Boolean) As Boolean
  If txtDatePr�l�vement.DateSaisie = "" Then
    If bMessage Then
      Focus txtDatePr�l�vement
      MsgBox2i "CR159"
      'MsgBox "La date de pr�l�vement est obligatoire.", vbExclamation, sNomApp
    End If
    bCheckDatePr�l�vement = False
    Exit Function
  End If

  Dim d
  bCheckDatePr�l�vement = bCheckDate("T�te", txtDatePr�l�vement, d, "Date de pr�l�vement", bMessage)
  If IsEmpty(d) Then Exit Function      ' Date invalide
  
  If d = dAbsence Then
    If bMessage Then
      Focus txtDatePr�l�vement
      MsgBox2i "CO004", txtDatePr�l�vement
      'MsgBox "Date de pr�l�vement invalide.", vbExclamation, sNomApp
      txtDatePr�l�vement.SetFocus
    End If
    bCheckDatePr�l�vement = False
    Exit Function
  End If
  
  ' On v�rifie si les autres �chantillons ont �t� pr�lev�s � la m�me date
  Contr�leDDP cra.sRef, d
  
  ' On v�rifie si l'�tablissement n'est pas planifi� le m�me jour sous une autre r�f�rence
  Contr�leEtablissementM�meJour cra.sEtb, d, Left(cra.sRef, Len(cra.sRef) - 2)
  
  cra.dDatePr�l = d
End Function

Private Sub txtDatePr�l�vement_Change()
  SetDirty
End Sub


' ===============================================================
' Heure de pr�l�vement

Private Sub txtHeurePr�l�vement_GotFocus()
  AutoSelect txtHeurePr�l�vement
  SetLib sbStatus, "SimpleText", "RAtxtHP.tag"
  'sbStatus.SimpleText = "Entrez l'heure de pr�l�vement."
End Sub

Private Function bCheckHeurePr�l�vement(bMessage As Boolean) As Boolean
  If txtHeurePr�l�vement.HeureSaisie = "ERR" Then
    If bMessage Then
      bCheckHeurePr�l�vement = False
      Focus txtHeurePr�l�vement
      MsgBox2i "CO004", txtHeurePr�l�vement
      'MsgBox "Heure de pr�l�vement invalide.", vbExclamation, sNomApp
      txtHeurePr�l�vement.SetFocus
    End If
    Exit Function
  End If
  
  ' Mise � jour de la structure de donn�es
  cra.hHeurePr�l = VN(txtHeurePr�l�vement.HeureSaisie)
  
  ' Tests de vraisemblance
  If IsNumeric(cra.hHeurePr�l) Then
    If cra.hHeurePr�l < 600 Or cra.hHeurePr�l > 2000 Then
      If bMessage Then
        MsgBox2i "CR162"
        'MsgBox "Avertissement: Pr�l�vement avant 6:00 ou apr�s 20:00. V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
      End If
    End If
  End If
  
  bCheckHeurePr�l�vement = True
End Function

Private Sub txtHeurePr�l�vement_Change()
  SetDirty
End Sub

Private Sub txtHeurePr�l�vement_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtHeurePr�l�vement.Locked = False Then txtHeurePr�l�vement.HeureSaisie = craF5.hHeurePr�l
End Sub


' ===============================================================
' Temp�rature produit

Private Function bCheckTemp�rature(t As ChampTemp�rature, dTemp As Variant, ByVal sLibell� As String, ByVal bMessage As Boolean) As Boolean
  If t.Temp�rature <> "" Then
    If Not IsNumeric(t.Temp�rature) Then
      If bMessage Then
        bCheckTemp�rature = False
        Focus t
        MsgBox2i "CR163", sLibell�
        'MsgBox "Temp�rature " & sLibell� & " invalide.", vbExclamation, sNomApp
      End If
      Exit Function
    End If
  End If
  
  ' Mise � jour de la structure de donn�es
  If t.Temp�rature = "" Then
    dTemp = Null
  Else
    dTemp = CSng(t.Temp�rature)
  End If
  
  bCheckTemp�rature = True
End Function

Private Sub txtTemp�ratureProduit_GotFocus()
  AutoSelect txtTemp�ratureProduit
  SetLib sbStatus, "SimpleText", "RAtxtTP.tag"
  'sbStatus.SimpleText = "Entrez la temp�rature du produit."
End Sub

Private Function bCheckTemp�ratureProduit(bMessage As Boolean) As Boolean
  Dim t
  bCheckTemp�ratureProduit = bCheckTemp�rature(txtTemp�ratureProduit, t, "produit", bMessage)
  cra.dTemp = t
End Function

Private Sub txtTemp�ratureProduit_Change()
  SetDirty
End Sub

Private Sub txtTemp�ratureProduit_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtTemp�ratureProduit.Locked = False Then txtTemp�ratureProduit.Temp�rature = craF5.dTemp
  If KeyCode = vbKeyF4 And Shift = 1 And txtTemp�ratureProduit.Locked = True And (cra.iMode = meModificationR�duite Or cra.iMode = meModificationSp�ciale) Then
    Dim t
    t = InputBox(sGetIntlLib("RAtxtTP", "ATTENTION - Modification de la temp�rature en mode saisie restreinte" & vbCrLf & vbCrLf & _
      "Cette op�ration est sous votre responsabilit�. Assurez-vous aupr�s du laboratoire que la modification n'a pas d'influence sur l'analyse." & vbCrLf & vbCrLf & _
      "Nouvelle temp�rature, ou + pour effacer ?"), sNomApp, txtTemp�ratureProduit.Temp�rature)
    't = InputBox("ATTENTION - Modification de la temp�rature en mode saisie restreinte" & vbCrLf & vbCrLf & _
      "Cette op�ration est sous votre responsabilit�. Assurez-vous aupr�s du laboratoire que la modification n'a pas d'influence sur l'analyse." & vbCrLf & vbCrLf & _
      "Nouvelle temp�rature, ou + pour effacer ?", sNomApp, txtTemp�ratureProduit.Temp�rature)
    If t = "" Then Exit Sub
    Dim p As Integer
    p = InStr(t, ".")
    If p <> 0 Then Mid(t, p, 1) = ","
    If t = "+" Then t = ""
    txtTemp�ratureProduit.Temp�rature = t
    txtTemp�ratureProduit.SelStart = 0
    txtTemp�ratureProduit.SelLength = 99
  End If
End Sub


' ===============================================================
' Temp�rature ambiance

Private Sub txtTemp�ratureAmbiance_GotFocus()
  AutoSelect txtTemp�ratureAmbiance
  SetLib sbStatus, "SimpleText", "RAtxtTA.tag"
  'sbStatus.SimpleText = "Entrez la temp�rature d'ambiance."
End Sub

Private Function bCheckTemp�ratureAmbiance(bMessage As Boolean) As Boolean
  Dim t
  bCheckTemp�ratureAmbiance = bCheckTemp�rature(txtTemp�ratureAmbiance, t, "ambiance", bMessage)
  cra.dTamb = t
End Function

Private Sub txtTemp�ratureAmbiance_Change()
  SetDirty
End Sub

Private Sub txtTemp�ratureAmbiance_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtTemp�ratureAmbiance.Locked = False Then txtTemp�ratureAmbiance.Temp�rature = craF5.dTamb
End Sub


' ===============================================================
' Temp�rature � r�ception

Private Sub txtTemp�ratureR�ception_GotFocus()
  AutoSelect txtTemp�ratureR�ception
  SetLib sbStatus, "SimpleText", "RAtxtTR.tag"
  'sbStatus.SimpleText = "Entrez la temp�rature de l'�chantillon � r�ception."
End Sub

Private Function bCheckTemp�ratureR�ception(bMessage As Boolean) As Boolean
  Dim t
  bCheckTemp�ratureR�ception = bCheckTemp�rature(txtTemp�ratureR�ception, t, "r�ception", bMessage)
  cra.dTrec = t
End Function

Private Sub txtTemp�ratureR�ception_Change()
  SetDirty
End Sub

Private Sub txtTemp�ratureR�ception_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtTemp�ratureR�ception.Locked = False Then txtTemp�ratureR�ception.Temp�rature = craF5.dTrec
End Sub


' ===============================================================
' Date de pr�paration

Private Sub txtDatePr�paration_GotFocus()
  AutoSelect txtDatePr�paration
  SetLib sbStatus, "SimpleText", "RAtxtDPp.tag"
  'sbStatus.SimpleText = "Entrez la date de pr�paration, F4 pour le calendrier."
End Sub

Private Sub txtDatePr�paration_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDatePr�paration.Locked = False Then calendrier txtDatePr�paration
If KeyCode = vbKeyF5 And Shift = 0 And txtDatePr�paration.Locked = False Then txtDatePr�paration.DateSaisie = craF5.dDatePr�p
End Sub

Private Sub txtDatePr�paration_DblClick()
  If Not txtDatePr�paration.Locked Then calendrier txtDatePr�paration
End Sub

Private Function bCheckDatePr�paration(bMessage As Boolean) As Boolean
  Dim d
  d = cra.dDatePr�p
  bCheckDatePr�paration = bCheckDate("T�te", txtDatePr�paration, d, "Date de pr�paration", bMessage)
  cra.dDatePr�p = d
End Function

Private Sub txtDatePr�paration_Change()
  SetDirty
End Sub


' ===============================================================
' Heure de Pr�paration

Private Sub txtHeurePr�paration_GotFocus()
  AutoSelect txtHeurePr�paration
  SetLib sbStatus, "SimpleText", "RAtxtHPp.tag"
  'sbStatus.SimpleText = "Entrez l'heure de pr�paration."
End Sub

Private Function bCheckHeurePr�paration(bMessage As Boolean) As Boolean
  If txtHeurePr�paration.HeureSaisie = "ERR" Then
    If bMessage Then
      bCheckHeurePr�paration = False
      Focus txtHeurePr�paration
      MsgBox2i "CO004", txtHeurePr�paration.HeureSaisie
      'MsgBox "Heure de pr�paration invalide.", vbExclamation, sNomApp
      txtHeurePr�paration.SetFocus
    End If
    Exit Function
  End If
  
  ' Mise � jour de la structure de donn�es
  cra.hHeurePr�p = VN(txtHeurePr�paration.HeureSaisie)
  
  ' Tests de vraisemblance
  If IsNumeric(cra.hHeurePr�p) Then
    If cra.hHeurePr�p < 600 Or cra.hHeurePr�p > 2000 Then
      If bMessage Then
        MsgBox2i "CR165"
        'MsgBox "Avertissement: Pr�paration avant 6:00 ou apr�s 20:00. V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
      End If
    End If
  End If
  
  bCheckHeurePr�paration = True
End Function

Private Sub txtHeurePr�paration_Change()
  SetDirty
End Sub

Private Sub txtHeurePr�paration_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtHeurePr�paration.Locked = False Then txtHeurePr�paration.HeureSaisie = craF5.hHeurePr�p
End Sub


' ===============================================================
' Code article

Private Sub txtCodeArticle_GotFocus()
  AutoSelect txtCodeArticle
  SetLib sbStatus, "SimpleText", "RAtxtCA.tag"
  'sbStatus.SimpleText = "Entrez le code article."
End Sub

Private Function bCheckCodeArticle(bMessage As Boolean) As Boolean
  ' Mise � jour de la structure de donn�es
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
  ' Mise � jour de la structure de donn�es
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
' N� de lieu de pr�l�vement (conditions de pr�l�vement)

Private Sub RechercheLieuDePr�l�vement()
  Dim p As Libell�RA
  Set p = frmRechercheLibell�RA.Cherche(rLieuPr�l�vement)
  If Not p Is Nothing Then
    txtNumLip = p.lcr_indice
    txtNomLip = p.lcr_libelle
  End If
End Sub

Private Sub txtNumlip_Change()
  txtNomLip = ""
  SetDirty
End Sub

Private Function bCheckLieuDePr�l�vement(bMessage As Boolean) As Boolean
  If txtNumLip = "" Then
    cra.hLieuPr�l = Null
    bCheckLieuDePr�l�vement = True
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
      'MsgBox "Num�ro de lieu de pr�l�vement invalide.", vbExclamation, sNomApp
      txtNumLip.SetFocus
    End If
    bCheckLieuDePr�l�vement = False
    Exit Function
  End If
  
  Dim p As Libell�RA
  Set p = LireLibell�RA(rLieuPr�l�vement, txtNumLip)
  If p Is Nothing Then
    txtNomLip = ""
    If bMessage Then
      Focus txtNumLip
      MsgBox2i "CO005", txtNumLip
      'MsgBox "Lieu de pr�l�vement inexistant.", vbExclamation, sNomApp
      txtNumLip.SetFocus
    End If
    bCheckLieuDePr�l�vement = False
    Exit Function
  End If
  
  If Not bContr�leVieuxLibell�(txtNumLip, "lieu de pr�l�vement", p.lcr_libelle, bMessage) Then
    bCheckLieuDePr�l�vement = False
    Exit Function
  End If
  
  
  ' Mise � jour de la structure de donn�es
  cra.hLieuPr�l = VN(txtNumLip)
  
  ' Petit avertissement�
  If cra.hLieuPr�l = 1 Then
    MsgBox2i "CR169"
    'MsgBox "Avertissement: Il est inutile de saisir le lieu de pr�l�vement 1, il est conseill� de laisser le champ vide dans ce cas.", vbInformation, sNomApp
  End If

  txtNomLip = p.lcr_libelle
  bCheckLieuDePr�l�vement = True
End Function

Private Sub txtNumlip_GotFocus()
  AutoSelect txtNumLip
  SetLib sbStatus, "SimpleText", "RAtxtLip.tag"
  'sbStatus.SimpleText = "Entrez le num�ro du lieu de pr�l�vement (conditions de pr�l�vement), F4 pour une recherche."
End Sub

Private Sub txtNumlip_LostFocus()
  If bCheckLieuDePr�l�vement(False) Or txtNumLip = "" Then
    txtNumLip.ForeColor = &H80000008
  Else
    txtNumLip.ForeColor = &HFF&
  End If
End Sub

Private Sub txtNumlip_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtNumLip.Locked = False Then RechercheLieuDePr�l�vement
  If KeyCode = vbKeyF5 And Shift = 0 And txtNumLip.Locked = False Then txtNumLip = NV(craF5.hLieuPr�l)
End Sub

Private Sub txtNumlip_DblClick()
  txtNumlip_KeyDown vbKeyF4, iShift
End Sub


' ===============================================================
' N� de Conditionnement

Private Sub RechercheConditionnement()
  Dim p As Libell�RA
  Set p = frmRechercheLibell�RA.Cherche(rModeConditionnement)
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
      'MsgBox "Num�ro de conditionnement invalide.", vbExclamation, sNomApp
      txtNumCdt.SetFocus
    End If
    bCheckConditionnement = False
    Exit Function
  End If
  
  Dim p As Libell�RA
  Set p = LireLibell�RA(rModeConditionnement, txtNumCdt)
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

  If Not bContr�leVieuxLibell�(txtNumCdt, "conditionnement", p.lcr_libelle, bMessage) Then
    bCheckConditionnement = False
    Exit Function
  End If


  ' Mise � jour de la structure de donn�es
  cra.hCondit = VN(txtNumCdt)

  ' Petit avertissement�
  If cra.hCondit = 1 Then
    MsgBox2i "CR172"
    'MsgBox "Avertissement: Il est inutile de saisir le n� de conditionnement 1, il est conseill� de laisser le champ vide dans ce cas.", vbInformation, sNomApp
  End If

  txtNomCdt = p.lcr_libelle
  bCheckConditionnement = True
End Function

Private Sub txtNumCdt_GotFocus()
  AutoSelect txtNumCdt
  SetLib sbStatus, "SimpleText", "RAtxtCdt.tag"
  'sbStatus.SimpleText = "Entrez le num�ro du conditionnement, F4 pour une recherche."
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
' N� de fabricant

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
    SetDirty        ' Au cas o� le n� �tait d�j� � -1
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
    cra.sNomFab = Null      ' Mis � jour le 1/12/1997
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
      'MsgBox "Num�ro de fabricant invalide.", vbExclamation, sNomApp
      txtNumFab.SetFocus
    End If
    bCheckFabricant = False
    Exit Function
  End If
  
  ' Cas sp�cial du n� -1
  If txtNumFab = -1 Then
    ' Fabricant libre
    If txtNomFab = "" Then
      MsgBox2i "CR176"
      'MsgBox "Num�ro de fabricant invalide." & vbCrLf & _
          "La saisie du n� -1 ne peut pas �tre effectu�e directement, il faut passer par la bo�te de saisie d'un fabricant libre, accessible avec Maj+F4.", vbExclamation, sNomApp
      bCheckFabricant = False
      Exit Function
    End If
    
    ' Mise � jour de la structure de donn�es
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
        'MsgBox "Fabricant supprim�." & vbCrLf & vbCrLf & "Le fabricant " & p.fab_numfab & ": " & p.fab_nom & " est � l'�tat supprim� dans le fichier fabricant, il ne peut pas �tre utilis�. Choisissez un autre fabricant.", vbExclamation, sNomApp
      End If
      Exit Function
    End If
    
    ' Mise � jour de la structure de donn�es
    cra.iFab = VN(txtNumFab)
    cra.sNomFab = p.fab_nom
    txtNomFab = p.fab_nom
  End If

  bCheckFabricant = True
End Function

Private Sub txtNumFab_GotFocus()
  AutoSelect txtNumFab
  SetLib sbStatus, "SimpleText", "RAtxtFab.tag"
  'sbStatus.SimpleText = "Entrez le num�ro du fabricant, F4 pour une recherche, Maj+F4 pour une saisie libre."
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
' N� de Distributeur

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
    SetDirty        ' Au cas o� le n� �tait d�j� � -1
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
    cra.sNomDis = Null          ' Mis � jour le 1/12/1997
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
      'MsgBox "Num�ro de Distributeur invalide.", vbExclamation, sNomApp
      txtNumDis.SetFocus
    End If
    bCheckDistributeur = False
    Exit Function
  End If
  
  ' Cas sp�cial du n� -1
  If txtNumDis = -1 Then
    ' Distributeur libre
    If txtNomDis = "" Then
      MsgBox2i "CR182"
      'MsgBox "Num�ro de distributeur invalide." & vbCrLf & _
          "La saisie du n� -1 ne peut pas �tre effectu�e directement, il faut passer par la bo�te de saisie d'un distributeur libre, accessible avec Maj+F4.", vbExclamation, sNomApp
      bCheckDistributeur = False
      Exit Function
    End If
    
    ' Mise � jour de la structure de donn�es
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
        'MsgBox "Distributeur supprim�." & vbCrLf & vbCrLf & "Le distributeur " & p.dis_numdis & ": " & p.dis_nom & " est � l'�tat supprim� dans le fichier distributeur, il ne peut pas �tre utilis�. Choisissez un autre distributeur.", vbExclamation, sNomApp
      End If
      Exit Function
    End If
  
    ' Mise � jour de la structure de donn�es
    cra.iDis = VN(txtNumDis)
    cra.sNomDis = p.dis_nom
    txtNomDis = p.dis_nom
  End If
  
  bCheckDistributeur = True
End Function

Private Sub txtNumDis_GotFocus()
  AutoSelect txtNumDis
  SetLib sbStatus, "SimpleText", "RAtxtDis.tag"
  'sbStatus.SimpleText = "Entrez le num�ro du distributeur, F4 pour une recherche, Maj+F4 pour une saisie libre."
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
  bCheckDateFabrication = bCheckDate("T�te", txtDateFabrication, d, "Date de fabrication", bMessage)
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
  bCheckDateLivraison = bCheckDate("T�te", txtDateLivraison, d, "Date de livraison", bMessage)
  cra.dDateLivr = d
End Function

Private Sub txtDateLivraison_Change()
  SetDirty
End Sub


' ===============================================================
' Date de livraison

Private Sub txtDateR�ceptionClient_GotFocus()
  AutoSelect txtDateR�ceptionClient
  SetLib sbStatus, "SimpleText", "RAtxtDRC.tag"
End Sub

Private Sub txtDateR�ceptionClient_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDateR�ceptionClient.Locked = False Then calendrier txtDateR�ceptionClient
  If KeyCode = vbKeyF5 And Shift = 0 And txtDateR�ceptionClient.Locked = False Then txtDateR�ceptionClient.DateSaisie = craF5.dDateR�cepCli
End Sub

Private Sub txtDateR�ceptionClient_DblClick()
  If Not txtDateR�ceptionClient.Locked Then calendrier txtDateR�ceptionClient
End Sub

Private Function bCheckDateR�ceptionClient(bMessage As Boolean) As Boolean
  Dim d
  d = cra.dDateR�cepCli
  bCheckDateR�ceptionClient = bCheckDate("T�te", txtDateR�ceptionClient, d, "Date de r�ception client", bMessage)
  cra.dDateR�cepCli = d
End Function

Private Sub txtDateR�ceptionClient_Change()
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
  bCheckDateConditionnement = bCheckDate("T�te", txtDateConditionnement, d, "Date de conditionnement", bMessage)
  cra.dDateCond = d
End Function

Private Sub txtDateConditionnement_Change()
  SetDirty
End Sub


' ===============================================================
' Date de d�conditionnement

Private Sub txtDateD�conditionnement_GotFocus()
  AutoSelect txtDateD�conditionnement
  SetLib sbStatus, "SimpleText", "RAtxtDD.tag"
  'sbStatus.SimpleText = "Entrez la date de d�conditionnement [inutilis�e], F4 pour le calendrier."
End Sub

Private Sub txtDateD�conditionnement_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDateD�conditionnement.Locked = False Then calendrier txtDateD�conditionnement
  If KeyCode = vbKeyF5 And Shift = 0 And txtDateD�conditionnement.Locked = False Then txtDateD�conditionnement.DateSaisie = NV(craF5.dDateD�cond)
End Sub

Private Sub txtDateD�conditionnement_DblClick()
  If Not txtDateD�conditionnement.Locked Then calendrier txtDateD�conditionnement
End Sub

Private Function bCheckDateD�conditionnement(bMessage As Boolean) As Boolean
  Dim d
  d = cra.dDateD�cond
  bCheckDateD�conditionnement = bCheckDate("T�te", txtDateD�conditionnement, d, "Date de D�conditionnement", bMessage)
  cra.dDateD�cond = d
End Function

Private Sub txtDateD�conditionnement_Change()
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
  
  ' Mise � jour de la structure de donn�es
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
  
  ' Mise � jour de la structure de donn�es
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
  ' Mise � jour de la structure de donn�es
  cra.sIdlot = txtIdLot
  
  bCheckIdLot = True
End Function

Private Sub txtIdLot_Change()
  ' M�canisme qui �limine les blancs superflus dans CB+n et CH+n (McDonald's)
  If (Left(txtIdLot, 5) = "CB + " Or Left(txtIdLot, 5) = "CH + ") Then
    txtIdLot = Left(txtIdLot, 2) & "+" & Mid(txtIdLot, 6)
    txtCompl�mentNom.SelStart = 99
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
  ' Mise � jour de la structure de donn�es
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
  
  ' Mise � jour de la structure de donn�es
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
  
  ' Mise � jour de la structure de donn�es
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
' N� de cadre de pr�l�vement

Private Sub RechercheCadreDePr�l�vement()
  Dim p As Libell�RA
  Set p = frmRechercheLibell�RA.Cherche(rCadrePr�l�vement)
  If Not p Is Nothing Then
    txtNumCpr = p.lcr_indice
    txtNomCpr = p.lcr_libelle
  End If
End Sub

Private Sub txtNumcpr_Change()
  txtNomCpr = ""
  SetDirty
End Sub

Private Function bCheckCadreDePr�l�vement(bMessage As Boolean) As Boolean
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
      'MsgBox "Num�ro de cadre de pr�l�vement invalide." & vbCrLf & "Le cadre de pr�l�vement est obligatoire.", vbExclamation, sNomApp
    End If
    bCheckCadreDePr�l�vement = False
    Exit Function
  End If
  
  Dim p As Libell�RA
  Set p = LireLibell�RA(rCadrePr�l�vement, txtNumCpr)
  If p Is Nothing Then
    txtNomCpr = ""
    If bMessage Then
      Focus txtNumCpr
      MsgBox2i "CO005", txtNumCpr
      'MsgBox "Cadre de pr�l�vement inexistant.", vbExclamation, sNomApp
      txtNumCpr.SetFocus
    End If
    bCheckCadreDePr�l�vement = False
    Exit Function
  End If
  
  
  If Not bContr�leVieuxLibell�(txtNumCpr, "cadre de pr�l�vement", p.lcr_libelle, bMessage) Then
    bCheckCadreDePr�l�vement = False
    Exit Function
  End If

  
  ' Mise � jour de la structure de donn�es
  cra.hCadrePr�l = VN(txtNumCpr)

  txtNomCpr = p.lcr_libelle
  bCheckCadreDePr�l�vement = True
End Function

Private Sub txtNumcpr_GotFocus()
  AutoSelect txtNumCpr
  SetLib sbStatus, "SimpleText", "RAtxtCpr.tag"
  'sbStatus.SimpleText = "Entrez le num�ro du cadre de pr�l�vement, F4 pour une recherche."
End Sub

Private Sub txtNumcpr_LostFocus()
  If bCheckCadreDePr�l�vement(False) Or txtNumCpr = "" Then
    txtNumCpr.ForeColor = &H80000008
  Else
    txtNumCpr.ForeColor = &HFF&
  End If
End Sub

Private Sub txtNumcpr_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtNumCpr.Locked = False Then RechercheCadreDePr�l�vement
  If KeyCode = vbKeyF5 And Shift = 0 And txtNumCpr.Locked = False Then txtNumCpr = craF5.hCadrePr�l
End Sub

Private Sub txtNumcpr_DblClick()
  txtNumcpr_KeyDown vbKeyF4, iShift
End Sub



' ===============================================================
' R�f�rence d'origine

Private Sub txtRefOrigine_GotFocus()
  AutoSelect txtRefOrigine
  SetLib sbStatus, "SimpleText", "RAtxtRefO.tag"
  'sbStatus.SimpleText = "Entrez la r�f�rence d'origine, en cas de contre-analyse."
End Sub

Private Function bCheckRefOrigine(bMessage As Boolean) As Boolean
  ' Mise � jour de la structure de donn�es
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
  'sbStatus.SimpleText = "Entrez le code fabricant (code interne au fabricant, pas le n� du ficheir fabricant)."
End Sub

Private Function bCheckCodeFabricant(bMessage As Boolean) As Boolean
  ' Mise � jour de la structure de donn�es
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
' Options d'�dition du RA

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
  'sbStatus.SimpleText = "Entrez les options d'�dition du RA, F4 pour le d�tail."
End Sub

Private Function bCheckOptionsEdition(bMessage As Boolean) As Boolean
  ' Mise � jour de la structure de donn�es
  cra.sOptionsEdition = txtOptionsEdition
  
  If InStr(txtOptionsEdition, "Z") <> 0 And Left(txtPr�fixe, 3) <> "MAC" Then
    Dim sMessage As String
    sMessage = sGetIntlLib("RAtxtChkOE", "PROBL�ME DE COH�RENCE" & vbCrLf & vbCrLf & "Option d'�dition crypt�e (Z) et �tablissement non McDonald's (prefixe pas en MAC*)." & vbCrLf & vbCrLf & "S'il ne s'agit pas d'une erreur de saisie, pr�venez imp�rativement la DI.")
    D�monJournalUnix "OptionsEdition", "Erreur interne", sMessage
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
  'sbStatus.SimpleText = "Entrez la marque de l'�chantillon."
End Sub

Private Function bCheckMarque(bMessage As Boolean) As Boolean
  ' Mise � jour de la structure de donn�es
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
' Unit� de vente

Private Sub txtUV_GotFocus()
  AutoSelect txtUV
  SetLib sbStatus, "SimpleText", "RAtxtUV.tag"
  'sbStatus.SimpleText = "Entrez l'unit� de vente de l'�chantillon."
End Sub

Private Function bCheckUV(bMessage As Boolean) As Boolean
  ' Mise � jour de la structure de donn�es
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
' Date de r�ception

Private Sub txtDateR�ception_GotFocus()
  AutoSelect txtDateR�ception
  SetLib sbStatus, "SimpleText", "RAtxtDR�c.tag"
  'sbStatus.SimpleText = "Entrez la date de r�ception, F4 pour le calendrier."
End Sub

Private Sub txtDateR�ception_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDateR�ception.Locked = False Then calendrier txtDateR�ception
  If KeyCode = vbKeyF5 And Shift = 0 And txtDateR�ception.Locked = False Then txtDateR�ception.DateSaisie = craF5.dDateR�cep
End Sub

Private Sub txtDateR�ception_DblClick()
  If Not txtDateR�ception.Locked Then calendrier txtDateR�ception
End Sub

Private Function bCheckDateR�ception(bMessage As Boolean) As Boolean
  Dim d
  d = cra.dDateR�cep
  bCheckDateR�ception = bCheckDate("T�te", txtDateR�ception, d, "Date de r�ception", bMessage)
  cra.dDateR�cep = d
End Function

Private Sub txtDateR�ception_Change()
  SetDirty
End Sub


' ===============================================================
' Heure de r�ception

Private Sub txtHeureR�ception_GotFocus()
  AutoSelect txtHeureR�ception
  SetLib sbStatus, "SimpleText", "RAtxtHR.tag"
  'sbStatus.SimpleText = "Entrez l'heure de r�ception."
End Sub

Private Function bCheckHeureR�ception(bMessage As Boolean) As Boolean
  If txtHeureR�ception.HeureSaisie = "ERR" Then
    If bMessage Then
      bCheckHeureR�ception = False
      Focus txtHeureR�ception
      MsgBox2i "CO004", txtHeureR�ception
      'MsgBox "Heure de R�ception invalide.", vbExclamation, sNomApp
      txtHeureR�ception.SetFocus
    End If
    Exit Function
  End If
  
  ' Mise � jour de la structure de donn�es
  cra.hHeureR�cep = VN(txtHeureR�ception.HeureSaisie)
  
'  ' Tests de vraisemblance
'  If IsNumeric(cra.hHeureR�cep) Then
'    If cra.hHeureR�cep < 600 Or cra.hHeureR�cep > 2000 Then
'      If bMessage Then
'        MsgBox2i "CR162"
'        'MsgBox "Avertissement: R�ception avant 6:00 ou apr�s 20:00. V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
'      End If
'    End If
'  End If
  
  bCheckHeureR�ception = True
End Function

Private Sub txtHeureR�ception_Change()
  SetDirty
End Sub

Private Sub txtHeureR�ception_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtHeureR�ception.Locked = False Then txtHeureR�ception.HeureSaisie = craF5.hHeureR�cep
End Sub


' ===============================================================
' Aspect �chantillon

Private Sub RechercheAspect�chantillon()
  Dim p As Libell�RA
  Set p = frmRechercheLibell�RA.Cherche(rAspectEchantillon)
  If Not p Is Nothing Then
    txtAspect = p.lcr_indice
    txtNomAspect = p.lcr_libelle
  End If
End Sub

Private Sub txtAspect_Change()
  txtNomAspect = ""
  SetDirty
End Sub

Private Function bCheckAspect�chantillon(bMessage As Boolean) As Boolean
  If txtAspect = "" Then
    cra.hAspect = Null
    bCheckAspect�chantillon = True
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
      'MsgBox "Num�ro d'aspect �chantillon invalide.", vbExclamation, sNomApp
      txtAspect.SetFocus
    End If
    bCheckAspect�chantillon = False
    Exit Function
  End If
  
  Dim p As Libell�RA
  Set p = LireLibell�RA(rAspectEchantillon, txtAspect)
  If p Is Nothing Then
    txtNomAspect = ""
    If bMessage Then
      Focus txtAspect
      MsgBox2i "CO005", txtAspect
      'MsgBox "Aspect �chantillon inexistant.", vbExclamation, sNomApp
      txtAspect.SetFocus
    End If
    bCheckAspect�chantillon = False
    Exit Function
  End If
  
 If Not bContr�leVieuxLibell�(txtAspect, "aspect �chantillon", p.lcr_libelle, bMessage) Then
    bCheckAspect�chantillon = False
    Exit Function
  End If

  
  ' Mise � jour de la structure de donn�es
  cra.hAspect = VN(txtAspect)

  txtNomAspect = p.lcr_libelle
  bCheckAspect�chantillon = True
End Function

Private Sub txtAspect_GotFocus()
  AutoSelect txtAspect
  SetLib sbStatus, "SimpleText", "RAtxtAspect.tag"
  'sbStatus.SimpleText = "Entrez le num�ro de l'aspect, F4 pour une recherche."
End Sub

Private Sub txtAspect_LostFocus()
  If bCheckAspect�chantillon(False) Or txtAspect = "" Then
    txtAspect.ForeColor = &H80000008
  Else
    txtAspect.ForeColor = &HFF&
  End If
End Sub

Private Sub txtAspect_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtAspect.Locked = False Then RechercheAspect�chantillon
  If KeyCode = vbKeyF5 And Shift = 0 And txtAspect.Locked = False Then txtAspect = NV(craF5.hAspect)
End Sub

Private Sub txtAspect_DblClick()
  txtAspect_KeyDown vbKeyF4, iShift
End Sub



' ===============================================================
' Niveau d'�laboration

Private Sub RechercheNiveau�laboration()
  Dim p As Libell�RA
  Set p = frmRechercheLibell�RA.Cherche(rNiveau�laboration)
  If Not p Is Nothing Then
    txtNiv�labo = p.lcr_indice
    txtNomNiv�labo = p.lcr_libelle
  End If
End Sub

Private Sub txtNiv�labo_Change()
  txtNomNiv�labo = ""
  SetDirty
End Sub

Private Function bCheckNiveau�laboration(bMessage As Boolean) As Boolean
  If txtNiv�labo = "" Then
    cra.hNiveau�laboration = Null
    bCheckNiveau�laboration = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtNiv�labo) Then
    bOk = False
  Else
    If txtNiv�labo < 1 Or txtNiv�labo > 1000 Then
      bOk = False
    Else
      If txtNiv�labo <> CStr(CInt(txtNiv�labo)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomNiv�labo = ""
    If bMessage Then
      Focus txtNiv�labo
      MsgBox2i "CO004", txtNiv�labo
      'MsgBox "Code de niveau d'�laboration invalide.", vbExclamation, sNomApp
      txtNiv�labo.SetFocus
    End If
    bCheckNiveau�laboration = False
    Exit Function
  End If
  
  Dim p As Libell�RA
  Set p = LireLibell�RA(rNiveau�laboration, txtNiv�labo)
  If p Is Nothing Then
    txtNomNiv�labo = ""
    If bMessage Then
      Focus txtNiv�labo
      MsgBox2i "CO005", txtNiv�labo
      'MsgBox "Niveau d'�laboration inexistant.", vbExclamation, sNomApp
      txtNiv�labo.SetFocus
    End If
    bCheckNiveau�laboration = False
    Exit Function
  End If
  
  If Not bContr�leVieuxLibell�(txtNiv�labo, "niveau d'�laboration", p.lcr_libelle, bMessage) Then
    bCheckNiveau�laboration = False
    Exit Function
  End If
  
  
  ' Mise � jour de la structure de donn�es
  cra.hNiveau�laboration = VN(txtNiv�labo)

  txtNomNiv�labo = p.lcr_libelle
  bCheckNiveau�laboration = True
End Function

Private Sub txtNiv�labo_GotFocus()
  AutoSelect txtNiv�labo
  SetLib sbStatus, "SimpleText", "RAtxtNiv�labo.tag"
  'sbStatus.SimpleText = "Entrez le num�ro de niveau d'�laboration, F4 pour une recherche."
End Sub

Private Sub txtNiv�labo_LostFocus()
  If bCheckNiveau�laboration(False) Or txtNiv�labo = "" Then
    txtNiv�labo.ForeColor = &H80000008
  Else
    txtNiv�labo.ForeColor = &HFF&
  End If
End Sub

Private Sub txtNiv�labo_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtNiv�labo.Locked = False Then RechercheNiveau�laboration
  If KeyCode = vbKeyF5 And Shift = 0 And txtNiv�labo.Locked = False Then txtNiv�labo = NV(craF5.hNiveau�laboration)
End Sub

Private Sub txtNiv�labo_DblClick()
  txtNiv�labo_KeyDown vbKeyF4, iShift
End Sub



' ===============================================================
' �tat physique

Private Sub Recherche�tatPhysique()
  Dim p As Libell�RA
  Set p = frmRechercheLibell�RA.Cherche(r�tatPhysique)
  If Not p Is Nothing Then
    txt�tatPhy = p.lcr_indice
    txtNom�tatPhy = p.lcr_libelle
  End If
End Sub

Private Sub txt�tatPhy_Change()
  txtNom�tatPhy = ""
  SetDirty
End Sub

Private Function bCheck�tatPhysique(bMessage As Boolean) As Boolean
  If txt�tatPhy = "" Then
    cra.h�tatPhysique = Null
    bCheck�tatPhysique = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txt�tatPhy) Then
    bOk = False
  Else
    If txt�tatPhy < 1 Or txt�tatPhy > 1000 Then
      bOk = False
    Else
      If txt�tatPhy <> CStr(CInt(txt�tatPhy)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNom�tatPhy = ""
    If bMessage Then
      Focus txt�tatPhy
      MsgBox2i "CO004", txt�tatPhy
      'MsgBox "Code d'�tat physique invalide.", vbExclamation, sNomApp
      txt�tatPhy.SetFocus
    End If
    bCheck�tatPhysique = False
    Exit Function
  End If
  
  Dim p As Libell�RA
  Set p = LireLibell�RA(r�tatPhysique, txt�tatPhy)
  If p Is Nothing Then
    txtNom�tatPhy = ""
    If bMessage Then
      Focus txt�tatPhy
      MsgBox2i "CO005", txt�tatPhy
      'MsgBox "�tat physique inexistant.", vbExclamation, sNomApp
      txt�tatPhy.SetFocus
    End If
    bCheck�tatPhysique = False
    Exit Function
  End If
  
  If Not bContr�leVieuxLibell�(txt�tatPhy, "�tat physique", p.lcr_libelle, bMessage) Then
    bCheck�tatPhysique = False
    Exit Function
  End If

  
  ' Mise � jour de la structure de donn�es
  cra.h�tatPhysique = VN(txt�tatPhy)

  txtNom�tatPhy = p.lcr_libelle
  bCheck�tatPhysique = True
End Function

Private Sub txt�tatPhy_GotFocus()
  AutoSelect txt�tatPhy
  SetLib sbStatus, "SimpleText", "RAtxt�tatPhy.tag"
  'sbStatus.SimpleText = "Entrez le num�ro d'�tat physique, F4 pour une recherche."
End Sub

Private Sub txt�tatPhy_LostFocus()
  If bCheck�tatPhysique(False) Or txt�tatPhy = "" Then
    txt�tatPhy.ForeColor = &H80000008
  Else
    txt�tatPhy.ForeColor = &HFF&
  End If
End Sub

Private Sub txt�tatPhy_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txt�tatPhy.Locked = False Then Recherche�tatPhysique
  If KeyCode = vbKeyF5 And Shift = 0 And txt�tatPhy.Locked = False Then txt�tatPhy = NV(craF5.h�tatPhysique)
End Sub

Private Sub txt�tatPhy_DblClick()
  txt�tatPhy_KeyDown vbKeyF4, iShift
End Sub



' ===============================================================
' Contenant

Private Sub RechercheContenant()
  Dim p As Libell�RA
  Set p = frmRechercheLibell�RA.Cherche(rContenant)
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
  
  Dim p As Libell�RA
  Set p = LireLibell�RA(rContenant, txtContenant)
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
  
  If Not bContr�leVieuxLibell�(txtContenant, "contenant", p.lcr_libelle, bMessage) Then
    bCheckContenant = False
    Exit Function
  End If
  
  
  ' Mise � jour de la structure de donn�es
  cra.hContenant = VN(txtContenant)

  txtNomContenant = p.lcr_libelle
  bCheckContenant = True
End Function

Private Sub txtContenant_GotFocus()
  AutoSelect txtContenant
  SetLib sbStatus, "SimpleText", "RAtxtConte.tag"
  'sbStatus.SimpleText = "Entrez le num�ro de contenant, F4 pour une recherche."
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
' �tat de division

Private Sub Recherche�tatDivision()
  Dim p As Libell�RA
  Set p = frmRechercheLibell�RA.Cherche(r�tatdivision)
  If Not p Is Nothing Then
    txt�tatDiv = p.lcr_indice
    txtNom�tatDiv = p.lcr_libelle
  End If
End Sub

Private Sub txt�tatDiv_Change()
  txtNom�tatDiv = ""
  SetDirty
End Sub

Private Function bCheck�tatDivision(bMessage As Boolean) As Boolean
  If txt�tatDiv = "" Then
    cra.h�tatDivision = Null
    bCheck�tatDivision = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txt�tatDiv) Then
    bOk = False
  Else
    If txt�tatDiv < 1 Or txt�tatDiv > 1000 Then
      bOk = False
    Else
      If txt�tatDiv <> CStr(CInt(txt�tatDiv)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNom�tatDiv = ""
    If bMessage Then
      Focus txt�tatDiv
      MsgBox2i "CO004", txt�tatDiv
      'MsgBox "Code d'�tat division invalide.", vbExclamation, sNomApp
      txt�tatDiv.SetFocus
    End If
    bCheck�tatDivision = False
    Exit Function
  End If
  
  Dim p As Libell�RA
  Set p = LireLibell�RA(r�tatdivision, txt�tatDiv)
  If p Is Nothing Then
    txtNom�tatDiv = ""
    If bMessage Then
      Focus txt�tatDiv
      MsgBox2i "CO005", txt�tatDiv
      'MsgBox "�tat division inexistant.", vbExclamation, sNomApp
      txt�tatDiv.SetFocus
    End If
    bCheck�tatDivision = False
    Exit Function
  End If
  
  If Not bContr�leVieuxLibell�(txt�tatDiv, "�tat de division", p.lcr_libelle, bMessage) Then
    bCheck�tatDivision = False
    Exit Function
  End If

  
  ' Mise � jour de la structure de donn�es
  cra.h�tatDivision = VN(txt�tatDiv)

  txtNom�tatDiv = p.lcr_libelle
  bCheck�tatDivision = True
End Function

Private Sub txt�tatDiv_GotFocus()
  AutoSelect txt�tatDiv
  SetLib sbStatus, "SimpleText", "RAtxt�tatDiv.tag"
  'sbStatus.SimpleText = "Entrez le num�ro d'�tat division, F4 pour une recherche."
End Sub

Private Sub txt�tatDiv_LostFocus()
  If bCheck�tatDivision(False) Or txt�tatDiv = "" Then
    txt�tatDiv.ForeColor = &H80000008
  Else
    txt�tatDiv.ForeColor = &HFF&
  End If
End Sub

Private Sub txt�tatDiv_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txt�tatDiv.Locked = False Then Recherche�tatDivision
  If KeyCode = vbKeyF5 And Shift = 0 And txt�tatDiv.Locked = False Then txt�tatDiv = NV(craF5.h�tatDivision)
End Sub

Private Sub txt�tatDiv_DblClick()
  txt�tatDiv_KeyDown vbKeyF4, iShift
End Sub



' ===============================================================
' Technologie de fabrication

Private Sub RechercheTechnologieFabrication()
  Dim p As Libell�RA
  Set p = frmRechercheLibell�RA.Cherche(rTechnologieFabrication)
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
  
  Dim p As Libell�RA
  Set p = LireLibell�RA(rTechnologieFabrication, txtTechFab)
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
  
  If Not bContr�leVieuxLibell�(txtTechFab, "technologie de fabrication", p.lcr_libelle, bMessage) Then
    bCheckTechnologieFabrication = False
    Exit Function
  End If
  
  
  ' Mise � jour de la structure de donn�es
  cra.hTechnologieFabrication = VN(txtTechFab)

  txtNomTechFab = p.lcr_libelle
  bCheckTechnologieFabrication = True
End Function

Private Sub txtTechFab_GotFocus()
  AutoSelect txtTechFab
  SetLib sbStatus, "SimpleText", "RAtxtTechFab.tag"
  'sbStatus.SimpleText = "Entrez le num�ro de technologie de fabrication, F4 pour une recherche."
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
' Secteur de pr�l�vement

Private Sub RechercheSecteurPr�l�vement()
  Dim p As Libell�RA
  Set p = frmRechercheLibell�RA.Cherche(rSecteurPr�l�vement)
  If Not p Is Nothing Then
    txtSecteurPr�l = p.lcr_indice
    txtNomSecteurPr�l = p.lcr_libelle
  End If
End Sub

Private Sub txtSecteurPr�l_Change()
  txtNomSecteurPr�l = ""
  SetDirty
End Sub

Private Function bCheckSecteurPr�l�vement(bMessage As Boolean) As Boolean
  If txtSecteurPr�l = "" Then
    cra.hSecteurPr�l = Null
    bCheckSecteurPr�l�vement = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtSecteurPr�l) Then
    bOk = False
  Else
    If txtSecteurPr�l < 1 Or txtSecteurPr�l > 10 Then
      bOk = False
    Else
      If txtSecteurPr�l <> CStr(CInt(txtSecteurPr�l)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomSecteurPr�l = ""
    If bMessage Then
      Focus txtSecteurPr�l
      MsgBox2i "CO004", txtSecteurPr�l
      'MsgBox "Code secteur de pr�l�vement invalide.", vbExclamation, sNomApp
      txtSecteurPr�l.SetFocus
    End If
    bCheckSecteurPr�l�vement = False
    Exit Function
  End If
  
  Dim p As Libell�RA
  Set p = LireLibell�RA(rSecteurPr�l�vement, txtSecteurPr�l)
  If p Is Nothing Then
    txtNomSecteurPr�l = ""
    If bMessage Then
      Focus txtSecteurPr�l
      MsgBox2i "CO005", txtSecteurPr�l
      'MsgBox "Code secteur de pr�l�vement inexistant.", vbExclamation, sNomApp
      txtSecteurPr�l.SetFocus
    End If
    bCheckSecteurPr�l�vement = False
    Exit Function
  End If
  
  If Not bContr�leVieuxLibell�(txtSecteurPr�l, "secteur de pr�l�vement", p.lcr_libelle, bMessage) Then
    bCheckSecteurPr�l�vement = False
    Exit Function
  End If
  
  
  ' On v�rifie la coh�rence par rapport au fichier produit
  If cra.t1 = 4 And VN(txtSecteurPr�l) <> 4 Then
    If bMessage Then
      MsgBox2i "CR202"
      'MsgBox "Avertissement: Le produit fait partie du secteur 4 (pr�l�vements autres et sp�cifiques clients) alors que le secteur de pr�l�vement indiqu� n'est pas de 4." & vbCrLf & vbCrLf & "V�rifiez que cette incoh�rence est voulue !", vbInformation, sNomApp
    End If
  End If
  
  
  ' Mise � jour de la structure de donn�es
  cra.hSecteurPr�l = VN(txtSecteurPr�l)

  txtNomSecteurPr�l = p.lcr_libelle
  bCheckSecteurPr�l�vement = True
End Function

Private Sub txtSecteurPr�l_GotFocus()
  AutoSelect txtSecteurPr�l
  SetLib sbStatus, "SimpleText", "RAtxtSecPr�l.tag"
  'sbStatus.SimpleText = "Entrez le num�ro de code secteur de pr�l�vement, F4 pour une recherche."
End Sub

Private Sub txtSecteurPr�l_LostFocus()
  If bCheckSecteurPr�l�vement(False) Or txtSecteurPr�l = "" Then
    txtSecteurPr�l.ForeColor = &H80000008
  Else
    txtSecteurPr�l.ForeColor = &HFF&
  End If
End Sub

Private Sub txtSecteurPr�l_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtSecteurPr�l.Locked = False Then RechercheSecteurPr�l�vement
  If KeyCode = vbKeyF5 And Shift = 0 And txtSecteurPr�l.Locked = False Then txtSecteurPr�l = NV(craF5.hSecteurPr�l)
End Sub

Private Sub txtSecteurPr�l_DblClick()
  txtSecteurPr�l_KeyDown vbKeyF4, iShift
End Sub


' ===============================================================
' Conditions de pr�l�vement

Private Sub RechercheConditionsPr�l�vement()
  Dim p As Libell�RA
  Set p = frmRechercheLibell�RA.Cherche(rConditionsPr�l�vement)
  If Not p Is Nothing Then
    txtCondPr�l = p.lcr_indice
    txtNomCondPr�l = p.lcr_libelle
  End If
End Sub

Private Sub txtCondPr�l_Change()
  txtNomCondPr�l = ""
  SetDirty
End Sub

Private Function bCheckConditionsPr�l�vement(bMessage As Boolean) As Boolean
  If txtCondPr�l = "" Then
    cra.hCondPr�l = Null
    bCheckConditionsPr�l�vement = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtCondPr�l) Then
    bOk = False
  Else
    If txtCondPr�l < 1 Or txtCondPr�l > 1000 Then
      bOk = False
    Else
      If txtCondPr�l <> CStr(CInt(txtCondPr�l)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomCondPr�l = ""
    If bMessage Then
      Focus txtCondPr�l
      MsgBox2i "CO004", txtCondPr�l
      'MsgBox "Code condition de pr�l�vement invalide.", vbExclamation, sNomApp
      txtCondPr�l.SetFocus
    End If
    bCheckConditionsPr�l�vement = False
    Exit Function
  End If
  
  Dim p As Libell�RA
  Set p = LireLibell�RA(rConditionsPr�l�vement, txtCondPr�l)
  If p Is Nothing Then
    txtNomCondPr�l = ""
    If bMessage Then
      Focus txtCondPr�l
      MsgBox2i "CO005", txtCondPr�l
      'MsgBox "Condition de pr�l�vement inexistante.", vbExclamation, sNomApp
      txtCondPr�l.SetFocus
    End If
    bCheckConditionsPr�l�vement = False
    Exit Function
  End If
  
  If Not bContr�leVieuxLibell�(txtCondPr�l, "condition de pr�l�vement", p.lcr_libelle, bMessage) Then
    bCheckConditionsPr�l�vement = False
    Exit Function
  End If

  
  ' Mise � jour de la structure de donn�es
  cra.hCondPr�l = VN(txtCondPr�l)

  txtNomCondPr�l = p.lcr_libelle
  bCheckConditionsPr�l�vement = True
End Function

Private Sub txtCondPr�l_GotFocus()
  AutoSelect txtCondPr�l
  SetLib sbStatus, "SimpleText", "RAtxtCondPr�l.tag"
  'sbStatus.SimpleText = "Entrez le num�ro de condition de pr�l�vement, F4 pour une recherche."
End Sub

Private Sub txtCondPr�l_LostFocus()
  If bCheckConditionsPr�l�vement(False) Or txtCondPr�l = "" Then
    txtCondPr�l.ForeColor = &H80000008
  Else
    txtCondPr�l.ForeColor = &HFF&
  End If
End Sub

Private Sub txtCondPr�l_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtCondPr�l.Locked = False Then RechercheConditionsPr�l�vement
  If KeyCode = vbKeyF5 And Shift = 0 And txtCondPr�l.Locked = False Then txtCondPr�l = NV(craF5.hCondPr�l)
End Sub

Private Sub txtCondPr�l_DblClick()
  txtCondPr�l_KeyDown vbKeyF4, iShift
End Sub


' ===============================================================
' Intervention op�rateur

Private Sub RechercheInterventionOp�rateur()
  Dim p As Libell�RA
  Set p = frmRechercheLibell�RA.Cherche(rInterventionOp�rateur)
  If Not p Is Nothing Then
    txtIntOp�r = p.lcr_indice
    txtNomIntOp�r = p.lcr_libelle
  End If
End Sub

Private Sub txtIntOp�r_Change()
  txtNomIntOp�r = ""
  SetDirty
End Sub

Private Function bCheckInterventionOp�rateur(bMessage As Boolean) As Boolean
  If txtIntOp�r = "" Then
    cra.hInterventionOp�rateur = Null
    bCheckInterventionOp�rateur = True
    Exit Function
  End If
  
  Dim bOk As Boolean
  bOk = True
  If Not IsNumeric(txtIntOp�r) Then
    bOk = False
  Else
    If txtIntOp�r < 1 Or txtIntOp�r > 1000 Then
      bOk = False
    Else
      If txtIntOp�r <> CStr(CInt(txtIntOp�r)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomIntOp�r = ""
    If bMessage Then
      Focus txtIntOp�r
      MsgBox2i "CO004", txtIntOp�r
      'MsgBox "Code intervention op�rateur invalide.", vbExclamation, sNomApp
      txtIntOp�r.SetFocus
    End If
    bCheckInterventionOp�rateur = False
    Exit Function
  End If
  
  Dim p As Libell�RA
  Set p = LireLibell�RA(rInterventionOp�rateur, txtIntOp�r)
  If p Is Nothing Then
    txtNomIntOp�r = ""
    If bMessage Then
      Focus txtIntOp�r
      MsgBox2i "CO005", txtIntOp�r
      'MsgBox "Code intervention op�rateur inexistante", vbExclamation, sNomApp
      txtIntOp�r.SetFocus
    End If
    bCheckInterventionOp�rateur = False
    Exit Function
  End If
  
  If Not bContr�leVieuxLibell�(txtIntOp�r, "intervention op�rateur", p.lcr_libelle, bMessage) Then
    bCheckInterventionOp�rateur = False
    Exit Function
  End If
  
  
  ' Mise � jour de la structure de donn�es
  cra.hInterventionOp�rateur = VN(txtIntOp�r)

  txtNomIntOp�r = p.lcr_libelle
  bCheckInterventionOp�rateur = True
End Function

Private Sub txtIntOp�r_GotFocus()
  AutoSelect txtIntOp�r
  SetLib sbStatus, "SimpleText", "RAtxtIntOp�r.tag"
  'sbStatus.SimpleText = "Entrez le num�ro d'intervention op�rateur, F4 pour une recherche."
End Sub

Private Sub txtIntOp�r_LostFocus()
  If bCheckInterventionOp�rateur(False) Or txtIntOp�r = "" Then
    txtIntOp�r.ForeColor = &H80000008
  Else
    txtIntOp�r.ForeColor = &HFF&
  End If
End Sub

Private Sub txtIntOp�r_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtIntOp�r.Locked = False Then RechercheInterventionOp�rateur
  If KeyCode = vbKeyF5 And Shift = 0 And txtIntOp�r.Locked = False Then txtIntOp�r = NV(craF5.hInterventionOp�rateur)
End Sub

Private Sub txtIntOp�r_DblClick()
  txtIntOp�r_KeyDown vbKeyF4, iShift
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
  
  ' Mise � jour de la structure de donn�es
  cra.iInfo1 = VN(txtInfo1)

  bCheckInfosRab1 = True
End Function


Private Function bCheckInfosRab2(bMessage As Boolean) As Boolean
  ' Mise � jour de la structure de donn�es
  cra.sInfo2 = txtInfo2

  bCheckInfosRab2 = True
End Function


Private Sub txtInfo1_GotFocus()
  AutoSelect txtInfo1
  SetLib sbStatus, "SimpleText", "RAtxtInfo1.tag"
  'sbStatus.SimpleText = "Info compl�mentaire 1, num�rique"
End Sub

Private Sub txtInfo2_GotFocus()
  AutoSelect txtInfo2
  SetLib sbStatus, "SimpleText", "RAtxtInfo2.tag"
  'sbStatus.SimpleText = "Info compl�mentaire 2, 10 caract�res maximum"
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
  ' Les contr�les ne portent que sur les pr�l�vements � compter du 1/1/99
  ' Non: sur test sur t1 uniquement !
  
  ' S'il s'agit d'un produit avec t1 d�fini, pas de contr�le
  If cra.t1 > 0 Then
    If cra.t1 < 4 And cra.dDatePr�l >= #1/1/1999# Then
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

    
  If IsNull(cra.hSecteurPr�l) Then
    If bMessage Then
      Focus txtSecteurPr�l
      MsgBox2i "CR209", cra.t1
      'MsgBox "Le secteur de pr�l�vement [7] est OBLIGATOIRE avec le nouveau fichier produit (cra.t1=" & cra.t1 & ").", vbExclamation, sNomApp
    End If
    bCheckNouveauxProduits = False
    Exit Function
  End If
  
  If IsNull(cra.h�tatPhysique) Then
    If bMessage Then
      Focus txt�tatPhy
      MsgBox2i "CR210", cra.t1
      'MsgBox "L'�tat physique [8] est OBLIGATOIRE avec le nouveau fichier produit (cra.t1=" & cra.t1 & ").", vbExclamation, sNomApp
    End If
    bCheckNouveauxProduits = False
    Exit Function
  End If
  
  If IsNull(cra.hInterventionOp�rateur) Then
    If bMessage Then
      Focus txtIntOp�r
      MsgBox2i "CR211", cra.t1
      'MsgBox "Le code intervention op�rateur [9] est OBLIGATOIRE avec le nouveau fichier produit (cra.t1=" & cra.t1 & ").", vbExclamation, sNomApp
    End If
    bCheckNouveauxProduits = False
    Exit Function
  End If
  
  
  ' R�gles de coh�rence (doc JPVP)
  If cra.hSecteurPr�l = 1 And cra.hInterventionOp�rateur <> 1 Then
    If bMessage Then
      Focus txtIntOp�r
      MsgBox2i "CR212"
      'MsgBox "Attention, probl�me de coh�rence" & vbCrLf & vbCrLf & "Quand le secteur de pr�l�vement est 1 (Fabrication IAA), le code intervention op�rateur doit �tre 1 (Pr�paration sur place).", vbExclamation, sNomApp
    End If
    bCheckNouveauxProduits = False
    Exit Function
  End If
    
  If cra.hSecteurPr�l = 2 And cra.hInterventionOp�rateur <> 2 Then
    If bMessage Then
      Focus txtIntOp�r
      MsgBox2i "CR213"
      'MsgBox "Attention, probl�me de coh�rence" & vbCrLf & vbCrLf & "Quand le secteur de pr�l�vement est 2 (N�goce non manipul�), le code intervention op�rateur doit �tre 2 (N�goce non manipul�).", vbExclamation, sNomApp
    End If
    bCheckNouveauxProduits = False
    Exit Function
  End If
    
  If cra.hSecteurPr�l = 3 And cra.hInterventionOp�rateur = 2 Then
    If bMessage Then
      Focus txtIntOp�r
      MsgBox2i "CR214"
      'MsgBox "Attention, probl�me de coh�rence" & vbCrLf & vbCrLf & "Quand le secteur de pr�l�vement est 3 (Fabrication sur place/N�goce manipul�), le code intervention op�rateur doit �tre 1 ou 3 (Pr�paration sur place ou N�goce manipul�).", vbExclamation, sNomApp
    End If
    bCheckNouveauxProduits = False
    Exit Function
  End If
  
  bCheckNouveauxProduits = True
End Function


' ===============================================================
' Conclusion
' Ne fait pas partie des champs modifiables, mais permet une initialisation
' identique � celle des autres champs

Private Function bCheckConclusion(bMessage As Boolean) As Boolean
  If Not IsNumeric(txtNumCon) Then
    txtNomCon = ""
    If bMessage Then
      Focus txtNumCon
      MsgBox2i "CO004", txtNumCon
      'MsgBox "Num�ro de conclusion invalide.", vbExclamation, sNomApp
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
' Contr�les compl�mentaires de dates

Private Function bAnalyseCommenc�e(iNumS�rie As Variant) As Boolean
  If IsNumeric(iNumS�rie) Then
    bAnalyseCommenc�e = iNumS�rie <> 0 And iNumS�rie <> -1
  Else
    bAnalyseCommenc�e = False
  End If
End Function

Private Function bCheckDate2() As Boolean
  If cra.dDateDebAnPr�vue < cra.dDatePr�l Then
    MsgBox2i "CR217"
    'MsgBox "Difficile d'avoir une date de d�but d'analyse ant�rieure � la date de pr�l�vement !", vbExclamation, sNomApp
    bCheckDate2 = False
    Exit Function
  End If
  
  ' Les tests d'analyses diff�r�es ne s'appliquent pas aux crit�res OGM
  If Not cra.sCrit�re Like "OGM*" Then
  
    ' Dans le cas d'un test(cadre de pr�l�vement 7), d'une analyse � la DLC (cadre de pr�l�vement 8),
    ' un test de stabilit� (36), une analyse diff�r�e (37) ou un test de vieillissement (44), on v�rifie que la date
    ' de d�but d'analyse pr�vue est dans les deux mois qui suivent la saisie
    If cra.hCadrePr�l = 7 Or cra.hCadrePr�l = 8 Or cra.hCadrePr�l = 36 Or cra.hCadrePr�l = 37 Or cra.hCadrePr�l = 44 Then
      Dim dS As Date
      dS = cra.dDateSaisPH
      If dS = 0 Then dS = Now   ' Cas de la 1�re saisie avant enregistrement
      
      If cra.dDateDebAnPr�vue > dS + 2 * 31 Then
        MsgBox2i "CR218"
        'MsgBox "Analyse � la DLC, test, test de stabilit� ou analyse diff�r�e plus de 2 mois par rapport � la date de saisie ???" & vbCrLf & "Il n'est pas possible de saisir une analyse plus de deux mois d'avance.", vbExclamation, sNomApp
        bCheckDate2 = False
        If Not bShiftPressed Then Exit Function
      End If
      
      ' Message d�bray� pour le cadre de pr�l�vement test
      If cra.dDateDebAnPr�vue = Today And Not bAnalyseCommenc�e(cra.iNumS�rie) And cra.hCadrePr�l <> 7 Then
        MsgBox2i "CR219"
        'MsgBox "Avertissement: Analyse � la DLC, test de stabilit� ou analyse diff�r�e avec une date de d�but d'analyse pr�vue pour aujourd'hui. V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
      End If
    Else    ' Tous les autres cadres de pr�l�vement
      If cra.dDateDebAnPr�vue > cra.dDatePr�l + 5 Then
        MsgBox2i "CR220"
        'MsgBox "Analyse �� d�lai normal� avec une date de d�but d'analyse pr�vue plus de 5 jours apr�s la date de pr�l�vement ???" _
          & vbCrLf & vbCrLf & "Les cadres de pr�l�vement 7:�test�, 8:�� la DLC�, 36:�test de stabilit�, 37:�analyse diff�r�e� et 44:"test de vieillissement" d�sactivent ce contr�le.", vbExclamation, sNomApp
        bCheckDate2 = False
        If Not bShiftPressed Then Exit Function
      End If
    
      If cra.dDateDebAnPr�vue > Today + 5 Then
        MsgBox2i "CR221"
        'MsgBox "Analyse �� d�lai normal� avec une date de d�but d'analyse pr�vue dans plus de 5 jours ???" _
          & vbCrLf & vbCrLf & "Les cadres de pr�l�vement 7:�test�, 8:�� la DLC�, 36:�test de stabilit�, 37:�analyse diff�r�e� et 44:�Test de vieillissement� d�sactivent ce contr�le.", vbExclamation, sNomApp
        bCheckDate2 = False
        If Not bShiftPressed Then Exit Function
      End If
    End If
  
  End If
  
  If cra.dDateDebAnPr�vue > Today And cra.iNumFRT > 0 Then
    MsgBox2i "CR222", Format(cra.dDateDebAnPr�vue, "dd/mm/yyyy")
    'MsgBox "Avertissement: La date de d�but d'analyse est diff�r�e, et il y a d�j� un num�ro de FRT (probablement suite � une modification de la date de d�but d'analyse, ou � l'attribution forc�e d'un n� de FRT)." & vbCrLf & "Effacez le n� de FRT si vous voulez que l'�chantillon soit s�lectionn� dans la liste des analyses � �ch�ance du " & Format(cra.dDateDebAnPr�vue, "dd/mm/yyyy") & ".", vbInformation, sNomApp
  End If
  
  bCheckDate2 = True
End Function


' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

' Onglet analyse

Private Sub D�sactiveBoutonsGermes()
  fgGermes.Enabled = False
  fgBo�tes.Enabled = False
  btnAjouteGerme.Enabled = False
  btnEnl�veGerme.Enabled = False
  btnModifieGerme.Enabled = False
  btnAjouteBo�te.Enabled = False
  btnEnl�veBo�te.Enabled = False
  btnModifieBo�te.Enabled = False
End Sub


Private Sub InvalideGermes()
  D�sactiveBoutonsGermes
  
  fgGermes.Rows = 1
  fgBo�tes.Rows = 1
  fgGermes.HighLight = flexHighlightNever
  fgBo�tes.HighLight = flexHighlightNever
  
  txtTitreCrit�re = ""
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
  Dim g As GermeRecherch�
  Set g = cra.cGermes(iRow)
  fgGermes.TextMatrix(iRow, 0) = g.iGerme & ":" & g.cStatus & g.sAbr�g�Labo
End Sub


Private Sub AfficheGermes()
  txtTitreCrit�re = cra.sTitreCrit�re
  txtVerCrit = NV(cra.hVerCrit)
  bdcClasseDoc = NV(cra.sClasseDoc)

  fgGermes.Rows = MAXLIGNERES + 1
  fgGermes.Enabled = True
  fgGermes.HighLight = flexHighlightNever
  
  btnAjouteGerme.Enabled = True
  btnEnl�veGerme.Enabled = True
  btnModifieGerme.Enabled = True
  
  btnAjouteBo�te.Enabled = True
  
  Dim g As GermeRecherch�
  Dim l As Integer
  l = 1
  For Each g In cra.cGermes

    fgGermes.TextMatrix(l, 0) = g.iGerme & ":" & g.cStatus & g.sAbr�g�Labo
    fgGermes.TextMatrix(l, 1) = g.sM�thode
    fgGermes.TextMatrix(l, 2) = g.sUnit�
    fgGermes.TextMatrix(l, 3) = sFormateR�sultat(g.m)
    fgGermes.TextMatrix(l, 4) = sFormateR�sultat(g.s)
    
    AfficheR�sultats l, g
    
    ' Fond rouge pour les germes sans bo�te
    If g.cBo�tes.Count = 0 Then
      fgGermes.Row = l
      ChangeCouleurGerme RGB(255, 200, 200)   ' Rouge
    End If

    l = l + 1
  Next
  
  ' Les deux bocs suivants �taient en commentaire
  ' --> 1er germe s�lectionn� sans affichage des bo�tes...
  ' Remis en service le 5/2/00 PV
  
  ' On remet la s�lection sur la premi�re ligne
  fgGermes.Row = 0
  fgGermes.col = 0
  fgGermes.ColSel = 4
  fgGermes.HighLight = flexHighlightAlways
  
  ' On affiche les bo�tes
  fgBo�tes.Enabled = True
  fgBo�tes.HighLight = flexHighlightAlways
  fgGermes_SelChange
  
  AfficheModeGermes
End Sub


Private Sub btnLireGermes_GotFocus()
  SetLib sbStatus, "SimpleText", "RAbtnLG.tag"
  'sbStatus.SimpleText = "Cliquez sur ce bouton pour g�n�rer la liste des germes et des bo�tes."
End Sub


Private Function bLireGermes() As Boolean
  Dim iVerCrit As Integer
  
  If txtVerCrit = "" Then
    iVerCrit = 0
  Else
    iVerCrit = CInt(txtVerCrit)
  End If
  
  Dim sMM1 As String
  sMM1 = cboMM�thode
  
  Dim cr As RA
  Set cr = LireCrit�reDilutions(txtCrit�re, iVerCrit, sMM1, txtOptionsLabo)
  
  If Not cr Is Nothing Then
    bLireGermes = True
    
    ' On copie la liste des germes et des dilutions de la structure cr dans la
    ' structure cra
    Set cra.cGermes = Nothing
    Set cra.cGermes = cr.cGermes
    cra.hVerCrit = cr.hVerCrit
    cra.sTitreCrit�re = cr.sTitreCrit�re
    cra.iRevivification = cr.iRevivification
    cra.hCl�2 = cr.hCl�2
    If txtCrit�re <> "W6" Then
      cra.sClasseDoc = cr.sClasseDoc
    End If
    
    cra.cStatusModif = "N"            ' Crit�re original
    AfficheStatusModif

    ' Fusion des options du crit�re dans optionslabo
    ' Uniquement si le crit�re a chang�, de fa�on � �viter les conflits de double modification
    ' sur les options manuelles / issues du crit�re, comme l'option D
    Static sCacheCrit�re As String
    If txtCrit�re <> sCacheCrit�re Then
      sCacheCrit�re = txtCrit�re
      Dim sOptions As String
      sOptions = txtOptionsLabo       ' On part de ce qui est affich� -- v�rifier si c'est toujours Ok
      RetireLettres sOptions, "DRN"
      AjouteLettres sOptions, cr.sOptionsLabo
      cra.sOptionsLabo = sOptions
      txtOptionsLabo = sOptions
    End If
    
    cra.iModeGermes = cr.iModeGermes
    If cra.iModeBo�tes <> mbProbl�me Then
      cra.iModeBo�tes = mbModifi�
      AfficheModeBo�tes
    Else
      ' En cas de probl�me sur la liste des bo�tes, on efface la liste des bo�tes
      Dim g As GermeRecherch�
      For Each g In cra.cGermes
        Set g.cBo�tes = Nothing
      Next
    End If
    
    ' Mise � jour de l'affichage
    AfficheGermes
    txtVerCrit = cr.hVerCrit
    txtTitreCrit�re = cr.sTitreCrit�re
    txtRevivification = cr.iRevivification
    If txtCrit�re <> "W6" Then
      bdcClasseDoc = cr.sClasseDoc
    End If
    
    ' Quelques automatismes sp�ciaux (PV 13/1/01)
    ' Huiles
    If StrComp(cr.sClasseDoc, "Hu", vbTextCompare) = 0 Then
      If txtTrait�Par = "" Then cra.iTrait�Par = 1: txtTrait�Par = "1"
    End If
    If StrComp(cr.sClasseDoc, "Ch", vbTextCompare) = 0 Then
      If txtTrait�Par = "" Then cra.iTrait�Par = 2: txtTrait�Par = "2"
    End If
    If StrComp(cr.sClasseDoc, "BM", vbTextCompare) = 0 Then
      If txtTrait�Par = "" Then cra.iTrait�Par = 3: txtTrait�Par = "3"
    End If
    
    
    fgBo�tes.Enabled = True
    btnLireGermes.Enabled = False
  Else
    bLireGermes = False
  End If

End Function


Private Sub btnLireGermes_Click()
  ' Contr�les �l�mentaires
  If txtCrit�re = "" Then
    MsgBox2i "CR223"
    'MsgBox "Saisissez le crit�re !", vbExclamation, sNomApp
    Exit Sub
  End If
  If cboMM�thode = "" Then
    MsgBox2i "CR224"
    'MsgBox "Saisissez la m�tam�thode !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  ' On d�sactive le bouton de lecture des germes pour �viter une lecture pendant la recherche
  btnLireGermes.Visible = False
    
  ' Par s�curit�, on d�sactive les contr�les qui ont pour effet d'invalider la liste des germes
  txtCrit�re.Locked = True  ' Pas enabled pour ne pas emp�cher l'arriv�e du focus !
  cboMM�thode.Enabled = False
  txtOptionsLabo.Enabled = False
  
  If Not bLireGermes Then
    MsgBox2i "CR225"
    'MsgBox "�chec � la lecture du crit�re !", vbExclamation, sNomApp
  End If
  
  ' On r�active les contr�les "� risque"
  btnLireGermes.Visible = True
  txtCrit�re.Locked = False
  cboMM�thode.Enabled = True
  txtOptionsLabo.Enabled = True
End Sub


' ===============================================================
' Crit�re

Private Sub txtCrit�re_Change()
  If bModeChargement Then Exit Sub
  
  InvalideGermes
  
  ' On convertit en majuscules
  If txtCrit�re <> UCase(txtCrit�re) Then
    Dim sStart As Integer, sLength As Integer
    sStart = txtCrit�re.SelStart
    sLength = txtCrit�re.SelLength
    txtCrit�re = UCase(txtCrit�re)
    txtCrit�re.SelStart = sStart
    txtCrit�re.SelLength = sLength
  End If
  
  ' Petite verrue pour le crit�re TIAC, on impose la m�thode AFNOR
  If txtCrit�re = "TIAC" Then cboMM�thode = "A"
  
  If txtCrit�re = "W8" Or txtCrit�re = "W9" Or txtCrit�re = "W11" Or txtCrit�re = "W12" Or txtCrit�re = "W20" Or txtCrit�re = "W21" Or txtCrit�re = "W22" Then
    If InStr(txtOptionsEdition, "L") = 0 Then txtOptionsEdition = txtOptionsEdition & "L"
  Else
    Dim p As Integer
    p = InStr(txtOptionsEdition, "L")
    If p <> 0 Then txtOptionsEdition = Left(txtOptionsEdition, p - 1) & Mid(txtOptionsEdition, p + 1)
  End If
End Sub


Private Sub txtCrit�re_GotFocus()
  AutoSelect txtCrit�re
  SetLib sbStatus, "SimpleText", "RAtxtCrit�re.tag"
  'sbStatus.SimpleText = "Entrez le crit�re d'analyse requis."
End Sub

Private Function bCheckCrit�re(bMessage As Boolean) As Boolean
  If txtCrit�re = "" Then
    If bMessage Then
      Focus txtCrit�re
      MsgBox2i "CR226"
      'MsgBox "Le crit�re est obligatoire.", vbExclamation, sNomApp
    End If
    bCheckCrit�re = False
    Exit Function
  End If
  
  If cra.iModeGermes = mgNonLu Then
    If Not bLireGermes Then
      If bMessage Then
        Focus txtCrit�re
        MsgBox2i "CO005", txtCrit�re
        'MsgBox "Crit�re inexistant.", vbExclamation, sNomApp
        txtCrit�re.SetFocus
      End If
      bCheckCrit�re = False
      Exit Function
    End If
    
  End If
  
  ' Mise � jour de la structure de donn�es
  cra.sCrit�re = txtCrit�re
  
  ' Avertissement Listeria�
  If InStr(cra.sOptionsEdition, "L") <> 0 And txtCrit�re <> "W8" And txtCrit�re <> "W9" And txtCrit�re <> "W11" And txtCrit�re <> "W12" And txtCrit�re <> "W20" And txtCrit�re <> "W21" And txtCrit�re <> "W22" Then
    If bMessage Then
      MsgBox2i "CR228"
      'MsgBox "Avertissement: L'option d'�dition L (List�ria) est s�lectionn�e, alors que le crit�re n'est ni W8, ni W9, ni W11, ni W12, ni W20, ni W21, ni W22. V�rifiez que c'est normal.", vbInformation, sNomApp
    End If
  End If
  
  bCheckCrit�re = True
End Function

Private Sub txtCrit�re_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtCrit�re.Locked = False Then MsgBox2i "CR153"
                                                                        'MsgBox "Perdu !  Il n'y a pas de m�canisme de recherche de crit�re !" & vbCrLf & "Il va falloir saisir le crit�re �� la main��", vbExclamation, sNomApp
  If KeyCode = vbKeyF5 And Shift = 0 And txtCrit�re.Locked = False Then txtCrit�re = craF5.sCrit�re
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
      'Classe invalide, choisissez un �l�ment de la liste.
    End If
    Exit Function
  End If
  
  If StrComp(bdcClasseDoc, "Ch", vbTextCompare) = 0 And cSyst�meCA Like "[CTH]" Then
    If bMessage Then
      bCheckClasseDoc = False
      Focus bdcClasseDoc
      MsgBox2i "CR229y"
      'Pas de labo de chimie sur Cergy, Roanne, La Rochelle: La classe de document Ch est invalide.
    End If
    Exit Function
  End If
  
  ' Mise � jour de la structure de donn�es
  cra.sClasseDoc = bdcClasseDoc

  bCheckClasseDoc = True
End Function

Private Sub bdcClasseDoc_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And bdcClasseDoc.Locked = False Then
    bdcClasseDoc = craF5.sClasseDoc
  End If
End Sub


' ===============================================================
' M�thode d'analyse

Private Sub cboMM�thode_GotFocus()
  SetLib sbStatus, "SimpleText", "RAtxtMM.tag"
  'sbStatus.SimpleText = "Entrez la m�thode d'analyse, F4 pour ouvrir la liste."
End Sub

Private Sub cboMM�thode_LostFocus()
  cboMM�thode.Synchronise
End Sub

' Souris
Private Sub cboMM�thode_Click()
  If bModeChargement Then Exit Sub
  InvalideGermes
End Sub

' Clavier
Private Sub cboMM�thode_Change()
  If bModeChargement Then Exit Sub
  InvalideGermes
End Sub

Private Function bCheckMM�thode(bMessage As Boolean) As Boolean
  If cboMM�thode = "" Or cboMM�thode < "A" Or cboMM�thode > "Z" Then
    If bMessage Then
      bCheckMM�thode = False
      Focus cboMM�thode
      MsgBox2i "CR229"
      'MsgBox "La m�ta-m�thode est obligatoire.", vbExclamation, sNomApp
    End If
    Exit Function
  End If
  
  ' Mise � jour de la structure de donn�es
  cra.cMM�thode = cboMM�thode

  bCheckMM�thode = True
End Function

Private Sub cboMM�thode_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And cboMM�thode.Locked = False Then
    cboMM�thode = craF5.cMM�thode
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
  If KeyCode = vbKeyF4 And Shift = 1 And cra.iMode = meModificationSp�ciale Then SaisieOptionsLabo
End Sub

Private Sub txtOptionsLabo_DblClick()
  If txtOptionsLabo.Locked = False Then SaisieOptionsLabo
End Sub

Private Sub txtOptionsLabo_GotFocus()
  AutoSelect txtOptionsLabo
  SetLib sbStatus, "SimpleText", "RAtxtOptL.tag"
  'sbStatus.SimpleText = "Entrez les options du labo (options d'analyse), F4 pour le d�tail."
End Sub

Private Sub txtOptionsLabo_Change()
  Static sOldOptions As String
  
  If bModeChargement Or cra.iModeGermes = mgNonLu Then
    sOldOptions = txtOptionsLabo
    Exit Sub
  End If
  
  ' Les changements d'options U, S et C n�cessitent une relecture du crit�re
  If Sgn(InStr(sOldOptions, "U")) <> Sgn(InStr(txtOptionsLabo, "U")) Or Sgn(InStr(sOldOptions, "S")) <> Sgn(InStr(txtOptionsLabo, "S")) Or Sgn(InStr(sOldOptions, "C")) <> Sgn(InStr(txtOptionsLabo, "C")) Then
    Dim iR�ponse As VbMsgBoxResult
    Dim sMsg As String
    sMsg = sGetIntlLib("CR230", "Question 230")
    iR�ponse = MsgBox(sMsg, vbQuestion + vbYesNo, sNomApp)
    'iR�ponse = MsgBox("Attention, vous avez modifi� une des options U, S ou C. Cela entra�nera une relecture du crit�re, et la perte des modifications manuelles qui ont �ventuellement �t� apport�es � la liste des germes et/ou des bo�tes." & vbCrLf & vbCrLf & _
      "Voulez-vous continuer ?", vbQuestion + vbYesNo, sNomApp)
    If iR�ponse = vbNo Then
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
  ' Mise � jour de la structure de donn�es
  cra.sOptionsLabo = txtOptionsLabo
  
  If InStr(cra.sOptionsLabo, "N") <> 0 And IsNull(cra.dTemp) Then
    MsgBox2i "CR231"
    'MsgBox "Avertissement: L'option de crit�re N (� revivifier pour les �chantillons de temp�rature inf�rieure ou �gale � -10�C) est positionn�e, mais la temp�rature produit n'est pas d�finie." & vbCrLf & vbCrLf & _
      "Pr�venez le labo, afin qu'il d�termine si l'�chantillon doit �tre revivifi� ou non, faute de quoi, l'�chantillon pourra ne pas �tre trait� correctement.", vbInformation, sNomApp
  End If
  
  bCheckOptionsLabo = True
End Function

' ===============================================================
' Case � cocher IE

Private Sub chkIE_GotFocus()
  SetLib sbStatus, "SimpleText", "RAtxtchkIE.tag"
  'sbStatus.SimpleText = "Cocher dans le cas d'une IE."
End Sub

Private Function bCheckIE(bMessage As Boolean) As Boolean
  ' Mise � jour de la structure de donn�es
  cra.bIE = IIf(chkIE = vbChecked, True, False)
  
  ' On v�rifie la coh�rence avec le cadre de pr�l�vement
  ' C'est peut-�tre un test � assouplir (possibilit� de passer outre)
  If cra.bIE And cra.hCadrePr�l <> 3 Then
    MsgBox2i "CR232"
    'MsgBox "Attention ! Le cadre de pr�l�vement s�lectionn� n'est pas de type intervention exceptionnelle, alors que la case IE est coch�e�" & vbCrLf & vbCrLf & "V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
  End If
  
  If Not cra.bIE And cra.hCadrePr�l = 3 Then
    MsgBox2i "CR233"
    'MsgBox "Attention ! Le cadre de pr�l�vement s�lectionn� est de type intervention exceptionnelle, alors que la case IE n'est pas coch�e�" & vbCrLf & vbCrLf & "V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
  End If

  bCheckIE = True
End Function

Private Sub chkIE_Click()
  SetDirty
End Sub


' ===============================================================
' Case � cocher Fax

Private Sub chkFax_GotFocus()
  SetLib sbStatus, "SimpleText", "RAtxtchkFax.tag"
  'sbStatus.SimpleText = "Cocher quand les r�sultats doivent �tre transmis par fax."
End Sub

Private Function bCheckFax(bMessage As Boolean) As Boolean
  ' Mise � jour de la structure de donn�es
  cra.bFax = IIf(chkFax = vbChecked, True, False)
  
  bCheckFax = True
End Function

Private Sub chkFax_Click()
  SetDirty
End Sub


' ===============================================================
' Case � cocher �chantillon congel�

Private Sub chkCongel�_GotFocus()
  SetLib sbStatus, "SimpleText", "RAtxtchkCong.tag"
  'sbStatus.SimpleText = "Cocher si l'�chantillon est congel�."
End Sub

Private Function bCheckCongel�(bMessage As Boolean) As Boolean
  ' Mise � jour de la structure de donn�es
  cra.bEchCongel� = IIf(chkCongel�, True, False)
  
  bCheckCongel� = True
End Function

Private Sub chkCongel�_Click()
  SetDirty
End Sub



' ===============================================================
' Remarques labo

Private Sub txtRemarquesLabo_GotFocus()
  AutoSelect txtRemarquesLabo
  SetLib sbStatus, "SimpleText", "RAtxtRemL.tag"
  'sbStatus.SimpleText = "Entrez un commentaire libre. Le texte qui suit un ! est imprim� sur l'exemplaire client."
End Sub

Private Function bCheckRemarquesLabo(bMessage As Boolean) As Boolean
  ' Mise � jour de la structure de donn�es
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
' Prix sp�cifique

Private Sub txtPrixSp�cifique_GotFocus()
  AutoSelect txtPrixSp�cifique
  SetLib sbStatus, "SimpleText", "RAtxtPrix.tag"
End Sub

Private Function bCheckPrixSp�cifique(bMessage As Boolean) As Boolean
  If txtPrixSp�cifique <> "" Then
    If Not IsNumeric(txtPrixSp�cifique) Then
      If bMessage Then
        bCheckPrixSp�cifique = False
        Focus txtPrixSp�cifique
        MsgBox2i "CR163P"
      End If
      Exit Function
    End If
  End If
  
  ' Mise � jour de la structure de donn�es
  If txtPrixSp�cifique = "" Then
    cra.dPrix = Null
  Else
    cra.dPrix = CSng(txtPrixSp�cifique)
  End If
  
  bCheckPrixSp�cifique = True
End Function

Private Sub txtPrixSp�cifique_Change()
  SetDirty
End Sub

Private Sub txtPrixSp�cifique_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtPrixSp�cifique.Locked = False Then txtPrixSp�cifique = NV(craF5.dPrix)
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
  ' On r�le si prix sans devise, devise sans prix, ou devise inconnue
  If bdcDevise.ListIndex < 0 Then bdcDevise.Synchronise
  If (IsNull(cra.dPrix) And bdcDevise.ListIndex <> 0) Or bdcDevise.ListIndex < 0 Or ((Not IsNull(cra.dPrix)) And bdcDevise.ListIndex = 0) Then
    If bMessage Then
      bCheckDevise = False
      Focus bdcDevise
      MsgBox2i "CR163P"
    End If
    Exit Function
  End If
  
  ' Mise � jour de la structure de donn�es
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
' Trait� par

Private Sub txtTrait�Par_GotFocus()
  AutoSelect txtTrait�Par
  SetLib sbStatus, "SimpleText", "RAtxtTraPar.tag"
  'sbStatus.SimpleText = "Entrez le code de traitement d'�chantillon. 1 indique que l'�chantillon n'est pas analys�."
End Sub

Private Function bCheckTrait�Par(bMessage As Boolean) As Boolean
  If txtTrait�Par <> "" And txtTrait�Par <> "1" And txtTrait�Par <> "2" And txtTrait�Par <> "3" Then
    MsgBox2i "CR234"
    'MsgBox "Les seules valeurs permises dans le champ trait�par sont 1 et vide.", vbExclamation, sNomApp
    bCheckTrait�Par = False
    Exit Function
  End If
  
  If (InStr(cra.sOptionsEdition, "T") <> 0 Or InStr(cra.sOptionsLabo, "T") <> 0) And txtTrait�Par <> "1" Then
    MsgBox2i "CR235"
    'MsgBox "Probl�me de coh�rence: l'option T (trait� par le SL) est positionn�e dans les options labo ou les options d'�dition, mais le champ Trait� par est vide, ce qui indique que l'analyse est trait�e par le labo�", vbExclamation, sNomApp
    bCheckTrait�Par = False
    Exit Function
  End If
  
  ' Mise � jour de la structure de donn�es
  cra.iTrait�Par = VN(txtTrait�Par)
  
  bCheckTrait�Par = True
End Function

Private Sub txtTrait�Par_Change()
  SetDirty
End Sub

Private Sub txtTrait�Par_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF5 And Shift = 0 And txtTrait�Par.Locked = False Then txtTrait�Par = NV(craF5.iTrait�Par)
End Sub


' ===============================================================
' Date de d�but d'analyse pr�vue

Private Sub txtDateDebAnPr�vue_GotFocus()
  AutoSelect txtDateDebAnPr�vue
  SetLib sbStatus, "SimpleText", "RAtxtDDAP.tag"
  'sbStatus.SimpleText = "Entrez la date d'analyse pr�vue, en principe le jour m�me, ou la DLC pour les analyses � la DLC."
End Sub

Private Sub txtDateDebAnPr�vue_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtDateDebAnPr�vue.Locked = False Then calendrier txtDateDebAnPr�vue
  If KeyCode = vbKeyF5 And Shift = 0 And txtDateDebAnPr�vue.Locked = False Then txtDateDebAnPr�vue.DateSaisie = NV(craF5.dDateDebAnPr�vue)
End Sub

Private Sub txtDateDebAnPr�vue_DblClick()
  If Not txtDateDebAnPr�vue.Locked Then calendrier txtDateDebAnPr�vue
End Sub

Private Sub txtDateDebAnPr�vue_Change()
  SetDirty
End Sub

Private Function bCheckDateDebAnPr�vue(bMessage As Boolean) As Boolean
  If txtDateDebAnPr�vue.DateSaisie = "" Then
    If bMessage Then
      Focus txtDateDebAnPr�vue, "Analyse"
      MsgBox2i "CR236"
      'MsgBox "La date de d�but d'analyse pr�vue est obligatoire.", vbExclamation, sNomApp
    End If
    bCheckDateDebAnPr�vue = False
    Exit Function
  End If

  Dim d
  bCheckDateDebAnPr�vue = bCheckDate("Analyse", txtDateDebAnPr�vue, d, "Date de d�but d'analyse pr�vue", bMessage)
  If IsEmpty(d) Then Exit Function      ' Date invalide

  If IsDate(d) Then
    If d = dAbsence Then
      If bMessage Then
        Focus txtDateDebAnPr�vue, "Analyse"
        MsgBox2i "CR237"
        'MsgBox "�ABSENCE� est une date de d�but d'analyse pr�vue invalide.", vbExclamation, sNomApp
      End If
      bCheckDateDebAnPr�vue = False
      Exit Function
    End If
    
    If Weekday(d) = vbSunday Then
      If bMessage Then
        MsgBox2i "CR238"
        'MsgBox "Avertissement: La date de d�but d'analyse pr�vue tombe un dimanche. V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
      End If
    End If
    
    ' Test d�bray� pour La Rochelle
    If Weekday(d) = vbMonday And cSyst�meCA <> "T" And cSyst�meCA <> "C" Then
      If bMessage Then
        MsgBox2i "CR239"
        'MsgBox "Avertissement: La date de d�but d'analyse pr�vue tombe un lundi. V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
      End If
    End If
    
    Dim sF�te As String
    If IsJourF�ri�(d, sF�te) Then
      If bMessage Then
        MsgBox2i "CR240", sF�te
        'MsgBox "Avertissement: La date de d�but d'analyse pr�vue tombe un jour f�ri� (" & sF�te & "). V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
      End If
    End If
  End If
  
  cra.dDateDebAnPr�vue = d
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
    'MsgBox "Probl�me: RA sans aucun germe !", vbExclamation, sNomApp
    bCheckGermes = False
    Exit Function
  End If
  
  ' On signale s'il y a un germe sans bo�tes
  Dim g As GermeRecherch�
  Dim bGermeSansBo�tes As Boolean
  bGermeSansBo�tes = False
  For Each g In cra.cGermes
    If g.cBo�tes.Count = 0 Then
      bGermeSansBo�tes = True
      Exit For
    End If
  Next
  
  If bGermeSansBo�tes And InStr(cra.sOptionsLabo, "D") = 0 Then
    MsgBox2i "CR242"
    'MsgBox "Avertissement: Le RA contient des germes sans bo�tes (germes affich�s sur fond rouge)." & vbCrLf & "Assurez-vous que c'est voulu, sinon le labo n'aura ni bo�tes ni �tiquettes pour ce germe.", vbInformation, sNomApp
    D�monJournalUnix "Contr�leCRA", "Avertissement", "RA avec germes sans bo�tes Ref=" & cra.sRef
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
  
  fgBo�tes.Rows = 1
  fgBo�tes.HighLight = flexHighlightNever
  btnEnl�veBo�te.Enabled = False
  btnModifieBo�te.Enabled = False
  
  If fgGermes.Row = 0 Or fgGermes.TextMatrix(fgGermes.Row, 0) = "" Then
    btnAjouteBo�te.Enabled = False
    fgBo�tes.Enabled = False
  Else
    fgBo�tes.Rows = 1 + cra.cGermes(fgGermes.Row).cBo�tes.Count
  
    Dim b As Bo�te, g As GermeRecherch�
    Set g = cra.cGermes(fgGermes.Row)
    Dim i As Integer
    i = 1
    For Each b In g.cBo�tes
      AfficheBo�te i, b
      i = i + 1
    Next
    btnAjouteBo�te.Enabled = True
    fgBo�tes.Enabled = True
    
    ' 0 ou 1 ligne dans le flexgrid + PgPrec --> espace de pile insuffisant !
    If fgBo�tes.Rows < 3 Then fgBo�tes.Rows = 3
  End If
End Sub


Private Sub btnEnl�veGerme_Click()
  If fgGermes.TextMatrix(fgGermes.Row, 0) <> "" Then
    cra.cGermes.Remove fgGermes.Row
    fgGermes.RemoveItem fgGermes.Row
    fgGermes.Rows = MAXLIGNERES + 1
    fgGermes_SelChange
    
    fgR�sultat.RemoveItem fgGermes.Row
    fgR�sultat.Rows = MAXLIGNERES + 1

    ' Mise � jour et affichage du mode en m�moire
    cra.cStatusModif = "O"              ' Crit�re modifi�
    AfficheStatusModif
    
    cra.iModeGermes = mgModifi�
    AfficheModeGermes
    If cra.iModeBo�tes = mbLu Then
      cra.iModeBo�tes = mbModifi�
      AfficheModeBo�tes
    End If
    SetDirty
  End If
End Sub


Private Sub ModifieGerme()
  If bBlocageEnCours Then Beep: Exit Sub
  
  ' Cas de la ligne vide
  If fgGermes.TextMatrix(fgGermes.Row, 0) = "" Then Exit Sub
  
  Dim sMM1 As String
  sMM1 = cboMM�thode
  
  Dim g As GermeRecherch�
  Set g = frmAjoutGerme.Modifie(sMM1, cra.cGermes(fgGermes.Row))
  If Not g Is Nothing Then
    cra.cGermes(fgGermes.Row).sUnit� = g.sUnit�
    cra.cGermes(fgGermes.Row).m = g.m
    cra.cGermes(fgGermes.Row).s = g.s
    cra.cGermes(fgGermes.Row).sSensibilit� = g.sSensibilit�
    cra.cGermes(fgGermes.Row).dPrix = g.dPrix
    cra.cGermes(fgGermes.Row).cDevise = g.cDevise
    
    ' On met � jour l'affichage de la liste des germes
    fgGermes.TextMatrix(fgGermes.Row, 2) = g.sUnit�
    fgGermes.TextMatrix(fgGermes.Row, 3) = g.m
    fgGermes.TextMatrix(fgGermes.Row, 4) = g.s
    
    ' Si germe 7 (salmonelles), on reporte l'unit� en tant que l�gende des bo�tes
    If Abs(g.iGerme) = 7 Then
      Dim b As Bo�te
      For Each b In cra.cGermes(fgGermes.Row).cBo�tes
        b.boi_legende = g.sUnit�
      Next
      fgGermes_SelChange    ' R�affiche la liste des bo�tes
    End If
    
    ' On met � jour l'affichage du r�sultat
    fgR�sultat.TextMatrix(fgGermes.Row, 1) = sFormateR�sultat(g.sR�sultat)
    
    ' Mise � jour et affichage du mode en m�moire
    cra.cStatusModif = "O"              ' Crit�re modifi�
    AfficheStatusModif
    
    cra.iModeGermes = mgModifi�
    cra.cGermes(fgGermes.Row).bGermeModifi� = True
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

  Dim g As GermeRecherch�
  Dim sMM1 As String
  sMM1 = cboMM�thode

  Set g = frmAjoutGerme.Ajout(sMM1)
  If Not g Is Nothing Then
    Dim i As Integer
    For i = 1 To iRang - 1
      If Val(fgGermes.TextMatrix(i, 0)) = g.iGerme Then
        MsgBox2i "CR244", g.iGerme
        'MsgBox "Le germe " & g.iGerme & " est d�j� pr�sent dans la liste !", vbExclamation, sNomApp
        Exit Sub
      End If
    Next
    
    ' On l'ajoute � la collection
    cra.cGermes.AddGermeRecherch� g
    
    ' On met � jour l'affichage
    fgGermes.TextMatrix(iRang, 0) = g.iGerme & ":" & g.cStatus & g.sAbr�g�Labo
    fgGermes.TextMatrix(iRang, 1) = g.sM�thode
    fgGermes.TextMatrix(iRang, 2) = g.sUnit�
    fgGermes.TextMatrix(iRang, 3) = g.m
    fgGermes.TextMatrix(iRang, 4) = g.s
    
    ' On met � jour les r�sultats
    AfficheR�sultats iRang, g
    
    ' Si n�cessaire, on r�affiche la liste des bo�tes
    If iRang = fgGermes.Row Then fgGermes_SelChange
    
    ' Mise � jour et affichage du mode en m�moire
    cra.cStatusModif = "O"              ' Crit�re modifi�
    AfficheStatusModif
    
    cra.iModeGermes = mgModifi�
    AfficheModeGermes
    If cra.iModeBo�tes = mbLu Then
      cra.iModeBo�tes = mbModifi�
      AfficheModeBo�tes
    End If
    SetDirty
  End If
  
End Sub

Private Sub fgGermes_DblClick()
  If btnModifieGerme.Enabled And btnModifieGerme.Visible Then
    ModifieGerme
  Else
    If cra.iMode = meModificationR�duite And bShiftPressed Then ModifieGerme
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
 
Private Sub btnEnl�veGerme_GotFocus()
  sbStatus.SimpleText = ""
End Sub

Private Sub btnModifieGerme_GotFocus()
  sbStatus.SimpleText = ""
End Sub



' ===============================================================
' Liste des bo�tes

Private Function bCheckBo�tes(bMessage As Boolean) As Boolean
  ' Si la liste des bo�tes est vide on v�rifie que l'option D est positionn�e
  ' On ne tient pas compte du champ Trait�Par
  ' Si les donn�es sont incoh�rentes, on n'exige pas l'option D.
  
  Dim g As GermeRecherch�
  Dim iNbBo�tes As Integer
  For Each g In cra.cGermes
    iNbBo�tes = iNbBo�tes + g.cBo�tes.Count
  Next
  If iNbBo�tes = 0 And InStr(cra.sOptionsLabo, "D") = 0 And cra.iModeBo�tes <> mbProbl�me Then
    Dim iRep As VbMsgBoxResult
    Dim sMsg As String
    sMsg = sGetIntlLib("CR245", "Question 245")
    iRep = MsgBox(sMsg, vbQuestion + vbYesNo + vbDefaultButton2, sNomApp)
    'iRep = MsgBox("Pas de bo�tes, et l'option labo D n'est pas positionn�e !" & vbCrLf & vbCrLf & "Voulez-vous continuer ?", vbQuestion + vbYesNo + vbDefaultButton2, sNomApp)
    If iRep = vbNo Then
      bCheckBo�tes = False
      Exit Function
    End If
  End If
  
  bCheckBo�tes = True
End Function


Private Sub fgBo�tes_GotFocus()
  sbStatus.SimpleText = ""
  fgBo�tes.HighLight = flexHighlightAlways
  btnEnl�veBo�te.Enabled = True
  btnModifieBo�te.Enabled = True
  fgBo�tes.BackColorSel = &H8000000D
End Sub

Private Sub fgBo�tes_LostFocus()
  fgBo�tes.BackColorSel = &H808080
End Sub

Private Sub fgBo�tes_SelChange()
  fgBo�tes.RowSel = fgBo�tes.Row
End Sub

Private Sub btnEnl�veBo�te_Click()
  If fgBo�tes.Rows > 1 Then
    ' Protection ligne vide
    If fgBo�tes.TextMatrix(fgBo�tes.Row, 0) <> "" Then
      cra.cGermes(fgGermes.Row).cBo�tes.Remove fgBo�tes.Row
      cra.cGermes(fgGermes.Row).bGermeModifi� = True
      If fgBo�tes.Rows = 2 Then
        fgBo�tes.Rows = 1
        fgBo�tes.HighLight = flexHighlightNever
        btnEnl�veBo�te.Enabled = False
        btnModifieBo�te.Enabled = False
      Else
        fgBo�tes.RemoveItem fgBo�tes.Row
        ' 1 ligne dans le flexgrid + PgPrec --> espace de pile insuffisant !
        If fgBo�tes.Rows = 2 Then fgBo�tes.Rows = 3
      End If
    End If
    
    ' Mise � jour de l'affichage
    If cra.cGermes(fgGermes.Row).cBo�tes.Count = 0 Then
      ChangeCouleurGerme RGB(255, 200, 200)   ' Rouge
    End If
    MajAffichageGerme fgGermes.Row
   
    ' On met � jour l'indicateur d'�tat
    cra.cStatusModif = "O"              ' Crit�re modifi�
    AfficheStatusModif
    
    cra.iModeBo�tes = mbModifi�
    AfficheModeBo�tes
    SetDirty
  End If
End Sub

Private Sub btnAjouteBo�te_Click()
  Dim b As Bo�te

  ' Milieu par d�faut: le  m�me que pour la premi�re bo�te si elle existe
  Dim iMilieuD�faut As Integer
  If cra.cGermes(fgGermes.Row).cBo�tes.Count > 0 Then
    iMilieuD�faut = cra.cGermes(fgGermes.Row).cBo�tes(1).boi_milieu
  Else
    iMilieuD�faut = 0
  End If
  
  Set b = frmAjoutBo�te.Ajout(iMilieuD�faut, cra.cGermes(fgGermes.Row))
  If Not b Is Nothing Then

    ' On l'ajoute � la collection
    cra.cGermes(fgGermes.Row).cBo�tes.AddBo�te b
    cra.cGermes(fgGermes.Row).bGermeModifi� = True
    
    ' Si c'est la premi�re bo�te, le germe peut redevenir de couleur normale
    If cra.cGermes(fgGermes.Row).cBo�tes.Count = 1 Then
      ChangeCouleurGerme 0    ' Couleur par d�faut
    End If
    
    fgBo�tes.Rows = cra.cGermes(fgGermes.Row).cBo�tes.Count + 1
    ' 1 ligne dans le flexgrid + PgPrec --> espace de pile insuffisant !
    If fgBo�tes.Rows < 3 Then fgBo�tes.Rows = 3

    ' On met � jour l'affichage
    AfficheBo�te cra.cGermes(fgGermes.Row).cBo�tes.Count, b
    MajAffichageGerme fgGermes.Row
    
    ' On met � jour l'indicateur d'�tat
    cra.cStatusModif = "O"              ' Crit�re modifi�
    AfficheStatusModif
    
    cra.iModeBo�tes = mbModifi�
    AfficheModeBo�tes
    SetDirty
  End If
End Sub

Private Sub AfficheBo�te(iRow As Integer, b As Bo�te)
  fgBo�tes.TextMatrix(iRow, 0) = b.boi_milieu & ": " & LireMilieu(b.boi_milieu).mil_abrege
  fgBo�tes.TextMatrix(iRow, 1) = b.boi_dilution
  fgBo�tes.TextMatrix(iRow, 2) = NV(b.boi_quantite)
  fgBo�tes.TextMatrix(iRow, 3) = b.boi_facteur
  fgBo�tes.TextMatrix(iRow, 4) = b.boi_numboite
  fgBo�tes.TextMatrix(iRow, 5) = b.boi_typemarquage & " / " & b.boi_typeboite
  fgBo�tes.TextMatrix(iRow, 6) = b.boi_legende
End Sub

Private Sub ModifieBo�te()
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim b As Bo�te, bo As Bo�te
  Dim g As GermeRecherch�
  
  ' Protection ligne vide
  If fgBo�tes.TextMatrix(fgBo�tes.Row, 0) = "" Then Exit Sub
  
  Set g = cra.cGermes(fgGermes.Row)
  Set bo = g.cBo�tes(fgBo�tes.Row)
  Set b = frmAjoutBo�te.Modifie(bo, g, fgBo�tes.Row)
  If Not b Is Nothing Then
    ' On met � jour la bo�te modifi�e
    bo.boi_dilution = b.boi_dilution
    bo.boi_facteur = b.boi_facteur
    bo.boi_legende = b.boi_legende
    bo.boi_milieu = b.boi_milieu
    bo.boi_numboite = b.boi_numboite
    bo.boi_quantite = b.boi_quantite
    bo.boi_typeboite = b.boi_typeboite
    bo.boi_typemarquage = b.boi_typemarquage
    
    ' Flag modifi�
    cra.cGermes(fgGermes.Row).bGermeModifi� = True
  
    ' On met � jour l'affichage
    AfficheBo�te fgBo�tes.Row, b
    MajAffichageGerme fgGermes.Row
    
    ' On met � jour l'indicateur d'�tat
    cra.cStatusModif = "O"              ' Crit�re modifi�
    AfficheStatusModif
    
    cra.iModeBo�tes = mbModifi�
    AfficheModeBo�tes
    SetDirty
  End If
End Sub


Private Sub fgBo�tes_DblClick()
  If btnModifieBo�te.Visible And btnModifieBo�te.Enabled Then ModifieBo�te
End Sub

Private Sub btnModifieBo�te_Click()
  ModifieBo�te
End Sub

' Focus
Private Sub btnEnl�veBo�te_GotFocus()
  sbStatus.SimpleText = ""
End Sub

Private Sub btnAjouteBo�te_GotFocus()
  sbStatus.SimpleText = ""
End Sub

Private Sub btnModifieBo�te_GotFocus()
  sbStatus.SimpleText = ""
End Sub


' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' R�sultats

Private Sub AfficheR�sultats(iLigne As Integer, g As GermeRecherch�)
  fgR�sultat.TextMatrix(iLigne, 0) = sLibell�Germe(g.iGerme) & " " & g.sUnit� & " (" & g.sM�thode & ")"
  fgR�sultat.TextMatrix(iLigne, 1) = sFormateR�sultat(g.sR�sultat)
  fgR�sultat.TextMatrix(iLigne, 2) = sFormateR�sultat(g.m)
  fgR�sultat.TextMatrix(iLigne, 3) = sLibell�CPar(g.iCPar)
  fgR�sultat.TextMatrix(iLigne, 4) = g.cEtatLabo
  
  ' Ombrage des r�sultats non satisfaisants
  fgR�sultat.Row = iLigne
  Dim iCol As Integer
  For iCol = 0 To 4
    fgR�sultat.col = iCol
    If g.iCPar >= 5 Then
      fgR�sultat.CellBackColor = RGB(255, 200, 200)   ' Rouge
    ElseIf g.iCPar >= 3 Then
      fgR�sultat.CellBackColor = RGB(255, 255, 200)   ' Jaune
    Else
      fgR�sultat.CellBackColor = 0                    ' Couleur standard d'apr�s la doc
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


' Active un contr�le en affichant la bonne page si n�cessaire
' On ne peut pas d�clarer "c as Control", �a ne marche pas avec un contr�le utilisateur (ChampDate par exemple)
Private Sub Focus(c, Optional ByVal sPage As String)
  
  If sPage = "" Then
    If c Is txtNumPro Or c Is txtCompl�mentNom Or c Is txtObs Or TypeOf c Is ChampDate Or TypeOf c Is ChampTemp�rature _
      Or c Is txtCodeArticle Or c Is txtCodeFamille Or c Is txtNumLip Or c Is txtNumCdt Or c Is txtNumFab Or c Is txtNumDis Or c Is txtDateDLC Or c Is txtDateDLUO _
      Or c Is txtIdLot Or c Is txtCodeEmballeur Or c Is txtDateRetrait Or c Is txtDLC2 Or c Is txtNumCpr Or c Is txtRefOrigine Or c Is txtCodeFabricant _
      Or c Is txtOptionsEdition Or c Is txtMarque Or c Is txtUV Or c Is txtAspect _
      Or c Is txtNiv�labo Or c Is txt�tatPhy Or c Is txtContenant Or c Is txt�tatDiv Or c Is txtTechFab Or c Is txtSecteurPr�l Or c Is txtCondPr�l Or c Is txtInfo1 Or c Is txtInfo2 _
      Or c Is txtHeurePr�l�vement Or c Is txtHeurePr�paration Or c Is txtIntOp�r _
      Or c Is txtDateR�ception Or c Is txtHeureR�ception Then
      sPage = "T�te"
    ElseIf c Is txtCrit�re Or c Is cboMM�thode Or c Is txtOptionsLabo Or c Is chkIE Or c Is chkFax Or c Is txtRemarquesLabo Or c Is txtPrixSp�cifique Or c Is bdcDevise Or c Is txtTrait�Par Or c Is txtDateDebAnPr�vue Or c Is bdcClasseDoc Then
      sPage = "Analyse"
    Else
      MsgBox2i "CR246", c.Name
      'MsgBox "Contr�le '" & c.Name & "' non pris en charge dans Focus !", vbCritical, sNomApp
      ' On reste sur la  page courante
      sPage = tsTab.SelectedItem
    End If
  End If
  
  ' Si la page courante n'est pas la bonne, on change de page
  If tsTab.SelectedItem.Key <> sPage Then Page sPage
  
  ' On active le contr�le
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

Private Sub PlaceTemp�(iLigne As Integer, iColonne As Integer, t1 As Control, t2 As Control, t3 As Control)
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
  
  ' On retaille le tabstrip�
  tsTab.Move 4, vOff + 55, ScaleWidth - 8, ScaleHeight - vOff - 80
  
  ' Les champs fixes du haut
  lblR�f�rence.Top = 52 + vOff - 42
  txtR�f�rence.Top = 48 + vOff - 42
  chkSaisieValid�e.Top = 52 + vOff - 42
  lblEtablissement.Top = 76 + vOff - 42
  txtNumEtb.Top = 72 + vOff - 41
  txtPr�fixe.Top = 72 + vOff - 42
  txtNomEtb.Top = 72 + vOff - 42
  If ScaleWidth - txtNomEtb.Left - 11 > 0 Then txtNomEtb.Width = ScaleWidth - txtNomEtb.Left - 8
  
  ' Puis les frames contenant les contr�les
  Dim f As Frame
  For Each f In fraFeuille
    f.Move tsTab.ClientLeft + 2, tsTab.ClientTop + 6, tsTab.ClientWidth - 2, tsTab.ClientHeight - 4
  Next
  
  ' Retaille � l'int�rieur des conteneurs
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
  
  ' R�sultats
  txtNomCon.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtNomCon.Left - 80
  
  ' Analyse
  txtTitreCrit�re.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtTitreCrit�re.Left - 80
  txtRemarquesLabo.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtRemarquesLabo.Left - 80
  
  ' Champs roses --> en blanc
  Dim c As Control
  On Error Resume Next
  For Each c In Controls
    If TypeOf c Is TextBox Or TypeOf c Is ChampHeure Then
      If (Not c Is txtSecteurPr�l) And (Not c Is txtIntOp�r) And (Not c Is txtInfo1) And (Not c Is txtInfo2) Then
        If c.BackColor = &HC0E0FF Then c.BackColor = &H80000005
      End If
    End If
  Next
  On Error GoTo 0
  
  ' Retaille des champs du haut
  txtNomPro.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtNomPro.Left - 1250
  txtCrit�reInfo.Left = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtCrit�reInfo.Width - 40
  txtCompl�mentNom.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtCompl�mentNom.Left - 40
  txtObs.Width = tsTab.ClientWidth * Screen.TwipsPerPixelX - txtObs.Left - 40
  
  
  ' Champs de l'onglet t�te
  iTabIndex = lblT�te(3).TabIndex
  
  PlaceLabel 1, 1, lblT�te(3)   ' Date+heure pr�l
  PlaceDate2 1, 1, txtDatePr�l�vement, txtHeurePr�l�vement
  PlaceLabel 2, 1, lblT�te(4)   ' T� prod/amb/r�c.
  PlaceTemp� 2, 1, txtTemp�ratureProduit, txtTemp�ratureAmbiance, txtTemp�ratureR�ception
  PlaceLabel 3, 1, lblT�te(30)  ' Secteur de pr�l�vement
  PlaceNoNom 3, 1, txtSecteurPr�l, txtNomSecteurPr�l
  PlaceLabel 4, 1, lblT�te(26)  ' �tat physique
  PlaceNoNom 4, 1, txt�tatPhy, txtNom�tatPhy
  PlaceLabel 5, 1, lblT�te(33)  ' Int. op�rateur
  PlaceNoNom 5, 1, txtIntOp�r, txtNomIntOp�r
  PlaceLabel 6, 1, lblT�te(18)  ' Cadre de pr�l�v.
  PlaceNoNom 6, 1, txtNumCpr, txtNomCpr
  
  PlaceLabel 1, 2, lblT�te(5)   ' Date pr�paration
  PlaceDate2 1, 2, txtDatePr�paration, txtHeurePr�paration
  PlaceLabel 2, 2, lblT�te(34)  ' Date de d�conditionnement
  PlaceDate2 2, 2, txtDateD�conditionnement
  PlaceLabel 3, 2, lblT�te(7)   ' Lieu de pr�l
  PlaceNoNom 3, 2, txtNumLip, txtNomLip
  PlaceLabel 4, 2, lblT�te(31)  ' Cond. de pr�l.
  PlaceNoNom 4, 2, txtCondPr�l, txtNomCondPr�l
  PlaceLabel 5, 2, lblT�te(8)   ' Conditionnement
  PlaceNoNom 5, 2, txtNumCdt, txtNomCdt
  PlaceLabel 6, 2, lblT�te(27)  ' Contenant
  PlaceNoNom 6, 2, txtContenant, txtNomContenant
  PlaceLabel 7, 2, lblT�te(28)  ' �tat de division
  PlaceNoNom 7, 2, txt�tatDiv, txtNom�tatDiv
  PlaceLabel 8, 2, lblT�te(25)  ' Niv. d'�laboration
  PlaceNoNom 8, 2, txtNiv�labo, txtNomNiv�labo
  PlaceLabel 9, 2, lblT�te(29)  ' Technologie de fab
  PlaceNoNom 9, 2, txtTechFab, txtNomTechFab
  
  PlaceLabel 1, 3, lblT�te(9)   ' Fabricant
  PlaceNoNom 1, 3, txtNumFab, txtNomFab
  PlaceLabel 2, 3, lblT�te(11)  ' Date fab/Date de cond
  PlaceDate2 2, 3, txtDateFabrication, txtDateConditionnement
  PlaceLabel 3, 3, lblT�te(13)  ' Identification lot
  PlaceChamp 3, 3, txtIdLot
  PlaceLabel 4, 3, lblT�te(14) ' DLC / DL&UO
  PlaceDate2 4, 3, txtDateDLC, txtDateDLUO
  PlaceLabel 5, 3, lblT�te(15)  ' Date de retrait
  PlaceDate2 5, 3, txtDLC2, txtDateRetrait
  PlaceLabel 6, 3, lblT�te(6)   ' Code article
  PlaceChamp 6, 3, txtCodeArticle
  PlaceLabel 7, 3, lblT�te(35)   ' Code famille
  PlaceChamp 7, 3, txtCodeFamille
  PlaceLabel 8, 3, lblT�te(21)  ' Marque
  PlaceChamp 8, 3, txtMarque
  PlaceLabel 9, 3, lblT�te(22)  ' Unit� de vente
  PlaceChamp 9, 3, txtUV
  PlaceLabel 10, 3, lblT�te(10)  ' Distributeur
  PlaceNoNom 10, 3, txtNumDis, txtNomDis
  PlaceLabel 11, 3, lblT�te(12)  ' Date livraison
  PlaceDate2 11, 3, txtDateLivraison, txtDateR�ceptionClient
  
  PlaceLabel 7, 1, lblT�te(19)  ' Code fabricant
  PlaceChamp 7, 1, txtCodeFabricant
  PlaceLabel 8, 1, lblT�te(16)  ' Code emballeur
  PlaceChamp 8, 1, txtCodeEmballeur
  PlaceLabel 9, 1, lblT�te(32) ' Info Rab
  PlaceDate2 9, 1, txtInfo1, txtInfo2
  PlaceLabel 10, 1, lblT�te(20) ' Options �dition
  PlaceChamp 10, 1, txtOptionsEdition
  PlaceLabel 11, 1, lblT�te(17) ' R�f�rence ori&gine
  PlaceChamp 11, 1, txtRefOrigine
  
  PlaceLabel 10, 2, lblT�te(24)  ' Aspect �chantillon
  PlaceNoNom 10, 2, txtAspect, txtNomAspect
  PlaceLabel 11, 2, lblT�te(23) ' Date de r&�ception
  PlaceDate2 11, 2, txtDateR�ception, txtHeureR�ception
End Sub


Public Sub AjusterBarreBoutonsRA()
  If bAfficherEtiquettesDeBoutons Then
    
    SetLib tbBoutons.Buttons("Contr�ler"), "Caption", "RAtbContr�ler"
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
  DoEvents    ' Sinon la propri�t� height n'est pas mise � jour !

  ' On masque/affiche la barre de boutons
  If bAfficherBarreDeBoutons And Not tbBoutons.Enabled Then
    lblR�f�rence.Top = lblR�f�rence.Top + tbBoutons.height
    txtR�f�rence.Top = txtR�f�rence.Top + tbBoutons.height
    chkSaisieValid�e.Top = chkSaisieValid�e.Top + tbBoutons.height
    lblEtablissement.Top = lblEtablissement.Top + tbBoutons.height
    txtNumEtb.Top = txtNumEtb.Top + tbBoutons.height
    txtPr�fixe.Top = txtPr�fixe.Top + tbBoutons.height
    txtNomEtb.Top = txtNomEtb.Top + tbBoutons.height
    tsTab.Top = tsTab.Top + tbBoutons.height

    tbBoutons.Visible = True
    tbBoutons.Enabled = True
    Exit Sub
  End If
  
  If Not bAfficherBarreDeBoutons And tbBoutons.Enabled Then
    tbBoutons.Visible = False
    tbBoutons.Enabled = False
    
    lblR�f�rence.Top = lblR�f�rence.Top - tbBoutons.height
    txtR�f�rence.Top = txtR�f�rence.Top - tbBoutons.height
    chkSaisieValid�e.Top = chkSaisieValid�e.Top - tbBoutons.height
    lblEtablissement.Top = lblEtablissement.Top - tbBoutons.height
    txtNumEtb.Top = txtNumEtb.Top - tbBoutons.height
    txtPr�fixe.Top = txtPr�fixe.Top - tbBoutons.height
    txtNomEtb.Top = txtNomEtb.Top - tbBoutons.height
    tsTab.Top = tsTab.Top - tbBoutons.height
  End If

  Cls
  Form_Resize
End Sub



' Change le frame affich�
Private Sub Page(ByVal sPage)
  ' On ne change que l'onglet, ce code appelle automatiquement tsTab_Click
  Set tsTab.SelectedItem = tsTab.Tabs(sPage)
End Sub


Private Sub tsTab_Click()
  ' Utilise le m�canisme visible/invisible comme il est conseill� dans l'aide
  ' et contrairement � la doc qui pr�ne l'usage du ZOrder�
  ' Avantage: (entre autres, voir l'aide) �vite les conflits d'acc�l�rateurs entre pages
  If tsTab.SelectedItem.Index = iCurFrame Then Exit Sub     ' Inutile de changer le cadre.
  ' Sinon, masque l'ancien cadre et affiche le nouveau.
  fraFeuille(tsTab.SelectedItem.Index).Visible = True
  If iCurFrame >= 0 Then fraFeuille(iCurFrame).Visible = False
  ' Affecte la nouvelle valeur � iCurFrame.
  iCurFrame = tsTab.SelectedItem.Index

  ' Accompagnement du focus
  ' �a serait pas mal de m�moriser page par page le contr�le qui a le focus au moment
  ' du changement de focus, de fa�on � restaurer le focus sur ce contr�le
  ' mais il faut traiter le fait que c'est le contr�le tabstop qui prend le focus
  ' quand on clique dessus (pas s�r il me semble, c'est au 2�me clic qu'il prend le focus !!!)
  DoEvents
  Select Case tsTab.SelectedItem.Key
    Case "T�te": txtNumPro.SetFocus
    Case "Analyse": txtCrit�re.SetFocus
    Case "R�sultats": txtNumCon.SetFocus
    Case "Planning": txtDateTourn�e.SetFocus
    Case "Divers": txtTimestamp.SetFocus
    Case Else: Stop
  End Select
  
End Sub


' ===============================================================
' Bouclage du focus sur les diverses pages

Private Sub txtBouclageFocus_GotFocus(Index As Integer)
  Select Case Index
    ' T�te
    Case 0: txtInfo2.SetFocus
    Case 1: txtNumPro.SetFocus
    
    ' Analyse
    Case 2: txtTrait�Par.SetFocus   ' En fait les tableaux de germes, mais c'est pas s�r qu'ils soient actifs�
    Case 3: txtCrit�re.SetFocus
    
    ' R�sultats
    Case 4: txtNumCon.SetFocus
    Case 5: txtNumCon.SetFocus

    ' Planning
    Case 6: txtDateTourn�e.SetFocus
    Case 7: txtDateTourn�e.SetFocus

    ' Divers
    Case 8: txtEtatPH.SetFocus
    Case 9: txtEtatPH.SetFocus
    
    Case Else: Stop
  End Select
End Sub


Private Sub Form_Load()
  Internationalisation
  Dim iNiveau As Integer
  iNiveau = NZ(UtiParNum�ro(iNumOp�rateur).uti_niveau)
  mnuAvanc�.Visible = (iNiveau And 16) <> 0
  
  ' On rend invisibles les pi�ges � focus (le fond est visible sur la feuille pour le d�veloppement)
  Dim ct As TextBox
  For Each ct In txtBouclageFocus
    ct.BackColor = &H8000000F
  Next
  
  ' On remplace les | des libell�s par des retours � la ligne
  Dim l As Label, p As Integer
  For Each l In lblT�te
    p = InStr(l, "|")
    If p <> 0 Then l = Subst(l, "|", vbCrLf)
  Next
  
  ' On ajuste en fonction du nombre max de germes
  fgR�sultat.Rows = MAXLIGNERES + 1
  fgGermes.Rows = MAXLIGNERES + 1
  
  ' Remplissage des combos
  Dim cMM As Integer
  For cMM = Asc("A") To Asc("Z")
    cboMM�thode.AddItem Chr(cMM), sLibell�M�tam�thode(Chr(cMM))
  Next
  
  '$$ A g�n�raliser
  bdcDevise.AddItem "", ""
  bdcDevise.AddItem "F", "Franc"
  bdcDevise.AddItem "E", "Euro"
  
  '$$ A internationaliser
  bdcClasseDoc.AddItem "AB", "Analyse Bact�rio Standard"
  bdcClasseDoc.AddItem "BS", "Bact�rio Sp�ciale"
  bdcClasseDoc.AddItem "FS", "Frottis de surface"
  bdcClasseDoc.AddItem "Li", "List�ria"
  bdcClasseDoc.AddItem "Hu", "Huile"
  bdcClasseDoc.AddItem "Ch", "Chimie"
  bdcClasseDoc.AddItem "CR", "Compte-Rendu g�n�rique (autre)"
  bdcClasseDoc.AddItem "BM", "Biologie Mol�culaire"
'  bdcClasseDoc.AddItem "ES", "ESB (Prionics-Check)"
  bdcClasseDoc.AddItem "AV", "ABVT"
  bdcClasseDoc.AddItem "Le", "l�gionelles"
  
  fgGermes_LostFocus
  
  ' On met les frames en t�te de pile d'affichage, sinon certains sont derri�re le tsTab
  Dim f As Frame
  For Each f In fraFeuille
    f.ZOrder 0
  Next
  
  AjusterBarreBoutonsRA
  Show

  iCurFrame = -1   ' Pour forcer le passage � la page 0
  Page "T�te"
  ChargeContr�les
  bDirty = False
  chkSaisieValid�e.Value = vbUnchecked
  
  Refresh
  DoEvents
  
  Select Case cra.iMode
    Case meCr�ation: InitCr�ation
    Case meModification: InitModification
    Case meModificationR�duite: InitModificationR�duite
    Case meModificationSp�ciale: InitModificationSp�ciale
    Case meVisualisation: InitVisualisation
    Case Else: Stop
  End Select
  
  AfficheModeBo�tes
  
  ' Test pour voir si le pb du bDirty de Christelle ne vient pas du DoEvents plus haut
  If bDirty Then
    MsgBox2i "CR247"
    'MsgBox "PROBLEME INTERNE - bDirty est positionn� en fin de Form_Load" & vbCrLf & vbCrLf & "Ne tapez pas si vite !" & vbCrLf & "Attendez que le sablier ait disparu pour saisir les donn�es !!!", vbCritical, sNomApp
    bDirty = False
  End If
End Sub


' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Remplissage / activation des champs

Private Sub InitCr�ation()
  sTitreFen�tre = "Nouveau RA"
  Caption = sTitreFen�tre
  chkSaisieValid�e.Enabled = True
  
  cmdSupprimer.Enabled = False            ' Pas de suppression
  tbBoutons.Buttons("Supprimer").Enabled = False
  tbBoutons.Buttons("Enregistrer").Enabled = False
  tbBoutons.Buttons("EnregistrerQuitter").Enabled = False
  cmdAnnulerValidation.Enabled = False
  
  ' Tous les champs sont actifs
  
  ' T�te
  txtNumPro.Locked = False
  txtCompl�mentNom.Locked = False
  txtObs.Locked = False
  txtDatePr�l�vement.Locked = False
  txtHeurePr�l�vement.Locked = False
  txtTemp�ratureProduit.Locked = False
  txtTemp�ratureAmbiance.Locked = False
  txtTemp�ratureR�ception.Locked = False
  txtDatePr�paration.Locked = False
  txtHeurePr�paration.Locked = False
  txtCodeArticle.Locked = False
  txtCodeFamille.Locked = False
  txtNumLip.Locked = False
  txtNumCdt.Locked = False
  txtNumFab.Locked = False
  txtNumDis.Locked = False
  txtDateFabrication.Locked = False
  txtDateLivraison.Locked = False
  txtDateR�ceptionClient.Locked = False
  txtDateConditionnement.Locked = False
  txtDateD�conditionnement.Locked = False
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
  txtDateR�ception.Locked = False
  txtHeureR�ception.Locked = False
  txtAspect.Locked = False
  
  txtSecteurPr�l.Locked = False
  txt�tatPhy.Locked = False
  txtIntOp�r.Locked = False
  txtCondPr�l.Locked = False
  txtContenant.Locked = False
  txt�tatDiv.Locked = False
  txtNiv�labo.Locked = False
  txtTechFab.Locked = False
  txtInfo1.Locked = False
  txtInfo2.Locked = False

  
  ' Analyse
  txtCrit�re.Locked = False
  cboMM�thode.Locked = False
  bdcClasseDoc.Locked = False
  txtOptionsLabo.Locked = False
  txtRemarquesLabo.Locked = False
  txtPrixSp�cifique.Locked = False
  bdcDevise.Locked = False
  chkIE.Enabled = True
  chkFax.Enabled = True
  chkCongel�.Enabled = True
  txtTrait�Par.Locked = False
  txtDateDebAnPr�vue.Locked = False
  btnLireGermes.Visible = True
  btnAjouteGerme.Visible = True
  btnEnl�veGerme.Visible = True
  btnModifieGerme.Visible = True
  btnAjouteBo�te.Visible = True
  btnEnl�veBo�te.Visible = True
  btnModifieBo�te.Visible = True
  
  D�sactiveBoutonsGermes
  
  '' R�sultats
  'BlocR�sultatsVisible False
End Sub



Private Sub InitModification()
  sTitreFen�tre = sGetIntlLib("RAtxtInitModif", "Modification d'un RA")
  Caption = sTitreFen�tre
  
  chkSaisieValid�e.Enabled = True
  cmdSupprimer.Enabled = True
  tbBoutons.Buttons("Supprimer").Enabled = True
  tbBoutons.Buttons("Enregistrer").Enabled = False
  tbBoutons.Buttons("EnregistrerQuitter").Enabled = False
  cmdAnnulerValidation.Enabled = False

  ' Certains champs sont actifs, selon ce qui a d�j� �t� fait
  ' Pour commencer tout est actif�

  ' T�te
  txtNumPro.Locked = False
  txtCompl�mentNom.Locked = False
  txtObs.Locked = False
  txtDatePr�l�vement.Locked = False
  txtHeurePr�l�vement.Locked = False
  txtTemp�ratureProduit.Locked = False
  txtTemp�ratureAmbiance.Locked = False
  txtTemp�ratureR�ception.Locked = False
  txtDatePr�paration.Locked = False
  txtHeurePr�paration.Locked = False
  txtCodeArticle.Locked = False
  txtCodeFamille.Locked = False
  txtNumLip.Locked = False
  txtNumCdt.Locked = False
  txtNumFab.Locked = False
  txtNumDis.Locked = False
  txtDateFabrication.Locked = False
  txtDateLivraison.Locked = False
  txtDateR�ceptionClient.Locked = False
  txtDateConditionnement.Locked = False
  txtDateD�conditionnement.Locked = False
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
  txtDateR�ception.Locked = False
  txtHeureR�ception.Locked = False
  txtAspect.Locked = False
  txtSecteurPr�l.Locked = False
  txt�tatPhy.Locked = False
  txtIntOp�r.Locked = False
  txtCondPr�l.Locked = False
  txtContenant.Locked = False
  txt�tatDiv.Locked = False
  txtNiv�labo.Locked = False
  txtTechFab.Locked = False
  txtInfo1.Locked = False
  txtInfo2.Locked = False

  
  ' Analyse
  txtCrit�re.Locked = False
  cboMM�thode.Locked = False
  bdcClasseDoc.Locked = False
  txtOptionsLabo.Locked = False
  txtRemarquesLabo.Locked = False
  txtPrixSp�cifique.Locked = False
  bdcDevise.Locked = False
  chkIE.Enabled = True
  chkFax.Enabled = True
  chkCongel�.Enabled = True
  txtTrait�Par.Locked = False
  txtDateDebAnPr�vue.Locked = False
  btnLireGermes.Visible = True
  
  btnLireGermes.Enabled = False       ' Par d�faut, pas � relire
  
  btnAjouteGerme.Visible = True
  btnEnl�veGerme.Visible = True
  btnModifieGerme.Visible = True
  
  If cra.iModeBo�tes = mbProbl�me Then
    btnAjouteBo�te.Visible = False
    btnEnl�veBo�te.Visible = False
    btnModifieBo�te.Visible = False
    lblAnalyse(6) = sGetIntlLib("RAtxtAnalyse(6)", "Probl�me � la lecture des bo�tes")
  Else
    btnAjouteBo�te.Visible = True
    btnEnl�veBo�te.Visible = True
    btnModifieBo�te.Visible = True
  End If
  
  '' R�sultats
  'BlocR�sultatsVisible True
End Sub


Private Sub InitModificationR�duite()
  InitModificationR�duiteSp�ciale meModificationR�duite
End Sub

Private Sub InitModificationSp�ciale()
  InitModificationR�duiteSp�ciale meModificationSp�ciale
End Sub


Private Sub InitModificationR�duiteSp�ciale(meMode As eModeEdition)
  If meMode = meModificationR�duite Then
    sTitreFen�tre = sGetIntlLib("RAtxtInitModifR", "Saisie restreinte d'un RA")
    chkSaisieValid�e.Enabled = True
  Else
    sTitreFen�tre = sGetIntlLib("RAtxtInitModifS", "*** MODIFICATION SP�CIALE ***")
    chkSaisieValid�e.Enabled = False
  End If
  Caption = sTitreFen�tre

  chkSaisieValid�e.Enabled = False
  cmdSupprimer.Enabled = False            ' Pas de suppression une fois pris en charge par le labo
  tbBoutons.Buttons("Supprimer").Enabled = False
  tbBoutons.Buttons("Enregistrer").Enabled = False
  tbBoutons.Buttons("EnregistrerQuitter").Enabled = False
  cmdAnnulerValidation.Enabled = False
  
  ' Crit�re / germe / bo�tes sont inactifs

  ' T�te
  txtNumPro.Locked = False
  txtCompl�mentNom.Locked = False
  txtObs.Locked = False
  txtDatePr�l�vement.Locked = False
  txtHeurePr�l�vement.Locked = False
  txtTemp�ratureProduit.Locked = True
  txtTemp�ratureAmbiance.Locked = False
  txtTemp�ratureR�ception.Locked = False
  txtDatePr�paration.Locked = False
  txtHeurePr�paration.Locked = False
  txtCodeArticle.Locked = False
  txtCodeFamille.Locked = False
  txtNumLip.Locked = False
  txtNumCdt.Locked = False
  txtNumFab.Locked = False
  txtNumDis.Locked = False
  txtDateFabrication.Locked = False
  txtDateLivraison.Locked = False
  txtDateR�ceptionClient.Locked = False
  txtDateConditionnement.Locked = False
  txtDateD�conditionnement.Locked = False
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
  txtDateR�ception.Locked = False
  txtHeureR�ception.Locked = False
  txtAspect.Locked = False
  
  txtSecteurPr�l.Locked = False
  txt�tatPhy.Locked = False
  txtIntOp�r.Locked = False
  txtCondPr�l.Locked = False
  txtContenant.Locked = False
  txt�tatDiv.Locked = False
  txtNiv�labo.Locked = False
  txtTechFab.Locked = False
  txtInfo1.Locked = False
  txtInfo2.Locked = False
  
  ' Analyse
  txtCrit�re.Locked = True
  cboMM�thode.Locked = True
  bdcClasseDoc.Locked = False     ' La classe peut �tre modifi�e, elle n'influence pas le labo
  
  txtOptionsLabo.Locked = True
  txtTrait�Par.Locked = True
  txtDateDebAnPr�vue.Locked = True
  ' Tol�rance pour ces champs
  txtRemarquesLabo.Locked = False
  txtPrixSp�cifique.Locked = False
  bdcDevise.Locked = False
  chkIE.Enabled = True
  chkFax.Enabled = True
  chkCongel�.Enabled = True
  
  ' Pas de modification permise pour les germes et les bo�tes en mode restreint
  btnLireGermes.Visible = False
  btnAjouteGerme.Visible = False
  btnEnl�veGerme.Visible = False
  btnModifieGerme.Visible = False
  
  btnAjouteBo�te.Visible = False
  btnEnl�veBo�te.Visible = False
  btnModifieBo�te.Visible = False
  
  '' R�sultats
  'BlocR�sultatsVisible True
End Sub



Private Sub InitVisualisation()
  sTitreFen�tre = sGetIntlLib("RAtxtVisual", "Visualisation d'un RA")
  Caption = sTitreFen�tre
  
  chkSaisieValid�e.Enabled = False
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
  
  ' T�te
  txtNumPro.Locked = True
  txtCompl�mentNom.Locked = True
  txtObs.Locked = True
  txtDatePr�l�vement.Locked = True
  txtHeurePr�l�vement.Locked = True
  txtTemp�ratureProduit.Locked = True
  txtTemp�ratureAmbiance.Locked = True
  txtTemp�ratureR�ception.Locked = True
  txtDatePr�paration.Locked = True
  txtHeurePr�paration.Locked = True
  txtCodeArticle.Locked = True
  txtCodeFamille.Locked = True
  txtNumLip.Locked = True
  txtNumCdt.Locked = True
  txtNumFab.Locked = True
  txtNumDis.Locked = True
  txtDateFabrication.Locked = True
  txtDateLivraison.Locked = True
  txtDateR�ceptionClient.Locked = True
  txtDateConditionnement.Locked = True
  txtDateD�conditionnement.Locked = True
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
  txtDateR�ception.Locked = True
  txtHeureR�ception.Locked = True
  txtAspect.Locked = True
  
  txtSecteurPr�l.Locked = True
  txt�tatPhy.Locked = True
  txtIntOp�r.Locked = True
  txtCondPr�l.Locked = True
  txtContenant.Locked = True
  txt�tatDiv.Locked = True
  txtNiv�labo.Locked = True
  txtTechFab.Locked = True
  txtInfo1.Locked = True
  txtInfo2.Locked = True
  
  ' Analyse
  txtCrit�re.Locked = True
  cboMM�thode.Locked = True
  bdcClasseDoc.Locked = True
  txtOptionsLabo.Locked = True
  txtRemarquesLabo.Locked = True
  txtPrixSp�cifique.Locked = True
  bdcDevise.Locked = True
  chkIE.Enabled = False
  chkFax.Enabled = False
  chkCongel�.Enabled = False
  txtTrait�Par.Locked = True
  txtDateDebAnPr�vue.Locked = True
  btnLireGermes.Visible = False
  btnAjouteGerme.Visible = False
  btnEnl�veGerme.Visible = False
  btnModifieGerme.Visible = False
  btnAjouteBo�te.Visible = False
  btnEnl�veBo�te.Visible = False
  btnModifieBo�te.Visible = False
End Sub


Private Sub ChargeContr�les()
  bModeChargement = True
  
  ' Partie commune
  txtR�f�rence = cra.sRef
  txtNumEtb = cra.sEtb
  Dim e As Etablissement
  If cra.sEtb = "0" Then
    Set e = New Etablissement
    e.etb_prefixe = "AC"
    e.etb_nom = sGetIntlLib("CRtxtEtb", "�TABLISSEMENT EN COURS DE CR�ATION")
  Else
    Set e = LireEtablissement(cra.sEtb, False)
  End If
  If Not e Is Nothing Then
    txtPr�fixe = e.etb_prefixe
    txtNomEtb = e.etb_nom
  End If

  ' Page t�te
  txtNumPro = NV(cra.iPro)
  txtNomPro = cra.sNomPro
  txtCrit�reInfo = cra.sCrit�reInfo
  
  txtCompl�mentNom = cra.sCplNom
  bCheckCompl�mentNom False
  txtObs = cra.sObs
  bCheckObs False
  
  txtDatePr�l�vement.DateSaisie = cra.dDatePr�l
  txtHeurePr�l�vement.HeureSaisie = NV(cra.hHeurePr�l)
  txtTemp�ratureProduit.Temp�rature = cra.dTemp
  txtTemp�ratureAmbiance.Temp�rature = cra.dTamb
  txtTemp�ratureR�ception.Temp�rature = cra.dTrec
  
  txtDatePr�paration.DateSaisie = cra.dDatePr�p
  txtHeurePr�paration.HeureSaisie = NV(cra.hHeurePr�p)
  txtCodeArticle = cra.sCodeArt
  txtCodeFamille = cra.sCodeFamille
  
  txtNumLip = NV(cra.hLieuPr�l)
  bCheckLieuDePr�l�vement False
  txtNumCdt = NV(cra.hCondit)
  bCheckConditionnement False
  
  txtNumFab = NV(cra.iFab)
  txtNomFab = cra.sNomFab
  txtNumDis = NV(cra.iDis)
  txtNomDis = cra.sNomDis
  
  txtDateFabrication.DateSaisie = cra.dDateFab
  txtDateLivraison.DateSaisie = cra.dDateLivr
  txtDateR�ceptionClient.DateSaisie = cra.dDateR�cepCli
  
  txtDateConditionnement.DateSaisie = cra.dDateCond
  txtDateD�conditionnement.DateSaisie = cra.dDateD�cond
  txtDateDLC = cra.sDlc    ' Pas une date dans la structure RA
  txtDateDLUO = cra.sDluo
  txtDLC2 = cra.sDLC2
  txtCodeFamille = cra.sCodeFamille

  txtIdLot = cra.sIdlot
  txtCodeEmballeur = cra.sCodeEmb
  
  txtDateRetrait = cra.sDateRetrait
  txtNumCpr = NZ(cra.hCadrePr�l)
  bCheckCadreDePr�l�vement False
  
  txtRefOrigine = cra.sRef0
  
  txtCodeFabricant = cra.sCodeFab
  txtOptionsEdition = cra.sOptionsEdition
  
  txtMarque = cra.sMarque
  txtUV = cra.sUv
  
  txtDateR�ception.DateSaisie = cra.dDateR�cep
  txtHeureR�ception.HeureSaisie = cra.hHeureR�cep
  txtAspect = NV(cra.hAspect)
  bCheckAspect�chantillon False
  
  txtNiv�labo = NV(cra.hNiveau�laboration)
  bCheckNiveau�laboration False
  txt�tatPhy = NV(cra.h�tatPhysique)
  bCheck�tatPhysique False
  
  txtContenant = NV(cra.hContenant)
  bCheckContenant False
  txt�tatDiv = NV(cra.h�tatDivision)
  bCheck�tatDivision False
  
  txtTechFab = NV(cra.hTechnologieFabrication)
  bCheckTechnologieFabrication False
  txtSecteurPr�l = NV(cra.hSecteurPr�l)
  bCheckSecteurPr�l�vement False
  
  txtCondPr�l = NV(cra.hCondPr�l)
  bCheckConditionsPr�l�vement False
  txtInfo1 = NV(cra.iInfo1)
  txtInfo2 = cra.sInfo2

  txtIntOp�r = NV(cra.hInterventionOp�rateur)
  bCheckInterventionOp�rateur False
  
  
  ' =============================================
  ' Analyse
  
  txtCrit�re = cra.sCrit�re
  txtVerCrit = NV(cra.hVerCrit)
  txtStatusModif = NV(cra.cStatusModif)
  txtRevivification = cra.iRevivification
  
  txtNumS�rie = NV(cra.iNumS�rie)
  txtRangEchS�rie = NV(cra.iRangEchS�rie)
  
  cboMM�thode = cra.cMM�thode
  bdcClasseDoc = cra.sClasseDoc
  
  txtOptionsLabo = cra.sOptionsLabo
  chkIE = IIf(cra.bIE, vbChecked, vbUnchecked)
  chkFax = IIf(cra.bFax, vbChecked, vbUnchecked)
  chkCongel� = IIf(cra.bEchCongel�, vbChecked, vbUnchecked)
  txtRemarquesLabo = cra.sRemarques
  txtPrixSp�cifique = NV(cra.dPrix)
  bdcDevise = NV(cra.cDevise)
  txtTrait�Par = NV(cra.iTrait�Par)
  txtDateDebAnPr�vue.DateSaisie = NV(cra.dDateDebAnPr�vue)
  
  ' Liste des germes
  If txtCrit�re <> "" Then AfficheGermes
  
  
  ' =============================================
  ' Page r�sultats
  
  txtNumCon = NV(cra.hConcl)
  bCheckConclusion False
  txtCPrin = NV(cra.hCPrin)
  txtNomCPrin = sLibell�CPrin(cra.hCPrin)
  txtNumConInfo = NV(cra.hConclInfo)
  txtCPrinInfo = NV(cra.hCPrinInfo)
  txtCTrafiqu�e = IIf(cra.bConclTrafiqu�e, "O", "N")
  
  Dim g As GermeRecherch�
  Dim iLigne As Integer
  iLigne = 1
  If Not cra.cGermes Is Nothing Then
    For Each g In cra.cGermes
      AfficheR�sultats iLigne, g
      iLigne = iLigne + 1
    Next
  End If
  
  
  ' =============================================
  ' Page planning
  
  txtDateTourn�e = NV(cra.dDateTour)
  txtPers = cra.hPers
  If cra.hPers > 0 Then txtNomPers = sNomUtilisateur(cra.hPers)
  txtCP = cra.hCp
  txtiEtb(0) = cra.sEtb
  txtiEtb(1) = NV(cra.iSec)
  txtiEtb(2) = NV(cra.iDrg)
  txtiEtb(3) = NV(cra.iDna)
  txtiEtb(4) = NV(cra.iGrp)
  
  txtLangue = cra.cLangue
  txtNomLangue = sLibell�Langue(cra.cLangue)
  
  
  ' =============================================
  ' Page divers
  
  txtEtatPH = cra.cEtatPH
  txtNomEtatPH = sLibell�EtatPH(cra.cEtatPH)
  txtDateSaisPH = NV(cra.dDateSaisPH)
  txtOperSaisPH = NV(cra.hOperSaisPH)
  txtNomSaisPH = sNomUtilisateur(cra.hOperSaisPH)
  txtDateValPH = NV(cra.dDateValPH)
  txtOperValPH = NV(cra.hOperValPH)
  txtNomValPH = sNomUtilisateur(cra.hOperValPH)
  
  txtEtatLabo = cra.cEtatLabo
  txtNomEtatLabo = sLibell�EtatLabo(cra.cEtatLabo)
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
  txtNomLieuAn = sLibell�LieuAnalyse(cra.cLieuAn)
  
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
  SetLib btnEnl�veGerme, "Caption", "btnEnl�veGerme"
  SetLib btnEnl�veGerme, "ToolTipText", "btnEnl�veGerme.tt"
  SetLib btnModifieGerme, "Caption", "btnModifieGerme"
  SetLib btnModifieGerme, "ToolTipText", "btnModifieGerme.tt"
  SetLib btnAjouteBo�te, "Caption", "btnAjouteBo�te"
  SetLib btnAjouteBo�te, "ToolTipText", "btnAjouteBo�te.tt"
  SetLib btnEnl�veBo�te, "Caption", "btnEnl�veBo�te"
  SetLib btnEnl�veBo�te, "ToolTipText", "btnEnl�veBo�te.tt"
  SetLib btnModifieBo�te, "Caption", "btnModifieBo�te"
  SetLib btnModifieBo�te, "ToolTipText", "btnModifieBo�te.tt"
  SetLib btnD�tailFRT, "Caption", "btnD�tailFRT"
  SetLib btnD�tailFRT, "ToolTipText", "btnD�tailFRT.tt"
  
  SetLib mnuRA, "Caption", "RAmnuCRA"
  SetLib cmdContr�ler, "Caption", "RAcmdContr�ler"
  SetLib cmdValider, "Caption", "RAcmdValider"
  SetLib cmdAnnulerValidation, "Caption", "RAcmdAnnulerValidat"
  SetLib cmdEnregistrer, "Caption", "RAcmdEnregistrer"
  SetLib cmdEnregistrerQuitter, "Caption", "RAcmdEnregistrerQuit"
  SetLib cmdAbandonnerQuitter, "Caption", "RAcmdAbandonnerQuit"
  SetLib cmdSuivant, "Caption", "RAcmdSuivant"
  SetLib cmdSupprimer, "Caption", "RAcmdSupprimer"
  
  SetLib mnuF5, "Caption", "RAmnuF5"
  'SetLib cmdF5Valeur, "Caption", "RAcmdF5Valeur"
  cmdF5Valeur.Caption = sLibell�Ercem("RAcmdF5Valeur", "&Valeur pr�c�dente du champ") & vbTab & "F5"
  SetLib cmdF5T�te, "Caption", "RAcmdF5T�te"
  SetLib cmdF5Analyse, "Caption", "RAcmdF5Analyse"
  
  SetLib mnuRech, "Caption", "RAmnuRech"
  SetLib cmdRechEtablissement, "Caption", "RAcmdRechEtablis"
  SetLib cmdRechDate, "Caption", "RAcmdRechDate"
  SetLib cmdRechProduit, "Caption", "RAcmdRechProduit"
  SetLib cmdRechFabricant, "Caption", "RAcmdRechFabricant"
  SetLib cmdRechDistrib, "Caption", "RAcmdRechDistrib"
  SetLib cmdRechConclusion, "Caption", "RAcmdRechConclusion"
  SetLib cmdLibell�RA(1), "Caption", "RAcmdLibell�RA(1)"
  SetLib cmdLibell�RA(2), "Caption", "RAcmdLibell�RA(2)"
  SetLib cmdLibell�RA(3), "Caption", "RAcmdLibell�RA(3)"
  SetLib cmdLibell�RA(4), "Caption", "RAcmdLibell�RA(4)"
  SetLib cmdLibell�RA(5), "Caption", "RAcmdLibell�RA(5)"
  SetLib cmdLibell�RA(6), "Caption", "RAcmdLibell�RA(6)"
  SetLib cmdLibell�RA(7), "Caption", "RAcmdLibell�RA(7)"
  SetLib cmdLibell�RA(8), "Caption", "RAcmdLibell�RA(8)"
  SetLib cmdLibell�RA(9), "Caption", "RAcmdLibell�RA(9)"
  SetLib cmdLibell�RA(10), "Caption", "RAcmdLibell�RA(10)"
  SetLib cmdLibell�RA(11), "Caption", "RAcmdLibell�RA(11)"
  SetLib cmdLibell�RA(12), "Caption", "RAcmdLibell�RA(12)"
  
  SetLib mnuAvanc�, "Caption", "RAmnuAvanc�"
  SetLib cmdForcerRattachementFRTCourante, "Caption", "RAcmdForcerRattacFRT"
  SetLib cmdEffacerNum�roFRT, "Caption", "RAcmdEffNum�roFRT"
  SetLib cmdTrafiquerFRT, "Caption", "RAcmdTrafiquerFRT"
  
  SetLib mnuAide, "Caption", "RAmnuAide"
  SetLib cmdAideSommaire, "Caption", "RAcmdAideSommaire"
  SetLib cmdAideContextuelle, "Caption", "RAcmdAideContextuel"
  SetLib cmdAPropos, "Caption", "RAcmdAPropos"
  
  SetLib mnuBarreBoutons, "Caption", "RAmnuBarreBoutons"
  SetLib cmdBarreStandard, "Caption", "RAcmdBarreStandard"
  SetLib cmdEtiquettes, "Caption", "RAcmdEtiquettes"
  
  
  SetLib lblR�f�rence, "Caption", "RAlblR�f�rence"
  SetLib chkSaisieValid�e, "Caption", "RAchkSaisVal"
  SetLib lblEtablissement, "Caption", "RAlblEtablissement"
  
  ' Onglet T�te
  SetLib lblT�te(0), "Caption", "RAlblT�te(0)"
  SetLib lblT�te(1), "Caption", "RAlblT�te(1)"
  SetLib lblT�te(2), "Caption", "RAlblT�te(2)"
  SetLib lblT�te(3), "Caption", "RAlblT�te(3)"
  SetLib lblT�te(4), "Caption", "RAlblT�te(4)"
  SetLib lblT�te(5), "Caption", "RAlblT�te(5)"
  SetLib lblT�te(6), "Caption", "RAlblT�te(6)"
  SetLib lblT�te(7), "Caption", "RAlblT�te(7)"
  SetLib lblT�te(8), "Caption", "RAlblT�te(8)"
  SetLib lblT�te(9), "Caption", "RAlblT�te(9)"
  SetLib lblT�te(10), "Caption", "RAlblT�te(10)"
  SetLib lblT�te(11), "Caption", "RAlblT�te(11)"
  SetLib lblT�te(12), "Caption", "RAlblT�te(12)"
  SetLib lblT�te(13), "Caption", "RAlblT�te(13)"
  SetLib lblT�te(14), "Caption", "RAlblT�te(14)"
  SetLib lblT�te(15), "Caption", "RAlblT�te(15)"
  SetLib lblT�te(16), "Caption", "RAlblT�te(16)"
  SetLib lblT�te(17), "Caption", "RAlblT�te(17)"
  SetLib lblT�te(18), "Caption", "RAlblT�te(18)"
  SetLib lblT�te(19), "Caption", "RAlblT�te(19)"
  SetLib lblT�te(20), "Caption", "RAlblT�te(20)"
  SetLib lblT�te(21), "Caption", "RAlblT�te(21)"
  SetLib lblT�te(22), "Caption", "RAlblT�te(22)"
  SetLib lblT�te(23), "Caption", "RAlblT�te(23)"
  SetLib lblT�te(24), "Caption", "RAlblT�te(24)"
  SetLib lblT�te(25), "Caption", "RAlblT�te(25)"
  SetLib lblT�te(26), "Caption", "RAlblT�te(26)"
  SetLib lblT�te(27), "Caption", "RAlblT�te(27)"
  SetLib lblT�te(28), "Caption", "RAlblT�te(28)"
  SetLib lblT�te(29), "Caption", "RAlblT�te(29)"
  SetLib lblT�te(30), "Caption", "RAlblT�te(30)"
  SetLib lblT�te(31), "Caption", "RAlblT�te(31)"
  SetLib lblT�te(32), "Caption", "RAlblT�te(32)"
  SetLib lblT�te(33), "Caption", "RAlblT�te(33)"
  SetLib lblT�te(34), "Caption", "RAlblT�te(34)"
  SetLib lblT�te(35), "Caption", "RAlblT�te(35)"
  
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
  SetLib chkCongel�, "Caption", "RAchkCongel�"
  SetLib lblModeBo�tes, "Caption", "RAlblModeBo�tes"
  SetLib lblModeGermes, "Caption", "RAlblModeGermes"
  
  ' Onglet R�sultats
  SetLib lblTitreR�sultats, "Caption", "RAlblTitreR�sultats"
  SetLib lblR�sultats(0), "Caption", "RAlblR�sultats(0)"
  SetLib lblR�sultats(1), "Caption", "RAlblR�sultats(1)"
  SetLib lblR�sultats(2), "Caption", "RAlblR�sultats(2)"
  SetLib lblR�sultats(3), "Caption", "RAlblR�sultats(3)"
  SetLib lblR�sultats(11), "Caption", "RAlblR�sultats(11)"
  
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
  SetLib lblTra�abilit�(7), "Caption", "RAlblTra�abilit�(7)"
  SetLib lblTra�abilit�(2), "Caption", "RAlblTra�abilit�(2)"
  SetLib lblTra�abilit�(3), "Caption", "RAlblTra�abilit�(3)"
  SetLib fraLabo, "Caption", "RAfraLabo"
  SetLib lblTra�abilit�(8), "Caption", "RAlblTra�abilit�(8)"
  SetLib lblTra�abilit�(4), "Caption", "RAlblTra�abilit�(4)"
  SetLib lblTra�abilit�(6), "Caption", "RAlblTra�abilit�(6)"
  SetLib lblTra�abilit�(11), "Caption", "RAlblTra�abilit�(11)"
  SetLib lblTra�abilit�(9), "Caption", "RAlblTra�abilit�(9)"
  SetLib lblTra�abilit�(13), "Caption", "RAlblTra�abilit�(13)"
  SetLib lblTra�abilit�(10), "Caption", "RAlblTra�abilit�(10)"
  SetLib lblTra�abilit�(5), "Caption", "RAlblTra�abilit�(5)"
  SetLib lblTra�abilit�(0), "Caption", "RAlblTra�abilit�(0)"
  SetLib lblTra�abilit�(12), "Caption", "RAlblTra�abilit�(12)"
  SetLib lblTra�abilit�(1), "Caption", "RAlblTra�abilit�(1)"
 
 
  ' Nom des onglets
  SetLib tsTab.Tabs(1), "Caption", "RAtsT�te"
  SetLib tsTab.Tabs(1), "ToolTipText", "RAtsT�te.tt"
  SetLib tsTab.Tabs(2), "Caption", "RAtsAnalyse"
  SetLib tsTab.Tabs(2), "ToolTipText", "RAtsAnalyse.tt"
  SetLib tsTab.Tabs(3), "Caption", "RAtsR�sultats"
  SetLib tsTab.Tabs(3), "ToolTipText", "RAtsR�sultats.tt"
  SetLib tsTab.Tabs(4), "Caption", "RAtsplanning"
  SetLib tsTab.Tabs(4), "ToolTipText", "RAtsplanning.tt"
  SetLib tsTab.Tabs(5), "Caption", "RAtsDivers"
  SetLib tsTab.Tabs(5), "ToolTipText", "RAtsDivers.tt"
 
  ' Tool Tip des boutons
  SetLib tbBoutons.Buttons("Contr�ler"), "ToolTipText", "RAtbContr�ler.tt"
  SetLib tbBoutons.Buttons("Valider"), "ToolTipText", "RAtbValider.tt"
  SetLib tbBoutons.Buttons("Enregistrer"), "ToolTipText", "RAtbEnregistrer.tt"
  SetLib tbBoutons.Buttons("EnregistrerQuitter"), "ToolTipText", "RAtbEnregQuit.tt"
  SetLib tbBoutons.Buttons("Quitter"), "ToolTipText", "RAtbQuitter.tt"
  SetLib tbBoutons.Buttons("Suivant"), "ToolTipText", "RAtbSuivant.tt"
  SetLib tbBoutons.Buttons("Supprimer"), "ToolTipText", "RAtbSupprimer.tt"
    
  ' En-T�te du tableau Ajout Germe
  Dim sMsg1 As String
  sMsg1 = sGetIntlLib("RAt�teGermes", "<Germe    |M�th|Unit�         |>m             |>Seuil         ")
  fgGermes.FormatString = Subst(sMsg1, vbCrLf, "|")
 
  ' En-T�te du tableau Ajout Milieu
  Dim sMsg2 As String
  sMsg2 = sGetIntlLib("RAt�teMilieu", "<Milieu    |>Dil  |>Qt�  |>Facteur  |>No b|<Type  |L�gende")
  fgBo�tes.FormatString = Subst(sMsg2, vbCrLf, "|")
  
   ' En-T�te du tableau R�sultats
  Dim sMsg3 As String
  sMsg3 = sGetIntlLib("RAt�teR�sultats", "<Germe                                                                        |>R�sultat    |>Crit�re      |<CPar |^Etat")
  fgR�sultat.FormatString = Subst(sMsg3, vbCrLf, "|")
End Sub

