VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "MSWLESS.OCX"
Begin VB.Form frmDTour 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Fiches tournée (corps)"
   ClientHeight    =   6675
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   11760
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmDTour.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   445
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   784
   Tag             =   "Données"
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   9420
      Top             =   480
   End
   Begin FichesTournée.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   160
      Top             =   0
      Width           =   11760
      _ExtentX        =   20743
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_212"
      Height          =   315
      Index           =   126
      Left            =   11220
      TabIndex        =   51
      Top             =   3000
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_211"
      Height          =   315
      Index           =   125
      Left            =   10620
      TabIndex        =   50
      Top             =   3000
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_210"
      Height          =   315
      Index           =   124
      Left            =   10020
      TabIndex        =   49
      Top             =   3000
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_209"
      Height          =   315
      Index           =   123
      Left            =   9420
      TabIndex        =   48
      Top             =   3000
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_208"
      Height          =   315
      Index           =   122
      Left            =   8820
      TabIndex        =   47
      Top             =   3000
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_207"
      Height          =   315
      Index           =   121
      Left            =   8220
      TabIndex        =   46
      Top             =   3000
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_206"
      Height          =   315
      Index           =   120
      Left            =   7620
      TabIndex        =   45
      Top             =   3000
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_205"
      Height          =   315
      Index           =   119
      Left            =   7020
      TabIndex        =   44
      Top             =   3000
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_204"
      Height          =   315
      Index           =   118
      Left            =   6420
      TabIndex        =   43
      Top             =   3000
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_203"
      Height          =   315
      Index           =   117
      Left            =   5820
      TabIndex        =   42
      Top             =   3000
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_202"
      Height          =   315
      Index           =   116
      Left            =   5220
      TabIndex        =   41
      Top             =   3000
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_201"
      Height          =   315
      Index           =   115
      Left            =   4620
      TabIndex        =   40
      Top             =   3000
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Dur"
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
      Index           =   7
      Left            =   4200
      TabIndex        =   78
      Top             =   4140
      Width           =   360
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Sc"
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
      Left            =   4320
      TabIndex        =   65
      Top             =   3780
      Width           =   240
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Gr"
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
      Left            =   4320
      TabIndex        =   52
      Top             =   3420
      Width           =   240
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_201d"
      Height          =   315
      Index           =   114
      Left            =   4620
      TabIndex        =   79
      Top             =   4080
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_202d"
      Height          =   315
      Index           =   113
      Left            =   5220
      TabIndex        =   80
      Top             =   4080
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_203d"
      Height          =   315
      Index           =   112
      Left            =   5820
      TabIndex        =   81
      Top             =   4080
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_204d"
      Height          =   315
      Index           =   111
      Left            =   6420
      TabIndex        =   82
      Top             =   4080
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_205d"
      Height          =   315
      Index           =   110
      Left            =   7020
      TabIndex        =   83
      Top             =   4080
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_206d"
      Height          =   315
      Index           =   109
      Left            =   7620
      TabIndex        =   84
      Top             =   4080
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_207d"
      Height          =   315
      Index           =   108
      Left            =   8220
      TabIndex        =   85
      Top             =   4080
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_208d"
      Height          =   315
      Index           =   107
      Left            =   8820
      TabIndex        =   86
      Top             =   4080
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_209d"
      Height          =   315
      Index           =   106
      Left            =   9420
      TabIndex        =   87
      Top             =   4080
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_210d"
      Height          =   315
      Index           =   105
      Left            =   10020
      TabIndex        =   88
      Top             =   4080
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_211d"
      Height          =   315
      Index           =   104
      Left            =   10620
      TabIndex        =   89
      Top             =   4080
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_212d"
      Height          =   315
      Index           =   103
      Left            =   11220
      TabIndex        =   90
      Top             =   4080
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_201s"
      Height          =   315
      Index           =   102
      Left            =   4620
      TabIndex        =   66
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_202s"
      Height          =   315
      Index           =   100
      Left            =   5220
      TabIndex        =   67
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_203s"
      Height          =   315
      Index           =   98
      Left            =   5820
      TabIndex        =   68
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_204s"
      Height          =   315
      Index           =   96
      Left            =   6420
      TabIndex        =   69
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_205s"
      Height          =   315
      Index           =   94
      Left            =   7020
      TabIndex        =   70
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_206s"
      Height          =   315
      Index           =   92
      Left            =   7620
      TabIndex        =   71
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_207s"
      Height          =   315
      Index           =   90
      Left            =   8220
      TabIndex        =   72
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_208s"
      Height          =   315
      Index           =   88
      Left            =   8820
      TabIndex        =   73
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_209s"
      Height          =   315
      Index           =   86
      Left            =   9420
      TabIndex        =   74
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_210s"
      Height          =   315
      Index           =   84
      Left            =   10020
      TabIndex        =   75
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_211s"
      Height          =   315
      Index           =   82
      Left            =   10620
      TabIndex        =   76
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_212s"
      Height          =   315
      Index           =   80
      Left            =   11220
      TabIndex        =   77
      Top             =   3720
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_index"
      Height          =   315
      Index           =   78
      Left            =   1620
      TabIndex        =   5
      Top             =   840
      Width           =   615
      _ExtentX        =   1085
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtContraintes 
      Height          =   315
      Left            =   4020
      TabIndex        =   185
      TabStop         =   0   'False
      Top             =   1560
      Width           =   4875
      _ExtentX        =   8599
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   41
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtNbrAn 
      Height          =   315
      Left            =   540
      TabIndex        =   181
      TabStop         =   0   'False
      Top             =   2640
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
   Begin MSWLess.WLText txtFreqAn 
      Height          =   315
      Left            =   1320
      TabIndex        =   180
      TabStop         =   0   'False
      Top             =   2640
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
   Begin MSWLess.WLText txtNbrBS 
      Height          =   315
      Left            =   540
      TabIndex        =   179
      TabStop         =   0   'False
      Top             =   4440
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
   Begin MSWLess.WLText txtFreqBS 
      Height          =   315
      Left            =   1320
      TabIndex        =   178
      TabStop         =   0   'False
      Top             =   4440
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
   Begin MSWLess.WLText txtNbrLis 
      Height          =   315
      Left            =   540
      TabIndex        =   177
      TabStop         =   0   'False
      Top             =   4800
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
   Begin MSWLess.WLText txtFreqLis 
      Height          =   315
      Left            =   1320
      TabIndex        =   176
      TabStop         =   0   'False
      Top             =   4800
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
   Begin MSWLess.WLText txtNbrFS 
      Height          =   315
      Left            =   540
      TabIndex        =   175
      TabStop         =   0   'False
      Top             =   5160
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
   Begin MSWLess.WLText txtFreqFS 
      Height          =   315
      Left            =   1320
      TabIndex        =   174
      TabStop         =   0   'False
      Top             =   5160
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
   Begin MSWLess.WLText txtNbrHuiles 
      Height          =   315
      Left            =   540
      TabIndex        =   173
      TabStop         =   0   'False
      Top             =   5520
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
   Begin MSWLess.WLText txtFreqHuiles 
      Height          =   315
      Left            =   1320
      TabIndex        =   172
      TabStop         =   0   'False
      Top             =   5520
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
   Begin MSWLess.WLText txtNbrCh 
      Height          =   315
      Left            =   540
      TabIndex        =   171
      TabStop         =   0   'False
      Top             =   5880
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
   Begin MSWLess.WLText txtFreqCh 
      Height          =   315
      Left            =   1320
      TabIndex        =   170
      TabStop         =   0   'False
      Top             =   5880
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
   Begin MSWLess.WLText txtNbrEH 
      Height          =   315
      Left            =   540
      TabIndex        =   169
      TabStop         =   0   'False
      Top             =   3000
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
   Begin MSWLess.WLText txtFreqEH 
      Height          =   315
      Left            =   1320
      TabIndex        =   168
      TabStop         =   0   'False
      Top             =   3000
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
   Begin MSWLess.WLText txtPrestAn 
      Height          =   315
      Left            =   2100
      TabIndex        =   167
      TabStop         =   0   'False
      Top             =   2640
      Width           =   2250
      _ExtentX        =   3969
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtPrestBS 
      Height          =   315
      Left            =   2100
      TabIndex        =   166
      TabStop         =   0   'False
      Top             =   4440
      Width           =   2250
      _ExtentX        =   3969
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtPrestLis 
      Height          =   315
      Left            =   2100
      TabIndex        =   165
      TabStop         =   0   'False
      Top             =   4800
      Width           =   2250
      _ExtentX        =   3969
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtPrestFS 
      Height          =   315
      Left            =   2100
      TabIndex        =   164
      TabStop         =   0   'False
      Top             =   5160
      Width           =   2250
      _ExtentX        =   3969
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtPrestHuiles 
      Height          =   315
      Left            =   2100
      TabIndex        =   163
      TabStop         =   0   'False
      Top             =   5520
      Width           =   2250
      _ExtentX        =   3969
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtPrestCh 
      Height          =   315
      Left            =   2100
      TabIndex        =   162
      TabStop         =   0   'False
      Top             =   5880
      Width           =   2250
      _ExtentX        =   3969
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtPrestEH 
      Height          =   315
      Left            =   2100
      TabIndex        =   161
      TabStop         =   0   'False
      Top             =   3000
      Width           =   2250
      _ExtentX        =   3969
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_701"
      Height          =   315
      Index           =   101
      Left            =   4620
      TabIndex        =   144
      Top             =   5880
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_702"
      Height          =   315
      Index           =   99
      Left            =   5220
      TabIndex        =   145
      Top             =   5880
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_703"
      Height          =   315
      Index           =   97
      Left            =   5820
      TabIndex        =   146
      Top             =   5880
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_704"
      Height          =   315
      Index           =   95
      Left            =   6420
      TabIndex        =   147
      Top             =   5880
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_705"
      Height          =   315
      Index           =   93
      Left            =   7020
      TabIndex        =   148
      Top             =   5880
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_706"
      Height          =   315
      Index           =   91
      Left            =   7620
      TabIndex        =   149
      Top             =   5880
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_707"
      Height          =   315
      Index           =   89
      Left            =   8220
      TabIndex        =   150
      Top             =   5880
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_708"
      Height          =   315
      Index           =   87
      Left            =   8820
      TabIndex        =   151
      Top             =   5880
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_709"
      Height          =   315
      Index           =   85
      Left            =   9420
      TabIndex        =   152
      Top             =   5880
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_710"
      Height          =   315
      Index           =   83
      Left            =   10020
      TabIndex        =   153
      Top             =   5880
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_711"
      Height          =   315
      Index           =   81
      Left            =   10620
      TabIndex        =   154
      Top             =   5880
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_712"
      Height          =   315
      Index           =   79
      Left            =   11220
      TabIndex        =   155
      Top             =   5880
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_501"
      Height          =   315
      Index           =   77
      Left            =   4620
      TabIndex        =   118
      Top             =   5160
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_601"
      Height          =   315
      Index           =   76
      Left            =   4620
      TabIndex        =   131
      Top             =   5520
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_502"
      Height          =   315
      Index           =   75
      Left            =   5220
      TabIndex        =   119
      Top             =   5160
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_602"
      Height          =   315
      Index           =   74
      Left            =   5220
      TabIndex        =   132
      Top             =   5520
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_503"
      Height          =   315
      Index           =   73
      Left            =   5820
      TabIndex        =   120
      Top             =   5160
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_603"
      Height          =   315
      Index           =   72
      Left            =   5820
      TabIndex        =   133
      Top             =   5520
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_504"
      Height          =   315
      Index           =   71
      Left            =   6420
      TabIndex        =   121
      Top             =   5160
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_604"
      Height          =   315
      Index           =   70
      Left            =   6420
      TabIndex        =   134
      Top             =   5520
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_505"
      Height          =   315
      Index           =   69
      Left            =   7020
      TabIndex        =   122
      Top             =   5160
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_605"
      Height          =   315
      Index           =   68
      Left            =   7020
      TabIndex        =   135
      Top             =   5520
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_506"
      Height          =   315
      Index           =   67
      Left            =   7620
      TabIndex        =   123
      Top             =   5160
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_606"
      Height          =   315
      Index           =   66
      Left            =   7620
      TabIndex        =   136
      Top             =   5520
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_507"
      Height          =   315
      Index           =   65
      Left            =   8220
      TabIndex        =   124
      Top             =   5160
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_607"
      Height          =   315
      Index           =   64
      Left            =   8220
      TabIndex        =   137
      Top             =   5520
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_508"
      Height          =   315
      Index           =   63
      Left            =   8820
      TabIndex        =   125
      Top             =   5160
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_608"
      Height          =   315
      Index           =   62
      Left            =   8820
      TabIndex        =   138
      Top             =   5520
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_509"
      Height          =   315
      Index           =   61
      Left            =   9420
      TabIndex        =   126
      Top             =   5160
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_609"
      Height          =   315
      Index           =   60
      Left            =   9420
      TabIndex        =   139
      Top             =   5520
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_510"
      Height          =   315
      Index           =   59
      Left            =   10020
      TabIndex        =   127
      Top             =   5160
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_610"
      Height          =   315
      Index           =   58
      Left            =   10020
      TabIndex        =   140
      Top             =   5520
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_511"
      Height          =   315
      Index           =   57
      Left            =   10620
      TabIndex        =   128
      Top             =   5160
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_611"
      Height          =   315
      Index           =   56
      Left            =   10620
      TabIndex        =   141
      Top             =   5520
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_512"
      Height          =   315
      Index           =   55
      Left            =   11220
      TabIndex        =   129
      Top             =   5160
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_612"
      Height          =   315
      Index           =   54
      Left            =   11220
      TabIndex        =   142
      Top             =   5520
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_301"
      Height          =   315
      Index           =   53
      Left            =   4620
      TabIndex        =   92
      Top             =   4440
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_401"
      Height          =   315
      Index           =   52
      Left            =   4620
      TabIndex        =   105
      Top             =   4800
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_302"
      Height          =   315
      Index           =   51
      Left            =   5220
      TabIndex        =   93
      Top             =   4440
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_402"
      Height          =   315
      Index           =   50
      Left            =   5220
      TabIndex        =   106
      Top             =   4800
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_303"
      Height          =   315
      Index           =   49
      Left            =   5820
      TabIndex        =   94
      Top             =   4440
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_403"
      Height          =   315
      Index           =   48
      Left            =   5820
      TabIndex        =   107
      Top             =   4800
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_304"
      Height          =   315
      Index           =   47
      Left            =   6420
      TabIndex        =   95
      Top             =   4440
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_404"
      Height          =   315
      Index           =   46
      Left            =   6420
      TabIndex        =   108
      Top             =   4800
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_305"
      Height          =   315
      Index           =   45
      Left            =   7020
      TabIndex        =   96
      Top             =   4440
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_405"
      Height          =   315
      Index           =   44
      Left            =   7020
      TabIndex        =   109
      Top             =   4800
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_306"
      Height          =   315
      Index           =   43
      Left            =   7620
      TabIndex        =   97
      Top             =   4440
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_406"
      Height          =   315
      Index           =   42
      Left            =   7620
      TabIndex        =   110
      Top             =   4800
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_307"
      Height          =   315
      Index           =   41
      Left            =   8220
      TabIndex        =   98
      Top             =   4440
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_407"
      Height          =   315
      Index           =   40
      Left            =   8220
      TabIndex        =   111
      Top             =   4800
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_308"
      Height          =   315
      Index           =   39
      Left            =   8820
      TabIndex        =   99
      Top             =   4440
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_408"
      Height          =   315
      Index           =   38
      Left            =   8820
      TabIndex        =   112
      Top             =   4800
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_309"
      Height          =   315
      Index           =   37
      Left            =   9420
      TabIndex        =   100
      Top             =   4440
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_409"
      Height          =   315
      Index           =   36
      Left            =   9420
      TabIndex        =   113
      Top             =   4800
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_310"
      Height          =   315
      Index           =   35
      Left            =   10020
      TabIndex        =   101
      Top             =   4440
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_410"
      Height          =   315
      Index           =   34
      Left            =   10020
      TabIndex        =   114
      Top             =   4800
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_311"
      Height          =   315
      Index           =   33
      Left            =   10620
      TabIndex        =   102
      Top             =   4440
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_411"
      Height          =   315
      Index           =   5
      Left            =   10620
      TabIndex        =   115
      Top             =   4800
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_312"
      Height          =   315
      Index           =   4
      Left            =   11220
      TabIndex        =   103
      Top             =   4440
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_412"
      Height          =   315
      Index           =   2
      Left            =   11220
      TabIndex        =   116
      Top             =   4800
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_variocolor"
      Height          =   315
      Index           =   1
      Left            =   1620
      TabIndex        =   11
      Top             =   1560
      Width           =   855
      _ExtentX        =   1508
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtTournée 
      Height          =   315
      Left            =   2520
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   840
      Width           =   6375
      _ExtentX        =   11245
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   65
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtRégion 
      Height          =   315
      Left            =   2520
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   480
      Width           =   6375
      _ExtentX        =   11245
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   65
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_212g"
      Height          =   315
      Index           =   32
      Left            =   11220
      TabIndex        =   64
      Top             =   3360
      Width           =   525
      _ExtentX        =   926
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   4
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_112"
      Height          =   315
      Index           =   31
      Left            =   11220
      TabIndex        =   38
      Top             =   2640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_211g"
      Height          =   315
      Index           =   30
      Left            =   10620
      TabIndex        =   63
      Top             =   3360
      Width           =   525
      _ExtentX        =   926
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   4
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_111"
      Height          =   315
      Index           =   29
      Left            =   10620
      TabIndex        =   37
      Top             =   2640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_210g"
      Height          =   315
      Index           =   28
      Left            =   10020
      TabIndex        =   62
      Top             =   3360
      Width           =   525
      _ExtentX        =   926
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   4
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_110"
      Height          =   315
      Index           =   27
      Left            =   10020
      TabIndex        =   36
      Top             =   2640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_209g"
      Height          =   315
      Index           =   26
      Left            =   9420
      TabIndex        =   61
      Top             =   3360
      Width           =   525
      _ExtentX        =   926
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   4
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_109"
      Height          =   315
      Index           =   25
      Left            =   9420
      TabIndex        =   35
      Top             =   2640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_208g"
      Height          =   315
      Index           =   24
      Left            =   8820
      TabIndex        =   60
      Top             =   3360
      Width           =   525
      _ExtentX        =   926
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   4
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_108"
      Height          =   315
      Index           =   23
      Left            =   8820
      TabIndex        =   34
      Top             =   2640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_207g"
      Height          =   315
      Index           =   22
      Left            =   8220
      TabIndex        =   59
      Top             =   3360
      Width           =   525
      _ExtentX        =   926
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   4
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_107"
      Height          =   315
      Index           =   21
      Left            =   8220
      TabIndex        =   33
      Top             =   2640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_206g"
      Height          =   315
      Index           =   20
      Left            =   7620
      TabIndex        =   58
      Top             =   3360
      Width           =   525
      _ExtentX        =   926
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   4
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_106"
      Height          =   315
      Index           =   19
      Left            =   7620
      TabIndex        =   32
      Top             =   2640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_205g"
      Height          =   315
      Index           =   18
      Left            =   7020
      TabIndex        =   57
      Top             =   3360
      Width           =   525
      _ExtentX        =   926
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   4
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_105"
      Height          =   315
      Index           =   17
      Left            =   7020
      TabIndex        =   31
      Top             =   2640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_204g"
      Height          =   315
      Index           =   16
      Left            =   6420
      TabIndex        =   56
      Top             =   3360
      Width           =   525
      _ExtentX        =   926
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   4
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_104"
      Height          =   315
      Index           =   15
      Left            =   6420
      TabIndex        =   30
      Top             =   2640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_203g"
      Height          =   315
      Index           =   13
      Left            =   5820
      TabIndex        =   55
      Top             =   3360
      Width           =   525
      _ExtentX        =   926
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   4
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_103"
      Height          =   315
      Index           =   11
      Left            =   5820
      TabIndex        =   29
      Top             =   2640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_202g"
      Height          =   315
      Index           =   10
      Left            =   5220
      TabIndex        =   54
      Top             =   3360
      Width           =   525
      _ExtentX        =   926
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   4
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_102"
      Height          =   315
      Index           =   9
      Left            =   5220
      TabIndex        =   28
      Top             =   2640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_201g"
      Height          =   315
      Index           =   7
      Left            =   4620
      TabIndex        =   53
      Top             =   3360
      Width           =   525
      _ExtentX        =   926
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   4
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_101"
      Height          =   315
      Index           =   6
      Left            =   4620
      TabIndex        =   27
      Top             =   2640
      Width           =   495
      _ExtentX        =   873
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtNomEtb 
      Height          =   315
      Left            =   4020
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   1200
      Width           =   4875
      _ExtentX        =   8599
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   41
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtPréfixe 
      Height          =   315
      Left            =   2520
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   1200
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   556
      _Version        =   393216
      Locked          =   -1  'True
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*^dt_numetb"
      Height          =   315
      Index           =   3
      Left            =   1620
      TabIndex        =   7
      Top             =   1200
      Width           =   855
      _ExtentX        =   1508
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
      Left            =   7200
      TabIndex        =   159
      Top             =   6240
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
      DataField       =   "dt_idmodif"
      Height          =   315
      Index           =   12
      Left            =   1620
      TabIndex        =   157
      Top             =   6300
      Width           =   3750
      _ExtentX        =   6615
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "dt_comment"
      Height          =   315
      Index           =   8
      Left            =   1620
      TabIndex        =   13
      Top             =   1920
      Width           =   7275
      _ExtentX        =   12832
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   65
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*^dt_fiche"
      Height          =   315
      Index           =   0
      Left            =   1380
      TabIndex        =   1
      Top             =   480
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Index de tri :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   4
      Top             =   900
      Width           =   1230
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Contraintes :"
      Height          =   210
      Index           =   3
      Left            =   2580
      TabIndex        =   186
      Top             =   1620
      Width           =   1245
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "prestation"
      Height          =   255
      Index           =   14
      Left            =   2100
      TabIndex        =   184
      Top             =   2340
      Width           =   2235
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "freq"
      Height          =   255
      Index           =   13
      Left            =   1380
      TabIndex        =   183
      Top             =   2340
      Width           =   615
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "nbr"
      Height          =   255
      Index           =   12
      Left            =   600
      TabIndex        =   182
      Top             =   2340
      Width           =   615
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "AB :"
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
      Index           =   34
      Left            =   60
      TabIndex        =   26
      Top             =   2700
      Width           =   405
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "BS :"
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
      Index           =   35
      Left            =   60
      TabIndex        =   91
      Top             =   4500
      Width           =   405
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Li :"
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
      Index           =   36
      Left            =   60
      TabIndex        =   104
      Top             =   4860
      Width           =   315
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "FS :"
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
      Index           =   37
      Left            =   60
      TabIndex        =   117
      Top             =   5220
      Width           =   390
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Hu :"
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
      Index           =   38
      Left            =   60
      TabIndex        =   130
      Top             =   5580
      Width           =   405
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Ch :"
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
      Index           =   39
      Left            =   60
      TabIndex        =   143
      Top             =   5940
      Width           =   390
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "EH :"
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
      Index           =   40
      Left            =   60
      TabIndex        =   39
      Top             =   3060
      Width           =   405
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Variocolor :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   10
      Top             =   1620
      Width           =   1065
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "D"
      Height          =   255
      Index           =   11
      Left            =   11280
      TabIndex        =   25
      Top             =   2340
      Width           =   375
   End
   Begin VB.Line Line1 
      Index           =   10
      X1              =   744
      X2              =   744
      Y1              =   364
      Y2              =   180
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "N"
      Height          =   255
      Index           =   10
      Left            =   10680
      TabIndex        =   24
      Top             =   2340
      Width           =   375
   End
   Begin VB.Line Line1 
      Index           =   9
      X1              =   704
      X2              =   704
      Y1              =   364
      Y2              =   180
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "O"
      Height          =   255
      Index           =   9
      Left            =   10080
      TabIndex        =   23
      Top             =   2340
      Width           =   375
   End
   Begin VB.Line Line1 
      Index           =   8
      X1              =   664
      X2              =   664
      Y1              =   364
      Y2              =   180
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "S"
      Height          =   255
      Index           =   8
      Left            =   9480
      TabIndex        =   22
      Top             =   2340
      Width           =   375
   End
   Begin VB.Line Line1 
      Index           =   7
      X1              =   624
      X2              =   624
      Y1              =   364
      Y2              =   180
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "A"
      Height          =   255
      Index           =   7
      Left            =   8880
      TabIndex        =   21
      Top             =   2340
      Width           =   375
   End
   Begin VB.Line Line1 
      Index           =   6
      X1              =   584
      X2              =   584
      Y1              =   364
      Y2              =   180
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "J"
      Height          =   255
      Index           =   6
      Left            =   8280
      TabIndex        =   20
      Top             =   2340
      Width           =   375
   End
   Begin VB.Line Line1 
      Index           =   5
      X1              =   544
      X2              =   544
      Y1              =   364
      Y2              =   180
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "J"
      Height          =   255
      Index           =   5
      Left            =   7680
      TabIndex        =   19
      Top             =   2340
      Width           =   375
   End
   Begin VB.Line Line1 
      Index           =   4
      X1              =   504
      X2              =   504
      Y1              =   364
      Y2              =   180
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "M"
      Height          =   255
      Index           =   4
      Left            =   7080
      TabIndex        =   18
      Top             =   2340
      Width           =   375
   End
   Begin VB.Line Line1 
      Index           =   3
      X1              =   464
      X2              =   464
      Y1              =   364
      Y2              =   180
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "A"
      Height          =   255
      Index           =   3
      Left            =   6480
      TabIndex        =   17
      Top             =   2340
      Width           =   375
   End
   Begin VB.Line Line1 
      Index           =   2
      X1              =   424
      X2              =   424
      Y1              =   364
      Y2              =   180
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "M"
      Height          =   255
      Index           =   2
      Left            =   5880
      TabIndex        =   16
      Top             =   2340
      Width           =   375
   End
   Begin VB.Line Line1 
      Index           =   1
      X1              =   384
      X2              =   384
      Y1              =   364
      Y2              =   180
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "F"
      Height          =   255
      Index           =   1
      Left            =   5280
      TabIndex        =   15
      Top             =   2340
      Width           =   375
   End
   Begin VB.Line Line1 
      Index           =   0
      X1              =   344
      X2              =   344
      Y1              =   364
      Y2              =   180
   End
   Begin VB.Label lblMois 
      Alignment       =   2  'Center
      Caption         =   "J"
      Height          =   255
      Index           =   0
      Left            =   4680
      TabIndex        =   14
      Top             =   2340
      Width           =   375
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   5640
      TabIndex        =   158
      Top             =   6300
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   156
      Top             =   6360
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Complément :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   12
      Top             =   1980
      Width           =   1320
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Établissement :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   6
      Top             =   1260
      Width           =   1470
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Fiche :"
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
      Left            =   60
      MousePointer    =   10  'Up Arrow
      TabIndex        =   0
      Top             =   540
      Width           =   660
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00C0E0FF&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   315
      Index           =   3
      Left            =   60
      Top             =   5880
      Width           =   11850
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00C0E0FF&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   315
      Index           =   2
      Left            =   60
      Top             =   5160
      Width           =   11850
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00C0E0FF&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   315
      Index           =   1
      Left            =   60
      Top             =   4440
      Width           =   11850
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00C0E0FF&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   315
      Index           =   0
      Left            =   60
      Top             =   2640
      Width           =   11850
   End
   Begin VB.Shape Shape1 
      BackColor       =   &H00FFFFC0&
      BackStyle       =   1  'Opaque
      BorderStyle     =   0  'Transparent
      Height          =   1035
      Index           =   4
      Left            =   4140
      Top             =   3360
      Width           =   7770
   End
