VERSION 2.00
Begin Form frmFabricants 
   Caption         =   "Assistant Informatique Ercem - Fichier Fabricants"
   ClientHeight    =   6150
   ClientLeft      =   1125
   ClientTop       =   1650
   ClientWidth     =   9465
   FontTransparent =   0   'False
   Height          =   6495
   Left            =   1095
   LinkTopic       =   "Feuille1"
   ScaleHeight     =   6150
   ScaleWidth      =   9465
   Top             =   1335
   Width           =   9525
   Begin ComboBox lstFabricants 
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   5292
      Index           =   0
      Left            =   120
      Style           =   1  'Liste modifiable simple
      TabIndex        =   0
      Top             =   120
      Width           =   9252
   End
   Begin Label lblNbfab 
      Caption         =   "Nb"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   5760
      Width           =   495
   End
End
Option Explicit

Sub ChargeFabricants ()
  Dim fab_numfab As Long, fab_nom As String
  Dim c1a As Integer, nf As Integer

  ChDir "\ERCEM"
  Open "FABRICAN.TXT" For Input As #1
  
  nf = 0
  Do Until EOF(1)
    Input #1, fab_numfab, fab_nom
    nf = nf + 1
    If nf Mod 100 = 0 Then
      lblNbfab = nf
      lblNbfab.Refresh
    End If
    c1a = Asc(fab_nom)
    If c1a >= 65 And c1a <= 90 Then
      lstFabricants(c1a - 64).AddItem fab_nom & Space(42 - Len(fab_nom)) & fab_numfab
    Else
      lstFabricants(0).AddItem fab_nom & Space(42 - Len(fab_nom)) & fab_numfab
    End If
  Loop
  lblNbfab = ""

  Close #1
End Sub

Sub Form_Load ()
  Dim i As Integer
  InitForm Me, lstFabricants(0)
  Show
  For i = 1 To 26
    Load lstFabricants(i)
    lstFabricants(i).Visible = True
  Next
  ChargeFabricants
  lstFabricants(1).ZOrder
  lstFabricants(1).SetFocus
  lstFabricants(1) = ""
End Sub

Sub lstFabricants_Change (Index As Integer)
  Dim c1 As String, c1a As Integer

  If Len(lstFabricants(Index).Text) Then
    c1 = UCase(Left(lstFabricants(Index).Text, 1))
    If c1 = "Ç" Then c1 = "C"
    If c1 >= "A" And c1 <= "Z" Then c1a = Asc(c1) - 64 Else c1a = 0
    If Index <> c1a Then
      lstFabricants(c1a).Text = lstFabricants(Index).Text
      lstFabricants(c1a).ZOrder
      lstFabricants(c1a).SetFocus
      lstFabricants(c1a).SelStart = 999
      lstFabricants(c1a).SelLength = 0
    End If
  End If
End Sub

Sub lstFabricants_DblClick (Index As Integer)
  Dim nd As Long
  nd = Val(Mid(lstFabricants(Index), 42))
  If nd > 0 Then
    frmFichePrélèvement!txtNumFab = nd
    frmFichePrélèvement!lblNomFab = Left(lstFabricants(Index), 41)
  Else
    frmFichePrélèvement!txtNumFab = ""
    frmFichePrélèvement!lblNomFab = ""
  End If
  Me.Hide
End Sub

Sub lstFabricants_KeyDown (Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then lstFabricants_DblClick (Index)
  If KeyCode = 27 Then Me.Hide
End Sub

