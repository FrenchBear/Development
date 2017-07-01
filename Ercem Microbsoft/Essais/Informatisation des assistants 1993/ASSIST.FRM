VERSION 2.00
Begin Form Feuille1 
   Caption         =   "Feuille1"
   ClientHeight    =   5820
   ClientLeft      =   240
   ClientTop       =   1200
   ClientWidth     =   9315
   Height          =   6225
   Left            =   180
   LinkTopic       =   "Feuille1"
   ScaleHeight     =   5820
   ScaleWidth      =   9315
   Top             =   855
   Width           =   9435
   Begin Data datCatégories 
      Caption         =   "Catégories"
      Connect         =   ""
      DatabaseName    =   "C:\ERCEM\ASSIST.MDB"
      Exclusive       =   -1  'True
      Height          =   270
      Left            =   0
      Options         =   0
      ReadOnly        =   0   'False
      RecordSource    =   ""
      Top             =   4920
      Visible         =   0   'False
      Width           =   1935
   End
   Begin TextBox pro_critère 
      DataField       =   "pro_critère"
      DataSource      =   "datProduits"
      Height          =   285
      Left            =   2760
      TabIndex        =   9
      Top             =   4560
      Visible         =   0   'False
      Width           =   255
   End
   Begin TextBox pro_cat 
      DataField       =   "pro_cat"
      DataSource      =   "datProduits"
      Height          =   285
      Left            =   2520
      TabIndex        =   6
      Top             =   4560
      Visible         =   0   'False
      Width           =   255
   End
   Begin ListBox Liste 
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   5490
      Left            =   3840
      TabIndex        =   3
      Top             =   120
      Width           =   5415
   End
   Begin CommandButton btnRecherche 
      Caption         =   "&Recherche"
      Default         =   -1  'True
      Height          =   375
      Left            =   2520
      TabIndex        =   2
      Top             =   0
      Width           =   1215
   End
   Begin TextBox txtProduit 
      Height          =   285
      Left            =   240
      TabIndex        =   1
      Top             =   480
      Width           =   3495
   End
   Begin TextBox pro_nom 
      DataField       =   "pro_nom"
      DataSource      =   "datProduits"
      Height          =   285
      Left            =   2280
      TabIndex        =   5
      Top             =   4560
      Visible         =   0   'False
      Width           =   255
   End
   Begin TextBox pro_numpro 
      DataField       =   "pro_numpro"
      DataSource      =   "datProduits"
      Height          =   285
      Left            =   2040
      TabIndex        =   4
      Top             =   4560
      Visible         =   0   'False
      Width           =   255
   End
   Begin Data datProduits 
      Caption         =   "Produits"
      Connect         =   ""
      DatabaseName    =   "C:\ERCEM\ASSIST.MDB"
      Exclusive       =   -1  'True
      Height          =   270
      Left            =   0
      Options         =   0
      ReadOnly        =   0   'False
      RecordSource    =   "Produits"
      Top             =   4560
      Visible         =   0   'False
      Width           =   1935
   End
   Begin Label Etiquette4 
      AutoSize        =   -1  'True
      Caption         =   "Cat"
      Height          =   195
      Left            =   840
      TabIndex        =   11
      Top             =   1080
      Width           =   300
   End
   Begin Label Etiquette3 
      AutoSize        =   -1  'True
      Caption         =   "Cat"
      Height          =   195
      Left            =   240
      TabIndex        =   10
      Top             =   1080
      Width           =   300
   End
   Begin Label Etiquette2 
      AutoSize        =   -1  'True
      Caption         =   "Critère"
      Height          =   195
      Left            =   240
      TabIndex        =   8
      Top             =   840
      Width           =   570
   End
   Begin Label lblCritère 
      AutoSize        =   -1  'True
      Caption         =   "Critère"
      Height          =   195
      Left            =   840
      TabIndex        =   7
      Top             =   840
      Width           =   570
   End
   Begin Label Etiquette1 
      AutoSize        =   -1  'True
      Caption         =   "&Produit"
      Height          =   195
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   615
   End
End
Option Explicit

Dim iChamp As Integer

Sub btnRecherche_Click ()
  btnRecherche.SetFocus
  Select Case iChamp
    Case 1: RechercheProduit
  End Select
End Sub

Sub Liste_Click ()
  Dim iPro As Long

  Select Case iChamp
    Case 1
      iPro = Val(Liste.Text)
      datProduits.RecordSource = "SELECT * FROM Produits WHERE pro_numpro=" & iPro
      datProduits.Refresh
      datProduits.Recordset.MoveFirst
      On Error GoTo 0
      lblCritère.Caption = "Critère du produit: " & pro_critère
  End Select
End Sub

Sub OteAccents (s As String)
  Dim p As Integer
  s = LCase(UCase(s))
  Do
    p = InStr(s, "ç")
    If p = 0 Then Exit Do
    Mid(s, p, 1) = "c"
  Loop
End Sub

Sub RechercheProduit ()
  Dim np As Integer, nom As String
  
  Liste.Clear
  Liste.Refresh
  
  lblCritère.Caption = ""
  lblCritère.Refresh
  
  nom = txtProduit.Text
  If Right(nom, 1) <> "*" Then nom = nom & "*"
  OteAccents nom
  txtProduit.Text = nom
  datProduits.RecordSource = "SELECT * FROM Produits WHERE pro_nom like '" & txtProduit.Text & "';"
  datProduits.Refresh
  On Error Resume Next
  datProduits.Recordset.MoveFirst
  On Error GoTo 0
  np = 0
  Do Until datProduits.Recordset.EOF
    Liste.AddItem pro_numpro & Chr(9) & pro_nom
    datProduits.Recordset.MoveNext
    np = np + 1
  Loop
  If np = 0 Then Liste.AddItem "Aucun produit ne correspond au critère !"
  txtProduit.SetFocus
End Sub

Sub txtProduit_GotFocus ()
  iChamp = 1
  txtProduit.SelStart = 0
  txtProduit.SelLength = 999
End Sub

