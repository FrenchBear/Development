VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmTarifDétail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Ligne de tarif"
   ClientHeight    =   7005
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9240
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmTarifDétail.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7005
   ScaleWidth      =   9240
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin TablesServeur.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   67
      Top             =   0
      Width           =   9240
      _ExtentX        =   16298
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
   Begin VB.PictureBox picInfos 
      BackColor       =   &H00FFC0FF&
      BorderStyle     =   0  'None
      Height          =   1095
      Index           =   3
      Left            =   120
      ScaleHeight     =   1095
      ScaleWidth      =   6195
      TabIndex        =   35
      Top             =   3240
      Width           =   6195
      Begin MSWLess.WLText txtNomMéthode 
         Height          =   315
         Left            =   2280
         TabIndex        =   41
         TabStop         =   0   'False
         Top             =   360
         Width           =   3855
         _ExtentX        =   6800
         _ExtentY        =   556
         _Version        =   393216
         Locked          =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtNomParamètre 
         Height          =   315
         Left            =   2280
         TabIndex        =   38
         TabStop         =   0   'False
         Top             =   0
         Width           =   3855
         _ExtentX        =   6800
         _ExtentY        =   556
         _Version        =   393216
         Locked          =   -1  'True
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtSensibilité 
         Height          =   315
         Left            =   3420
         TabIndex        =   45
         Top             =   720
         Width           =   435
         _ExtentX        =   767
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtSousTraitant 
         Height          =   315
         Left            =   4800
         TabIndex        =   47
         Top             =   720
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtQuantité 
         Height          =   315
         Left            =   1500
         TabIndex        =   43
         Top             =   720
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtParamètre 
         Height          =   315
         Left            =   1500
         TabIndex        =   37
         Top             =   0
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtMéthode 
         Height          =   315
         Left            =   1500
         TabIndex        =   40
         Top             =   360
         Width           =   735
         _ExtentX        =   1296
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblSensibilité 
         Caption         =   "Sensibilité :"
         Height          =   255
         Left            =   2280
         TabIndex        =   44
         Top             =   720
         Width           =   1155
      End
      Begin VB.Label lblSousTraitant 
         Caption         =   "Ss-trait :"
         Height          =   255
         Left            =   3900
         TabIndex        =   46
         Top             =   720
         Width           =   915
      End
      Begin VB.Label lblQuantité 
         Caption         =   "Quantité :"
         Height          =   255
         Left            =   0
         TabIndex        =   42
         Top             =   780
         Width           =   1035
      End
      Begin VB.Label lblParamètre 
         AutoSize        =   -1  'True
         Caption         =   "Paramètre :"
         Height          =   210
         Left            =   0
         TabIndex        =   36
         Top             =   60
         Width           =   1125
      End
      Begin VB.Label lblMéthode 
         Caption         =   "Méthode :"
         Height          =   255
         Left            =   0
         TabIndex        =   39
         Top             =   420
         Width           =   1035
      End
   End
   Begin VB.PictureBox picInfos 
      BackColor       =   &H00FFFFC0&
      BorderStyle     =   0  'None
      Height          =   855
      Index           =   4
      Left            =   6180
      ScaleHeight     =   855
      ScaleWidth      =   2295
      TabIndex        =   48
      Top             =   4140
      Width           =   2295
      Begin MSWLess.WLText txtTarifSupplémentaire 
         Height          =   315
         Left            =   0
         TabIndex        =   50
         Top             =   360
         Width           =   6075
         _ExtentX        =   10716
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblTarifSupplémentaire 
         AutoSize        =   -1  'True
         Caption         =   "Tarif supplémentaire :"
         Height          =   210
         Left            =   0
         TabIndex        =   49
         Top             =   60
         Width           =   2070
      End
   End
   Begin VB.PictureBox picInfos 
      BackColor       =   &H00C0FFC0&
      BorderStyle     =   0  'None
      Height          =   915
      Index           =   2
      Left            =   4440
      ScaleHeight     =   915
      ScaleWidth      =   4095
      TabIndex        =   30
      Top             =   3300
      Width           =   4095
      Begin MSWLess.WLText txt22 
         Height          =   315
         Left            =   1500
         TabIndex        =   34
         Top             =   360
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txt21 
         Height          =   315
         Left            =   1500
         TabIndex        =   32
         Top             =   0
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lbl22 
         Caption         =   "Métaméthode :"
         Height          =   255
         Left            =   0
         TabIndex        =   33
         Top             =   420
         Width           =   1455
      End
      Begin VB.Label lbl21 
         Caption         =   "Critère :"
         Height          =   255
         Left            =   0
         TabIndex        =   31
         Top             =   60
         Width           =   855
      End
   End
   Begin VB.PictureBox picInfos 
      BackColor       =   &H00C0E0FF&
      BorderStyle     =   0  'None
      Height          =   795
      Index           =   1
      Left            =   5160
      ScaleHeight     =   795
      ScaleWidth      =   3375
      TabIndex        =   28
      Top             =   4620
      Width           =   3375
      Begin VB.Label lbl1 
         Caption         =   "X"
         Height          =   315
         Left            =   1080
         TabIndex        =   29
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.Frame fraPrix 
      Caption         =   "Prix ou remise"
      Height          =   1035
      Left            =   60
      TabIndex        =   51
      Top             =   4440
      Width           =   6195
      Begin VB.ComboBox cboDevise 
         Height          =   330
         ItemData        =   "frmTarifDétail.frx":014A
         Left            =   3000
         List            =   "frmTarifDétail.frx":0154
         Style           =   2  'Dropdown List
         TabIndex        =   54
         Top             =   240
         Width           =   615
      End
      Begin VB.OptionButton optPrixRemise 
         Caption         =   "&Remise :"
         Height          =   210
         Index           =   1
         Left            =   120
         TabIndex        =   55
         TabStop         =   0   'False
         Top             =   660
         Width           =   1215
      End
      Begin VB.OptionButton optPrixRemise 
         Caption         =   "Pri&x :"
         Height          =   210
         Index           =   0
         Left            =   120
         TabIndex        =   52
         TabStop         =   0   'False
         Top             =   300
         Width           =   915
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "% sur tarif de base, en + de B/C"
         Height          =   210
         Left            =   3000
         TabIndex        =   66
         Top             =   660
         Width           =   3060
      End
      Begin MSWLess.WLText txtRemise 
         Height          =   315
         Left            =   1560
         TabIndex        =   56
         Top             =   600
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtPrix 
         Height          =   315
         Left            =   1560
         TabIndex        =   53
         Top             =   240
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
   End
   Begin VB.Frame fraElément 
      Caption         =   "Nature de la ligne de tarif"
      Height          =   2775
      Left            =   60
      TabIndex        =   0
      Top             =   420
      Width           =   9135
      Begin VB.OptionButton optNiveau 
         Caption         =   "Le (Légionelle)"
         Height          =   210
         Index           =   9
         Left            =   4380
         TabIndex        =   14
         Top             =   840
         Width           =   1815
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "AV (ABVT)"
         Height          =   210
         Index           =   10
         Left            =   2940
         TabIndex        =   13
         Top             =   840
         Width           =   1335
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "BM (OGM)"
         Height          =   210
         Index           =   19
         Left            =   6480
         TabIndex        =   16
         Top             =   840
         Width           =   1455
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "Tarif libre"
         Height          =   210
         Index           =   40
         Left            =   2940
         TabIndex        =   27
         Top             =   2280
         Width           =   1695
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "Surface"
         Height          =   210
         Index           =   33
         Left            =   6900
         TabIndex        =   25
         Top             =   1920
         Width           =   1275
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "AB,BS,Li,Hu"
         Height          =   210
         Index           =   31
         Left            =   2940
         TabIndex        =   23
         Top             =   1920
         Width           =   1635
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "Param"
         Height          =   210
         Index           =   30
         Left            =   2940
         TabIndex        =   21
         Top             =   1560
         Width           =   1035
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "Chimie"
         Height          =   210
         Index           =   32
         Left            =   4740
         TabIndex        =   24
         Top             =   1920
         Width           =   1275
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "Forfait global"
         Height          =   210
         Index           =   0
         Left            =   2940
         TabIndex        =   2
         Top             =   240
         Width           =   1635
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "&Spécifique"
         Height          =   210
         Index           =   2
         Left            =   6900
         TabIndex        =   4
         Top             =   240
         Width           =   1400
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "Hu"
         Height          =   210
         Index           =   18
         Left            =   6480
         TabIndex        =   11
         Top             =   600
         Width           =   615
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "Li"
         Height          =   210
         Index           =   17
         Left            =   5160
         TabIndex        =   9
         Top             =   600
         Width           =   615
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "BS"
         Height          =   210
         Index           =   16
         Left            =   4380
         TabIndex        =   8
         Top             =   600
         Width           =   615
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "&EH / Scénario"
         Height          =   210
         Index           =   22
         Left            =   6900
         TabIndex        =   19
         Top             =   1200
         Width           =   1575
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "&Chimie (FDA)"
         Height          =   210
         Index           =   21
         Left            =   4740
         TabIndex        =   18
         Top             =   1200
         Width           =   1695
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "&Critère microbio"
         Height          =   210
         Index           =   20
         Left            =   2940
         TabIndex        =   17
         Top             =   1200
         Width           =   1815
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "Ch"
         Height          =   210
         Index           =   15
         Left            =   7200
         TabIndex        =   12
         Top             =   600
         Width           =   615
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "FS"
         Height          =   210
         Index           =   14
         Left            =   5820
         TabIndex        =   10
         Top             =   600
         Width           =   615
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "&Déplacement"
         Height          =   210
         Index           =   1
         Left            =   4740
         TabIndex        =   3
         Top             =   240
         Width           =   1635
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "&EH"
         Height          =   210
         Index           =   12
         Left            =   3660
         TabIndex        =   7
         Top             =   600
         Width           =   615
      End
      Begin VB.OptionButton optNiveau 
         Caption         =   "&AB"
         Height          =   210
         Index           =   11
         Left            =   2940
         TabIndex        =   6
         Top             =   600
         Width           =   615
      End
      Begin VB.Label lblNiveau 
         AutoSize        =   -1  'True
         Caption         =   "Prix complémentaires"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   6
         Left            =   180
         TabIndex        =   26
         Top             =   2280
         Width           =   2160
      End
      Begin VB.Label lblNiveau 
         AutoSize        =   -1  'True
         Caption         =   "Param. de prise en charge"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   5
         Left            =   180
         TabIndex        =   22
         Top             =   1920
         Width           =   2595
      End
      Begin VB.Label lblNiveau 
         AutoSize        =   -1  'True
         Caption         =   "Prix au paramètre"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   4
         Left            =   180
         TabIndex        =   20
         Top             =   1560
         Width           =   1800
      End
      Begin VB.Label lblNiveau 
         AutoSize        =   -1  'True
         Caption         =   "Forfaits globaux"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   2
         Left            =   180
         TabIndex        =   1
         Top             =   240
         Width           =   1605
      End
      Begin VB.Label lblNiveau 
         AutoSize        =   -1  'True
         Caption         =   "Prix/Critère, FDA, EH"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   1
         Left            =   180
         TabIndex        =   15
         Top             =   1200
         Width           =   2130
      End
      Begin VB.Label lblNiveau 
         AutoSize        =   -1  'True
         Caption         =   "Prix/Classe de document"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   210
         Index           =   0
         Left            =   180
         TabIndex        =   5
         Top             =   600
         Width           =   2490
      End
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   63
      Top             =   6690
      Width           =   9240
      _ExtentX        =   16298
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
   Begin MSWLess.WLText txtNiveau 
      DataField       =   "timestamp"
      Height          =   315
      Left            =   3780
      TabIndex        =   65
      TabStop         =   0   'False
      Top             =   6300
      Width           =   915
      _ExtentX        =   1614
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   12640511
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtOption 
      DataField       =   "timestamp"
      Height          =   315
      Left            =   4740
      TabIndex        =   64
      TabStop         =   0   'False
      Top             =   6300
      Width           =   3735
      _ExtentX        =   6588
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   12640511
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtTimeStamp 
      DataField       =   "timestamp"
      Height          =   315
      Left            =   1620
      TabIndex        =   62
      TabStop         =   0   'False
      Top             =   6300
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtComment 
      DataField       =   "tar_comment"
      Height          =   315
      Left            =   1620
      TabIndex        =   58
      Top             =   5580
      Width           =   6855
      _ExtentX        =   12091
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   65
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtIdModif 
      DataField       =   "tar_idmodif"
      Height          =   315
      Left            =   1620
      TabIndex        =   60
      TabStop         =   0   'False
      Top             =   5940
      Width           =   3750
      _ExtentX        =   6615
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
      Caption         =   "Commentaire :"
      Height          =   210
      Index           =   3
      Left            =   120
      TabIndex        =   57
      Top             =   5640
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   120
      TabIndex        =   61
      Top             =   6360
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   14
      Left            =   120
      TabIndex        =   59
      Top             =   6000
      Width           =   1380
   End
