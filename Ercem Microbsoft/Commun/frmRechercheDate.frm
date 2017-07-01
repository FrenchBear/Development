VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form frmRechercheDate 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Recherche de date"
   ClientHeight    =   2505
   ClientLeft      =   2460
   ClientTop       =   2775
   ClientWidth     =   4170
   Icon            =   "frmRechercheDate.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2505
   ScaleWidth      =   4170
   ShowInTaskbar   =   0   'False
   Begin MSComCtl2.MonthView calendrier 
      Height          =   2370
      Left            =   60
      TabIndex        =   4
      Top             =   60
      Width           =   2595
      _ExtentX        =   4577
      _ExtentY        =   4180
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      Appearance      =   1
      StartOfWeek     =   24641538
      CurrentDate     =   36108
      MaxDate         =   37256
      MinDate         =   35065
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   2760
      TabIndex        =   3
      Top             =   1020
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   2760
      TabIndex        =   1
      Top             =   480
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   2760
      TabIndex        =   0
      Top             =   60
      Width           =   1350
   End
   Begin VB.Label lblRésultat 
      Height          =   195
      Left            =   2820
      TabIndex        =   2
      Top             =   1920
      Visible         =   0   'False
      Width           =   915
   End
End
Attribute VB_Name = "frmRechercheDate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille de sélection de date via le calendrier ActiveX d'Access"
' frmRechercheDate
' Feuille de sélection de date via le calendrier ActiveX d'Access
' Novembre 96 PV
'  9/11/1998 PV  Calendrier common control VB6
' 11/01/1999 PV  Recherche multiple de dates dans cherche
' 25/01/1999 PV  Internationalisation


Option Explicit

Private Sub btnAide_Click()
  Aide "frmchdat"
End Sub

Function Cherche(txtDateDéfaut As String, Optional bPlageAutorisée As Boolean = False) As String
  If IsDate(txtDateDéfaut) Then
    calendrier = Format(txtDateDéfaut, "short date")
  Else
    calendrier = Format(Now, "short date")
  End If
  calendrier.MultiSelect = bPlageAutorisée
  Show vbModal
  Cherche = lblRésultat
  Unload Me
End Function

Private Sub btnAnnuler_Click()
  lblRésultat = ""
  Hide
End Sub

Private Sub btnOk_Click()
  If calendrier.SelStart = calendrier.SelEnd Then
    lblRésultat = Format(calendrier, "short date")
  Else
    lblRésultat = Format(calendrier.SelStart, "short date") & ":" & Format(calendrier.SelEnd, "short date")
  End If
  Hide
End Sub

Private Sub calendrier_DblClick()
  btnOk_Click
End Sub

Private Sub Form_Load()
  Internationalisation
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  lblRésultat = ""
End Sub




' ============================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "RDCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
End Sub

