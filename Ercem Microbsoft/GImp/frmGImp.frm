VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmGImp 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Microb'Soft - GImp"
   ClientHeight    =   8055
   ClientLeft      =   1560
   ClientTop       =   2100
   ClientWidth     =   9480
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
   Icon            =   "frmGImp.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   537
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   632
   Begin VB.TextBox txtInfosErreurs 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1275
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   28
      TabStop         =   0   'False
      Top             =   5640
      Width           =   9435
   End
   Begin VB.Frame Frame1 
      Caption         =   "Param�tres de s�lection"
      Height          =   2475
      Left            =   0
      TabIndex        =   15
      Top             =   600
      Width           =   9435
      Begin VB.CheckBox chk_edforcee 
         Caption         =   "Check1"
         Height          =   255
         Left            =   8880
         TabIndex        =   30
         Top             =   720
         Width           =   255
      End
      Begin VB.TextBox txtTrancheDoc 
         Height          =   315
         Left            =   4200
         TabIndex        =   29
         Text            =   "A"
         Top             =   690
         Width           =   315
      End
      Begin VB.CheckBox chk_duplicata 
         Caption         =   "Check1"
         Height          =   255
         Left            =   7740
         TabIndex        =   8
         Top             =   720
         Width           =   255
      End
      Begin VB.ComboBox cob_classedoc 
         Height          =   330
         Left            =   7740
         TabIndex        =   6
         Top             =   300
         Width           =   1335
      End
      Begin VB.TextBox txtNumGrp 
         Height          =   315
         Left            =   7740
         TabIndex        =   11
         Top             =   2040
         Width           =   1395
      End
      Begin VB.TextBox txtNumDna 
         Height          =   315
         Left            =   7740
         TabIndex        =   10
         Top             =   1680
         Width           =   1395
      End
      Begin VB.TextBox txtNumDrg 
         Height          =   315
         Left            =   7740
         TabIndex        =   9
         Top             =   1320
         Width           =   1395
      End
      Begin VB.TextBox txtNumSec 
         Height          =   315
         Left            =   2280
         TabIndex        =   5
         Top             =   2040
         Width           =   1395
      End
      Begin VB.TextBox txtNumEtb 
         Height          =   315
         Left            =   2280
         TabIndex        =   4
         Top             =   1680
         Width           =   1395
      End
      Begin VB.TextBox txtDate 
         Height          =   315
         Left            =   2280
         TabIndex        =   1
         Top             =   240
         Width           =   2235
      End
      Begin VB.TextBox txtR�f�rence 
         Height          =   315
         Left            =   2280
         TabIndex        =   2
         Top             =   690
         Width           =   1395
      End
      Begin VB.TextBox txtPrefixe 
         Height          =   315
         Left            =   2280
         TabIndex        =   3
         Top             =   1320
         Width           =   1395
      End
      Begin VB.Label Label12 
         Caption         =   "Forc� :"
         Height          =   255
         Left            =   8040
         TabIndex        =   31
         Top             =   720
         Width           =   735
      End
      Begin VB.Label Label10 
         Caption         =   "Tr :"
         Height          =   255
         Left            =   3720
         TabIndex        =   26
         Top             =   720
         Width           =   375
      End
      Begin VB.Label Label9 
         Caption         =   "Classe de document :"
         Height          =   255
         Left            =   5340
         TabIndex        =   25
         Top             =   360
         Width           =   2295
      End
      Begin VB.Label Label8 
         Caption         =   "Mention duplicata :"
         Height          =   195
         Left            =   5340
         TabIndex        =   24
         Top             =   750
         Width           =   2175
      End
      Begin VB.Label Label7 
         Caption         =   "Groupe :"
         Height          =   255
         Left            =   5340
         TabIndex        =   23
         Top             =   2160
         Width           =   1815
      End
      Begin VB.Label Label6 
         Caption         =   "Direction Nationale :"
         Height          =   255
         Left            =   5340
         TabIndex        =   22
         Top             =   1800
         Width           =   2175
      End
      Begin VB.Label Label5 
         Caption         =   "Direction R�gionale :"
         Height          =   255
         Left            =   5340
         TabIndex        =   21
         Top             =   1440
         Width           =   2055
      End
      Begin VB.Label Label4 
         Caption         =   "Secteur :"
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   2160
         Width           =   1935
      End
      Begin VB.Label Label3 
         Caption         =   "Code �tablissement :"
         Height          =   255
         Left            =   120
         TabIndex        =   19
         Top             =   1800
         Width           =   2055
      End
      Begin VB.Label Label1 
         Caption         =   "Dates d'intervention :"
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   300
         Width           =   2115
      End
      Begin VB.Label Label2 
         Caption         =   "R�f�rence :"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   17
         Top             =   720
         Width           =   2295
      End
      Begin VB.Label Label2 
         Caption         =   "Pr�fixe client :"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   16
         Top             =   1440
         Width           =   1755
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
      Height          =   615
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   6960
      Width           =   9435
   End
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   13
      Top             =   0
      Width           =   9480
      _ExtentX        =   16722
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      Appearance      =   1
      ImageList       =   "ImageListTB"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   7
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnNouveau"
            Object.ToolTipText     =   "Efface les param�tres de s�lection"
            ImageKey        =   "imgNouveau"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnS�lectionner"
            Object.ToolTipText     =   "S�lectionne les interventions"
            ImageKey        =   "imgLire"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnImprimer"
            Object.ToolTipText     =   "Imprime les documents"
            ImageKey        =   "imgImprimeDoc"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnUnix"
            Object.ToolTipText     =   "Change de syst�me Unix"
            ImageKey        =   "imgUnix"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnUtilisateur"
            Object.ToolTipText     =   "Change l'identification de la personne"
            ImageKey        =   "imgUtilisateur"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "btnImprimante"
            Object.ToolTipText     =   "Configuration des imprimantes"
            ImageKey        =   "imgImprimante"
         EndProperty
      EndProperty
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   6780
      Top             =   600
   End
   Begin MSComctlLib.ListView lvInterventions 
      Height          =   2235
      Left            =   0
      TabIndex        =   0
      Top             =   3120
      Width           =   9435
      _ExtentX        =   16642
      _ExtentY        =   3942
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
         Text            =   "R�f"
         Object.Width           =   2593
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Key             =   "Etb"
         Text            =   "�tablissement"
         Object.Width           =   6615
      EndProperty
   End
   Begin MSComctlLib.ProgressBar pbProgress 
      Height          =   225
      Left            =   0
      TabIndex        =   12
      Top             =   7560
      Visible         =   0   'False
      Width           =   9435
      _ExtentX        =   16642
      _ExtentY        =   397
      _Version        =   393216
      Appearance      =   1
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   7
      Top             =   7740
      Width           =   9480
      _ExtentX        =   16722
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   4
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   7064
            MinWidth        =   6879
            Key             =   "Info"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   3969
            MinWidth        =   3969
            Picture         =   "frmGImp.frx":014A
            Key             =   "Impr"
            Object.ToolTipText     =   "Imprimantes s�lectionn�es"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   529
            MinWidth        =   529
            Picture         =   "frmGImp.frx":069C
            Key             =   "EInt"
            Object.ToolTipText     =   "Le cadenas indique que le programme communique"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5027
            MinWidth        =   5027
            Picture         =   "frmGImp.frx":0A4E
            Key             =   "ECom"
            Object.ToolTipText     =   "�tat de la connexion avec le syst�me Unix"
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
   Begin MSComctlLib.ImageList ImageListTB 
      Left            =   7320
      Top             =   600
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   22
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":0E14
            Key             =   "imgNouveau"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":0F26
            Key             =   "imgLire"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":1038
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":1352
            Key             =   "imgGImpNonCl�ts"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":166C
            Key             =   "imgLireAvanc�"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":1986
            Key             =   "imgUnix"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":1ED8
            Key             =   "imgUtilisateur"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":21F2
            Key             =   "imgImprimante"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":2304
            Key             =   "imgImprimeBL"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":261E
            Key             =   "imgImprimeEtiq"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":2938
            Key             =   "imgImprimeFP"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":2C52
            Key             =   "imgImprimeJou"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":2F6C
            Key             =   "imgIntAjouter"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":3286
            Key             =   "imgIntModifier"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":35A0
            Key             =   "imgIntD�placer"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":38BA
            Key             =   "imgIntSupprimer"
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":3BD4
            Key             =   "ModifierGImp"
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":3CE6
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":4146
            Key             =   "imgFTour"
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":42A2
            Key             =   "imgDoc"
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":46F6
            Key             =   "imgCl�ture"
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGImp.frx":480A
            Key             =   "imgImprimeDoc"
         EndProperty
      EndProperty
   End
   Begin VB.Label Label11 
      Caption         =   "Erreurs signal�es :"
      Height          =   255
      Left            =   0
      TabIndex        =   27
      Top             =   5400
      Width           =   2115
   End
   Begin VB.Menu mnuGImp 
      Caption         =   "&GImp"
      Begin VB.Menu cmdNouveau 
         Caption         =   "&Nouveau�"
         Shortcut        =   ^N
      End
      Begin VB.Menu cmdS�lectionner 
         Caption         =   "&S�lectionner�"
         Shortcut        =   ^S
      End
      Begin VB.Menu cmdImprimer 
         Caption         =   "&Recherche avanc�e�"
         Shortcut        =   ^P
      End
      Begin VB.Menu sep7b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdSyst�meUnix 
         Caption         =   "&Syst�me unix�"
      End
      Begin VB.Menu cmdIdentification 
         Caption         =   "&Identification de l'utilisateur�"
      End
      Begin VB.Menu cmdConfigImprimante 
         Caption         =   "Configuration &imprimantes�"
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuRecherche 
      Caption         =   "&Recherche"
      Begin VB.Menu cmdRechEtablissement 
         Caption         =   "&Etablissement�"
      End
      Begin VB.Menu cmdRechUtilisateur 
         Caption         =   "&Utilisateur�"
      End
      Begin VB.Menu cmdRechUnit� 
         Caption         =   "U&nit�"
      End
      Begin VB.Menu cmdRechDate 
         Caption         =   "&Date�"
      End
      Begin VB.Menu Sep10 
         Caption         =   "-"
      End
      Begin VB.Menu cmdOptions 
         Caption         =   "&Options�"
      End
   End
   Begin VB.Menu mnuSyst�me 
      Caption         =   "&Syst�me"
      Begin VB.Menu cmdTCPFenetre 
         Caption         =   "&Fen�tre TCP"
      End
      Begin VB.Menu cmdRel�cher 
         Caption         =   "&D�bloquer interface"
         Enabled         =   0   'False
      End
      Begin VB.Menu sep4 
         Caption         =   "-"
      End
      Begin VB.Menu cmdEffacerCacheEtablissements 
         Caption         =   "Effacer cache �tablissements"
      End
      Begin VB.Menu sep9 
         Caption         =   "-"
      End
      Begin VB.Menu cmdConnexion 
         Caption         =   "C&onnexion"
      End
      Begin VB.Menu cmdD�connexion 
         Caption         =   "D�conne&xion"
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
      Begin VB.Menu cmdDerni�resModifs 
         Caption         =   "&Derni�res modifications�"
      End
      Begin VB.Menu sep5 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A propos de�"
      End
   End
   Begin VB.Menu mnuPopUp 
      Caption         =   "Pop-up"
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
Attribute VB_Name = "frmGImp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille principale des GImp Microb'Soft"
' Feuille frmGImp
' Feuille principale du gestionnaire d'impression
' 25/10/00 PV
' 31/08/01 PV Param�trage du d�lai du chien de garde � 10min pour GImp
' 15/10/01 FG Traitement des "*" pour le keepalive du d�mon
' 21/11/01 FG iNbDocVides -> Long ! (erreur 6)

