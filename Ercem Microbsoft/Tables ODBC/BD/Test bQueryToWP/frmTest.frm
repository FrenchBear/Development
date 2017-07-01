VERSION 5.00
Begin VB.Form frmTest 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Test de bQueryToWP"
   ClientHeight    =   5040
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5415
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
   ScaleHeight     =   5040
   ScaleWidth      =   5415
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      DataField       =   "Colonne2"
      Height          =   315
      Left            =   4440
      TabIndex        =   14
      Text            =   ">12"
      Top             =   1740
      Width           =   915
   End
   Begin VB.TextBox Text1 
      DataField       =   "Colonne1"
      Height          =   315
      Left            =   4440
      TabIndex        =   13
      Text            =   "Text1"
      Top             =   1320
      Width           =   915
   End
   Begin VB.CommandButton Command1 
      Caption         =   "WP"
      Height          =   315
      Left            =   3960
      TabIndex        =   12
      Top             =   900
      Width           =   855
   End
   Begin VB.TextBox txtRésultat 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1140
      Locked          =   -1  'True
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   2640
      Width           =   4215
   End
   Begin VB.TextBox txtMessage 
      BackColor       =   &H8000000F&
      Height          =   975
      Left            =   1140
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   11
      TabStop         =   0   'False
      Top             =   4020
      Width           =   4215
   End
   Begin VB.TextBox txtWP 
      BackColor       =   &H8000000F&
      Height          =   975
      Left            =   1140
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   3000
      Width           =   4215
   End
   Begin VB.ListBox lstType 
      Height          =   1530
      Left            =   1140
      TabIndex        =   5
      Top             =   780
      Width           =   2115
   End
   Begin VB.TextBox txtColonne 
      Height          =   315
      Left            =   1140
      TabIndex        =   3
      Text            =   "col_colonne"
      Top             =   420
      Width           =   4215
   End
   Begin VB.TextBox txtValeur 
      Height          =   315
      Left            =   1140
      TabIndex        =   1
      Top             =   60
      Width           =   4215
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      Caption         =   "Colonne2 :"
      Height          =   210
      Left            =   3360
      TabIndex        =   16
      Top             =   1800
      Width           =   1035
   End
   Begin VB.Label Label7 
      AutoSize        =   -1  'True
      Caption         =   "Colonne1 :"
      Height          =   210
      Left            =   3360
      TabIndex        =   15
      Top             =   1380
      Width           =   1035
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "Résultat :"
      Height          =   210
      Left            =   120
      TabIndex        =   6
      Top             =   2700
      Width           =   915
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Message :"
      Height          =   210
      Left            =   120
      TabIndex        =   10
      Top             =   4080
      Width           =   975
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "WP :"
      Height          =   210
      Left            =   120
      TabIndex        =   8
      Top             =   3060
      Width           =   450
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "Type :"
      Height          =   210
      Left            =   120
      TabIndex        =   4
      Top             =   840
      Width           =   585
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Colonne :"
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   915
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Valeur :"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   735
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
  Dim colChamps As New Collection
  Dim colColonnes As New Collection
  
  colChamps.Add Text1
  colChamps.Add Text2
  
  Dim c1 As New BDColonne, c2 As New BDColonne
  With c1
    .bRequired = True
    .iSize = 10
    .iType = BDTypeCHAR
    .sNom = "colonne1"
  End With
  colColonnes.Add c1, "Colonne1"
  With c2
    .bRequired = False
    .iSize = 4
    .iType = BDTypeINTEGER
    .sNom = "colonne2"
  End With
  colColonnes.Add c2, "Colonne2"
  
  Dim k As New Collection
  BDInit "serveur"
  BDDécritTable "projet", k

  Dim sWP As String
  Dim t As Control
  For Each t In colChamps
    If Not t.Locked And t.Text <> "" Then
      Dim sFinal As String, sMsg As String
      If Not bQueryToWP(t.DataField, t.Text, colColonnes(t.DataField).iType, sFinal, sMsg) Then
        MsgBox "Erreur dans la requête !" & vbCrLf & sMsg, vbExclamation, sNomApp
        t.SetFocus
        Exit Sub
      End If
      If sWP <> "" Then sWP = sWP & " and "
      sWP = sWP & sFinal
    End If
  Next
  
  MsgBox "WherePart: " & sWP
End Sub


Private Sub Form_Load()
  lstType.AddItem "BDTypeCHAR"
  lstType.AddItem "BDTypeINTEGER"
  lstType.AddItem "BDTypeDATE"
  lstType.AddItem "BDTypeTIMESTAMP"
  lstType.AddItem "BDTypeDECIMAL"
  
  lstType.ListIndex = 0
End Sub

Private Sub lstType_Click()
  AfficheWP
End Sub

Private Sub txtColonne_Change()
  AfficheWP
End Sub

Private Sub txtValeur_Change()
  AfficheWP
End Sub

Sub AfficheWP()
  Dim sWP As String, sMsg As String
  Dim bRésultat As String
  
  bRésultat = bQueryToWP(txtColonne, txtValeur, lstType.ListIndex + 1, sWP, sMsg)
  
  txtRésultat = bRésultat
  txtWP = sWP
  txtMessage = sMsg
End Sub
