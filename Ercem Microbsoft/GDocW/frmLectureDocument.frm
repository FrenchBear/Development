VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmLectureDocument 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Recherche de document"
   ClientHeight    =   3615
   ClientLeft      =   3060
   ClientTop       =   2775
   ClientWidth     =   5490
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmLectureDocument.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   241
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   366
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txtEtatDocument 
      Height          =   315
      Left            =   1620
      TabIndex        =   13
      Tag             =   "Entrez l'état des documents recherchés"
      Top             =   2220
      Width           =   1980
   End
   Begin VB.TextBox txtTypeDocument 
      Height          =   315
      Left            =   1620
      TabIndex        =   11
      Tag             =   "Entrez le type de document à sélectionner"
      Top             =   1860
      Width           =   1980
   End
   Begin VB.CheckBox chkOuter 
      Caption         =   "&Inclure les interventions sans document"
      Height          =   195
      Left            =   60
      TabIndex        =   16
      Top             =   3000
      Width           =   5355
   End
   Begin VB.ComboBox cboHorsDélai 
      Height          =   330
      ItemData        =   "frmLectureDocument.frx":0442
      Left            =   1620
      List            =   "frmLectureDocument.frx":0444
      Style           =   2  'Dropdown List
      TabIndex        =   15
      Tag             =   "Indiquez l'état des Documents recherchés."
      Top             =   2580
      Width           =   3795
   End
   Begin VB.TextBox txtPréfixe 
      Height          =   315
      Left            =   1620
      TabIndex        =   9
      Tag             =   "Entrez le préfixe établissement, ou un modèle terminé par *"
      Top             =   1500
      Width           =   1980
   End
   Begin VB.CommandButton btnEtablissement 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   3615
      Picture         =   "frmLectureDocument.frx":0446
      Style           =   1  'Graphical
      TabIndex        =   19
      Tag             =   "Cliquer pour rechercher un établissement."
      ToolTipText     =   "Cliquer pour rechercher un établissement."
      Top             =   1140
      Width           =   315
   End
   Begin VB.CommandButton btnUtilisateur 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   3615
      Picture         =   "frmLectureDocument.frx":0590
      Style           =   1  'Graphical
      TabIndex        =   18
      Tag             =   "Cliquer pour rechercher les lettres d'un assistant."
      ToolTipText     =   "Cliquer pour rechercher les lettres d'un assistant."
      Top             =   420
      Width           =   315
   End
   Begin VB.CommandButton btnCalendrier 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   3615
      Picture         =   "frmLectureDocument.frx":06DA
      Style           =   1  'Graphical
      TabIndex        =   17
      Tag             =   "Cliquer pour sélectionner la date dans un calendrier."
      ToolTipText     =   "Cliquer pour sélectionner la date dans un calendrier"
      Top             =   60
      Width           =   315
   End
   Begin VB.TextBox txtNumEtb 
      Height          =   315
      Left            =   1620
      TabIndex        =   7
      Tag             =   "Entrez le n° de l'établissement. F4 pour une recherche."
      Top             =   1140
      Width           =   1980
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   4080
      TabIndex        =   22
      Top             =   1020
      Width           =   1350
   End
   Begin VB.TextBox txtRéférence 
      Height          =   315
      Left            =   1620
      TabIndex        =   5
      Tag             =   "Entrez la référence d'intervention à rechercher (sans les lettres)."
      Top             =   780
      Width           =   1980
   End
   Begin VB.CommandButton btnFermer 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   4080
      TabIndex        =   21
      Top             =   480
      Width           =   1350
   End
   Begin VB.TextBox txtDate 
      Height          =   315
      Left            =   1620
      TabIndex        =   1
      Tag             =   "Date des documents à lire ou ATTENTE. F4 pour le calendrier."
      Top             =   60
      Width           =   1980
   End
   Begin VB.TextBox txtLettres 
      Height          =   315
      Left            =   1620
      TabIndex        =   3
      Tag             =   "Entrez les deux lettres de l'assistant. F4 pour une recherche."
      Top             =   420
      Width           =   1980
   End
   Begin VB.CommandButton btnChercher 
      Caption         =   "Chercher"
      Default         =   -1  'True
      Height          =   330
      Left            =   4080
      TabIndex        =   20
      Top             =   60
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   23
      Top             =   3300
      Width           =   5490
      _ExtentX        =   9684
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label lblHorsDélai 
      AutoSize        =   -1  'True
      Caption         =   "&Hors délai :"
      Height          =   210
      Left            =   60
      TabIndex        =   14
      Top             =   2640
      Width           =   1080
   End
   Begin VB.Label lblEtatDocument 
      AutoSize        =   -1  'True
      Caption         =   "Ét&at :"
      Height          =   210
      Left            =   60
      TabIndex        =   12
      Top             =   2280
      Width           =   525
   End
   Begin VB.Label lblPréfixe 
      AutoSize        =   -1  'True
      Caption         =   "&Préfixe :"
      Height          =   210
      Left            =   60
      TabIndex        =   8
      Top             =   1560
      Width           =   780
   End
   Begin VB.Label lblEtablissement 
      AutoSize        =   -1  'True
      Caption         =   "&Etablissement :"
      Height          =   210
      Left            =   60
      TabIndex        =   6
      Top             =   1200
      Width           =   1470
   End
   Begin VB.Label lblTypeDocument 
      AutoSize        =   -1  'True
      Caption         =   "&Type document :"
      Height          =   210
      Left            =   45
      TabIndex        =   10
      Top             =   1920
      Width           =   1575
   End
   Begin VB.Label lblRéférence 
      AutoSize        =   -1  'True
      Caption         =   "&Référence :"
      Height          =   210
      Left            =   45
      TabIndex        =   4
      Top             =   840
      Width           =   1080
   End
   Begin VB.Label lblDate 
      AutoSize        =   -1  'True
      Caption         =   "&Date :"
      Height          =   210
      Left            =   45
      TabIndex        =   0
      Top             =   120
      Width           =   585
   End
   Begin VB.Label lblLettres 
      AutoSize        =   -1  'True
      Caption         =   "&Lettres :"
      Height          =   210
      Left            =   45
      TabIndex        =   2
      Top             =   480
      Width           =   810
   End