Option Explicit

Public iOldEtat As Integer          ' �tat courant de la connexion TCP

'=============================================================================

Private Sub cmdConnexion_Click()
  If tcps.Etat() = 7 Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Connexion
  frmConfigImprimante.InitImprimantes
End Sub

Private Sub cmdD�connexion_Click()
  If tcps.Etat() <> 7 Then Exit Sub  ' D�j� d�connect�
  If bBlocageEnCours Then Beep: Exit Sub
  
  D�connexion
End Sub

Private Sub cmdDerni�resModifs_Click()
  InfoVersion False
End Sub

Private Sub cmdEffacerCacheEtablissements_Click()
  EffaceCacheEtablissements
End Sub

Private Sub cmdIdentification_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim iRep As Integer
  iRep = frmLogin.iInitUtilisateur(True)
  Select Case iRep
    Case 0: ' AjusteSelonNiveauUtilisateur    (� implanter si n�cessaire)
    Case 1: ' Rien (on a annul� la commande)
    Case 2: cmdSyst�meUnix_Click
  End Select
End Sub

Private Sub cmdConfigImprimante_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  frmConfigImprimante.Show vbModal
End Sub


Private Sub cmdOptions_Click()
  frmOptions.Show vbModal
  DoOptionsAffichage
End Sub


