VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmPlanning 
   Caption         =   "Microb'Soft - Plannings"
   ClientHeight    =   7290
   ClientLeft      =   1575
   ClientTop       =   2115
   ClientWidth     =   9420
   FillColor       =   &H00FF0000&
   FillStyle       =   0  'Solid
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmPlanning.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   486
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   628
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   555
      Index           =   5
      Left            =   5940
      TabIndex        =   93
      Top             =   3120
      Visible         =   0   'False
      Width           =   975
      Begin VB.Label lblLégendeDoc 
         AutoSize        =   -1  'True
         Caption         =   "Labos ayant enregistré les échantllons :"
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
         Index           =   1
         Left            =   0
         TabIndex        =   112
         Tag             =   "204"
         Top             =   1380
         Width           =   3945
      End
      Begin VB.Label lblTabEch 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   1
         Left            =   720
         TabIndex        =   111
         Tag             =   "204"
         Top             =   2640
         Width           =   6000
      End
      Begin VB.Label lblEchelle 
         AutoSize        =   -1  'True
         Caption         =   "1234567890123456789012345678901234567890123456789"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   3
         Left            =   720
         TabIndex        =   110
         Tag             =   "204"
         Top             =   2460
         Width           =   5880
      End
      Begin VB.Label lblEchelle 
         AutoSize        =   -1  'True
         Caption         =   "5555555556666666666777777777788888888889999999999"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   2
         Left            =   720
         TabIndex        =   109
         Tag             =   "204"
         Top             =   2280
         Width           =   5880
      End
      Begin VB.Label lblTabEch 
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   0
         Left            =   720
         TabIndex        =   108
         Tag             =   "204"
         Top             =   1980
         Width           =   6120
      End
      Begin VB.Label lblEchelle 
         AutoSize        =   -1  'True
         Caption         =   "12345678901234567890123456789012345678901234567890"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   1
         Left            =   720
         TabIndex        =   107
         Tag             =   "204"
         Top             =   1800
         Width           =   6000
      End
      Begin VB.Label lblEchelle 
         AutoSize        =   -1  'True
         Caption         =   "00000000011111111112222222222333333333344444444445"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   0
         Left            =   720
         TabIndex        =   106
         Tag             =   "204"
         Top             =   1620
         Width           =   6000
      End
      Begin VB.Label lblTrancheDoc 
         AutoSize        =   -1  'True
         Caption         =   "État de facturation de la tranche"
         Height          =   210
         Index           =   2
         Left            =   4080
         TabIndex        =   104
         Tag             =   "204"
         Top             =   1020
         Width           =   3075
      End
      Begin VB.Label lblTrancheDoc 
         AutoSize        =   -1  'True
         Caption         =   "État maximum des documents de la tranche"
         Height          =   210
         Index           =   1
         Left            =   4080
         TabIndex        =   103
         Tag             =   "204"
         Top             =   780
         Width           =   4140
      End
      Begin VB.Label lblTrancheDoc 
         AutoSize        =   -1  'True
         Caption         =   "État minimum des documents de la tranche"
         Height          =   210
         Index           =   0
         Left            =   4080
         TabIndex        =   102
         Tag             =   "204"
         Top             =   540
         Width           =   4080
      End
      Begin VB.Label lblLégendeDoc 
         AutoSize        =   -1  'True
         Caption         =   "État des 26 tranches de documents :"
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
         Index           =   0
         Left            =   0
         TabIndex        =   101
         Tag             =   "204"
         Top             =   0
         Width           =   3600
      End
      Begin VB.Label lblTrEtatFac 
         AutoSize        =   -1  'True
         Caption         =   "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   720
         TabIndex        =   100
         Tag             =   "204"
         Top             =   1020
         Width           =   3120
      End
      Begin VB.Label lblTrEtatDocMax 
         AutoSize        =   -1  'True
         Caption         =   "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   720
         TabIndex        =   99
         Tag             =   "204"
         Top             =   780
         Width           =   3120
      End
      Begin VB.Label lblTrEtatDocMin 
         AutoSize        =   -1  'True
         Caption         =   "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   720
         TabIndex        =   98
         Tag             =   "204"
         Top             =   540
         Width           =   3120
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   720
         TabIndex        =   97
         Tag             =   "204"
         Top             =   300
         Width           =   3120
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Fact :"
         Height          =   210
         Left            =   0
         TabIndex        =   96
         Tag             =   "204"
         Top             =   1020
         Width           =   525
      End
      Begin VB.Label lblMax 
         AutoSize        =   -1  'True
         Caption         =   "Max :"
         Height          =   210
         Left            =   0
         TabIndex        =   95
         Tag             =   "204"
         Top             =   780
         Width           =   510
      End
      Begin VB.Label lblMin 
         AutoSize        =   -1  'True
         Caption         =   "Min :"
         Height          =   210
         Left            =   0
         TabIndex        =   94
         Tag             =   "204"
         Top             =   540
         Width           =   450
      End
   End
   Begin VB.TextBox txtInfo 
      BackColor       =   &H00C0FFFF&
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   87
      TabStop         =   0   'False
      Top             =   6240
      Width           =   4095
   End
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   4
      Top             =   0
      Width           =   9420
      _ExtentX        =   16616
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      Appearance      =   1
      ImageList       =   "ImageListTB"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   23
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnNouveauPlanning"
            Object.ToolTipText     =   "Crée un nouveau planning (Ctrl+N)"
            ImageKey        =   "imgNouveau"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnLire"
            Object.ToolTipText     =   "Lire un planning (Ctrl+L)"
            ImageKey        =   "imgLire"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnLireAvancé"
            Object.ToolTipText     =   "Recherche avancée (Ctrl+R)"
            ImageKey        =   "imgLireAvancé"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnModifierPlanning"
            Object.ToolTipText     =   "Modifier les infos du planning (Ctrl+O)"
            ImageKey        =   "ModifierPlanning"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnValidation"
            Object.ToolTipText     =   "Validation d'intervention (Ctrl+V)"
            ImageKey        =   "imgClôture"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnPlanningsNonVal"
            Object.ToolTipText     =   "Liste des plannings non validés"
            ImageKey        =   "imgPlanningsNonClôts"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnUnix"
            Object.ToolTipText     =   "Change de système Unix"
            ImageKey        =   "imgUnix"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnUtilisateur"
            Object.ToolTipText     =   "Change l'identification de la personne"
            ImageKey        =   "imgUtilisateur"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnImprimante"
            Object.ToolTipText     =   "Configuration des imprimantes"
            ImageKey        =   "imgImprimante"
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnIntAjouter"
            Object.ToolTipText     =   "Ajoute une intervention (Ctrl+A)"
            ImageKey        =   "imgIntAjouter"
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnAjouterFT"
            Object.ToolTipText     =   "Ajoute une fiche tournée (Ctrl+T)"
            ImageKey        =   "imgFTour"
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnIntModifier"
            Object.ToolTipText     =   "Modifie l'intervention sélectionnée (Ctrl+M)"
            ImageKey        =   "imgIntModifier"
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnIntSupprimer"
            Object.ToolTipText     =   "Supprime les interventions sélectionnées (Ctrl+S)"
            ImageKey        =   "imgIntSupprimer"
         EndProperty
         BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnIntDéplacer"
            Object.ToolTipText     =   "Déplace les interventions sélectionnées (Ctrl+D)"
            ImageKey        =   "imgIntDéplacer"
         EndProperty
         BeginProperty Button18 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button19 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnImprimePla"
            Object.ToolTipText     =   "Imprime les plannings (Ctrl+P)"
            ImageKey        =   "imgImprimePla"
         EndProperty
         BeginProperty Button20 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnImprimeEtiq"
            Object.ToolTipText     =   "Imprime les planches d'étiquettes (Ctrl+E)"
            ImageKey        =   "imgImprimeEtiq"
         EndProperty
         BeginProperty Button21 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnImprimeFP"
            Object.ToolTipText     =   "Imprime les fiches de prélèvement (Ctrl+F)"
            ImageKey        =   "imgImprimeFP"
         EndProperty
         BeginProperty Button22 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnImprimeAP"
            Object.ToolTipText     =   "Imprime les avis de passage (Ctrl+B)"
            ImageKey        =   "imgImprimeAP"
         EndProperty
         BeginProperty Button23 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnImprimeDoc"
            Object.ToolTipText     =   "Imprime les documents du passage précédent"
            ImageKey        =   "imgDoc"
         EndProperty
      EndProperty
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   2535
      Index           =   4
      Left            =   2520
      TabIndex        =   20
      Top             =   3780
      Visible         =   0   'False
      Width           =   5715
      Begin VB.TextBox txtLabCh 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   7800
         Locked          =   -1  'True
         TabIndex        =   63
         TabStop         =   0   'False
         Tag             =   "248"
         ToolTipText     =   "Enregistrement labo"
         Top             =   720
         Width           =   350
      End
      Begin VB.TextBox txtLabHu 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   6540
         Locked          =   -1  'True
         TabIndex        =   59
         TabStop         =   0   'False
         Tag             =   "248"
         ToolTipText     =   "Enregistrement labo"
         Top             =   720
         Width           =   350
      End
      Begin VB.TextBox txtLabFS 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   5280
         Locked          =   -1  'True
         TabIndex        =   56
         TabStop         =   0   'False
         Tag             =   "248"
         ToolTipText     =   "Enregistrement labo"
         Top             =   720
         Width           =   350
      End
      Begin VB.TextBox txtLabLi 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   4020
         Locked          =   -1  'True
         TabIndex        =   53
         TabStop         =   0   'False
         Tag             =   "248"
         ToolTipText     =   "Enregistrement labo"
         Top             =   720
         Width           =   350
      End
      Begin VB.TextBox txtLabBS 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2820
         Locked          =   -1  'True
         TabIndex        =   50
         TabStop         =   0   'False
         Tag             =   "248"
         ToolTipText     =   "Enregistrement labo"
         Top             =   720
         Width           =   350
      End
      Begin VB.TextBox txtLabAB 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   780
         Locked          =   -1  'True
         TabIndex        =   44
         TabStop         =   0   'False
         Tag             =   "248"
         ToolTipText     =   "Nombre d'AB enregistrées au labo"
         Top             =   720
         Width           =   350
      End
      Begin VB.CommandButton btnZoomEtb 
         Height          =   330
         Left            =   8820
         Picture         =   "frmPlanning.frx":0442
         Style           =   1  'Graphical
         TabIndex        =   31
         Tag             =   "Cliquer pour sélectionner la date dans un calendrier."
         Top             =   0
         Width           =   315
      End
      Begin VB.TextBox txtDateValidation 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         TabIndex        =   90
         TabStop         =   0   'False
         Tag             =   "320"
         Top             =   2880
         Width           =   1275
      End
      Begin VB.TextBox txtOperValidation 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   4020
         Locked          =   -1  'True
         TabIndex        =   89
         TabStop         =   0   'False
         Tag             =   "320"
         Top             =   2880
         Width           =   680
      End
      Begin VB.TextBox txtNomOperValidation 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   4800
         Locked          =   -1  'True
         TabIndex        =   88
         TabStop         =   0   'False
         Tag             =   "320"
         Top             =   2880
         Width           =   4330
      End
      Begin VB.TextBox txtNbHu 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   6180
         Locked          =   -1  'True
         TabIndex        =   58
         TabStop         =   0   'False
         Tag             =   "248"
         Top             =   720
         Width           =   350
      End
      Begin VB.TextBox txtNomEtb 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   3600
         Locked          =   -1  'True
         TabIndex        =   30
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   0
         Width           =   5175
      End
      Begin VB.TextBox txtNbFS 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   4920
         Locked          =   -1  'True
         TabIndex        =   55
         TabStop         =   0   'False
         Tag             =   "248"
         Top             =   720
         Width           =   350
      End
      Begin VB.TextBox txtNbLi 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   3660
         Locked          =   -1  'True
         TabIndex        =   52
         TabStop         =   0   'False
         Tag             =   "248"
         Top             =   720
         Width           =   350
      End
      Begin VB.TextBox txtNbBS 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2460
         Locked          =   -1  'True
         TabIndex        =   49
         TabStop         =   0   'False
         Tag             =   "248"
         Top             =   720
         Width           =   350
      End
      Begin VB.TextBox txtNbAB 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   420
         Locked          =   -1  'True
         TabIndex        =   43
         TabStop         =   0   'False
         Tag             =   "248"
         Top             =   720
         Width           =   350
      End
      Begin VB.TextBox txtComment 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   4020
         Locked          =   -1  'True
         TabIndex        =   35
         TabStop         =   0   'False
         Tag             =   "224"
         Top             =   360
         Width           =   5115
      End
      Begin VB.TextBox txtNomUnité 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1860
         Locked          =   -1  'True
         TabIndex        =   39
         TabStop         =   0   'False
         Tag             =   "296"
         Top             =   1440
         Width           =   4470
      End
      Begin VB.TextBox txtUnité 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         TabIndex        =   38
         TabStop         =   0   'False
         Tag             =   "296"
         Top             =   1440
         Width           =   660
      End
      Begin VB.TextBox txtNomPers 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1860
         Locked          =   -1  'True
         TabIndex        =   37
         TabStop         =   0   'False
         Tag             =   "272"
         Top             =   1080
         Width           =   4470
      End
      Begin VB.TextBox txtPers 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         TabIndex        =   36
         TabStop         =   0   'False
         Tag             =   "272"
         Top             =   1080
         Width           =   660
      End
      Begin VB.TextBox txtRéférence 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         TabIndex        =   33
         TabStop         =   0   'False
         Tag             =   "224"
         Top             =   360
         Width           =   1320
      End
      Begin VB.TextBox txtPréfixe 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2160
         Locked          =   -1  'True
         TabIndex        =   29
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   0
         Width           =   1395
      End
      Begin VB.TextBox txtNumEtb 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         TabIndex        =   28
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   0
         Width           =   960
      End
      Begin VB.TextBox txtNomOperBL 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   4800
         Locked          =   -1  'True
         TabIndex        =   27
         TabStop         =   0   'False
         Tag             =   "344"
         Top             =   2160
         Width           =   4330
      End
      Begin VB.TextBox txtOperBL 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   4020
         Locked          =   -1  'True
         TabIndex        =   26
         TabStop         =   0   'False
         Tag             =   "344"
         Top             =   2160
         Width           =   680
      End
      Begin VB.TextBox txtTSBL 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         TabIndex        =   25
         TabStop         =   0   'False
         Tag             =   "344"
         Top             =   2160
         Width           =   2200
      End
      Begin VB.TextBox txtNomOperFP 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   4800
         Locked          =   -1  'True
         TabIndex        =   24
         TabStop         =   0   'False
         Tag             =   "368"
         Top             =   2520
         Width           =   4330
      End
      Begin VB.TextBox txtOperFP 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   4020
         Locked          =   -1  'True
         TabIndex        =   23
         TabStop         =   0   'False
         Tag             =   "368"
         Top             =   2520
         Width           =   680
      End
      Begin VB.TextBox txtTSFP 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         TabIndex        =   22
         TabStop         =   0   'False
         Tag             =   "368"
         Top             =   2520
         Width           =   2200
      End
      Begin VB.TextBox txtNbCh 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   7440
         Locked          =   -1  'True
         TabIndex        =   62
         TabStop         =   0   'False
         Tag             =   "248"
         Top             =   720
         Width           =   350
      End
      Begin VB.TextBox txtNbEH 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1620
         Locked          =   -1  'True
         TabIndex        =   47
         TabStop         =   0   'False
         Tag             =   "248"
         Top             =   720
         Width           =   350
      End
      Begin VB.TextBox txtTypePrestation 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         TabIndex        =   41
         TabStop         =   0   'False
         Tag             =   "248"
         Top             =   1800
         Width           =   3555
      End
      Begin VB.TextBox txtCodeActivité 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   5580
         Locked          =   -1  'True
         TabIndex        =   61
         TabStop         =   0   'False
         Tag             =   "272"
         Top             =   1800
         Width           =   3555
      End
      Begin VB.TextBox txtCodeClient 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   7440
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   65
         TabStop         =   0   'False
         Tag             =   "296"
         Top             =   1440
         Width           =   1695
      End
      Begin Plannings.ChampHeure txtHeureArrivée 
         Height          =   315
         Left            =   7440
         TabIndex        =   21
         TabStop         =   0   'False
         Tag             =   "248"
         Top             =   1080
         Width           =   710
         _ExtentX        =   1244
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
         BackColor       =   -2147483633
         Locked          =   -1  'True
      End
      Begin Plannings.ChampHeure txtHeureDépart 
         Height          =   315
         Left            =   8400
         TabIndex        =   66
         TabStop         =   0   'False
         Tag             =   "272"
         Top             =   1080
         Width           =   735
         _ExtentX        =   1296
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
         BackColor       =   -2147483633
         Locked          =   -1  'True
      End
      Begin MSWLess.WLCommand btnNouveau 
         Height          =   315
         Index           =   0
         Left            =   8220
         TabIndex        =   105
         TabStop         =   0   'False
         Tag             =   "pla_labxx"
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
      Begin VB.Label lblValidéLe 
         AutoSize        =   -1  'True
         Caption         =   "Clôt le :"
         Height          =   210
         Left            =   0
         TabIndex        =   92
         Tag             =   "324"
         Top             =   2940
         Width           =   735
      End
      Begin VB.Label lblValidéPar 
         AutoSize        =   -1  'True
         Caption         =   "Par :"
         Height          =   210
         Left            =   3480
         TabIndex        =   91
         Tag             =   "324"
         Top             =   2940
         Width           =   450
      End
      Begin VB.Label lblNbHu 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "Hu :"
         Height          =   210
         Left            =   5760
         TabIndex        =   57
         Tag             =   "252"
         Top             =   780
         Width           =   390
      End
      Begin VB.Label lblNbAB 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "AB :"
         Height          =   210
         Left            =   0
         TabIndex        =   42
         Tag             =   "252"
         Top             =   780
         Width           =   375
      End
      Begin VB.Label lblNbFS 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "FS :"
         Height          =   210
         Left            =   4560
         TabIndex        =   54
         Tag             =   "252"
         Top             =   780
         Width           =   360
      End
      Begin VB.Label lblNbLi 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "Li :"
         Height          =   210
         Left            =   3360
         TabIndex        =   51
         Tag             =   "252"
         Top             =   780
         Width           =   285
      End
      Begin VB.Label lblNbBS 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "BS :"
         Height          =   210
         Left            =   2040
         TabIndex        =   48
         Tag             =   "252"
         Top             =   780
         Width           =   375
      End
      Begin VB.Label lblCommentaire 
         AutoSize        =   -1  'True
         Caption         =   "Commentaire :"
         Height          =   210
         Left            =   2520
         TabIndex        =   34
         Tag             =   "228"
         Top             =   420
         Width           =   1395
      End
      Begin VB.Label lblUnité 
         AutoSize        =   -1  'True
         Caption         =   "Unité :"
         Height          =   210
         Left            =   0
         TabIndex        =   74
         Tag             =   "300"
         Top             =   1500
         Width           =   630
      End
      Begin VB.Label lblPersonne 
         AutoSize        =   -1  'True
         Caption         =   "Personne :"
         Height          =   210
         Left            =   0
         TabIndex        =   73
         Tag             =   "276"
         Top             =   1140
         Width           =   1035
      End
      Begin VB.Label lblRéférence 
         AutoSize        =   -1  'True
         Caption         =   "Référence :"
         Height          =   210
         Left            =   0
         TabIndex        =   32
         Tag             =   "228"
         Top             =   420
         Width           =   1080
      End
      Begin VB.Label lblEtabliss 
         AutoSize        =   -1  'True
         Caption         =   "Établiss. :"
         Height          =   210
         Left            =   0
         TabIndex        =   72
         Tag             =   "204"
         Top             =   60
         Width           =   930
      End
      Begin VB.Label lblEdBLPar 
         AutoSize        =   -1  'True
         Caption         =   "Par :"
         Height          =   210
         Left            =   3480
         TabIndex        =   71
         Tag             =   "348"
         Top             =   2220
         Width           =   450
      End
      Begin VB.Label lblEdBL 
         AutoSize        =   -1  'True
         Caption         =   "BL éd. le :"
         Height          =   210
         Left            =   0
         TabIndex        =   70
         Tag             =   "348"
         Top             =   2220
         Width           =   945
      End
      Begin VB.Label lblEdFPPar 
         AutoSize        =   -1  'True
         Caption         =   "Par :"
         Height          =   210
         Left            =   3480
         TabIndex        =   69
         Tag             =   "372"
         Top             =   2580
         Width           =   450
      End
      Begin VB.Label lblEdFP 
         AutoSize        =   -1  'True
         Caption         =   "FP éd. le :"
         Height          =   210
         Left            =   0
         TabIndex        =   68
         Tag             =   "372"
         Top             =   2580
         Width           =   945
      End
      Begin VB.Label lblNbCh 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "Ch :"
         Height          =   210
         Left            =   7020
         TabIndex        =   60
         Tag             =   "252"
         Top             =   780
         Width           =   390
      End
      Begin VB.Label lblNbEH 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "EH :"
         Height          =   210
         Left            =   1200
         TabIndex        =   45
         Tag             =   "252"
         Top             =   780
         Width           =   390
      End
      Begin VB.Label lblHeureAD 
         AutoSize        =   -1  'True
         Caption         =   "H arr/dep :"
         Height          =   210
         Left            =   6420
         TabIndex        =   67
         Tag             =   "252"
         Top             =   1140
         Width           =   1035
      End
      Begin VB.Label lblPrestation 
         AutoSize        =   -1  'True
         Caption         =   "Prestation :"
         Height          =   210
         Left            =   0
         TabIndex        =   40
         Tag             =   "252"
         Top             =   1860
         Width           =   1110
      End
      Begin VB.Label lblActivité 
         AutoSize        =   -1  'True
         Caption         =   "Activité :"
         Height          =   210
         Left            =   4800
         TabIndex        =   46
         Tag             =   "276"
         Top             =   1860
         Width           =   810
      End
      Begin VB.Label lblClient 
         AutoSize        =   -1  'True
         Caption         =   "Client :"
         Height          =   210
         Left            =   6420
         TabIndex        =   64
         Tag             =   "300"
         Top             =   1500
         Width           =   675
      End
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   615
      Index           =   1
      Left            =   60
      TabIndex        =   17
      Top             =   4200
      Visible         =   0   'False
      Width           =   1635
      Begin VB.Label lblTêteTout 
         AutoSize        =   -1  'True
         Caption         =   "Aucune sélection"
         Height          =   315
         Left            =   0
         TabIndex        =   75
         Tag             =   "204"
         Top             =   60
         Width           =   1590
      End
      Begin VB.Label lblSélectionTout 
         AutoSize        =   -1  'True
         Caption         =   "Sélection tout"
         Height          =   210
         Left            =   0
         TabIndex        =   18
         Tag             =   "204"
         Top             =   780
         Width           =   1305
      End
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   615
      Index           =   2
      Left            =   120
      TabIndex        =   13
      Top             =   5040
      Visible         =   0   'False
      Width           =   2595
      Begin Plannings.ChampDate txtDateJournée 
         Height          =   315
         Left            =   960
         TabIndex        =   14
         TabStop         =   0   'False
         Tag             =   "Entrez la date de destination"
         Top             =   0
         Width           =   1335
         _ExtentX        =   2355
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
         BackColor       =   -2147483633
         Locked          =   -1  'True
         SaisieAssistée  =   "ATTENTE=1/1/2019"
      End
      Begin VB.Label lblDateJournée 
         AutoSize        =   -1  'True
         Caption         =   "Date :"
         Height          =   210
         Left            =   0
         TabIndex        =   16
         Tag             =   "204"
         Top             =   60
         Width           =   585
      End
      Begin VB.Label lblSélectionJournée 
         AutoSize        =   -1  'True
         Caption         =   "Sélection journée"
         Height          =   210
         Left            =   0
         TabIndex        =   15
         Tag             =   "204"
         Top             =   780
         Width           =   1650
      End
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   615
      Index           =   3
      Left            =   6060
      TabIndex        =   7
      Top             =   3720
      Visible         =   0   'False
      Width           =   2715
      Begin VB.PictureBox picJournée 
         AutoRedraw      =   -1  'True
         Height          =   495
         Left            =   0
         ScaleHeight     =   435
         ScaleMode       =   0  'User
         ScaleWidth      =   7755
         TabIndex        =   85
         Top             =   2400
         Width           =   7815
      End
      Begin VB.TextBox txtKmFin 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   2220
         Locked          =   -1  'True
         TabIndex        =   78
         TabStop         =   0   'False
         Tag             =   "Kilométrage en fin de tournée"
         Top             =   2040
         Width           =   1035
      End
      Begin VB.TextBox txtKmDébut 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         TabIndex        =   77
         TabStop         =   0   'False
         Tag             =   "Kilométrage au début de tournée"
         Top             =   2040
         Width           =   1035
      End
      Begin VB.CommandButton btnModifierPlanning 
         Caption         =   "M&odifier"
         Height          =   375
         Left            =   3660
         TabIndex        =   76
         Top             =   1860
         Width           =   1275
      End
      Begin VB.TextBox txtNomPlanning 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1680
         Locked          =   -1  'True
         TabIndex        =   12
         TabStop         =   0   'False
         Tag             =   "320"
         Top             =   360
         Width           =   3435
      End
      Begin VB.TextBox txtLettresPlanning 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1140
         Locked          =   -1  'True
         TabIndex        =   11
         TabStop         =   0   'False
         Tag             =   "320"
         Top             =   360
         Width           =   495
      End
      Begin Plannings.ChampHeure txtHeureDébut 
         Height          =   315
         Left            =   1140
         TabIndex        =   79
         TabStop         =   0   'False
         Tag             =   "Heure de départ de l'assistant"
         Top             =   1680
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
         BackColor       =   -2147483633
         Locked          =   -1  'True
      End
      Begin Plannings.ChampHeure txtHeureFin 
         Height          =   315
         Left            =   2220
         TabIndex        =   80
         TabStop         =   0   'False
         Tag             =   "Heure de rentrée de l'assistant"
         Top             =   1680
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
         BackColor       =   -2147483633
         Locked          =   -1  'True
      End
      Begin Plannings.ChampDate txtDatePlanning 
         Height          =   315
         Left            =   1140
         TabIndex        =   9
         TabStop         =   0   'False
         Tag             =   "Entrez la date de destination"
         Top             =   0
         Width           =   1335
         _ExtentX        =   2355
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
         BackColor       =   -2147483633
         Locked          =   -1  'True
         SaisieAssistée  =   "ATTENTE=1/1/2019"
      End
      Begin VB.Label lblTournée 
         AutoSize        =   -1  'True
         Caption         =   "Tournée :"
         Height          =   210
         Left            =   0
         TabIndex        =   86
         Tag             =   "324"
         Top             =   1440
         Width           =   915
      End
      Begin VB.Label lblKm 
         AutoSize        =   -1  'True
         Caption         =   "km :"
         Height          =   210
         Left            =   0
         TabIndex        =   84
         Tag             =   "324"
         Top             =   2100
         Width           =   405
      End
      Begin VB.Label lblHeure 
         AutoSize        =   -1  'True
         Caption         =   "Heure :"
         Height          =   210
         Left            =   0
         TabIndex        =   83
         Tag             =   "324"
         Top             =   1740
         Width           =   705
      End
      Begin VB.Label lblDébut 
         Alignment       =   2  'Center
         Caption         =   "Début"
         Height          =   225
         Left            =   1200
         TabIndex        =   82
         Tag             =   "324"
         Top             =   1440
         Width           =   960
      End
      Begin VB.Label lblFin 
         Alignment       =   2  'Center
         Caption         =   "Fin"
         Height          =   270
         Left            =   2280
         TabIndex        =   81
         Tag             =   "324"
         Top             =   1440
         Width           =   900
      End
      Begin VB.Line Line4 
         BorderWidth     =   2
         X1              =   3600
         X2              =   3480
         Y1              =   2040
         Y2              =   2040
      End
      Begin VB.Line Line3 
         BorderWidth     =   2
         X1              =   3480
         X2              =   3360
         Y1              =   2340
         Y2              =   2340
      End
      Begin VB.Line Line2 
         BorderWidth     =   2
         X1              =   3480
         X2              =   3360
         Y1              =   1680
         Y2              =   1680
      End
      Begin VB.Line Line1 
         BorderWidth     =   2
         X1              =   3480
         X2              =   3480
         Y1              =   1680
         Y2              =   2340
      End
      Begin VB.Label lblSélectionPlanning 
         AutoSize        =   -1  'True
         Caption         =   "Sélection planning"
         Height          =   210
         Left            =   0
         TabIndex        =   19
         Tag             =   "204"
         Top             =   780
         Width           =   1725
      End
      Begin VB.Label lblLettresPlanning 
         AutoSize        =   -1  'True
         Caption         =   "Lettres :"
         Height          =   210
         Left            =   0
         TabIndex        =   10
         Tag             =   "204"
         Top             =   420
         Width           =   810
      End
      Begin VB.Label lblDatePlanning 
         AutoSize        =   -1  'True
         Caption         =   "Date :"
         Height          =   210
         Left            =   0
         TabIndex        =   8
         Tag             =   "204"
         Top             =   60
         Width           =   585
      End
   End
   Begin VB.PictureBox picSplitter 
      BackColor       =   &H00808080&
      BorderStyle     =   0  'None
      FillColor       =   &H00808080&
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2460
      Left            =   3780
      ScaleHeight     =   1071.19
      ScaleMode       =   0  'User
      ScaleWidth      =   780
      TabIndex        =   5
      Top             =   480
      Visible         =   0   'False
      Width           =   72
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   8940
      Top             =   3000
   End
   Begin MSComctlLib.ListView lvInterventions 
      Height          =   2475
      Left            =   3600
      TabIndex        =   1
      Top             =   480
      Width           =   5775
      _ExtentX        =   10186
      _ExtentY        =   4366
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      _Version        =   393217
      SmallIcons      =   "ilProprio"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "P"
         Object.Width           =   529
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Key             =   "Ref"
         Text            =   "Réf"
         Object.Width           =   2593
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Key             =   "Etb"
         Text            =   "Établissement"
         Object.Width           =   6615
      EndProperty
   End
   Begin MSComctlLib.TreeView tvPlanning 
      Height          =   2475
      Left            =   60
      TabIndex        =   0
      Top             =   480
      Width           =   3495
      _ExtentX        =   6165
      _ExtentY        =   4366
      _Version        =   393217
      HideSelection   =   0   'False
      Indentation     =   176
      LabelEdit       =   1
      Style           =   7
      ImageList       =   "ImageList1"
      Appearance      =   1
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
   Begin MSComctlLib.ProgressBar pbProgress 
      Height          =   225
      Left            =   60
      TabIndex        =   3
      Top             =   6660
      Visible         =   0   'False
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   397
      _Version        =   393216
      Appearance      =   1
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   2
      Top             =   6975
      Width           =   9420
      _ExtentX        =   16616
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   4
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   5689
            MinWidth        =   5689
            Key             =   "Info"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5292
            MinWidth        =   5292
            Picture         =   "frmPlanning.frx":058C
            Key             =   "Impr"
            Object.ToolTipText     =   "Imprimantes sélectionnées"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   529
            MinWidth        =   529
            Picture         =   "frmPlanning.frx":0ADE
            Key             =   "EInt"
            Object.ToolTipText     =   "Le cadenas indique que le programme communique"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5027
            MinWidth        =   5027
            Picture         =   "frmPlanning.frx":0E90
            Key             =   "ECom"
            Object.ToolTipText     =   "État de la connexion avec le système Unix"
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComctlLib.TabStrip tsTab 
      Height          =   435
      Left            =   60
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   3060
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   767
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   5
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Tout"
            Key             =   "Tout"
            ImageVarType    =   8
            ImageKey        =   "Tout"
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Journée"
            Key             =   "Journée"
            ImageVarType    =   8
            ImageKey        =   "Fichier"
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Planning"
            Key             =   "Planning"
            ImageVarType    =   8
            ImageKey        =   "Planning"
         EndProperty
         BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Intervention"
            Key             =   "Intervention"
            ImageVarType    =   8
            ImageKey        =   "Intervention"
         EndProperty
         BeginProperty Tab5 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Tranches"
            Key             =   "Tranches"
            ImageVarType    =   8
            ImageKey        =   "Tranche"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ImageListTB 
      Left            =   7920
      Top             =   3000
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   23
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":1256
            Key             =   "imgNouveau"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":1368
            Key             =   "imgLire"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":147A
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":1794
            Key             =   "imgPlanningsNonClôts"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":1AAE
            Key             =   "imgLireAvancé"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":1DC8
            Key             =   "imgUnix"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":231A
            Key             =   "imgUtilisateur"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":2634
            Key             =   "imgImprimante"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":2746
            Key             =   "imgImprimeBL"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":2A60
            Key             =   "imgImprimeEtiq"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":2D7A
            Key             =   "imgImprimeFP"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":3094
            Key             =   "imgImprimeJou"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":33AE
            Key             =   "imgIntAjouter"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":36C8
            Key             =   "imgIntModifier"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":39E2
            Key             =   "imgIntDéplacer"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":3CFC
            Key             =   "imgIntSupprimer"
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":4016
            Key             =   "ModifierPlanning"
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":4128
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":4588
            Key             =   "imgFTour"
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":46E4
            Key             =   "imgDoc"
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":4B38
            Key             =   "imgClôture"
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":4C4C
            Key             =   "imgImprimePla"
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":4DA8
            Key             =   "imgImprimeAP"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   7260
      Top             =   3000
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   12
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":4F04
            Key             =   "Tout"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":521E
            Key             =   "Fichier"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":5538
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":5852
            Key             =   "Alerte"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":5B6C
            Key             =   "Calendrier"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":5E86
            Key             =   "Intervention"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":61A0
            Key             =   "Planning"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":64BA
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":661A
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":677A
            Key             =   "VP"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":68D6
            Key             =   "V"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmPlanning.frx":6A32
            Key             =   "Tranche"
         EndProperty
      EndProperty
   End
   Begin VB.Image imgSplitter 
      Height          =   2475
      Left            =   3540
      MousePointer    =   9  'Size W E
      Top             =   480
      Width           =   150
   End
   Begin VB.Menu mnuPlanning 
      Caption         =   "&Planning"
      Begin VB.Menu cmdNouveauPlanning 
         Caption         =   "&Nouveau…"
         Shortcut        =   ^N
      End
      Begin VB.Menu cmdLire 
         Caption         =   "&Lire…"
         Shortcut        =   ^L
      End
      Begin VB.Menu cmdLireAvancé 
         Caption         =   "&Recherche avancée…"
         Shortcut        =   ^R
      End
      Begin VB.Menu sep7b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdModifierPlanning 
         Caption         =   "&Modifier…"
         Shortcut        =   ^O
      End
      Begin VB.Menu sep7 
         Caption         =   "-"
      End
      Begin VB.Menu cmdPlanningsNonValidés 
         Caption         =   "&Plannings non validés (J-3 à J-20)"
      End
      Begin VB.Menu sep0b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdExportExcel 
         Caption         =   "E&xporter dans Excel"
      End
      Begin VB.Menu sep0 
         Caption         =   "-"
      End
      Begin VB.Menu cmdSystèmeUnix 
         Caption         =   "&Système unix…"
      End
      Begin VB.Menu cmdIdentification 
         Caption         =   "&Identification de l'utilisateur…"
      End
      Begin VB.Menu cmdConfigImprimante 
         Caption         =   "Configuration &imprimantes…"
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuIntervention 
      Caption         =   "&Intervention"
      Begin VB.Menu cmdAjouter 
         Caption         =   "&Ajouter…"
         Shortcut        =   ^A
      End
      Begin VB.Menu cmdModifier 
         Caption         =   "&Modifier…"
         Shortcut        =   ^M
      End
      Begin VB.Menu cmdSupprimer 
         Caption         =   "&Supprimer"
         Shortcut        =   ^S
      End
      Begin VB.Menu sep8b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAjouterFT 
         Caption         =   "Ajouter &fiche tournée…"
         Shortcut        =   ^T
      End
      Begin VB.Menu sep8 
         Caption         =   "-"
      End
      Begin VB.Menu cmdDéplacer 
         Caption         =   "&Déplacer…"
         Shortcut        =   ^D
      End
      Begin VB.Menu sep12 
         Caption         =   "-"
      End
      Begin VB.Menu cmdGénèreRéférence 
         Caption         =   "&Générer les références"
      End
      Begin VB.Menu sep12b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdValidation 
         Caption         =   "&Validation"
         Shortcut        =   ^V
      End
      Begin VB.Menu cmdAnnulationValidation 
         Caption         =   "Annulation de la validation"
      End
   End
   Begin VB.Menu mnuAffichage 
      Caption         =   "A&ffichage"
      Begin VB.Menu cmdAffichage 
         Caption         =   "&Tout"
         Index           =   0
      End
      Begin VB.Menu cmdAffichage 
         Caption         =   "&Journée"
         Index           =   1
      End
      Begin VB.Menu cmdAffichage 
         Caption         =   "&Planning"
         Index           =   2
      End
      Begin VB.Menu cmdAffichage 
         Caption         =   "&Intervention"
         Index           =   3
      End
   End
   Begin VB.Menu mnuImpression 
      Caption         =   "I&mpression"
      Begin VB.Menu cmdImpPlanning 
         Caption         =   "P&lanning"
         Shortcut        =   ^P
      End
      Begin VB.Menu cmdImpEtiq 
         Caption         =   "&Planche d'étiquettes"
         Shortcut        =   ^E
      End
      Begin VB.Menu cmdImpFP 
         Caption         =   "&Fiches de prélèvement"
         Shortcut        =   ^F
      End
      Begin VB.Menu cmdImpAP 
         Caption         =   "&Avis de passage"
         Shortcut        =   ^B
      End
      Begin VB.Menu cmdImpDoc 
         Caption         =   "&Documents"
      End
      Begin VB.Menu cmdImpPlanningHebdo 
         Caption         =   "Planning &hebdomadaire"
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu cmdImpEtiqIE 
         Caption         =   "&Etiquettes d'IE…"
         Shortcut        =   ^I
      End
      Begin VB.Menu cmdImpFPVierges 
         Caption         =   "FP &vierges..."
      End
   End
   Begin VB.Menu mnuRecherche 
      Caption         =   "&Recherche"
      Begin VB.Menu cmdRechEtablissement 
         Caption         =   "&Etablissement…"
      End
      Begin VB.Menu cmdRechUtilisateur 
         Caption         =   "&Utilisateur…"
      End
      Begin VB.Menu cmdRechUnité 
         Caption         =   "U&nité…"
      End
      Begin VB.Menu cmdRechLettres 
         Caption         =   "&Lettres…"
      End
      Begin VB.Menu cmdRechDate 
         Caption         =   "&Date…"
      End
      Begin VB.Menu sep10b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdCléOpPrivilégiée 
         Caption         =   "Clé d'opération privilégiée..."
      End
      Begin VB.Menu sep10 
         Caption         =   "-"
      End
      Begin VB.Menu cmdOptions 
         Caption         =   "&Options…"
      End
   End
   Begin VB.Menu mnuSystème 
      Caption         =   "&Système"
      Begin VB.Menu cmdTCPFenetre 
         Caption         =   "&Fenêtre TCP"
      End
      Begin VB.Menu cmdRelâcher 
         Caption         =   "&Débloquer interface"
         Enabled         =   0   'False
      End
      Begin VB.Menu sep4 
         Caption         =   "-"
      End
      Begin VB.Menu cmdEffaceCacheInterventions 
         Caption         =   "Effacer cache interventions"
      End
      Begin VB.Menu cmdEffacerCacheEtablissements 
         Caption         =   "Effacer cache établissements"
      End
      Begin VB.Menu sep9 
         Caption         =   "-"
      End
      Begin VB.Menu cmdConnexion 
         Caption         =   "C&onnexion"
      End
      Begin VB.Menu cmdDéconnexion 
         Caption         =   "Déconne&xion"
      End
      Begin VB.Menu sep9t 
         Caption         =   "-"
      End
      Begin VB.Menu cmdClôtureMensuelle 
         Caption         =   "Clôture mensuelle…"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&Aide"
      Begin VB.Menu cmdAideSommaire 
         Caption         =   "&Sommaire de l'aide"
      End
      Begin VB.Menu cmdAideContextuelle 
         Caption         =   "Aide &contextuelle"
         Shortcut        =   {F1}
      End
      Begin VB.Menu sep6 
         Caption         =   "-"
      End
      Begin VB.Menu cmdDernièresModifs 
         Caption         =   "&Dernières modifications…"
      End
      Begin VB.Menu sep5 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A propos de…"
      End
   End
   Begin VB.Menu mnuPopUpInterventions 
      Caption         =   "Pop-up Interventions"
      Visible         =   0   'False
      Begin VB.Menu cmdPopUpAjouter 
         Caption         =   "&Ajouter"
      End
      Begin VB.Menu cmdPopUpModifier 
         Caption         =   "&Modifier"
      End
      Begin VB.Menu cmdPopUpSupprimer 
         Caption         =   "&Supprimer"
      End
   End
   Begin VB.Menu mnuBarreBoutons 
      Caption         =   "(Barre de boutons)"
      Visible         =   0   'False
      Begin VB.Menu cmdBarreStandard 
         Caption         =   "&Barre de boutons standard"
         Checked         =   -1  'True
      End
   End
