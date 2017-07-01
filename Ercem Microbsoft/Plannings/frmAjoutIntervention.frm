VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmAjoutIntervention 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Ajout d'une intervention"
   ClientHeight    =   6165
   ClientLeft      =   1095
   ClientTop       =   3255
   ClientWidth     =   8775
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAjoutIntervention.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   411
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   585
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.TextBox txtLabCh 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   8400
      Locked          =   -1  'True
      TabIndex        =   29
      TabStop         =   0   'False
      Tag             =   "248"
      ToolTipText     =   "Enregistrement labo"
      Top             =   780
      Width           =   350
   End
   Begin VB.TextBox txtLabHu 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   7200
      Locked          =   -1  'True
      TabIndex        =   25
      TabStop         =   0   'False
      Tag             =   "248"
      ToolTipText     =   "Enregistrement labo"
      Top             =   780
      Width           =   350
   End
   Begin VB.TextBox txtLabFS 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   6060
      Locked          =   -1  'True
      TabIndex        =   23
      TabStop         =   0   'False
      Tag             =   "248"
      ToolTipText     =   "Enregistrement labo"
      Top             =   780
      Width           =   350
   End
   Begin VB.TextBox txtLabLi 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   4980
      Locked          =   -1  'True
      TabIndex        =   20
      TabStop         =   0   'False
      Tag             =   "248"
      ToolTipText     =   "Enregistrement labo"
      Top             =   780
      Width           =   350
   End
   Begin VB.TextBox txtLabBS 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   3900
      Locked          =   -1  'True
      TabIndex        =   17
      TabStop         =   0   'False
      Tag             =   "248"
      ToolTipText     =   "Enregistrement labo"
      Top             =   780
      Width           =   350
   End
   Begin VB.TextBox txtLabAB 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1860
      Locked          =   -1  'True
      TabIndex        =   12
      TabStop         =   0   'False
      Tag             =   "248"
      ToolTipText     =   "Nombre d'AB enregistr�es au labo"
      Top             =   780
      Width           =   350
   End
   Begin VB.TextBox txtRefCmdClient 
      Height          =   315
      Left            =   4140
      MaxLength       =   30
      TabIndex        =   37
      Top             =   1500
      Width           =   2715
   End
   Begin VB.ComboBox cboMod�lesEH 
      BackColor       =   &H8000000F&
      Height          =   330
      Left            =   60
      Style           =   2  'Dropdown List
      TabIndex        =   81
      TabStop         =   0   'False
      Top             =   1140
      Width           =   2715
   End
   Begin Plannings.BDCheck bckAvisPassage 
      Height          =   285
      Left            =   1560
      TabIndex        =   59
      Top             =   4140
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   503
      ForeColor       =   -2147483630
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
   Begin VB.TextBox txtNumEH 
      Height          =   315
      Left            =   3660
      MaxLength       =   10
      TabIndex        =   31
      Top             =   1140
      Width           =   1470
   End
   Begin VB.TextBox txtDurEH 
      Height          =   315
      Left            =   6360
      MaxLength       =   3
      TabIndex        =   33
      Top             =   1140
      Width           =   555
   End
   Begin VB.TextBox txtNbHu 
      Height          =   315
      Left            =   6840
      MaxLength       =   2
      TabIndex        =   26
      Tag             =   "Entrez le nombre d'huiles pr�vues pour cette intervention."
      Top             =   780
      Width           =   350
   End
   Begin VB.CommandButton btnUnit� 
      Height          =   330
      Left            =   2520
      Picture         =   "frmAjoutIntervention.frx":014A
      Style           =   1  'Graphical
      TabIndex        =   73
      Tag             =   "Cliquer pour rechercher un code unit�."
      ToolTipText     =   "Cliquer pour rechercher un code unit�."
      Top             =   2580
      Width           =   315
   End
   Begin VB.CommandButton btnEtablissement 
      Height          =   330
      Left            =   2520
      Picture         =   "frmAjoutIntervention.frx":0294
      Style           =   1  'Graphical
      TabIndex        =   71
      Tag             =   "Cliquer pour rechercher un code �tablissement."
      ToolTipText     =   "Cliquer pour rechercher un code �tablissement."
      Top             =   420
      Width           =   315
   End
   Begin VB.CommandButton btnUtilisateur 
      Height          =   330
      Left            =   2520
      Picture         =   "frmAjoutIntervention.frx":03DE
      Style           =   1  'Graphical
      TabIndex        =   72
      Tag             =   "Cliquer pour rechercher un code utilisateur."
      ToolTipText     =   "Cliquer pour rechercher un code utilisateur."
      Top             =   2220
      Width           =   315
   End
   Begin VB.TextBox txtProprio 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   3135
      Locked          =   -1  'True
      TabIndex        =   80
      TabStop         =   0   'False
      Top             =   420
      Visible         =   0   'False
      Width           =   120
   End
   Begin VB.Frame fraInfosConsultants 
      Caption         =   "Informations Consultants"
      Height          =   1455
      Left            =   2880
      TabIndex        =   62
      Top             =   3360
      Width           =   5850
      Begin Plannings.BDCombo bdcCodeActivit� 
         Height          =   330
         Left            =   1800
         TabIndex        =   66
         Tag             =   "Entrez ou s�lectionnez le code activit�."
         Top             =   660
         Width           =   3975
         _ExtentX        =   7011
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
      Begin Plannings.BDCombo bdcTypePrestation 
         Height          =   330
         Left            =   1800
         TabIndex        =   64
         Tag             =   "Entrez ou s�lectionnez le type de prestation."
         Top             =   300
         Width           =   3975
         _ExtentX        =   7011
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
      Begin VB.TextBox txtCodeClient 
         Height          =   315
         Left            =   1800
         MaxLength       =   15
         TabIndex        =   68
         Tag             =   "Code client (ex: CARREFOUR, DIVERS, �)"
         Top             =   1020
         Width           =   2130
      End
      Begin VB.Label lblCodeClient 
         AutoSize        =   -1  'True
         Caption         =   "Code c&lient :"
         Height          =   210
         Left            =   120
         TabIndex        =   67
         Top             =   1080
         Width           =   1185
      End
      Begin VB.Label lblCodeActivit� 
         AutoSize        =   -1  'True
         Caption         =   "Code acti&vit� :"
         Height          =   210
         Left            =   120
         TabIndex        =   65
         Top             =   720
         Width           =   1365
      End
      Begin VB.Label lblTypePrestation 
         AutoSize        =   -1  'True
         Caption         =   "&Type prestation :"
         Height          =   210
         Left            =   120
         TabIndex        =   63
         Top             =   360
         Width           =   1620
      End
   End
   Begin Plannings.ChampHeure txtHeureArriv�e 
      Height          =   315
      Left            =   1560
      TabIndex        =   55
      Tag             =   "Heure d'arriv�e sur l'�tablissement"
      Top             =   3360
      Width           =   975
      _ExtentX        =   1720
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
   Begin VB.TextBox txtNbLi 
      Height          =   315
      Left            =   4620
      MaxLength       =   2
      TabIndex        =   19
      Tag             =   "Entrez le nombre de list�ria pr�vues pour cette intervention."
      Top             =   780
      Width           =   350
   End
   Begin VB.TextBox txtNbFS 
      Height          =   315
      Left            =   5700
      MaxLength       =   2
      TabIndex        =   22
      Tag             =   "Entrez le nombre de frottis de surface pr�vus pour cette intervention."
      Top             =   780
      Width           =   350
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   6300
      TabIndex        =   78
      Top             =   5400
      Width           =   1350
   End
   Begin VB.TextBox txtNomAssistant 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   4260
      Locked          =   -1  'True
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   60
      Width           =   4455
   End
   Begin VB.TextBox txtLettres 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   3720
      Locked          =   -1  'True
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   60
      Width           =   495
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   4920
      TabIndex        =   77
      Top             =   5400
      Width           =   1350
   End
   Begin VB.CommandButton btnAjouter 
      Caption         =   "&Ajouter"
      Height          =   330
      Left            =   2160
      TabIndex        =   75
      Top             =   5400
      Width           =   1350
   End
   Begin VB.CommandButton btnEffacer 
      Caption         =   "&Effacer"
      Height          =   330
      Left            =   3540
      TabIndex        =   76
      Top             =   5400
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   780
      TabIndex        =   74
      Top             =   5400
      Width           =   1350
   End
   Begin VB.TextBox txtNbEH 
      Height          =   315
      Left            =   2640
      MaxLength       =   2
      TabIndex        =   14
      Tag             =   "Entrez le nombre d'EH pr�vues pour cette intervention."
      Top             =   780
      Width           =   350
   End
   Begin VB.TextBox txtNbCh 
      Height          =   315
      Left            =   8040
      MaxLength       =   2
      TabIndex        =   28
      Tag             =   "Entrez le nombre de chimies pr�vues pour cette intervention."
      Top             =   780
      Width           =   350
   End
   Begin VB.TextBox txtNbBS 
      Height          =   315
      Left            =   3540
      MaxLength       =   2
      TabIndex        =   16
      Tag             =   "Entrez le nombre de bact�rios sp�ciales pr�vues pour cette intervention."
      Top             =   780
      Width           =   350
   End
   Begin VB.TextBox txtNbAB 
      Height          =   315
      Left            =   1500
      MaxLength       =   2
      TabIndex        =   11
      Tag             =   "Entrez le nombre d'AB pr�vues pour cette intervention."
      Top             =   780
      Width           =   350
   End
   Begin VB.TextBox txtComment 
      Height          =   315
      Left            =   1560
      MaxLength       =   60
      TabIndex        =   42
      Tag             =   "Entrez un commentaire libre."
      Top             =   1860
      Width           =   4695
   End
   Begin VB.TextBox txtNomUnit� 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2880
      Locked          =   -1  'True
      TabIndex        =   48
      TabStop         =   0   'False
      Top             =   2580
      Width           =   5835
   End
   Begin VB.TextBox txtUnit� 
      Height          =   315
      Left            =   1560
      MaxLength       =   4
      TabIndex        =   47
      Tag             =   "Entrez le n� d'unit�. F4 pour une recherche."
      Top             =   2580
      Width           =   960
   End
   Begin VB.TextBox txtNomPersonne 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2880
      Locked          =   -1  'True
      TabIndex        =   45
      TabStop         =   0   'False
      Top             =   2220
      Width           =   5835
   End
   Begin VB.TextBox txtPersonne 
      Height          =   315
      Left            =   1560
      MaxLength       =   4
      TabIndex        =   44
      Tag             =   "Entrez le n� de personne. F4 pour une recherche."
      Top             =   2220
      Width           =   960
   End
   Begin VB.TextBox txtR�f�rence 
      Height          =   315
      Left            =   1560
      MaxLength       =   6
      TabIndex        =   35
      Tag             =   "Entrez le n� de r�f�rence (uniquement la partie num�rique)."
      Top             =   1500
      Width           =   960
   End
   Begin VB.TextBox txtNomEtb 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   4260
      Locked          =   -1  'True
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   420
      Width           =   4455
   End
   Begin VB.TextBox txtPr�fixe 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   3210
      Locked          =   -1  'True
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   420
      Width           =   1005
   End
   Begin VB.TextBox txtNumEtb 
      Height          =   315
      Left            =   1560
      MaxLength       =   6
      TabIndex        =   6
      Tag             =   "Entrez le n� d'�tablissement. F4 pour une recherche."
      Top             =   420
      Width           =   960
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   79
      Top             =   5850
      Width           =   8775
      _ExtentX        =   15478
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
   Begin Plannings.ChampHeure txtHeureD�part 
      Height          =   315
      Left            =   1560
      TabIndex        =   57
      Tag             =   "Heure de d�part de l'�tablissement"
      Top             =   3720
      Width           =   975
      _ExtentX        =   1720
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
   Begin Plannings.ChampDate txtDate 
      Height          =   315
      Left            =   1200
      TabIndex        =   1
      TabStop         =   0   'False
      Tag             =   "Entrez la date de destination"
      Top             =   60
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
      SaisieAssist�e  =   "ATTENTE=1/1/2019"
   End
   Begin Plannings.BDCombo bdcSecret 
      Height          =   330
      Left            =   2220
      TabIndex        =   50
      TabStop         =   0   'False
      Tag             =   "Entrez ou s�lectionnez le secr�tariat assurant la saisie"
      Top             =   2940
      Width           =   2730
      _ExtentX        =   4815
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
      BackColor       =   -2147483633
      Locked          =   -1  'True
   End
   Begin Plannings.BDCombo bdcLabo 
      Height          =   330
      Left            =   6180
      TabIndex        =   52
      Tag             =   "Entrez ou s�lectionnez le labo g�rant l'�chantillon"
      Top             =   2940
      Width           =   2550
      _ExtentX        =   4498
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
   Begin Plannings.BDCombo bdcD�coupage 
      Height          =   330
      Left            =   1560
      TabIndex        =   70
      Tag             =   "R�gles de d�coupage du dossier � l'�dition et en facturation"
      Top             =   4920
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
   End
   Begin Plannings.BDCheck bckFPStandard 
      Height          =   285
      Left            =   1560
      TabIndex        =   61
      Top             =   4500
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   503
      ForeColor       =   -2147483630
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
   Begin Plannings.BDCheck bckAFacturer 
      Height          =   285
      Left            =   8040
      TabIndex        =   39
      Top             =   1500
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   503
      ForeColor       =   -2147483630
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
      Index           =   1
      Left            =   8340
      TabIndex        =   83
      TabStop         =   0   'False
      Tag             =   "pla_labxx"
      ToolTipText     =   "Cliquez pour voir le r�le de ce nouveau champ"
      Top             =   1140
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
   Begin VB.Label lblAFacturer 
      AutoSize        =   -1  'True
      Caption         =   "A Facturer :"
      Height          =   210
      Left            =   6960
      TabIndex        =   38
      Top             =   1560
      Width           =   1095
   End
   Begin MSWLess.WLCommand btnNouveau 
      Height          =   315
      Index           =   0
      Left            =   8340
      TabIndex        =   40
      TabStop         =   0   'False
      Tag             =   "afacturer"
      ToolTipText     =   "Cliquez pour voir le r�le de ce nouveau champ"
      Top             =   1500
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
   Begin VB.Label lblRefCmdClient 
      AutoSize        =   -1  'True
      Caption         =   "Ref cmd client :"
      Height          =   210
      Left            =   2640
      TabIndex        =   36
      Top             =   1560
      Width           =   1425
   End
   Begin VB.Label lblFPStandard 
      AutoSize        =   -1  'True
      Caption         =   "FP Standard :"
      Height          =   210
      Left            =   60
      TabIndex        =   60
      Top             =   4560
      Width           =   1290
   End
   Begin VB.Label lblD�coupage 
      AutoSize        =   -1  'True
      Caption         =   "D�coupage :"
      Height          =   210
      Index           =   119
      Left            =   60
      TabIndex        =   69
      Top             =   4980
      Width           =   1200
   End
   Begin VB.Label lblMinute 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "min"
      Height          =   210
      Left            =   6960
      TabIndex        =   82
      Top             =   1200
      Width           =   330
   End
   Begin VB.Label lblAvisPassage 
      AutoSize        =   -1  'True
      Caption         =   "Avis passage :"
      Height          =   210
      Left            =   60
      TabIndex        =   58
      Top             =   4200
      Width           =   1380
   End
   Begin VB.Label lblLabo 
      AutoSize        =   -1  'True
      Caption         =   "Labo :"
      Height          =   210
      Left            =   5280
      TabIndex        =   51
      Top             =   3000
      Width           =   600
   End
   Begin VB.Label lblSecret 
      AutoSize        =   -1  'True
      Caption         =   "Secr�tariat :"
      Height          =   210
      Left            =   60
      TabIndex        =   49
      Top             =   3000
      Width           =   1170
   End
   Begin VB.Line Line4 
      X1              =   212
      X2              =   200
      Y1              =   88
      Y2              =   92
   End
   Begin VB.Line Line3 
      X1              =   212
      X2              =   200
      Y1              =   88
      Y2              =   84
   End
   Begin VB.Line Line2 
      X1              =   180
      X2              =   212
      Y1              =   88
      Y2              =   88
   End
   Begin VB.Line Line1 
      X1              =   192
      X2              =   192
      Y1              =   68
      Y2              =   88
   End
   Begin VB.Label lblNumEH 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "N� :"
      Height          =   210
      Left            =   3240
      TabIndex        =   30
      Top             =   1200
      Width           =   375
   End
   Begin VB.Label lblDurEH 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "Dur�e :"
      Height          =   210
      Left            =   5580
      TabIndex        =   32
      Top             =   1200
      Width           =   705
   End
   Begin VB.Label lblNbHu 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "H&u :"
      Height          =   210
      Left            =   6420
      TabIndex        =   24
      Top             =   840
      Width           =   390
   End
   Begin VB.Image imgModifIntervention 
      Height          =   240
      Left            =   60
      Picture         =   "frmAjoutIntervention.frx":0528
      Top             =   3780
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image imgProprio 
      Height          =   240
      Left            =   2880
      Stretch         =   -1  'True
      Top             =   465
      Width           =   240
   End
   Begin VB.Label lblHeure 
      AutoSize        =   -1  'True
      Caption         =   "Heure"
      Height          =   210
      Left            =   60
      TabIndex        =   53
      Top             =   3420
      Width           =   570
   End
   Begin VB.Label lblD�part 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "&D�part :"
      Height          =   210
      Left            =   660
      TabIndex        =   56
      Top             =   3780
      Width           =   780
   End
   Begin VB.Label lblArriv�e 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "A&rriv�e :"
      Height          =   210
      Left            =   720
      TabIndex        =   54
      Top             =   3420
      Width           =   795
   End
   Begin VB.Label lblNbLi 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "&Li :"
      Height          =   210
      Left            =   4320
      TabIndex        =   18
      Top             =   855
      Width           =   285
   End
   Begin VB.Label lblNbFS 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "&FS :"
      Height          =   210
      Left            =   5340
      TabIndex        =   21
      Top             =   855
      Width           =   360
   End
   Begin VB.Label lblNbAB 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "A&B :"
      Height          =   210
      Left            =   1080
      TabIndex        =   10
      Top             =   840
      Width           =   375
   End
   Begin VB.Label lblDate 
      AutoSize        =   -1  'True
      Caption         =   "Date :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   585
   End
   Begin VB.Label lblLettres 
      AutoSize        =   -1  'True
      Caption         =   "Lettres :"
      Height          =   210
      Left            =   2640
      TabIndex        =   2
      Top             =   120
      Width           =   810
   End
   Begin VB.Label lblNbEH 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "E&H :"
      Height          =   210
      Left            =   2220
      TabIndex        =   13
      Top             =   840
      Width           =   390
   End
   Begin VB.Label lblNbCh 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "&Ch :"
      Height          =   210
      Left            =   7620
      TabIndex        =   27
      Top             =   855
      Width           =   390
   End
   Begin VB.Label lblNbBS 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "B&S :"
      Height          =   210
      Left            =   3120
      TabIndex        =   15
      Top             =   840
      Width           =   375
   End
   Begin VB.Label lblNbPrel 
      AutoSize        =   -1  'True
      Caption         =   "Nb pr�l."
      Height          =   210
      Left            =   60
      TabIndex        =   9
      Top             =   840
      Width           =   735
   End
   Begin VB.Label lblCommentaire 
      AutoSize        =   -1  'True
      Caption         =   "C&ommentaire :"
      Height          =   210
      Left            =   60
      TabIndex        =   41
      Top             =   1920
      Width           =   1395
   End
   Begin VB.Label lblUnit� 
      AutoSize        =   -1  'True
      Caption         =   "&Unit� :"
      Height          =   210
      Left            =   60
      TabIndex        =   46
      Top             =   2640
      Width           =   630
   End
   Begin VB.Label lblPersonne 
      AutoSize        =   -1  'True
      Caption         =   "&Personne :"
      Height          =   210
      Left            =   60
      TabIndex        =   43
      Top             =   2280
      Width           =   1035
   End
   Begin VB.Label lblR�f�rence 
      AutoSize        =   -1  'True
      Caption         =   "&R�f�rence :"
      Height          =   210
      Left            =   60
      TabIndex        =   34
      Top             =   1560
      Width           =   1080
   End
   Begin VB.Label lblEtablissement 
      AutoSize        =   -1  'True
      Caption         =   "&Etablissement :"
      Height          =   210
      Left            =   60
      TabIndex        =   5
      Top             =   480
      Width           =   1470
   End
