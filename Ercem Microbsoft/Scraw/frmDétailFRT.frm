VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmDétailFRT 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Détail FRT"
   ClientHeight    =   3570
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6390
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmDétailFRT.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3570
   ScaleWidth      =   6390
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtTimestamp 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1440
      Locked          =   -1  'True
      TabIndex        =   15
      TabStop         =   0   'False
      Tag             =   "200"
      Top             =   480
      Width           =   1995
   End
   Begin VB.Frame fraCréation 
      Caption         =   "Création"
      Height          =   1035
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   4755
      Begin VB.TextBox txtDateSais 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   600
         Locked          =   -1  'True
         TabIndex        =   7
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   600
         Width           =   2175
      End
      Begin VB.TextBox txtNomOperSais 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1260
         Locked          =   -1  'True
         TabIndex        =   5
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   240
         Width           =   3375
      End
      Begin VB.TextBox txtOperSais 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   600
         Locked          =   -1  'True
         TabIndex        =   4
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   240
         Width           =   615
      End
      Begin VB.Label lblLe1 
         AutoSize        =   -1  'True
         Caption         =   "Le :"
         Height          =   210
         Left            =   60
         TabIndex        =   6
         Tag             =   "204"
         Top             =   660
         Width           =   360
      End
      Begin VB.Label lblPar1 
         AutoSize        =   -1  'True
         Caption         =   "Par :"
         Height          =   210
         Left            =   60
         TabIndex        =   3
         Tag             =   "204"
         Top             =   300
         Width           =   450
      End
   End
   Begin VB.Frame fraDerImp 
      Caption         =   "Dernière impression"
      Height          =   1035
      Left            =   60
      TabIndex        =   8
      Top             =   2100
      Width           =   4755
      Begin VB.TextBox txtDateImpr 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   600
         Locked          =   -1  'True
         TabIndex        =   13
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   600
         Width           =   2175
      End
      Begin VB.TextBox txtNomOperImpr 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   1260
         Locked          =   -1  'True
         TabIndex        =   11
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   240
         Width           =   3375
      End
      Begin VB.TextBox txtOperImpr 
         BackColor       =   &H8000000F&
         Height          =   315
         Left            =   600
         Locked          =   -1  'True
         TabIndex        =   10
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   240
         Width           =   615
      End
      Begin VB.Label lblLe2 
         AutoSize        =   -1  'True
         Caption         =   "Le :"
         Height          =   210
         Left            =   60
         TabIndex        =   12
         Tag             =   "204"
         Top             =   660
         Width           =   360
      End
      Begin VB.Label lblPar2 
         AutoSize        =   -1  'True
         Caption         =   "Par :"
         Height          =   210
         Left            =   60
         TabIndex        =   9
         Tag             =   "204"
         Top             =   300
         Width           =   450
      End
   End
   Begin VB.CommandButton btnImprimer 
      Caption         =   "Imprimer"
      Default         =   -1  'True
      Height          =   330
      Left            =   4980
      TabIndex        =   17
      Top             =   60
      Width           =   1350
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   4980
      TabIndex        =   19
      Tag             =   "Affiche l'aide sur cette boîte de dialogue."
      Top             =   1020
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   4980
      TabIndex        =   18
      Tag             =   "Valide l'opération."
      Top             =   480
      Width           =   1350
   End
   Begin VB.TextBox txtNumFRT 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1440
      Locked          =   -1  'True
      TabIndex        =   1
      TabStop         =   0   'False
      Tag             =   "200"
      Top             =   120
      Width           =   795
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   16
      Top             =   3255
      Width           =   6390
      _ExtentX        =   11271
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
   Begin VB.Label lblTimestamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Left            =   60
      TabIndex        =   14
      Tag             =   "204"
      Top             =   540
      Width           =   1155
   End
   Begin VB.Label lblNoFRT 
      AutoSize        =   -1  'True
      Caption         =   "N° FRT :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Tag             =   "204"
      Top             =   180
      Width           =   765
   End
End
Attribute VB_Name = "frmDétailFRT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmDétailFRT
' Affiche les infos détaillées sur une FRT
' 14/05/1998 PV
' 01/02/1999 NC Internationalisation


Option Explicit


Public Sub Affiche(ByVal iNumFRT)
  If iNumFRT > 0 Then
    If bDoLecture(iNumFRT) Then Show vbModal
  End If
End Sub

Private Function bDoLecture(ByVal iNumFRT As Long) As Boolean
  Dim f As frt
  
  Set f = LitFRT(iNumFRT)
  If f Is Nothing Then
    bDoLecture = False
    MsgBox2i "CR280"
    'MsgBox "N° de FRT inexistant, incorrect ou trop ancien.", vbExclamation, sNomApp
    Exit Function
  End If
  
  txtNumFRT = f.indice
  txtOperSais = f.opersais
  txtNomOperSais = sNomUtilisateur(f.opersais)
  txtDateSais = f.datesais
  txtOperImpr = NV(f.operimpr)
  txtNomOperImpr = sNomUtilisateur(f.operimpr)
  txtDateImpr = NV(f.tsimpr)
  txtTimestamp = f.timestamp
  bDoLecture = True
End Function

' ===================================================
' Boutons

Private Sub btnAide_Click()
  Aide "frmdetfrt"
End Sub

Private Sub btnImprimer_Click()
  If IsNumeric(txtNumFRT) Then
    frmRecherche.DoImprimeFRT Val(txtNumFRT)
    bDoLecture Val(txtNumFRT)
  End If
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub


' ============================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "FRCaption"
  
  SetLib btnImprimer, "Caption", "btnImprimer"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib lblNoFRT, "Caption", "FRlblNoFRT"
  SetLib lblTimestamp, "Caption", "FRlblTimestamp"
  SetLib fraCréation, "Caption", "FRfraCréation"
  SetLib lblPar1, "Caption", "FRlblPar1"
  SetLib lblLe1, "Caption", "FRlblLe1"
  SetLib fraDerImp, "Caption", "FRfraDerImp"
  SetLib lblPar2, "Caption", "FRlblPar1"
  SetLib lblLe2, "Caption", "FRlblLe1"
  
End Sub

Private Sub Form_Load()
   
   Internationalisation
  
End Sub
