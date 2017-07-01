VERSION 5.00
Begin VB.Form frmInternational 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "International"
   ClientHeight    =   2745
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4710
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmInternational.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2745
   ScaleWidth      =   4710
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtLangueActuelle 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2280
      Locked          =   -1  'True
      TabIndex        =   10
      TabStop         =   0   'False
      Top             =   1860
      Width           =   2355
   End
   Begin VB.CommandButton btnVolapük 
      Caption         =   "Volapük"
      Height          =   330
      Left            =   1080
      TabIndex        =   8
      Tag             =   "-"
      Top             =   2340
      Visible         =   0   'False
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   1860
      TabIndex        =   7
      Top             =   2340
      Width           =   1350
   End
   Begin VB.Frame fraLangues 
      Caption         =   "Choisissez une langue :"
      Height          =   1755
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   4575
      Begin VB.CommandButton cmdLangue 
         Caption         =   "Nederlands"
         Height          =   330
         Index           =   5
         Left            =   3000
         TabIndex        =   6
         Tag             =   "H"
         Top             =   1260
         Width           =   1350
      End
      Begin VB.CommandButton cmdLangue 
         Caption         =   "Espanol"
         Height          =   330
         Index           =   4
         Left            =   3000
         TabIndex        =   5
         Tag             =   "E"
         Top             =   780
         Width           =   1350
      End
      Begin VB.CommandButton cmdLangue 
         Caption         =   "Italiano"
         Height          =   330
         Index           =   3
         Left            =   3000
         TabIndex        =   4
         Tag             =   "I"
         Top             =   300
         Width           =   1350
      End
      Begin VB.CommandButton cmdLangue 
         Caption         =   "Deutsch"
         Height          =   330
         Index           =   2
         Left            =   840
         TabIndex        =   3
         Tag             =   "D"
         Top             =   1260
         Width           =   1350
      End
      Begin VB.CommandButton cmdLangue 
         Caption         =   "Francais"
         Height          =   330
         Index           =   1
         Left            =   840
         TabIndex        =   2
         Tag             =   "F"
         Top             =   780
         Width           =   1350
      End
      Begin VB.CommandButton cmdLangue 
         Caption         =   "English"
         Height          =   330
         Index           =   0
         Left            =   840
         TabIndex        =   1
         Tag             =   "A"
         Top             =   300
         Width           =   1350
      End
      Begin VB.Image Image 
         Height          =   480
         Index           =   5
         Left            =   2460
         Picture         =   "frmInternational.frx":014A
         Top             =   1200
         Width           =   480
      End
      Begin VB.Image Image 
         Height          =   480
         Index           =   4
         Left            =   2460
         Picture         =   "frmInternational.frx":058C
         Top             =   720
         Width           =   480
      End
      Begin VB.Image Image 
         Height          =   480
         Index           =   3
         Left            =   2460
         Picture         =   "frmInternational.frx":0896
         Top             =   240
         Width           =   480
      End
      Begin VB.Image Image 
         Height          =   480
         Index           =   2
         Left            =   300
         Picture         =   "frmInternational.frx":0BA0
         Top             =   1200
         Width           =   480
      End
      Begin VB.Image Image 
         Height          =   480
         Index           =   1
         Left            =   300
         Picture         =   "frmInternational.frx":0EAA
         Top             =   720
         Width           =   480
      End
      Begin VB.Image Image 
         Height          =   480
         Index           =   0
         Left            =   300
         Picture         =   "frmInternational.frx":11B4
         Top             =   240
         Width           =   480
      End
   End
   Begin VB.Label lblLangueActuelle 
      AutoSize        =   -1  'True
      Caption         =   "Langue actuelle :"
      Height          =   210
      Left            =   120
      TabIndex        =   9
      Top             =   1920
      Width           =   1635
   End
End
Attribute VB_Name = "frmInternational"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmInternational
' Choix d'une langue d'interface pour les applis ODBC
' 07/07/1999 PV


Option Explicit

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnVolapük_Click()
  IntlChangelangue "-"
  Unload Me
End Sub

Private Sub cmdLangue_Click(Index As Integer)
  IntlChangelangue cmdLangue(Index).Tag
  Unload Me
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = 16 Then   ' Shift
    btnAnnuler.Left = 2520
    btnVolapük.Visible = True
  End If
End Sub

Private Sub Form_Load()
  'Internationalisation
  
  txtLangueActuelle = cLangage
  Dim b As CommandButton
  For Each b In cmdLangue
    If b.Tag = cLangage Then txtLangueActuelle = b.Caption
  Next
End Sub


' ============================================================================
' Internationalisation

'Public Sub Internationalisation()
'  SetLib Me, "Caption", "INCaption"
'
'  SetLib btnAnnuler, "Caption", "btnAnnuler"
'
'  SetLib fraLangues, "Caption", "INfraLangues"
'  SetLib lblLangueActuelle, "Caption", "INlblLangueAct"
'
'  SetLib cmdLangue(0), "Caption", "lan_A"
'  SetLib cmdLangue(1), "Caption", "lan_F"
'  SetLib cmdLangue(2), "Caption", "lan_D"
'  SetLib cmdLangue(3), "Caption", "lan_I"
'  SetLib cmdLangue(4), "Caption", "lan_E"
'  SetLib cmdLangue(5), "Caption", "lan_H"
'End Sub