End
Attribute VB_Name = "frmPlanning"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille principale des plannings Microb'Soft"
' Feuille frmPlanning
' Feuille principale des plannings Microb'Soft
'  3/11/96 PV
' 26/02/97 PV Contrôle d'environnement
' 15/04/97 PV 1.3.x Version VB5
' 10/09/97 PV       Barre de progression bien placée
' 17/11/97 PV 1.4.x Gestion des mots de passe; ContrôleDernièreVersion
' 21/11/97 PV       Icônes dans la barre d'état
' 10/12/97 PV       Contrôle dynamique des dates extrêmes
' 16/12/97 PV       Gestion du splitter (2ème implantation…), fin des colonnes C et A
' 22/01/98 PV       Option 80 échantillons des planches d'IE
'  4/02/98 PV       Nombre de références et d'échantillons variables pour les planches d'IE
' 10/04/98 PV 1.5.x Affichage via onglets, infos plannings (Heures et infos consultants)
' 19/04/98 PV       Effacement de la sélection d'information sur clic planning
' 20/04/98 PV       Contrôle de chevauchement des dates
' 20/07/98 PV 1.6.x Proto 1/4, Gestion des lettres à part entière
' 25/08/98 PV       ListViewFullRowSelect pour les établissements
' 22/10/98 PV 1.7   VB6; CommonControls VB6; installation agent
' 12/11/98 PV 1.8   Adresse établissement
' 26/11/98 PV 1.8.1 Perte de la sélection avec " " VB6 (pb de Séverine)
' 16/12/98 PV 1.9   Recherche de plannings sur préfixe établissement
' 24/12/98 PV       Dessin de l'échelle des temps de la journée
' 14/01/99 PV       Export des données dans Excel
' 19/01/99 PV       Réorganisation des champs consultants / modConsultants
' 19/01/99 PV 2.0   Internationalisation
' 18/03/99 PV       Mémorisation de la date d'origine lors d'un mouvement
' 17/08/99 PV 2.1   Fiches tournée
'  8/12/99 PV 2.2   Impression des documents d'intervention
' 30/03/00 PV       Pb de changement d'imprimante suite au tri de la liste...
' 21/09/00 PV 3.0   Table nationale plannings; lettres non prises en charges en bleu; clôture à la ligne
' 30/09/00 PV 3.1   Avis de passage; ZoomEtb
' 16/10/00 PV 3.2   Contrôle de l'impression des documents à J+20; tranches
' 16/11/00 PV 3.3   Imprimantes [Win] et [Nul], impression des FP en VB
' 29/11/00 PV       Champs txtLabXX
' 16/01/02 PV       Validation à la journée
' 20/01/01 PV       Question PL011b avant d'effacer un planning avec indicateurs de saisie labo renseignés
' 20/01/01 PV       Fin de la validation à la journée limitée à PV; bug de déplacement de la sélection en validation corrigé
' 21/01/01 PV       Possibilité de rechercher des plannings limités au système courant
' 29/01/01 PV       Contrôle de la validation à la ligne lors d'un déplacement
'  5/03/01 PV 3.4   Impression de FP vierges; totaux/classe sur la FP .01
' 16/05/01 PV       Correction du pb où on pouvait déplacer une prestation validé d'un planning partiellement validé
' 30/07/01 PV       Etablissements AS en rouge
'  6/08/01 PV       Affichage de pla_tabech
'  6/11/01 PV       Appel à InitCommonControls pour XP
' 20/12/01 PC      ajout F. Faus+p. Crozet pour opé clé privilégiée

