VERSION 2.00
Begin Form frmProduits 
   Caption         =   "Assistant Informatique Ercem - Fichier Produits"
   ClientHeight    =   6150
   ClientLeft      =   450
   ClientTop       =   1230
   ClientWidth     =   9465
   FontTransparent =   0   'False
   Height          =   6780
   Left            =   420
   LinkTopic       =   "Feuille1"
   ScaleHeight     =   6150
   ScaleWidth      =   9465
   Top             =   630
   Width           =   9525
   Begin ComboBox lstProduits 
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   -1  'True
      Height          =   5292
      Index           =   0
      Left            =   120
      Style           =   1  'Liste modifiable simple
      TabIndex        =   0
      Top             =   120
      Width           =   9252
   End
   Begin Label lblNbpro 
      Caption         =   "Nb"
      Height          =   252
      Left            =   120
      TabIndex        =   1
      Top             =   5880
      Width           =   492
   End
   Begin Menu mnuAffichage 
      Caption         =   "&Affichage"
      Begin Menu cmdAffiche 
         Caption         =   "Plannin&g"
         Index           =   0
         Shortcut        =   {F1}
      End
      Begin Menu cmdAffiche 
         Caption         =   "-"
         Index           =   1
      End
      Begin Menu cmdAffiche 
         Caption         =   "&Produits"
         Index           =   2
         Shortcut        =   {F2}
      End
      Begin Menu cmdAffiche 
         Caption         =   "C&ritères"
         Index           =   3
         Shortcut        =   {F3}
      End
      Begin Menu cmdAffiche 
         Caption         =   "C&atégories"
         Index           =   4
         Shortcut        =   {F4}
      End
      Begin Menu cmdAffiche 
         Caption         =   "Con&ditionnements"
         Index           =   5
         Shortcut        =   {F5}
      End
      Begin Menu cmdAffiche 
         Caption         =   "C&onditions de prélèvement"
         Index           =   6
         Shortcut        =   {F6}
      End
      Begin Menu cmdAffiche 
         Caption         =   "&Fabricants"
         Index           =   7
         Shortcut        =   {F7}
      End
      Begin Menu cmdAffiche 
         Caption         =   "&Distributeurs"
         Index           =   8
         Shortcut        =   {F8}
      End
      Begin Menu cmdAffiche 
         Caption         =   "&Libellés standard"
         Index           =   9
         Shortcut        =   {F9}
      End
      Begin Menu cmdAffiche 
         Caption         =   "-"
         Index           =   10
      End
      Begin Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
End
Option Explicit

Sub ChargeProduits ()
  Dim pro_numpro As String, pro_nom As String, pro_critère As String, pro_type As Integer, pro_cat As String
  Dim np As Integer, c1p As Integer

  ChDir "\ERCEM"
  Open "PRODUITS.TXT" For Input As #1
  
  np = 0
  Do Until EOF(1)
    Input #1, pro_numpro, pro_nom, pro_critère, pro_type, pro_cat
    np = np + 1
    If np Mod 100 = 0 Then
      lblNbpro = np
      lblNbpro.Refresh
    End If
    c1p = Asc(pro_nom)
    If c1p >= 65 And c1p <= 90 Then
      lstProduits(c1p - 64).AddItem pro_nom & Space(64 - Len(pro_nom) - Len(pro_numpro)) & pro_numpro & "  " & pro_critère & Space(6 - Len(pro_critère) - Len(pro_cat)) & pro_cat
    Else
      lstProduits(0).AddItem pro_nom & Space(64 - Len(pro_nom) - Len(pro_numpro)) & pro_numpro & "  " & pro_critère & Space(6 - Len(pro_critère) - Len(pro_cat)) & pro_cat
    End If
  Loop
  lblNbpro = ""

  Close #1
End Sub

Sub Form_Load ()
  Dim i As Integer
  InitForm Me, lstProduits(0)
  Show
  For i = 1 To 26
    Load lstProduits(i)
    lstProduits(i).Visible = True
  Next
  ChargeProduits
  lstProduits(1).ZOrder
  lstProduits(1).SetFocus
  lstProduits(1) = ""
End Sub

Sub Form_Unload (Cancel As Integer)
  Quitter
End Sub

Sub lstProduits_Change (Index As Integer)
  Dim c1 As String, c1a As Integer

  If Len(lstProduits(Index).Text) Then
    c1 = UCase(Left(lstProduits(Index).Text, 1))
    If c1 = "Ç" Then c1 = "C"
    If c1 >= "A" And c1 <= "Z" Then c1a = Asc(c1) - 64 Else c1a = 0
    If Index <> c1a Then
      lstProduits(c1a).Text = lstProduits(Index).Text
      lstProduits(c1a).ZOrder
      lstProduits(c1a).SetFocus
      lstProduits(c1a).SelStart = 999
      lstProduits(c1a).SelLength = 0
    End If
  End If
End Sub

Sub lstProduits_DblClick (Index As Integer)
  Dim np As Long
  np = Val(Mid(lstProduits(Index), 60, 5))
  If np > 0 Then
    frmFichePrélèvement!txtNumPro = np
    frmFichePrélèvement!lblNomPro = Left(lstProduits(Index), 58)
    frmFichePrélèvement!txtCatégorie = Mid(lstProduits(Index), 71, 2)
    frmFichePrélèvement!txtCritère = Mid(lstProduits(Index), 67, 4)
  Else
    frmFichePrélèvement!txtNumPro = ""
    frmFichePrélèvement!lblNomPro = ""
  End If
  Me.Hide
End Sub

Sub lstProduits_KeyDown (Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then lstProduits_DblClick (Index)
  If KeyCode = 27 Then Me.Hide
End Sub

