VERSION 5.00
Begin VB.Form frmVersionRécente 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Version plus récente"
   ClientHeight    =   3600
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6360
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmVersionRécente.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3600
   ScaleWidth      =   6360
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnOk 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   2580
      TabIndex        =   0
      Top             =   3060
      Width           =   1350
   End
   Begin VB.Label lblVersionZ 
      Caption         =   "VersionZ"
      Height          =   285
      Left            =   4380
      TabIndex        =   13
      Top             =   2520
      Width           =   1425
   End
   Begin VB.Label lblVersionLocale 
      Caption         =   "VersionLocale"
      Height          =   285
      Left            =   2460
      TabIndex        =   12
      Top             =   2520
      Width           =   1425
   End
   Begin VB.Label lblVersionProg 
      Caption         =   "Version :"
      Height          =   285
      Left            =   240
      TabIndex        =   11
      Top             =   2520
      Width           =   2025
   End
   Begin VB.Line Line1 
      Index           =   4
      X1              =   120
      X2              =   6240
      Y1              =   2820
      Y2              =   2820
   End
   Begin VB.Line Line2 
      Index           =   3
      X1              =   6240
      X2              =   6240
      Y1              =   2820
      Y2              =   1200
   End
   Begin VB.Line Line2 
      Index           =   2
      X1              =   4260
      X2              =   4260
      Y1              =   2820
      Y2              =   1200
   End
   Begin VB.Line Line1 
      Index           =   3
      X1              =   2340
      X2              =   6240
      Y1              =   1200
      Y2              =   1200
   End
   Begin VB.Line Line2 
      Index           =   1
      X1              =   2340
      X2              =   2340
      Y1              =   2820
      Y2              =   1200
   End
   Begin VB.Line Line2 
      Index           =   0
      X1              =   120
      X2              =   120
      Y1              =   2820
      Y2              =   1560
   End
   Begin VB.Line Line1 
      Index           =   2
      X1              =   120
      X2              =   6240
      Y1              =   2460
      Y2              =   2460
   End
   Begin VB.Line Line1 
      Index           =   1
      X1              =   120
      X2              =   6240
      Y1              =   1560
      Y2              =   1560
   End
   Begin VB.Line Line1 
      Index           =   0
      X1              =   120
      X2              =   6240
      Y1              =   1920
      Y2              =   1920
   End
   Begin VB.Label lblDateZ 
      Caption         =   "DateZ"
      Height          =   465
      Left            =   4380
      TabIndex        =   10
      Top             =   1980
      Width           =   1485
   End
   Begin VB.Label lblDateLocale 
      Caption         =   "DateLocale"
      Height          =   465
      Left            =   2460
      TabIndex        =   9
      Top             =   1980
      Width           =   1485
   End
   Begin VB.Label lblTailleZ 
      Caption         =   "TailleZ"
      Height          =   285
      Left            =   4380
      TabIndex        =   8
      Top             =   1620
      Width           =   1425
   End
   Begin VB.Label lblTailleLocale 
      Caption         =   "TailleLocale"
      Height          =   285
      Left            =   2460
      TabIndex        =   7
      Top             =   1620
      Width           =   1425
   End
   Begin VB.Label lblSurZ 
      Caption         =   "Sur Z:"
      Height          =   285
      Left            =   4380
      TabIndex        =   6
      Top             =   1260
      Width           =   705
   End
   Begin VB.Label lblLocal 
      Caption         =   "Local"
      Height          =   285
      Left            =   2460
      TabIndex        =   5
      Top             =   1260
      Width           =   705
   End
   Begin VB.Label lblDateProg 
      Caption         =   "Date programmes :"
      Height          =   285
      Left            =   240
      TabIndex        =   4
      Top             =   1980
      Width           =   1965
   End
   Begin VB.Label lblTailleProg 
      Caption         =   "Taille programmes :"
      Height          =   285
      Left            =   240
      TabIndex        =   3
      Top             =   1620
      Width           =   1965
   End
   Begin VB.Label lblLibellé2 
      Caption         =   "Il est fortement conseillé de quitter, et de faire une mise à jour des programmes."
      Height          =   465
      Left            =   120
      TabIndex        =   2
      Top             =   660
      Width           =   6165
   End
   Begin VB.Label lblLibellé1 
      Caption         =   "Attention ! Il semble que la version du programme installé sur cette machine n'est pas la dernière version disponible."
      Height          =   450
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   6150
   End
End
Attribute VB_Name = "frmVersionRécente"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmVersionRécente
' Affiche un message exiplite si le programme détecte que la version sur sSysDisk
' est plus récente
' 10/09/1998 PV
' 27/01/1999 NC Internationalisation


Option Explicit

Private Sub btnOk_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  Internationalisation
End Sub


'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "VRCaption"
  
  SetLib btnOK, "Caption", "btnOK"
   
  SetLib lblLibellé1, "Caption", "VRlblLibellé1"
  SetLib lblLibellé2, "Caption", "VRlblLibellé2"
  SetLib lblLocal, "Caption", "VRlblLocal"
  SetLib lblSurZ, "Caption", "VRlblSurZ"
  SetLib lblTailleProg, "Caption", "VRlblTailleProg"
  SetLib lblDateProg, "Caption", "VRlblDateProg"
  SetLib lblVersionProg, "Caption", "VRlblVersionProg"
End Sub

