VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmLecturePlanning 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Recherche de planning"
   ClientHeight    =   2895
   ClientLeft      =   3060
   ClientTop       =   2775
   ClientWidth     =   6390
   Icon            =   "frmLecturePlanning.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   193
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   426
   ShowInTaskbar   =   0   'False
   Begin VB.CheckBox chkLettresG�r�esUniquement 
      Caption         =   "Lettres g�r�es sur le serveur uniquement"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3300
      TabIndex        =   10
      Top             =   1680
      Width           =   2355
   End
   Begin VB.TextBox txtPr�fixe 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1635
      TabIndex        =   9
      Tag             =   "Entrez le pr�fixe �tablissement, ou un mod�le termin� par *"
      Top             =   1740
      Width           =   1500
   End
   Begin VB.CommandButton btnEtablissement 
      Height          =   330
      Left            =   3135
      Picture         =   "frmLecturePlanning.frx":0442
      Style           =   1  'Graphical
      TabIndex        =   15
      Tag             =   "Cliquer pour rechercher un �tablissement."
      ToolTipText     =   "Cliquer pour rechercher un �tablissement."
      Top             =   1320
      Width           =   315
   End
   Begin VB.CommandButton btnUtilisateur 
      Height          =   330
      Left            =   3135
      Picture         =   "frmLecturePlanning.frx":058C
      Style           =   1  'Graphical
      TabIndex        =   14
      Tag             =   "Cliquer pour rechercher les lettres d'un assistant."
      ToolTipText     =   "Cliquer pour rechercher les lettres d'un assistant."
      Top             =   480
      Width           =   315
   End
   Begin VB.CommandButton btnCalendrier 
      Height          =   330
      Left            =   3135
      Picture         =   "frmLecturePlanning.frx":06D6
      Style           =   1  'Graphical
      TabIndex        =   13
      Tag             =   "Cliquer pour s�lectionner la date dans un calendrier."
      ToolTipText     =   "Cliquer pour s�lectionner la date dans un calendrier"
      Top             =   60
      Width           =   315
   End
   Begin VB.TextBox txtNumEtb 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1620
      TabIndex        =   7
      Tag             =   "Entrez le n� de l'�tablissement. F4 pour une recherche."
      Top             =   1320
      Width           =   1500
   End
   Begin VB.ComboBox cboCl�t 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      ItemData        =   "frmLecturePlanning.frx":0820
      Left            =   1620
      List            =   "frmLecturePlanning.frx":0822
      Style           =   2  'Dropdown List
      TabIndex        =   12
      Tag             =   "Indiquez l'�tat des plannings recherch�s."
      Top             =   2160
      Width           =   3795
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4980
      TabIndex        =   18
      Top             =   60
      Width           =   1350
   End
   Begin VB.TextBox txtR�f�rence 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1620
      TabIndex        =   5
      Tag             =   "Entrez la r�f�rence d'intervention � rechercher (sans les lettres)."
      Top             =   900
      Width           =   1500
   End
   Begin VB.CommandButton btnAvanc� 
      Caption         =   "&Avanc� >>"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4980
      TabIndex        =   19
      Top             =   480
      Width           =   1350
   End
   Begin VB.CommandButton btnFermer 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   3540
      TabIndex        =   17
      Top             =   480
      Width           =   1350
   End
   Begin VB.TextBox txtDate 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1620
      TabIndex        =   1
      Tag             =   "Date planning � lire ou ATTENTE. F4 pour le calendrier."
      Top             =   60
      Width           =   1500
   End
   Begin VB.TextBox txtLettres 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1620
      TabIndex        =   3
      Tag             =   "Entrez les deux lettres de l'assistant. F4 pour une recherche."
      Top             =   480
      Width           =   1500
   End
   Begin VB.CommandButton btnChercher 
      Caption         =   "Chercher"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   3540
      TabIndex        =   16
      Top             =   60
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   20
      Top             =   2580
      Width           =   6390
      _ExtentX        =   11271
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
   Begin VB.Image imgIc�neRechercheAvanc�e 
      Height          =   480
      Left            =   4680
      Picture         =   "frmLecturePlanning.frx":0824
      Top             =   1020
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Label lblPr�fixe 
      AutoSize        =   -1  'True
      Caption         =   "&Pr�fixe :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   120
      TabIndex        =   8
      Top             =   1800
      Width           =   780
   End
   Begin VB.Label lblAction 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   3540
      TabIndex        =   21
      Top             =   960
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Label lblEtablissement 
      AutoSize        =   -1  'True
      Caption         =   "&Etablissement :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   120
      TabIndex        =   6
      Top             =   1380
      Width           =   1470
   End
   Begin VB.Label lblCl�ture 
      AutoSize        =   -1  'True
      Caption         =   "&Cl�t :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   105
      TabIndex        =   11
      Top             =   2220
      Width           =   510
   End
   Begin VB.Label lblR�f�rence 
      AutoSize        =   -1  'True
      Caption         =   "&R�f�rence :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   105
      TabIndex        =   4
      Top             =   960
      Width           =   1080
   End
   Begin VB.Label lblDate 
      AutoSize        =   -1  'True
      Caption         =   "&Date :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   105
      TabIndex        =   0
      Top             =   120
      Width           =   585
   End
   Begin VB.Label lblLettres 
      AutoSize        =   -1  'True
      Caption         =   "&Lettres :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   105
      TabIndex        =   2
      Top             =   540
      Width           =   810
   End
