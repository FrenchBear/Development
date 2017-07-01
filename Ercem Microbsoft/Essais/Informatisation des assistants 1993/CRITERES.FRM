VERSION 2.00
Begin Form frmCritères 
   Caption         =   "Assistant Informatique Ercem - Fichier Critères"
   ClientHeight    =   6000
   ClientLeft      =   780
   ClientTop       =   1305
   ClientWidth     =   9465
   FontTransparent =   0   'False
   Height          =   6405
   Left            =   720
   LinkTopic       =   "Feuille1"
   ScaleHeight     =   6000
   ScaleWidth      =   9465
   Top             =   960
   Width           =   9585
   Begin ComboBox lstCritères 
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
      Width           =   9276
   End
End
Option Explicit

Sub ChargeCritères ()
  Dim cri_critère As String, cri_titre1 As String

  ChDir "\ERCEM"
  Open "CRITERES.TXT" For Input As #1
  
  Do Until EOF(1)
    Input #1, cri_critère, cri_titre1
    lstCritères.AddItem cri_critère & Space(5 - Len(cri_critère)) & cri_titre1
  Loop

  Close #1
End Sub

Sub Form_Load ()
  InitForm Me, lstCritères
  ChargeCritères
  lstCritères = ""
End Sub

Sub Form_Unload (Cancel As Integer)
  Quitter
End Sub

Sub lstCritères_DblClick ()
  If InStr(lstCritères, " ") Then
    frmFichePrélèvement!txtCritère = Left(lstCritères, InStr(lstCritères, " "))
  Else
    frmFichePrélèvement!txtCritère = ""
  End If
  Me.Hide
End Sub

Sub lstCritères_KeyDown (KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then lstCritères_DblClick
  If KeyCode = 27 Then Me.Hide
End Sub