Private Sub DoOptionsAffichage()
  mnuSyst�me.Visible = bAfficherMenuSyst�me
  Dim vOff As Integer
  If bAfficherBarreDeBoutons Then
    vOff = tbBoutons.Height
  Else
    vOff = 0
  End If

  If bAfficherBarreDeBoutons Then
    tbBoutons.Visible = True
'    lvInterventions.Top = 31
'    lvInterventions.Height = 174 + ScaleHeight - 454 - vOff + 2 - 30
    
    Line (0, vOff)-Step(ScaleWidth, 0), vbButtonShadow
    Line (0, vOff + 1)-Step(ScaleWidth, 0), vb3DHighlight
  Else
    tbBoutons.Visible = False
'    lvInterventions.Top = 5
'    lvInterventions.Height = 174 + ScaleHeight - 454 + 2 - 30
  End If
End Sub

'========================================================

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
    Dim sMsg As String
    sMsg = sGetIntlLib("GIsRechEtb", "�tablissement(s) s�lectionn�(s) :")
    MsgBox sMsg & sMessage, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechUtilisateur_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim u As Utilisateur
  Set u = frmRechercheUtilisateur.Cherche()
  If Not u Is Nothing Then
    Dim sMsg As String
    sMsg = sGetIntlLib("GIsRechUti", "Utilisateur s�lectionn� :")
    MsgBox sMsg & " " & u.uti_numuti & ": " & u.uti_nom, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechUnit�_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim u As Unite
  Set u = frmRechercheUnit�.Cherche()
  If Not u Is Nothing Then
    Dim sMsg As String
    sMsg = sGetIntlLib("GIsRechUni", "Unit� s�lectionn�e :")
    MsgBox sMsg & " " & u.uni_numunite & ": " & u.uni_code, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechDate_Click()
  Dim d As String
  d = frmRechercheDate.Cherche(Now)
  If d <> "" Then
    Dim sMsg As String
    sMsg = sGetIntlLib("GIsRechDat", "Date s�lectionn�e :")
    MsgBox sMsg & " " & Format(d, "short date"), vbInformation, sNomApp
  End If
End Sub

Private Sub cmdSyst�meUnix_Click()
  If bBlocageEnCours Then Beep: Exit Sub

  Dim sOldSyst�me As String
  sOldSyst�me = sSyst�meDistant
  