End
Attribute VB_Name = "frmTarifDétail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTarifDétail
' Gère le détail d'une ligne de tarif
'  4/09/00 PV
'  9/01/01 PV BDSélecteur et niveaux Satti
' 15/01/01 PV Classe BM / OGM
' 19/07/01 PV Classe AV
'  7/08/01 PV Fin des prix Satti; Classe Le


Option Explicit

Private iPic As Integer               ' Index des champs variables affichés

Private iLigne As Integer
Private iNiveau As Integer            ' Niveau de la ligne de tarif
Private iPrixRemise As Integer        ' 0=prix, 1=remise

Private bOkModif As Boolean
Private bModifié As Boolean


'=================================================================================
' Actions du sélecteur

Private Sub bdSél_ActionAdd():      ActionAdd:      End Sub
Private Sub bdSél_ActionCancel():   ActionCancel:   End Sub
'Private Sub bdSél_ActionChange():   ActionChange:   End Sub
'Private Sub bdSél_ActionDelete():   ActionDelete:   End Sub
Private Sub bdSél_ActionFirst():    ActionFirst:    End Sub
Private Sub bdSél_ActionLast():     ActionLast:     End Sub
Private Sub bdSél_ActionNext():     ActionNext:     End Sub
Private Sub bdSél_ActionPrevious(): ActionPrevious: End Sub
'Private Sub bdSél_ActionQuery():    ActionQuery:    End Sub
Private Sub bdSél_ActionValidate(): ActionValidate: End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  ResetChienDeGarde
  If KeyCode = 27 Then bdSél.KeyDown KeyCode