Option Explicit

Private iCurFrame As Integer        ' Cadre courant visible

Public colPlannings As Collection   ' Liste des plannings actuellement affichés
Public colJournées As New AccJournee 'Journées actuellement affichées

Dim iNiveauCourant As Integer
'-1: Pas de lecture
' 0: Tous les plannings sélectionnés de toutes les journées sélectionnées
' 1: Tous les plannings sélectionnés de la journée dDate
' 2: Le planning sLettresCourantes de la journée dDate
Public dDateCourante As Date
Dim sLettresCourantes As String

Public iOldEtat As Integer          ' État courant de la connexion TCP

Private Const sglSplitLimit = 50
Private mbMoving As Boolean         ' Déplacement du splitter en cours


' Export vers Excel
Dim xl As Excel.Application
Dim fXl As Excel.Worksheet
Dim lXl As Integer               ' Ligne courante


' Pour le style visuel XP
Private Declare Function InitCommonControls Lib "Comctl32.dll" () As Long



'=============================================================================
' Opérations sur planning

' (bouton éventuellement supprimé)
Private Sub btnModifierPlanning_Click()
  cmdModifierPlanning_Click
End Sub


'Private Sub btnNouveau_Click(Index As Integer)
'  Select Case btnNouveau(Index).Tag
'    Case "pla_labxx": Nouveau "Les nouveaux champs indiquent les quantités actuellement enregistrées sur l'ensemble des labos pour l'intervention.|La validation des plannings consistera à analyser la cause de ces écarts."
'  End Select
'End Sub

Private Sub btnZoomEtb_Click()
  If txtNumetb <> "" Then frmZoomEtb.ShowInfo txtNumetb
End Sub


' =======================================================
' Export vers Excel

Private Sub DébutExport()
  Screen.MousePointer = vbHourglass
  
  Set xl = Nothing
  Set xl = New Excel.Application
  xl.Workbooks.Add
  Set fXl = xl.Worksheets(1)

  fXl.Cells(1, 1) = "Extrait des plannings du système " & sSystèmeDistant
  fXl.Cells(2, 1) = "Le " & Now

  fXl.Cells(4, 1) = "Ref"
  fXl.Cells(4, 2) = "Date"
  fXl.Cells(4, 3) = "Lettres"
  fXl.Cells(4, 4) = "Intervenant"
  fXl.Cells(4, 5) = "N°etb"
  fXl.Cells(4, 6) = "N°sec"
  fXl.Cells(4, 7) = "N°drg"
  fXl.Cells(4, 8) = "N°dna"
  fXl.Cells(4, 9) = "N°grp"
  fXl.Cells(4, 10) = "Préfixe"
  fXl.Cells(4, 11) = "Établissement"
  fXl.Cells(4, 12) = "Rue"
  fXl.Cells(4, 13) = "Loc"
  fXl.Cells(4, 14) = "CPost"
  fXl.Cells(4, 15) = "BDist"
  fXl.Cells(4, 16) = "Tel"
  fXl.Cells(4, 17) = "Fax"
  fXl.Cells(4, 18) = "AB"
  fXl.Cells(4, 19) = "EH"
  fXl.Cells(4, 20) = "BS"
  fXl.Cells(4, 21) = "LI"
  fXl.Cells(4, 22) = "FS"
  fXl.Cells(4, 23) = "HU"
  fXl.Cells(4, 24) = "CH"
'  fXl.cells(4, 15) = "H Arr"
'  fXl.cells(4, 16) = "H Dép"
  fXl.Cells(4, 25) = "Commentaires"
  
  lXl = 4     ' 1ère ligne de données sur la feuille
End Sub

Private Sub FinExport()
  fXl.Range("A5").Select
  xl.Selection.AutoFormat Format:=xlRangeAutoFormatList3, Number:=True, Font:=True, Alignment:=True, Border:=True, Pattern:=True, Width:=True
  
  Screen.MousePointer = vbDefault
  xl.Visible = True
  
  Set fXl = Nothing
  Set xl = Nothing
End Sub

Private Sub ExporteUneIntervention(j As Journee, i As Intervention)
  ' On récupère les options et la langue de l'établissement
  Dim h As Hiérarchie
  Set h = LireHiérarchie(i.pla_etb)
  If h Is Nothing Then
    Dim sMessage As String
    sMessage = sprintf(sGetIntlLib("CR321", "Erreur lors de la lecture des informations de hiérarchie de l'établissement %1 ||Prévenez impérativement la DI !"), i.Etb)
    DémonJournalUnix "Hiérarchie", "Erreur interne", sMessage
    MsgBox sMessage, vbCritical, sNomApp
    Exit Sub
  End If
  
  lXl = lXl + 1
  fXl.Cells(lXl, 1) = i.pla_lettres & i.pla_iref
  fXl.Cells(lXl, 2) = j.dDatePlan
  fXl.Cells(lXl, 3) = j.sLettres
  fXl.Cells(lXl, 4) = j.sNomPersonne
  fXl.Cells(lXl, 5) = i.pla_etb
  fXl.Cells(lXl, 6) = h.iSec
  fXl.Cells(lXl, 7) = h.iDrg
  fXl.Cells(lXl, 8) = h.iDna
  fXl.Cells(lXl, 9) = h.iGrp
  fXl.Cells(lXl, 10) = i.etb_prefixe
  fXl.Cells(lXl, 11) = i.etb_nom
  fXl.Cells(lXl, 12) = i.Etb.etb_rue
  fXl.Cells(lXl, 13) = i.Etb.etb_loc
  fXl.Cells(lXl, 14) = i.Etb.etb_cpost
  fXl.Cells(lXl, 15) = i.Etb.etb_bdist
  fXl.Cells(lXl, 16) = i.Etb.etb_tel
  fXl.Cells(lXl, 17) = i.Etb.etb_fax
  fXl.Cells(lXl, 18) = i.pla_nbab
  fXl.Cells(lXl, 19) = i.pla_nbeh
  fXl.Cells(lXl, 20) = i.pla_nbbs
  fXl.Cells(lXl, 21) = i.pla_nbli
  fXl.Cells(lXl, 22) = i.pla_nbfs
  fXl.Cells(lXl, 23) = i.pla_nbhu
  fXl.Cells(lXl, 24) = i.pla_nbch
'  If Not IsNull(i.pla_harrivee) Then
'    fXl.cells(lXl, 15) = Int(i.pla_harrivee / 100) & ":" & Right(Str(100 + i.pla_harrivee Mod 100), 2)
'    fXl.cells(lXl, 16) = Int(i.pla_hdepart / 100) & ":" & Right(Str(100 + i.pla_hdepart Mod 100), 2)
'  End If
  fXl.Cells(lXl, 25) = i.pla_comment
End Sub

Private Sub ExporteUnPlanning(dDate As Date, sLettres As String)
  Dim j As Journee
  Set j = colJournées.LitJournée(dDate, sLettres)
  
  Set colPlannings = RecherchePlanning(dDate, sLettres)
  Dim i As Intervention
  For Each i In colPlannings
    ExporteUneIntervention j, i
  Next
End Sub

Private Sub Exporte(sCmd As String)
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If iNiveauCourant = -1 Then
    MsgBox2i "PL008"
    Exit Sub
  End If
  
  Dim i As Integer
  sbStatus.Panels("Info").Text = "Exportation en cours…"

  Select Case iNiveauCourant
    Case 2:    ' Pour des lettres d'une journée
      ' Si toutes les interventions sont sélectionnées, on efface la sélection
      ' de façon à ne pas protester pour l'édition des journaux et des étiquettes
      Dim bToutSélectionné As Boolean
      bToutSélectionné = True
      For i = 1 To lvInterventions.ListItems.count
        If Not lvInterventions.ListItems(i).Selected Then
          bToutSélectionné = False
          Exit For
        End If
      Next
      If bToutSélectionné Then
        For i = 1 To lvInterventions.ListItems.count
          lvInterventions.ListItems(i).Selected = False
        Next
        Set lvInterventions.SelectedItem = Nothing
      End If
      
      DébutExport
      If lvInterventions.SelectedItem Is Nothing Then
        ' Journée complète
        ExporteUnPlanning dDateCourante, sLettresCourantes
      Else
        Dim j As Journee
        Set j = colJournées.LitJournée(dDateCourante, sLettresCourantes)
        
        ' Interventions sélectionnées
        For i = lvInterventions.ListItems.count To 1 Step -1
          If lvInterventions.ListItems(i).Selected Then
            ExporteUneIntervention j, colPlannings(i)
          End If
        Next
      End If
      FinExport
    
    Case 1:    ' Toutes les lettres d'une journée
      DébutExport
      For i = tvPlanning.SelectedItem.Child.FirstSibling.Index To tvPlanning.SelectedItem.Child.LastSibling.Index
        ExporteUnPlanning dDateCourante, Left(tvPlanning.Nodes(i).Text, 2)
      Next
      FinExport
  
    Case 0:    ' Tout ce qui est sélectionné
      DébutExport
      Dim d As Date
      For i = 2 To tvPlanning.Nodes.count
        If Left(tvPlanning.Nodes(i).Key, 1) = "J" Then
          If tvPlanning.Nodes(i).Text = sAttente Then
            d = dAttente
          Else
            d = CDate(Mid(tvPlanning.Nodes(i).Text, InStr(tvPlanning.Nodes(i).Text, " ") + 1))
          End If
        Else
          ExporteUnPlanning d, Left(tvPlanning.Nodes(i).Text, 2)
        End If
      Next
      FinExport
  End Select
  
  sbStatus.Panels("Info").Text = ""
End Sub


Private Sub cmdClôtureMensuelle_Click()
  frmClôtureMensuelle.Show vbModal
End Sub


Private Sub cmdExportExcel_Click()
  Exporte ""
  tvPlanning_Click        ' On synchronise l'affichage
End Sub

' =======================================================


Private Sub cmdModifierPlanning_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If iNiveauCourant <> 2 Or lvInterventions.ListItems.count = 0 Then
    MsgBox2i "PL004"    ' Sélectionnez au préalable un planning…
    Exit Sub
  End If
  
  Dim j As Journee
  Set j = colJournées.LitJournée(dDateCourante, sLettresCourantes)
  
  If j Is Nothing Then
    MsgBox sGetIntlLib("PLsPlSansInt", "Planning sans intervention."), vbExclamation, sNomApp
    Exit Sub
  End If
  
  If frmModPla.bModifierPlanning(j) Then
    msdModifierJournée j
    iNiveauCourant = 0      ' Pour contourner le mécanisme d'optimisation
    tvPlanning_Click        ' On réaffiche
  End If
End Sub


'=============================================================================
' Menu affichage

Private Sub cmdAffichage_Click(Index As Integer)
  Page Index + 1
End Sub

Private Sub mnuAffichage_click()
  Dim i As Integer
  For i = 0 To 3
    cmdAffichage(i).Checked = tsTab.SelectedItem.Index = i + 1
  Next
End Sub


'=============================================================================

Private Sub cmdAnnulationValidation_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub

  If iNiveauCourant <> 2 Or lvInterventions.ListItems.count = 0 Then
    MsgBox2i "PL004"    ' Sélectionnez au préalable un planning contenant au moins une intervention avant d'utiliser cette commande.
    Exit Sub
  End If
  
  Dim j As Journee
  Set j = colJournées.LitJournée(dDateCourante, sLettresCourantes)
  
  If Not bOkLettresAssistant(sLettresCourantes, cSystèmeCA) Then
    ' Vous ne pouvez pas dévalider ce planning, les lettres %1 ne sont pas prises en charge sur le système Unix %2
    MsgBox2i "PL045b", sLettresCourantes, sSystèmeDistant
    Exit Sub
  End If
  
  Dim bSélectionJournée As Boolean
  Dim i As Integer
  Dim p As Intervention
  bSélectionJournée = True
  For i = 1 To lvInterventions.ListItems.count
    If lvInterventions.ListItems(i).Selected Then
      bSélectionJournée = False
      Exit For
    End If
  Next

  ' Annulation de validation :
  ' pla_datevalid reste renseigné
  ' pla_opervalid passe à null
  
  ' On dévalide !!!
  For i = 1 To lvInterventions.ListItems.count
    If lvInterventions.ListItems(i).Selected Or bSélectionJournée Then
      Set p = colPlannings(i)
      If Not IsNull(p.pla_opervalid) Then
      
        If msdTesteValidation(p.pla_serie) > 0 Then
          MsgBox2i "PL045"     ' Clôture de planning impossible à annuler, documents en cours de saisie.
          Exit For
        End If
        
        msdDévalideIntervention p.pla_systeme, p.pla_serie
        
        ' On modifie l'intervention en mémoire
        p.pla_datevalid = Today
        p.pla_opervalid = Null
        
        ' On force la relecture
        RetireCachePlanning colPlannings(i)
        
        ' On met à jour l'affichage
        AfficheUneIntervention p, i
        If lvInterventions.SelectedItem Is lvInterventions.ListItems(i) Then
          txtOperValidation = ""
          txtNomOperValidation = ""
          txtDateValidation = ""
        End If
      End If
    End If
  Next
  
  AjusteEtatDeValidation j  ' Met à jour le treeview et la journée
