VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmSupprimeDocument 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Suppression de document"
   ClientHeight    =   1725
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6270
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmSupprimeDocument.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1725
   ScaleWidth      =   6270
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   4875
      TabIndex        =   6
      Top             =   1020
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   4875
      TabIndex        =   5
      Top             =   480
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   4875
      TabIndex        =   4
      Top             =   60
      Width           =   1350
   End
   Begin VB.TextBox txtClé 
      Height          =   315
      Left            =   2100
      TabIndex        =   1
      Tag             =   "Clé de suppression"
      Top             =   60
      Width           =   1200
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   7
      Top             =   1410
      Width           =   6270
      _ExtentX        =   11060
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
   Begin VB.Label lblAEffacer 
      Height          =   615
      Left            =   60
      TabIndex        =   3
      Top             =   720
      Width           =   4695
   End
   Begin VB.Label lblDocASupprimer 
      AutoSize        =   -1  'True
      Caption         =   "Vous allez effacer le document :"
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Top             =   480
      Width           =   3015
   End
   Begin VB.Label lblClé 
      AutoSize        =   -1  'True
      Caption         =   "&Clé de suppression :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   1950
   End
End
Attribute VB_Name = "frmSupprimeDocument"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmSupprimeDocument
' Gestion de la suppression d'un document
'  2/02/1999 PV

Option Explicit

Private bOkSuppression As Boolean
Private g_d As Document


' Point d'entrée
Public Function bSupprimeDocument(d As Document) As Boolean
  bOkSuppression = False
  Set g_d = d
  Show vbModal
  bSupprimeDocument = bOkSuppression
  Set g_d = Nothing
End Function


Private Sub btnOk_Click()
  If txtClé <> "1" Then
    MsgBox2i "GD013"      ' Clé incorrecte
    txtClé.SetFocus
    Exit Sub
  End If
  
  ' C'est bon, tout est à priori Ok
  bOkSuppression = True
  Unload Me
End Sub


Private Sub btnAide_Click()
  Aide "frmsudo"
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  Internationalisation
  
  lblAEffacer = g_d.pla_lettres & g_d.pla_iref & " " & g_d.pla_dateplan & vbCrLf & g_d.pla_etb & ": " & g_d.etb_prefixe & " " & g_d.etb_nom & vbCrLf & g_d.doc_classe & " " & g_d.doc_refdoc
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub


Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  If TypeOf ActiveControl Is TextBox Then AutoSelect ActiveControl
End Sub

Private Sub txtClé_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub



'===========================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "SDCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"

  AjusteControle lblAEffacer
End Sub