End
Attribute VB_Name = "frmLectureDocument"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Boîte de dialogue de recherche de Document"
' frmLectureDocument
' Boîte de dialogue de recherche de document
'  1/12/1999 PV


Option Explicit

Private Function bCheckQueryDate(bMessage As Boolean) As Boolean
  Dim sMsg As String, sNormalisé As String
  If Not bTestQuery(txtDate, "d", sNormalisé, sMsg) Then
    If bMessage Then MsgBox2 sMsg, "PL020"
    bCheckQueryDate = False
    Exit Function
  End If
  bCheckQueryDate = True
End Function

Private Function bCheckQueryLettres(bMessage As Boolean) As Boolean
  Dim sMsg As String, sNormalisé As String
  If txtLettres <> UCase(txtLettres) Then
    txtLettres = UCase(txtLettres)
'    txtLettres.SelStart = 9
  End If
  If Not bTestQuery(txtLettres, "l", sNormalisé, sMsg) Then
    If bMessage Then MsgBox2 sMsg, "PL013"
    bCheckQueryLettres = False
    Exit Function
  End If
  bCheckQueryLettres = True
End Function

Private Function bCheckQueryRéférence(bMessage As Boolean) As Boolean
  Dim sMsg As String, sNormalisé As String
  If Not bTestQuery(txtRéférence, "n", sNormalisé, sMsg) Then
    If bMessage Then MsgBox2 sMsg, "PL015"
    bCheckQueryRéférence = False
    Exit Function
  End If
  bCheckQueryRéférence = True
End Function

Private Function bCheckQueryNumEtb(bMessage As Boolean) As Boolean
  Dim sMsg As String, sNormalisé As String
  If Not bTestQuery(txtNumEtb, "a", sNormalisé, sMsg) Then
    If bMessage Then MsgBox2 sMsg, "PL014"
    bCheckQueryNumEtb = False
    Exit Function
  End If
  bCheckQueryNumEtb = True
End Function

Private Function bCheckQueryTypeDocument(bMessage As Boolean) As Boolean
  Dim sMsg As String, sNormalisé As String
  If Not bTestQuery(txtTypeDocument, "n", sNormalisé, sMsg) Then
    If bMessage Then MsgBox2 sMsg, "??"
    bCheckQueryTypeDocument = False
    Exit Function
  End If
  bCheckQueryTypeDocument = True
End Function