End Sub


' Après une validation ou une annulation de validation, ou un ajout ou une
' suppression de prestation, met à jour le champ iValidation de la journée
' et l'indicateur d'affichage associé
Private Sub AjusteEtatDeValidation(j As Journee)
  Dim nbV As Integer, nbNV As Integer
  Dim i As Integer
  
  If j Is Nothing Then Exit Sub
  
  For i = 1 To lvInterventions.ListItems.count
    If IsNull(colPlannings(i).pla_opervalid) Then
      nbNV = nbNV + 1
    Else
      nbV = nbV + 1
    End If
  Next
  
  Dim sNiveauValidation As Variant
  If nbV = 0 Then
    j.iValidation = 0
    sNiveauValidation = 0
  ElseIf nbNV = 0 Then
    sNiveauValidation = "V"
    j.iValidation = 2
  Else
    sNiveauValidation = "VP"
    j.iValidation = 1
  End If
  
  Dim sKey As String
  sKey = "P" & "J" & Format(j.dDatePlan, "ddmmyy") & j.sLettres
  tvPlanning.Nodes(sKey).Image = sNiveauValidation
End Sub


Private Sub cmdValidation_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  ' Seul PV a le droit de valider à la journée
  ' If Not ((iNiveauCourant = 1 And iNumOpérateur = 46) Or iNiveauCourant = 2 Or lvInterventions.ListItems.count <> 0) Then
  ' Restriction levée le 20/1/01 PV, autorisé pour tout le monde
  ' Mais ajout du niveau 0 uniquement pour PV
  If Not ((iNiveauCourant = 0 And iNumOpérateur = 46) Or iNiveauCourant = 1 Or iNiveauCourant = 2 Or lvInterventions.ListItems.count <> 0) Then
    MsgBox2i "PL004"    ' Sélectionnez au préalable un planning contenant au moins une intervention avant d'utiliser cette commande.
    Exit Sub
  End If
  
  Dim i As Integer
  Dim d As Date
  Select Case iNiveauCourant
    Case 0:    ' Sélection de ttes les dates
      For i = 2 To tvPlanning.Nodes.count
        If Left(tvPlanning.Nodes(i).Key, 1) = "J" Then
          If tvPlanning.Nodes(i).Text = sAttente Then
            d = dAttente
          Else
            d = CDate(Mid(tvPlanning.Nodes(i).Text, InStr(tvPlanning.Nodes(i).Text, " ") + 1))
          End If
        Else
          If d <> dAttente Then
            ValideUneJournée d, Left(tvPlanning.Nodes(i).Text, 2), True, False
          End If
        End If
      Next
      ' On remet l'affichage propre
      tvPlanning_Click
      
    Case 1:    ' Toutes les lettres d'une journée
      For i = tvPlanning.SelectedItem.Child.FirstSibling.Index To tvPlanning.SelectedItem.Child.LastSibling.Index
        ValideUneJournée dDateCourante, Left(tvPlanning.Nodes(i).Text, 2), True, False
      Next
      ' On remet l'affichage propre
      tvPlanning_Click
      
    Case 2:
      Dim bSélectionJournée As Boolean
      bSélectionJournée = True
      For i = 1 To lvInterventions.ListItems.count
        If lvInterventions.ListItems(i).Selected Then
          bSélectionJournée = False
          Exit For
        End If
      Next
      ValideUneJournée dDateCourante, sLettresCourantes, bSélectionJournée, True
  End Select
End Sub


Private Sub ValideUneJournée(dDate As Date, sLettres As String, bSélectionJournée As Boolean, bAvecMessages As Boolean)
  Dim j As Journee
  Set j = colJournées.LitJournée(dDate, sLettres)
  
  If Not bOkLettresAssistant(sLettres, cSystèmeCA) Then
    ' Vous ne pouvez pas valider ce planning, les lettres %1 ne sont pas prises en charge sur le système Unix %2
    If bAvecMessages Then MsgBox2i "PL045b", sLettres, sSystèmeDistant
    Exit Sub
  End If
  
' Fin de validation spéciale 17/1/1 PV
'  Dim bRevalidationTotale As Boolean  ' Vrai si on doit regénérer les lignes de planning
'  If bShiftPressed Then
'    bRevalidationTotale = True
'    MsgBox "Mode spécial de revalidation totale" & vbCrLf & "Les interventions validées sont retransmises à la facturation.", vbInformation, App.Title
'  Else
    If j.iValidation = 2 Then           ' Planning totalement validé !
      If bAvecMessages Then MsgBox2i "PL007"
      Exit Sub
    End If
'  End If
  
  
  If j.dDatePlan = dAttente Then
    If bAvecMessages Then MsgBox2i "PL031"    ' Vous ne pouvez pas effectuer la clôture d'un planning en attente, ou qui n'a pas été réalisé.
    Exit Sub
  End If
  
  If j.dDatePlan > Now Then
    If bAvecMessages Then MsgBox2i "PL031"    ' Vous ne pouvez pas effectuer la clôture d'un planning en attente, ou qui n'a pas été réalisé.
    If Not bShiftPressed Then Exit Sub
  End If
  
  ' On affiche unquement si on valide une journée complète
  If bSélectionJournée Then
    AffichePlanning dDate, sLettres
    EffaceSélectionInterventionIndividuelle
  End If
  
  ' Dans le cas de la validation d'une journée...
  If bSélectionJournée And Not bAvecMessages Then
    ' On contrôle les chevauchements de heures d'arrivée / départ
    Dim p As Intervention
    Dim q As Intervention
    Dim i1 As Integer, i2 As Integer
    Dim bOk As Boolean
    For i1 = 1 To colPlannings.count
      Set p = colPlannings(i1)
      
      ' On vérifie qu'à partir du 1/1/2000 on utilise les codes région, et pas avant
      ' Ne concerne que la france
      If cSystèmeCA = "G" Or cSystèmeCA = "P" Then
        If dDate >= DateSerial(2000, 1, 1) And ((p.pla_unite >= 10 And p.pla_unite <= 150) Or (p.pla_unite >= 830 And p.pla_unite <= 850)) Then
          MsgBox "Code unité incorrect." & vbCrLf & vbCrLf & "Utilisez les codes région (R1=310, R2=320, ...) et non plus les codes UOP." & vbCrLf & "Cliquez sur le bouton 'carte de France' pour voir le découpage en régions.", vbExclamation, App.Title
          Exit Sub
        End If
          
        If dDate < DateSerial(2000, 1, 1) And p.pla_unite >= 310 And p.pla_unite <= 369 Then
          MsgBox "Code unité incorrect." & vbCrLf & vbCrLf & "Utilisez les codes UOP (UOP1=10, UOP1.1=11, UOP2=20, ...) et non pas les codes région.", vbExclamation, App.Title
          Exit Sub
        End If
      End If
      
      For i2 = i1 + 1 To colPlannings.count
        Set q = colPlannings(i2)
        If Not (IsNull(p.pla_harrivee) Or IsNull(q.pla_harrivee)) Then
          If p.pla_harrivee < q.pla_harrivee Then
            bOk = p.pla_hdepart <= q.pla_harrivee
          Else
            bOk = q.pla_hdepart <= p.pla_harrivee
          End If
          If Not bOk Then
            ' Clôture impossible, chevauchement d'heures !||L'intervention sur l'établissement %1 %2 %3 de %4 à %5 chevauche l'intervention sur l'établissement %6 %7 %8 de %9 à %a."
            MsgBox2i "PL050", p.pla_etb, p.etb_prefixe, p.etb_nom, strTime(p.pla_harrivee), strTime(p.pla_hdepart), q.pla_etb, q.etb_prefixe, q.etb_nom, strTime(q.pla_harrivee), strTime(p.pla_hdepart)
            Exit Sub
          End If
        End If
      Next
    Next
  End If

  ' On valide !!!
  Dim bAvertissementDéjàAffiché As Boolean
  Dim i As Integer
  For i = 1 To lvInterventions.ListItems.count
    If lvInterventions.ListItems(i).Selected Or bSélectionJournée Then
      Set p = colPlannings(i)
      
'      If bRevalidationTotale Then
'        msdValideIntervention -1, p.pla_systeme, p.pla_serie
'      Else
      
      If IsNull(p.pla_opervalid) Then
        If Not IsNull(p.pla_datevalid) Then
          If Not bAvertissementDéjàAffiché Then
            bAvertissementDéjàAffiché = True
            If bAvecMessages Then MsgBox2i "PL044"    ' Attention, re-clôture d'un planning.|Prévenez le service facturation, tout particulièrement si vous avez effacé des interventions depuis l'annulation de clôture: ces effacements ne sont pas transmis de façon informatique à la facturation.
          End If
        End If
        
        ' Validation impossible, le planning contient des interventions sans labo
        If IsNull(colPlannings(i).pla_labo) Then
          If bAvecMessages Then MsgBox2i "PL036b"
          GoTo Continue
        End If
  
        If colPlannings(i).pla_labo = "" Then
          If bAvecMessages Then MsgBox2i "PL036b"
          GoTo Continue
        End If
  
        ' Validation impossible, le planning contient des références non affectées.
        If IsNull(colPlannings(i).pla_iref) Then
          If bAvecMessages Then MsgBox2i "PL036"
          GoTo Continue
        End If
  
        ' Si on valide à la journée, il faut que NbXX==LabXX
        If (Not bSélectionJournée) Or (NZ(p.pla_nbab) = NZ(p.pla_labab) And NZ(p.pla_nbbs) = NZ(p.pla_labbs) And NZ(p.pla_nbch) = NZ(p.pla_labch) And NZ(p.pla_nbli) = NZ(p.pla_labli) And NZ(p.pla_nbfs) = NZ(p.pla_labfs) And NZ(p.pla_nbhu) = NZ(p.pla_labhu)) Then
          msdValideIntervention iNumOpérateur, p.pla_systeme, p.pla_serie
          
          ' On modifie l'intervention en mémoire
          p.pla_datevalid = Today
          p.pla_opervalid = iNumOpérateur
          
          ' On force la relecture
          RetireCachePlanning colPlannings(i)
          
          ' On met à jour l'affichage
          AfficheUneIntervention p, i
          If lvInterventions.SelectedItem Is lvInterventions.ListItems(i) Then
            txtOperValidation = p.pla_opervalid
            txtNomOperValidation = sNomUtilisateur(p.pla_opervalid)
            txtDateValidation = p.pla_datevalid
          End If
        End If
        
      End If
    End If
Continue:
  Next
  
  AjusteEtatDeValidation j  ' Met à jour le treeview et la journée
End Sub



Private Sub cmdConnexion_Click()
  If tcps.Etat() = 7 Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Connexion
  frmConfigImprimante.InitImprimantes
End Sub

Private Sub cmdDéconnexion_Click()
  If tcps.Etat() <> 7 Then Exit Sub  ' Déjà déconnecté
  If bBlocageEnCours Then Beep: Exit Sub
  
  Déconnexion
End Sub

Private Sub cmdDernièresModifs_Click()
  InfoVersion False
End Sub

Private Sub cmdEffaceCacheInterventions_Click()
  EffaceCachePlanning
End Sub

Private Sub cmdEffacerCacheEtablissements_Click()
  EffaceCacheEtablissements
End Sub

Private Sub cmdIdentification_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim iRep As Integer
  iRep = frmLogin.iInitUtilisateur(True)
  Select Case iRep
    Case 0: ' AjusteSelonNiveauUtilisateur    (à implanter si nécessaire)
    Case 1: ' Rien (on a annulé la commande)
    Case 2: cmdSystèmeUnix_Click
  End Select
End Sub

Private Sub cmdConfigImprimante_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  frmConfigImprimante.Show vbModal
End Sub


Private Sub ImprimeIntervention(sNomDocument As String, sCmd As String, sImprimante As String, d As Date, sLettres As String)
  AssertOkDate d
  AssertOkLettres sLettres
  
  If Left(sImprimante, 5) = "[Win]" Then
    ' Impression Windows
    Select Case sCmd
      Case "IJOU":  ImpVBPlanning sLettres, d
      Case "IFP":   ImpVBFP sLettres, d
      Case "IBL":   ImpVBAP sLettres, d
      Case "IETI":  ImpVBEtiq sLettres, d
      Case Else:    MsgBox "STOP.1": Stop
    End Select
    
  Else
    ' Impression Unix
    Dim br As New Rev
    br.AddField sImprimante, sLettres, d
    Bloquer
      tcps.Envoie sCmd & " " & br.Buffer
      AttendSynchro
    Relâcher
  End If
  
End Sub


Private Sub Imprime1(sNomDocument As String, sCmd As String, sImprimante As String, iRang As Integer)
  Dim p As Intervention
  Set p = colPlannings(iRang)
  
  sbStatus.Panels("Info").Text = "Impression " & sNomDocument & " " & p.pla_lettres & p.pla_iref
  sbStatus.Refresh
  
  If Left(sImprimante, 5) = "[Win]" Then
    ' Impression Windows
  
    Select Case sCmd
      Case "I1FP":  ImpVB1FP p
      Case "I1BL":  ImpVB1AP p
      Case "I1ETI": ImpVB1Etiq p
      Case Else:    MsgBox "STOP.2": Stop
    End Select
  
  Else
    ' Impression Unix
  
    Dim br As New Rev
    br.AddField sImprimante
    br.AddField p.pla_systeme
    br.AddField p.pla_serie
      
    Bloquer
      tcps.Envoie sCmd & " " & br.Buffer
      AttendSynchro
    Relâcher
  End If
End Sub


Private Sub Imprime(sCmd As String, sImprimante As String, sNomDocument As String)
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  If Not frmConfigImprimante.bOkImprimantes() Then Beep: Exit Sub
  
  If iNiveauCourant = -1 Then
    MsgBox2i "PL008"
    Exit Sub
  End If
  
  Dim i As Integer

  Select Case iNiveauCourant
    Case 2:    ' Pour des lettres d'une journée
      If sCmd <> "IJOU" And dDateCourante >= Today + 20 Then
        MsgBox2i "PL028"    ' Vous ne pouvez pas imprimer les documents à J+20
        Exit Sub
      End If
      
      ' Si toutes les interventions sont sélectionnées, on efface la sélection
      ' de façon à ne pas protester pour l'édition des journaux et des étiquettes
      Dim bToutSélectionné As Boolean
      bToutSélectionné = True
      For i = 1 To lvInterventions.ListItems.count
        If Not lvInterventions.ListItems(i).Selected Then
          bToutSélectionné = False
          Exit For
        End If
      Next
      If bToutSélectionné Then
        For i = 1 To lvInterventions.ListItems.count
          lvInterventions.ListItems(i).Selected = False
        Next
        Set lvInterventions.SelectedItem = Nothing
      End If
      
      If lvInterventions.SelectedItem Is Nothing Then
        ' Journée complète
        Dim bARelire As Boolean, p As Intervention
        bARelire = False
        For i = 1 To colPlannings.count
          Set p = colPlannings(i)
          If IsNull(p.pla_iref) Then bARelire = True
        Next
        
        ImprimeIntervention sNomDocument, sCmd, sImprimante, dDateCourante, sLettresCourantes
        
        ' Si au moins une référence du planning n'est pas encore affectée,
        ' il faut relire la journée après l'impression, puisque msd aura affecté les références
        For i = 1 To colPlannings.count
          Set p = colPlannings(i)
          If IsNull(p.pla_iref) Then RetireCachePlanning p
        Next
      Else
        ' Interventions sélectionnées
        If sCmd = "IFP" Then
          sCmd = "I1FP"
          sNomDocument = "une fiche de prélèvement"
        ElseIf sCmd = "IBL" Then
          sCmd = "I1BL"
          sNomDocument = "un bon de livraison"
        ElseIf sCmd = "IDOC" Then
          sCmd = "I1DOC"
          sNomDocument = "un jeu de documents d'intervention"
        ElseIf sCmd = "IETI" And Left(sImprimanteEtiquettes, 5) = "[Win]" Then
          sCmd = "I1ETI"
          sNomDocument = "une partie des étiquettes échantillon"
        Else
          Dim sMessage As String
          sMessage = "L'impression partielle d'une sélection d'interventions n'est pas disponible pour les "
          If sCmd = "IJOU" Then
            sMessage = sMessage & "journaux."
          Else
            sMessage = sMessage & "étiquettes sous Unix."
          End If
          MsgBox sMessage, vbExclamation, sNomApp
          Exit Sub
        End If
        For i = lvInterventions.ListItems.count To 1 Step -1
          If lvInterventions.ListItems(i).Selected Then
            Set p = colPlannings(i)
            If IsNull(p.pla_iref) Then bARelire = True
            Imprime1 sNomDocument, sCmd, sImprimante, i
            If IsNull(p.pla_iref) Then RetireCachePlanning p
          End If
        Next
      End If
      If bARelire Then AffichePlanning dDateCourante, sLettresCourantes
    
    Case 1:    ' Toutes les lettres d'une journée
      If sCmd <> "IJOU" And dDateCourante >= Today + 20 Then
        MsgBox2i "PL028"    ' Vous ne pouvez pas imprimer les documents à J+20
        Exit Sub
      End If
      
      If Left(sImprimante, 5) <> "[Win]" Then DémonImprimeBegin sImprimante, sNomDocument
      For i = tvPlanning.SelectedItem.Child.FirstSibling.Index To tvPlanning.SelectedItem.Child.LastSibling.Index
        ImprimeIntervention sNomDocument, sCmd, sImprimante, dDateCourante, Left(tvPlanning.Nodes(i).Text, 2)
        RetireCachePlanning1JourSansRef dDateCourante, Left(tvPlanning.Nodes(i).Text, 2)
      Next
      If Left(sImprimante, 5) <> "[Win]" Then DémonImprimeEnd
  
    Case 0:    ' Tout ce qui est sélectionné
      Dim d As Date
      
      ' Contrôle des dates à J+20 pour les documents
      If sCmd <> "IJOU" Then
        For i = 2 To tvPlanning.Nodes.count
          If Left(tvPlanning.Nodes(i).Key, 1) = "J" Then
            d = CDate(Mid(tvPlanning.Nodes(i).Text, InStr(tvPlanning.Nodes(i).Text, " ") + 1))
            If d >= Today + 20 Then
              MsgBox2i "PL028"    ' Vous ne pouvez pas imprimer les documents à J+20
              Exit Sub
            End If
          Else
            ' nop
          End If
        Next
      End If
      
      If Left(sImprimante, 5) <> "[Win]" Then DémonImprimeBegin sImprimante, sNomDocument
      For i = 2 To tvPlanning.Nodes.count
        If Left(tvPlanning.Nodes(i).Key, 1) = "J" Then
          d = CDate(Mid(tvPlanning.Nodes(i).Text, InStr(tvPlanning.Nodes(i).Text, " ") + 1))
        Else
          ImprimeIntervention sNomDocument, sCmd, sImprimante, d, Left(tvPlanning.Nodes(i).Text, 2)
          RetireCachePlanning1JourSansRef d, Left(tvPlanning.Nodes(i).Text, 2)
        End If
      Next
      If Left(sImprimante, 5) <> "[Win]" Then DémonImprimeEnd
  End Select
  
  sbStatus.Panels("Info").Text = ""
End Sub