End
Attribute VB_Name = "frmDTour"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmDTour
' Gestion des fiches tournée (corps)
' 28/07/1998 PV
'  8/03/2000 PV Collection complète de champs; navigation avec les flèches
' 14/02/2001 PV Recherche sur préfixe/nom etb
' 16/03/2001 PV Effacement de sélection (Maj+Suppr)
' 16/08/2001 PV Chien de garde


Option Explicit

Private cDT As BDCurseur                  ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition
Private sFinalWP As String                ' Where-part de la requête SQL courante

Const sTable As String = "dettour"


'=================================================================================
' Accès direct

Public Sub AfficheDTour(ByVal sFiche As String)
  Load Me
  EffaceFormulaire
  ActiveFormulaire True
  iMode = meQuery
  colChamps("dt_fiche") = sFiche
  ValidateQuery
End Sub



'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim sWP As String
  Dim sFinal As String, sMsg As String
  
  ' On traite d'abord les champs spéciaux
  If txtPréfixe <> "" Then
    If Not bQueryToWP("etb_prefixe", txtPréfixe.Text, BDTypeCHAR, sFinal, sMsg) Then
      MsgBox "Erreur dans la requête !" & vbCrLf & sMsg, vbExclamation, App.Title
      txtPréfixe.SetFocus
      Exit Sub
    End If
    sWP = sWP & "(" & sFinal & ")"
  End If
  If txtNomEtb <> "" Then
    If Not bQueryToWP("etb_nom", txtNomEtb.Text, BDTypeCHAR, sFinal, sMsg) Then
      MsgBox "Erreur dans la requête !" & vbCrLf & sMsg, vbExclamation, App.Title
      txtNomEtb.SetFocus
      Exit Sub
    End If
    If sWP <> "" Then sWP = sWP & " and "
    sWP = sWP & "(" & sFinal & ")"
  End If
  If sWP <> "" Then sWP = "dt_numetb in (select etb_numetb from etablissement where " & sWP & ")"
    
  Dim t As Control
  For Each t In colChamps
    If Not t.Locked And t.Text <> "" Then
      If Not bQueryToWP(t.DataField, t.Text, colColonnes(t.DataField).iType, sFinal, sMsg) Then
        MsgBox "Erreur dans la requête !" & vbCrLf & sMsg, vbExclamation, App.Title
        t.SetFocus
        Exit Sub
      End If
      If sWP <> "" Then sWP = sWP & " and "
      sWP = sWP & "(" & sFinal & ")"
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cDTQuery As New BDCurseur
  ActiveFormulaire False
  BDActiveChamp txtPréfixe, False
  BDActiveChamp txtNomEtb, False
  
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from dettour where (" & sWP & ") order by dt_fiche,dt_index,dt_numetb"
  cDTQuery.OpenCurseur sSQL
  iErr = Err
  sErr = Error
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    ActiveFormulaire True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cDT Is Nothing Then cDT.CloseCurseur
  Set cDT = cDTQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cDT.EOF And cDT.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a été sélectionné"
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  bdSél.SetFocus
End Sub