End
Attribute VB_Name = "frmLecturePlanning"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Bo�te de dialogue de recherche de planning"
' frmLecturePlanning
' Bo�te de dialogue de recherche de planning
' PV Novembre 96
' 30/01/1998 PV AutoSelect dans GotFocus
' 19/04/1998 PV Date d'attente
' 26/11/1998 PV Boutons de recherche
' 16/12/1998 PV Recherche sur pr�fixe
' 19/01/1999 PV Fin du dtpDate (date picker)
' 20/01/1999 PV Internationalisation
' 21/01/2001 PV chkLettresG�r�esUniquement


Option Explicit

Private iHauteurOrigine As Integer
Dim cGotFocusOnActivate As Control

Private Function bCheckQueryDate(bMessage As Boolean) As Boolean
  Dim sMsg As String, sNormalis� As String
  If Not bTestQuery(txtDate, "d", sNormalis�, sMsg) Then
    If bMessage Then MsgBox2 sMsg, "PL020"
    bCheckQueryDate = False
    Exit Function
  End If
  bCheckQueryDate = True
End Function

Private Function bCheckQueryLettres(bMessage As Boolean) As Boolean
  Dim sMsg As String, sNormalis� As String
  If txtLettres <> UCase(txtLettres) Then
    txtLettres = UCase(txtLettres)
'    txtLettres.SelStart = 9
  End If
  If Not bTestQuery(txtLettres, "l", sNormalis�, sMsg) Then
    If bMessage Then MsgBox2 sMsg, "PL013"
    bCheckQueryLettres = False
    Exit Function
  End If
  bCheckQueryLettres = True
End Function

Private Function bCheckQueryR�f�rence(bMessage As Boolean) As Boolean
  Dim sMsg As String, sNormalis� As String
  If Not bTestQuery(txtR�f�rence, "n", sNormalis�, sMsg) Then
    If bMessage Then MsgBox2 sMsg, "PL015"
    bCheckQueryR�f�rence = False
    Exit Function
  End If
  bCheckQueryR�f�rence = True
End Function

Private Function bCheckQueryNumEtb(bMessage As Boolean) As Boolean
  Dim sMsg As String, sNormalis� As String
  If Not bTestQuery(txtNumEtb, "a", sNormalis�, sMsg) Then
    If bMessage Then MsgBox2 sMsg, "PL014"
    bCheckQueryNumEtb = False
    Exit Function
  End If
  bCheckQueryNumEtb = True
