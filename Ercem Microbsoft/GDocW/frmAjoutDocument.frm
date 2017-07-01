VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmAjoutDocument 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Ajout d'un document"
   ClientHeight    =   1725
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5145
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAjoutDocument.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1725
   ScaleWidth      =   5145
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtClé 
      Height          =   315
      Left            =   2220
      TabIndex        =   5
      Tag             =   "Clé d'ajout"
      Top             =   780
      Width           =   1200
   End
   Begin VB.TextBox txtNoDocument 
      Height          =   315
      Left            =   2220
      TabIndex        =   3
      Tag             =   "Entrez le N° CRA 1 à 99, vide pour une EH"
      Top             =   420
      Width           =   1200
   End
   Begin VB.ComboBox cboType 
      Height          =   330
      ItemData        =   "frmAjoutDocument.frx":014A
      Left            =   2220
      List            =   "frmAjoutDocument.frx":0154
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Tag             =   "Sélectionnez le type de document à ajouter"
      Top             =   60
      Width           =   1215
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   3735
      TabIndex        =   8
      Top             =   60
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   3735
      TabIndex        =   7
      Top             =   480
      Width           =   1350
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   3735
      TabIndex        =   6
      Top             =   1020
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   9
      Top             =   1410
      Width           =   5145
      _ExtentX        =   9075
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
   Begin VB.Label lblClé 
      AutoSize        =   -1  'True
      Caption         =   "&Clé d'ajout :"
      Height          =   210
      Left            =   120
      TabIndex        =   4
      Top             =   840
      Width           =   1155
   End
   Begin VB.Label lblNoDocument 
      AutoSize        =   -1  'True
      Caption         =   "&N° document :"
      Height          =   210
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   1365
   End
   Begin VB.Label lblTypeDocument 
      AutoSize        =   -1  'True
      Caption         =   "&Type de document :"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1875
   End
End
Attribute VB_Name = "frmAjoutDocument"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmAjoutDocument
' Gestion de l'ajout d'un document
'  2/02/1999 PV

Option Explicit

Private bOkAjout As Boolean
Private sClasse As String, sNo As String

Private g_d As Document


' Point d'entrée
Public Function bAjouteDocument(d As Document, ByRef p_sClasse As String, ByRef p_sNo As String) As Boolean
  bOkAjout = False
  Set g_d = d
  Show vbModal
  bAjouteDocument = bOkAjout
  p_sClasse = sClasse
  p_sNo = sNo
  Set g_d = Nothing
End Function


Private Sub btnOK_Click()
  If cboType.ListIndex < 0 Then
    MsgBox2i "GD008"      ' Vous devez choisir un type de document proposé dans la liste !
    Exit Sub
  End If
  sClasse = cboType.List(cboType.ListIndex)
  
  If txtClé <> "1" Then
    MsgBox2i "GD013"      ' Clé incorrecte
    txtClé.SetFocus
    Exit Sub
  End If
  
  If sClasse = "EH" Then
    If txtNoDocument <> "" Then
      MsgBox2i "GD025a"    ' No de document incorrect : doit être vide pour une EH
      txtNoDocument.SetFocus
      Exit Sub
    End If
  ElseIf sClasse = "CR" Then
    If txtNoDocument <> "" Then
      If Not IsNumeric(txtNoDocument) Then
        MsgBox2i "CO003", txtNoDocument   ' Nombre incorrect
        txtNoDocument.SetFocus
        Exit Sub
      End If
      
      If txtNoDocument < 1 Or txtNoDocument > 99 Or txtNoDocument <> Int(txtNoDocument) Then
        MsgBox2i "CO003b", txtNoDocument, 1, 99
        txtNoDocument.SetFocus
        Exit Sub
      End If
    End If
    
    Dim s As String
    s = txtNoDocument
    If Not bTesteRef(g_d, sClasse, s) Then
      If txtNoDocument <> "" Then
        MsgBox2i "GD025"  ' No de document incorrect : déjà utilisé.
      Else
        MsgBox2i "GD025b" ' No de document incorrect : le programme n'arrive pas à choisir automatiquement un numéro de document.
      End If
      txtNoDocument.SetFocus
      Exit Sub
    End If
    txtNoDocument = s     ' N° récupéré du démon
  End If
  
  ' C'est bon, tout est à priori Ok
  bOkAjout = True
  sNo = txtNoDocument
  Unload Me
End Sub


Private Sub btnAide_Click()
  Aide "frmajdo"
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  Internationalisation
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub


Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  If TypeOf ActiveControl Is TextBox Then AutoSelect ActiveControl
End Sub

Private Sub cboTypeDocument_GotFocus(): GotFocus: End Sub
Private Sub txtNoDocument_GotFocus(): GotFocus: End Sub
Private Sub txtClé_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub


'===========================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "ADCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib lblTypeDocument, "Caption", "ADlblTypeDoc"
  SetLib cboType, "Tag", "ADcboType.tag"
  SetLib lblNoDocument, "Caption", "ADlblNumDoc"
  SetLib txtNoDocument, "Tag", "ADlblNumDoc.tag"
  SetLib lblClé, "Caption", "ADlblClé"
  SetLib txtClé, "Tag", "ADtxtClé.Tag"
End Sub

