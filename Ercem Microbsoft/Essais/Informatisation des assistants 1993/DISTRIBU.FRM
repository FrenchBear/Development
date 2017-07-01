VERSION 2.00
Begin Form frmDistributeurs 
   Caption         =   "Assistant Informatique Ercem - Fichier Distributeurs"
   ClientHeight    =   6030
   ClientLeft      =   1125
   ClientTop       =   1650
   ClientWidth     =   9465
   FontTransparent =   0   'False
   Height          =   6375
   Left            =   1095
   LinkTopic       =   "Feuille1"
   ScaleHeight     =   6030
   ScaleWidth      =   9465
   Top             =   1335
   Width           =   9525
   Begin ComboBox lstDistributeurs 
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   5292
      Left            =   120
      Style           =   1  'Liste modifiable simple
      TabIndex        =   0
      Top             =   120
      Width           =   9252
   End
End
Option Explicit

Sub ChargeDistributeurs ()
  Dim dis_numdis As Long, dis_nom As String

  ChDir "\ERCEM"
  Open "DISTRIBU.TXT" For Input As #1
  
  Do Until EOF(1)
    Input #1, dis_numdis, dis_nom
    lstDistributeurs.AddItem dis_nom & Space(42 - Len(dis_nom)) & dis_numdis
  Loop

  Close #1
End Sub

Sub Form_Load ()
  InitForm Me, lstDistributeurs
  ChargeDistributeurs
  lstDistributeurs = ""
End Sub

Sub Form_Unload (Cancel As Integer)
  Quitter
End Sub

Sub lstDistributeurs_DblClick ()
  Dim nd As Long
  nd = Val(Mid(lstDistributeurs, 42))
  If nd > 0 Then
    frmFichePrélèvement!txtNumDis = nd
    frmFichePrélèvement!lblNomDis = Left(lstDistributeurs, 41)
  Else
    frmFichePrélèvement!txtNumDis = ""
    frmFichePrélèvement!lblNomDis = ""
  End If
  Me.Hide
End Sub

Sub lstDistributeurs_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then lstDistributeurs_DblClick
  If KeyCode = 27 Then Me.Hide
End Sub