End Function


Public Sub DoFormRecherche(bAvance As Boolean)
  If bAvance Then
    btnAvanc�_Click
    lblAction = "A"
  Else
    txtR�f�rence = ""
    txtNumEtb = ""
    cboCl�t.ListIndex = 0
    lblAction = "R"
  End If
  Set cGotFocusOnActivate = txtDate
  Show vbModal
End Sub

Private Sub btnAide_Click()
  Aide "frmchpl"
End Sub

Private Sub btnAvanc�_Click()
  btnAvanc�.Enabled = False
  txtR�f�rence.Visible = True
  txtNumEtb.Visible = True
  cboCl�t.Visible = True
  Me.Icon = imgIc�neRechercheAvanc�e.Picture
  On Error Resume Next
  txtR�f�rence.SetFocus
  frmLecturePlanning.height = iHauteurOrigine
End Sub

Private Sub btnEtablissement_Click()
  RechercheEtablissement
End Sub

Private Sub btnUtilisateur_Click()
  RechercheLettres
  txtLettres.SetFocus
End Sub

Private Sub Form_Activate()
  If lblAction = "A" Then
    frmLecturePlanning.height = iHauteurOrigine
    lblAction = ""
  ElseIf lblAction = "R" Then
    TailleR�duite
    lblAction = ""
  End If
  
  If Not cGotFocusOnActivate Is Nothing Then
    btnChercher.SetFocus
    cGotFocusOnActivate.SetFocus
    Set cGotFocusOnActivate = Nothing
  End If
  
  If txtDate Is ActiveControl Then AutoSelect txtDate, True
End Sub

Private Sub Form_Load()
  Internationalisation

  cboCl�t.ListIndex = 0
  iHauteurOrigine = height
End Sub

Private Sub btnChercher_Click()
  Dim sDate As String
  
  sDate = txtDate
  If UCase(sDate) = sAttente Then
    sDate = Format(dAttente, "short date")
  Else
    If Not bCheckQueryDate(True) Then txtDate.SetFocus: Exit Sub
  End If
  If Not bCheckQueryLettres(True) Then txtLettres.SetFocus: Exit Sub
  If Not bCheckQueryR�f�rence(True) Then txtR�f�rence.SetFocus: Exit Sub
  If Not bCheckQueryNumEtb(True) Then txtNumEtb.SetFocus: Exit Sub

  Hide
  frmPlanning.DoLecture sDate, txtLettres, txtR�f�rence, txtNumEtb, txtPr�fixe, chkLettresG�r�esUniquement = vbChecked, cboCl�t.ListIndex, sGetIntlLib("LPlblPlanSel", "Plannings s�lectionn�s")
End Sub

Private Sub btnFermer_Click()
  Hide
End Sub

Private Sub TailleR�duite()
  height = 1665
  txtR�f�rence.Visible = False
  txtNumEtb.Visible = False
  cboCl�t.Visible = False
  btnAvanc�.Enabled = True
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
  Dim sLibell�SA(1 To 1) As String
  Dim dDateSA(1 To 1) As Date
  Dim iNbAssist As Integer
  
  iNbAssist = 1
  sLibell�SA(1) = sAttente
  dDateSA(1) = dAttente

  If KeyAscii >= 32 And KeyAscii <> 127 Then
    If txtDate.SelStart + txtDate.SelLength = Len(txtDate) Then
      Dim tNew As String
      tNew = Left(txtDate, txtDate.SelStart) & Chr(KeyAscii) & Mid(txtDate, txtDate.SelStart + txtDate.SelLength + 1)
      
      Dim i As Integer, iNb As Integer, iRang As Integer
      For i = 1 To iNbAssist
        If UCase(tNew) = Left(sLibell�SA(i), Len(tNew)) Then
          iNb = iNb + 1
          iRang = i
        End If
      Next
      
      If iNb = 1 Then   ' Seule une combinaison co�ncide
        Dim ss As Integer
        ss = Len(tNew)
        tNew = tNew + Mid(sLibell�SA(iRang), Len(tNew) + 1)
        txtDate = tNew
        txtDate.SelStart = ss
        txtDate.SelLength = 99
        KeyAscii = 0
      End If
    End If
  End If
