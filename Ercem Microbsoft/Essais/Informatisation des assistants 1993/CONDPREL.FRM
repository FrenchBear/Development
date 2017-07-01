VERSION 2.00
Begin Form frmConditionsPrélèvement 
   Caption         =   "Assistant Informatique Ercem - Fichier Conditions de prélèvement"
   ClientHeight    =   5985
   ClientLeft      =   1800
   ClientTop       =   2340
   ClientWidth     =   9465
   FontTransparent =   0   'False
   Height          =   6330
   Left            =   1770
   LinkTopic       =   "Feuille1"
   ScaleHeight     =   5985
   ScaleWidth      =   9465
   Top             =   2025
   Width           =   9525
   Begin ComboBox lstConditionsPrélèvement 
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

Sub ChargeConditionsPrélèvement ()
  Dim cpr_indice As String, cpr_libellé As String

  ChDir "\ERCEM"
  Open "CONDPREL.TXT" For Input As #1
  
  Do Until EOF(1)
    Input #1, cpr_indice, cpr_libellé
    lstConditionsPrélèvement.AddItem cpr_indice & Space(3 - Len(cpr_indice)) & cpr_libellé
  Loop

  Close #1
End Sub

Sub Form_Load ()
  InitForm Me, lstConditionsPrélèvement
  ChargeConditionsPrélèvement
  lstConditionsPrélèvement = ""
End Sub

Sub Form_Unload (Cancel As Integer)
  Quitter
End Sub

Sub lstConditionsPrélèvement_DblClick ()
  If Val(lstConditionsPrélèvement) > 0 Then
    frmFichePrélèvement!txtCondPrél = Val(lstConditionsPrélèvement)
    frmFichePrélèvement!lblCondPrél = Mid(lstConditionsPrélèvement, 4)
  Else
    frmFichePrélèvement!txtCondPrél = ""
    frmFichePrélèvement!lblCondPrél = ""
  End If
  Me.Hide
End Sub

Sub lstConditionsPrélèvement_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then lstConditionsPrélèvement_DblClick
  If KeyCode = 27 Then Me.Hide
End Sub

