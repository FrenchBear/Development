VERSION 5.00
Begin VB.Form frmTest 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Test champs"
   ClientHeight    =   2970
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4290
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2970
   ScaleWidth      =   4290
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnSet 
      Caption         =   "&Set"
      Height          =   375
      Left            =   2940
      TabIndex        =   25
      Top             =   2520
      Width           =   975
   End
   Begin prjTest.ChampTempérature ChampTempérature1 
      Height          =   315
      Left            =   2880
      TabIndex        =   2
      Top             =   300
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
   Begin prjTest.ChampHeure ChampHeure1 
      Height          =   315
      Left            =   1800
      TabIndex        =   1
      Top             =   300
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
   Begin VB.CommandButton Command1 
      Caption         =   "&Test"
      Default         =   -1  'True
      Height          =   375
      Left            =   1560
      TabIndex        =   9
      Top             =   2520
      Width           =   1215
   End
   Begin prjTest.ChampDate ChampDate1 
      Height          =   315
      Left            =   420
      TabIndex        =   0
      Top             =   300
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
      SaisieAssistée  =   "ABSENCE=1/1/1980;SOUFFRANCE=1/1/2030"
   End
   Begin prjTest.ChampDate ChampDate2 
      Height          =   315
      Left            =   420
      TabIndex        =   3
      Top             =   1020
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
      SaisieAssistée  =   "ABSENCE=1/1/1980;PIERRE=26/2/65;PAPA=17/2/1932;JACQUES=8/2/69"
   End
   Begin prjTest.ChampDate ChampDate3 
      Height          =   315
      Left            =   420
      TabIndex        =   6
      Top             =   1740
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
      SaisieAssistée  =   ""
   End
   Begin prjTest.ChampHeure ChampHeure2 
      Height          =   315
      Left            =   1800
      TabIndex        =   4
      Top             =   1020
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
   Begin prjTest.ChampHeure ChampHeure3 
      Height          =   315
      Left            =   1800
      TabIndex        =   7
      Top             =   1740
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
   Begin prjTest.ChampTempérature ChampTempérature2 
      Height          =   315
      Left            =   2880
      TabIndex        =   5
      Top             =   1020
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
   Begin prjTest.ChampTempérature ChampTempérature3 
      Height          =   315
      Left            =   2880
      TabIndex        =   8
      Top             =   1740
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
   Begin VB.Label lblTempérature 
      Caption         =   "Température3"
      Height          =   255
      Index           =   3
      Left            =   2880
      TabIndex        =   24
      Top             =   2100
      Width           =   1035
   End
   Begin VB.Label lblTempérature 
      Caption         =   "Température2"
      Height          =   255
      Index           =   2
      Left            =   2880
      TabIndex        =   23
      Top             =   1380
      Width           =   1035
   End
   Begin VB.Label lblTempérature 
      Caption         =   "Température1"
      Height          =   255
      Index           =   1
      Left            =   2880
      TabIndex        =   22
      Top             =   660
      Width           =   1035
   End
   Begin VB.Label lblHeure 
      Caption         =   "Heure3"
      Height          =   255
      Index           =   3
      Left            =   1800
      TabIndex        =   21
      Top             =   2100
      Width           =   1035
   End
   Begin VB.Label lblHeure 
      Caption         =   "Heure2"
      Height          =   255
      Index           =   2
      Left            =   1800
      TabIndex        =   20
      Top             =   1380
      Width           =   1035
   End
   Begin VB.Label lblHeure 
      Caption         =   "Heure1"
      Height          =   255
      Index           =   1
      Left            =   1800
      TabIndex        =   19
      Top             =   660
      Width           =   1035
   End
   Begin VB.Label lblDate 
      Caption         =   "Date3"
      Height          =   255
      Index           =   3
      Left            =   420
      TabIndex        =   18
      Top             =   2100
      Width           =   1335
   End
   Begin VB.Label lblDate 
      Caption         =   "Date2"
      Height          =   255
      Index           =   2
      Left            =   420
      TabIndex        =   17
      Top             =   1380
      Width           =   1335
   End
   Begin VB.Label lblDate 
      Caption         =   "Date1"
      Height          =   255
      Index           =   1
      Left            =   420
      TabIndex        =   16
      Top             =   660
      Width           =   1335
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "Température"
      Height          =   195
      Left            =   2940
      TabIndex        =   15
      Top             =   60
      Width           =   900
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Heure"
      Height          =   195
      Left            =   2100
      TabIndex        =   14
      Top             =   60
      Width           =   435
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Date"
      Height          =   195
      Left            =   840
      TabIndex        =   13
      Top             =   60
      Width           =   345
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "3:"
      Height          =   195
      Left            =   240
      TabIndex        =   12
      Top             =   1800
      Width           =   135
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "2:"
      Height          =   195
      Left            =   240
      TabIndex        =   11
      Top             =   1080
      Width           =   135
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "1:"
      Height          =   195
      Left            =   240
      TabIndex        =   10
      Top             =   360
      Width           =   135
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTest
' Test des trois champs
'  4/12/1997 PV Mise en forme propre
' 19/04/1998 PV Labels

Option Explicit

Private Sub btnSet_Click()
  ChampDate1.DateSaisie = "ABSENCE"
  ChampDate2.DateSaisie = #2/26/65#
  ChampDate3.DateSaisie = "POMME"
End Sub

Private Sub Command1_Click()
  Test "ChampDate1", ChampDate1.DateSaisie, lblDate(1)
  Test "ChampDate2", ChampDate2.DateSaisie, lblDate(2)
  Test "ChampDate3", ChampDate3.DateSaisie, lblDate(3)
  Test "ChampHeure1", ChampHeure1.HeureSaisie, lblHeure(1)
  Test "ChampHeure2", ChampHeure2.HeureSaisie, lblHeure(2)
  Test "ChampHeure3", ChampHeure3.HeureSaisie, lblHeure(3)
  Test "ChampTempérature1", ChampTempérature1.Température, lblTempérature(1)
  Test "ChampTempérature2", ChampTempérature2.Température, lblTempérature(2)
  Test "ChampTempérature3", ChampTempérature3.Température, lblTempérature(3)
End Sub

Sub Test(sNom As String, v, c As Label)
  c = v
  If v = "ERR" Then
    MsgBox "Erreur " & sNom
  End If
End Sub

Private Sub lblDate1_Click()

End Sub