End Sub


'=================================================================================

Private Sub ActionCancel()
  Unload Me
End Sub

Private Sub ActionValidate()
  If Not bCommit Then Exit Sub
  Unload Me
End Sub

' Point d'entrée externe
Public Sub DoTarif(ByVal l0 As Integer, ByVal bModificationsAutorisées As Boolean)
  bOkModif = bModificationsAutorisées
  AfficheLigne l0
  bdSél.ButtonEnabled("Add") = bOkModif
  Show vbModal
End Sub


Private Sub Form_KeyPress(KeyAscii As Integer)
' Raccourci clavier pour l'euro
  If ActiveControl Is cboDevise Then
    If KeyAscii = Asc("e") Or KeyAscii = Asc("E") Then cboDevise = "€"
  End If
End Sub


Private Sub Form_Load()
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Change") = False
  bdSél.ButtonEnabled("Delete") = False
  
  ' On marque, recolorise en gris et redimentionne les conteneurs-image de zones variables
  Dim p
  For Each p In picInfos
    p.Visible = False
    p.BackColor = &H8000000F
    If p.Index <> 3 Then
      p.Move picInfos(3).Left, picInfos(3).Top, picInfos(3).Width, picInfos(3).Height
    End If
  Next
  iPic = -1
  
  ' Le libellé descriptif des forfaits occupe la taille du conteneur (en mode développement si on le dimensionne come ça on ne peut plus sélectionner le conteneur...)
  lbl1.Move 0, 60, picInfos(3).Width, picInfos(3).Height
  
  ' Quelques saisies majuscules/minuscules imposées
  ForceTextBoxCase txtMéthode, 2
  ForceTextBoxCase txtQuantité, 1
  ForceTextBoxCase txtSensibilité, 1
  ForceTextBoxCase txtSousTraitant, 1