' Vérifie que les champs contiennent des valeurs légales
' Le contrôle des NULL et des types a déjà été fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer
  Dim i As Integer
  
  bOkValeurs = False
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Dim sType As String
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cDTAdd As New BDCurseur
  cDTAdd.OpenCurseur "select * from dettour where dt_fiche='@'"
  cDTAdd.AddNew
  cDTAdd!dt_idmodif = sBDIdModif
  If Not bPrépareEditAdd(cDTAdd, colColonnes, colChamps) Then cDTAdd.CloseCurseur: Exit Sub
  cDTAdd.CloseCurseur
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cDT Is Nothing Then cDT.CloseCurseur
  Set cDT = New BDCurseur
  Dim sSQL As String
  sSQL = "select * from dettour where dt_fiche=" & sFormToSQL(colChamps("dt_fiche"), BDTypeCHAR) & " and dt_numetb=" & sFormToSQL(colChamps("dt_numetb"), BDTypeCHAR)
  cDT.OpenCurseur sSQL
  cDT.MoveFirst
  
  ' Mise à jour du timestamp de la tête
  sSQL = "update ftour set timestamp=current where ft_fiche=" & sFormToSQL(colChamps("dt_fiche"), BDTypeCHAR)
  RunSQL sSQL
  
  
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
  Dim sType As String
  Assert iMode = meChange
  Assert Not cDT Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cDT.Edit
  cDT!dt_idmodif = sBDIdModif
  If Not bPrépareEditAdd(cDT, colColonnes, colChamps) Then Exit Sub
  
  
  ' Mise à jour du timestamp de la tête
  Dim sSQL As String
  sSQL = "update ftour set timestamp=current where ft_fiche=" & sFormToSQL(colChamps("dt_fiche"), BDTypeCHAR)
  RunSQL sSQL


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
  BDActiveChamp txtPréfixe, False
  BDActiveChamp txtNomEtb, False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cDT Is Nothing Then
    If Not (cDT.EOF And cDT.BOF) Then
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
  
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, False
  BDActiveChamp txtPréfixe, True
  BDActiveChamp txtNomEtb, True
  
  colChamps("dt_fiche").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cDT Is Nothing
  
  If cDT.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, False
  
  ActiveChamp "timestamp", False
  ActiveChamp "dt_fiche", False
  ActiveChamp "dt_idmodif", False
  
  colChamps("dt_index").SetFocus
  AutoSelect colChamps("dt_index"), True
  bdSél.TabStop = False
  
  iMode = meChange
  SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, False
  
  ActiveChamp "timestamp", False
  ActiveChamp "dt_idmodif", False

  colChamps("dt_fiche").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Dim iRep As VbMsgBoxResult
  
  Assert iMode = meNavigate
  Assert Not cDT Is Nothing
  
  
  ' Effacement de sélection
  If bShiftPressed Then
    iRep = MsgBox("Attention, vous allez effacer de manière définitive tous les enregistrements sélectionnés." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    
    ' Mise à jour du timestamp de la tête
    Dim sSQL As String
    sSQL = "update ftour set timestamp=current where ft_fiche in (select unique dt_fiche in dettour where " & sFinalWP & ")"
    RunSQL sSQL
    
    sSQL = "delete from dettour where " & sFinalWP
    On Error Resume Next
    Screen.MousePointer = vbHourglass
    SetMessage "Effacement en cours, patientez..."
    RunSQL sSQL
    If Err Then
      Screen.MousePointer = vbDefault
      SetMessage
      MsgBox "Échec lors de la requête d'effacement" & vbCrLf & vbCrLf & sSQL & vbCrLf & vbCrLf & "Erreur " & Err & ": " & sAjusteMessageODBC(Error), vbExclamation, App.Title
      Exit Sub
    End If
    On Error GoTo 0
    
    If Not cDT Is Nothing Then
      cDT.CloseCurseur
      Set cDT = Nothing
    End If
  
    ' Sélection vide
    Screen.MousePointer = vbDefault
    sFinalWP = ""
    bdSél.ButtonEnabled("Query") = True
    bdSél.ButtonEnabled("Add") = True
    SynchroniseFormulaire
    iMode = meEmpty
    bdSél.ActiveMouvements False
    bdSél.SetFocus
    SetMessage
    
    Exit Sub
  End If



  If cDT.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  
  ' Mise à jour du timestamp de la tête
  sSQL = "update ftour set timestamp=current where ft_fiche=" & sFormToSQL(colChamps("dt_fiche"), BDTypeCHAR)
  RunSQL sSQL

  
  On Error Resume Next
  cDT.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cDT.MoveNext
  
  ' synchrodelete via les triggers

  ' On resynchronise le formulaire
  If cDT.EOF Then
    cDT.MovePrevious
    If cDT.BOF Then
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
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cDT Is Nothing

  bdSél.ButtonEnabled("First") = cDT.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cDT.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cDT.EOF
  bdSél.ButtonEnabled("Last") = Not cDT.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cDT.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cDT.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cDT.MoveNext
  AjusteMouvements
  If cDT.EOF Then cDT.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cDT.MovePrevious
  AjusteMouvements
  If cDT.BOF Then cDT.MoveFirst
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

Private Sub bdSél_GotFocus()
  SetStatus
End Sub

' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  Dim c As Control
  
  ResetChienDeGarde
  If KeyCode = vbKeyF5 Then   ' Mémoire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set c = ActiveControl
          c = colMémoireDTour(ActiveControl.DataField)
          c.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each c In colChamps
        If Not c.Locked Then      ' On ne remplit pas les champs verrouillés
          c = colMémoireDTour(c.DataField)
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

Private Sub lblChamp_Click(Index As Integer)
  If colChamps("dt_fiche") <> "" Then
    frmFTour.AfficheFTour colChamps("dt_fiche")
  End If
End Sub

'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  Show
  
  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If
  
  ' Formulaire en mode initial
  Set cDT = Nothing
  ActiveFormulaire False
  With bdSél
    .LectureSeule = bLectureSeule
    .ActiveMouvements False
    .ActiveValidation False
    .ButtonEnabled("Query") = True
    .ButtonEnabled("Add") = True
    .SetFocus
  End With
  
  iMode = meEmpty
  SetMessage
  SetStatus
  sFinalWP = ""
  Exit Sub
  
Problème:
  Unload Me
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
  If Not cDT Is Nothing Then cDT.CloseCurseur
  MDIFTour.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cDT Is Nothing Then
    EffaceFormulaire
  ElseIf cDT.BOF And cDT.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cDT.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cDT.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cDT.AbsolutePosition
  
    ' On efface les champs qui seront affichés par le timer
    txtRégion = ""
    txtTournée = ""
    txtPréfixe = ""
    txtNomEtb = ""
    txtContraintes = ""
        
    ActiveTimer mtRapide      ' Mise à jour en arrière plan
  End If
  
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cDT.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop

  ' Affichage des champs satellites
  If txtRégion = "" And colChamps("dt_fiche") <> "" Then
    Dim cFT As New BDCurseur
    cFT.OpenCurseur "select ft_region,ft_tournee from ftour where ft_fiche=" & sFormToSQL(colChamps("dt_fiche"), BDTypeCHAR)
    
    If cFT.EOF Then
      txtRégion = "**** FICHE TOURNÉE INCONNUE !"
      txtTournée = "**** FICHE TOURNÉE INCONNUE !"
    Else
      txtRégion = NV(cFT!ft_region)
      txtTournée = NV(cFT!ft_tournee)
    End If
    cFT.CloseCurseur
  End If
  
  If txtPréfixe = "" And colChamps("dt_numetb") <> "" Then
    Dim cEtb As New BDCurseur
    cEtb.OpenCurseur "select etb_prefixe,etb_nom,etb_nbran,etb_contraintes, etb_nbrbs, etb_nbrch, etb_nbreh, etb_nbrfs, etb_nbrhuiles, etb_nbrlis, etb_freqan, etb_freqbs, etb_freqch, etb_freqeh, etb_freqfs , etb_freqhuiles, etb_freqlis, etb_prestan, etb_prestbs, etb_prestch, etb_presteh, etb_prestfs, etb_presthuiles, etb_prestlis from etablissement where etb_numetb=" & sFormToSQL(colChamps("dt_numetb"), BDTypeCHAR)
    If cEtb.EOF Then
      txtPréfixe = "****"
      txtNomEtb = "**** ÉTABLISSEMENT INEXISTANT !"
      txtContraintes = ""
    Else
      txtPréfixe = cEtb!etb_prefixe
      txtNomEtb = cEtb!etb_nom
      txtContraintes = NV(cEtb!etb_contraintes)
            
      txtNbrAn = NV(cEtb!etb_nbran)
      txtNbrBS = NV(cEtb!etb_nbrbs)
      txtNbrCh = NV(cEtb!etb_nbrch)
      txtNbrEH = NV(cEtb!etb_nbreh)
      txtNbrFS = NV(cEtb!etb_nbrfs)
      txtNbrHuiles = NV(cEtb!etb_nbrhuiles)
      txtNbrLis = NV(cEtb!etb_nbrlis)
    
      txtFreqAn = NV(cEtb!etb_freqan)
      txtFreqBS = NV(cEtb!etb_freqbs)
      txtFreqCh = NV(cEtb!etb_freqch)
      txtFreqEH = NV(cEtb!etb_freqeh)
      txtFreqFS = NV(cEtb!etb_freqfs)
      txtFreqHuiles = NV(cEtb!etb_freqhuiles)
      txtFreqLis = NV(cEtb!etb_freqlis)
      
      txtPrestAn = NV(cEtb!etb_prestan)
      txtPrestBS = NV(cEtb!etb_prestbs)
      txtPrestCh = NV(cEtb!etb_prestch)
      txtPrestEH = NV(cEtb!etb_presteh)
      txtPrestFS = NV(cEtb!etb_prestfs)
      txtPrestHuiles = NV(cEtb!etb_presthuiles)
      txtPrestLis = NV(cEtb!etb_prestlis)
    End If
    cEtb.CloseCurseur
  End If
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  bdSél.NumRec = ""
  
  EffaceChampsFiche
  EffaceChampsEtablissement
End Sub

Private Sub EffaceChampsFiche()
  txtRégion = ""
  txtTournée = ""
End Sub

Private Sub EffaceChampsEtablissement()
  txtPréfixe = ""
  txtNomEtb = ""
  txtContraintes = ""
  
  txtNbrAn = ""
  txtNbrBS = ""
  txtNbrCh = ""
  txtNbrEH = ""
  txtNbrFS = ""
  txtNbrHuiles = ""
  txtNbrLis = ""

  txtFreqAn = ""
  txtFreqBS = ""
  txtFreqCh = ""
  txtFreqEH = ""
  txtFreqFS = ""
  txtFreqHuiles = ""
  txtFreqLis = ""
  
  txtPrestAn = ""
  txtPrestBS = ""
  txtPrestCh = ""
  txtPrestEH = ""
  txtPrestFS = ""
  txtPrestHuiles = ""
  txtPrestLis = ""
End Sub


' Activation du timer de mise à jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  timSatellites.Enabled = 0
  Select Case mtMode
    Case mtStop: timSatellites.Enabled = False
    Case mtLent: timSatellites.Interval = 1000: timSatellites.Enabled = True
    Case mtRapide: timSatellites.Interval = 250: timSatellites.Enabled = True
  End Select
End Sub


Private Sub ActiveFormulaire(bEnabled As Boolean)
  Dim c As Control
  For Each c In colChamps
    BDActiveChamp c, bEnabled
  Next
End Sub



Private Sub ActiveChamp(ByVal sChamp As String, bEnabled As Boolean)
  BDActiveChamp colChamps(sChamp), bEnabled
End Sub


'=================================================================================

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "dt_numetb" Then
    EffaceChampsEtablissement
    ActiveTimer mtLent
  ElseIf txtChamp(Index).DataField = "dt_fiche" Then
    EffaceChampsFiche
    ActiveTimer mtLent
  End If
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
  BDCopieSélection cDT, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
'  BDEtat sFinalSQL, drLibelléCRA, True, Caption
End Sub

Public Sub Aperçu()
'  BDEtat sFinalSQL, drLibelléCRA, False, Caption
End Sub


'=================================================================================
' Mémorisation

Public Sub Mémorise()
  EffaceCollection colMémoireDTour
  
  Dim t As Control
  For Each t In colChamps
    colMémoireDTour.Add (t), t.DataField
  Next
End Sub

Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  Dim iOff As Integer
  
  If KeyCode = vbKeyDown Then
    iOff = 1
  ElseIf KeyCode = vbKeyUp Then
    iOff = -1
  Else
    Exit Sub
  End If
  
  Dim d As String, sNextd As String
  d = txtChamp(Index).DataField
  If KeyCode = vbKeyDown And ((d >= "dt_101" And d <= "dt_112") Or (d >= "dt_301" And d <= "dt_712")) Then
    sNextd = "dt_" & (1 + Mid(d, 4, 1)) & Right(d, 2)
  ElseIf KeyCode = vbKeyDown And d Like "dt_2##" Then
    sNextd = d & "g"
  ElseIf KeyCode = vbKeyDown And d Like "dt_2##g" Then
    sNextd = Replace(d, "g", "s")
  ElseIf KeyCode = vbKeyDown And d Like "dt_2##s" Then
    sNextd = Replace(d, "s", "d")
  ElseIf KeyCode = vbKeyDown And d Like "dt_2##d" Then
    sNextd = Replace(Left(d, 6), "_2", "_3")
  End If
    
  If KeyCode = vbKeyUp And ((d >= "dt_401" And d <= "dt_712") Or d Like "dt_2##") Then
    sNextd = "dt_" & (-1 + Mid(d, 4, 1)) & Right(d, 2)
  ElseIf KeyCode = vbKeyUp And d Like "dt_2##g" Then
    sNextd = Replace(d, "g", "")
  ElseIf KeyCode = vbKeyUp And d Like "dt_2##s" Then
    sNextd = Replace(d, "s", "g")
  ElseIf KeyCode = vbKeyUp And d Like "dt_2##d" Then
    sNextd = Left(d, 6) & "s"
  ElseIf KeyCode = vbKeyUp And d Like "dt_3##" Then
    sNextd = Replace(d, "_3", "_2") & "d"
  End If
    
  If sNextd <> "" Then
    Dim c As Control
    For Each c In colChamps
      If c.DataField = sNextd Then Exit For
    Next
    If Not c Is Nothing Then c.SetFocus
  End If
End Sub

Private Sub txtPréfixe_GotFocus()
  AutoSelect txtPréfixe, True
  SetStatus "Préfixe de l'établissement"
End Sub

Private Sub txtNomEtb_GotFocus()
  AutoSelect txtNomEtb, True
  SetStatus "Nom de l'établissement"
End Sub

