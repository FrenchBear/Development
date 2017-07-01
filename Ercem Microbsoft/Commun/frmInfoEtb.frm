VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "MSWLESS.OCX"
Begin VB.Form frmZoomEtb 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Informations établissement"
   ClientHeight    =   7215
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9135
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmInfoEtb.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7215
   ScaleWidth      =   9135
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin Plannings.BDCheck bckAvisPassage 
      Height          =   285
      Left            =   8820
      TabIndex        =   26
      Top             =   4320
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   503
      BackColor       =   -2147483633
      ForeColor       =   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Locked          =   -1  'True
   End
   Begin Plannings.BDCombo bdcLabo 
      Height          =   330
      Left            =   6480
      TabIndex        =   24
      Tag             =   "Entrez ou sélectionnez le labo gérant l'échantillon"
      Top             =   3600
      Width           =   2610
      _ExtentX        =   4604
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
   End
   Begin Plannings.BDCombo bdcNiveauIntervenant 
      Height          =   330
      Left            =   1920
      TabIndex        =   25
      Tag             =   "Entrez ou sélectionnez le labo gérant l'échantillon"
      Top             =   3600
      Width           =   3630
      _ExtentX        =   6403
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
   End
   Begin Plannings.BDCombo bdcLangueEH 
      Height          =   330
      Index           =   1
      Left            =   3300
      TabIndex        =   33
      Tag             =   "Entrez ou sélectionnez le labo gérant l'échantillon"
      Top             =   3960
      Width           =   2250
      _ExtentX        =   3969
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
   End
   Begin Plannings.BDCombo bdcLangueEH 
      Height          =   330
      Index           =   2
      Left            =   3300
      TabIndex        =   40
      Tag             =   "Entrez ou sélectionnez le labo gérant l'échantillon"
      Top             =   4320
      Width           =   2250
      _ExtentX        =   3969
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
   End
   Begin Plannings.BDCombo bdcLangueEH 
      Height          =   330
      Index           =   3
      Left            =   3300
      TabIndex        =   47
      Tag             =   "Entrez ou sélectionnez le labo gérant l'échantillon"
      Top             =   4680
      Width           =   2250
      _ExtentX        =   3969
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
   End
   Begin Plannings.BDCombo bdcLangueEH 
      Height          =   330
      Index           =   4
      Left            =   3300
      TabIndex        =   54
      Tag             =   "Entrez ou sélectionnez le labo gérant l'échantillon"
      Top             =   5040
      Width           =   2250
      _ExtentX        =   3969
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
   End
   Begin Plannings.BDCheck bckStrict 
      Height          =   285
      Left            =   8820
      TabIndex        =   59
      Top             =   3960
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   503
      BackColor       =   -2147483633
      ForeColor       =   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Locked          =   -1  'True
   End
   Begin Plannings.BDCombo bdcDécoupage 
      Height          =   330
      Left            =   1920
      TabIndex        =   62
      Tag             =   "Règles de découpage du dossier à l'édition et en facturation"
      Top             =   5760
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
      BackColor       =   -2147483633
   End
   Begin Plannings.BDCombo bdcFacNCP 
      Height          =   330
      Left            =   1920
      TabIndex        =   65
      Tag             =   "Définit le mode de calcul des prix pour cette intervention"
      Top             =   6480
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
      BackColor       =   -2147483633
   End
   Begin Plannings.BDCombo bdcFacNDP 
      Height          =   330
      Left            =   1920
      TabIndex        =   66
      Tag             =   "Définit le niveau de détail de la facture pour cette intervention"
      Top             =   6840
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
      BackColor       =   -2147483633
   End
   Begin Plannings.BDCombo bdcFact 
      Height          =   330
      Left            =   1920
      TabIndex        =   68
      Tag             =   "Règles de découpage du dossier à l'édition et en facturation"
      Top             =   6120
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
      BackColor       =   -2147483633
   End
   Begin Plannings.BDCheck bckFPStandard 
      Height          =   285
      Left            =   8820
      TabIndex        =   28
      Top             =   4680
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   503
      BackColor       =   -2147483633
      ForeColor       =   -2147483630
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Locked          =   -1  'True
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "FP standard :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   27
      Left            =   7380
      TabIndex        =   27
      Top             =   4740
      Width           =   1275
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Facturation :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   17
      Left            =   60
      TabIndex        =   67
      Top             =   6180
      Width           =   1200
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Niveau calcul :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   100
      Left            =   60
      TabIndex        =   64
      Top             =   6540
      Width           =   1350
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Détail présent. :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   101
      Left            =   60
      TabIndex        =   63
      Top             =   6900
      Width           =   1530
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Découpage :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   119
      Left            =   60
      TabIndex        =   61
      Top             =   5820
      Width           =   1200
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Strict :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   16
      Left            =   8040
      TabIndex        =   60
      Top             =   4020
      Width           =   615
   End
   Begin MSWLess.WLText txtTypeEH 
      DataField       =   "etb_tel"
      Height          =   315
      Left            =   1920
      TabIndex        =   58
      Top             =   5400
      Width           =   7155
      _ExtentX        =   12621
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Autres EH :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   15
      Left            =   60
      TabIndex        =   57
      Top             =   5460
      Width           =   1065
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "min"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   26
      Left            =   6420
      TabIndex        =   56
      Top             =   5100
      Width           =   330
   End
   Begin MSWLess.WLText txtDurée 
      DataField       =   "etb_tel"
      Height          =   315
      Index           =   4
      Left            =   5760
      TabIndex        =   55
      Top             =   5040
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "/"
      Height          =   240
      Index           =   25
      Left            =   2580
      TabIndex        =   53
      Top             =   5100
      Width           =   90
   End
   Begin MSWLess.WLText txtGrille 
      DataField       =   "etb_tel"
      Height          =   315
      Index           =   4
      Left            =   1920
      TabIndex        =   52
      Top             =   5040
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSWLess.WLText txtScénario 
      Height          =   315
      Index           =   4
      Left            =   2700
      TabIndex        =   51
      Top             =   5040
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "EH 4:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   24
      Left            =   60
      TabIndex        =   50
      Top             =   5100
      Width           =   510
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "min"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   23
      Left            =   6420
      TabIndex        =   49
      Top             =   4740
      Width           =   330
   End
   Begin MSWLess.WLText txtDurée 
      DataField       =   "etb_tel"
      Height          =   315
      Index           =   3
      Left            =   5760
      TabIndex        =   48
      Top             =   4680
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "/"
      Height          =   240
      Index           =   22
      Left            =   2580
      TabIndex        =   46
      Top             =   4740
      Width           =   90
   End
   Begin MSWLess.WLText txtGrille 
      DataField       =   "etb_tel"
      Height          =   315
      Index           =   3
      Left            =   1920
      TabIndex        =   45
      Top             =   4680
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSWLess.WLText txtScénario 
      Height          =   315
      Index           =   3
      Left            =   2700
      TabIndex        =   44
      Top             =   4680
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "EH 3:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   21
      Left            =   60
      TabIndex        =   43
      Top             =   4740
      Width           =   510
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "min"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   20
      Left            =   6420
      TabIndex        =   42
      Top             =   4380
      Width           =   330
   End
   Begin MSWLess.WLText txtDurée 
      DataField       =   "etb_tel"
      Height          =   315
      Index           =   2
      Left            =   5760
      TabIndex        =   41
      Top             =   4320
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "/"
      Height          =   240
      Index           =   19
      Left            =   2580
      TabIndex        =   39
      Top             =   4380
      Width           =   90
   End
   Begin MSWLess.WLText txtGrille 
      DataField       =   "etb_tel"
      Height          =   315
      Index           =   2
      Left            =   1920
      TabIndex        =   38
      Top             =   4320
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSWLess.WLText txtScénario 
      Height          =   315
      Index           =   2
      Left            =   2700
      TabIndex        =   37
      Top             =   4320
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "EH 2:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   18
      Left            =   60
      TabIndex        =   36
      Top             =   4380
      Width           =   510
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "min"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   14
      Left            =   6420
      TabIndex        =   35
      Top             =   4020
      Width           =   330
   End
   Begin MSWLess.WLText txtDurée 
      DataField       =   "etb_tel"
      Height          =   315
      Index           =   1
      Left            =   5760
      TabIndex        =   34
      Top             =   3960
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "/"
      Height          =   240
      Index           =   13
      Left            =   2580
      TabIndex        =   32
      Top             =   4020
      Width           =   90
   End
   Begin MSWLess.WLText txtGrille 
      DataField       =   "etb_tel"
      Height          =   315
      Index           =   1
      Left            =   1920
      TabIndex        =   31
      Top             =   3960
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSWLess.WLText txtScénario 
      Height          =   315
      Index           =   1
      Left            =   2700
      TabIndex        =   30
      Top             =   3960
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "EH 1:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   29
      Top             =   4020
      Width           =   510
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Avis de passage :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   11
      Left            =   6975
      TabIndex        =   23
      Top             =   4380
      Width           =   1680
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Labo :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   10
      Left            =   5760
      TabIndex        =   22
      Top             =   3660
      Width           =   600
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Niveau interv. :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   9
      Left            =   60
      TabIndex        =   21
      Top             =   3660
      Width           =   1440
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Feuille de route :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   20
      Top             =   3000
      Width           =   1605
   End
   Begin MSWLess.WLText txtFDR 
      DataField       =   "etb_tel"
      Height          =   615
      Left            =   1920
      TabIndex        =   19
      Top             =   2940
      Width           =   7155
      _ExtentX        =   12621
      _ExtentY        =   1085
      _Version        =   393216
      MultiLine       =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Contraintes :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   18
      Top             =   2640
      Width           =   1245
   End
   Begin MSWLess.WLText txtContraintes 
      DataField       =   "etb_tel"
      Height          =   315
      Left            =   1920
      TabIndex        =   17
      Top             =   2580
      Width           =   7155
      _ExtentX        =   12621
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Prest :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   16
      Top             =   2280
      Width           =   630
   End
   Begin MSWLess.WLText txtPrest 
      DataField       =   "etb_tel"
      Height          =   315
      Left            =   1920
      TabIndex        =   15
      Top             =   2220
      Width           =   4155
      _ExtentX        =   7329
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSWLess.WLText txtNom 
      Height          =   315
      Left            =   3420
      TabIndex        =   14
      Top             =   420
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtPréfixe 
      Height          =   315
      Left            =   1920
      TabIndex        =   13
      Top             =   420
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtBDist 
      Height          =   315
      Left            =   2760
      TabIndex        =   12
      Top             =   1500
      Width           =   6315
      _ExtentX        =   11139
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtNumetb 
      Height          =   315
      Left            =   1920
      TabIndex        =   11
      Top             =   60
      Width           =   795
      _ExtentX        =   1402
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Préfixe / Nom :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   10
      Top             =   480
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "N° :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   9
      Top             =   120
      Width           =   375
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Localité :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   8
      Left            =   60
      TabIndex        =   8
      Top             =   1200
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Tel / Fax :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   7
      Top             =   1920
      Width           =   930
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "CPost / BD :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   6
      Top             =   1560
      Width           =   1140
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Rue :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   5
      Top             =   840
      Width           =   495
   End
   Begin MSWLess.WLText txtCPost 
      Height          =   315
      Left            =   1920
      TabIndex        =   4
      Top             =   1500
      Width           =   795
      _ExtentX        =   1402
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtFax 
      Height          =   315
      Left            =   4020
      TabIndex        =   3
      Top             =   1860
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSWLess.WLText txtTel 
      DataField       =   "etb_tel"
      Height          =   315
      Left            =   1920
      TabIndex        =   2
      Top             =   1860
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSWLess.WLText txtLoc 
      Height          =   315
      Left            =   1920
      TabIndex        =   1
      Top             =   1140
      Width           =   7155
      _ExtentX        =   12621
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSWLess.WLText txtRue 
      DataField       =   "etb_rue"
      Height          =   315
      Left            =   1920
      TabIndex        =   0
      Top             =   780
      Width           =   7155
      _ExtentX        =   12621
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "frmZoomEtb"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmZoomEtb
' Affiche des infos sur un établissement
' 29/09/2000 PV