restart:
  frmConfigUnix.Show vbModal
  If sSyst�meDistant <> sOldSyst�me Then
    frmSplash.Show
    frmSplash.Refresh
    
    D�connexion
    frmLogin.EffaceCacheMotsDePasse
    iOldEtat = 0    ' Force l'affichage de la mise � jour de l'�tat

    Connexion
    Unload frmSplash
    
    frmSplash.Hide
    Select Case frmLogin.iInitUtilisateur(False)
      Case 1:       ' Annuler
        MsgBox2i "CO025"
        Unload Me     ' Sans risque, on sait que tous les RA sont ferm�s
        Exit Sub
      
      Case 0:       ' Ok
        
      Case 2:       ' Changement de syst�me Unix
        GoTo restart
    End Select

    frmConfigUnix.M�moriseSyst�meDistant
    frmConfigImprimante.InitImprimantes
  End If

End Sub




' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
' Code global de la feuille

Private Sub Form_Load()
  Dim bPremierLancement As Boolean
  Dim sBienvenue As String
  
  ' Internationalisation
  IntlInit
  Internationalisation
  
  If App.PrevInstance Then
    If InStr(Command, "-h") = 0 Then MsgBox2i "CO024", sNomApp
    sNomOp�rateur = GetSetting(sApplicationGlobale, "Utilisateur", "Nom", "")
    On Error Resume Next
    AppActivate sNomApp & " [" & sNomOp�rateur & "]"
    EmergencyExit
  End If
  
  Set frmBase = frmGImp
  frmGImp.Caption = sNomApp
  
  CommandesInitiales
  
  Contr�leDerni�reVersion   ' On v�rifie qu'il n'y a pas plus r�cent sur Z
  Contr�leEnvironnement     ' On v�rifie que l'environnement du programme est Ok
  
  frmOptions.InitOptions
  If GetSetting(sApplicationGlobale, "Options", "Fen�treTCP", 0) Then
    cmdTCPFenetre.Checked = True
    tcps.AfficheTrace True
  End If
  ' Le gestionnaire d'impression a un d�lai de chien de garde plus important
  tcps.D�finitD�laiGarde 10 * 60
  
  ' On centre la fen�tre
  Move (Screen.Width - Width) / 2, (Screen.Height - Height) / 2
  Show
  
  AppActivate Caption   ' Au cas o� on lance avec la touche shift press�e
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
      frmSplash.Height = 3700
      
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

  frmConfigUnix.InitSyst�me
  If sSyst�meDistant = "" Then
    MsgBox2i "CO037"
    EmergencyExit
  End If

  ' On se connecte�
  Connexion
  frmConfigUnix.M�moriseSyst�meDistant

  ' Connexion
  Select Case frmLogin.iInitUtilisateur(False)
    Case 0:   ' Ok
    
    Case 1:   ' Annuler
      MsgBox2i "CO025"
      EmergencyExit
      
    Case 2:   ' Changement de syst�me Unix
      cmdSyst�meUnix_Click
  End Select
  
  ' Si le cache de messages internationaux n'existe pas, on le charge
  ' et on remet � jour l'interface
  If bIntlInitCache Then Internationalisation

  ' AjusteSelonNiveauUtilisateur
  
  If bPremierLancement Then
    frmSplash.lblChargement.Visible = False
    frmSplash.lblBienvenue.Visible = True
    
    frmSplash.lblBienvenue = sBienvenue
    frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("GIsBienvenueI1", "") & vbCrLf
    frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("GIsBienvenueI2", "") & vbCrLf & vbCrLf
    frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("GIsBienvenueI3", "")
    
    frmSplash.Width = 7035
    frmSplash.Height = 3700
    frmSplash.Show vbModal
  End If

  ' On lit le nom des deux iprimantes dans la registry
  frmConfigImprimante.InitImprimantes
  If sImprimanteLaser = "" Then
    MsgBox2i "CO039"
    EmergencyExit
    End
  End If
  
  If bPremierLancement Then
    frmSplash.lblChargement.Visible = False
    frmSplash.lblBienvenue.Visible = True
    frmSplash.lblBienvenue = sBienvenue
    frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("sBienvenue4", "Fin de l'initialisation")
    frmSplash.Width = 7035
    frmSplash.Height = 3700
    frmSplash.Show vbModal
  End If

  ' Fin du chargement
  Enabled = True
  Unload frmSplash
  
  ' On affecte l'image list
  '  lvInterventions.SmallIcons = frmLogo.ilProprio

  ' On remplit la combo
  cob_classedoc.AddItem "AB"
  cob_classedoc.AddItem "BS"
  cob_classedoc.AddItem "LI"
  cob_classedoc.AddItem "FS"
  cob_classedoc.AddItem "HU"
  cob_classedoc.AddItem "CH"
  cob_classedoc.AddItem "EH"
  
  ' Affichage des informations sur la nouvelle version
  InfoVersion True
End Sub


