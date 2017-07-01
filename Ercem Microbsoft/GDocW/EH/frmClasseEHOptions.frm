VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmClasseEHOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Options de la visite"
   ClientHeight    =   2940
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8985
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2940
   ScaleWidth      =   8985
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin GDOCW.BDCombo bdcLangue 
      Height          =   330
      Left            =   1980
      TabIndex        =   17
      Top             =   2220
      Width           =   1455
      _ExtentX        =   2566
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
   Begin VB.TextBox txtPersonne 
      Height          =   315
      Left            =   1980
      MaxLength       =   4
      TabIndex        =   11
      Tag             =   "Entrez le n° de personne. F4 pour une recherche."
      Top             =   1500
      Width           =   1080
   End
   Begin VB.TextBox txtNomPersonne 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   3480
      Locked          =   -1  'True
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   1500
      Width           =   5415
   End
   Begin VB.TextBox txtUnité 
      Height          =   315
      Left            =   1980
      MaxLength       =   4
      TabIndex        =   14
      Tag             =   "Entrez le n° d'unité. F4 pour une recherche."
      Top             =   1860
      Width           =   1080
   End
   Begin VB.TextBox txtNomUnité 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   3480
      Locked          =   -1  'True
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   1860
      Width           =   5415
   End
   Begin VB.CommandButton btnUtilisateur 
      Height          =   330
      Left            =   3120
      Picture         =   "frmClasseEHOptions.frx":0000
      Style           =   1  'Graphical
      TabIndex        =   19
      Tag             =   "Cliquer pour rechercher un code utilisateur."
      ToolTipText     =   "Cliquer pour rechercher un code utilisateur."
      Top             =   1500
      Width           =   315
   End
   Begin VB.CommandButton btnUnité 
      Height          =   330
      Left            =   3120
      Picture         =   "frmClasseEHOptions.frx":014A
      Style           =   1  'Graphical
      TabIndex        =   20
      Tag             =   "Cliquer pour rechercher un code unité."
      ToolTipText     =   "Cliquer pour rechercher un code unité."
      Top             =   1860
      Width           =   315
   End
   Begin GDOCW.ChampDate txtDateVisite 
      Height          =   315
      Left            =   1980
      TabIndex        =   9
      Top             =   1140
      Width           =   1095
      _ExtentX        =   1931
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
   Begin VB.CommandButton btnCalendrier 
      Height          =   330
      Left            =   3120
      Picture         =   "frmClasseEHOptions.frx":0294
      Style           =   1  'Graphical
      TabIndex        =   18
      Tag             =   "Cliquer pour sélectionner la date dans un calendrier."
      Top             =   1140
      Width           =   315
   End
   Begin VB.TextBox txtFormatVisite 
      Height          =   315
      Left            =   3240
      MaxLength       =   5
      TabIndex        =   7
      Top             =   720
      Width           =   735
   End
   Begin VB.TextBox txtOptionsVisite 
      Height          =   315
      Left            =   3240
      MaxLength       =   5
      TabIndex        =   4
      Top             =   360
      Width           =   735
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   7560
      TabIndex        =   23
      Top             =   1020
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   7560
      TabIndex        =   21
      Top             =   60
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   7560
      TabIndex        =   22
      Top             =   480
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   24
      Top             =   2625
      Width           =   8985
      _ExtentX        =   15849
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
   Begin VB.Label lblLangue 
      AutoSize        =   -1  'True
      Caption         =   "Langue d'édition :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   16
      Top             =   2280
      Width           =   1710
   End
   Begin VB.Label lblPersonne 
      AutoSize        =   -1  'True
      Caption         =   "&Personne :"
      Height          =   210
      Left            =   60
      TabIndex        =   10
      Top             =   1560
      Width           =   1035
   End
   Begin VB.Label lblUnité 
      AutoSize        =   -1  'True
      Caption         =   "&Unité :"
      Height          =   210
      Left            =   60
      TabIndex        =   13
      Top             =   1920
      Width           =   630
   End
   Begin VB.Label lblDate 
      AutoSize        =   -1  'True
      Caption         =   "&Date visite :"
      Height          =   210
      Left            =   60
      TabIndex        =   8
      Top             =   1200
      Width           =   1140
   End
   Begin VB.Label lblFormatDéfaut 
      BorderStyle     =   1  'Fixed Single
      Height          =   315
      Left            =   1980
      TabIndex        =   6
      Top             =   720
      Width           =   675
   End
   Begin VB.Label lblFormat 
      AutoSize        =   -1  'True
      Caption         =   "Format d'édition :"
      Height          =   210
      Left            =   60
      TabIndex        =   5
      Top             =   780
      Width           =   1665
   End
   Begin VB.Label lblOptionsDéfaut 
      BorderStyle     =   1  'Fixed Single
      Height          =   315
      Left            =   1980
      TabIndex        =   3
      Top             =   360
      Width           =   675
   End
   Begin VB.Label lblVisite 
      AutoSize        =   -1  'True
      Caption         =   "Visite"
      Height          =   210
      Left            =   3240
      TabIndex        =   1
      Top             =   60
      Width           =   510
   End
   Begin VB.Label lblParDéfaut 
      AutoSize        =   -1  'True
      Caption         =   "Par défaut"
      Height          =   210
      Left            =   1980
      TabIndex        =   0
      Top             =   60
      Width           =   990
   End
   Begin VB.Label lblOptions 
      AutoSize        =   -1  'True
      Caption         =   "Options :"
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Top             =   420
      Width           =   870
   End
End
Attribute VB_Name = "frmClasseEHOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmClasseEHOptions
' Saisie des options d'une visite

Option Explicit

Private bOk As Boolean

' point d'entrée
Public Sub DoEHOptions(e As EHDefGrille, v As EHVisite)
  bOk = False
  
  lblOptionsDéfaut = e.sOptionsScénario
  lblFormatDéfaut = e.iFormatScénario
  txtOptionsVisite = v.sOptions
  txtFormatVisite = v.iFormat
  txtDateVisite.DateSaisie = v.dDateVisite
  txtPersonne = v.iPers
  txtUnité = v.iCP
  bdcLangue = v.cLangueED
  
  Show vbModal
  
  If bOk Then   ' Données validées
    v.sOptions = txtOptionsVisite
    v.iFormat = CInt(txtFormatVisite)
    v.dDateVisite = txtDateVisite.DateSaisie
    v.iPers = CInt(txtPersonne)
    v.iCP = CInt(txtUnité)
    v.cLangueED = bdcLangue
  End If
  Unload Me
End Sub

Private Sub btnAnnuler_Click()
  Hide
End Sub

Private Sub btnOK_Click()
  If Not IsDate(txtDateVisite.DateSaisie) Then
    MsgBox "date invalide"
    Exit Sub
  End If
  
  If Not IsNumeric(txtPersonne) Then
    MsgBox "code personne invalide"
    Exit Sub
  End If
  
  bOk = True
  Hide
End Sub
