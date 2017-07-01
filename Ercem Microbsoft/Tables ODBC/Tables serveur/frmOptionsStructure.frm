VERSION 5.00
Begin VB.Form frmOptionsStructure 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Options d'impression de la structure"
   ClientHeight    =   1080
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4860
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmOptionsStructure.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1080
   ScaleWidth      =   4860
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   3360
      TabIndex        =   4
      Top             =   540
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   3360
      TabIndex        =   3
      Top             =   120
      Width           =   1350
   End
   Begin VB.Frame fraDétail 
      Caption         =   "Options de détail"
      Height          =   915
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   2895
      Begin VB.OptionButton optGrilles 
         Caption         =   "&Grilles EH"
         Height          =   210
         Left            =   120
         TabIndex        =   2
         Top             =   540
         Width           =   1395
      End
      Begin VB.OptionButton optPrestation 
         Caption         =   "&Prestation"
         Height          =   210
         Left            =   120
         TabIndex        =   1
         Top             =   300
         Width           =   1515
      End
   End
End
Attribute VB_Name = "frmOptionsStructure"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmOptionsStructure
' 19/11/1999 PV
' 25/11/1999 PV Option tarifs
'  2/08/2001 PV Fin de l'option tarifs, et du choix Ercem/Fimebio


Option Explicit

Private g_iDétail As Integer


Public Sub Options(ByRef iDétail As Integer)
  g_iDétail = 0
  Show vbModal
  iDétail = g_iDétail
End Sub


Private Sub btnAnnuler_Click()
  Unload Me
End Sub


Private Sub btnOK_Click()
  If optPrestation Then g_iDétail = 1
  If optGrilles Then g_iDétail = 2
  
  Unload Me
End Sub


Private Sub optGrilles_DblClick()
  btnOK_Click
End Sub

Private Sub optPrestation_DblClick()
  btnOK_Click
End Sub