Private Sub InfoVersion(bD�marrage As Boolean)
  Dim sVersionInfo As String, sVersionProgramme As String
  Dim sInfo As String
  
  sVersionInfo = GetSetting(sApplicationGlobale, "G�n�ral", "VersionInfo", "")
  sVersionProgramme = App.Major & "." & App.Minor & "." & App.Revision
  If Not bD�marrage Or sVersionProgramme <> sVersionInfo Then
    Select Case App.Revision
      Case 159:
        sInfo = "D�sormais quand on ajoute un �tablissement � un GImp, le nombre de BS, de FS, de chimies et d'EH est automatiquement rempli � partir des nouveaux champs du fichier �tablissement." & vbCrLf & vbCrLf & "Si les valeurs sont incorrectes (ou tout simplement pas remplies), signalez-le � la DOP (SevVer@ercem.com ou DOP@ercem.com)"
    End Select

    If sInfo <> "" Then MsgBox2i "PL104", sVersionProgramme, sInfo, sVersionProgramme
                        'MsgBox "Informations sur la version " & sVersionProgramme & vbCrLf & vbCrLf & sInfo, vbInformation, "GImp version " & sVersionProgramme
    If sVersionProgramme <> sVersionInfo Then SaveSetting sApplicationGlobale, "G�n�ral", "VersionInfo", sVersionProgramme
  End If
  
End Sub

Private Sub Form_Paint()
  Line (0, 0)-Step(ScaleWidth, 0), vbButtonShadow
  Line (0, 1)-Step(ScaleWidth, 0), vb3DHighlight
  
  If (bAfficherBarreDeBoutons) Then
    Dim vOff As Integer
    If bAfficherBarreDeBoutons Then
      vOff = tbBoutons.Height
    Else
      vOff = 0
    End If

    Line (0, vOff)-Step(ScaleWidth, 0), vbButtonShadow
    Line (0, vOff + 1)-Step(ScaleWidth, 0), vb3DHighlight
  End If
End Sub


' ===============================================================================

Private Sub cmdAPropos_Click()
  frmAPropos.Show vbModal
End Sub

Private Sub cmdRel�cher_Click()
  Rel�cher
End Sub


Sub cmdNouveau_Click()
  txtDate = ""
  txtR�f�rence = ""
  txtPrefixe = ""
  lvInterventions.ListItems.Clear
End Sub

Sub cmdS�lectionner_Click()

End Sub