End
Attribute VB_Name = "frmAjoutIntervention"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille d'ajout / modification d'une intervention"
' Feuille frmAjoutIntervention
' Feuille d'ajout / modification d'une intervention
'  3/02/1997 PV  R�f�rence ancienne � partir d'une diff�rence de 100000 au lieu de 40000 (fusion)
' 26/01/1998 PV  V�rification de l'unicit� de la r�f�rence, on signale le doublon A43123 et G43123 sans bloquer
' 10/04/1998 PV  Heure d'arriv�e et de d�part; Type de prestation, activit� et client
'  4/06/1998 PV  Logos; bdCombo
' 26/11/1998 PV  Boutons de recherche; champs etb_nbrxxx
' 19/01/1999 PV  Remplissage des combos consultants dans modConsultants
' 25/01/1999 PV  Internationalisation
' 12/08/1999 PV  Contr�le France Nord/Sud Grenoble/Massy1
' 17/12/1999 PV  Codes r�gion � partir du 1/1/2000
' 22/02/2000 PV  Ajout des champs pour les huiles
' 27/03/2000 PV  Gestion n�/dur�e EH
' 28/03/2000 PV  Secr�tariat / Labo
' 21/09/2000 PV  Lettres non prises en charge en bleu
' 29/09/2000 PV  Avis de passage; labo automatique; eh pr�d�finies
'  1/10/2000 PV  D�coupage, type de facture, facncp, facndp
' 27/11/2000 PV  bckAFacturer pour forcer le transfert en facturation
'  5/12/2000 PV  Champs txtLabXX
'  8/03/2001 PV  -pla_facncp, -pla_facndp, -pla_fact, -pla_etatlabo
' 19/03/2001 PV  Modif ref ou n�etb apr�s que la saisie labo ait commenc�: op privil�gi�e
' 27/03/2001 PV  Maximum 20 EH (Fluch: plus de 9 EH !)


Option Explicit

Private po As Intervention            ' Intervention d'origine en cas de modification

' M�canisme de protection contre la r�-entrance
Private bDansNumEtb As Boolean
Private bDansR�f�rence As Boolean
Private btnNext As CommandButton

