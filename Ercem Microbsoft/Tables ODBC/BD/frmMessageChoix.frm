VERSION 5.00
Begin VB.Form frmMessageChoix 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Choix"
   ClientHeight    =   2925
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4335
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmMessageChoix.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2925
   ScaleWidth      =   4335
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   60
      TabIndex        =   2
      Top             =   1200
      Width           =   1350
   End
   Begin VB.CommandButton btnChoix 
      Caption         =   "0"
      Height          =   315
      Index           =   0
      Left            =   60
      TabIndex        =   1
      Top             =   840
      Visible         =   0   'False
      Width           =   315
   End
   Begin VB.Label lblChoix 
      Caption         =   "Choix"
      Height          =   255
      Index           =   0
      Left            =   480
      TabIndex        =   3
      Top             =   900
      Visible         =   0   'False
      Width           =   3735
   End
   Begin VB.Label lblTexteT�te 
      Caption         =   "Texte d'en-t�te"
      Height          =   615
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   4155
   End
End
Attribute VB_Name = "frmMessageChoix"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmMessageChoix
' Fen�tre g�n�rique de choix d'un �tat parmi plusieurs
' 18/05/1999 PV
' 25/11/1999 PV Nouvelle pr�sentation
' 20/04/2000 PV Fonction g�n�rique de choix (Choix)

Option Explicit

Private iRet As Integer


Function ChoixEtat(ParamArray tChoix()) As Integer
  ChoixEtat = Choix("Choix de l'�tat", "Il existe plusieurs �tats diff�rents pour imprimer les enregistrements s�lectionn�s. Choisissez le type d'�tat souhait�.", tChoix)
End Function


' Retour 0 pour annuler, 1 pour le premier choix, �
Function Choix(sTitre As String, sTexteT�te As String, ParamArray tChoixP()) As Integer
  Dim i As Integer
  Dim sChoix
  Dim tChoix As Variant
  On Error GoTo 0
  
  
  If VarType(tChoixP(0)) > vbArray Then
    tChoix = tChoixP(0)     ' Appel depuis ChoixEtat, on ne peut pas passer un ParamArray en param�tre...
  Else
    tChoix = tChoixP
  End If
  
  Caption = sTitre
  lblTexteT�te = sTexteT�te
  
  i = 0
  For Each sChoix In tChoix
    i = i + 1
    Load lblChoix(i)
    Load btnChoix(i)
    With btnChoix(i)
      .Caption = "&" & i
      .Top = btnChoix(0).Top + (i - 1) * 420
      .Visible = True
    End With
    With lblChoix(i)
      .Caption = sChoix
      .Top = lblChoix(0).Top + (i - 1) * 420
      .Visible = True
    End With
  Next
  btnAnnuler.Top = btnChoix(0).Top + i * 420
  Height = btnAnnuler.Top + 800
  iRet = 0  ' Au cas o� on ferme la fen�tre
  Show vbModal
  Choix = iRet
End Function

Private Sub btnAnnuler_Click()
  iRet = 0
  Unload Me
End Sub

Private Sub btnChoix_Click(Index As Integer)
  iRet = Index
  Unload Me
End Sub

Private Sub Form_Activate()
  btnChoix(1).SetFocus
End Sub

Private Sub lblChoix_DblClick(Index As Integer)
  btnChoix_Click Index
End Sub