Sub cmdImprimer_Click()
Dim sMsg As String, sNormalis� As String
  Dim sCmd As String
  Dim sDate As String
  Dim br As New Rev
  Dim d As Date
  Dim sReq As String
  Dim szLettres As String
  Dim iIntervention As Long
  Dim iNbErreurs As Integer
  Dim iNbDocVides As Long
  
  lvInterventions.ListItems.Clear
  br.Clear
  iNbErreurs = 0
  iNbDocVides = 0
  txtInfosErreurs.BackColor = &HFFFFFF
  txtInfosErreurs.Text = ""
  
  If txtDate = "" And txtR�f�rence = "" And txtPrefixe = "" And txtNumEtb = "" And txtNumSec = "" And txtNumDrg = "" And txtNumDna = "" And txtNumGrp = "" Then
    MsgBox "Veuillez entrer soit une date, soit une r�f�rence, soit un pr�fixe client avant de lancer l'�dition !"
    Exit Sub
  End If
  
  If txtR�f�rence = "" And chk_duplicata Then
    MsgBox "La mention duplicata ne peut �tre utilis� que pour une r�f�rence d'intervention"
    Exit Sub
  End If
  
  ' On fabrique le query global
  If txtDate = "TOUT" Then
   sReq = ""
  Else
    If txtDate <> "" Then
      sReq = "pla_dateplan$" & sNormaliseQuery(txtDate, "d")
    End If
  
    If txtR�f�rence <> "" Then
      If sReq <> "" Then sReq = sReq & "$"
      szLettres = UCase(Left(txtR�f�rence, 2))
      iIntervention = Val(Mid(txtR�f�rence, 3))
      If IsNumeric(szLettres) Or iIntervention < 100000 Or iIntervention > 999999 Then
        MsgBox "R�f�rence invalide ! r�f�rence sous la forme AB123456"
        Exit Sub
      End If
      
      If chk_edforcee And txtDate = "" And txtPrefixe = "" And txtNumEtb = "" And txtNumSec = "" And txtNumDrg = "" And txtNumDna = "" And txtNumGrp = "" Then
        ' si �d forc�e et qu'on a mis QUE la r�f�rence, utilisation de la commande IREF
        ' si l'option forc�e est coch�e, ne r��dite QUE les documents d�j� �dit�s.
      Else
        sReq = sReq & "pla_iref$" & sNormaliseQuery(iIntervention, "n") & "$pla_lettres$" & szLettres
      End If
    End If
    If txtPrefixe <> "" Then
      If sReq <> "" Then sReq = sReq & "$"
      sReq = sReq & "etb_prefixe$" & sNormaliseQuery(txtPrefixe, "a")
    End If
    If txtNumEtb <> "" Then
      If sReq <> "" Then sReq = sReq & "$"
      sReq = sReq & "pla_etb$" & sNormaliseQuery(txtNumEtb, "a")
    End If
    If txtNumSec <> "" Then
      If sReq <> "" Then sReq = sReq & "$"
      sReq = sReq & "!pla_etb=etb_numetb and etb_numsec=" & sNormaliseQuery(txtNumSec, "n")
    End If
    If txtNumDrg <> "" Then
      If sReq <> "" Then sReq = sReq & "$"
      sReq = sReq & "!pla_etb=etb_numetb and etb_numsec=sec_numsec and sec_numdrg=" & sNormaliseQuery(txtNumDrg, "n")
    End If
    If txtNumDna <> "" Then
      If sReq <> "" Then sReq = sReq & "$"
      sReq = sReq & "!pla_etb=etb_numetb and etb_numsec=sec_numsec and sec_numdrg=drg_numdrg and drg_numdna=" & sNormaliseQuery(txtNumDna, "n")
    End If
    If txtNumGrp <> "" Then
      If sReq <> "" Then sReq = sReq & "$"
      sReq = sReq & "!pla_etb=etb_numetb and etb_numsec=sec_numsec and sec_numdrg=drg_numdrg and drg_numdna=dna_numdna and dna_numgrp=" & sNormaliseQuery(txtNumGrp, "n")
    End If
  End If
  
  'MsgBox "sReq = " & sReq
  
  If chk_duplicata Then
    Bloquer
      tcps.Envoie "EDDUP 1"
      AttendSynchro
    Rel�cher
  End If
  
  br.AddField sImprimanteLaser
  
  If chk_edforcee And txtR�f�rence <> "" Then
    sCmd = "IREF"
    br.AddField szLettres
    br.AddField iIntervention
    If cob_classedoc <> "" Then
      br.AddField cob_classedoc
    Else
      br.AddField "*"
    End If
    If txtTrancheDoc <> "" Then
      br.AddField txtTrancheDoc
    Else
      br.AddField "A"
    End If
  Else
    sCmd = "IDOC"
    br.AddField sReq
  End If
  
  'MsgBox "buff=" & br.Buffer
  
  Bloquer
    tcps.Envoie sCmd & " " & br.Buffer
     
    Dim sLigne As String
    Dim iNiveauMsg As Integer
    Dim sRef As String
    Dim sNomEtb As String
    Dim sTexteMsg As String
    Dim itmX As ListItem
    Do
      sLigne = tcps.Re�oit
      If Left(sLigne, 2) = "->" Then Exit Do
      ' on r�cup�re la ligne compl�te dans la structure rev VB

      br.Buffer = sLigne
      If sLigne = "*" Then
        'MsgBox "*"
        br.Buffer = ""
        AfficheBarreProgression 0, 20, iNbDocVides Mod 21
        iNbDocVides = iNbDocVides + 1
        sLigne = ""
      Else
        'MsgBox "sLigne = " & sLigne
        ' on convertit les champs...
        br.iGetField iNiveauMsg
        br.GetField sRef
        br.GetField sNomEtb
        br.GetField sTexteMsg
        
        If iNiveauMsg = 1 Then
          'Set itmX = lvInterventions.ListItems.Add(1)
          Set itmX = lvInterventions.ListItems.Add
          itmX.SubItems(1) = sRef
          itmX.SubItems(2) = sNomEtb
          lvInterventions.ListItems(lvInterventions.ListItems.count).EnsureVisible
          If lvInterventions.ListItems.count > 1 Then
            lvInterventions.ListItems(lvInterventions.ListItems.count - 1).Selected = False
          End If
          lvInterventions.ListItems(lvInterventions.ListItems.count).Selected = True
        Else
          'MsgBox "Erreur d'impression sur la r�f�rence " & sRef & vbCrLf & sTexteMsg, vbExclamation
          iNbErreurs = iNbErreurs + 1
          txtInfosErreurs.BackColor = &H8080FF
          txtInfosErreurs.Text = txtInfosErreurs.Text & sTexteMsg & vbCrLf
        End If
        'txtInfosErreurs.Text = txtInfosErreurs.Text + "Ligne OK" + vbCrLf
        lvInterventions.Refresh
      End If
    Loop
    'AttendSynchro
  Rel�cher
  
  If iNbErreurs > 0 Then
    MsgBox iNbErreurs & " erreurs ont �t� signal�es lors de l'�dition" & vbCrLf & "Veuillez corriger ces erreurs avant de relancer les �ditions", vbExclamation
  End If
  MsgBox "Impression termin�e - " & lvInterventions.ListItems.count & " documents imprim�s", vbInformation
  pbProgress.Visible = False
    
  ' on enl�ve la mention duplicata !
  If chk_duplicata Then
    Bloquer
      tcps.Envoie "EDDUP 0"
      AttendSynchro
    Rel�cher
  End If
End Sub

Public Sub DoLecture(txtDate As String, txtLettres As String, txtR�f�rence As String, txtNumEtb As String, txtPr�fixe As String, iCl�t As Integer, sTitreArbre As String)
  Dim sReq As String
  
  If txtDate = "" And txtLettres = "" And txtR�f�rence = "" And txtNumEtb = "" Then
    MsgBox2i "PL001"
    Exit Sub
  End If
  
  ' On fabrique le query global
  If txtDate <> "" Then
    sReq = "pla_dateplan$" & sNormaliseQuery(txtDate, "d")
  End If
  
  If txtLettres <> "" Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "pla_lettres$" & sNormaliseQuery(txtLettres, "l")
  End If
  
  If txtR�f�rence <> "" Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "pla_iref$" & sNormaliseQuery(txtR�f�rence, "n")
  End If
  
  If txtNumEtb <> "" Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "pla_etb$" & sNormaliseQuery(txtNumEtb, "a")
  End If
  
  If txtPr�fixe <> "" Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "etb_prefixe$" & sNormaliseQuery(txtPr�fixe, "a")
  End If
  
  
  If iCl�t <> 0 Then
    If sReq <> "" Then sReq = sReq & "$"
    If iCl�t = 1 Then sReq = sReq & "pla_persclot$<>"
    If iCl�t = 2 Then sReq = sReq & "pla_persclot$="
  End If
  
  If Not bShiftPressed Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "pla_etb$<>7"
  End If
  
  sbStatus.Panels("Info").Text = sGetIntlLib("GIRechEnCours", "Recherche des documents en cours�")

  If 0 = 0 Then
    sbStatus.Panels("Info").Text = ""
    MsgBox2i "PL002"
    Exit Sub
  End If
  
