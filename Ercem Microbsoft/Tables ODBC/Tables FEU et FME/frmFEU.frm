VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmFEU 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Fiches FEU"
   ClientHeight    =   6390
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   11145
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
   Icon            =   "frmFEU.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   426
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   743
   Tag             =   "Données"
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Caption         =   "feu_trttrlstger"
      Height          =   1455
      Index           =   2
      Left            =   3000
      TabIndex        =   74
      Top             =   1320
      Visible         =   0   'False
      Width           =   1755
      Begin FEUetFME.BDCombo bdcTypeDoc 
         Height          =   330
         Left            =   0
         TabIndex        =   1
         Top             =   720
         Width           =   2175
         _ExtentX        =   4260
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
         DataField       =   "feu_dttype"
      End
      Begin FEUetFME.BDCheck BDCheck1 
         Height          =   285
         Left            =   2160
         TabIndex        =   4
         Top             =   2100
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trttrri"
      End
      Begin FEUetFME.BDCheck BDCheck2 
         Height          =   285
         Left            =   2160
         TabIndex        =   5
         Top             =   2460
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trttrrf"
      End
      Begin FEUetFME.BDCheck BDCheck3 
         Height          =   285
         Left            =   2160
         TabIndex        =   6
         Top             =   2940
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trttrtg"
      End
      Begin FEUetFME.BDCheck BDCheck4 
         Height          =   285
         Left            =   2160
         TabIndex        =   7
         Top             =   3300
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trttrgp"
      End
      Begin FEUetFME.BDCheck BDCheck5 
         Height          =   285
         Left            =   2160
         TabIndex        =   8
         Top             =   3660
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trttrga"
      End
      Begin FEUetFME.BDCheck BDCheck6 
         Height          =   285
         Left            =   4860
         TabIndex        =   10
         Top             =   2100
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtcorri"
      End
      Begin FEUetFME.BDCheck BDCheck7 
         Height          =   285
         Left            =   4860
         TabIndex        =   11
         Top             =   2460
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtcorrf"
      End
      Begin FEUetFME.BDCheck BDCheck8 
         Height          =   285
         Left            =   4860
         TabIndex        =   12
         Top             =   2940
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtcortg"
      End
      Begin FEUetFME.BDCheck BDCheck9 
         Height          =   285
         Left            =   4860
         TabIndex        =   13
         Top             =   3300
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtcorgp"
      End
      Begin FEUetFME.BDCheck BDCheck10 
         Height          =   285
         Left            =   4860
         TabIndex        =   14
         Top             =   3660
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtcorga"
      End
      Begin FEUetFME.BDCheck BDCheck11 
         Height          =   285
         Left            =   7440
         TabIndex        =   16
         Top             =   2100
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtnsri"
      End
      Begin FEUetFME.BDCheck BDCheck12 
         Height          =   285
         Left            =   7440
         TabIndex        =   17
         Top             =   2460
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtnsrf"
      End
      Begin FEUetFME.BDCheck BDCheck13 
         Height          =   285
         Left            =   7440
         TabIndex        =   18
         Top             =   2940
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtnstg"
      End
      Begin FEUetFME.BDCheck BDCheck14 
         Height          =   285
         Left            =   7440
         TabIndex        =   19
         Top             =   3300
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtnsgp"
      End
      Begin FEUetFME.BDCheck BDCheck15 
         Height          =   285
         Left            =   7440
         TabIndex        =   20
         Top             =   3660
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtnsga"
      End
      Begin FEUetFME.BDCheck BDCheck16 
         Height          =   285
         Left            =   10020
         TabIndex        =   23
         Top             =   2100
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtarri"
      End
      Begin FEUetFME.BDCheck BDCheck17 
         Height          =   285
         Left            =   10020
         TabIndex        =   24
         Top             =   2460
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtarrf"
      End
      Begin FEUetFME.BDCheck BDCheck18 
         Height          =   285
         Left            =   10020
         TabIndex        =   25
         Top             =   2940
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtartg"
      End
      Begin FEUetFME.BDCheck BDCheck19 
         Height          =   285
         Left            =   10020
         TabIndex        =   26
         Top             =   3300
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtargp"
      End
      Begin FEUetFME.BDCheck BDCheck20 
         Height          =   285
         Left            =   10020
         TabIndex        =   27
         Top             =   3660
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   503
         BackColor       =   -2147483633
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
         Locked          =   -1  'True
         DataField       =   "feu_trtarga"
      End
      Begin FEUetFME.BDCombo bdcFormules 
         Height          =   330
         Left            =   8580
         TabIndex        =   22
         Top             =   1680
         Width           =   1695
         _ExtentX        =   2990
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
         DataField       =   "feu_trtarformule"
      End
      Begin VB.Line Line8 
         X1              =   0
         X2              =   10380
         Y1              =   2820
         Y2              =   2820
      End
      Begin VB.Label Label21 
         Caption         =   "Rés. Intermédiaires :"
         Height          =   255
         Left            =   7860
         TabIndex        =   111
         Top             =   2160
         Width           =   1995
      End
      Begin VB.Label Label12 
         Caption         =   "Résultats Finaux :"
         Height          =   255
         Left            =   7860
         TabIndex        =   110
         Top             =   2520
         Width           =   1815
      End
      Begin VB.Label Label11 
         Caption         =   "Rés. Intermédiaires :"
         Height          =   255
         Left            =   5280
         TabIndex        =   109
         Top             =   2160
         Width           =   1995
      End
      Begin VB.Label Label10 
         Caption         =   "Résultats Finaux :"
         Height          =   255
         Left            =   5280
         TabIndex        =   108
         Top             =   2520
         Width           =   1815
      End
      Begin VB.Label Label9 
         Caption         =   "Rés. Intermédiaires :"
         Height          =   255
         Left            =   2700
         TabIndex        =   107
         Top             =   2160
         Width           =   1995
      End
      Begin VB.Label Label1 
         Caption         =   "Résultats Finaux :"
         Height          =   255
         Left            =   2700
         TabIndex        =   106
         Top             =   2520
         Width           =   1815
      End
      Begin VB.Label Label16 
         Caption         =   "Rés. Intermédiaires :"
         Height          =   255
         Left            =   60
         TabIndex        =   105
         Top             =   2160
         Width           =   1995
      End
      Begin VB.Label Label19 
         Caption         =   "Résultats Finaux :"
         Height          =   255
         Left            =   60
         TabIndex        =   104
         Top             =   2520
         Width           =   1815
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_trtarlstger"
         Height          =   315
         Index           =   47
         Left            =   7860
         TabIndex        =   28
         Top             =   4020
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_trtnslstger"
         Height          =   315
         Index           =   45
         Left            =   5280
         TabIndex        =   21
         Top             =   4020
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_trtcorlstger"
         Height          =   315
         Index           =   44
         Left            =   2700
         TabIndex        =   15
         Top             =   4020
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_trttrlstger"
         Height          =   315
         Index           =   17
         Left            =   60
         TabIndex        =   9
         Top             =   4020
         Width           =   2415
         _ExtentX        =   4260
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText Text1 
         DataField       =   "feu_dtdesc"
         Height          =   315
         Left            =   2340
         TabIndex        =   2
         Top             =   720
         Width           =   3375
         _ExtentX        =   5953
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText Text2 
         DataField       =   "feu_dtrem"
         Height          =   315
         Left            =   5760
         TabIndex        =   3
         Top             =   720
         Width           =   3435
         _ExtentX        =   6059
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Line Line7 
         X1              =   10380
         X2              =   10380
         Y1              =   1560
         Y2              =   4500
      End
      Begin VB.Line Line6 
         X1              =   0
         X2              =   0
         Y1              =   1560
         Y2              =   4500
      End
      Begin VB.Line Line5 
         X1              =   0
         X2              =   10380
         Y1              =   4500
         Y2              =   4500
      End
      Begin VB.Line Line4 
         X1              =   0
         X2              =   10380
         Y1              =   1560
         Y2              =   1560
      End
      Begin VB.Line Line2 
         X1              =   5220
         X2              =   5220
         Y1              =   1560
         Y2              =   4500
      End
      Begin VB.Line Line1 
         X1              =   2580
         X2              =   2580
         Y1              =   1560
         Y2              =   4500
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Type de résultats à transmettre"
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
         Index           =   10
         Left            =   0
         TabIndex        =   95
         Top             =   1260
         Width           =   3120
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Germes pathogènes :"
         Height          =   210
         Index           =   25
         Left            =   5280
         TabIndex        =   94
         Top             =   3360
         Width           =   2055
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Tous germes :"
         Height          =   210
         Index           =   24
         Left            =   5280
         TabIndex        =   93
         Top             =   3000
         Width           =   1350
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Non satisfaisants"
         Height          =   210
         Index           =   23
         Left            =   5700
         TabIndex        =   92
         Top             =   1680
         Width           =   1635
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Germes pathogènes :"
         Height          =   210
         Index           =   22
         Left            =   2700
         TabIndex        =   91
         Top             =   3360
         Width           =   2055
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Tous germes :"
         Height          =   210
         Index           =   21
         Left            =   2700
         TabIndex        =   90
         Top             =   3000
         Width           =   1350
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Corrompus"
         Height          =   210
         Index           =   20
         Left            =   3360
         TabIndex        =   89
         Top             =   1680
         Width           =   1035
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Tous résultats"
         Height          =   210
         Index           =   17
         Left            =   420
         TabIndex        =   88
         Top             =   1680
         Width           =   1350
      End
      Begin VB.Label Label2 
         Caption         =   "Document de transmission"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   195
         Left            =   0
         TabIndex        =   87
         Top             =   120
         Width           =   3015
      End
      Begin VB.Label Label4 
         Caption         =   "Type :"
         Height          =   255
         Left            =   0
         TabIndex        =   86
         Top             =   480
         Width           =   615
      End
      Begin VB.Label Label5 
         Caption         =   "Description des colonnes tableau"
         Height          =   255
         Left            =   2400
         TabIndex        =   85
         Top             =   480
         Width           =   3135
      End
      Begin VB.Label Label6 
         Caption         =   "Commentaires"
         Height          =   255
         Left            =   5760
         TabIndex        =   84
         Top             =   480
         Width           =   2175
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Tous germes :"
         Height          =   210
         Index           =   1
         Left            =   60
         TabIndex        =   83
         Top             =   3000
         Width           =   1350
      End
      Begin VB.Label Label7 
         Caption         =   "Germes pathogènes :"
         Height          =   255
         Left            =   60
         TabIndex        =   82
         Top             =   3360
         Width           =   2295
      End
      Begin VB.Label Label8 
         Caption         =   "Autres germes :"
         Height          =   255
         Left            =   60
         TabIndex        =   81
         Top             =   3720
         Width           =   1815
      End
      Begin VB.Line Line3 
         X1              =   7800
         X2              =   7800
         Y1              =   1560
         Y2              =   4500
      End
      Begin VB.Label Label13 
         Caption         =   "Autres germes :"
         Height          =   255
         Left            =   2700
         TabIndex        =   80
         Top             =   3720
         Width           =   1815
      End
      Begin VB.Label Label14 
         Caption         =   "Autres germes :"
         Height          =   255
         Left            =   5280
         TabIndex        =   79
         Top             =   3720
         Width           =   1815
      End
      Begin VB.Label Label15 
         Caption         =   "Autres"
         Height          =   255
         Left            =   7860
         TabIndex        =   78
         Top             =   1680
         Width           =   735
      End
      Begin VB.Label Label17 
         Caption         =   "Germes pathogènes :"
         Height          =   195
         Left            =   7860
         TabIndex        =   77
         Top             =   3360
         Width           =   2115
      End
      Begin VB.Label Label18 
         Caption         =   "Tous germes :"
         Height          =   255
         Left            =   7860
         TabIndex        =   76
         Top             =   3000
         Width           =   1575
      End
      Begin VB.Label Label20 
         Caption         =   "Autres germes :"
         Height          =   255
         Left            =   7860
         TabIndex        =   75
         Top             =   3720
         Width           =   1875
      End
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   1215
      Index           =   1
      Left            =   240
      TabIndex        =   71
      Top             =   1320
      Visible         =   0   'False
      Width           =   2055
      Begin FEUetFME.BDCombo bdcModeTrans 
         Height          =   330
         Index           =   0
         Left            =   5340
         TabIndex        =   35
         Top             =   1500
         Width           =   1575
         _ExtentX        =   2778
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
         DataField       =   "feu_d1modetrans"
      End
      Begin VB.CommandButton btnEtbAttachés 
         Caption         =   "Etbs attachés"
         Height          =   495
         Left            =   7680
         TabIndex        =   65
         Top             =   0
         Width           =   975
      End
      Begin FEUetFME.BDCombo bdcModeTrans 
         Height          =   330
         Index           =   1
         Left            =   5340
         TabIndex        =   41
         Top             =   2220
         Width           =   1575
         _ExtentX        =   2778
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
         DataField       =   "feu_d2modetrans"
      End
      Begin FEUetFME.BDCombo bdcModeTrans 
         Height          =   330
         Index           =   2
         Left            =   5340
         TabIndex        =   47
         Top             =   2940
         Width           =   1575
         _ExtentX        =   2778
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
         DataField       =   "feu_d3modetrans"
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "/"
         Height          =   210
         Index           =   15
         Left            =   8700
         TabIndex        =   103
         Top             =   2940
         Width           =   75
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d3fax"
         Height          =   315
         Index           =   48
         Left            =   8880
         TabIndex        =   49
         Top             =   2940
         Width           =   1635
         _ExtentX        =   2884
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   20
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d3tel"
         Height          =   315
         Index           =   43
         Left            =   7020
         TabIndex        =   48
         Top             =   2940
         Width           =   1635
         _ExtentX        =   2884
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   20
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "/"
         Height          =   210
         Index           =   14
         Left            =   8700
         TabIndex        =   102
         Top             =   2220
         Width           =   75
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d2fax"
         Height          =   315
         Index           =   16
         Left            =   8880
         TabIndex        =   43
         Top             =   2220
         Width           =   1635
         _ExtentX        =   2884
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   20
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d2tel"
         Height          =   315
         Index           =   15
         Left            =   7020
         TabIndex        =   42
         Top             =   2220
         Width           =   1635
         _ExtentX        =   2884
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   20
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label Label25 
         Caption         =   "Fax"
         Height          =   255
         Left            =   9420
         TabIndex        =   101
         Top             =   1140
         Width           =   495
      End
      Begin VB.Label Label23 
         Caption         =   "Téléphone"
         Height          =   255
         Left            =   7380
         TabIndex        =   100
         Top             =   1140
         Width           =   1095
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "/"
         Height          =   210
         Index           =   13
         Left            =   8700
         TabIndex        =   99
         Top             =   1500
         Width           =   75
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d1fax"
         Height          =   315
         Index           =   14
         Left            =   8880
         TabIndex        =   37
         Top             =   1500
         Width           =   1635
         _ExtentX        =   2884
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   20
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d1tel"
         Height          =   315
         Index           =   13
         Left            =   7020
         TabIndex        =   36
         Top             =   1500
         Width           =   1635
         _ExtentX        =   2884
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   20
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_adr1"
         Height          =   315
         Index           =   2
         Left            =   1080
         TabIndex        =   31
         Top             =   0
         Width           =   5415
         _ExtentX        =   9551
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   65
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_adr2"
         Height          =   315
         Index           =   3
         Left            =   1080
         TabIndex        =   32
         Top             =   360
         Width           =   5415
         _ExtentX        =   9551
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   65
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d1nom"
         Height          =   315
         Index           =   4
         Left            =   120
         TabIndex        =   33
         Top             =   1500
         Width           =   2355
         _ExtentX        =   4154
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   30
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d1fonct"
         Height          =   315
         Index           =   5
         Left            =   2580
         TabIndex        =   34
         Top             =   1500
         Width           =   2655
         _ExtentX        =   4683
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   30
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d1coord"
         Height          =   315
         Index           =   6
         Left            =   7020
         TabIndex        =   38
         Top             =   1860
         Width           =   3495
         _ExtentX        =   6165
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   20
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d2nom"
         Height          =   315
         Index           =   7
         Left            =   120
         TabIndex        =   39
         Top             =   2220
         Width           =   2355
         _ExtentX        =   4154
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   30
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d2fonct"
         Height          =   315
         Index           =   8
         Left            =   2580
         TabIndex        =   40
         Top             =   2220
         Width           =   2655
         _ExtentX        =   4683
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   30
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d2coord"
         Height          =   315
         Index           =   9
         Left            =   7020
         TabIndex        =   44
         Top             =   2580
         Width           =   3495
         _ExtentX        =   6165
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   20
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d3nom"
         Height          =   315
         Index           =   10
         Left            =   120
         TabIndex        =   45
         Top             =   2940
         Width           =   2355
         _ExtentX        =   4154
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   30
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d3fonct"
         Height          =   315
         Index           =   11
         Left            =   2580
         TabIndex        =   46
         Top             =   2940
         Width           =   2655
         _ExtentX        =   4683
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   30
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_d3coord"
         Height          =   315
         Index           =   12
         Left            =   7020
         TabIndex        =   50
         Top             =   3300
         Width           =   3495
         _ExtentX        =   6165
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   20
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         Caption         =   "Mode de Transmission"
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
         Left            =   5460
         TabIndex        =   72
         Top             =   1020
         Width           =   1215
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Adresse :"
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
         Left            =   0
         TabIndex        =   60
         Top             =   60
         Width           =   930
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Destinataires :"
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
         Index           =   3
         Left            =   120
         TabIndex        =   61
         Top             =   840
         Width           =   1455
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Nom"
         Height          =   210
         Index           =   31
         Left            =   1080
         TabIndex        =   62
         Top             =   1140
         Width           =   420
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Fonction"
         Height          =   210
         Index           =   34
         Left            =   3420
         TabIndex        =   63
         Top             =   1140
         Width           =   795
      End
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   1395
      Index           =   3
      Left            =   6000
      TabIndex        =   70
      Top             =   1380
      Visible         =   0   'False
      Width           =   2655
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_comment3"
         Height          =   315
         Index           =   21
         Left            =   2340
         TabIndex        =   113
         Top             =   1920
         Width           =   5775
         _ExtentX        =   10186
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   65
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Remarques internes :"
         Height          =   210
         Index           =   11
         Left            =   60
         TabIndex        =   112
         Top             =   2460
         Width           =   2040
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_rem3"
         Height          =   315
         Index           =   20
         Left            =   2340
         TabIndex        =   58
         Top             =   3180
         Width           =   5775
         _ExtentX        =   10186
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   65
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_rem2"
         Height          =   315
         Index           =   19
         Left            =   2340
         TabIndex        =   57
         Top             =   2820
         Width           =   5775
         _ExtentX        =   10186
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   65
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_rem1"
         Height          =   315
         Index           =   18
         Left            =   2340
         TabIndex        =   56
         Top             =   2460
         Width           =   5775
         _ExtentX        =   10186
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   65
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_modrfrem"
         Height          =   315
         Index           =   29
         Left            =   2340
         TabIndex        =   52
         Top             =   780
         Width           =   5775
         _ExtentX        =   10186
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   60
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_modrirem"
         Height          =   315
         Index           =   27
         Left            =   2340
         TabIndex        =   51
         Top             =   420
         Width           =   5775
         _ExtentX        =   10186
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   60
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_comment"
         Height          =   315
         Index           =   30
         Left            =   2340
         TabIndex        =   53
         Top             =   1200
         Width           =   5775
         _ExtentX        =   10186
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   65
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   32
         Left            =   2340
         TabIndex        =   59
         Top             =   3960
         Width           =   2475
         _ExtentX        =   4366
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_comment2"
         Height          =   315
         Index           =   31
         Left            =   2340
         TabIndex        =   54
         Top             =   1560
         Width           =   5775
         _ExtentX        =   10186
         _ExtentY        =   556
         _Version        =   393216
         MaxLength       =   65
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin MSWLess.WLText txtChamp 
         DataField       =   "feu_idmodif"
         Height          =   315
         Index           =   34
         Left            =   2340
         TabIndex        =   55
         Top             =   3540
         Width           =   5775
         _ExtentX        =   10186
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label Label26 
         Caption         =   "Modalités"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   60
         TabIndex        =   98
         Top             =   60
         Width           =   1095
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Commentaires RF :"
         Height          =   210
         Index           =   8
         Left            =   60
         TabIndex        =   97
         Top             =   840
         Width           =   1785
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Commentaires RI :"
         Height          =   210
         Index           =   6
         Left            =   60
         TabIndex        =   96
         Top             =   480
         Width           =   1755
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Commentaires Feu :"
         Height          =   210
         Index           =   7
         Left            =   60
         TabIndex        =   64
         Top             =   1260
         Width           =   1905
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   9
         Left            =   60
         TabIndex        =   67
         Top             =   3960
         Width           =   1155
      End
      Begin VB.Label lblLabels 
         AutoSize        =   -1  'True
         Caption         =   "Origine modif :"
         Height          =   210
         Index           =   5
         Left            =   60
         TabIndex        =   66
         Top             =   3600
         Width           =   1380
      End
   End
   Begin FEUetFME.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   68
      TabStop         =   0   'False
      Top             =   0
      Width           =   11145
      _ExtentX        =   19659
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
   Begin MSComctlLib.ImageList ilToolBar2 
      Left            =   9240
      Top             =   480
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   10
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFEU.frx":0442
            Key             =   "imgQuery"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFEU.frx":0554
            Key             =   "imgFirst"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFEU.frx":0666
            Key             =   "imgPrevious"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFEU.frx":0778
            Key             =   "imgNext"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFEU.frx":088A
            Key             =   "imgLast"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFEU.frx":099C
            Key             =   "imgAdd"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFEU.frx":0AAE
            Key             =   "imgEdit"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFEU.frx":0BC0
            Key             =   "imgDelete"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFEU.frx":0CD2
            Key             =   "imgValidate"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFEU.frx":0DDC
            Key             =   "imgCancel"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TabStrip tsTab 
      Height          =   435
      Left            =   60
      TabIndex        =   69
      TabStop         =   0   'False
      Top             =   840
      Width           =   8835
      _ExtentX        =   15584
      _ExtentY        =   767
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   3
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Identification / Destinataires"
            Key             =   "Identification"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Documents / Type de résultats"
            Key             =   "DocType"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Modalités de transmission"
            Key             =   "Modalités"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*feu_numfeu"
      Height          =   315
      Index           =   0
      Left            =   1200
      TabIndex        =   29
      Top             =   480
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
      DataField       =   "*feu_titre"
      Height          =   315
      Index           =   1
      Left            =   2040
      TabIndex        =   30
      Tag             =   "Intitulé du pays"
      Top             =   480
      Width           =   6135
      _ExtentX        =   10821
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Germes pathogènes :"
      Height          =   210
      Index           =   4
      Left            =   0
      TabIndex        =   73
      Top             =   0
      Width           =   2055
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "N° / Titre :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   930
   End
