VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Analyse HTML"
   ClientHeight    =   9855
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   6645
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   9855
   ScaleWidth      =   6645
   Begin VB.TextBox txtFichier 
      Height          =   285
      Left            =   945
      TabIndex        =   4
      Text            =   "Phogre1.htm"
      Top             =   1050
      Width           =   3480
   End
   Begin VB.TextBox txtDossier 
      Height          =   285
      Left            =   945
      TabIndex        =   1
      Text            =   "D:\FrontPage Webs\Content\Sites\Grenoble"
      Top             =   525
      Width           =   3480
   End
   Begin VB.CommandButton btnAnalyse 
      Caption         =   "&Analyse"
      Height          =   435
      Left            =   5250
      TabIndex        =   0
      Top             =   420
      Width           =   1170
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Fichier :"
      Height          =   195
      Left            =   210
      TabIndex        =   3
      Top             =   1050
      Width           =   555
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Dossier :"
      Height          =   195
      Left            =   210
      TabIndex        =   2
      Top             =   525
      Width           =   615
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim sRacine As String, sLRacine As String, sLLRacine As String
Dim sTitre As String, sLTitre As String

Sub GénèreFichier()
  Print sRacine
  Open txtDossier & "\" & sLRacine & ".htm" For Output As #2
  Print #2, "<html>"
  Print #2, "<head><title>" & sLTitre & "</title>"
  Print #2, "<body>"
  Print #2, "<h1>" & sLTitre & "</h1>"
  If sRacine <> "" Then Print #2, "<a href=" & Chr(34) & sRacine & ".htm" & Chr(34) & ">Suiv</a> "
  If sLLRacine <> "" Then Print #2, "<a href=" & Chr(34) & sLLRacine & ".htm" & Chr(34) & ">Prec</a> "
  Print #2, "<a href=" & Chr(34) & txtFichier & Chr(34) & ">Ensemble</a> "
  Print #2, "<a href=" & Chr(34) & "p250/" & sLRacine & ".jpg" & Chr(34) & ">250%</a> "
  Print #2, "<a href=" & Chr(34) & "index.htm" & Chr(34) & ">Site</a><p>"
  Print #2, "<img src=" & Chr(34) & "p125/" & sLRacine & ".jpg" & Chr(34) & ">"
  Print #2, "</body>"
  Close #2
End Sub

Private Sub btnAnalyse_Click()
  Dim p As Integer, pp As Integer
  Dim l As String
  Dim iPasse As Integer
  Dim sRep As String
  Dim txtFic As String
  
  txtFichier = LCase(txtFichier)
  txtFic = txtDossier & "\" & txtFichier
  
  iPasse = 0
  Open txtFic For Input As #1
  While Not EOF(1)
    Line Input #1, l
    p = InStr(l, ".htm")
    If p <> 0 And Left(l, 2) = "  " Then
      p = InStr(l, "/")
      pp = InStr(p, l, ".")
      sRacine = Mid(l, p + 1, pp - p - 1)
      Line Input #1, l
      sTitre = Mid(l, 3, Len(l) - 6)
      iPasse = iPasse + 1
      If iPasse > 1 Then GénèreFichier
      sLLRacine = sLRacine
      sLRacine = sRacine
      sLTitre = sTitre
    End If
  Wend
  Close #1
  sRacine = ""
  GénèreFichier
End Sub