Private Sub cmdImpPlanning_Click()
  If sImprimantePlannings = "[Nul]" Then Exit Sub
  
  Dim iNbEx As Integer, i As Integer
  
  If bDemanderNbExQuandImpression Then
    Dim sRep, sQuest As String
    sQuest = sGetIntlLib("PLsNbEx", "Nombre d'exemplaires imprimer ?")
    sRep = InputBox(sQuest, , 1)
    If sRep = "" Then Exit Sub
    If Not IsNumeric(sRep) Then
      MsgBox2i "CO003", sRep
      Exit Sub
    End If
    iNbEx = sRep
    If iNbEx < 1 Or iNbEx > 5 Then
      MsgBox2i "CO003b", sRep, 1, 5
      Exit Sub
    End If
  Else
    iNbEx = 1
  End If
  
  If Left(sImprimantePlannings, 5) = "[Win]" Then
    If Not bDébutImpressionPlanningLocal(sImprimantePlannings) Then Exit Sub
  End If
  For i = 1 To iNbEx
    Imprime "IJOU", sImprimantePlannings, "Planning"
  Next
  If Left(sImprimantePlannings, 5) = "[Win]" Then
    FinImpressionPlanningLocal
  End If
End Sub


Private Sub cmdImpPlanningHebdo_Click()
  If sImprimantePlannings = "[Nul]" Then Exit Sub
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  If Not frmConfigImprimante.bOkImprimantes() Then Beep: Exit Sub
  
  If Left(sImprimantePlannings, 5) <> "[Win]" Then
    MsgBox sGetIntlLib("PLImpMess", "L'impression des plannings hebdomadaire n'est prise en charge que sur les imprimantes Windows."), vbExclamation, App.Title
    Exit Sub
  End If
  
  If iNiveauCourant = -1 Then
    MsgBox2i "PL008"
    Exit Sub
  End If
  
  Select Case iNiveauCourant
    Case 2:    ' Pour des lettres sélectionnées
      Dim i As Integer
      Dim d As Date
      Dim s As String
      
      If Not bDébutImpressionPlaHebdoLocal(sImprimantePlannings) Then Exit Sub
      s = sLettresCourantes
      For i = 2 To tvPlanning.Nodes.count
        If Left(tvPlanning.Nodes(i).Key, 1) = "J" Then
          d = CDate(Mid(tvPlanning.Nodes(i).Text, InStr(tvPlanning.Nodes(i).Text, " ") + 1))
        Else
          If d <> dAttente Then
            If Left(tvPlanning.Nodes(i).Text, 2) = s Then
              ImpVBPlaHebdo s, d
            End If
          End If
        End If
      Next
      FinImpressionPlaHebdoLocal
    
    Case Else:
     MsgBox sGetIntlLib("PLImpMessLet", "L'impression des plannings hebdomadaires n'est prise en charge que pour une sélection de lettres."), vbExclamation, App.Title
  End Select
End Sub

Private Sub cmdImpEtiq_Click()
  If sImprimanteEtiquettes = "[Nul]" Then Exit Sub
  
  Dim iNbEx As Integer, i As Integer
  
  If bDemanderNbExQuandImpression Then
    Dim sRep, sQuest As String
    sQuest = sGetIntlLib("PLsNbEx", "Nombre d'exemplaires imprimer ?")
    sRep = InputBox(sQuest, , 1)
    If sRep = "" Then Exit Sub
    If Not IsNumeric(sRep) Then
      MsgBox2i "CO003", sRep
      Exit Sub
    End If
    iNbEx = sRep
    If iNbEx < 1 Or iNbEx > 5 Then
      MsgBox2i "CO003b", sRep, 1, 5
      Exit Sub
    End If
  Else
    iNbEx = 1
  End If
  
  For i = 1 To iNbEx
    If Left(sImprimanteEtiquettes, 5) = "[Win]" Then
      If Not bDébutImpressionEtiqLocal(sImprimanteEtiquettes) Then Exit Sub
    End If
    Imprime "IETI", sImprimanteEtiquettes, "Etiquettes$etiquette.1"
    If Left(sImprimanteEtiquettes, 5) = "[Win]" Then FinImpressionEtiqLocal
  Next
End Sub

Private Sub cmdImpFP_Click()
  If sImprimanteFP = "[Nul]" Then Exit Sub
  If Left(sImprimanteFP, 5) = "[Win]" Then
    If Not bDébutImpressionFPLocal(sImprimanteFP) Then Exit Sub
  End If
  Imprime "IFP", sImprimanteFP, "Fiches de prélèvement"
  If Left(sImprimanteFP, 5) = "[Win]" Then FinImpressionFPLocal
End Sub

Private Sub cmdImpAP_Click()
  If sImprimanteAP = "[Nul]" Then Exit Sub
  If Left(sImprimanteAP, 5) = "[Win]" Then
    If Not bDébutImpressionAPLocal(sImprimanteAP) Then Exit Sub
  End If
  Imprime "IBL", sImprimanteAP, "Avis de passage"
  If Left(sImprimanteAP, 5) = "[Win]" Then FinImpressionAPLocal
End Sub

Private Sub cmdImpDoc_Click()
  If sImprimanteDocuments = "[Nul]" Then Exit Sub
  If Left(sImprimanteDocuments, 5) = "[Win]" Then
    MsgBox sGetIntlLib("PLImpMessDispo", "L'impression Windows des documents n'est pas encore disponible."), vbCritical, App.Title
    Exit Sub
  End If
  Imprime "IDOC", sImprimanteDocuments, "Documents"
End Sub



Private Sub cmdImpEtiqIE_Click()
  If sImprimanteEtiquettes = "[Nul]" Then Exit Sub
  
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  If Not frmConfigImprimante.bOkImprimantes() Then Beep: Exit Sub
  
  frmImpEtiqIE.Show vbModal
End Sub

Private Sub cmdImpFPVierges_Click()
  If sImprimantePlannings = "[Nul]" Then Exit Sub
  If Left(sImprimanteFP, 5) <> "[Win]" Then Exit Sub
  
  Dim iNbEx As Integer, i As Integer
  
  Dim sRep, sQuest As String
  sQuest = sGetIntlLib("PLsNbEx", "Nombre de FP vierges (1 à 50) ?")
  sRep = InputBox(sQuest, , "2")
  If sRep = "" Then Exit Sub
  If Not IsNumeric(sRep) Then
    MsgBox2i "CO003", sRep
    Exit Sub
  End If
  iNbEx = sRep
  If iNbEx < 1 Or iNbEx > 50 Then
    MsgBox2i "CO003b", sRep, 1, 50
    Exit Sub
  End If
  
  If Not bDébutImpressionFPLocal(sImprimanteFP) Then Exit Sub
  ImpVBFPVierge iNbEx
  FinImpressionFPLocal
End Sub


'========================================================
' Opérations sur interventions

Public Function bContrôlesPréalableAjout(dDatePlanning As Date) As Boolean
  bContrôlesPréalableAjout = False
  If dDatePlanning < Now - MaxJoursPassé Then
    MsgBox2i "PL021"                ' Vous ne pouvez pas créer un planning plus de 1 mois avant la date courante
    If Not bShiftPressed Then Exit Function
  End If
  If dDatePlanning > Now + 60 Then
    MsgBox2i "PL021"                ' Vous ne pouvez pas créer un planning plus de 60 jours après la date courante
    If Not bShiftPressed Then Exit Function
  End If
  
  If Not bContrôleClôtureMensuelle(dDatePlanning) Then
    MsgBox2i "PL108", Format(dPremierJourNonClôt, "short date")   ' Période close pour les plannings
    If Not bShiftPressed Then Exit Function
  End If
  
  bContrôlesPréalableAjout = True
End Function


Private Sub cmdAjouter_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If iNiveauCourant <> 2 Then
    MsgBox2i "PL012"
    Exit Sub
  End If
  
  If Not bContrôlesPréalableAjout(dDateCourante) Then Exit Sub
  
  ' Initialisation du planning à créer
  Dim u As Utilisateur
  Set u = UtiParLettres(sLettresCourantes)
  Dim p As New Intervention
  InitialiseIntervention u, p
  
  frmAjoutIntervention.AfficheFeuille p
  
  ' On met à jour le treeview et la journée
  Dim j As Journee
  Set j = colJournées.LitJournée(dDateCourante, sLettresCourantes)
  AjusteEtatDeValidation j
End Sub


' Initialisation d'ine intervention "vierge" !
Private Sub InitialiseIntervention(u As Utilisateur, p As Intervention)
  p.pla_systeme = cSystèmeCA
  p.pla_serie = 0     ' Nouveau
  p.pla_lettres = sLettresCourantes
  p.pla_dateplan = dDateCourante
  If u Is Nothing Then
    p.pla_pers = 0
  ElseIf Left(u.uti_nom, 1) = "!" Then
    p.pla_pers = 0
  Else
    p.pla_pers = u.uti_numuti
  End If
  If Not IsNull(iUnitéDéfaut(sLettresCourantes)) Then
    p.pla_unite = iUnitéDéfaut(sLettresCourantes)
  Else
    p.pla_unite = 0
  End If
  p.pla_operbl = Null
  p.pla_tsbl = Null
  p.pla_operfp = Null
  p.pla_tsfp = Null
  
  ' On initialise proprement les infos de validation !
  p.pla_datevalid = Null
  p.pla_opervalid = Null
End Sub


Private Sub cmdModifier_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If iNiveauCourant <> 2 Or lvInterventions.SelectedItem Is Nothing Then
    MsgBox2i "PL026"
    Exit Sub
  End If
  
  Dim p As Intervention
  Set p = colPlannings(lvInterventions.SelectedItem.Index)
  
'  If Not IsNull(p.pla_opervalid) Then
'    MsgBox2i "PL011"    ' La prestation est validée, opération interdite.
'    Exit Sub
'  End If
  
  frmAjoutIntervention.AfficheFeuille p
End Sub


' Ajout d'une fiche tournée complète
Private Sub cmdAjouterFT_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If iNiveauCourant <> 2 Then
    MsgBox2i "PL012"
    Exit Sub
  End If
  
  If Not bContrôlesPréalableAjout(dDateCourante) Then Exit Sub
  
  ' Initialisation du planning à créer
  Dim u As Utilisateur
  Dim p As New Intervention
  Set u = UtiParLettres(sLettresCourantes)
  InitialiseIntervention u, p
  
  frmAjoutFT.AfficheFeuille p
  
  ' On met à jour le treeview et la journée
  Dim j As Journee
  Set j = colJournées.LitJournée(dDateCourante, sLettresCourantes)
  AjusteEtatDeValidation j
End Sub


Private Sub cmdOptions_Click()
  frmOptions.Show vbModal
  DoOptionsAffichage
End Sub


Private Sub DoOptionsAffichage()
  mnuSystème.Visible = bAfficherMenuSystème
  Dim vOff As Integer
  If bAfficherBarreDeBoutons Then
    vOff = tbBoutons.height
  Else
    vOff = 0
  End If

  If bAfficherBarreDeBoutons Then
    tvPlanning.Top = 32
    lvInterventions.Top = 31
    tbBoutons.Visible = True
    tvPlanning.height = 174 + ScaleHeight - 454 - vOff - 30
    lvInterventions.height = 174 + ScaleHeight - 454 - vOff + 2 - 30
    
    Line (0, vOff)-Step(ScaleWidth, 0), vbButtonShadow
    Line (0, vOff + 1)-Step(ScaleWidth, 0), vb3DHighlight
  Else
    tbBoutons.Visible = False
    tvPlanning.Top = 6
    lvInterventions.Top = 5
    tvPlanning.height = 174 + ScaleHeight - 454 - 30
    lvInterventions.height = 174 + ScaleHeight - 454 + 2 - 30
  End If
End Sub

Private Sub cmdPlanningsNonValidés_Click()
  Dim sMsg As String
  sMsg = sGetIntlLib("PLsPlanNonClos", "Plannings non validés (J-3 à J-20)")
  DoLecture sNormaliseQuery(Today - 20, "d") & ":" & sNormaliseQuery(Today - 3, "d"), "", "", "", "", False, 2, sMsg
End Sub

Private Sub cmdSupprimer_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If iNiveauCourant < 2 Then
    MsgBox2i "PL010"
    Exit Sub
  End If
  
  If lvInterventions.SelectedItem Is Nothing Then
    Dim iRep As Integer, sQuest As String
    sQuest = sGetIntlLib("PLsEffaceJournée", "Vous allez effacer une journée complète.||Confirmez-vous cette opération ?")
    iRep = MsgBox(sQuest, vbOKCancel + vbDefaultButton2 + vbQuestion)
    If iRep = vbCancel Then Exit Sub
  End If
  
  Dim p As Intervention
  Dim i As Integer
  
  Dim bSélectionJournée As Boolean
  bSélectionJournée = True
  For i = 1 To lvInterventions.ListItems.count
    If lvInterventions.ListItems(i).Selected Then
      bSélectionJournée = False
      Exit For
    End If
  Next

  For i = lvInterventions.ListItems.count To 1 Step -1
    If bSélectionJournée Or lvInterventions.ListItems(i).Selected Then
    
      Set p = colPlannings(i)
    
      If Not IsNull(p.pla_opervalid) Then
        MsgBox2i "PL011"    ' La prestation est validée, opération interdite.
        Exit Sub
      End If
      
      If Not IsNull(p.pla_labab) Or Not IsNull(p.pla_labbs) Or Not IsNull(p.pla_labli) Or Not IsNull(p.pla_labfs) Or Not IsNull(p.pla_labhu) Or Not IsNull(p.pla_labch) Then
        If vbNo = MsgBox2iYesNo("PL011b") Then Exit Sub
        'OPPL03: Effacement d'une prestation alors que la saisie labo a commencé (déconseillé)
        If Not bOkAccèsPrivilégié(p.pla_lettres & p.pla_iref, "OPPL03") Then Exit Sub
      End If
    
      lvInterventions.ListItems.Remove i
      colPlannings.Remove i
      
      Dim br As New Rev
      br.Clear
      br.AddField p.pla_systeme
      br.AddField p.pla_serie
      Bloquer
        tcps.Envoie "SPLA " & br.Buffer
          
        Dim sLigne As String
        sLigne = tcps.Reçoit
        If Left(sLigne, 2) = "->" Then MsgBox "STOP.3": Stop
        
        Dim iNbDel As Integer
        br.Buffer = sLigne
        br.GetField iNbDel
        If iNbDel <> 1 Then MsgBox "STOP.4": Stop
        
        ' On consomme le prompt de fin
        sLigne = tcps.Reçoit
        If Left(sLigne, 2) <> "->" Then MsgBox "STOP.5": Stop
      Relâcher
    End If
  Next
    
  If lvInterventions.ListItems.count = 0 Then
    Set lvInterventions.SelectedItem = Nothing
    EffaceInformationsIntervention
  Else
    lvInterventions.SelectedItem.Selected = True
  End If
  AfficheLibelléInterventions ' Nb d'interventions sélectionnées
  
  ' On met à jour le treeview et la journée
  Dim j As Journee
  Set j = colJournées.LitJournée(dDateCourante, sLettresCourantes)
  AjusteEtatDeValidation j
End Sub


Private Sub Déplacer1(iListIndex As Integer, p As Intervention, sLettres As String, dCible As Date)
  ' On effectue le déplacement
  
  ' Si la saisie labo a commencé, le changement de lettre est une op privilégiée
  If p.pla_lettres <> sLettres Then
    If NZ(p.pla_labab) + NZ(p.pla_labbs) + NZ(p.pla_labli) + NZ(p.pla_labfs) + NZ(p.pla_labhu) + NZ(p.pla_labch) > 0 Then
      'OPPL04: Changement de lettres alors que la saisie labo a commencé (déconseillé)
      If Not bOkAccèsPrivilégié(p.pla_lettres & p.pla_iref, "OPPL04") Then Exit Sub
    End If
  End If

  ' On conserve la date d'origine, mais pas la date d'attente
  If p.pla_dateplan <> dAttente Then p.pla_dateorigine = p.pla_dateplan
  
  p.pla_dateplan = dCible
  p.pla_lettres = sLettres
  EcritPlanning p                       ' Gère le cache correctement
  
  ' Mise à jour de la collection et de la listbox
  lvInterventions.ListItems.Remove iListIndex
  frmPlanning.colPlannings.Remove iListIndex
End Sub


Private Sub cmdDéplacer_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If iNiveauCourant <> 2 Then
    MsgBox2i "PL035"
    Exit Sub
  End If
  
  
  Dim p As Intervention
  frmDéplaceIntervention.AfficheFeuille dDateCourante, sLettresCourantes, lvInterventions.SelectedItem Is Nothing
  
  If frmDéplaceIntervention.txtLettres <> "" Then
    Dim dCible As Date, sLettres As String
    dCible = dDécodeDate(frmDéplaceIntervention.txtDate.DateSaisie)
    sLettres = UCase(frmDéplaceIntervention.txtLettres)
    
    ' On lit les caractéristiques du planning de destination
    ' de façon à homogénéiser en fin de transfert
    Dim sReq As String
    Dim aj As New AccJournee
    Dim j As Journee
    sReq = "pla_dateplan$" & sNormaliseQuery(dCible, "d") & "$pla_lettres$" & sLettres
    aj.RechercheJournee sReq
    If aj.count = 0 Then
      Set j = Nothing
    Else
      Set j = aj.Item(1)
    End If
    
    Dim bMsgAffiché As Boolean  ' Message indiquant qu'on ne peut pas déplacer une intervention validée déjà affiché
    Dim bBypass As Boolean      ' Mode forcé pour PV
    bMsgAffiché = False
    bBypass = False
    
    If lvInterventions.SelectedItem Is Nothing Then  ' Déplacement de la journée
      For Each p In colPlannings
        If bBypass = False And p.bValidé Then
          If Not bMsgAffiché Then MsgBox2i "PL011"    ' Le planning est validé, opération interdite.
          If bShiftPressed And iNumOpérateur = 46 Then
            bBypass = True
            GoTo Ok1
          End If
          bMsgAffiché = True
        Else
Ok1:      Déplacer1 1, p, sLettres, dCible
        End If
      Next
    Else  ' Déplacement des interventions sélectionnées
      Dim i As Integer
      For i = lvInterventions.ListItems.count To 1 Step -1
        If lvInterventions.ListItems(i).Selected Then
          Set p = colPlannings(i)
          If bBypass = False And p.bValidé Then
            If Not bMsgAffiché Then MsgBox2i "PL011"    ' Le planning est validé, opération interdite.
            bMsgAffiché = True
            If bShiftPressed And iNumOpérateur = 46 Then
              bBypass = True
              GoTo Ok2
            End If
          Else
Ok2:        Déplacer1 i, p, sLettres, dCible
          End If
        End If
      Next
    End If
    
    ' Homogénéïsation des paramètres du planning de destination
    If Not j Is Nothing Then msdModifierJournée j
  End If
End Sub


' On détermine la référence
' Peut être appelé par la commande "Générer les références" ou par l'impression des FP en VB
' Le cas p.pla_systeme="" correspond à l'impression Windows de planches d'IE
Public Sub GénèreUneRéférence(p As Intervention)
  If p.pla_systeme <> "" Then RetireCachePlanning p
  p.pla_iref = msdAffecteRef(p.pla_systeme, p.pla_serie)
  If p.pla_systeme <> "" Then AjouteCachePlanning p
End Sub