End
Attribute VB_Name = "frmFEU"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmFEU
' Feuille de gestion des fiches d'envoi urgent
' 13/02/1998 PV
'  8/07/1998 PV Utilisation d'un BDSélecteur, Copie des données
' 15/08/1998 PV BDActiveChamp
'  8/04/1999 PV Squelette d'impression
' 23/11/1999 PV Version à onglets
' 21/02/2000 PV Accès direct
'  5/07/2001 PV Contrôle d'utilisation avant suppression
' 14/12/2001 FF Historique des opérations
' 17/12/2001 FF Menu de commandes contextuel

Option Explicit

Private cFeu As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private sFinalWP As String                ' Requête SQL courante
Private colhistorique As New Collection    ' Historique des modifications

Private Const sTable = "feu"

Private iCurFrame As Integer              ' Cadre courant visible



'=================================================================================
' Accès direct

Public Sub AfficheFEU(ByVal n As Long)
  ' Si la feuille n'est pas disponible, on en ouvre une autre
  If iMode <> meEmpty And iMode <> meNavigate Then
    Dim F As New frmFEU
    F.AfficheFEU n
    Exit Sub
  End If
  
  Show  ' Sinon les BDCheck ne sont pas effacées par l'appel qui suit
  EffaceFormulaire
  BDActiveFormulaire colChamps, True
  iMode = meQuery
  colChamps("feu_numfeu") = n
  ValidateQuery