Private Function bCheckQueryEtatDocument(bMessage As Boolean) As Boolean
  Dim sMsg As String, sNormalisé As String
  If Not bTestQuery(txtEtatDocument, "a", sNormalisé, sMsg) Then
    If bMessage Then MsgBox2 sMsg, "??"
    bCheckQueryEtatDocument = False
    Exit Function
  End If
  bCheckQueryEtatDocument = True
End Function


Public Sub DoFormRecherche(bAvance As Boolean)
  txtRéférence = ""
  txtNumEtb = ""
  cboHorsDélai.ListIndex = 0
  Show vbModal
End Sub

Private Sub btnAide_Click()
  Aide "frmchdo"
End Sub

Private Sub btnEtablissement_Click()
  RechercheEtablissement
End Sub

Private Sub btnUtilisateur_Click()
  RechercheLettres
  txtLettres.SetFocus
End Sub

Private Sub Form_Load()
  Internationalisation

  chkOuter = vbChecked
  cboHorsDélai.ListIndex = 0
End Sub

Private Sub btnChercher_Click()
  Dim sDate As String
  
  sDate = txtDate
  If UCase(sDate) = sAttente Then
    sDate = Format(dAttente, "dd/mm/yyyy")
  Else
    If Not bCheckQueryDate(True) Then txtDate.SetFocus: Exit Sub
  End If
  If Not bCheckQueryLettres(True) Then txtLettres.SetFocus: Exit Sub
  If Not bCheckQueryRéférence(True) Then txtRéférence.SetFocus: Exit Sub
  If Not bCheckQueryNumEtb(True) Then txtNumEtb.SetFocus: Exit Sub
  If Not bCheckQueryTypeDocument(True) Then txtTypeDocument.SetFocus: Exit Sub
  If Not bCheckQueryEtatDocument(True) Then txtEtatDocument.SetFocus: Exit Sub

  Hide
  frmGDoc.DoLecture sDate, txtLettres, txtRéférence, txtNumEtb, txtPréfixe, txtTypeDocument, txtEtatDocument, cboHorsDélai.ListIndex, chkOuter = vbChecked
End Sub

Private Sub btnFermer_Click()
  Hide
End Sub


'======================================================================

Private Sub RechercheDate()
  Dim d As String
  d = frmRechercheDate.Cherche(txtDate, True)
  If d <> "" Then
    txtDate = d
    txtDate.SelStart = 0
    txtDate.SelLength = 99
  End If
End Sub

Private Sub txtDate_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then RechercheDate
End Sub

Private Sub btnCalendrier_Click()
  RechercheDate
  txtDate.SetFocus
End Sub


'======================================================================

Private Sub RechercheLettres()
  Dim l As String
  l = frmRechercheLettres.Cherche
  If l <> "" Then
    txtLettres = l
    txtLettres.SelStart = 0
    txtLettres.SelLength = 99
  End If
End Sub

Private Sub txtDate_KeyPress(KeyAscii As Integer)
  Dim sLibelléSA(1 To 1) As String
  Dim dDateSA(1 To 1) As Date
  Dim iNbAssist As Integer
  
  iNbAssist = 1
  sLibelléSA(1) = sAttente
  dDateSA(1) = dAttente

  If KeyAscii >= 32 And KeyAscii <> 127 Then
    If txtDate.SelStart + txtDate.SelLength = Len(txtDate) Then
      Dim tNew As String
      tNew = Left(txtDate, txtDate.SelStart) & Chr(KeyAscii) & Mid(txtDate, txtDate.SelStart + txtDate.SelLength + 1)
      
      Dim i As Integer, iNb As Integer, iRang As Integer
      For i = 1 To iNbAssist
        If UCase(tNew) = Left(sLibelléSA(i), Len(tNew)) Then
          iNb = iNb + 1
          iRang = i
        End If
      Next
      
      If iNb = 1 Then   ' Seule une combinaison coïncide
        Dim ss As Integer
        ss = Len(tNew)
        tNew = tNew + Mid(sLibelléSA(iRang), Len(tNew) + 1)
        txtDate = tNew
        txtDate.SelStart = ss
        txtDate.SelLength = 99
        KeyAscii = 0
      End If
    End If
  End If
End Sub

Private Sub txtLettres_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then RechercheLettres
End Sub

Private Sub txtLettres_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc("/") Then
    KeyAscii = 0
    RechercheLettres
  End If
End Sub


