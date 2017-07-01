VERSION 5.00
Begin VB.Form frmOptions 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Options"
   ClientHeight    =   1920
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5025
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmOptions.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   1920
   ScaleWidth      =   5025
   ShowInTaskbar   =   0   'False
   Begin VB.Frame fraImpression 
      Caption         =   "Options d'impression"
      Height          =   975
      Left            =   60
      TabIndex        =   4
      Top             =   60
      Width           =   3375
      Begin VB.CheckBox chkSansGris�s 
         Caption         =   "Ne pas utiliser de gris�s"
         Height          =   210
         Left            =   180
         TabIndex        =   6
         Top             =   600
         Width           =   3135
      End
      Begin VB.CheckBox chkRectoVerso 
         Caption         =   "Impression recto-verso"
         Height          =   255
         Left            =   180
         TabIndex        =   5
         Top             =   300
         Width           =   3075
      End
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   3600
      TabIndex        =   1
      Top             =   60
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   3600
      TabIndex        =   2
      Top             =   480
      Width           =   1350
   End
   Begin VB.CommandButton btnD�faut 
      Caption         =   "&D�faut"
      Height          =   330
      Left            =   3600
      TabIndex        =   3
      Tag             =   "R�tablit des options par d�faut du programme"
      Top             =   900
      Width           =   1350
   End
   Begin VB.CommandButton btnLangue 
      Caption         =   "&Langue"
      Height          =   330
      Left            =   3600
      TabIndex        =   0
      Tag             =   "Change la langue de l'interface"
      Top             =   1500
      Width           =   1350
   End
End
Attribute VB_Name = "frmOptions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmOptions
' Options g�n�rales des applis ODBC
'  7/07/1999 PV
' 13/09/1999 PV SetSourceODBCD�faut
'  5/11/1999 PV Options d'impression; fin de la source ODBC par d�faut
' 15/01/2000 PV Gestion de la langue de travail
' 03/12/2001 FF Historique des suppressions et des destructions

Option Explicit


Const iOptionsD�faut = 0             ' Rien

Private Sub AjusterBoutonLangue()
  btnLangue.Caption = "Langue [" & cLangage & "]"
End Sub



Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnD�faut_Click()
  chkRectoVerso = vbUnchecked
  chkSansGris�s = vbUnchecked
End Sub

Private Sub btnLangue_Click()
  IntlS�lectionneLangage
  AjusterBoutonLangue
End Sub


Private Sub btnOK_Click()
  Dim iOptionsG�n�rales As Integer
  iOptionsG�n�rales = 0
  
  If chkRectoVerso Then
    bOptionRectoVerso = True
    iOptionsG�n�rales = iOptionsG�n�rales + 1
  Else
    bOptionRectoVerso = False
  End If
    
  If chkSansGris�s Then
    bOptionSansGris�s = True
    iOptionsG�n�rales = iOptionsG�n�rales + 2
  Else
    bOptionSansGris�s = False
  End If
    
  SaveSetting App.EXEName, "Options", "OptionsG�n�rales", iOptionsG�n�rales
  Unload Me
End Sub


Private Sub Form_Load()
  AjusterBoutonLangue
  chkRectoVerso = IIf(bOptionRectoVerso, 1, 0)
  chkSansGris�s = IIf(bOptionSansGris�s, 1, 0)
End Sub


Public Sub InitOptions()
  Dim iOptionsG�n�rales As Integer
  
  iOptionsG�n�rales = GetSetting(App.EXEName, "Options", "OptionsG�n�rales", iOptionsD�faut)
  bOptionRectoVerso = (iOptionsG�n�rales And 1) <> 0
  bOptionSansGris�s = (iOptionsG�n�rales And 2) <> 0
End Sub
