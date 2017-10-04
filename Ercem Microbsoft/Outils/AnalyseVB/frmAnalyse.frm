VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.2#0"; "MSCOMCTL.OCX"
Begin VB.Form frmAnalyse 
   AutoRedraw      =   -1  'True
   Caption         =   "Analyseur VB"
   ClientHeight    =   6048
   ClientLeft      =   60
   ClientTop       =   348
   ClientWidth     =   6816
   LinkTopic       =   "Form1"
   ScaleHeight     =   6048
   ScaleWidth      =   6816
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtFichierEnCours 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   60
      Locked          =   -1  'True
      TabIndex        =   5
      Top             =   300
      Width           =   5475
   End
   Begin VB.CommandButton btnQuitter 
      Cancel          =   -1  'True
      Caption         =   "&Quitter"
      Height          =   375
      Left            =   1380
      TabIndex        =   4
      Top             =   5580
      Width           =   1215
   End
   Begin MSComctlLib.ListView lwHistorique 
      Height          =   1995
      Left            =   60
      TabIndex        =   3
      Top             =   960
      Width           =   6675
      _ExtentX        =   11769
      _ExtentY        =   3514
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Fichier"
         Object.Width           =   7056
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Lignes"
         Object.Width           =   1764
      EndProperty
   End
   Begin VB.TextBox txtLigneEnCours 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   5640
      Locked          =   -1  'True
      TabIndex        =   2
      Top             =   300
      Width           =   1095
   End
   Begin VB.CommandButton btnAnalyse 
      Caption         =   "&Analyser"
      Default         =   -1  'True
      Height          =   375
      Left            =   60
      TabIndex        =   0
      Top             =   5580
      Width           =   1215
   End
   Begin MSComctlLib.ListView lwProblèmes 
      Height          =   2175
      Left            =   60
      TabIndex        =   7
      Top             =   3240
      Width           =   6675
      _ExtentX        =   11769
      _ExtentY        =   3831
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Problème"
         Object.Width           =   14111
      EndProperty
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Problèmes :"
      Height          =   195
      Left            =   60
      TabIndex        =   8
      Top             =   3000
      Width           =   825
   End
   Begin VB.Label lblProjet 
      AutoSize        =   -1  'True
      Caption         =   "Projet :"
      Height          =   195
      Left            =   120
      TabIndex        =   6
      Top             =   720
      Width           =   495
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "En cours d'analyse :"
      Height          =   195
      Left            =   60
      TabIndex        =   1
      Top             =   60
      Width           =   1425
   End
End
Attribute VB_Name = "frmAnalyse"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' AnalyseVB
' Analyseur de programmes Visual Basic
' Détecte les variables inutilisées
' 15/02/1998 PV

Option Explicit

Private sBase As String

Private Sub btnAnalyse_Click()
  AnalyseProjet "C:\Users\J3ZG\Desktop\AnalyseVB\AnalyseVB.vbp"
  'AnalyseProjet "D:\Microbsoft\Scraw\Scraw.vbp"
  'AnalyseProjet "D:\Microbsoft\Plannings\Plannings.vbp"
End Sub

Sub AnalyseProjet(ByVal sNomProjet As String)
  Dim sLigne As String
  Dim i As Integer
  Dim iTotal As Long                  ' Nb de lignes analysées au total
  Dim t0 As Single                    ' Heure de début d'analyse
  
  lblProjet = "Projet " & sNomProjet
  lwHistorique.ListItems.Clear
  t0 = Timer
  
  ' On se place dans le répertoire du projet
  For i = Len(sNomProjet) To 0 Step -1
    If Mid(sNomProjet, i, 1) = "\" Then Exit For
  Next
  If i > 0 Then sBase = Left(sNomProjet, i) Else sBase = ""
  
  ' On parcourt les types de fichiers connus
  Open sNomProjet For Input As #3
  Open sBase & "Symboles inutilisés.token" For Output As #4
  While Not EOF(3)
    Line Input #3, sLigne
    If LCase(Left(sLigne, 7)) = "module=" Or LCase(Left(sLigne, 5)) = "form=" Or LCase(Left(sLigne, 6)) = "class=" Or LCase(Left(sLigne, 12)) = "usercontrol=" Then
      Dim p As Integer
      p = InStr(sLigne, "; ")
      If p <> 0 Then
        p = p + 2
      Else
        p = InStr(sLigne, "=") + 1
      End If
      
      txtFichierEnCours = sBase & Mid(sLigne, p)
      txtFichierEnCours.Refresh
      AnalyseFichier sBase & Mid(sLigne, p)
      iTotal = iTotal + iNuméroLigne
      HistoLigne Mid(sLigne, p), iNuméroLigne
      lwHistorique.Refresh
      
      DoEvents
    End If
  Wend
  Close #3
  
  ' Table des symboles globale
  Open sBase & "Symboles globaux.token" For Output As #2
  SorTableSymboles poGlobal
  SorTableSymboles poInconnue
  Close #2
  Close #4
  
  t0 = Timer - t0
  If t0 < 0 Then t0 = t0 + 24 * 60 * 60
  
  txtFichierEnCours = ""
  txtLigneEnCours = ""
  HistoLigne "", 0
  HistoLigne "Durée: " & Format(t0, "#.0") & " s (" & Int(iTotal / t0) & " lignes/s)", iTotal
End Sub

Private Function HistoLigne(ByVal sFichier As String, ByVal iLignes As Long)
  Dim x As ListItem
  Set x = lwHistorique.ListItems.Add
  x.Text = sFichier
  If iLignes > 0 Then x.SubItems(1) = iLignes
End Function

Private Sub btnQuitter_Click()
  Unload Me
End Sub

Public Sub AddProblème(ByVal sMessage As String)
  Dim x As ListItem
  Set x = lwProblèmes.ListItems.Add
  x.Text = sMessage
  
  Print #4, sMessage
End Sub