End Sub



'=================================================================================
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
  ' Affecte la nouvelle valeur à iCurFrame.
  iCurFrame = tsTab.SelectedItem.Index

  ' Accompagnement du focus
  ' Ça serait pas mal de mémoriser page par page le contrôle qui a le focus au moment
  ' du changement de focus, de façon à restaurer le focus sur ce contrôle
  ' mais il faut traiter le fait que c'est le contrôle tabstop qui prend le focus
  ' quand on clique dessus (pas sûr il me semble, c'est au 2ème clic qu'il prend le focus !!!)
  DoEvents
  Select Case tsTab.SelectedItem.Key
    Case "Identification": txtChamp(1).SetFocus
    Case "DocType": txtChamp(1).SetFocus
    Case "Modalités": txtChamp(1).SetFocus
    Case Else: Stop
  End Select
End Sub

Private Sub Form_Resize()
  If ScaleHeight < 250 Or ScaleWidth < 550 Then Exit Sub
  
  ' On retaille le tabstrip…
  tsTab.Move 2, 56, ScaleWidth - 4, ScaleHeight - 35
  
  ' Puis les frames contenant les contrôles
  Dim F As Frame
  For Each F In fraFeuille
    F.Move tsTab.ClientLeft + 2, tsTab.ClientTop + 6, tsTab.ClientWidth - 2, tsTab.ClientHeight - 4
  Next