' M�canisme de recherche d'�tablissements
Private colEtablissements As New Collection

Private e As Etablissement


Private Sub RemplitMod�lesEH(e As Etablissement)
  cboMod�lesEH.Clear
  If e.etb_typeh1 <> "" Then cboMod�lesEH.AddItem "1: " & e.etb_typeh1 & "/" & e.etb_sceeh1 & "/" & e.etb_langeh1 & " | " & e.etb_dureh1
  If e.etb_typeh2 <> "" Then cboMod�lesEH.AddItem "2: " & e.etb_typeh2 & "/" & e.etb_sceeh2 & "/" & e.etb_langeh2 & " | " & e.etb_dureh2
  If e.etb_typeh3 <> "" Then cboMod�lesEH.AddItem "3: " & e.etb_typeh3 & "/" & e.etb_sceeh3 & "/" & e.etb_langeh3 & " | " & e.etb_dureh3
  If e.etb_typeh4 <> "" Then cboMod�lesEH.AddItem "4: " & e.etb_typeh4 & "/" & e.etb_sceeh4 & "/" & e.etb_langeh4 & " | " & e.etb_dureh4
End Sub


Private Function bCheckEtablissement(bMessage As Boolean, bMAJNb As Boolean) As Boolean
  bCheckEtablissement = False
  
' On devrait tester plus subtilement la validit� du n� d'�tablissement...
  If txtNumetb = "" Then
    txtPr�fixe = ""
    txtNomEtb = ""
    txtProprio = ""
    cboMod�lesEH.Clear
    Set imgProprio.Picture = LoadPicture
    If bMessage Then
      MsgBox2i "PL014"      ' Num�ro d'�tablissement invalide.
      txtNumetb.SetFocus
    End If
    Exit Function
  End If
  
  Set e = LireEtablissement(txtNumetb, True)
  If e Is Nothing Then
    txtPr�fixe = ""
    txtNomEtb = ""
    txtProprio = ""
    cboMod�lesEH.Clear
    Set imgProprio.Picture = LoadPicture
    If bMessage Then
      MsgBox2i "PL014"
      txtNumetb.SetFocus
    End If
    Exit Function
  End If
  
  ' Si la saisie labo a commenc�, le changement d'�tablissement est une op privil�gi�e
  If po.pla_etb <> "" And txtNumetb <> po.pla_etb Then
    If NZ(po.pla_labab) + NZ(po.pla_labbs) + NZ(po.pla_labli) + NZ(po.pla_labfs) + NZ(po.pla_labhu) + NZ(po.pla_labch) > 0 Then
      'OPPL02: Changement d'�tablissement alors que la saisie labo a commenc�
      If Not bOkAcc�sPrivil�gi�(po.pla_lettres & po.pla_iref, "OPPL02") Then Exit Function
    End If
  End If
   
  ' On v�rifie que l'�tablissement n'est pas d�j� planifi� le m�me jour
  If txtNumetb <> po.pla_etb Then
    Dim sReq As String
    sReq = "pla_dateplan$" & sNormaliseQuery(po.pla_dateplan, "d")
    sReq = sReq & "$pla_etb$" & sNormaliseQuery(txtNumetb, "a")
    Dim journ�es As New AccJournee
    Dim iNbJourn�es As Integer
    iNbJourn�es = journ�es.RechercheJournee(sReq)
    
    If iNbJourn�es <> 0 Then
      Dim j As Journee
      Set j = journ�es.Item(1)
      txtPr�fixe = ""
      txtNomEtb = ""
      txtProprio = ""
      cboMod�lesEH.Clear
      Set imgProprio.Picture = LoadPicture
      If bMessage Then
        MsgBox2i "PL032", j.sLettres, sNomAssistant(j.sLettres)
        ' MsgBox "�tablissement d�j� planifi� ce jour." & vbCrLf & vbCrLf & "L'�tablissement est d�j� planifi� sur un planning de " & j.sLettres & " " & sNomAssistant(j.sLettres)
        txtNumetb.SetFocus
      End If
      Exit Function
    End If
  End If
  
  ' Enfin, si tout est Ok
  txtPr�fixe = e.etb_prefixe
  txtNomEtb = e.etb_nom
  txtProprio = e.etb_proprio
  Set imgProprio.Picture = frmLogo.GetPicture(txtProprio)
  
  ' Mod�les EH pr�d�finis
  RemplitMod�lesEH e

  If bMAJNb Then
    If txtNbAB = "" Then
      txtNbAB = NV(e.etb_nbran)
      txtNbAB.SelStart = 0
      txtNbAB.SelLength = 99
    End If
    
    If txtNbEH = "" Then
      txtNbEH = NV(e.etb_nbreh)
      txtNbEH.SelStart = 0
      txtNbEH.SelLength = 99
    End If
    
    If txtNbBS = "" Then
      txtNbBS = NV(e.etb_nbrbs)
      txtNbBS.SelStart = 0
      txtNbBS.SelLength = 99
    End If
    
    If txtNbLi = "" Then
      txtNbLi = NV(e.etb_nbrlis)
      txtNbLi.SelStart = 0
      txtNbLi.SelLength = 99
    End If
  
    If txtNbFS = "" Then
      txtNbFS = NV(e.etb_nbrfs)
      txtNbFS.SelStart = 0
      txtNbFS.SelLength = 99
    End If
    
    If txtNbHu = "" Then
      txtNbHu = NV(e.etb_nbrhuiles)
      txtNbHu.SelStart = 0
      txtNbHu.SelLength = 99
    End If
  
    If txtNbCh = "" Then
      txtNbCh = NV(e.etb_nbrch)
      txtNbCh.SelStart = 0
      txtNbCh.SelLength = 99
    End If
    
    If bdcLabo = "?" Then bdcLabo = NV(e.etb_labo_ajust�)
    If bckAvisPassage = "?" Then bckAvisPassage = NV(e.etb_avispassage)
    If bdcD�coupage = "?" Then bdcD�coupage = NV(e.etb_decoupage)
  
    If bckFPStandard = "?" Then bckFPStandard = NV(e.etb_fpstandard)
    If txtRefCmdClient = "?" Then txtRefCmdClient = NV(e.etb_refcom)
  End If
  
  bCheckEtablissement = True
End Function


Private Function bCheckR�f�rence(bMessage As Boolean) As Boolean
  ' Si la saisie labo a commenc�, le changement de r�f�rence est une op privil�gi�e
  If NZ(po.pla_labab) + NZ(po.pla_labbs) + NZ(po.pla_labli) + NZ(po.pla_labfs) + NZ(po.pla_labhu) + NZ(po.pla_labch) > 0 Then
    If po.pla_iref <> txtR�f�rence Then
      'OPPL01: Changement de r�f�rence une fois que la saisie labo a commenc� (d�conseill�)
      If Not bOkAcc�sPrivil�gi�(po.pla_lettres & po.pla_iref, "OPPL01") Then Exit Function
    End If
  End If

  If txtR�f�rence = "" Then
    bCheckR�f�rence = True
    Exit Function
  End If
  
  bCheckR�f�rence = False
  
  If Not IsNumeric(txtR�f�rence) Then
    If bMessage Then
      MsgBox2i "PL015"
      txtR�f�rence.SetFocus
    End If
    Exit Function
  End If
  
  ' Contr�le de bornes
  ' Pour gagner du temps, on ne lit la r�f�rence maximum attribu�e que si la valeur saisie
  ' d�passe la valeur pr�c�demment connue�
  If txtR�f�rence > iMaxRef Then
    Dim sLigne As String, br As New Rev
    sLigne = D�monInfo(4)
    br.Buffer = sLigne
    br.GetField iMaxRef
  End If
  If txtR�f�rence < iMinRef Or txtR�f�rence > iMaxRef Then
    If bMessage Then
      MsgBox2i "PL038", iMinRef, iMaxRef
      '"R�f�rence hors limites." & vbCrLf & "La r�f�rence doit �tre comprise entre " & iMinRef & " et " & iMaxRef & "."
      txtR�f�rence.SetFocus
    End If
    Exit Function
  End If
  
  
  ' V�rifier aupr�s du d�mon msd que la r�f�rence est correcte
  Dim OldRef
  OldRef = po.pla_iref
  If IsNull(OldRef) Then OldRef = ""
  If txtR�f�rence <> OldRef Then
    Dim iSerPlan As Long
    Dim cSyst�me As String
    iSerPlan = msdTrouveRef(po.pla_lettres, CLng(txtR�f�rence), cSyst�meCA, cSyst�me)
    If iSerPlan <> 0 Then
      Dim p As Intervention
      Set p = LireIntervention(cSyst�me, iSerPlan)
      If bMessage Then MsgBox2i "PL022", txtR�f�rence, p.pla_lettres, sNomAssistant(p.pla_lettres), Format(p.pla_dateplan, "short date")
                      'MsgBox2 "R�f�rence d�j� utilis�e." & vbCrLf & vbCrLf & "La r�f�rence " & txtR�f�rence & " a d�j� �t� utilis�e dans un planning de " & p.pla_lettres & " (" & sNomAssistant(p.pla_lettres) & ") du " & Format(p.pla_dateplan, "short date") & ".", "PL022"
      Exit Function
    End If
  End If
  
  ' Contr�le de vraisemblance
  If txtR�f�rence < iMaxRef - 100000 Then
    If bMessage Then
      MsgBox2i "PL043"
      'MsgBox2 "R�f�rence ancienne." & vbCrLf & "La r�f�rence saisie a �t� g�n�r�e il y a longtemps, assurez-vous qu'il n'y a pas d'erreur.", "PL043"
    End If
  End If
  
  bCheckR�f�rence = True
End Function


Private Function bCheckPersonne(bMessage As Boolean) As Boolean
  bCheckPersonne = False
  
  If txtPersonne = "" Then
    txtNomPersonne = ""
    If bMessage Then MsgBox2i "PL016": txtPersonne.SetFocus
                      'MsgBox2 "La personne doit �tre d�finie", "PL016": txtPersonne.SetFocus
    Exit Function
  End If
  If Not IsNumeric(txtPersonne) Then
    txtNomPersonne = ""
    If bMessage Then
      MsgBox2i "CO004", txtPersonne
      'MsgBox2 "Personne incorrecte", "PL017"
      On Error Resume Next
      txtPersonne.SetFocus
      On Error GoTo 0
    End If
    Exit Function
  End If
  
  Dim u As Utilisateur
  Set u = UtiParNum�ro(txtPersonne)
  If u Is Nothing Then
    txtNomPersonne = ""
    If bMessage Then MsgBox2i "CO005", txtPersonne
      On Error Resume Next
      txtPersonne.SetFocus
      On Error GoTo 0
                      'MsgBox2 "Personne inexistante", "PL017": txtPersonne.SetFocus
    Exit Function
  End If
  
  txtNomPersonne = u.uti_nom
  bCheckPersonne = True
  
  If txtUnit� = "" Then
    txtUnit� = NV(iUnit�D�faut(txtLettres))
    Dim b As Boolean
    b = bCheckUnit�(False)
  End If
End Function


Private Function bCheckUnit�(bMessage As Boolean) As Boolean
  bCheckUnit� = False
  
  If txtUnit� = "" Then
    txtNomUnit� = ""
    If bMessage Then MsgBox2i "PL018": txtUnit�.SetFocus
                    'MsgBox2 "L'unit� doit �tre d�finie", "PL018": txtUnit�.SetFocus
    Exit Function
  End If
  If Not IsNumeric(txtUnit�) Then
    txtNomUnit� = ""
    If bMessage Then
      MsgBox2i "CO004", txtUnit�    'MsgBox2 "Unit� incorrecte", "PL019"
      On Error Resume Next
      txtUnit�.SetFocus
      On Error GoTo 0
    End If
    Exit Function
  End If
  
  Dim u As Unite
  Set u = UniParNum�ro(txtUnit�)
  If u Is Nothing Then
    txtNomUnit� = ""
    If bMessage Then
      MsgBox2i "CO005", txtUnit�     'MsgBox2 "Unit� inexistante", "PL019": txtUnit�.SetFocus
      On Error Resume Next
      txtUnit�.SetFocus
      On Error GoTo 0
    End If
    Exit Function
  End If
  
  ' On v�rifie qu'� partir du 1/1/2000 on utilise les codes r�gion, et pas avant
  ' Ne concerne que la france
  If cSyst�meCA Like "[GPTCRH]" Then
    If po.pla_dateplan >= DateSerial(2001, 9, 1) And (u.uni_numunite >= 310 And u.uni_numunite <= 360) Then
      If bMessage Then
        MsgBox "Code unit� incorrect." & vbCrLf & vbCrLf & "Utilisez les codes secteur (11,12,13, 24,25,26, 37,38,39) et non plus les codes r�gion � compter du 1/09.", vbExclamation, App.Title
        On Error Resume Next
        txtUnit�.SetFocus
        On Error GoTo 0
      End If
      Exit Function
    End If
      
      
    If po.pla_dateplan < DateSerial(2001, 9, 1) And u.uni_numunite < 100 Then
      If bMessage Then
        MsgBox "Code unit� incorrect." & vbCrLf & vbCrLf & "Utilisez les codes r�gion (R1=310, ...) et non pas les codes seteur jusqu'au 31/09.", vbExclamation, App.Title
        On Error Resume Next
        txtUnit�.SetFocus
        On Error GoTo 0
      End If
      Exit Function
    End If
  End If
  
  txtNomUnit� = u.uni_code & " " & u.uni_titre
  bCheckUnit� = True
End Function


Private Function bCheckNbXX(bMessage As Boolean, ByVal s As String, ctl As Control, iMax As Integer, sMsg As String) As Boolean
  If s = "" Then bCheckNbXX = True: Exit Function
  If IsNumeric(s) Then
    If s >= 0 And s <= iMax And s = Int(s) Then
      bCheckNbXX = True
      Exit Function
    End If
  End If
    
  If bMessage Then
    MsgBox2i "CO003b", s, 1, iMax
    ctl.SetFocus
  End If
End Function

Private Function bCheckNbAB(bMessage As Boolean) As Boolean
  bCheckNbAB = bCheckNbXX(bMessage, txtNbAB, txtNbAB, 99, "d'AB")
End Function

Private Function bCheckNbEH(bMessage As Boolean) As Boolean
  bCheckNbEH = bCheckNbXX(bMessage, txtNbEH, txtNbEH, 20, "d'EH")
End Function

Private Function bCheckNbBS(bMessage As Boolean) As Boolean
  bCheckNbBS = bCheckNbXX(bMessage, txtNbBS, txtNbBS, 99, "de BS")
End Function

Private Function bCheckNbLi(bMessage As Boolean) As Boolean
  bCheckNbLi = bCheckNbXX(bMessage, txtNbLi, txtNbLi, 99, "de List�ria")
End Function

Private Function bCheckNbFS(bMessage As Boolean) As Boolean
  bCheckNbFS = bCheckNbXX(bMessage, txtNbFS, txtNbFS, 99, "de FS")
End Function

Private Function bCheckNbHu(bMessage As Boolean) As Boolean
  bCheckNbHu = bCheckNbXX(bMessage, txtNbHu, txtNbHu, 99, "d'huiles")
End Function

Private Function bCheckNbCh(bMessage As Boolean) As Boolean
  bCheckNbCh = bCheckNbXX(bMessage, txtNbCh, txtNbCh, 99, "de chimies")
End Function

Private Function bCheckNbTotalEch(bMessage As Boolean) As Boolean
  Dim iNbTot As Integer
  iNbTot = Val(txtNbAB) + Val(txtNbBS) + Val(txtNbCh) + Val(txtNbLi) + Val(txtNbFS) + Val(txtNbHu)
  
  If iNbTot >= 100 Then
    If bMessage Then
      MsgBox2i "CO003b", "Le nombre total d'�chantillons", 1, 99
    End If
    bCheckNbTotalEch = False
  Else
    bCheckNbTotalEch = True
  End If
End Function



Private Function bCheckNumEh(bMessage As Boolean) As Boolean
  'bCheckNumEh = bCheckNbXX(bMessage, txtNumEH, txtNumEH, 2000, "'N� EH'")
  ' On devrait v�rifier le format, mais bon...
  bCheckNumEh = True
End Function

Private Function bCheckDurEh(bMessage As Boolean) As Boolean
  bCheckDurEh = bCheckNbXX(bMessage, txtDurEH, txtDurEH, 180, "'Dur�e EH'")
End Function

Private Function bCheckSecret(bMessage As Boolean) As Boolean
  ' En attendant mieux
  bCheckSecret = True
End Function

Private Function bCheckLabo(bMessage As Boolean) As Boolean
  If bdcLabo.ListIndex < 0 Then
    MsgBox "Vous devez obligatoirement s�lectionner un laboratoire de la liste", vbExclamation, App.Title
    bdcLabo.SetFocus
    Exit Function
  End If
  bCheckLabo = True
End Function


Private Function bCheckCodeActivit�(bMessage As Boolean) As Boolean
  bCheckCodeActivit� = bCheckNbXX(bMessage, bdcCodeActivit�.Text, bdcCodeActivit�, 1000, "'code d'activit�'")
End Function

Private Function bCheckTypePrestation(bMessage As Boolean) As Boolean
  bCheckTypePrestation = bCheckNbXX(bMessage, bdcTypePrestation.Text, bdcTypePrestation, 1000, "'type prestation'")
End Function


Private Function EffacerAjout()
  txtNumetb = ""
  txtPr�fixe = ""
  txtNomEtb = ""
  txtProprio = ""
  Set imgProprio.Picture = LoadPicture
  
  txtR�f�rence = ""
  txtRefCmdClient = ""
  bckAFacturer = ""
  
  txtComment = ""
  txtNomPersonne = ""
  If po.pla_pers > 0 Then
    txtPersonne = po.pla_pers
    txtPersonne.SelStart = 0
    txtPersonne.SelLength = 99
    txtPersonne_LostFocus
  Else
    txtPersonne = ""
  End If
  
  txtNomUnit� = ""
  If po.pla_unite > 0 Then
    txtUnit� = po.pla_unite
    txtUnit�.SelStart = 0
    txtUnit�.SelLength = 99
    txtUnit�_LostFocus
  Else
    txtUnit� = ""
  End If
  txtNbAB = ""
  txtNbEH = ""
  txtNbBS = ""
  txtNbLi = ""
  txtNbFS = ""
  txtNbHu = ""
  txtNbCh = ""
  
  txtLabAB = ""
  txtLabBS = ""
  txtLabLi = ""
  txtLabFS = ""
  txtLabHu = ""
  txtLabCh = ""
  
  cboMod�lesEH.Clear
  txtNumEH = ""
  txtDurEH = ""
  
  bdcSecret = cSyst�meCA
  bdcLabo = "?"
  bdcD�coupage = "?"
  
  bckAvisPassage = "?"
  bckFPStandard = "?"
  
  txtHeureArriv�e.HeureSaisie = ""
  txtHeureD�part.HeureSaisie = ""
  
  bdcTypePrestation.Text = ""
  bdcCodeActivit�.Text = ""
  txtCodeClient = ""
End Function


Private Function EffacerModif()
  EffacerAjout
  txtNumetb = po.pla_etb
  txtNumetb.SelStart = 0
  txtNumetb.SelLength = 99
  
  txtR�f�rence = NV(po.pla_iref)
  txtR�f�rence.SelStart = 0
  txtR�f�rence.SelStart = 99
  
  txtComment = po.pla_comment
  txtComment.SelStart = 0
  txtComment.SelLength = 99
  
  txtNbAB = NZ(po.pla_nbab)
  txtNbAB.SelStart = 0
  txtNbAB.SelLength = 9
  
  txtNbEH = NZ(po.pla_nbeh)
  txtNbEH.SelStart = 0
  txtNbEH.SelLength = 9
  
  txtNbBS = NZ(po.pla_nbbs)
  txtNbBS.SelStart = 0
  txtNbBS.SelLength = 9
  
  txtNbLi = NZ(po.pla_nbli)
  txtNbLi.SelStart = 0
  txtNbLi.SelLength = 9
  
  txtNbFS = NZ(po.pla_nbfs)
  txtNbFS.SelStart = 0
  txtNbFS.SelLength = 9

  txtNbHu = NZ(po.pla_nbhu)
  txtNbHu.SelStart = 0
  txtNbHu.SelLength = 9

  txtNbCh = NZ(po.pla_nbch)
  txtNbCh.SelStart = 0
  txtNbCh.SelLength = 9
  
  txtLabAB = Format(NZ(po.pla_labab), "#")
  txtLabBS = Format(NZ(po.pla_labbs), "#")
  txtLabLi = Format(NZ(po.pla_labli), "#")
  txtLabFS = Format(NZ(po.pla_labfs), "#")
  txtLabHu = Format(NZ(po.pla_labhu), "#")
  txtLabCh = Format(NZ(po.pla_labch), "#")
  
  txtNumEH = NV(po.pla_numeh)
  txtNumEH.SelStart = 0
  txtNumEH.SelLength = 9
 
  txtDurEH = NV(po.pla_dureh)
  txtDurEH.SelStart = 0
  txtDurEH.SelLength = 9
  
  txtRefCmdClient = po.pla_refcom
  bckAFacturer = NV(po.pla_etatfac)
  
  bdcSecret = NV(po.pla_secret)
  bdcLabo = NV(po.pla_labo)
  bckAvisPassage = po.pla_avispassage
  bdcD�coupage = po.pla_decoupage
  
  bckFPStandard = po.pla_fpstandard
  
  txtHeureArriv�e.HeureSaisie = NV(po.pla_harrivee)
  txtHeureD�part.HeureSaisie = NV(po.pla_hdepart)
  
  bdcCodeActivit�.Text = NV(po.pla_activite)
  'bdcCodeActivit�.SelStart = 0
  'bdcCodeActivit�.SelLength = 99
  
  bdcTypePrestation.Text = NV(po.pla_typeprest)
  'bdcTypePrestation.SelStart = 0
  'bdcTypePrestation.SelLength = 99
  
  txtCodeClient = NV(po.pla_client)
  txtCodeClient.SelStart = 0
  txtCodeClient.SelLength = 99
  
  Dim b As Boolean
  b = bCheckEtablissement(False, True)
  b = bCheckPersonne(False)
  b = bCheckUnit�(False)
End Function


Private Function bCheckHeureArriv�e(bMessage As Boolean)
  If txtHeureArriv�e.HeureSaisie = "ERR" Then
    If bMessage Then
      bCheckHeureArriv�e = False
      txtHeureArriv�e.SetFocus
      MsgBox2i "CO004", txtHeureArriv�e
      'MsgBox "Heure d'arriv�e invalide.", vbExclamation, sNomApp
    End If
    Exit Function
  End If

  bCheckHeureArriv�e = True
End Function

Private Function bCheckHeureD�part(bMessage As Boolean)
  If txtHeureD�part.HeureSaisie = "ERR" Then
    If bMessage Then
      txtHeureD�part.SetFocus
      MsgBox2i "CO004", txtHeureD�part
      'MsgBox "Heure de d�part invalide.", vbExclamation, sNomApp
    End If
    bCheckHeureD�part = False
    Exit Function
  End If
  
  If txtHeureD�part.HeureSaisie <> "" And txtHeureArriv�e.HeureSaisie = "" Or txtHeureD�part.HeureSaisie = "" And txtHeureArriv�e.HeureSaisie <> "" Then
    If bMessage Then
      txtHeureD�part.SetFocus
      MsgBox2i "PL100"
      'MsgBox "L'heure d'arriv�e et l'heure de d�part doivent �tre toutes deux renseign�es ou toutes deux laiss�es vides.", vbExclamation, sNomApp
    End If
    bCheckHeureD�part = False
    Exit Function
  End If
  
  If txtHeureD�part.HeureSaisie = "" Then
    bCheckHeureD�part = True
    Exit Function
  End If
  
  If txtHeureD�part.HeureSaisie < txtHeureArriv�e.HeureSaisie Then
    If bMessage Then
      txtHeureD�part.SetFocus
      MsgBox2i "PL101"
      'MsgBox "Parti avant m�me d'�tre arriv� ? Super-assistant ?", vbExclamation, sNomApp
    End If
    bCheckHeureD�part = False
    Exit Function
  End If
  
  If txtHeureD�part.HeureSaisie - txtHeureArriv�e.HeureSaisie < 5 Then
    If bMessage Then
      MsgBox2i "PL102"
      'MsgBox "Information: Prestation de moins de 5 minutes�" & vbCrLf & "V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
    End If
  End If

  bCheckHeureD�part = True
End Function


Private Function bCheckInfosConsultants(bMessage As Boolean)
  If bdcTypePrestation <> "" Or bdcCodeActivit� <> "" Or txtCodeClient <> "" Then
    If bdcTypePrestation = "" Or bdcCodeActivit� = "" Or txtCodeClient = "" Then
      If bMessage Then
        MsgBox2i "PL103"
        'MsgBox "Information: Il est pr�f�rable que les champs consultants soient tous vides ou tous remplis." & vbCrLf & "V�rifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
      End If
    End If
  End If
  bCheckInfosConsultants = True
End Function


Private Function bCheckAvisPassage(bMessage As Boolean)
  If bckAvisPassage <> "O" And bckAvisPassage <> "N" Then
    MsgBox "Le champ avis de passage est obligatoire, � O ou N", vbExclamation, App.Title
    bckAvisPassage.SetFocus
    Exit Function
  End If
  bCheckAvisPassage = True
End Function


Private Function bCheckFPStandard(bMessage As Boolean)
  If bckFPStandard <> "O" And bckFPStandard <> "N" Then
    MsgBox "Le champ FP Standard est obligatoire, � O ou N", vbExclamation, App.Title
    bckFPStandard.SetFocus
    Exit Function
  End If
  bCheckFPStandard = True
End Function


Private Function bCheckAFacturer(bMessage As Boolean)
  If bckAFacturer <> "O" And bckAFacturer <> "N" And bckAFacturer <> "" Then
    MsgBox "Le champ 'A Facturer' doir valoir O ou N (ou vide), O indiquant un transfert en facturation apr�s validation m�me en l'absence de documents", vbExclamation, App.Title
    bckAFacturer.SetFocus
    Exit Function
  End If
  bCheckAFacturer = True
End Function


Private Function bCheckInfosFacturation(bMessage As Boolean)
  If bdcD�coupage = "" Then
    If bMessage Then MsgBox "La r�gle de d�coupage de l'intervention est obligatoire", vbExclamation, App.Title
    bdcD�coupage.SetFocus
    Exit Function
  End If
  bdcD�coupage.Synchronise
  If bdcD�coupage.ListIndex < 0 Then
    If bMessage Then MsgBox "R�gle de d�coupage invalide !", vbExclamation, App.Title
    bdcD�coupage.SetFocus
    Exit Function
  End If
  
  bCheckInfosFacturation = True
End Function


Public Function bContr�lesSp�cifiquesFrance(e As Etablissement, d As Date)
  bContr�lesSp�cifiquesFrance = False
  
  ' �tablissements [Supprim�]/[A Supprimer]
  If cSyst�meCA Like "[GPTCHROW]" Then
    If Left(e.etb_nom, 1) = "[" Then
      MsgBox2i "PL042c"
      If Not bShiftPressed Then Exit Function
    End If
  End If
  
'  ' Z�ne France Nord/sud (Sp�cifique � la France)
'  ' Tableau � jour du 15/08/1999
'  If cSyst�meCA = "G" Or cSyst�meCA = "P" Then
'    If e.etb_pays = 0 Then   ' France
'      Dim sZone As String, sDep As String
'      sDep = Left(e.etb_cpost, 2)
'
'      If d < #2/1/2000# Then
'        Select Case sDep
'          Case "01": sZone = "S"
'          Case "02": sZone = "N"
'          Case "03": sZone = "S"
'          Case "04": sZone = "S"
'          Case "05": sZone = "S"
'          Case "06": sZone = "S"
'          Case "07": sZone = "S"
'          Case "08": sZone = "N"
'          Case "09": sZone = "S"
'          Case "10": sZone = "N"
'          Case "11": sZone = "S"
'          Case "12": sZone = "S"
'          Case "13": sZone = "S"
'          Case "14": sZone = "N"
'          Case "15": sZone = "S"
'          Case "16": sZone = "S"
'          Case "17": sZone = "S"
'          Case "18": sZone = "N"
'          Case "19": sZone = "S"
'          Case "2A", "2B", "20": sZone = "S"
'          Case "21": sZone = "S"
'          Case "22": sZone = "N"
'          Case "23": sZone = "S"
'          Case "24": sZone = "S"
'          Case "25": sZone = "S"
'          Case "26": sZone = "S"
'          Case "27": sZone = "N"
'          Case "28": sZone = "N"
'          Case "29": sZone = "N"
'          Case "30": sZone = "S"
'          Case "31": sZone = "S"
'          Case "32": sZone = "S"
'          Case "33": sZone = "S"
'          Case "34": sZone = "S"
'          Case "35": sZone = "N"
'          Case "36": sZone = "N"
'          Case "37": sZone = "N"
'          Case "38": sZone = "S"
'          Case "39": sZone = "S"
'          Case "40": sZone = "S"
'          Case "41": sZone = "N"
'          Case "42": sZone = "S"
'          Case "43": sZone = "S"
'          Case "44": sZone = "N"
'          Case "45": sZone = "N"
'          Case "46": sZone = "S"
'          Case "47": sZone = "S"
'          Case "48": sZone = "S"
'          Case "49": sZone = "N"
'          Case "50": sZone = "N"
'          Case "51": sZone = "N"
'          Case "52": sZone = "N"
'          Case "53": sZone = "N"
'          Case "54": sZone = "N"
'          Case "55": sZone = "N"
'          Case "56": sZone = "N"
'          Case "57": sZone = "N"
'          Case "58": sZone = "N"
'          Case "59": sZone = "N"
'          Case "60": sZone = "N"
'          Case "61": sZone = "N"
'          Case "62": sZone = "N"
'          Case "63": sZone = "S"
'          Case "64": sZone = "S"
'          Case "65": sZone = "S"
'          Case "66": sZone = "S"
'          Case "67": sZone = "N"
'          Case "68": sZone = "N"
'          Case "69": sZone = "S"
'          Case "70": sZone = "S"
'          Case "71": sZone = "S"
'          Case "72": sZone = "N"
'          Case "73": sZone = "S"
'          Case "74": sZone = "S"
'          Case "75": sZone = "N"
'          Case "76": sZone = "N"
'          Case "77": sZone = "N"
'          Case "78": sZone = "N"
'          Case "79": sZone = "N"
'          Case "80": sZone = "N"
'          Case "81": sZone = "S"
'          Case "82": sZone = "S"
'          Case "83": sZone = "S"
'          Case "84": sZone = "S"
'          Case "85": sZone = "N"
'          Case "86": sZone = "N"
'          Case "87": sZone = "S"
'          Case "88": sZone = "N"
'          Case "89": sZone = "N"
'          Case "90": sZone = "S"
'          Case "91": sZone = "N"
'          Case "92": sZone = "N"
'          Case "93": sZone = "N"
'          Case "94": sZone = "N"
'          Case "95": sZone = "N"
'          Case Else: sZone = "?"
'        End Select
'      Else
'        Select Case sDep
'          Case "01": sZone = "S"
'          Case "02": sZone = "N"
'          Case "03": sZone = "S"
'          Case "04": sZone = "S"
'          Case "05": sZone = "S"
'          Case "06": sZone = "S"
'          Case "07": sZone = "S"
'          Case "08": sZone = "N"
'          Case "09": sZone = "S"
'          Case "10": sZone = "N"
'          Case "11": sZone = "S"
'          Case "12": sZone = "S"
'          Case "13": sZone = "S"
'          Case "14": sZone = "N"
'          Case "15": sZone = "S"
'          Case "16": sZone = "S"
'          Case "17": sZone = "S"
'          Case "18": sZone = "N"
'          Case "19": sZone = "S"
'          Case "20": sZone = "S"
'          Case "2A": sZone = "S"
'          Case "2B": sZone = "S"
'          Case "21": sZone = "N"
'          Case "22": sZone = "S"
'          Case "23": sZone = "S"
'          Case "24": sZone = "S"
'          Case "25": sZone = "N"
'          Case "26": sZone = "S"
'          Case "27": sZone = "N"
'          Case "28": sZone = "N"
'          Case "29": sZone = "S"
'          Case "30": sZone = "S"
'          Case "31": sZone = "S"
'          Case "32": sZone = "S"
'          Case "33": sZone = "S"
'          Case "34": sZone = "S"
'          Case "35": sZone = "S"
'          Case "36": sZone = "N"
'          Case "37": sZone = "N"
'          Case "38": sZone = "S"
'          Case "39": sZone = "N"
'          Case "40": sZone = "S"
'          Case "41": sZone = "N"
'          Case "42": sZone = "S"
'          Case "43": sZone = "S"
'          Case "44": sZone = "S"
'          Case "45": sZone = "N"
'          Case "46": sZone = "S"
'          Case "47": sZone = "S"
'          Case "48": sZone = "S"
'          Case "49": sZone = "S"
'          Case "50": sZone = "N"
'          Case "51": sZone = "N"
'          Case "52": sZone = "N"
'          Case "53": sZone = "S"
'          Case "54": sZone = "N"
'          Case "55": sZone = "N"
'          Case "56": sZone = "S"
'          Case "57": sZone = "N"
'          Case "58": sZone = "N"
'          Case "59": sZone = "N"
'          Case "60": sZone = "N"
'          Case "61": sZone = "N"
'          Case "62": sZone = "N"
'          Case "63": sZone = "S"
'          Case "64": sZone = "S"
'          Case "65": sZone = "S"
'          Case "66": sZone = "S"
'          Case "67": sZone = "N"
'          Case "68": sZone = "N"
'          Case "69": sZone = "S"
'          Case "70": sZone = "N"
'          Case "71": sZone = "N"
'          Case "72": sZone = "S"
'          Case "73": sZone = "S"
'          Case "74": sZone = "S"
'          Case "75": sZone = "N"
'          Case "76": sZone = "N"
'          Case "77": sZone = "N"
'          Case "78": sZone = "N"
'          Case "79": sZone = "S"
'          Case "80": sZone = "N"
'          Case "81": sZone = "S"
'          Case "82": sZone = "S"
'          Case "83": sZone = "S"
'          Case "84": sZone = "S"
'          Case "85": sZone = "S"
'          Case "86": sZone = "S"
'          Case "87": sZone = "S"
'          Case "88": sZone = "N"
'          Case "89": sZone = "N"
'          Case "90": sZone = "N"
'          Case "91": sZone = "N"
'          Case "92": sZone = "N"
'          Case "93": sZone = "N"
'          Case "94": sZone = "N"
'          Case "95": sZone = "N"
'          Case Else: sZone = "?"
'        End Select
'      End If
'
'      If sZone = "S" And cSyst�meCA = "P" Then
'        MsgBox2i "PL042a", sDep
'        If Not bShiftPressed Then
'          ' Le message est bloquant � compter du 1er sept 99
'          If d >= #9/1/1999# Then Exit Function
'        End If
'      End If
'
'      If sZone = "N" And cSyst�meCA = "G" Then
'        MsgBox2i "PL042b", sDep
'        If Not bShiftPressed Then
'          ' Le message est bloquant � compter du 1er sept 99
'          If d >= #9/1/1999# Then Exit Function
'        End If
'      End If
'
'    End If
'  End If
  
  bContr�lesSp�cifiquesFrance = True