End Sub




Private Function IsCritère(sCrit As String) As Boolean
  IsCritère = False
  If sCrit = "*" Then
    MsgBox "Crtière * interdit", vbExclamation, App.Title
    Exit Function
  End If
  
  ' A écrire
  IsCritère = True
End Function


Private Function IsMM(mm As String) As Boolean
  IsMM = False
  If Len(mm) <> 1 Then Exit Function
  If mm <> "*" And (mm < "A" Or mm > "Z") Then Exit Function
  IsMM = True
End Function

Private Function IsFDA(s As String) As Boolean
  IsFDA = True  ' Pour l'instant, pas de contrôle
End Function

Private Function IsEH(sEH As String) As Boolean
  IsEH = False
  If sEH = "*" Then
    MsgBox "EH * interdite", vbExclamation, App.Title
    Exit Function
  End If
  If Not IsNumeric(sEH) Then Exit Function
  If CDbl(sEH) < 1 Or CDbl(sEH) > 2000 Or CDbl(sEH) <> CLng(sEH) Then Exit Function
  IsEH = True
End Function

Private Function IsScénario(sSce As String) As Boolean
  IsScénario = False
  If sSce = "*" Then
    IsScénario = True
    Exit Function
  End If
  If Not IsNumeric(sSce) Then Exit Function
  If CDbl(sSce) < 1 Or CDbl(sSce) > 20 Or CDbl(sSce) <> CLng(sSce) Then Exit Function
  IsScénario = True
End Function

Private Function isRubFac(sRF As String) As Boolean
  isRubFac = False
  If Not IsNumeric(sRF) Then Exit Function
  If CDbl(sRF) < 1 Or CDbl(sRF) > 995 Or CDbl(sRF) <> CLng(sRF) Then Exit Function
  isRubFac = True
End Function


Private Function IsParamètre(s As String) As Boolean
  If Not IsNumeric(s) Then Exit Function
  If CDbl(s) < -500 Or CDbl(s) > 5000 Or CDbl(s) <> CLng(s) Then Exit Function
  IsParamètre = True
End Function


Private Function IsMéthode(s As String) As Boolean
  If Len(s) <> 1 Then Exit Function
  If s >= "1" And s <= "9" Then IsMéthode = True: Exit Function
  If s <> "*" And (s < "a" Or s > "z") Then Exit Function
  IsMéthode = True
End Function


Private Function IsQuantité(s As String) As Boolean
  If s = "*" Then IsQuantité = True: Exit Function
  IsQuantité = InStr(s, " ") = 0
'  Dim p As Integer
'  p = 1
'  Do While Mid(s, p, 1) >= "0" And Mid(s, p, 1) <= "9": p = p + 1: Loop
'  Do While Mid(s, p, 1) >= "A" And Mid(s, p, 1) <= "Z": p = p + 1: Loop
'  IsQuantité = (p = Len(s) + 1) And s <> ""
End Function

Private Function IsSensibilité(s As String) As Boolean
  If s = "*" Then IsSensibilité = True: Exit Function
  Dim p As Integer
  p = 1
  Do While (Mid(s, p, 1) >= "0" And Mid(s, p, 1) <= "9") Or (Mid(s, p, 1) >= "A" And Mid(s, p, 1) <= "Z"): p = p + 1: Loop
  IsSensibilité = (p = Len(s) + 1) And s <> ""
End Function

Private Function IsSousTraitant(s As String) As Boolean
  If s = "*" Then IsSousTraitant = True: Exit Function
  IsSousTraitant = s <> ""
End Function

Private Function IsPrix(s As String) As Boolean
  IsPrix = IsNumeric(s)
End Function

Private Function IsRemise(s As String) As Boolean
  IsRemise = IsNumeric(s)
End Function

Private Function IsItemSatti(s As String) As Boolean
  IsItemSatti = IsNumeric(s)
End Function


Private Function bCommit() As Boolean
  bCommit = False
  If Not bModifié Then bCommit = True: Exit Function  ' Pas modifié, Ok !
  If Not bOkModif Then Stop                           ' Modifié alors que c'était interdit !!!
  
  ' Contrôles
  Select Case iNiveau
    Case 2:
      If Not isRubFac(txtTarifSupplémentaire) Then
        MsgBox "Ce n'est pas un n° de rubrique de facturation valide", vbExclamation, App.Title
        txtTarifSupplémentaire.SetFocus
        Exit Function
      End If
      
    Case 20:    ' Critère/Métaméthode
      If Not IsCritère(txt21) Then
        MsgBox "Critère microbiologique incorrect", vbExclamation, App.Title
        txt21.SetFocus
        Exit Function
      End If
      If Not IsMM(txt22) Then
        MsgBox "Métaméthode incorrecte", vbExclamation, App.Title
        txt22.SetFocus
        Exit Function
      End If
      
    Case 21:    ' FDA
      If Not IsFDA(txt21) Then
        MsgBox "FDA incorrecte", vbExclamation, App.Title
        txt21.SetFocus
        Exit Function
      End If
  
    Case 22:    ' EH / Scénario
      If Not IsEH(txt21) Then
        MsgBox "N° d'EH incorrect", vbExclamation, App.Title
        txt21.SetFocus
        Exit Function
      End If
      If Not IsScénario(txt22) Then
        MsgBox "N° de scénario incorrect", vbExclamation, App.Title
        txt22.SetFocus
        Exit Function
      End If
      
    Case 30:    ' Paramètre
      If Not IsParamètre(txtParamètre) Then
        MsgBox "N° de paramètre incorrect", vbExclamation, App.Title
        txtParamètre.SetFocus
        Exit Function
      End If
      If Not IsMéthode(txtMéthode) Then
        MsgBox "Méthode incorrecte", vbExclamation, App.Title
        txtMéthode.SetFocus
        Exit Function
      End If
      If Not IsQuantité(txtQuantité) Then
        MsgBox "Quantité incorrecte", vbExclamation, App.Title
        txtQuantité.SetFocus
        Exit Function
      End If
      If Not IsSensibilité(txtSensibilité) Then
        MsgBox "Sensibilité incorrecte", vbExclamation, App.Title
        txtSensibilité.SetFocus
        Exit Function
      End If
      If Not IsSousTraitant(txtSousTraitant) Then
        MsgBox "Sous-traitant incorrect", vbExclamation, App.Title
        txtSousTraitant.SetFocus
        Exit Function
      End If
      
    Case 40:    ' Tarif libre
      If iPrixRemise = 1 Then
        MsgBox "Remise incompatible avec un tarif de niveau 40"
        Exit Function
      End If
      
  End Select
  
  
  ' Contrôle prix/remise
  Select Case iPrixRemise
    Case 0:   ' Prix
      If Not IsPrix(txtPrix) Then
        MsgBox "Prix incorrect", vbExclamation, App.Title
        txtPrix.SetFocus
        Exit Function
      End If
      If txtPrix <> "" And cboDevise.ListIndex < 0 Then
        MsgBox "L'unité monétaire est obligatoire !"
        cboDevise.SetFocus
        Exit Function
      End If
      
    Case 1:   ' Remise
      If Not IsRemise(txtRemise) Then
        MsgBox "Remise incorrecte", vbExclamation, App.Title
        txtRemise.SetFocus
        Exit Function
      End If
  End Select
  
  
  ' Tout est contrôlé, on peut mettre à jour
  
  ' Le cas échéant, on ajoute une ligne au tableau
  If iLigne > frmTarif.xaTab.UpperBound(1) Then
    frmTarif.xaTab.InsertRows iLigne
    'frmTarif.bTabModifSimple = False         ' NON: un ajout reste une modif simple
    frmTarif.SetxaTab iLigne, colSerial, 0
    frmTarif.SetxaTab iLigne, ColIndex, -1    ' Force l'insertion de la ligne
  End If
  
  ' Marqueur de modif de ligne (index<0 ou vide)
  If frmTarif.xaTab(iLigne, ColIndex) > 0 Then
    frmTarif.SetxaTab iLigne, ColIndex, -frmTarif.xaTab(iLigne, ColIndex)
  End If

  frmTarif.SetxaTab iLigne, colNiveau, iNiveau
  frmTarif.SetxaTab iLigne, colOption, VN(txtOption)
  frmTarif.SetxaTab iLigne, colOptionClair, sLibOption(iNiveau, NV(txtOption))
  
  ' On positionne la sélection du tableau
  frmTarif.tdgDétail.FirstRow = iLigne
  frmTarif.tdgDétail.Row = 0
  
  ' Par défaut
  frmTarif.SetxaTab iLigne, colPrix, Null
  frmTarif.SetxaTab iLigne, colDevise, Null
  frmTarif.SetxaTab iLigne, colRemise, Null
  
  Select Case iPrixRemise
    Case 0:   ' Prix
      If txtPrix = "" Then
        frmTarif.SetxaTab iLigne, colPrix, Null
      Else
        frmTarif.SetxaTab iLigne, colPrix, Format(CDbl(txtPrix), "0.00")
      End If
      frmTarif.SetxaTab iLigne, colDevise, cboDevise.Text
      
    Case 1:   ' Remise
      frmTarif.SetxaTab iLigne, colRemise, VN(txtRemise)
  End Select
  
  frmTarif.SetxaTab iLigne, colComment, VN(txtComment)
  frmTarif.SetxaTab iLigne, colIdModif, sBDIdModif
  frmTarif.SetxaTab iLigne, colTimestamp, Now
  
  ' Ok !
  bCommit = True
  frmTarif.bTabModifié = True
  bModifié = False
End Function

Private Sub ActionFirst()
  If Not bCommit Then Exit Sub
  If iLigne > 1 Then AfficheLigne 1
End Sub

Private Sub ActionPrevious()
  If Not bCommit Then Exit Sub
  If iLigne > 1 Then AfficheLigne iLigne - 1
End Sub

Private Sub ActionNext()
  If Not bCommit Then Exit Sub
  If bOkModif Then
    If iLigne <= frmTarif.xaTab.UpperBound(1) Then AfficheLigne iLigne + 1
  Else
    If iLigne < frmTarif.xaTab.UpperBound(1) Then AfficheLigne iLigne + 1
  End If
End Sub

Private Sub ActionLast()
  If Not bCommit Then Exit Sub
  If iLigne < frmTarif.xaTab.UpperBound(1) Then AfficheLigne frmTarif.xaTab.UpperBound(1)
End Sub

Private Sub ActionAdd()
  If bOkModif Then
    If Not bCommit Then Exit Sub
    AfficheLigne frmTarif.xaTab.UpperBound(1) + 1
  End If
End Sub


Private Sub AfficheLigne(ByVal l0 As Integer)
  If l0 < 1 Then l0 = 1
  iLigne = l0
  
  ' Trace interne
  bdSél.NumRec = iLigne
  
  If iLigne <= frmTarif.xaTab.UpperBound(1) Then
    On Error Resume Next
    optNiveau(frmTarif.xaTab(iLigne, colNiveau)).Value = True
    If Err Then GoTo SansDonnees
    On Error GoTo 0
    
    ' Traces internes
    txtNiveau = frmTarif.xaTab(iLigne, colNiveau)
    txtOption = NV(frmTarif.xaTab(iLigne, colOption))
    
    ' Par défaut, rien
    optPrixRemise(0).Value = False
    optPrixRemise(1).Value = False
    ActivePrix False
    ActiveChamp txtRemise, False
    cboDevise.ListIndex = -1
    
    If NV(frmTarif.xaTab(iLigne, colPrix)) <> "" Then
      optPrixRemise(0).Value = True
      txtPrix = NV(frmTarif.xaTab(iLigne, colPrix))
      If frmTarif.xaTab(iLigne, colDevise) = "F" Then
        cboDevise.ListIndex = 0
      ElseIf frmTarif.xaTab(iLigne, colDevise) = "€" Then
        cboDevise.ListIndex = 1
      End If
    ElseIf NV(frmTarif.xaTab(iLigne, colRemise)) <> "" Then
      optPrixRemise(1).Value = True
      txtRemise = NV(frmTarif.xaTab(iLigne, colRemise))
    End If
    
    txtComment = NV(frmTarif.xaTab(iLigne, colComment))
    
    Dim v
    Select Case frmTarif.xaTab(iLigne, colNiveau)
      Case 20, 22:
        v = Split(frmTarif.xaTab(iLigne, colOption), "/")
        txt21 = v(0)
        txt22 = v(1)
        
      Case 21:
        txt21 = frmTarif.xaTab(iLigne, colOption)
        
      Case 30:
        v = Split(frmTarif.xaTab(iLigne, colOption), "/")
        txtParamètre = v(0)
        AfficheNomParamètre
        txtMéthode = v(1)
        AfficheNomMéthode
        txtQuantité = v(2)
        txtSensibilité = v(3)
        txtSousTraitant = v(4)
        
      Case 31, 32, 33:
        ' Nop
        
      Case 40, 2:
        txtTarifSupplémentaire = NV(frmTarif.xaTab(iLigne, colOption))
        
    End Select
    
    ActiveChamp txtComment, bOkModif
  Else
SansDonnees:
    ' Traces internes
    txtNiveau = ""
    txtOption = ""
    
    Dim o As OptionButton
    For Each o In optNiveau
      o.Value = False
    Next
    If iPic >= 0 Then
      picInfos(iPic).Visible = False
      iPic = -1
    End If
    txtPrix = ""
    cboDevise.ListIndex = -1
    txtRemise = ""
    txtComment = ""
    txtIdModif = ""
    txtTimeStamp = ""
    optPrixRemise(0).Value = False
    optPrixRemise(1).Value = False
    ActivePrix False
    ActiveChamp txtRemise, False
    ActiveChamp txtComment, False
    
    iNiveau = -1
    iPrixRemise = -1
  End If
  
  Refresh
  
  ActiveChamp txt21, bOkModif
  ActiveChamp txt22, bOkModif
  
  ActiveChamp txtParamètre, bOkModif
  ActiveChamp txtMéthode, bOkModif
  ActiveChamp txtQuantité, bOkModif
  ActiveChamp txtSensibilité, bOkModif
  ActiveChamp txtSousTraitant, bOkModif

  ActiveChamp txtTarifSupplémentaire, bOkModif
  
  fraElément.Enabled = bOkModif
  fraPrix.Enabled = bOkModif
  
  bModifié = False
End Sub


Private Sub AfficheNomParamètre()
  If txtParamètre <> "" Then txtNomParamètre = sNomParamètre(Val(txtParamètre))
End Sub