Private Sub cmdGénèreRéférence_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If iNiveauCourant <> 2 Then
    MsgBox2i "PL027"    ' Sélectionnez au préalable une journée avant de générer les références.
    Exit Sub
  End If
  
  If bPlanningClôt() Then Exit Sub
  
  Dim p As Intervention, iRang As Integer, iNbRefAffectées As Integer
  iNbRefAffectées = 0
  For iRang = 1 To lvInterventions.ListItems.count
    Set p = colPlannings(iRang)
    If Not IsNull(p.pla_labo) Then
      If IsNull(p.pla_iref) Then
        GénèreUneRéférence p
        
        ' Mise à jour de la collection
        colPlannings.Remove iRang
        If iRang = 1 Then
          If frmPlanning.colPlannings.count = 0 Then
            frmPlanning.colPlannings.Add p
          Else
            frmPlanning.colPlannings.Add p, , 1
          End If
        Else
          colPlannings.Add p, , , iRang - 1
        End If
        
        ' Mise à jour de la liste
        AfficheUneIntervention p, iRang
        AfficheLibelléInterventions
        
        iNbRefAffectées = iNbRefAffectées + 1
      End If
    End If
  Next
  If iNbRefAffectées = 0 Then
    MsgBox2i "PLA028"    ' Aucune référence n'a été générée. Vérifiez le planning.
  Else
    EffaceInformationsIntervention
  End If
End Sub



'========================================================
' Menu Recherche

Private Sub mnuRecherche_Click()
  Dim bVisible As Boolean
  bVisible = iNumOpérateur = 46 Or iNumOpérateur = 532 Or iNumOpérateur = 152 Or _
    iNumOpérateur = 274 Or iNumOpérateur = 999 Or iNumOpérateur = 133 Or _
    iNumOpérateur = 52 Or iNumOpérateur = 1356  ' FF + PC
  cmdCléOpPrivilégiée.Enabled = bVisible
End Sub

Private Sub cmdRechEtablissement_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim e As Etablissement, c As Collection
  Set c = frmRechercheEtablissement.Cherche2()
'  Dim sMessage As String
  For Each e In c
'    sMessage = sMessage & vbCrLf & e.etb_numetb & ": " & e.etb_prefixe & " " & e.etb_nom
    frmZoomEtb.ShowInfo e.etb_numetb
  Next
'  If sMessage <> "" Then
'    Dim sMsg As String
'    sMsg = sGetIntlLib("PLsRechEtb", "Établissement(s) sélectionné(s) :")
'    MsgBox sMsg & sMessage, vbInformation, sNomApp
'  End If
End Sub

Private Sub cmdRechUtilisateur_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim u As Utilisateur
  Set u = frmRechercheUtilisateur.Cherche()
  If Not u Is Nothing Then
    Dim sMsg As String
    sMsg = sGetIntlLib("PLsRechUti", "Utilisateur sélectionné :")
    MsgBox sMsg & " " & u.uti_numuti & ": " & u.uti_nom, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechUnité_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim u As Unite
  Set u = frmRechercheUnité.Cherche()
  If Not u Is Nothing Then
    Dim sMsg As String
    sMsg = sGetIntlLib("PLsRechUni", "Unité sélectionnée :")
    MsgBox sMsg & " " & u.uni_numunite & ": " & u.uni_code, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechLettres_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim l As String
  l = frmRechercheLettres.Cherche()
  If l <> "" Then
    Dim sMsg As String
    sMsg = sGetIntlLib("PLsRechLet", "Lettres sélectionnées :")
    MsgBox sMsg & " " & l, vbInformation, sNomApp
  End If
End Sub


Private Sub cmdRechDate_Click()
  Dim d As String
  d = frmRechercheDate.Cherche(Now)
  If d <> "" Then
    Dim sMsg As String
    sMsg = sGetIntlLib("PLsRechDat", "Date sélectionnée :")
    MsgBox sMsg & " " & Format(d, "short date"), vbInformation, sNomApp
  End If
End Sub

Private Sub cmdSystèmeUnix_Click()
  If bBlocageEnCours Then Beep: Exit Sub

  Dim sOldSystème As String
  sOldSystème = sSystèmeDistant
  
restart:
  frmConfigUnix.Show vbModal
  If sSystèmeDistant <> sOldSystème Then
    frmSplash.Show
    frmSplash.Refresh
    
    EffaceInformations
    Déconnexion
    frmLogin.EffaceCacheMotsDePasse
    iOldEtat = 0    ' Force l'affichage de la mise à jour de l'état

    Connexion
    Unload frmSplash
    
    frmSplash.Hide
    Select Case frmLogin.iInitUtilisateur(False)
      Case 1:       ' Annuler
        MsgBox2i "CO025"
        Unload Me     ' Sans risque, on sait que tous les RA sont fermés
        Exit Sub
      
      Case 0:       ' Ok
        
      Case 2:       ' Changement de système Unix
        GoTo restart
    End Select

    frmConfigUnix.MémoriseSystèmeDistant
    frmConfigImprimante.InitImprimantes
    
    dPremierJourNonClôt = Empty
  End If

End Sub


Private Sub cmdCléOpPrivilégiée_Click()
  frmCalculCléPrivilégiée.Show vbModal
End Sub



' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Code global de la feuille

' Style visuel XP
Private Sub Form_Initialize()
  Dim x As Long
  x = InitCommonControls
End Sub

Private Sub Form_Load()
  Dim bPremierLancement As Boolean
  Dim sBienvenue As String
  
  ' Internationalisation
  IntlInit
  Internationalisation
  
  If App.PrevInstance Then
    'If InStr(Command, "-h") = 0 Then MsgBox2i "CO024", sNomApp
    sNomOpérateur = GetSetting(sApplicationGlobale, "Utilisateur", "Nom", "")
    On Error Resume Next
    AppActivate sNomApp & " [" & sNomOpérateur & "]"
    EmergencyExit
  End If
  
  Set frmBase = frmPlanning
  frmPlanning.Caption = sNomApp
  
  CommandesInitiales
  
  ContrôleDernièreVersion   ' On vérifie qu'il n'y a pas plus récent sur Z
  ContrôleEnvironnement     ' On vérifie que l'environnement du programme est Ok
  
  frmOptions.InitOptions
  If GetSetting(sApplicationGlobale, "Options", "FenêtreTCP", 0) Then
    cmdTCPFenetre.Checked = True
    tcps.AfficheTrace True
  End If
  
  If bDemanderNbExQuandImpression Then
    cmdImpPlanning.Caption = cmdImpPlanning.Caption & "…"
    cmdImpEtiq.Caption = cmdImpEtiq.Caption & "…"
  End If
  
  ' On met les frames en tête de pile d'affichage, sinon certains sont derrière le tsTab
  Dim F As Frame
  For Each F In fraFeuille
    F.ZOrder 0
  Next
  
  iCurFrame = -1   ' Pour forcer le passage à la page 0
  Page "Intervention"
  EffaceInformations
  
  ' Initialisation de collections
  InitInfoConsultants
  
  ' On centre la fenêtre
  Move (Screen.Width - Width) / 2, (Screen.height - height) / 2
  Form_Resize
  Show
  
  AppActivate Caption   ' Au cas où on lance avec la touche shift pressée
  DoOptionsAffichage
  
  If GetSetting(sApplicationGlobale, "Utilisateur", "Nom", "") = "" Then bPremierLancement = True
    
  If bPremierLancement Then
    Do
      frmSplash.lblChargement.Visible = False
      frmSplash.lblBienvenue.Visible = True
      
      sBienvenue = sGetIntlLib("sBienvenue", "Bienvenue !") & vbCrLf & vbCrLf
      frmSplash.lblBienvenue = sBienvenue
      frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("sBienvenue1", "") & vbCrLf
      frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("sBienvenue2", "") & vbCrLf & vbCrLf
      frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("sBienvenue3", "")
      
      frmSplash.Width = 7035
      frmSplash.height = 3700
      
      Dim cSauveLangage As String
      cSauveLangage = cLangage
      frmSplash.Show vbModal
    Loop Until cSauveLangage = cLangage
    frmSplash.btnLangue.Visible = False
  Else
    Enabled = False
    frmSplash.Show
    frmSplash.btnOK.Enabled = False
    frmSplash.btnAide.Enabled = False
    frmSplash.btnLangue.Enabled = False
    frmSplash.Refresh
  End If

  frmConfigUnix.InitSystème
  If sSystèmeDistant = "" Then
    MsgBox2i "CO037"
    EmergencyExit
  End If

  ' On se connecte…
  Connexion
  frmConfigUnix.MémoriseSystèmeDistant

  ' Connexion
  Select Case frmLogin.iInitUtilisateur(False)
    Case 0:   ' Ok
    
    Case 1:   ' Annuler
      MsgBox2i "CO025"
      EmergencyExit
      
    Case 2:   ' Changement de système Unix
      cmdSystèmeUnix_Click
  End Select
  
  ' Si le cache de messages internationaux n'existe pas, on le charge
  ' et on remet à jour l'interface
  If bIntlInitCache Then Internationalisation

  ' AjusteSelonNiveauUtilisateur
  
'  If bPremierLancement Then
'    frmSplash.lblChargement.Visible = False
'    frmSplash.lblBienvenue.Visible = True
'
'    frmSplash.lblBienvenue = sBienvenue
'    frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("PLsBienvenueI1", "") & vbCrLf
'    frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("PLsBienvenueI2", "") & vbCrLf & vbCrLf
'    frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("PLsBienvenueI3", "")
'
'    frmSplash.Width = 7035
'    frmSplash.height = 3700
'    frmSplash.Show vbModal
'  End If

  ' On lit le nom des deux iprimantes dans la registry
  frmConfigImprimante.InitImprimantes
  If sImprimanteDocuments = "" Or sImprimantePlannings = "" Or sImprimanteEtiquettes = "" Or sImprimanteAP = "" Or sImprimanteFP = "" Then
    MsgBox2i "CO039"
    EmergencyExit
    End
  End If
  
'  If bPremierLancement Then
'    frmSplash.lblChargement.Visible = False
'    frmSplash.lblBienvenue.Visible = True
'    frmSplash.lblBienvenue = sBienvenue
'    frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("sBienvenue4", "Fin de l'initialisation")
'    frmSplash.Width = 7035
'    frmSplash.height = 3700
'    frmSplash.Show vbModal
'  End If

  ' Installation automatique de l'agent
  ' supprimé le 26/01/99, inutile
  'frmInstallAgent.AutoInstallAgent
  
  ' Fin du chargement
  Enabled = True
  Unload frmSplash
  iNiveauCourant = -1 ' Pas de planning sélectionné
  
  ' On affecte l'image list
  lvInterventions.SmallIcons = frmLogo.ilProprio
  
  ' Affichage des informations sur la nouvelle version
  InfoVersion True
End Sub


' Changement d'onglet avec PgPrec/PgSuiv
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyPageUp Then
    If tsTab.SelectedItem.Index > 1 Then Page tsTab.SelectedItem.Index - 1
  ElseIf KeyCode = vbKeyPageDown Then
    If tsTab.SelectedItem.Index < tsTab.Tabs.count Then Page tsTab.SelectedItem.Index + 1
  ElseIf KeyCode = vbKeyDelete Then
    cmdSupprimer_Click
  End If
End Sub



Private Sub InfoVersion(bDémarrage As Boolean)
  Dim sVersionInfo As String, sVersionProgramme As String
  Dim sInfo As String
  
  sVersionInfo = GetSetting(sApplicationGlobale, "Général", "VersionInfo", "")
  sVersionProgramme = App.Major & "." & App.Minor & "." & App.Revision
  If Not bDémarrage Or sVersionProgramme <> sVersionInfo Then
    Select Case App.Revision
      Case 90:
        sInfo = "L'affichage des informations a été modifié pour éviter un écran trop encombré, mais l'utilisation du programme n'a pas changé." & vbCrLf & vbCrLf & _
          "Nouveautés: l'heure de début et de fin d'intervention pour chaque établissement, et l'heure et le kilométrage de début et de fin de tournée pour chaque planning."
      Case 91:
        sInfo = "Le problème de l'impression des plannings après avoir sélectionné un établissement puis une journée est réglé."
      Case 159:
        sInfo = "Désormais quand on ajoute un établissement à un planning, le nombre de BS, de FS, de chimies et d'EH est automatiquement rempli à partir des nouveaux champs du fichier établissement." & vbCrLf & vbCrLf & "Si les valeurs sont incorrectes (ou tout simplement pas remplies), signalez-le à la DOP (sevcau@silliker ou patrick.dieu@silliker)"
    End Select

    If sInfo <> "" Then MsgBox2i "PL104", sVersionProgramme, sInfo, sVersionProgramme
                        'MsgBox "Informations sur la version " & sVersionProgramme & vbCrLf & vbCrLf & sInfo, vbInformation, "Plannings version " & sVersionProgramme
    If sVersionProgramme <> sVersionInfo Then SaveSetting sApplicationGlobale, "Général", "VersionInfo", sVersionProgramme
  End If
  
End Sub

Private Sub Form_Resize()
  If ScaleHeight < 250 Or ScaleWidth < 250 Then Exit Sub
  Dim vOff As Integer
  If bAfficherBarreDeBoutons Then
    vOff = tbBoutons.height
  Else
    vOff = 0
  End If
  
  ' Sécurité élémentaire…
  On Error Resume Next
  
  ' On retaille les listes
  If ScaleHeight > 350 Then
    If ScaleWidth - lvInterventions.Width - 3 > 0 Then
      lvInterventions.Width = ScaleWidth - lvInterventions.Left - 3
    End If
    
    tvPlanning.height = 174 + ScaleHeight - 454 - vOff - 30
    lvInterventions.height = 174 + ScaleHeight - 454 - vOff + 2 - 30
    
    imgSplitter.Top = tvPlanning.Top
    imgSplitter.height = tvPlanning.height
  End If

  ' On retaille le tabstrip…
  tsTab.Move 2, ScaleHeight - 304, ScaleWidth - 4, 247
  txtInfo.Move 2, ScaleHeight - 54, ScaleWidth - 4, 34
  
  ' Puis les frames contenant les contrôles
  Dim F As Frame, W As Integer
  For Each F In fraFeuille
    F.Move tsTab.ClientLeft + 2, tsTab.ClientTop + 6, tsTab.ClientWidth - 2, tsTab.ClientHeight - 4
  Next
  W = fraFeuille(1).Width * Screen.TwipsPerPixelX
  
  ' Contrôles de l'onglet journée
  picJournée.Width = W - 3 * 20
  DessinePicJournée
End Sub

Private Sub Form_Paint()
  Line (0, 0)-Step(ScaleWidth, 0), vbButtonShadow
  Line (0, 1)-Step(ScaleWidth, 0), vb3DHighlight
  
  If (bAfficherBarreDeBoutons) Then
    Dim vOff As Integer
    If bAfficherBarreDeBoutons Then
      vOff = tbBoutons.height
    Else
      vOff = 0
    End If

    Line (0, vOff)-Step(ScaleWidth, 0), vbButtonShadow
    Line (0, vOff + 1)-Step(ScaleWidth, 0), vb3DHighlight
  End If
End Sub


' ===============================================================================
' Gestion du splitter

Private Sub imgSplitter_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  With imgSplitter
      picSplitter.Move .Left, .Top, .Width \ 2, .height
  End With
  picSplitter.Visible = True
  mbMoving = True
End Sub


Private Sub imgSplitter_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
  Dim sglPos As Single
  

  If mbMoving Then
      sglPos = x / Screen.TwipsPerPixelX + imgSplitter.Left
      If sglPos < sglSplitLimit Then
          picSplitter.Left = sglSplitLimit
      ElseIf sglPos > Me.ScaleWidth - sglSplitLimit Then
          picSplitter.Left = Me.ScaleWidth - sglSplitLimit
      Else
          picSplitter.Left = sglPos
      End If
  End If
End Sub


Private Sub imgSplitter_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  picSplitter.Visible = False
  mbMoving = False
  
  tvPlanning.Width = picSplitter.Left - tvPlanning.Left
  Dim c2 As Integer
  c2 = tvPlanning.Left + tvPlanning.Width + 4
  imgSplitter.Left = c2 - 4
  lvInterventions.Move c2, lvInterventions.Top, ScaleWidth - c2 - 8
End Sub


' ===============================================================================

Private Function bPlanningClôt() As Boolean
  bPlanningClôt = False
  Dim j As Journee
  Set j = colJournées.LitJournée(dDateCourante, sLettresCourantes)
  If j Is Nothing Then Exit Function
  ' Erreur, donc colJournee(1) n'existe pas, donc nouveau planning, donc non clôt !
  
  If j.iValidation = 2 Then
    MsgBox2i "PL011"    ' Le planning est validé, opération interdite.
    bPlanningClôt = True
    Exit Function
  End If
End Function

Private Sub cmdAPropos_Click()
  frmAPropos.Show vbModal
End Sub

Private Sub cmdNouveauPlanning_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  frmNouveauPlanning.Show vbModal
End Sub

Private Sub cmdRelâcher_Click()
  Relâcher
End Sub

Private Sub cmdLire_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  frmLecturePlanning.DoFormRecherche False
End Sub

Private Sub cmdLireAvancé_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  frmLecturePlanning.DoFormRecherche True
End Sub

Sub EffaceInformationsIntervention()
  txtNumetb = ""
  txtPréfixe = ""
  txtNomEtb = ""
  txtRéférence = ""
  txtComment = ""
  txtPers = ""
  txtNomPers = ""
  txtUnité = ""
  txtNomUnité = ""
  txtNbAB = ""
  txtNbBS = ""
  txtNbLi = ""
  txtNbFS = ""
  txtNbCh = ""
  txtNbHu = ""
  txtLabAB = ""
  txtLabBS = ""
  txtLabLi = ""
  txtLabFS = ""
  txtLabCh = ""
  txtLabHu = ""
  txtNbEH = ""
  txtTSBL = ""
  txtOperBL = ""
  txtNomOperBL = ""
  txtTSFP = ""
  txtOperFP = ""
  txtNomOperFP = ""
  txtHeureArrivée.HeureSaisie = ""
  txtHeureDépart.HeureSaisie = ""
  txtTypePrestation = ""
  txtCodeActivité = ""
  txtCodeClient = ""
'  txtDateOrigine = ""
  txtDateValidation = ""
  txtOperValidation = ""
  txtNomOperValidation = ""
  lblTrEtatDocMin = ""
  lblTrEtatDocMax = ""
  lblTrEtatFac = ""
  lblTabEch(0) = ""
  lblTabEch(1) = ""
End Sub


' Dessine l'échelle des interventions de la journée
Private Sub InitialisePicJournée()
  Dim i As Integer, sMsg As String
  
  ' Définition de l'échelle du dessin de la journée
  picJournée.Scale (-0.5, 4)-(24.5, -4)
  picJournée.Cls
  picJournée.FontSize = 7
  picJournée.Line (0, 0)-(24, 0)
  For i = 0 To 24
    picJournée.Line (i, 0)-Step(0, 1)
    sMsg = Format(i) '& "h"
    picJournée.CurrentX = i - picJournée.TextWidth(sMsg) / 2
    picJournée.CurrentY = -1
    picJournée.Print sMsg;
  Next
End Sub