End Function


Private Function bAjouterModifier(bNouveau As Boolean) As Boolean
  bAjouterModifier = False
  
  If Not bCheckEtablissement(True, False) Then Exit Function
  If Not bCheckR�f�rence(True) Then Exit Function
  If Not bCheckPersonne(True) Then Exit Function
  If Not bCheckUnit�(True) Then Exit Function
  If Not bCheckNbAB(True) Then Exit Function
  If Not bCheckNbEH(True) Then Exit Function
  If Not bCheckNbBS(True) Then Exit Function
  If Not bCheckNbLi(True) Then Exit Function
  If Not bCheckNbFS(True) Then Exit Function
  If Not bCheckNbHu(True) Then Exit Function
  If Not bCheckNbCh(True) Then Exit Function
  If Not bCheckNbTotalEch(True) Then Exit Function
  If Not bCheckNumEh(True) Then Exit Function
  If Not bCheckDurEh(True) Then Exit Function
  If Not bCheckSecret(True) Then Exit Function
  If Not bCheckLabo(True) Then Exit Function
  If Not bCheckHeureArriv�e(True) Then Exit Function
  If Not bCheckHeureD�part(True) Then Exit Function
  If Not bCheckCodeActivit�(True) Then Exit Function
  If Not bCheckTypePrestation(True) Then Exit Function
  If Not bCheckInfosConsultants(True) Then Exit Function
  If Not bCheckAvisPassage(True) Then Exit Function
  If Not bCheckFPStandard(True) Then Exit Function
  If Not bCheckAFacturer(True) Then Exit Function
  If Not bCheckInfosFacturation(True) Then Exit Function
  
'  Contr�le retir� le 20/1/01 PV
'  If e.etb_unite <> txtUnit� And Not bPasSignalerEcartUnit� Then
'    MsgBox2i "PL042", txtNumetb, txtPr�fixe, txtNomEtb, e.etb_unite, txtUnit�
'    'MsgBox2 "Diff�rence de centre de profit entre le fichier �tablissement et l'intervention." & vbCrLf & "L'�tablissement " & txtNumEtb & " " & txtPr�fixe & " " & txtNomEtb & " est affect� au centre de profit " & e.etb_unite & " dans le fichier �tablissement. Il est affect� au centre de profit " & txtUnit� & " pour cette intervention.", "PL042"
'  End If


'  ' V�rification etb_proprio = "F"
'  If e.etb_proprio = "F" Then
'    MsgBox2i "PL122"
'  End If
  
  If Not bContr�lesSp�cifiquesFrance(e, po.pla_dateplan) Then Exit Function
  
  Dim OldRef
  OldRef = po.pla_iref
  If IsNull(OldRef) Then OldRef = 0
  
  ' On commence par stocker les valeurs dans une structure planning
  ' Cet interm�diaire n'est pas forc�ment n�cessaire�
  Dim p As New Intervention
  p.pla_systeme = po.pla_systeme
  p.pla_serie = po.pla_serie
  p.pla_iref = VN(txtR�f�rence)
  If IsNumeric(p.pla_iref) And p.pla_iref <> OldRef Then p.pla_iref = -p.pla_iref
  p.pla_lettres = txtLettres
  p.pla_dateplan = txtDate.DateSaisie
  p.pla_pers = txtPersonne
  p.pla_unite = txtUnit�
  p.pla_etb = txtNumetb
  p.pla_comment = txtComment
  p.pla_nbab = VZN(txtNbAB)
  p.pla_nbeh = VZN(txtNbEH)
  p.pla_nbbs = VZN(txtNbBS)
  p.pla_nbli = VZN(txtNbLi)
  p.pla_nbfs = VZN(txtNbFS)
  p.pla_nbhu = VZN(txtNbHu)
  p.pla_nbch = VZN(txtNbCh)
  p.pla_numeh = txtNumEH   ' 27/3/00 PV
  p.pla_dureh = VZN(txtDurEH)   ' 27/3/00 PV
  p.etb_prefixe = txtPr�fixe
  p.etb_nom = txtNomEtb
  p.etb_proprio = txtProprio
  ' 10/04/1998
  p.pla_harrivee = VN(txtHeureArriv�e.HeureSaisie)
  p.pla_hdepart = VN(txtHeureD�part.HeureSaisie)
  p.pla_typeprest = VN(bdcTypePrestation.Text)
  p.pla_activite = VN(bdcCodeActivit�.Text)
  p.pla_client = txtCodeClient
  ' 18/03/1999
  p.pla_dateorigine = Null
  ' 28/3/2000
  p.pla_secret = bdcSecret
  p.pla_labo = bdcLabo
  ' test suivant le 27/11/00 PV: on peut modifier certains champs apr�s validation
  If bNouveau Then
    p.pla_datevalid = Null
    p.pla_opervalid = Null
  Else
    p.pla_datevalid = po.pla_datevalid
    p.pla_opervalid = po.pla_opervalid
  End If
  p.pla_avispassage = bckAvisPassage
  p.pla_decoupage = bdcD�coupage
  ' 31/10/2000
  p.pla_fpstandard = bckFPStandard
  p.pla_refcom = txtRefCmdClient
  ' 27/11/2000
  p.pla_etatfac = bckAFacturer
  
  ' 5/12/00
  If bNouveau Then
    p.pla_labab = Null
    p.pla_labbs = Null
    p.pla_labch = Null
    p.pla_labli = Null
    p.pla_labfs = Null
    p.pla_labhu = Null
  Else
    p.pla_labab = po.pla_labab
    p.pla_labbs = po.pla_labbs
    p.pla_labch = po.pla_labch
    p.pla_labli = po.pla_labli
    p.pla_labfs = po.pla_labfs
    p.pla_labhu = po.pla_labhu
  End If
  
  Dim iSerie As Long
  iSerie = EcritPlanning(p)
  p.pla_serie = iSerie
  If IsNumeric(p.pla_iref) And p.pla_iref < 0 Then p.pla_iref = -p.pla_iref
  
  ' Mise � jour de l'affichage des interventions
  Dim iRang As Integer
  If bNouveau Then
    iRang = frmPlanning.lvInterventions.ListItems.count + 1
    frmPlanning.colPlannings.Add p
    frmPlanning.AfficheUneIntervention p, -1
  Else
    ' Mise � jour de la collection
    iRang = frmPlanning.lvInterventions.SelectedItem.Index
    frmPlanning.colPlannings.Remove iRang
    If iRang = 1 Then
      If frmPlanning.colPlannings.count = 0 Then
        frmPlanning.colPlannings.Add p
      Else
        frmPlanning.colPlannings.Add p, , 1
      End If
    Else
      frmPlanning.colPlannings.Add p, , , iRang - 1
    End If
    
    ' Mise � jour de la liste
    frmPlanning.AfficheUneIntervention p, iRang
  End If
  frmPlanning.AfficheLibell�Interventions
      
  ' On s�lectionne l'item ajout�
  Set frmPlanning.lvInterventions.SelectedItem = frmPlanning.lvInterventions.ListItems(iRang)
  frmPlanning.lvInterventions_Click

  ' On lib�re la ressource �tablissement
  Set e = Nothing
  
  bAjouterModifier = True
End Function

Private Function bAjouter() As Boolean
  bAjouter = bAjouterModifier(True)
End Function

Private Function bModifier() As Boolean
  bModifier = bAjouterModifier(False)
End Function



'Private Sub btnNouveau_Click(Index As Integer)
'  Select Case btnNouveau(Index).Tag
'    Case "afacturer": Nouveau "La valeur O (Oui) permet de forcer le transfert de l'intervention en facturation, en l'absence de documents (ex: prestations consulting)|La valeur N (Non) emp�che le transfert de l'intervention en facturation."
'    Case "pla_labxx": Nouveau "Les nouveaux champs indiquent les quantit�s actuellement enregistr�es sur l'ensemble des labos pour l'intervention.|La validation des plannings consistera � analyser la cause de ces �carts."
'  End Select
'End Sub

Private Sub cboMod�lesEH_Click()
  Dim s As String
  s = cboMod�lesEH
  Dim p As Integer
  p = InStr(s, " | ")
  If p <> 0 Then
    txtNumEH = Mid(s, 4, p - 4)
    txtDurEH = Mid(s, p + 3)
  End If
End Sub




Private Sub bdcCodeActivit�_LostFocus()
  bdcCodeActivit�.Synchronise
End Sub

Private Sub bdcTypePrestation_LostFocus()
  bdcTypePrestation.Synchronise
End Sub

Private Sub bdcSecret_LostFocus()
  bdcSecret.Synchronise
End Sub

Private Sub bdcLabo_LostFocus()
  bdcLabo.Synchronise
End Sub

Private Sub bdcD�coupage_LostFocus()
  bdcD�coupage.Synchronise
End Sub



Private Sub btnAide_Click()
  Aide "frmajint"
End Sub

Private Sub btnAjouter_Click()
  If Not ActiveControl Is btnAjouter Then btnAjouter.SetFocus   ' Au cas o� on valide par entr�e, le focus ne quitte pas le champ de saisie�
  If bDansNumEtb Or bDansR�f�rence Then Set btnNext = btnAjouter: Exit Sub   ' Si le travail est en cours, on le laisse terminer
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim b As Boolean
  b = bAjouter()
  If b Then
    EffacerAjout
    btnAnnuler.Caption = sGetIntlLib("btnFermer", "Fermer")
    txtNumetb.SetFocus
    EtablissementSuivant
  End If
End Sub