End Sub

' Changement d'onglet avec PgPrec/PgSuiv
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyPageUp Then
    If tsTab.SelectedItem.Index > 1 Then Page tsTab.SelectedItem.Index - 1
    KeyCode = 0
  ElseIf KeyCode = vbKeyPageDown Then
    If tsTab.SelectedItem.Index < tsTab.Tabs.Count Then Page tsTab.SelectedItem.Index + 1
    KeyCode = 0
  Else
    bdSél.KeyDown KeyCode
  End If
End Sub

' Menu de commandes contextuel pour chaque feuille

Private Sub fraFeuille_MouseDown(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
If Button = 2 Then    ' Bouton droit
    PopupMenu MDIFEUetFME.mnuCommandes
  End If
End Sub

'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim sWP As String
  Dim t As Control
  For Each t In colChamps
    If Not t.Locked And t.Text <> "" Then
      Dim sFinal As String, sMsg As String
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
  
  Dim cFeuQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from feu where " & sWP & " order by feu_numfeu"
  cFeuQuery.OpenCurseur sSQL
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
  If Not cFeu Is Nothing Then cFeu.CloseCurseur
  Set cFeu = cFeuQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cFeu.EOF And cFeu.BOF) Then
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
  
  bOkValeurs = False
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim cFeuAdd As New BDCurseur
  cFeuAdd.OpenCurseur "select * from feu where feu_numfeu=0"
  cFeuAdd.AddNew
  
  ' On récupère un n° de FEU
  Dim cNumFeu As New BDCurseur
  cNumFeu.OpenCurseur "select max(feu_numfeu) from feu"
  colChamps("feu_numfeu") = cNumFeu.Fields(0) + 1
  cFeuAdd!feu_numfeu = cNumFeu.Fields(0) + 1
  cNumFeu.CloseCurseur
  
  If Not bPrépareEditAdd(cFeuAdd, colColonnes, colChamps) Then
    cFeuAdd.CloseCurseur
    colChamps("feu_numfeu") = ""
    Exit Sub
  End If
  cFeuAdd.CloseCurseur
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cFeu Is Nothing Then cFeu.CloseCurseur
  Set cFeu = New BDCurseur
  sFinalWP = "feu_numfeu=" & sFormToSQL(colChamps("feu_numfeu"), BDTypeINTEGER)
  cFeu.OpenCurseur "select * from feu where " & sFinalWP
  cFeu.MoveFirst
  
  ' Historique
  Dim sMsgTrace As String
  Dim c As Control
  For Each c In Controls
    If DataFieldEx(c) <> "" Then
      ' On enregistre uniquement si les champs ne sont pas vides
      If ValeurContrôle(c) <> "" Then
        If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
        sMsgTrace = sMsgTrace & c.DataField & ":" & ValeurContrôle(c)
      End If
    End If
  Next
  JournalUnix sTable & " " & colChamps("feu_numfeu"), "créé", sMsgTrace
  
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  EmpêcheMouvements
  
  SetMessage
  SetStatus
  bdSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cFeu Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cFeu.Edit
  If Not bPrépareEditAdd(cFeu, colColonnes, colChamps) Then Exit Sub
  
  ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a été changé
  If iMode = meChange Then
    Dim c As Control
    Dim sMsgTrace As String
    For Each c In Controls
      If DataFieldEx(c) <> "" Then
        If colhistorique(c.DataField) <> ValeurContrôle(c) Then  ' Modifié !
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & c.DataField & ":" & colhistorique(c.DataField) & "->" & ValeurContrôle(c)
        End If
      End If
    Next
    If sMsgTrace <> "" Then
       JournalUnix sTable & " " & colChamps("feu_numfeu"), "changé", sMsgTrace
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

  SetMessage
  SetStatus
  bdSél.SetFocus
