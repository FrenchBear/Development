VERSION 2.00
Begin Form frmSaisie 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Double
   Caption         =   "Saisie"
   ClientHeight    =   6345
   ClientLeft      =   3720
   ClientTop       =   555
   ClientWidth     =   5280
   Height          =   6750
   KeyPreview      =   -1  'True
   Left            =   3660
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6345
   ScaleWidth      =   5280
   Top             =   210
   Width           =   5400
   Begin CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   375
      Left            =   4080
      TabIndex        =   18
      Top             =   2520
      Width           =   1095
   End
   Begin CommandButton btnSuggRemplace 
      Caption         =   "&Remplace"
      Height          =   375
      Left            =   120
      TabIndex        =   14
      Top             =   5880
      Width           =   1215
   End
   Begin CommandButton btnSuggEnlève 
      Caption         =   "&Enlève"
      Height          =   375
      Left            =   120
      TabIndex        =   13
      Top             =   5400
      Width           =   1215
   End
   Begin CommandButton btnSuggAjoute 
      Caption         =   "&Ajoute"
      Height          =   375
      Left            =   120
      TabIndex        =   12
      Top             =   4920
      Width           =   1215
   End
   Begin ListBox lstTexte 
      Height          =   615
      Index           =   0
      Left            =   120
      TabIndex        =   16
      Top             =   4080
      Visible         =   0   'False
      Width           =   735
   End
   Begin ListBox lstTitre 
      Height          =   3150
      Index           =   0
      Left            =   1440
      TabIndex        =   11
      Top             =   3120
      Visible         =   0   'False
      Width           =   3735
   End
   Begin CommandButton cmdAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   2760
      TabIndex        =   9
      Top             =   2520
      Width           =   1095
   End
   Begin CommandButton cmdOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   1440
      TabIndex        =   8
      Top             =   2520
      Width           =   1095
   End
   Begin TextBox txtExtension 
      Height          =   285
      Left            =   1440
      TabIndex        =   7
      Top             =   2160
      Width           =   3735
   End
   Begin HScrollBar optNiveau 
      Height          =   255
      Left            =   1440
      Max             =   4
      TabIndex        =   5
      Top             =   1800
      Width           =   3735
   End
   Begin TextBox txtTexte 
      Height          =   1215
      Left            =   1440
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   3
      Top             =   480
      Width           =   3735
   End
   Begin TextBox txtTitre 
      Height          =   285
      Left            =   1440
      TabIndex        =   1
      Top             =   120
      Width           =   3735
   End
   Begin Line Line1 
      X1              =   120
      X2              =   5160
      Y1              =   3000
      Y2              =   3000
   End
   Begin Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "&Suggestions :"
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   3120
      Width           =   1215
   End
   Begin Label lblE 
      Caption         =   "lblE"
      Height          =   255
      Left            =   120
      TabIndex        =   17
      Top             =   2640
      Visible         =   0   'False
      Width           =   735
   End
   Begin Label lblDef 
      Caption         =   "lblDef"
      Height          =   255
      Left            =   120
      TabIndex        =   15
      Top             =   2400
      Visible         =   0   'False
      Width           =   735
   End
   Begin Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "E&xtension :"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   2160
      Width           =   1215
   End
   Begin Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "&Niveau :"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   1800
      Width           =   1215
   End
   Begin Label lblTitre 
      BackStyle       =   0  'Transparent
      Caption         =   "&Titre :"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "&Description détaillée :"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   1215
   End
End
Option Explicit

Sub btnAide_Click ()
  ShowHelp (41)
End Sub

Sub btnSuggAjoute_Click ()
  Dim t As Table

  If txtTitre = "" Then Beep: Exit Sub

  Set t = db.OpenTable("Suggestions")
  t.AddNew
  t("sug_indice") = lblE
  t("sug_libellé") = txtTitre
  t("sug_détails") = txtTexte
  t.Update
  t.Close
  ChargeSugg lblE
End Sub

Sub btnSuggEnlève_Click ()
  Dim s As dynaset, sql As String, d
  Dim i As Integer

  If lstTitre(lblE).ListIndex < 0 Then Beep: Exit Sub
  If MsgBox("Voulez-vous réellement effacer cette suggestion ?", 1 + 48 + 256) = 1 Then
    sql = "select sug_libellé,sug_détails from suggestions where sug_indice=" & lblE
    Set s = db.CreateDynaset(sql)
    Do While Not s.EOF
      If lstTitre(lblE) = s("sug_libellé") Then
        s.Delete
        Exit Do
      End If
      s.MoveNext
    Loop
    s.Close
    ChargeSugg lblE
  End If
End Sub

Sub btnSuggRemplace_Click ()
  Dim s As dynaset, sql As String, d

  If txtTitre = "" Then Beep: Exit Sub
  If lstTitre(lblE).ListIndex < 0 Then Beep: Exit Sub

  sql = "select sug_libellé,sug_détails from suggestions where sug_indice=" & lblE
  Set s = db.CreateDynaset(sql)
  Do While Not s.EOF
    If lstTitre(lblE) = s("sug_libellé") Then
      s.Edit
      s("sug_libellé") = txtTitre
      s("sug_détails") = txtTexte
      s.Update
      Exit Do
    End If
    s.MoveNext
  Loop
  s.Close
  ChargeSugg lblE
End Sub

Sub ChargeSugg (e)
  Dim s As dynaset, sql As String, d

  lstTitre(e).Clear
  lstTexte(e).Clear
  sql = "select sug_libellé,sug_détails from suggestions where sug_indice=" & e & " order by sug_libellé"
  Set s = db.CreateDynaset(sql)
  While Not s.EOF
    lstTitre(e).AddItem s("sug_libellé")
    d = s("sug_détails")
    If IsNull(d) Then d = ""
    lstTexte(e).AddItem d
    s.MoveNext
  Wend
  s.Close
End Sub

Sub cmdAnnuler_Click ()
  txtTitre = ""
  frmSaisie.Hide
End Sub

Sub cmdOk_Click ()
  frmSaisie.Hide
End Sub

Sub Form_Activate ()
  lstTitre(lblE).Visible = True
  If lstTitre(lblE).ListCount = 0 Then ChargeSugg lblE

  If lblDef = 1 Then
    txtTexte.SetFocus
  Else
    txtTitre.SetFocus
  End If
  ColorBox txtTexte, optNiveau
End Sub

Sub Form_Deactivate ()
  lstTitre(lblE).Visible = False
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
  ' F1
  If KeyCode = 112 Then ShowHelp (41)
End Sub

Sub Form_Load ()
  Dim i As Integer
  For i = 1 To NIV - 1
    Load lstTitre(i)
    Load lstTexte(i)
  Next
End Sub

Sub lstTitre_Click (i As Integer)
  txtTitre = lstTitre(lblE) '.List(lstSug(0).ListIndex)
  txtTexte = lstTexte(lblE).List(lstTitre(lblE).ListIndex)
End Sub

Sub lstTitre_DblClick (Index As Integer)
  cmdOk_Click
End Sub

Sub optNiveau_Change ()
  ColorBox txtTexte, optNiveau
End Sub

Sub RécupFocus (c As TextBox)
  If GetKeyState(VK_TAB) < 0 Then
    c.SelStart = 0
    c.SelLength = Len(c.Text)
  Else
    c.SelLength = 0
  End If
End Sub

Sub txtExtension_GotFocus ()
  RécupFocus txtExtension
End Sub

Sub txtTexte_GotFocus ()
  RécupFocus txtTexte
End Sub

Sub txtTitre_GotFocus ()
  RécupFocus txtTitre
End Sub

