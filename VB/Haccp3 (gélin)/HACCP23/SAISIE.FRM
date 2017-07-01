VERSION 2.00
Begin Form frmSaisie 
   BorderStyle     =   3  'Fixed Double
   Caption         =   "Saisie"
   ClientHeight    =   6435
   ClientLeft      =   4080
   ClientTop       =   555
   ClientWidth     =   5280
   Height          =   6840
   Left            =   4020
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6435
   ScaleWidth      =   5280
   Top             =   210
   Width           =   5400
   Begin CommandButton btnSuggRemplace 
      Caption         =   "&Remplace"
      Height          =   375
      Left            =   120
      TabIndex        =   15
      Top             =   5880
      Width           =   1215
   End
   Begin CommandButton btnSuggEnlève 
      Caption         =   "&Enlève"
      Height          =   375
      Left            =   120
      TabIndex        =   14
      Top             =   5400
      Width           =   1215
   End
   Begin CommandButton btnSuggAjoute 
      Caption         =   "&Ajoute"
      Height          =   375
      Left            =   120
      TabIndex        =   13
      Top             =   4920
      Width           =   1215
   End
   Begin ListBox lstTexte 
      Height          =   615
      Index           =   0
      Left            =   120
      TabIndex        =   12
      Top             =   3000
      Visible         =   0   'False
      Width           =   735
   End
   Begin ListBox lstTitre 
      Height          =   3345
      Index           =   0
      Left            =   1440
      TabIndex        =   11
      Top             =   3000
      Visible         =   0   'False
      Width           =   3735
   End
   Begin CommandButton cmdAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   2760
      TabIndex        =   5
      Top             =   2520
      Width           =   1095
   End
   Begin CommandButton cmdOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   1440
      TabIndex        =   4
      Top             =   2520
      Width           =   1095
   End
   Begin TextBox txtExtension 
      Height          =   285
      Left            =   1440
      TabIndex        =   3
      Top             =   2160
      Width           =   3735
   End
   Begin HScrollBar optNiveau 
      Height          =   255
      Left            =   1440
      Max             =   4
      TabIndex        =   2
      Top             =   1800
      Width           =   3735
   End
   Begin TextBox txtTexte 
      Height          =   1215
      Left            =   1440
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   480
      Width           =   3735
   End
   Begin TextBox txtTitre 
      Height          =   285
      Left            =   1440
      TabIndex        =   0
      Top             =   120
      Width           =   3735
   End
   Begin Label lblE 
      Caption         =   "lblE"
      Height          =   255
      Left            =   120
      TabIndex        =   16
      Top             =   2760
      Visible         =   0   'False
      Width           =   735
   End
   Begin Label lblDef 
      Caption         =   "lblDef"
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   2520
      Visible         =   0   'False
      Width           =   735
   End
   Begin Label Label3 
      Caption         =   "E&xtension :"
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   2160
      Width           =   1215
   End
   Begin Label Label2 
      Caption         =   "&Niveau :"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   1800
      Width           =   1215
   End
   Begin Label lblTitre 
      Caption         =   "&Titre :"
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   120
      Width           =   1215
   End
   Begin Label Label1 
      Caption         =   "&Description détaillée :"
      Height          =   495
      Left            =   120
      TabIndex        =   6
      Top             =   480
      Width           =   1215
   End
End
Option Explicit

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

  If lstTitre(lblE).ListIndex < 0 Then Beep: Exit Sub

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

Sub cmdOk_click ()
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
  cmdOk_click
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

