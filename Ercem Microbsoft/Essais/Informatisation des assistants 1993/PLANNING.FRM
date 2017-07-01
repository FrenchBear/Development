VERSION 2.00
Begin Form frmPlanning 
   Caption         =   "Assistant Informatique Ercem  -  Planning"
   ClientHeight    =   6405
   ClientLeft      =   1320
   ClientTop       =   1875
   ClientWidth     =   9450
   Height          =   7035
   Icon            =   PLANNING.FRX:0000
   Left            =   1290
   LinkTopic       =   "Feuille2"
   ScaleHeight     =   6405
   ScaleWidth      =   9450
   Top             =   1275
   Width           =   9510
   Begin ListBox lstPlanning 
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   3150
      Left            =   225
      TabIndex        =   0
      Top             =   525
      Width           =   9015
   End
   Begin Label lblNomAssistant 
      Caption         =   "Nom Assistant"
      Height          =   315
      Left            =   1575
      TabIndex        =   2
      Top             =   225
      Width           =   6540
   End
   Begin Label lblDate 
      Caption         =   "Date"
      Height          =   240
      Left            =   225
      TabIndex        =   1
      Top             =   225
      Width           =   1215
   End
   Begin Menu mnuAffiche 
      Caption         =   "&Affiche"
      Begin Menu cmdFichePrélèvement 
         Caption         =   "Fiche de &Prélèvement  Entrée"
      End
      Begin Menu cmdTiret 
         Caption         =   "-"
      End
      Begin Menu cmdQuitter 
         Caption         =   "&Quitter                          Alt+F4"
      End
   End
End
Option Explicit

Sub cmdFichePrélèvement_Click ()
  lstPlanning_DblClick
End Sub

Sub cmdQuitter_Click ()
  Quitter
End Sub

Sub Form_Activate ()
  windowstate = 2
End Sub

Sub Form_Load ()
  Dim Ref As String, NumEtb As String, NomEtb As String, nbAB As String, nbGE As String
  InitFont lstPlanning
  ChDir "\ERCEM"
  Open "PLANNING.TXT" For Input As #1
  Input #1, gDate
  Input #1, gNomAssistant
  lblDate = Date
  lblNomAssistant = gNomAssistant
  While Not EOF(1)
    Input #1, Ref, NumEtb, NomEtb, nbAB, nbGE
    lstPlanning.AddItem Ref & Space(7 - Len(NumEtb)) & NumEtb & "  " & NomEtb & Space(42 - Len(NomEtb)) & nbAB & Space(3 - Len(nbAB)) & nbGE
  Wend
  Close #1
  windowstate = 2
  lstPlanning.ListIndex = 0
End Sub

Sub lstPlanning_DblClick ()
  If lstPlanning.ListIndex < 0 Then Exit Sub
  frmFichePrélèvement.Show
  gRef = Left(lstPlanning, 7)
  gNumEtb = Mid(lstPlanning, 10, 5)
  gNometb = Mid(lstPlanning, 17, 41)
  gNbAB = Mid(lstPlanning, 58, 2)
  gNbGE = Mid(lstPlanning, 61, 2)
  frmFichePrélèvement.lblRef = gRef & ".01"
  frmFichePrélèvement.lblEtablissement = gNumEtb & " " & gNometb
  frmFichePrélèvement.lblDateAssistant = gDate & " " & gNomAssistant
  frmPlanning.Hide
End Sub

Sub lstPlanning_KeyPress (KeyAscii As Integer)
  If KeyAscii = 13 Then lstPlanning_DblClick
End Sub

