VERSION 2.00
Begin Form frmSaisie 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   3  'Fixed Double
   Caption         =   "Saisie"
   ClientHeight    =   6240
   ClientLeft      =   3660
   ClientTop       =   525
   ClientWidth     =   5505
   Height          =   6660
   KeyPreview      =   -1  'True
   Left            =   3600
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6240
   ScaleWidth      =   5505
   Top             =   165
   Width           =   5625
   Begin HScrollBar optNiveau 
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   1800
      Visible         =   0   'False
      Width           =   1215
   End
   Begin TextBox txtExtension 
      Height          =   495
      Left            =   0
      TabIndex        =   5
      Text            =   "Text1"
      Top             =   1200
      Visible         =   0   'False
      Width           =   1215
   End
   Begin CommandButton btnDoc 
      Caption         =   "Documents associés"
      Height          =   375
      Left            =   3480
      TabIndex        =   18
      Top             =   1800
      Width           =   1935
   End
   Begin CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   375
      Left            =   3480
      TabIndex        =   16
      Top             =   2280
      Width           =   1935
   End
   Begin CommandButton btnSuggRemplace 
      Caption         =   "&Remplace"
      Height          =   375
      Left            =   120
      TabIndex        =   12
      Top             =   5160
      Width           =   1215
   End
   Begin CommandButton btnSuggEnlève 
      Caption         =   "&Enlève"
      Height          =   375
      Left            =   120
      TabIndex        =   11
      Top             =   4680
      Width           =   1215
   End
   Begin CommandButton btnSuggAjoute 
      Caption         =   "&Ajoute"
      Height          =   375
      Left            =   120
      TabIndex        =   10
      Top             =   4200
      Width           =   1215
   End
   Begin ListBox lstTexte 
      Height          =   615
      Index           =   0
      Left            =   120
      TabIndex        =   14
      Top             =   3480
      Visible         =   0   'False
      Width           =   735
   End
   Begin ListBox lstTitre 
      Height          =   2565
      Index           =   0
      Left            =   1440
      TabIndex        =   9
      Top             =   2880
      Visible         =   0   'False
      Width           =   3975
   End
   Begin CommandButton cmdAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   1440
      TabIndex        =   7
      Top             =   2280
      Width           =   1935
   End
   Begin CommandButton cmdOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   1440
      TabIndex        =   6
      Top             =   1800
      Width           =   1935
   End
   Begin TextBox txtTexte 
      Height          =   1215
      Left            =   1440
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   3
      Top             =   480
      Width           =   3975
   End
   Begin TextBox txtTitre 
      Height          =   285
      Left            =   1440
      TabIndex        =   1
      Top             =   120
      Width           =   3975
   End
   Begin Label lblAide 
      BackStyle       =   0  'Transparent
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   495
      Left            =   120
      TabIndex        =   17
      Top             =   5760
      Width           =   5295
   End
   Begin Line Line2 
      X1              =   120
      X2              =   5400
      Y1              =   5640
      Y2              =   5640
   End
   Begin Line Line1 
      X1              =   120
      X2              =   5400
      Y1              =   2760
      Y2              =   2760
   End
   Begin Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "&Suggestions :"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   2880
      Width           =   1215
   End
   Begin Label lblE 
      Caption         =   "lblE"
      Height          =   255
      Left            =   120
      TabIndex        =   15
      Top             =   2160
      Visible         =   0   'False
      Width           =   735
   End
   Begin Label lblDef 
      Caption         =   "lblDef"
      Height          =   255
      Left            =   120
      TabIndex        =   13
      Top             =   2400
      Visible         =   0   'False
      Width           =   735
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

Sub lstTitre_GotFocus (Index As Integer)
  lblAide = "Sélectionner une suggestion dans la liste."
End Sub

Sub optNiveau_Change ()
  ColorBox txtTexte, optNiveau
End Sub

Sub optNiveau_GotFocus ()
  lblAide.Caption = "Choisissez le niveau voulu parmi les 5 niveaux proposés. La description détaillée sera colorée en conséquence."
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
  lblAide.Caption = "Commande système qui sera lancée lors du clic sur le bouton extension (flèche droite). Le caractère $ sera remplacé par le nom du répertoire projet. Exemple: winword $\accueil.doc"
End Sub

Sub txtTexte_GotFocus ()
  RécupFocus txtTexte
  lblAide = "Saisir un texte descriptif, qui apparaîtra dana la colonne de droite. Ctrl+Entrée pour insérer une nouvelle ligne."
End Sub

Sub txtTitre_GotFocus ()
  RécupFocus txtTitre
  lblAide = "Saisir une ligne de titre, ou la choisir dans la liste des suggestions"
End Sub