Private Sub DessinePicJournée()
  InitialisePicJournée
  
  Dim j As Journee
  Set j = colJournées.LitJournée(dDateCourante, sLettresCourantes)
  If Not j Is Nothing Then
    If Not IsNull(j.iHeureDébut) Then
      picJournée.Line (j.iHeureDébut \ 100 + (j.iHeureDébut Mod 100) / 60, 0.5)-(j.iHeureFin \ 100 + (j.iHeureFin Mod 100) / 60, 3.5), RGB(190, 190, 235), BF
      picJournée.Line (j.iHeureDébut \ 100 + (j.iHeureDébut Mod 100) / 60, 0.5)-(j.iHeureFin \ 100 + (j.iHeureFin Mod 100) / 60, 3.5), 0, B
    End If
  End If
  
  Dim i As Intervention
  If Not colPlannings Is Nothing Then
    For Each i In colPlannings
      If Not IsNull(i.pla_harrivee) Then
        picJournée.Line (i.pla_harrivee \ 100 + (i.pla_harrivee Mod 100) / 60, 1)-(i.pla_hdepart \ 100 + (i.pla_hdepart Mod 100) / 60, 3), RGB(0, 0, 128), BF
        picJournée.Line (i.pla_harrivee \ 100 + (i.pla_harrivee Mod 100) / 60, 1)-(i.pla_hdepart \ 100 + (i.pla_hdepart Mod 100) / 60, 3), RGB(255, 255, 255), B
      End If
    Next
  End If
End Sub


Private Sub EffaceInformations()
  tvPlanning.Nodes.Clear
  lvInterventions.ListItems.Clear
  lblTêteTout = sGetIntlLib("PLmsgNoSel", "Aucune sélection")
  lblSélectionTout = ""
  lblSélectionJournée = sGetIntlLib("PLmsgNoJSel", "Aucune journée sélectionnée")
  txtDateJournée.DateSaisie = ""
  InitialisePicJournée
  lblSélectionPlanning = sGetIntlLib("PLmsgNoPSel", "Aucun planning sélectionné")
  txtDatePlanning.DateSaisie = ""
  txtLettresPlanning = ""
  txtNomPlanning = ""
  iNiveauCourant = 0
  dDateCourante = #1/1/1900#
  sLettresCourantes = ""
  EffaceInformationsIntervention
  EffaceInformationsPlanning
End Sub


Public Sub DoLecture(p_sDate As String, p_sLettres As String, p_sRéférence As String, p_sNumetb As String, p_sPréfixe As String, bLettresGéréesUniquement As Boolean, iClôt As Integer, sTitreArbre As String)
  Dim sReq As String
  
  If p_sDate = "" And p_sLettres = "" And p_sRéférence = "" And p_sNumetb = "" Then
    MsgBox2i "PL001"
    Exit Sub
  End If
  
  ' On fabrique le query global
  If p_sDate <> "" Then
    sReq = "pla_dateplan$" & sNormaliseQuery(p_sDate, "d")
  End If
  
  If p_sLettres <> "" Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "pla_lettres$" & sNormaliseQuery(p_sLettres, "l")
  End If
  
  If p_sRéférence <> "" Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "pla_iref$" & sNormaliseQuery(p_sRéférence, "n")
  End If
  
  If p_sNumetb <> "" Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "pla_etb$" & sNormaliseQuery(p_sNumetb, "a")
  End If
  
  If p_sPréfixe <> "" Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "etb_prefixe$" & sNormaliseQuery(p_sPréfixe, "a")
  End If
  
  If iClôt <> 0 Then
    If sReq <> "" Then sReq = sReq & "$"
    If iClôt = 1 Then sReq = sReq & "pla_persclot$<>"
    If iClôt = 2 Then sReq = sReq & "pla_persclot$="
  End If
  
  If bLettresGéréesUniquement Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "!pla_lettres in (select let_lettres from lettre where let_systeme='" & cSystèmeCA & "')"
  End If
  
  If Not bShiftPressed Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "pla_etb$<>7"
  End If
  
  sbStatus.Panels("Info").Text = sGetIntlLib("PLRechEnCours", "Recherche des plannings en cours…")
  EffaceInformations
  lblTêteTout = sTitreArbre

  Dim iNbJournées As Integer
  iNbJournées = colJournées.RechercheJournee(sReq)
  
  If iNbJournées = 0 Then
    sbStatus.Panels("Info").Text = ""
    iNiveauCourant = -1 ' Pas de planning sélectionné
    MsgBox2i "PL002"
    Exit Sub
  End If
  
  Dim nodX As Node
  Set nodX = tvPlanning.Nodes.Add(, , "R", sTitreArbre, 1)
  nodX.Expanded = True
  
  Dim i As Integer, iNbDate As Integer
  Dim j As Journee
  Dim dLastDate As Date, sLastLettres As String, sLastKey As String
  
  dLastDate = #1/1/1990#
  sLastLettres = ""
  iNbDate = 0
  For i = 1 To iNbJournées
    Set j = colJournées.Item(i)
    If j.dDatePlan <> dLastDate Then
      iNbDate = iNbDate + 1
      dLastDate = j.dDatePlan
      sLastKey = "J" & Format(j.dDatePlan, "ddmmyy")
      Dim sDate As String
      If j.dDatePlan = dAttente Then
        sDate = sAttente
      Else
        sDate = l1maj(Format(j.dDatePlan, "ddd " & sShortDate))
      End If
      Set nodX = tvPlanning.Nodes.Add("R", tvwChild, sLastKey, sDate, 2)
      nodX.Expanded = True
    End If
    
    Dim vIcône As Variant
    Select Case j.iValidation
      Case 2: vIcône = "V"      ' Validé
      Case 1: vIcône = "VP"     ' Validé partiellement
      Case 0:
        If dLastDate < Now - 3 Then
          vIcône = "Alerte"
        Else
          vIcône = 0
        End If
    End Select
    Set nodX = tvPlanning.Nodes.Add(sLastKey, tvwChild, "P" & sLastKey & j.sLettres, j.sLettres & " " & j.sNomPersonne, vIcône)
    If Not bOkLettresAssistant(j.sLettres, cSystèmeCA) Then nodX.ForeColor = coulLettresAutresSys
  Next
  
  'lblSélectionTout = iNbDate & " journée" & s(iNbDate) & " sélectionnée" & s(iNbDate) & vbCrLf & iNbJournées & " planning" & s(iNbJournées) & " sélectionné" & s(iNbJournées)
  lblSélectionTout = sprintf(sGetIntlLib("PLmsgSelTout", "%1 journée(s) sélectionnée|%2 planning(s) sélectionné(s)"), iNbDate, iNbJournées)
  
  sbStatus.Panels("Info").Text = ""
  sLettresCourantes = ""
  
  ' Positionnement de la sélection
  If tvPlanning.Nodes.count > 1 Then
    If tvPlanning.Nodes.count = 3 Then  ' 1 date et 1 lettre: on sélectionne la date
      Set tvPlanning.SelectedItem = tvPlanning.Nodes(3)
    ElseIf iNbDate = 1 Then             ' 1 date plusieurs lettres: on sélectionne la journée
      Set tvPlanning.SelectedItem = tvPlanning.Nodes(2)
    Else                                ' plusieurs dates: on sélectionne tout
      Set tvPlanning.SelectedItem = tvPlanning.Nodes(1)
    End If
    tvPlanning_Click
  End If
End Sub

Private Sub cmdQuitter_Click()
  tcps.Ferme
  tcps.Destruction
  
  Dim F
  For Each F In Forms
    If Not F Is Me Then Unload F
  Next
  Unload Me
End Sub

Private Sub cmdTCPFenetre_Click()
  cmdTCPFenetre.Checked = Not cmdTCPFenetre.Checked
  tcps.AfficheTrace cmdTCPFenetre.Checked
  SaveSetting sApplicationGlobale, "Options", "FenêtreTCP", IIf(cmdTCPFenetre.Checked, 1, 0)
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If bBlocageEnCours Then Beep: Cancel = True: Exit Sub
  cmdQuitter_Click
End Sub

Public Sub lvInterventions_Click()
  Page "Intervention"

  If lvInterventions.SelectedItem Is Nothing Then Exit Sub
  Dim p As Intervention
  Set p = colPlannings(lvInterventions.SelectedItem.Index)
  txtNumetb = p.pla_etb
  txtPréfixe = p.etb_prefixe
  txtNomEtb = p.etb_nom
  txtRéférence = p.pla_lettres & NV(p.pla_iref)
  txtPers = p.pla_pers
  txtUnité = p.pla_unite
  txtComment = p.pla_comment
  txtNomPers = p.pla_nompers
  txtNomUnité = p.pla_nomunite
  txtNbAB = NV(p.pla_nbab)
  txtNbEH = NV(p.pla_nbeh)
  txtNbBS = NV(p.pla_nbbs)
  txtNbLi = NV(p.pla_nbli)
  txtNbFS = NV(p.pla_nbfs)
  txtNbHu = NV(p.pla_nbhu)
  txtNbCh = NV(p.pla_nbch)
  
  txtLabAB = Format(NZ(p.pla_labab), "#")
  txtLabBS = Format(NZ(p.pla_labbs), "#")
  txtLabLi = Format(NZ(p.pla_labli), "#")
  txtLabFS = Format(NZ(p.pla_labfs), "#")
  txtLabHu = Format(NZ(p.pla_labhu), "#")
  txtLabCh = Format(NZ(p.pla_labch), "#")
  
  txtHeureArrivée.HeureSaisie = NV(p.pla_harrivee)
  txtHeureDépart.HeureSaisie = NV(p.pla_hdepart)
  txtTypePrestation = sNoEtLibelléTypePrestation(p.pla_typeprest)
  txtCodeActivité = sNoEtLibelléActivité(p.pla_activite)
  txtCodeClient = NV(p.pla_client)
  
  lblTrEtatDocMin = p.pla_tretatdocmin
  lblTrEtatDocMax = p.pla_tretatdocmax
  lblTrEtatFac = p.pla_tretatfac
  
  lblTabEch(0) = Left(NV(p.pla_tabech), 50)
  lblTabEch(1) = Mid(NV(p.pla_tabech), 51)
  
'  txtDateOrigine = NV(p.pla_dateorigine)
  
  If Not IsNull(p.pla_operbl) And p.pla_operbl > 0 Then
    txtOperBL = p.pla_operbl
    txtNomOperBL = sNomUtilisateur(p.pla_operbl)
    txtTSBL = p.pla_tsbl
  Else
    txtOperBL = ""
    txtNomOperBL = ""
    txtTSBL = ""
  End If

  If Not IsNull(p.pla_operfp) And p.pla_operfp > 0 Then
    txtOperFP = p.pla_operfp
    txtNomOperFP = sNomUtilisateur(p.pla_operfp)
    txtTSFP = p.pla_tsfp
  Else
    txtOperFP = ""
    txtNomOperFP = ""
    txtTSFP = ""
  End If
  
  If Not IsNull(p.pla_opervalid) And p.pla_opervalid > 0 Then
    txtOperValidation = p.pla_opervalid
    txtNomOperValidation = sNomUtilisateur(p.pla_opervalid)
    txtDateValidation = p.pla_datevalid
  Else
    txtOperValidation = ""
    txtNomOperValidation = ""
    txtDateValidation = ""
  End If
  
End Sub

Private Sub lvInterventions_ItemClick(ByVal Item As ListItem)
  lvInterventions_Click
End Sub

Private Sub lvInterventions_DblClick()
  If bShiftPressed Then
    If iNiveauCourant <> 2 Or lvInterventions.SelectedItem Is Nothing Then Exit Sub
    Dim p As Intervention
    Set p = colPlannings(lvInterventions.SelectedItem.Index)
    MsgBox "Ref: " & p.pla_lettres & p.pla_iref & vbCrLf & "Sys/Ser: " & p.pla_systeme & "/" & p.pla_serie & vbCrLf & "Date origine: " & p.pla_dateorigine, vbInformation, App.Title
  Else
    cmdModifier_Click
  End If
End Sub

Private Sub lvInterventions_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = 32 Then
    If lvInterventions.SelectedItem Is Nothing Then
      Dim x As ListItem
      For Each x In lvInterventions.ListItems
        If x.Selected Then
          Set lvInterventions.SelectedItem = x
          Exit For
        End If
      Next
    End If
    cmdModifier_Click
    KeyCode = 0
  End If
End Sub

Private Sub lvInterventions_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then
    PopupMenu mnuPopUpInterventions
  End If
End Sub

Private Sub sbStatus_PanelDblClick(ByVal Panel As Panel)
  If Panel.Key = "Info" Then MsgBox sGetIntlLib("PLpnlInfo.hlp", "Cette zone affiche des messages d'aide et d'information généraux, en particulier le rôle de l'élément sélectionné."), vbInformation, sNomApp
  If Panel.Key = "ECom" Then cmdSystèmeUnix_Click
  If Panel.Key = "Impr" Then cmdConfigImprimante_Click
  If Panel.Key = "EInt" Then MsgBox sGetIntlLib("PLpnlInt.hlp", "Cette zone indique si le programme échange des données avec le démon Unix." & vbCrLf & "A vide, indique qu'il n'y a pas de communication en cours." & vbCrLf & "Le cadenas indique qu'il y a un échange de données en cours."), vbInformation, sNomApp
End Sub


' ===============================================================================
' Barre de boutons

Private Sub tbBoutons_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then PopupMenu mnuBarreBoutons
End Sub

' L'effacement de la barre de boutons est sous-traité plus haut
Private Sub cmdBarreStandard_Click()
  frmOptions.PasDeBarreDeBoutons
  DoOptionsAffichage
End Sub

Private Sub tbBoutons_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Key
    Case "btnNouveauPlanning":  cmdNouveauPlanning_Click
    Case "btnLire":             If bShiftPressed Then cmdLireAvancé_Click Else cmdLire_Click
    Case "btnLireAvancé":       cmdLireAvancé_Click
    Case "btnModifierPlanning": cmdModifierPlanning_Click
    
    Case "btnValidation":       cmdValidation_Click
    Case "btnPlanningsNonVal":  cmdPlanningsNonValidés_Click
    
    Case "btnUnix":             cmdSystèmeUnix_Click
    Case "btnUtilisateur":      cmdIdentification_Click
    Case "btnImprimante":       cmdConfigImprimante_Click
    
    Case "btnIntAjouter":       cmdAjouter_Click
    Case "btnAjouterFT":        cmdAjouterFT_Click
    Case "btnIntModifier":      cmdModifier_Click
    Case "btnIntSupprimer":     cmdSupprimer_Click
    Case "btnIntDéplacer":      cmdDéplacer_Click
    
    Case "btnImprimePla":       cmdImpPlanning_Click
    Case "btnImprimeEtiq":      cmdImpEtiq_Click
    Case "btnImprimeFP":        cmdImpFP_Click
    Case "btnImprimeAP":        cmdImpAP_Click
    Case "btnImprimeDoc":       cmdImpDoc_Click

    Case Else:
      MsgBox2i "PL105", Button.Key
      'MsgBox "Bouton " & Button.Key & " de la barre de boutons non traité !", vbCritical, sNomApp
      Stop
  End Select
End Sub

Private Sub EffaceInformationsPlanning()
  txtDatePlanning.DateSaisie = ""
  txtLettresPlanning = ""
  txtNomPlanning = ""
  lblSélectionPlanning = ""
  txtKmDébut = ""
  txtKmFin = ""
  txtHeureDébut.HeureSaisie = ""
  txtHeureFin.HeureSaisie = ""
End Sub

Public Sub tvPlanning_Click()
  If tvPlanning.Nodes.count = 0 Then Exit Sub
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim sDate As String
  Select Case Left(tvPlanning.SelectedItem.Key, 1)
    Case "R":   ' Tous les plannings sélectionnés
      Page "Tout"
      iNiveauCourant = 0
      dDateCourante = #1/1/1900#
      sLettresCourantes = ""
      lvInterventions.ListItems.Clear
      
      ' On efface les infos des autres onglets
      txtDateJournée.DateSaisie = ""
      lblSélectionJournée = ""
      EffaceInformationsIntervention
      EffaceInformationsPlanning
    
    Case "J":   ' Journée
      Page "Journée"
      iNiveauCourant = 1
      sDate = tvPlanning.SelectedItem.Text
      If Not IsNumeric(Right(sDate, 2)) Then sDate = Format(dAttente, "ddd " & sShortDate)
      dDateCourante = CDate(Mid(sDate, InStr(sDate, " ") + 1))
      txtDateJournée.DateSaisie = dDateCourante
      sLettresCourantes = ""
    
      Dim iNbP As Integer
      iNbP = tvPlanning.SelectedItem.Child.LastSibling.Index - tvPlanning.SelectedItem.Child.Index + 1
      lblSélectionJournée = sprintf(sGetIntlLib("FPlblPlanSel", "%1 planning(s) sélectionné(s)"), iNbP)
      lvInterventions.ListItems.Clear
      EffaceInformationsIntervention
      EffaceInformationsPlanning
    
    Case "P":   ' Planning individuel
      Page "Planning"
      Dim dDateCouranteClic As Date, sLettresCourantesClic As String
      sDate = tvPlanning.SelectedItem.Parent.Text
      If Not IsNumeric(Right(sDate, 2)) Then sDate = Format(dAttente, "ddd " & sShortDate)
      dDateCouranteClic = CDate(Mid(sDate, InStr(sDate, " ") + 1))
      sLettresCourantesClic = Left(tvPlanning.SelectedItem.Text, 2)
      
      ' On efface la sélection d'intervention
      EffaceInformationsIntervention
      EffaceSélectionInterventionIndividuelle

      If iNiveauCourant = 2 And dDateCourante = dDateCouranteClic And sLettresCourantes = sLettresCourantesClic Then Exit Sub ' Déjà affiché
      iNiveauCourant = 2
      dDateCourante = dDateCouranteClic
      sLettresCourantes = sLettresCourantesClic
      AffichePlanning dDateCourante, sLettresCourantes
      
      ' En double, normal...
      EffaceSélectionInterventionIndividuelle

      ' Mise à jour des infos de la journée
      iNbP = tvPlanning.SelectedItem.LastSibling.Index - tvPlanning.SelectedItem.FirstSibling.Index + 1
      lblSélectionJournée = sprintf(sGetIntlLib("FPlblPlanSel", "%1 planning(s) sélectionné(s)"), iNbP)
      txtDateJournée.DateSaisie = dDateCourante

      ' Mise à jour des infos du planning
      txtDatePlanning.DateSaisie = dDateCourante
      txtLettresPlanning = sLettresCourantes
      txtNomPlanning = sNomAssistant(sLettresCourantes)
      If bOkLettresAssistant(sLettresCourantes, cSystèmeCA) Then
        txtLettresPlanning.ForeColor = &H80000008
        txtNomPlanning.ForeColor = &H80000008
      Else
        txtLettresPlanning.ForeColor = coulLettresAutresSys
        txtNomPlanning.ForeColor = coulLettresAutresSys
      End If

      ' lblSélectionPlanning est rempli dans AffichePlanning
      
      Dim j As Journee
      Set j = colJournées.LitJournée(dDateCourante, sLettresCourantes)
      If j Is Nothing Then          ' Journée inexistante
        EffaceInformationsPlanning
      Else
        txtKmDébut = NV(j.iKmDébut)
        txtKmFin = NV(j.iKmFin)
        txtHeureDébut.HeureSaisie = j.iHeureDébut
        txtHeureFin.HeureSaisie = j.iHeureFin
      End If
      DessinePicJournée       ' On redessine le calendrier

  End Select