End Sub

Private Sub txtLettres_Change()
  If txtLettres <> UCase(txtLettres) Then bToMaj txtLettres
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
  If KeyAscii >= Asc("a") And KeyAscii <= Asc("z") Then KeyAscii = KeyAscii - 32
  If KeyAscii = Asc("?") Then KeyAscii = 65 + Val(txtNumEtb) Mod 26
End Sub

Private Sub txtNumEtb_DblClick()
  RechercheEtablissement
End Sub

Private Sub txtPr�fixe_KeyPress(KeyAscii As Integer)
  If KeyAscii >= Asc("a") And KeyAscii <= Asc("z") Then KeyAscii = KeyAscii - 32
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

Private Sub txtR�f�rence_GotFocus(): GotFocus: End Sub
Private Sub txtNumEtb_GotFocus(): GotFocus: End Sub
Private Sub txtPr�fixe_GotFocus(): GotFocus: End Sub
Private Sub cboCl�t_GotFocus(): GotFocus: End Sub
Private Sub btnChercher_GotFocus(): GotFocus: End Sub
Private Sub btnFermer_GotFocus(): GotFocus: End Sub
Private Sub btnAvanc�_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub
Private Sub btnCalendrier_GotFocus(): GotFocus: End Sub
Private Sub btnUtilisateur_GotFocus(): GotFocus: End Sub
Private Sub btnEtablissement_GotFocus(): GotFocus: End Sub


'===========================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "LPCaption"
  
  SetLib btnChercher, "Caption", "LPbtnChercher"
  SetLib btnAvanc�, "Caption", "LPbtnAvanc�"
  SetLib btnAide, "Caption", "btnAide"
  SetLib btnFermer, "Caption", "btnAnnuler"
  
  SetLib lblDate, "Caption", "LPlblDate"
  SetLib txtDate, "Tag", "LPtxtDate.tag"
  SetLib lblLettres, "Caption", "LPlblLettres"
  SetLib txtLettres, "Tag", "LPtxtLettres.tag"
  SetLib lblR�f�rence, "Caption", "LPlblR�f�rence"
  SetLib txtR�f�rence, "Tag", "LPtxtR�f�rence.tag"
  SetLib lblEtablissement, "Caption", "LPlblEtablissement"
  SetLib txtNumEtb, "Tag", "LPtxtNumEtb.tag"
  SetLib lblPr�fixe, "Caption", "LPlblPr�fixe"
  SetLib txtPr�fixe, "Tag", "LPtxtPr�fixe.tag"
  SetLib lblCl�ture, "Caption", "LPlblCl�ture"
  SetLib cboCl�t, "Tag", "LPcboCl�t.tag"
  
  SetLib btnCalendrier, "Tag", "LPbtnCalendrier.tag"
  SetLib btnCalendrier, "ToolTipText", "LPbtnCalendrier.tag"
  SetLib btnUtilisateur, "Tag", "LPbtnUtilisateur.tag"
  SetLib btnUtilisateur, "ToolTipText", "LPbtnUtilisateur.tag"
  SetLib btnEtablissement, "Tag", "LPbtnEtb.tag"
  SetLib btnEtablissement, "ToolTipText", "LPbtnEtb.tag"

  cboCl�t.AddItem sGetIntlLib("LPcboCl�t1", "Tous les plannings, clos ou non")
  cboCl�t.AddItem sGetIntlLib("LPcboCl�t2", "Clos uniquement")
  cboCl�t.AddItem sGetIntlLib("LPcboCl�t3", "Non clos uniquement")
End Sub