End Sub



Private Sub ActionValidate()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:   ValidateAdd
    Case meQuery: ValidateQuery
  End Select
End Sub





Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cFeu Is Nothing Then
    If Not (cFeu.EOF And cFeu.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
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
  
  colChamps("feu_numfeu").SetFocus
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cFeu Is Nothing
  
  If cFeu.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "feu_numfeu", False
  ActiveChamp "timestamp", False
  
  colChamps("feu_titre").SetFocus
  AutoSelect colChamps("feu_titre"), True
  
  iMode = meChange
  
  ' On mémorise les valeurs avant le changement
  EffaceCollection colhistorique
  Dim c As Control
  For Each c In Controls
    If DataFieldEx(c) <> "" Then
      colhistorique.Add ValeurContrôle(c), c.DataField
    End If
  Next
  
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
  ActiveChamp "timestamp", False
  ActiveChamp "feu_numfeu", False
  
  colChamps("feu_titre").SetFocus
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cFeu Is Nothing

  If cFeu.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  Dim iNb As Long
  SetStatus "Recherche d'établissement attachés à cette FEU, patientez..."
  iNb = BDCurseurExpress("select count(*) from etablissement where etb_feu=" & colChamps("feu_numfeu"))
  SetStatus
  If iNb > 0 Then
    MsgBox "Effacement impossible, il reste " & iNb & " établissement(s) rattaché(s) à cette FEU.", vbExclamation, App.Title
    Exit Sub
  End If
  
' On garde la trace de la destruction
  Dim sMsgTrace As String
  JournalUnix sTable & " " & colChamps("feu_numfeu"), "détruit", sMsgTrace

  On Error Resume Next
  cFeu.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cFeu.MoveNext
  If cFeu.EOF Then
    cFeu.MovePrevious
    If cFeu.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  bdSél.ActiveMouvements iMode = meNavigate
  bdSél.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cFeu Is Nothing

  bdSél.ButtonEnabled("First") = cFeu.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cFeu.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cFeu.EOF
  bdSél.ButtonEnabled("Last") = Not cFeu.EOF
End Sub

Private Sub EmpêcheMouvements()
  bdSél.ButtonEnabled("First") = False
  bdSél.ButtonEnabled("Previous") = False
  bdSél.ButtonEnabled("Next") = False
  bdSél.ButtonEnabled("Last") = False
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cFeu.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cFeu.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cFeu.MoveNext
  AjusteMouvements
  If cFeu.EOF Then cFeu.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cFeu.MovePrevious
  AjusteMouvements
  If cFeu.BOF Then cFeu.MoveFirst
  SynchroniseFormulaire
End Sub


Private Sub btnInfoNiveaux_Click()
  FileShellExecute hWnd, "http://www.silliker/microbsoft/serveur/codes.htm"
End Sub


Private Sub btnEtbAttachés_Click()
  If IsNumeric(colChamps("feu_numfeu")) Then frmEtbAttachés.AfficheEtbAttachés CLng(colChamps("feu_numfeu"))
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


' ==============================================================================
' Interface clavier

Private Sub Form_Keypress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  Dim i As Integer
  
  If Not bExisteTable(sTable) Then
    MsgBox "La table '" & sTable & "' n'est pas présente dans la base de données courante, affichage impossible.", vbCritical, App.Title
    Unload Me
    Exit Sub
  End If
  
  ' On met les frames en tête de pile d'affichage, sinon certains sont derrière le tsTab
  Dim F As Frame
  For Each F In fraFeuille
    F.ZOrder 0
  Next
  
  ' Chargement des combos
  ' Combo Mode de transmission
  For i = 0 To 2
   bdcModeTrans(i).AddItem "T", "Téléphone"
   bdcModeTrans(i).AddItem "F", "Fax"
   bdcModeTrans(i).AddItem "D", "Tél+Fax"
   bdcModeTrans(i).AddItem "M", "Mail"
  Next

  ' Combo modèle de document de transmission :
  bdcTypeDoc.AddItem "R", "RA"
  bdcTypeDoc.AddItem "T", "Tableau"
  bdcTypeDoc.AddItem "A", "Autre"

  ' Combo formules
  bdcFormules.AddItem "", ""
  bdcFormules.AddItem "R>3m", ""
  bdcFormules.AddItem "R>10m", ""
  bdcFormules.AddItem "R>1000m", ""

  Show
  iCurFrame = -1   ' Pour forcer le passage à la page 0
  Page "Identification"

  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable sTable, colColonnes
    
    Dim c As Control
    Dim bRequired As Boolean
    Dim sNomCol As String
    Dim iErr As Long
    For Each c In Controls
      On Error Resume Next
      sNomCol = c.DataField
      iErr = Err
      On Error GoTo 0
      
      If iErr = 0 And sNomCol <> "" Then
        If Left(sNomCol, 1) = "*" Then
          bRequired = True
          c.DataField = Mid(sNomCol, 2)
        Else
          bRequired = False
        End If
        colChamps.Add c, c.DataField
        colColonnes(c.DataField).bRequired = bRequired
      End If
    Next
    On Error GoTo 0
  End If

  
  ' Pas de chargement des combos !
  
  
  ' Formulaire en mode initial
  Set cFeu = Nothing
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
  If Not cFeu Is Nothing Then cFeu.CloseCurseur
  MDIFEUetFME.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub

'=================================================================================

Private Sub SynchroniseFormulaire()
  If cFeu Is Nothing Then
    EffaceFormulaire
  ElseIf cFeu.BOF And cFeu.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cFeu.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cFeu.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    bdSél.NumRec = cFeu.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cFeu.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  bdSél.NumRec = ""
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
' Ligne d'aide

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub bdSél_GotFocus()
  SetStatus
End Sub


'=================================================================================
' Accès au Web

Public Sub FenêtreWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=feu"
End Sub


'=================================================================================
' Copie des données dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours…"
  BDCopieSélection cFeu, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


''=================================================================================
'' Impression
'
'Public Sub Imprime()
'  BDEtat sFinalSQL, drFEUDétaillée, True
'End Sub
'
'Public Sub Aperçu()
'  BDEtat sFinalSQL, drFEUDétaillée, False
'End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  DoEtat True
End Sub

Public Sub Aperçu()
  DoEtat False
End Sub

Private Sub DoEtat(ByVal bImpression As Boolean)
  Dim iChoix As Integer
  
  iChoix = frmMessageChoix.ChoixEtat("FEU (Édition des titres)", "FEU (Édition détaillée)")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
End Sub

Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String
  sSQL = "select * from feu where " & sFinalWP
  
  Select Case iChoix
    Case 1: BDEtat sSQL, drFEU, bImpression
    Case 2: BDEtat sSQL, drFEUDétaillée, bImpression
  End Select
End Sub

'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("feu_numfeu") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub

