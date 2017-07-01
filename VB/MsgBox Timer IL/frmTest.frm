VERSION 5.00
Begin VB.Form frmTest 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Test frmMsgBoxTimer"
   ClientHeight    =   3015
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4695
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
   ScaleHeight     =   3015
   ScaleWidth      =   4695
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtDurée 
      Height          =   315
      Left            =   1140
      TabIndex        =   5
      Text            =   "1"
      Top             =   2640
      Width           =   495
   End
   Begin VB.TextBox txtMsg 
      Height          =   1275
      Left            =   1140
      MultiLine       =   -1  'True
      TabIndex        =   3
      Top             =   1260
      Width           =   3495
   End
   Begin VB.ListBox lstIcônes 
      Height          =   1110
      Left            =   1140
      TabIndex        =   1
      Top             =   60
      Width           =   1335
   End
   Begin VB.CommandButton btnMsgBox 
      Caption         =   "MsgBox"
      Height          =   330
      Left            =   3120
      TabIndex        =   7
      Top             =   540
      Width           =   1500
   End
   Begin VB.CommandButton btnMsgBoxTimer 
      Caption         =   "MsgBoxTimer"
      Default         =   -1  'True
      Height          =   330
      Left            =   3120
      TabIndex        =   6
      Top             =   120
      Width           =   1500
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Durée :"
      Height          =   210
      Left            =   60
      TabIndex        =   4
      Top             =   2700
      Width           =   705
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Message :"
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Top             =   1260
      Width           =   975
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Icône :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   660
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const sTitre As String = "Test"

Private Sub btnMsgBox_Click()
  MsgBox txtMsg, lstIcônes.ItemData(lstIcônes.ListIndex), sTitre
End Sub

Private Sub btnMsgBoxTimer_Click()
  frmMsgBoxTimer.MsgBoxTimer txtMsg, lstIcônes.ItemData(lstIcônes.ListIndex), sTitre, txtDurée
End Sub

Private Sub Form_Load()
  AddIcon "vbCritical", vbCritical
  AddIcon "vbQuestion", vbQuestion
  AddIcon "vbExclamation", vbExclamation
  AddIcon "vbInformation", vbInformation
  AddIcon "(aucun)", 0
  lstIcônes.ListIndex = 0
  
  txtMsg = "Ce programme fonctionne déjà." & vbCrLf & vbCrLf & "Vous ne pouvez lancer qu'une seule copie du programme à la fois."
End Sub


Private Sub AddIcon(sNom As String, iVal As VbMsgBoxStyle)
  lstIcônes.AddItem sNom
  lstIcônes.ItemData(lstIcônes.NewIndex) = iVal
End Sub
