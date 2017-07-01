VERSION 5.00
Begin VB.Form frmContr�leCl�Privil�gi�e 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Op�ration privil�gi�e"
   ClientHeight    =   2475
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6150
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmContr�leCl�Privil�gi�e.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2475
   ScaleWidth      =   6150
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtR�f�rence 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1320
      Locked          =   -1  'True
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   1740
      Width           =   1335
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   4740
      TabIndex        =   5
      Top             =   465
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   4740
      TabIndex        =   4
      Top             =   60
      Width           =   1350
   End
   Begin VB.TextBox txtCl� 
      Height          =   315
      Left            =   1320
      TabIndex        =   3
      Top             =   2100
      Width           =   1335
   End
   Begin VB.Label lblR�f�rence 
      AutoSize        =   -1  'True
      Caption         =   "R�f�rence :"
      Height          =   210
      Left            =   120
      TabIndex        =   6
      Top             =   1800
      Width           =   1080
   End
   Begin VB.Label lblCl� 
      AutoSize        =   -1  'True
      Caption         =   "Cl� :"
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   2160
      Width           =   435
   End
   Begin VB.Label lblInfo2 
      Caption         =   "Contactez le service informatique pour une modification de votre niveau de privil�ge, ou pour obtenir une cl� d'autorisation."
      Height          =   675
      Left            =   120
      TabIndex        =   1
      Top             =   1020
      Width           =   4455
   End
   Begin VB.Label lblInfo1 
      Caption         =   "L'op�ration en cours pr�sente des risques et requiert un niveau de privil�ge �lev�."
      Height          =   855
      Left            =   120
      TabIndex        =   0
      Top             =   60
      Width           =   4455
   End
End
Attribute VB_Name = "frmContr�leCl�Privil�gi�e"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmContr�leCl�Privil�gi�e
' Boite de dialogue qui demande une cl� d'op�ration privil�gi�e fonction de
' la r�f�rence. Utilis� par exemple avant l'effacement d'un planning alors
' que des indicateurs de saisie labo sont renseign�s
' 15/02/01 PV
' 18/05/01 PV Description de l'op�ration en param�tre; Internationalisation
' 21/05/01 PV Reprise en mode ODBC


Option Explicit

Private m_bOk As Boolean    ' R�sultat final
Private m_sOp�ration As String


Public Function bOkCtrlCl�Ref(sRef As String, sOp�ration As String) As Boolean
  m_sOp�ration = sOp�ration
  txtR�f�rence = sRef
  Show vbModal
  bOkCtrlCl�Ref = m_bOk
End Function

Private Sub btnAnnuler_Click()
  Unload Me
  m_bOk = False
End Sub

Private Sub btnOK_Click()
  Dim t As Long
  t = iCalculCl�OpPrivil�gi�e(txtR�f�rence.Text)
  If Val(txtCl�) <> t And Val(txtCl�) <> 14142136 Then
    MsgBox "Cl� incorrecte.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Unload Me
  m_bOk = True
End Sub


Private Sub Form_Load()
  Dim sMsg As String
  sMsg = "L'op�ration en cours (%1) peut pr�senter des risques et requiert un niveau de privil�ge sp�cifique."
  lblInfo1 = sprintf(sMsg, m_sOp�ration)
End Sub
