VERSION 2.00
Begin Form frmCatégories 
   Caption         =   "Assistant Informatique Ercem - Fichier Catégories"
   ClientHeight    =   6030
   ClientLeft      =   1185
   ClientTop       =   1950
   ClientWidth     =   9465
   FontTransparent =   0   'False
   Height          =   6375
   Icon            =   0
   Left            =   1155
   LinkTopic       =   "Feuille1"
   ScaleHeight     =   6030
   ScaleWidth      =   9465
   Top             =   1635
   Width           =   9525
   Begin ComboBox lstCatégories 
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

Sub ChargeCatégories ()
  Dim cat_indice As String, cat_libellé As String

  ChDir "\ERCEM"
  Open "CATEGORI.TXT" For Input As #1
  
  Do Until EOF(1)
    Input #1, cat_indice, cat_libellé
    lstCatégories.AddItem cat_indice & Space(3 - Len(cat_indice)) & cat_libellé
  Loop

  Close #1
End Sub

Sub Form_Load ()
  InitForm Me, lstCatégories
  ChargeCatégories
  lstCatégories = ""
End Sub

Sub Form_Unload (Cancel As Integer)
  Quitter
End Sub

Sub lstCatégories_DblClick ()
  If Val(lstCatégories) > 0 Then
    frmFichePrélèvement!txtCatégorie = Val(lstCatégories)
  Else
    frmFichePrélèvement!txtCatégorie = ""
  End If
  Me.Hide
End Sub

Sub lstCatégories_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then lstCatégories_DblClick
  If KeyCode = 27 Then Me.Hide
End Sub