End Sub

Private Sub cmdQuitter_Click()
  tcps.Ferme
  tcps.Destruction
  
  Dim f
  For Each f In Forms
    If Not f Is Me Then Unload f
  Next
  Unload Me
End Sub

Private Sub cmdTCPFenetre_Click()
  cmdTCPFenetre.Checked = Not cmdTCPFenetre.Checked
  tcps.AfficheTrace cmdTCPFenetre.Checked
  SaveSetting sApplicationGlobale, "Options", "Fen�treTCP", IIf(cmdTCPFenetre.Checked, 1, 0)
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If bBlocageEnCours Then Beep: Cancel = True: Exit Sub
  cmdQuitter_Click
End Sub

Public Sub lvInterventions_Click()
  ' A faire
End Sub

Private Sub lvInterventions_ItemClick(ByVal Item As ListItem)
  lvInterventions_Click
End Sub

Private Sub cmdModifier_Click()

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

Private Sub sbStatus_PanelDblClick(ByVal Panel As Panel)
  If Panel.Key = "Info" Then MsgBox sGetIntlLib("GIpnlInfo.hlp", "Cette zone affiche des messages d'aide et d'information g�n�raux, en particulier le r�le de l'�l�ment s�lectionn�."), vbInformation, sNomApp
  If Panel.Key = "ECom" Then cmdSyst�meUnix_Click
  If Panel.Key = "Impr" Then cmdConfigImprimante_Click
  If Panel.Key = "EInt" Then MsgBox sGetIntlLib("GIpnlInt.hlp", "Cette zone indique si le programme �change des donn�es avec le d�mon Unix." & vbCrLf & "A vide, indique qu'il n'y a pas de communication en cours." & vbCrLf & "Le cadenas indique qu'il y a un �change de donn�es en cours."), vbInformation, sNomApp
End Sub


' ===============================================================================
' Barre de boutons

Private Sub tbBoutons_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then PopupMenu mnuBarreBoutons
End Sub

' L'effacement de la barre de boutons est sous-trait� plus haut
Private Sub cmdBarreStandard_Click()
  frmOptions.PasDeBarreDeBoutons
  DoOptionsAffichage
End Sub

Private Sub tbBoutons_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Key
    Case "btnNouveau":          cmdNouveau_Click
    Case "btnS�lectionner":     cmdS�lectionner_Click
    Case "btnImprimer":         cmdImprimer_Click
    
    Case "btnUnix":             cmdSyst�meUnix_Click
    Case "btnUtilisateur":      cmdIdentification_Click
    Case "btnImprimante":       cmdConfigImprimante_Click
    
    Case Else:
      MsgBox2i "PL105", Button.Key
      'MsgBox "Bouton " & Button.Key & " de la barre de boutons non trait� !", vbCritical, sNomApp
      Stop
  End Select
End Sub



Private Sub Timer1_Timer()
  Dim e As Integer
  e = tcps.Etat()
  If e <> iOldEtat Then
    sbStatus.Panels("ECom").Text = tcps.sEtatD�cod�
    sbStatus.Refresh
    iOldEtat = e
  End If
End Sub


Private Sub cmdAideSommaire_Click()
  Aide "index"
End Sub

Private Sub cmdAideContextuelle_Click()
  Aide "frmgimp"
End Sub


Public Sub AfficheBarreProgression(iMin As Integer, iMax As Integer, iValeur As Integer)
  pbProgress.Min = iMin
  pbProgress.Max = iMax
  pbProgress.Value = iValeur
  
  pbProgress.Move sbStatus.Panels(2).Left, sbStatus.Top + 2, sbStatus.Panels(2).Width, sbStatus.Height - 2
  pbProgress.ZOrder 0
  pbProgress.Visible = True
End Sub


'========================================================
' Menu contextuel

Private Sub mnuPopUpInterventions_Click()
'  cmdPopUpAjouter.Enabled = iNiveauCourant = 2
'  cmdPopUpModifier.Enabled = lvInterventions.ListItems.count > 0
'  cmdPopUpSupprimer.Enabled = lvInterventions.ListItems.count > 0
End Sub

Private Sub cmdPopUpAjouter_Click()
'  cmdAjouter_Click
End Sub

Private Sub cmdPopUpModifier_Click()
'  cmdModifier_Click
End Sub

Private Sub cmdPopUpSupprimer_Click()
'  cmdSupprimer_Click
End Sub



'========================================================
' Internationalisation