Private Sub btnAnnuler_Click()
  If Not ActiveControl Is btnAnnuler Then btnAnnuler.SetFocus   ' Au cas o� on valide par entr�e, le focus ne quitte pas le champ de saisie�
  If bDansNumEtb Or bDansR�f�rence Then Set btnNext = btnAnnuler: Exit Sub   ' Si le travail est en cours, on le laisse terminer
  If bBlocageEnCours Then Beep: Exit Sub
  
  Unload Me
End Sub

Private Sub btnEffacer_Click()
  If Not ActiveControl Is btnEffacer Then btnEffacer.SetFocus   ' Au cas o� on valide par entr�e, le focus ne quitte pas le champ de saisie�
  If bDansNumEtb Or bDansR�f�rence Then Set btnNext = btnEffacer: Exit Sub   ' Si le travail est en cours, on le laisse terminer
  If bBlocageEnCours Then Beep: Exit Sub

  EffacerAjout
  txtNumetb.SetFocus
End Sub

Private Sub btnEtablissement_Click()
  RechercheEtablissement
End Sub

Private Sub btnOK_Click()
  If Not ActiveControl Is btnOK Then btnOK.SetFocus   ' Au cas o� on valide par entr�e, le focus ne quitte pas le champ de saisie�
  If bDansNumEtb Or bDansR�f�rence Then Set btnNext = btnOK: Exit Sub   ' Si le travail est en cours, on le laisse terminer
  If bBlocageEnCours Then Beep: Exit Sub
  
  ' On autorise les modifications apr�s validation, on ne peut plus d�gager
  ' simplement � ce niveau si la prestation a �t� valid�e
  
  If po.pla_serie = 0 Then
    ' Mode ajout
    If bAjouter() Then Unload Me
  Else
    If bModifier() Then Unload Me
  End If
End Sub


Public Sub AfficheFeuille(p As Intervention)
  txtDate.DateSaisie = Format(p.pla_dateplan, "short date")
  txtLettres = p.pla_lettres
  txtNomAssistant = sNomAssistant(txtLettres)
  
  If bOkLettresAssistant(p.pla_lettres, cSyst�meCA) Then
    txtLettres.ForeColor = &H80000008
    txtNomAssistant.ForeColor = &H80000008
  Else
    txtLettres.ForeColor = coulLettresAutresSys
    txtNomAssistant.ForeColor = coulLettresAutresSys
  End If

  Set po = p
  If p.pla_serie = 0 Then           ' Nouveau
    btnAnnuler.Caption = sGetIntlLib("btnAnnuler", "Annuler")
    EffacerAjout
  Else
    btnAjouter.Visible = False
    btnEffacer.Visible = False
    SetLib Me, "Caption", "AICaptionModif"
    Me.Icon = imgModifIntervention.Picture
    EffacerModif
  End If
  
  ' Intervention valid�e
  Dim bEna As Boolean
  bEna = IsNull(p.pla_opervalid)
  
  If Not bEna Then
    SetLib Me, "Caption", "AICaptionValid"
  End If

  txtNbEH.Enabled = bEna
  txtNbCh.Enabled = bEna
  txtNbBS.Enabled = bEna
  txtNbAB.Enabled = bEna
  txtNbLi.Enabled = bEna
  txtNbFS.Enabled = bEna
  
  txtNumEH.Enabled = bEna
  txtDurEH.Enabled = bEna
  cboMod�lesEH.Enabled = bEna

  txtR�f�rence.Enabled = bEna
  txtRefCmdClient.Enabled = bEna
  
  If IsNull(p.pla_opervalid) Then
    bckAFacturer.Enabled = True
  Else
    If Left(p.pla_tretatfac, 1) = "F" Then    ' D�j� transf�r� !
      bckAFacturer.Enabled = False
    Else
      bckAFacturer.Enabled = True             ' Pas encore transf�r� !
      bckAFacturer.SelStart = 0
      bckAFacturer.SelLength = 0
    End If
  End If
  bckAFacturer.TabStop = bckAFacturer.Enabled

  bckAvisPassage.Enabled = bEna
  bckAvisPassage.TabStop = bEna
  bckFPStandard.Enabled = bEna
  bckFPStandard.TabStop = bEna
  
  txtNbHu.Enabled = bEna
  btnUnit�.Enabled = bEna
  btnEtablissement.Enabled = bEna
  btnUtilisateur.Enabled = bEna
  txtProprio.Enabled = bEna
  bdcCodeActivit�.Enabled = bEna
  bdcTypePrestation.Enabled = bEna
  txtCodeClient.Enabled = bEna
  txtHeureArriv�e.Enabled = bEna
  txtNomAssistant.Enabled = bEna
  txtLettres.Enabled = bEna
  
'  btnOK.Enabled = bEna
'  btnAnnuler.Enabled = bEna
  btnAjouter.Enabled = bEna
  btnEffacer.Enabled = bEna
'  btnAide.Enabled = bEna
  
  txtComment.Enabled = bEna
  txtNomUnit�.Enabled = bEna
  txtUnit�.Enabled = bEna
  txtNomPersonne.Enabled = bEna
  txtPersonne.Enabled = bEna
  txtNomEtb.Enabled = bEna
  txtPr�fixe.Enabled = bEna
  txtNumetb.Enabled = bEna
  txtHeureD�part.Enabled = bEna
  txtDate.Enabled = bEna
  bdcSecret.Enabled = bEna
  bdcLabo.Enabled = bEna
  bdcD�coupage.Enabled = bEna
  
  Show vbModal
End Sub

Private Sub btnUnit�_Click()
  RechercheUnit�
End Sub

Private Sub btnUtilisateur_Click()
  RecherchePersonne
End Sub

Private Sub Form_Activate()
  ' Bug du VB, un champ texte avec selstart=0 et sellength=1 qui a le focus
  ' par d�faut s'affiche compl�tement scroll� ce qui fait qu'on ne voit plus
  ' son contenu...
  If ActiveControl Is bckAFacturer Then
    btnOK.SetFocus
    Refresh
    bckAFacturer.SetFocus
  End If
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub


'======================================================================
Private Sub RechercheEtablissement()
  Dim c As Collection
  Set c = frmRechercheEtablissement.Cherche2()
  
  Dim i As Integer
  For i = 1 To colEtablissements.count
    colEtablissements.Remove 1
  Next
  For Each e In c
    colEtablissements.Add e
  Next
  If colEtablissements.count > 0 Then
    EtablissementSuivant
  End If
End Sub


Private Sub EtablissementSuivant()
  If colEtablissements.count > 0 Then
    Dim e As Etablissement, sNumEtb As String
    sNumEtb = colEtablissements(1).etb_numetb
    colEtablissements.Remove 1
    
    ' La recherche ne retourne qu'un �tablissement "simple", sans le labo, sans les EH, ...
    Set e = LireEtablissement(sNumEtb, True)
    
    txtNumetb = e.etb_numetb
    txtPr�fixe = e.etb_prefixe
    txtProprio = e.etb_proprio
    Set imgProprio.Picture = frmLogo.GetPicture(txtProprio)
    txtNomEtb = e.etb_nom
    txtNumetb.SelStart = 0
    txtNumetb.SelLength = 9
    
    bdcSecret = cSyst�meCA
    bdcLabo = NV(e.etb_labo_ajust�)
    bckAvisPassage = NV(e.etb_avispassage)
    bdcD�coupage = NV(e.etb_decoupage)
    RemplitMod�lesEH e
    
    bckFPStandard = NV(e.etb_fpstandard)
    txtRefCmdClient = NV(e.etb_refcom)
    
    If e.etb_nbran > 0 Then
      txtNbAB = e.etb_nbran
      txtNbAB.SelStart = 0
      txtNbAB.SelLength = 99
    Else
      txtNbAB = ""
    End If
    
    Dim nb As Integer
    nb = 0
    If Not IsNull(e.etb_nbreh) Then nb = nb + e.etb_nbreh
    If nb > 0 Then
      txtNbEH = nb
      txtNbEH.SelStart = 0
      txtNbEH.SelLength = 99
    Else
      txtNbEH = ""
    End If

    nb = 0
    If Not IsNull(e.etb_nbrbs) Then nb = nb + e.etb_nbrbs
    If nb > 0 Then
      txtNbBS = nb
      txtNbBS.SelStart = 0
      txtNbBS.SelLength = 99
    Else
      txtNbBS = ""
    End If
    
    nb = 0
    If Not IsNull(e.etb_nbrlis) Then nb = nb + e.etb_nbrlis
    If nb > 0 Then
      txtNbLi = nb
      txtNbLi.SelStart = 0
      txtNbLi.SelLength = 99
    Else
      txtNbLi = ""
    End If
    
    nb = 0
    If Not IsNull(e.etb_nbrfs) Then nb = nb + e.etb_nbrfs
    If nb > 0 Then
      txtNbFS = nb
      txtNbFS.SelStart = 0
      txtNbFS.SelLength = 99
    Else
      txtNbFS = ""
    End If

    nb = 0
    If Not IsNull(e.etb_nbrhuiles) Then nb = nb + e.etb_nbrhuiles
    If nb > 0 Then
      txtNbHu = nb
      txtNbHu.SelStart = 0
      txtNbHu.SelLength = 99
    Else
      txtNbHu = ""
    End If
    
    nb = 0
    If Not IsNull(e.etb_nbrch) Then nb = nb + e.etb_nbrch
    If nb > 0 Then
      txtNbCh = nb
      txtNbCh.SelStart = 0
      txtNbCh.SelLength = 99
    Else
      txtNbCh = ""
    End If
    
    ' Le m�canisme d'ajout multiple est surtout utilis� en distribution o�
    ' chaque rayon a sa propre EH
    txtNumEH = ""
    txtDurEH = ""
  End If
End Sub

Private Sub Form_Load()
  Internationalisation
  
  ' Chargement des combos pour les consultants
  RemplitTypePrestation bdcTypePrestation
  RemplitActivit� bdcCodeActivit�
  
  RemplitBDC bdcSecret, "secret"
  RemplitBDC bdcLabo, "labo"
  RemplitBDC bdcD�coupage, "decoupage"
End Sub


Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If bBlocageEnCours Then Beep: Cancel = True: Exit Sub
End Sub


Private Sub txtNumEtb_Change()
  If Not bToMaj(txtNumetb) Then   ' Si bToMaj est vrai, on aura un autre appel � txtNumEtb_change
    txtPr�fixe = ""
    txtNomEtb = ""
    txtProprio = ""
    Set imgProprio.Picture = LoadPicture
    txtNbAB = ""      ' S�curit�: on change d'etb, on efface nbxx
    txtNbEH = ""
    txtNbBS = ""
    txtNbLi = ""
    txtNbFS = ""
    txtNbHu = ""
    txtNbCh = ""
    
    'txtLabAB = ""
    'txtLabBS = ""
    'txtLabLi = ""
    'txtLabFS = ""
    'txtLabHu = ""
    'txtLabCh = ""
    
    txtNumEH = ""
    txtDurEH = ""
    bdcLabo = "?"
    bckAvisPassage = "?"
    bckFPStandard = "?"
    bdcD�coupage = "?"
    cboMod�lesEH.Clear
  End If
End Sub

Private Sub txtNumEtb_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then RechercheEtablissement
End Sub

Private Sub txtNumEtb_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc("/") Then
    KeyAscii = 0
    RechercheEtablissement
  End If
  If KeyAscii = Asc("?") Then KeyAscii = 65 + Val(txtNumetb) Mod 26