Private Sub AfficheNomMéthode()
  If txtParamètre <> "" Then
    If txtMéthode = "" Then
      txtNomMéthode = ""
    ElseIf txtMéthode = "*" Then
      txtNomMéthode = "Pour toutes les méthodes existantes"
    Else
      txtNomMéthode = sNomMéthode(Val(txtParamètre.Text), txtMéthode.Text)
    End If
  End If
End Sub


Private Function sLO(iNiveau As Integer) As String
  sLO = sLibOption(iNiveau, "")
End Function



Private Sub optNiveau_Click(Index As Integer)
  bModifié = True
  iNiveau = Index
  txtNiveau = Index
  
  Select Case Index
    Case 0:   lbl1 = "Montant forfaitaire global (inclut les frais de déplacement)"
              txtOption = sLO(0)
    Case 1:   lbl1 = "Frais de déplacement"
              txtOption = sLO(1)
    Case 2:   lblTarifSupplémentaire = "Rubrique de facturation systématique supplémentaire :"
              txtTarifSupplémentaire = ""
              txtOption = ""
    
    Case 9:   lbl1 = "Prix d'une Légionelle"
              txtOption = sLO(9)
    Case 10:  lbl1 = "Prix d'une ABVT"
              txtOption = sLO(10)
    Case 11:  lbl1 = "Prix d'une Analyse Bactério standard"
              txtOption = sLO(11)
    Case 12:  lbl1 = "Prix d'une EH"
              txtOption = sLO(12)
    Case 14:  lbl1 = "Prix d'un Frottis de Surface"
              txtOption = sLO(14)
    Case 15:  lbl1 = "Prix d'une Chimie"
              txtOption = sLO(15)
    Case 16:  lbl1 = "Prix d'une Bactério Spéciale"
              txtOption = sLO(16)
    Case 17:  lbl1 = "Prix d'une Listeria"
              txtOption = sLO(17)
    Case 18:  lbl1 = "Prix d'une Huile"
              txtOption = sLO(18)
    Case 19:  lbl1 = "Prix d'une analyse OGM"
              txtOption = sLO(19)
    
    Case 20:  lbl21 = "Critère :"
              lbl22 = "Métaméthode ou * :"
              txt22.Visible = True
              ForceTextBoxCase txt22, 1   ' MM en majuscules
              txt21 = ""
              txt22 = ""
    Case 21:  lbl21 = "FDA :"
              lbl22 = ""
              txt22.Visible = False
              txt21 = ""
    Case 22:  lbl21 = "EH :"
              lbl22 = "Scénario ou * :"
              lbl22.Enabled = True
              txt22.Visible = True
              ForceTextBoxCase txt22, 0
              txt21 = ""
              txt22 = ""

    Case 30:  txtParamètre = ""
              txtNomParamètre = ""
              txtMéthode = ""
              txtNomMéthode = ""
              txtQuantité = ""
              txtSensibilité = ""
              txtSousTraitant = ""
              
    Case 31:  lbl1 = "Prise en charge Bactério, si fact/paramètre d'une analyse AB,BS,Li,Hu (rubfac 208)"
              txtOption = sLO(31)
    Case 32:  lbl1 = "Prise en charge Chimie, si fact/paramètre d'une analyse Ch (rubfac 209)"
              txtOption = sLO(32)
    Case 33:  lbl1 = "Prise en charge Surface, si fact/paramètre d'une analyse FS (rubfac 210)"
              txtOption = sLO(33)
              
    Case 40:  lblTarifSupplémentaire = "Tarif supplémentaire :"
              txtTarifSupplémentaire = ""
              txtOption = ""
    
    Case Else:  Stop
  End Select
  
  Dim iNewPic As Integer
  iNewPic = Index \ 10
  If iNewPic = 0 Then iNewPic = 1
  If Index = 2 Then iNewPic = 4
  If Index = 9 Then iNewPic = 1
  If Index >= 31 And Index <= 33 Then iNewPic = 1
  
  If iPic <> iNewPic Then
    If iPic >= 0 Then picInfos(iPic).Visible = False
  End If
  iPic = iNewPic
  picInfos(iPic).Visible = True
  
  ' Par défaut, on active le prix
  optPrixRemise(0).Value = True
  ActivePrix True

  ActiveChamp txtComment, True

  ' Focus
  On Error Resume Next
  Select Case iPic
    Case 1: ' nop
    Case 2: txt21.SetFocus
    Case 3: txtParamètre.SetFocus
    Case 4: txtTarifSupplémentaire.SetFocus
  End Select
  On Error GoTo 0
    
  bModifié = True
End Sub



Private Sub optPrixRemise_Click(Index As Integer)
  bModifié = True
  iPrixRemise = Index
  
  Select Case Index
    Case 0:
      ActivePrix True
      ActiveChamp txtRemise, False
      On Error Resume Next
      txtPrix.SetFocus
      
    Case 1:
      ActivePrix False
      ActiveChamp txtRemise, True
      On Error Resume Next
      txtRemise.SetFocus
  End Select
End Sub



Private Sub ActivePrix(bActivé As Boolean)
  Dim b As Boolean
  b = bActivé And bOkModif
  ActiveChamp txtPrix, b
  cboDevise.Enabled = b
  cboDevise.BackColor = IIf(b, &H80000005, &H8000000F)
  cboDevise.TabStop = b