Option Explicit


Public Sub ShowInfo(sNumetb As String)
  Dim e As Etablissement
  Set e = LireEtablissement(sNumetb, True)
  
  If e Is Nothing Then
    MsgBox "Etablissement inexistant"
    Exit Sub
  End If
  
  txtNumetb = sNumetb
  txtPréfixe = e.etb_prefixe
  txtNom = e.etb_nom
  txtRue = e.etb_rue
  txtLoc = e.etb_loc
  txtCPost = e.etb_cpost
  txtBDist = e.etb_bdist
  
  txtTel = e.etb_tel
  txtFax = e.etb_fax
  
  txtPrest = e.etb_prest
  txtContraintes = e.etb_contraintes
  txtFDR = e.etb_fdr
  bdcNiveauIntervenant = NV(e.etb_niveauinterv)
  bdcLabo = e.etb_labo
  bckAvisPassage = e.etb_avispassage
  bckFPStandard = e.etb_fpstandard
  
  bdcDécoupage = e.etb_decoupage
  bdcFact = e.etb_fact
  bdcFacNCP = e.etb_facncp
  bdcFacNDP = e.etb_facndp
  
  bckStrict = e.etb_gestrict
  txtGrille(1) = NV(e.etb_typeh1)
  txtScénario(1) = NV(e.etb_sceeh1)
  bdcLangueEH(1) = e.etb_langeh1
  txtDurée(1) = NV(e.etb_dureh1)
  
  txtGrille(2) = NV(e.etb_typeh2)
  txtScénario(2) = NV(e.etb_sceeh2)
  bdcLangueEH(2) = e.etb_langeh2
  txtDurée(2) = NV(e.etb_dureh2)
  
  txtGrille(3) = NV(e.etb_typeh3)
  txtScénario(3) = NV(e.etb_sceeh3)
  bdcLangueEH(3) = e.etb_langeh3
  txtDurée(3) = NV(e.etb_dureh3)
  
  txtGrille(4) = NV(e.etb_typeh4)
  txtScénario(4) = NV(e.etb_sceeh4)
  bdcLangueEH(4) = e.etb_langeh4
  txtDurée(4) = NV(e.etb_dureh4)
  
  txtTypeEH = e.etb_typeeh
  
  Show vbModal
End Sub


Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyEscape Then Unload Me
End Sub


Private Sub Form_Load()
  ' On remplit les combos
  RemplitBDC bdcNiveauIntervenant, "niveauinterv"
  RemplitBDC bdcLabo, "labo"
  RemplitBDC bdcDécoupage, "decoupage"
  RemplitBDC bdcFact, "fact"
  RemplitBDC bdcFacNCP, "facncp"
  RemplitBDC bdcFacNDP, "facndp"

  Dim i As Integer
  For i = 1 To 4
    RemplitBDC bdcLangueEH(i), "langue"
  Next
  
End Sub