End Sub


Private Sub EffaceSélectionInterventionIndividuelle()
  ' La ligne qui suit n'efface pas 'visuellement' la sélection de la liste…
  Set lvInterventions.SelectedItem = Nothing
  ' D'où ces 4 lignes pour effacer la surbrillance…
  Dim i As Integer
  For i = lvInterventions.ListItems.count To 1 Step -1
    lvInterventions.ListItems(i).Selected = False
  Next
End Sub


' Raccourci pour modifier planning (double-clic sur la date)
Private Sub tvPlanning_DblClick()
  If tvPlanning.Nodes.count = 0 Then Exit Sub
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If iNiveauCourant = 2 Then cmdModifierPlanning_Click
End Sub



' Ajoute une intervention dans la liste des interventions
' Si iRang<0 ajoute simplement la ligne, sinon remplace la ligne d'index iRang
Public Sub AfficheUneIntervention(p As Intervention, iRang As Integer)
  Dim sRef As String
  sRef = p.pla_lettres
  If IsNull(p.pla_iref) Then
    sRef = sRef & "______"
  Else
    sRef = sRef & Format(p.pla_iref, "0")
  End If
  Dim itmX As ListItem
  If iRang < 0 Then
    Set itmX = lvInterventions.ListItems.Add
  Else
    Set itmX = lvInterventions.ListItems(iRang)
  End If
  
  ' Gestion des etb_proprio invalides ou non gérés
  On Error Resume Next
  itmX.SmallIcon = p.etb_proprio
  If Err Then itmX.SmallIcon = "S"
  On Error GoTo 0
  
  itmX.SubItems(1) = sRef
  itmX.ListSubItems(1).ReportIcon = IIf(p.bValidé, "V", "NV")
  itmX.SubItems(2) = p.etb_prefixe & " " & p.etb_nom
  
  If Not bOkLettresAssistant(p.pla_lettres, cSystèmeCA) Then
    itmX.ListSubItems(1).ForeColor = coulLettresAutresSys
    itmX.ListSubItems(2).ForeColor = coulLettresAutresSys
  End If
  
  ' [Supprimé]/[A supprimer] en rouge...
  If Left(p.Etb.etb_nom, 1) = "[" Then
    itmX.ListSubItems(1).ForeColor = RGB(255, 0, 0)
    itmX.ListSubItems(2).ForeColor = RGB(255, 0, 0)
    itmX.ListSubItems(2).Bold = True
  End If
  
  lvInterventions.Refresh
End Sub

Public Sub AfficheLibelléInterventions()
  lblSélectionPlanning = sprintf(sGetIntlLib("FPlblInterventions", "%1 intervention(s)"), lvInterventions.ListItems.count)
End Sub

Private Sub AffichePlanning(dDate As Date, sLettres As String)
  Dim i As Integer, iNbPlannings As Integer
  
  EffaceInformationsIntervention
  sbStatus.Panels("Info").Text = sGetIntlLib("FPmsgLectureEnCours", "Lecture du planning en cours…")
  Set colPlannings = RecherchePlanning(dDate, sLettres)
  iNbPlannings = colPlannings.count

  lvInterventions.ListItems.Clear
  For i = 1 To iNbPlannings
    AfficheUneIntervention colPlannings(i), -1
  Next
  Set lvInterventions.SelectedItem = Nothing
  AfficheLibelléInterventions
  sbStatus.Panels("Info").Text = ""
  DessinePicJournée
End Sub


Public Function NouveauPlanning(dDatePlan As Date, sLettres As String)
  AssertOkDate dDatePlan
  AssertOkLettres sLettres
  
  lvInterventions.ListItems.Clear
  EffaceInformationsIntervention
  EffaceInformationsPlanning
  
  Dim sNP As String
  sNP = sGetIntlLib("PLsNouveauPlanning", "Nouveau planning")
  
  tvPlanning.Nodes.Clear
  Dim nodX As Node, sLastKey As String
  Set nodX = tvPlanning.Nodes.Add(, , "R", sNP, 1)
  sLastKey = "J" & Format(dDatePlan, "ddmmyy")
  Set nodX = tvPlanning.Nodes.Add("R", tvwChild, sLastKey, Format(dDatePlan, "ddd " & sShortDate))
  Set nodX = tvPlanning.Nodes.Add(sLastKey, tvwChild, "P" & sLastKey & sLettres, sLettres & " " & sNomAssistant(sLettres), 0)
  If Not bOkLettresAssistant(sLettres, cSystèmeCA) Then nodX.ForeColor = coulLettresAutresSys
  Set tvPlanning.SelectedItem = tvPlanning.Nodes(3)
  tvPlanning_Click
  cmdAjouter_Click
  
  lblTêteTout = sNP
  lblSélectionTout = sNP
  
  ' On met à jour la liste des journées
  colJournées.Clear
  colJournées.AddJournée dDatePlan, sLettres, 0, Null, Null, Null, Null
End Function


Private Sub Timer1_Timer()
  Dim e As Integer
  e = tcps.Etat()
  If e <> iOldEtat Then
    sbStatus.Panels("ECom").Text = tcps.sEtatDécodé
    sbStatus.Refresh
    iOldEtat = e
  End If
End Sub


Private Sub cmdAideSommaire_Click()
  Aide "index"
End Sub

Private Sub cmdAideContextuelle_Click()
  Aide "frmplan"
End Sub


' Pas besoin de traiter l'aide via Form_KeyDown,
' F1 est un raccourci du menu
'Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
'  If KeyCode = vbKeyF1 And Shift = 0 Then cmdAideContextuelle_Click
'End Sub

Private Sub tvPlanning_KeyPress(KeyAscii As Integer)
  If KeyAscii = 32 Then tvPlanning_Click
End Sub


Public Sub AfficheBarreProgression(iMin As Integer, iMax As Integer, iValeur As Integer)
  pbProgress.Min = iMin
  pbProgress.Max = iMax
  pbProgress.Value = iValeur
  
  pbProgress.Move sbStatus.Panels(2).Left, sbStatus.Top + 2, sbStatus.Panels(2).Width, sbStatus.height - 2
  pbProgress.ZOrder 0
  pbProgress.Visible = True
End Sub


'========================================================
' Menu contextuel

Private Sub mnuPopUpInterventions_Click()
  cmdPopUpAjouter.Enabled = iNiveauCourant = 2
  cmdPopUpModifier.Enabled = lvInterventions.ListItems.count > 0
  cmdPopUpSupprimer.Enabled = lvInterventions.ListItems.count > 0
End Sub

Private Sub cmdPopUpAjouter_Click()
  cmdAjouter_Click
End Sub

Private Sub cmdPopUpModifier_Click()
  cmdModifier_Click
End Sub

Private Sub cmdPopUpSupprimer_Click()
  cmdSupprimer_Click
End Sub


'========================================================
' Onglets

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
End Sub


' Change le frame affiché
Private Sub Page(ByVal sPage)
  ' On ne change que l'onglet, ce code appelle automatiquement tsTab_Click
  Set tsTab.SelectedItem = tsTab.Tabs(sPage)
End Sub



'========================================================
' Internationalisation

Public Sub Internationalisation()
  sNomApp = sGetIntlLib("sNomApp", "Microb'Soft - Gestion des plannings")
  sAttente = sGetIntlLib("sAttente", "ATTENTE")
  If sNomOpérateur <> "" Then Caption = sNomApp & " [" & sNomOpérateur & "]"
  
  SetLib txtInfo, "Text", "msgInfo"
  SetLib txtInfo, "ToolTipText", "msgInfo.tt"

  
  ' Champs date
  txtDateJournée.SaisieAssistée = sAttente & "=" & dAttente
  txtDatePlanning.SaisieAssistée = sAttente & "=" & dAttente
'  txtDateOrigine.SaisieAssistée = sAttente & "=" & dAttente
  
  ' Menus et commandes
  SetLib mnuPlanning, "Caption", "PLmnuPlanning"
  SetLib cmdNouveauPlanning, "Caption", "PLcmdNouveauPlanning"
  SetLib cmdLire, "Caption", "PLcmdLire"
  SetLib cmdLireAvancé, "Caption", "PLcmdLireAvancé"
  SetLib cmdModifierPlanning, "Caption", "PLcmdModifierPlannin"
  SetLib cmdPlanningsNonValidés, "Caption", "PLcmdPlanningsNonClo"
  SetLib cmdExportExcel, "Caption", "PLcmdExportExcel"
  SetLib cmdSystèmeUnix, "Caption", "PLcmdSystèmeUnix"
  SetLib cmdIdentification, "Caption", "PLcmdIdentification"
  SetLib cmdConfigImprimante, "Caption", "PLcmdConfigImprimant"
  SetLib cmdQuitter, "Caption", "PLcmdQuitter"
  
  SetLib mnuIntervention, "Caption", "PLmnuIntervention"
  SetLib cmdAjouter, "Caption", "PLcmdAjouter"
  SetLib cmdModifier, "Caption", "PLcmdModifier"
  SetLib cmdSupprimer, "Caption", "PLcmdSupprimer"
  SetLib cmdAjouterFT, "Caption", "PLcmdAjouterFT"
  SetLib cmdDéplacer, "Caption", "PLcmdDéplacer"
  SetLib cmdGénèreRéférence, "Caption", "PLcmdGénèreRéférence"
  SetLib cmdValidation, "Caption", "PLcmdClôture"
  SetLib cmdAnnulationValidation, "Caption", "PLcmdAnnulationClôtu"
  
  SetLib mnuAffichage, "Caption", "PLmnuAffichage"
  SetLib cmdAffichage(0), "Caption", "PLcmdAffichage(0)"
  SetLib cmdAffichage(1), "Caption", "PLcmdAffichage(1)"
  SetLib cmdAffichage(2), "Caption", "PLcmdAffichage(2)"
  SetLib cmdAffichage(3), "Caption", "PLcmdAffichage(3)"
  
  SetLib mnuImpression, "Caption", "PLmnuImpression"
  SetLib cmdImpPlanning, "Caption", "PLcmdImpPlanning"
  SetLib cmdImpEtiq, "Caption", "PLcmdImpEtiq"
  SetLib cmdImpFP, "Caption", "PLcmdImpPL"
  SetLib cmdImpAP, "Caption", "PLcmdImpBL"
  SetLib cmdImpEtiqIE, "Caption", "PLcmdImpEtiqIE"
  SetLib cmdImpDoc, "Caption", "PLcmdImpDoc"
  SetLib cmdImpPlanningHebdo, "Caption", "PLcmdImpPlanningHebd"
  SetLib cmdImpFPVierges, "Caption", "PLcmdImpFPVierges"
  
  SetLib mnuRecherche, "Caption", "PLmnuRecherche"
  SetLib cmdRechEtablissement, "Caption", "PLcmdRechEtablisseme"
  SetLib cmdRechUtilisateur, "Caption", "PLcmdRechUtilisateur"
  SetLib cmdRechUnité, "Caption", "PLcmdRechUnité"
  SetLib cmdRechLettres, "Caption", "PLcmdRechLettres"
  SetLib cmdRechDate, "Caption", "PLcmdRechDate"
  SetLib cmdOptions, "Caption", "PLcmdOptions"
  
  SetLib mnuSystème, "Caption", "PLmnuSystème"
  SetLib cmdTCPFenetre, "Caption", "PLcmdTCPFenetre"
  SetLib cmdRelâcher, "Caption", "PLcmdRelâcher"
  SetLib cmdEffaceCacheInterventions, "Caption", "PLcmdEffaceCacheInte"
  SetLib cmdEffacerCacheEtablissements, "Caption", "PLcmdEffacerCacheEta"
  SetLib cmdConnexion, "Caption", "PLcmdConnexion"
  SetLib cmdDéconnexion, "Caption", "PLcmdDéconnexion"
  SetLib cmdClôtureMensuelle, "Caption", "PLcmdClôtureMens"
  
  SetLib mnuAide, "Caption", "PLmnuAide"
  SetLib cmdAideSommaire, "Caption", "PLcmdAideSommaire"
  SetLib cmdAideContextuelle, "Caption", "PLcmdAideContextuell"
  SetLib cmdDernièresModifs, "Caption", "PLcmdDernièresModifs"
  SetLib cmdAPropos, "Caption", "PLcmdAPropos"
  
  SetLib cmdPopUpAjouter, "Caption", "PLcmdPopUpAjouter"
  SetLib cmdPopUpModifier, "Caption", "PLcmdPopUpModifier"
  SetLib cmdPopUpSupprimer, "Caption", "PLcmdPopUpSupprimer"
  
  SetLib cmdBarreStandard, "Caption", "PLcmdBarreStandard"
  
  
  ' Onglet Intervention
  SetLib lblEtabliss, "Caption", "PLlblEtabliss"
  SetLib lblRéférence, "Caption", "PLlblRéférence"
  SetLib lblCommentaire, "Caption", "PLlblCommentaire"
  SetLib lblNbAB, "Caption", "PLlblNbAB"
  SetLib lblNbEH, "Caption", "PLlblNbEH"
  SetLib lblNbBS, "Caption", "PLlblNbBS"
  SetLib lblNbLi, "Caption", "PLlblNbLi"
  SetLib lblNbFS, "Caption", "PLlblNbFS"
  SetLib lblNbHu, "Caption", "PLlblNbHu"
  SetLib lblNbCh, "Caption", "PLlblNbCh"
  
'  SetLib lblDateOrigine, "Caption", "PLlblDateOrig"
  SetLib lblHeureAD, "Caption", "PLlblHeureAD"
'  SetLib lblHArrivée, "Caption", "PLlblHArrivée"
'  SetLib lblHDépart, "Caption", "PLlblHDépart"
  SetLib lblClient, "Caption", "PLlblClient"
  SetLib lblPersonne, "Caption", "PLlblPersonne"
  SetLib lblUnité, "Caption", "PLlblUnité"
  SetLib lblPrestation, "Caption", "PLlblPrestation"
  SetLib lblActivité, "Caption", "PLlblActivité"
  SetLib lblEdBL, "Caption", "PLlblEdBL"
  SetLib lblEdBLPar, "Caption", "PLlblEdBLPar"
  SetLib lblEdFP, "Caption", "PLlblEdFP"
  SetLib lblEdFPPar, "Caption", "PLlblEdFPPar"
  SetLib lblValidéLe, "Caption", "PLlblClôtLe"
  SetLib lblValidéPar, "Caption", "PLlblClôtPar"
  
  ' Onglet planning
  SetLib lblDatePlanning, "Caption", "PLlblDatePlanning"
  SetLib lblLettresPlanning, "Caption", "PLlblLettresPlanning"
  SetLib lblTournée, "Caption", "PLlblTournée"
  SetLib lblHeure, "Caption", "PLlblHeure"
  SetLib lblKm, "Caption", "PLlblKm"
  SetLib lblDébut, "Caption", "PLlblDébut"
  SetLib lblFin, "Caption", "PLlblFin"
  SetLib btnModifierPlanning, "Caption", "PLbtnMP"
  
  ' Onglet Journée
  SetLib lblDateJournée, "Caption", "PLlblDateJournée"
  
  ' Onglet tout
  
  ' Onglet Tranches
  SetLib lblLégendeDoc(0), "Caption", "PLlblLégendeDoc0"
  SetLib lblLégendeDoc(1), "Caption", "PLlblLégendeDoc1"
  SetLib lblTrancheDoc(0), "Caption", "PLlblTrancheDoc0"
  SetLib lblTrancheDoc(1), "Caption", "PLlblTrancheDoc1"
  SetLib lblTrancheDoc(2), "Caption", "PLlblTrancheDoc2"
  
  
  ' TabStrip
  SetLib tsTab.Tabs(1), "Caption", "PLtsTout"
  SetLib tsTab.Tabs(2), "Caption", "PLtsJournée"
  SetLib tsTab.Tabs(3), "Caption", "PLtsPlanning"
  SetLib tsTab.Tabs(4), "Caption", "PLtsIntervention"
  SetLib tsTab.Tabs(5), "Caption", "PLtsTrancheDoc"
  
  
  ' Boutons
  SetLib tbBoutons.Buttons("btnNouveauPlanning"), "ToolTipText", "PLtbbNP.tt"
  SetLib tbBoutons.Buttons("btnLire"), "ToolTipText", "PLtbbLire.tt"
  SetLib tbBoutons.Buttons("btnLireAvancé"), "ToolTipText", "PLtbbLireAvancé.tt"
  SetLib tbBoutons.Buttons("btnModifierPlanning"), "ToolTipText", "PLtbbMP.tt"
    
  SetLib tbBoutons.Buttons("btnValidation"), "ToolTipText", "PLtbbClôture.tt"
  SetLib tbBoutons.Buttons("btnPlanningsNonVal"), "ToolTipText", "PLtbbPNC.tt"
    
  SetLib tbBoutons.Buttons("btnUnix"), "ToolTipText", "PLtbbUnix.tt"
  SetLib tbBoutons.Buttons("btnUtilisateur"), "ToolTipText", "PLtbbUtilisateur.tt"
  SetLib tbBoutons.Buttons("btnImprimante"), "ToolTipText", "PLtbbImprimante.tt"
    
  SetLib tbBoutons.Buttons("btnIntAjouter"), "ToolTipText", "PLtbbAjouter.tt"
  SetLib tbBoutons.Buttons("btnAjouterFT"), "ToolTipText", "PLtbbAjouterFT.tt"
  SetLib tbBoutons.Buttons("btnIntModifier"), "ToolTipText", "PLtbbModifier.tt"
  SetLib tbBoutons.Buttons("btnIntSupprimer"), "ToolTipText", "PLtbbSupprimer.tt"
  SetLib tbBoutons.Buttons("btnIntDéplacer"), "ToolTipText", "PLtbbDéplacer.tt"
    
  SetLib tbBoutons.Buttons("btnImprimePla"), "ToolTipText", "PLtbbImpJou.tt"
  SetLib tbBoutons.Buttons("btnImprimeEtiq"), "ToolTipText", "PLtbbImpEtiq.tt"
  SetLib tbBoutons.Buttons("btnImprimeFP"), "ToolTipText", "PLtbbImpPL.tt"
  SetLib tbBoutons.Buttons("btnImprimeAP"), "ToolTipText", "PLtbbImpBL.tt"
  SetLib tbBoutons.Buttons("btnImprimeDoc"), "ToolTipText", "PLtbbImpDoc.tt"
  
  ' ListView prestations
  SetLib lvInterventions.ColumnHeaders(2), "Text", "PLlblchRef"
  SetLib lvInterventions.ColumnHeaders(3), "Text", "PLlblchEtb"
  
  ' ToolTip adresse etablissement
  SetLib btnZoomEtb, "ToolTipText", "PLcboAdrEtb.tt"
  
  ' Tooltip statusbar
  SetLib sbStatus.Panels(2), "ToolTipText", "PLsbStatus(2).tt"
  SetLib sbStatus.Panels(3), "ToolTipText", "PLsbStatus(3).tt"
  SetLib sbStatus.Panels(4), "ToolTipText", "PLsbStatus(4).tt"
  
  ' Police réduite pour les labels d'information
  AjusteControle lblTêteTout
  AjusteControle lblSélectionTout
  AjusteControle lblSélectionJournée
  AjusteControle lblSélectionPlanning
End Sub