End Sub

Private Sub ActiveChamp(t As Control, bActivé As Boolean)
  If bActivé And bOkModif Then
    t.BackColor = &H80000005
    t.Locked = False
    t.TabStop = True
  Else
    t.BackColor = &H8000000F
    t.Locked = True
    t.TabStop = False
  End If
End Sub



Private Sub txt21_Change(): bModifié = True: DoOption2: End Sub
Private Sub txt22_Change(): bModifié = True: DoOption2: End Sub
Private Sub DoOption2()
  If iNiveau = 21 Then
    txtOption = txt21
  Else
    txtOption = txt21 & "/" & txt22
  End If
End Sub

Private Sub txtParamètre_Change(): bModifié = True: txtNomParamètre = "": txtNomMéthode = "": DoOption3: End Sub


Private Sub txtMéthode_Change(): bModifié = True: txtNomMéthode = "": DoOption3: End Sub


Private Sub txtQuantité_Change(): bModifié = True: DoOption3: End Sub
Private Sub txtSensibilité_Change(): bModifié = True: DoOption3: End Sub
Private Sub txtSousTraitant_Change(): bModifié = True: DoOption3: End Sub
Private Sub DoOption3()
  txtOption = txtParamètre & "/" & txtMéthode & "/" & txtQuantité & "/" & txtSensibilité & "/" & txtSousTraitant
End Sub

Private Sub txtTarifSupplémentaire_Change(): bModifié = True: DoOption4: End Sub
Private Sub DoOption4()
  txtOption = txtTarifSupplémentaire
End Sub


Private Sub txtPrix_Change(): bModifié = True: End Sub
Private Sub cboDevise_Change(): bModifié = True: End Sub
Private Sub cboDevise_Click(): bModifié = True: End Sub
Private Sub txtRemise_Change(): bModifié = True: End Sub

Private Sub txtComment_Change(): bModifié = True: End Sub


' ================================================================================
' Lignes d'aide

Private Sub txt21_GotFocus()
  Select Case iNiveau
    Case 20: SetStatus "Critère d'analyse microbiologique (ex: A1)"
    Case 21: SetStatus "Modèle de FDA concernée (ex: FG0101)"
    Case 22: SetStatus "N° d'EH concernée (ex: 760)"
    Case Else: Stop
  End Select
End Sub

Private Sub txt22_GotFocus()
  Select Case iNiveau
    Case 20: SetStatus "Métaméthode du tarif (une lettre majuscule, ex: A pour AFNOR), ou * si le prix n'en dépend pas"
    Case 22: SetStatus "N° de scénario concerné (ex: 1), ou * si le prix n'en dépend pas"
    Case Else: Stop
  End Select
End Sub


Private Sub txtParamètre_GotFocus()
  AutoSelect txtParamètre, True
  SetStatus "Code du paramètre pour cette ligne de tarif"
End Sub

Private Sub txtParamètre_LostFocus()
  AfficheNomParamètre
End Sub

Private Sub txtMéthode_GotFocus()
  AutoSelect txtMéthode, True
  SetStatus "Méthode de recherche pour cette ligne de tarif, ou * si le prix ne dépend pas de la méthode"
End Sub

Private Sub txtMéthode_LostFocus()
  AfficheNomMéthode
End Sub

Private Sub txtQuantité_GotFocus()
  AutoSelect txtQuantité, True
  SetStatus "Unité d'expression du résultat pour ce tarif majuscules sans espaces ni / (ex: 25G), ou * si le tarif n'en dépend pas"
End Sub

Private Sub txtSensibilité_GotFocus()
  AutoSelect txtSensibilité, True
  SetStatus "Groupe de lettres majuscules et de chiffres (ex: S3), ou * si le tarif n'en dépend pas"
End Sub

Private Sub txtSousTraitant_GotFocus()
  AutoSelect txtSousTraitant, True
  SetStatus "Code sous-traitant en majuscules pour cette ligne de tarif, ou * si le prix n'en dépend pas"
End Sub


Private Sub txtTarifSupplémentaire_GotFocus()
  AutoSelect txtTarifSupplémentaire, True
  Select Case iNiveau
    Case 2:   SetStatus "N° de rubrique de facturation à ajouter systématiquement"
    Case 40:  SetStatus "Description du tarif supplémentaire"
  End Select
End Sub


Private Sub txtPrix_GotFocus()
  AutoSelect txtPrix, True
  SetStatus "Prix de l'élément, avec le séparateur décimal pour les centimes"
End Sub

Private Sub cboDevise_GotFocus()
  SetStatus "Unité monétaire du prix (taper F pour Franc, E pour €uro)"
End Sub

Private Sub txtRemise_GotFocus()
  AutoSelect txtRemise, True
  SetStatus "Taux de correction par rapport au tarif de base (ex: -2,5 pour 2,5% de remise, ou 5 pour 5% d'augmentation)"
End Sub


Private Sub txtComment_GotFocus()
  AutoSelect txtComment, True
  SetStatus "Remarque libre sur la ligne de tarif"
End Sub


Private Sub txtIdModif_GotFocus(): SetStatus: End Sub
Private Sub txtTimeStamp_GotFocus(): SetStatus: End Sub

