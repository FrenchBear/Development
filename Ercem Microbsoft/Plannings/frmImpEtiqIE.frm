VERSION 5.00
Begin VB.Form frmImpEtiqIE 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Planche d'étiquettes pour interventions non planifiées"
   ClientHeight    =   2505
   ClientLeft      =   1200
   ClientTop       =   2730
   ClientWidth     =   8445
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmImpEtiqIE.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   167
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   563
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   7020
      TabIndex        =   9
      Top             =   1080
      Width           =   1350
   End
   Begin VB.TextBox txtNomAssistant 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1740
      Locked          =   -1  'True
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   120
      Width           =   5175
   End
   Begin VB.TextBox txtLettres 
      Height          =   315
      Left            =   960
      MaxLength       =   2
      TabIndex        =   1
      Top             =   120
      Width           =   675
   End
   Begin VB.Frame fraOptions 
      Caption         =   "Options d'impression"
      Height          =   1875
      Left            =   60
      TabIndex        =   2
      Top             =   480
      Width           =   6855
      Begin VB.TextBox txtAutreNbEtiqParRef 
         Height          =   285
         Left            =   3060
         TabIndex        =   14
         Top             =   1440
         Width           =   615
      End
      Begin VB.TextBox txtAutreNbRef 
         Height          =   285
         Left            =   1140
         TabIndex        =   12
         Top             =   1440
         Width           =   615
      End
      Begin VB.OptionButton optAutre 
         Caption         =   "&autre :"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   1440
         Width           =   975
      End
      Begin VB.OptionButton opt4 
         Caption         =   "1 référence, &80 échantillons"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   1140
         Width           =   5955
      End
      Begin VB.OptionButton opt3 
         Caption         =   "&22 références, une étiquette FP par référence"
         Height          =   255
         Left            =   120
         TabIndex        =   5
         Top             =   840
         Width           =   5955
      End
      Begin VB.OptionButton opt2 
         Caption         =   "&14 références, un échantillon et une étiquette FP par référence"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   540
         Width           =   6615
      End
      Begin VB.OptionButton opt1 
         Caption         =   "&8 références, trois échantillons et une étiquette FP par référence"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   6675
      End
      Begin VB.Label lblEtiqRéf 
         AutoSize        =   -1  'True
         Caption         =   "étiquettes par référence"
         Height          =   210
         Left            =   3780
         TabIndex        =   15
         Top             =   1455
         Width           =   2310
      End
      Begin VB.Label lblRéférences 
         Caption         =   "références,"
         Height          =   195
         Left            =   1860
         TabIndex        =   13
         Top             =   1460
         Width           =   1155
      End
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   7020
      TabIndex        =   7
      Top             =   525
      Width           =   1350
   End
   Begin VB.CommandButton btnImprimer 
      Caption         =   "Imprimer"
      Default         =   -1  'True
      Height          =   330
      Left            =   7020
      TabIndex        =   6
      Top             =   120
      Width           =   1350
   End
   Begin VB.Label lblLettres 
      AutoSize        =   -1  'True
      Caption         =   "&Lettres :"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   180
      Width           =   810
   End
End
Attribute VB_Name = "frmImpEtiqIE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Gère l'impression des planches d'étiquettes d'IE"
' frmImpEtiqIE
' Gère l'impression des planches d'étiquettes d'IE
' PV Novembre 96
' 22/01/98 PV  Option 80 échantillons
'  4/02/98 PV  Nombre de références et d'échantillons variables
' 23/02/98 PV  Étiquettes sac S:
' 25/01/99 PV  Internationalisation


Option Explicit

Private Sub btnAide_Click()
  Aide "frmetie"
End Sub