End Sub

Private Sub txtNumEtb_DblClick()
  RechercheEtablissement
End Sub


'======================================================================

Private Sub RecherchePersonne()
  Dim u As Utilisateur
  Set u = frmRechercheUtilisateur.Cherche()
  If Not u Is Nothing Then
    txtPersonne = u.uti_numuti
    txtNomPersonne = u.uti_nom
    If txtUnit� = "" Then
      txtUnit� = NV(iUnit�D�faut(txtLettres))
      Dim b As Boolean
      b = bCheckUnit�(False)
    End If
    txtPersonne.SelStart = 0
    txtPersonne.SelStart = 99
    txtPersonne.SetFocus
  End If
End Sub

Private Sub txtPersonne_Change()
  txtNomPersonne = ""
End Sub

Private Sub txtPersonne_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then RecherchePersonne
End Sub

Private Sub txtPersonne_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc("/") Then
    KeyAscii = 0
    RecherchePersonne
  End If
End Sub

'======================================================================

Private Sub RechercheUnit�()
  Dim u As Unite
  Set u = frmRechercheUnit�.Cherche()
  If Not u Is Nothing Then
    txtUnit� = u.uni_numunite
    txtNomUnit� = u.uni_code & " " & u.uni_titre
    txtUnit�.SelStart = 0
    txtUnit�.SelLength = 99
    txtUnit�.SetFocus
  End If
End Sub

Private Sub txtUnit�_Change()
  txtNomUnit� = ""
End Sub

Private Sub txtUnit�_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then RechercheUnit�
End Sub

Private Sub txtUnit�_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc("/") Then
    KeyAscii = 0
    RechercheUnit�
  End If
End Sub

'======================================================================

Private Sub bdcSecret_Change()
  bToMaj bdcSecret
End Sub

Private Sub bdcLabo_Change()
  bToMaj bdcLabo
End Sub

Private Sub bdcD�coupage_Change()
  bToMin bdcD�coupage
End Sub

'======================================================================

Private Sub txtNumEtb_LostFocus()
  If bCheckEtablissement(False, True) Or txtNumetb = "" Then
    txtNumetb.ForeColor = &H80000008
  Else
    txtNumetb.ForeColor = &HFF&
  End If
  bDansNumEtb = False
  
  ' Si on avait du travail en instance, on le lance
  If Not btnNext Is Nothing Then
    btnNext = 1
    Set btnNext = Nothing
  End If
End Sub

Private Sub txtPersonne_LostFocus()
  If bCheckPersonne(False) Or txtPersonne = "" Then
    txtPersonne.ForeColor = &H80000008
  Else
    txtPersonne.ForeColor = &HFF&
  End If
End Sub

Private Sub txtUnit�_LostFocus()
  If bCheckUnit�(False) Or txtUnit� = "" Then
    txtUnit�.ForeColor = &H80000008
  Else
    txtUnit�.ForeColor = &HFF&
  End If
End Sub

Private Sub txtR�f�rence_LostFocus()
  If bCheckR�f�rence(False) Or txtR�f�rence = "" Then
    txtR�f�rence.ForeColor = &H80000008
  Else
    txtR�f�rence.ForeColor = &HFF&
  End If
  bDansR�f�rence = False
  
  ' Si on avait du travail en instance, on le lance
  If Not btnNext Is Nothing Then
    btnNext = 1
    Set btnNext = Nothing
  End If
End Sub


Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag

  On Error GoTo FinGotFocus
  ActiveControl.SelStart = 0
  ActiveControl.SelLength = 100
  
FinGotFocus:
End Sub

Private Sub txtNumEtb_GotFocus()
  bDansNumEtb = True
  GotFocus
End Sub

Private Sub txtR�f�rence_GotFocus()
  bDansR�f�rence = True
  GotFocus
End Sub

Private Sub txtDate_GotFocus(): GotFocus: End Sub
Private Sub txtLettres_GotFocus(): GotFocus: End Sub
Private Sub txtNomAssistant_GotFocus(): GotFocus: End Sub
Private Sub txtPr�fixe_GotFocus(): GotFocus: End Sub
Private Sub txtNomEtb_GotFocus(): GotFocus: End Sub
Private Sub txtNbAB_GotFocus(): GotFocus: End Sub
Private Sub txtNbEH_GotFocus(): GotFocus: End Sub
Private Sub txtNbBS_GotFocus(): GotFocus: End Sub
Private Sub txtNbLi_GotFocus(): GotFocus: End Sub
Private Sub txtNbFS_GotFocus(): GotFocus: End Sub
Private Sub txtNbHu_GotFocus(): GotFocus: End Sub
Private Sub txtNbCH_GotFocus(): GotFocus: End Sub
Private Sub txtNumEH_GotFocus(): GotFocus: End Sub
Private Sub txtDurEH_GotFocus(): GotFocus: End Sub
Private Sub txtRefCmdClient_GotFocus(): GotFocus: End Sub
Private Sub bckAFacturer_GotFocus(): GotFocus: End Sub
Private Sub bdcSecret_GotFocus(): GotFocus: End Sub
Private Sub bdcLabo_GotFocus(): GotFocus: End Sub
Private Sub txtComment_GotFocus(): GotFocus: End Sub
Private Sub txtPersonne_GotFocus(): GotFocus: End Sub
Private Sub txtNomPersonne_GotFocus(): GotFocus: End Sub
Private Sub txtUnit�_GotFocus(): GotFocus: End Sub
Private Sub txtNomUnit�_GotFocus(): GotFocus: End Sub
Private Sub txtHeureArriv�e_GotFocus(): GotFocus: End Sub
Private Sub txtHeureD�part_GotFocus(): GotFocus: End Sub
Private Sub bckAvisPassage_GotFocus(): GotFocus: End Sub
Private Sub bckFPStandard_GotFocus(): GotFocus: End Sub
Private Sub bdcTypePrestation_GotFocus(): GotFocus: End Sub
Private Sub bdcCodeActivit�_GotFocus(): GotFocus: End Sub
Private Sub txtCodeClient_GotFocus(): GotFocus: End Sub
Private Sub bdcD�coupage_GotFocus(): GotFocus: End Sub

Private Sub btnEtablissement_GotFocus(): GotFocus: End Sub
Private Sub btnUtilisateur_GotFocus(): GotFocus: End Sub
Private Sub btnUnit�_GotFocus(): GotFocus: End Sub

Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAjouter_GotFocus(): GotFocus: End Sub
Private Sub btnEffacer_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub


'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "AICaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  SetLib btnAjouter, "Caption", "AIbtnAjouter"
  SetLib btnEffacer, "Caption", "btnEffacer"
  
  SetLib lblDate, "Caption", "AIlblDate"
  SetLib lblLettres, "Caption", "AIlblLettres"
  
  SetLib lblEtablissement, "Caption", "AIlblEtablissement"
  SetLib txtNumetb, "Tag", "AItxtNumEtb.tag"
  SetLib btnEtablissement, "Tag", "AIbtnEtb.tag"
  SetLib btnEtablissement, "ToolTipText", "AIbtnEtb.tag"
  SetLib lblNbPrel, "Caption", "AIlblNbPrel"
    
  SetLib lblNbAB, "Caption", "AIlblNbAB"
  SetLib lblNbEH, "Caption", "AIlblNbEH"
  SetLib lblNbBS, "Caption", "AIlblNbBS"
  SetLib lblNbLi, "Caption", "AIlblNbLi"
  SetLib lblNbFS, "Caption", "AIlblNbFS"
  SetLib lblNbHu, "Caption", "AIlblNbHu"
  SetLib lblNbCh, "Caption", "AIlblNbCh"
  
  SetLib txtNbAB, "Tag", "AItxtNbAB.tag"
  SetLib txtNbEH, "Tag", "AItxtNbEH.tag"
  SetLib txtNbBS, "Tag", "AItxtNbBS.tag"
  SetLib txtNbLi, "Tag", "AItxtNbLi.tag"
  SetLib txtNbFS, "Tag", "AItxtNbFS.tag"
  SetLib txtNbHu, "Tag", "AItxtNbHu.tag"
  SetLib txtNbCh, "Tag", "AItxtNbCh.tag"
  
  SetLib lblNumEH, "Caption", "AIlblNumEH"
  SetLib lblDurEH, "Caption", "AIlblDurEH"
  SetLib txtNumEH, "Tag", "AItxtNumEH.tag"
  SetLib txtDurEH, "Tag", "AItxtDurEH.tag"
  
  SetLib lblR�f�rence, "Caption", "AIlblR�f�rence"
  SetLib txtR�f�rence, "Tag", "AItxtR�f�rence.tag"
  SetLib lblRefCmdClient, "Caption", "AIlblRefCC"
  SetLib txtRefCmdClient, "Tag", "AItxtRefCC.tag"
  SetLib lblAFacturer, "Caption", "AIlblAFacturer"
  SetLib bckAFacturer, "Tag", "AIbckAF.tag"
  
  SetLib lblCommentaire, "Caption", "AIlblCommentaire"
  SetLib txtComment, "Tag", "AItxtComment.tag"
  
  SetLib lblSecret, "Caption", "AIlblSecret"
  SetLib lblLabo, "Caption", "AIlblLabo"
  SetLib bdcSecret, "Tag", "AIbdcSecret.tag"
  SetLib bdcLabo, "Tag", "AIbdcLabo.tag"

  SetLib lblAvisPassage, "Caption", "AIlblAvisPassage"
  SetLib bckAvisPassage, "Tag", "AIbckAP.tag"
  SetLib lblFPStandard, "Caption", "AIlblFPStandard"
  SetLib bckFPStandard, "Tag", "AIbckFPS.tag"
  
  SetLib lblPersonne, "Caption", "AIlblPersonne"
  SetLib txtPersonne, "Tag", "AItxtPersonne.tag"
  SetLib btnUtilisateur, "Tag", "AIbtnUtilisateur.tag"
  SetLib btnUtilisateur, "ToolTipText", "AIbtnUtilisateur.tag"

  SetLib lblUnit�, "Caption", "AIlblUnit�"
  SetLib txtUnit�, "Tag", "AItxtUnit�.tag"
  SetLib btnUnit�, "Tag", "AIbtnUnit�.tag"
  SetLib btnUnit�, "ToolTipText", "AIbtnUnit�.tag"
  
  SetLib lblHeure, "Caption", "AIlblHeure"
  SetLib lblArriv�e, "Caption", "AIlblArriv�e"
  SetLib txtHeureArriv�e, "Tag", "AItxtHA.tag"
  SetLib lblD�part, "Caption", "AIlblD�part"
  SetLib txtHeureD�part, "Tag", "AItxtHD.tag"

  SetLib fraInfosConsultants, "Caption", "AIfraIC"
  SetLib lblTypePrestation, "Caption", "AIlblTP"
  SetLib bdcTypePrestation, "Tag", "AIbdcTP.tag"
  SetLib lblCodeActivit�, "Caption", "AIlblCA"
  SetLib bdcCodeActivit�, "Tag", "AIbdcCA.tag"
  SetLib lblCodeClient, "Caption", "AIlblCodeClient"
  SetLib txtCodeClient, "Tag", "AItxtCC.tag"
  
  ' Champs date
  txtDate.SaisieAssist�e = sAttente & "=" & dAttente
End Sub