Public Sub Internationalisation()
  sNomApp = sGetIntlLib("sNomApp", "Microb'Soft - Gestionnaire d'impression")
  If sNomOp�rateur <> "" Then Caption = sNomApp & " [" & sNomOp�rateur & "]"
  
  SetLib txtInfo, "Text", "msgInfo"
  SetLib txtInfo, "ToolTipText", "msgInfo.tt"

  
  ' Menus et commandes
  SetLib mnuGImp, "Caption", "GImnuGImp"
  SetLib cmdNouveau, "Caption", "GIcmdNouveau"
  SetLib cmdS�lectionner, "Caption", "GIcmdS�lectionner"
  SetLib cmdImprimer, "Caption", "GIcmdImprimer"
  SetLib cmdSyst�meUnix, "Caption", "GIcmdSyst�meUnix"
  SetLib cmdIdentification, "Caption", "GIcmdIdentification"
  SetLib cmdConfigImprimante, "Caption", "GIcmdConfigImprimant"
  SetLib cmdQuitter, "Caption", "GIcmdQuitter"
  
  SetLib mnuRecherche, "Caption", "GImnuRecherche"
  SetLib cmdRechEtablissement, "Caption", "GIcmdRechEtablisseme"
  SetLib cmdRechUtilisateur, "Caption", "GIcmdRechUtilisateur"
  SetLib cmdRechUnit�, "Caption", "GIcmdRechUnit�"
  SetLib cmdRechDate, "Caption", "GIcmdRechDate"
  SetLib cmdOptions, "Caption", "GIcmdOptions"
  
  SetLib mnuSyst�me, "Caption", "GImnuSyst�me"
  SetLib cmdTCPFenetre, "Caption", "GIcmdTCPFenetre"
  SetLib cmdRel�cher, "Caption", "GIcmdRel�cher"
  SetLib cmdEffacerCacheEtablissements, "Caption", "GIcmdEffacerCacheEta"
  SetLib cmdConnexion, "Caption", "GIcmdConnexion"
  SetLib cmdD�connexion, "Caption", "GIcmdD�connexion"
  
  SetLib mnuAide, "Caption", "GImnuAide"
  SetLib cmdAideSommaire, "Caption", "GIcmdAideSommaire"
  SetLib cmdAideContextuelle, "Caption", "GIcmdAideContextuell"
  SetLib cmdDerni�resModifs, "Caption", "GIcmdDerni�resModifs"
  SetLib cmdAPropos, "Caption", "GIcmdAPropos"
  
  SetLib cmdPopUpAjouter, "Caption", "GIcmdPopUpAjouter"
  SetLib cmdPopUpModifier, "Caption", "GIcmdPopUpModifier"
  SetLib cmdPopUpSupprimer, "Caption", "GIcmdPopUpSupprimer"
  
  SetLib cmdBarreStandard, "Caption", "GIcmdBarreStandard"
  
  
  'Boutons
  SetLib tbBoutons.Buttons("btnNouveau"), "ToolTipText", "GItbbNouv.tt"
  SetLib tbBoutons.Buttons("btnS�lectionner"), "ToolTipText", "GItbbS�l.tt"
  SetLib tbBoutons.Buttons("btnImprimer"), "ToolTipText", "GItbbImp.tt"
    
  SetLib tbBoutons.Buttons("btnUnix"), "ToolTipText", "GItbbUnix.tt"
  SetLib tbBoutons.Buttons("btnUtilisateur"), "ToolTipText", "GItbbUtilisateur.tt"
  SetLib tbBoutons.Buttons("btnImprimante"), "ToolTipText", "GItbbImprimante.tt"
    
  ' ListView prestations
  SetLib lvInterventions.ColumnHeaders(2), "Text", "GIlblchRef"
  SetLib lvInterventions.ColumnHeaders(3), "Text", "GIlblchEtb"
  
  ' Tooltip statusbar
  SetLib sbStatus.Panels(2), "ToolTipText", "GIsbStatus(2).tt"
  SetLib sbStatus.Panels(3), "ToolTipText", "GIsbStatus(3).tt"
  SetLib sbStatus.Panels(4), "ToolTipText", "GIsbStatus(4).tt"
  
  ' Police r�duite pour les labels d'information
'  AjusteControle lblT�teTout
End Sub

Private Sub txtNumSec_KeyPress(KeyAscii As Integer)
  If KeyAscii <> 8 And KeyAscii < 48 Or KeyAscii > 57 Then
    KeyAscii = 0
  End If
End Sub

Private Sub txtNumDrg_KeyPress(KeyAscii As Integer)
  If KeyAscii <> 8 And KeyAscii < 48 Or KeyAscii > 57 Then
    KeyAscii = 0
  End If
End Sub

Private Sub txtNumDna_KeyPress(KeyAscii As Integer)
  If KeyAscii <> 8 And KeyAscii < 48 Or KeyAscii > 57 Then
    KeyAscii = 0
  End If
End Sub

Private Sub txtNumGrp_KeyPress(KeyAscii As Integer)
  If KeyAscii <> 8 And KeyAscii < 48 Or KeyAscii > 57 Then
    KeyAscii = 0
  End If
End Sub

Private Sub txtR�f�rence_Change()
  If txtR�f�rence <> UCase(txtR�f�rence) Then bToMaj txtR�f�rence
End Sub

Private Sub txtDate_Change()
  If txtDate <> UCase(txtDate) Then bToMaj txtDate
End Sub