Private Sub btnImprimer_Click()
  Dim sMsgErr As String
  
  txtLettres = UCase(txtLettres)
  If Not bOkLettresActuelles(txtLettres, sMsgErr) Then
    MsgBox2 sMsgErr, "PL013"
    txtLettres.SetFocus
    Exit Sub
  End If
  
  Dim iNbRef As Integer, iNbEtiq As Integer
  If opt1 Then
    iNbRef = 8
    iNbEtiq = 3
  ElseIf opt2 Then
    iNbRef = 14
    iNbEtiq = 1
  ElseIf opt3 Then
    iNbRef = 22
    iNbEtiq = 0
  ElseIf opt4 Then
    iNbRef = 1
    iNbEtiq = 80
  Else
    If Not IsNumeric(txtAutreNbRef) Then
      MsgBox2i "CO003", txtAutreNbRef
      txtAutreNbRef.SetFocus
      Exit Sub
    End If
    iNbRef = CInt(txtAutreNbRef)
    If iNbRef < 1 Or iNbRef > 40 Then
      MsgBox2i "CO003", txtAutreNbRef, 1, 40
      Exit Sub
    End If
    
    If Not IsNumeric(txtAutreNbEtiqParRef) Then
      MsgBox2i "CO003", txtAutreNbEtiqParRef
      txtAutreNbEtiqParRef.SetFocus
      Exit Sub
    End If
    iNbEtiq = CInt(txtAutreNbEtiqParRef)
    If iNbEtiq < 0 Or iNbEtiq > 99 Then
      MsgBox2i "CO003b", txtAutreNbEtiqParRef, 0, 99
      Exit Sub
    End If
  End If
  
  If Left(sImprimanteEtiquettes, 5) = "[Win]" Then
    If Not bDébutImpressionEtiqLocal(sImprimanteEtiquettes) Then Exit Sub
    ImpVBEtiqIE txtLettres, iNbRef, iNbEtiq
    FinImpressionEtiqLocal
  Else
    msdImprimeÉtiquettesIE sImprimanteEtiquettes, txtLettres, iNbRef * 100 + iNbEtiq
  End If
  
  Unload Me
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  Internationalisation
  
  opt1 = 1
  optAutre_Click
End Sub

Private Sub opt1_Click()
  optAutre_Click
End Sub

Private Sub opt2_Click()
  optAutre_Click
End Sub

Private Sub opt3_Click()
  optAutre_Click
End Sub

Private Sub opt4_Click()
  optAutre_Click
End Sub

Private Sub optAutre_Click()
  If optAutre Then
    txtAutreNbRef.Enabled = True
    txtAutreNbRef.BackColor = &H80000005
    txtAutreNbRef.TabStop = True
    txtAutreNbEtiqParRef.Enabled = True
    txtAutreNbEtiqParRef.BackColor = &H80000005
    txtAutreNbEtiqParRef.TabStop = True
  Else
    txtAutreNbRef.Enabled = False
    txtAutreNbRef.BackColor = &H8000000F
    txtAutreNbRef.TabStop = False
    txtAutreNbEtiqParRef.Enabled = False
    txtAutreNbEtiqParRef.BackColor = &H8000000F
    txtAutreNbEtiqParRef.TabStop = False
  End If
End Sub


Private Sub txtLettres_Change()
  Dim u As Utilisateur, sMsgErr As String
  If bOkLettres(txtLettres, sMsgErr) Then
    Set u = UtiParLettres(UCase(txtLettres))
    If u Is Nothing Then
      txtNomAssistant = ""
    Else
      txtNomAssistant = u.uti_nom
    End If
  Else
    txtNomAssistant = ""
  End If
End Sub

Private Sub RechercheLettres()
  Dim l As String
  l = frmRechercheLettres.Cherche
  If l <> "" Then
    txtLettres = l
    txtLettres.SelStart = 9
  End If
End Sub

Private Sub txtLettres_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then RechercheLettres
End Sub

Private Sub txtLettres_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc("/") Then
    KeyAscii = 0
    RechercheLettres
  End If
End Sub



Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub



'===========================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "IECaption"
  
  SetLib btnImprimer, "Caption", "IEbtnImprimer"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib lblLettres, "Caption", "IElblLettres"
  SetLib fraOptions, "Caption", "IEfraOptions"
  SetLib opt1, "Caption", "IEopt1"
  SetLib opt2, "Caption", "IEopt2"
  SetLib opt3, "Caption", "IEopt3"
  SetLib opt4, "Caption", "IEopt4"
  SetLib optAutre, "Caption", "IEoptAutre"
  SetLib lblRéférences, "Caption", "IElblRéférences"
  SetLib lblEtiqRéf, "Caption", "IElblEtiqRéf"
 
  
  
End Sub
