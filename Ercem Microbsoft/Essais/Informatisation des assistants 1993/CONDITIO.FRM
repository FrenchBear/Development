VERSION 2.00
Begin Form frmConditionnements 
   Caption         =   "Assistant Informatique Ercem - Fichier Conditionnements"
   ClientHeight    =   5985
   ClientLeft      =   1470
   ClientTop       =   1995
   ClientWidth     =   9465
   FontTransparent =   0   'False
   Height          =   6390
   Left            =   1410
   LinkTopic       =   "Feuille1"
   ScaleHeight     =   5985
   ScaleWidth      =   9465
   Top             =   1650
   Width           =   9585
   Begin ComboBox lstConditionnements 
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

Sub ChargeConditionnements ()
  Dim cdt_indice As String, cdt_libellé As String

  ChDir "\ERCEM"
  Open "CONDITIO.TXT" For Input As #1
  
  Do Until EOF(1)
    Input #1, cdt_indice, cdt_libellé
    lstConditionnements.AddItem cdt_indice & Space(3 - Len(cdt_indice)) & cdt_libellé
  Loop

  Close #1
End Sub

Sub Form_Load ()
  InitForm Me, lstConditionnements
  ChargeConditionnements
  lstConditionnements = ""
End Sub

Sub Form_Unload (Cancel As Integer)
  Quitter
End Sub

Sub lstConditionnements_DblClick ()
  If Val(lstConditionnements) > 0 Then
    frmFichePrélèvement!txtConditionnement = Val(lstConditionnements)
    frmFichePrélèvement!lblConditionnement = Mid(lstConditionnements, 4)
  Else
    frmFichePrélèvement!txtConditionnement = ""
    frmFichePrélèvement!lblConditionnement = ""
  End If
  Me.Hide
End Sub

Sub lstConditionnements_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then lstConditionnements_DblClick
  If KeyCode = 27 Then Me.Hide
End Sub

