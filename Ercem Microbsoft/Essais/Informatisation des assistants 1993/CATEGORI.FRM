VERSION 2.00
Begin Form frmCat�gories 
   Caption         =   "Assistant Informatique Ercem - Fichier Cat�gories"
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
   Begin ComboBox lstCat�gories 
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

Sub ChargeCat�gories ()
  Dim cat_indice As String, cat_libell� As String

  ChDir "\ERCEM"
  Open "CATEGORI.TXT" For Input As #1
  
  Do Until EOF(1)
    Input #1, cat_indice, cat_libell�
    lstCat�gories.AddItem cat_indice & Space(3 - Len(cat_indice)) & cat_libell�
  Loop

  Close #1
End Sub

Sub Form_Load ()
  InitForm Me, lstCat�gories
  ChargeCat�gories
  lstCat�gories = ""
End Sub

Sub Form_Unload (Cancel As Integer)
  Quitter
End Sub

Sub lstCat�gories_DblClick ()
  If Val(lstCat�gories) > 0 Then
    frmFichePr�l�vement!txtCat�gorie = Val(lstCat�gories)
  Else
    frmFichePr�l�vement!txtCat�gorie = ""
  End If
  Me.Hide
End Sub

Sub lstCat�gories_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then lstCat�gories_DblClick
  If KeyCode = 27 Then Me.Hide
End Sub

