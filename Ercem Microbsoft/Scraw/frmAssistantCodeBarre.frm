VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmAssistantCodeBarre 
   Caption         =   "Assistant code-barre"
   ClientHeight    =   3570
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6075
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3570
   ScaleWidth      =   6075
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtInfo 
      BackColor       =   &H8000000F&
      Height          =   2295
      Left            =   60
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   2
      Top             =   900
      Width           =   5955
   End
   Begin VB.CommandButton btnTest 
      Caption         =   "Test"
      Height          =   315
      Left            =   3000
      TabIndex        =   6
      Top             =   60
      Visible         =   0   'False
      Width           =   675
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   4680
      TabIndex        =   4
      Top             =   480
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   4680
      TabIndex        =   3
      Top             =   60
      Width           =   1350
   End
   Begin VB.TextBox txtCodeBarre 
      Height          =   315
      Left            =   60
      TabIndex        =   1
      Top             =   480
      Width           =   4335
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   5
      Top             =   3255
      Width           =   6075
      _ExtentX        =   10716
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
   Begin VB.Label lblCodeBarre 
      AutoSize        =   -1  'True
      Caption         =   "Code Barre :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   180
      Width           =   1200
   End
End
Attribute VB_Name = "frmAssistantCodeBarre"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private f As frmRA

Private iType As Integer

' Type 1: Code
Private sCodeAbattoir As String
Private dDateAbattage As Date
Private sNuméroIdentification As String
Private sNuméroTuerie As String


Public Sub AssistantCodeBarre(f0 As frmRA)
  Set f = f0
  Show vbModal
  Set f = Nothing
End Sub

Private Sub Form_Activate()
  InitSaisie
  txtCodeBarre.SetFocus
End Sub


Private Sub btnTest_Click()
  txtCodeBarre = "42094001010104FR4242424242XX013000"
  AnalyseCodeBarre
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc("%") Then
    InitSaisie
    KeyAscii = 0
    txtCodeBarre.SetFocus
  End If
End Sub

Private Sub InitSaisie()
  txtCodeBarre = ""
  iType = 0
  btnOK.Enabled = False
  txtInfo = ""
End Sub

Private Sub txtCodeBarre_KeyPress(KeyAscii As Integer)
  If KeyAscii = 13 Then
    AnalyseCodeBarre
    KeyAscii = 0
  End If
End Sub


Private Sub btnAnnuler_Click()
  Me.Hide
End Sub

Private Sub AnalyseCodeBarre()
  If txtCodeBarre = "" Then
    iType = 0
    Exit Sub
  End If
  
  If Len(txtCodeBarre) = 34 Then
    ' Code barre DGAL
    iType = 1
    sCodeAbattoir = Left(txtCodeBarre, 8)
    Dim sAAMMJJ As String
    sAAMMJJ = Mid(txtCodeBarre, 9, 6)
    dDateAbattage = DateSerial(2000 + Left(sAAMMJJ, 2), Mid(sAAMMJJ, 3, 2), Right(sAAMMJJ, 2))
    sNuméroIdentification = Mid(txtCodeBarre, 15, 5)
    sNuméroTuerie = Mid(txtCodeBarre, 29, 5)
    
    txtInfo = "Code-barre ESB DGAL" & vbCrLf & _
      "Code abattoir: " & sCodeAbattoir & vbCrLf & _
      "Date d'abattage: " & Format(dDateAbattage, "dd/mm/yyyy") & vbCrLf & _
      "Numéro d'identification: " & sNuméroIdentification & vbCrLf & _
      "Numéro de tuerie: " & sNuméroTuerie
    btnOK.Enabled = True
    Exit Sub
  End If
  
  MsgBox "Code barre inconnu !", vbExclamation, App.Title
End Sub

  
Private Sub btnOK_Click()
  Select Case iType
    Case 1:   ' Code-barre dgal
      f.txtNumPro = -1
      f.txtNomPro = "PRI1, 4.20.1.1.10"
      f.txtCritèreInfo = "PRI1"
      f.txtComplémentNom = "!" & txtCodeBarre
      
      f.txtCritère = "PRI1"
      f.cboMMéthode = "P"
      f.bdcClasseDoc = "BS"

      f.SetDirty
      
    Case Else:
      Stop
  End Select
  
  Me.Hide
End Sub