'======================================================================
Private Sub RechercheEtablissement()
  Dim e As Etablissement
  Set e = frmRechercheEtablissement.Cherche()
  If Not e Is Nothing Then
    txtNumEtb = e.etb_numetb
'    txtNumEtb.SelStart = 0
'    txtNumEtb.SelLength = 99
  End If
End Sub

Private Sub txtNumEtb_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then RechercheEtablissement
End Sub

Private Sub txtNumEtb_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc("/") Then
    KeyAscii = 0
    RechercheEtablissement
  End If
End Sub

Private Sub txtNumEtb_DblClick()
  RechercheEtablissement
End Sub


Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub



Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  If TypeOf ActiveControl Is TextBox Then AutoSelect ActiveControl
End Sub

Private Sub txtDate_GotFocus(): GotFocus: End Sub
Private Sub txtLettres_GotFocus(): GotFocus: End Sub
Private Sub txtRéférence_GotFocus(): GotFocus: End Sub
Private Sub txtNumEtb_GotFocus(): GotFocus: End Sub
Private Sub txtPréfixe_GotFocus(): GotFocus: End Sub
Private Sub txtTypeDocument_GotFocus(): GotFocus: End Sub
Private Sub txtEtatDocument_GotFocus(): GotFocus: End Sub
Private Sub cboHorsDélai_GotFocus(): GotFocus: End Sub
Private Sub btnChercher_GotFocus(): GotFocus: End Sub
Private Sub btnFermer_GotFocus(): GotFocus: End Sub
Private Sub btnAvancé_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub
Private Sub btnCalendrier_GotFocus(): GotFocus: End Sub
Private Sub btnUtilisateur_GotFocus(): GotFocus: End Sub


Private Sub txtLettres_Change()
  bToMaj txtLettres
End Sub

Private Sub txtTypeDocument_Change()
  bToMaj txtTypeDocument
End Sub


'===========================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "LDCaption"
  
  SetLib btnChercher, "Caption", "LDbtnChercher"
  SetLib btnAide, "Caption", "btnAide"
  SetLib btnFermer, "Caption", "btnAnnuler"
  
  SetLib lblDate, "Caption", "LDlblDate"
  SetLib txtDate, "Tag", "LDtxtDate.tag"
  SetLib lblLettres, "Caption", "LDlblLettres"
  SetLib txtLettres, "Tag", "LDtxtLettres.tag"
  SetLib lblRéférence, "Caption", "LDlblRéférence"
  SetLib txtRéférence, "Tag", "LDtxtRéférence.tag"
  SetLib lblEtablissement, "Caption", "LDlblEtablissement"
  SetLib txtNumEtb, "Tag", "LDtxtNumEtb.tag"
  SetLib lblPréfixe, "Caption", "LDlblPréfixe"
  SetLib txtPréfixe, "Tag", "LDtxtPréfixe.tag"
  SetLib lblTypeDocument, "Caption", "LDlblTypeDoc"
  SetLib txtTypeDocument, "Tag", "LDtxtTypeDoc.tag"
  SetLib lblEtatDocument, "Caption", "LDlblEtatDoc"
  SetLib txtEtatDocument, "Tag", "LDtxtEtatDoc.tag"
  SetLib lblHorsDélai, "Caption", "LDlblHorsDélai"
  SetLib cboHorsDélai, "Tag", "LDcboHorsDélai.tag"
  SetLib chkOuter, "Caption", "LDchkOuter"
  SetLib chkOuter, "Tag", "LDchkOuter.tag"
  
  SetLib btnCalendrier, "Tag", "LDbtnCalendrier.tag"
  SetLib btnCalendrier, "ToolTipText", "LDbtnCalendrier.tag"
  SetLib btnUtilisateur, "Tag", "LDbtnUtilisateur.tag"
  SetLib btnUtilisateur, "ToolTipText", "LDbtnUtilisateur.tag"
  SetLib btnEtablissement, "Tag", "LDbtnEtb.tag"
  SetLib btnEtablissement, "ToolTipText", "LDbtnEtb.tag"

  cboHorsDélai.AddItem sGetIntlLib("LDcboHD1", "1: Tous les documents")
  cboHorsDélai.AddItem sGetIntlLib("LDcboHD2", "2: Hors délai uniquement")
  cboHorsDélai.AddItem sGetIntlLib("LDcboHD3", "3: Délai normal")
End Sub

