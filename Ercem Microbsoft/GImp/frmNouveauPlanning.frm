VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmNouveauPlanning 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Nouveau planning"
   ClientHeight    =   1710
   ClientLeft      =   2115
   ClientTop       =   2355
   ClientWidth     =   6570
   Icon            =   "frmNouveauPlanning.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   114
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   438
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnLettres 
      Height          =   330
      Left            =   1440
      Picture         =   "frmNouveauPlanning.frx":0442
      Style           =   1  'Graphical
      TabIndex        =   5
      Tag             =   "Cliquer pour rechercher les lettres d'un assistant."
      Top             =   420
      Width           =   315
   End
   Begin VB.CommandButton btnCalendrier 
      Height          =   330
      Left            =   2280
      Picture         =   "frmNouveauPlanning.frx":058C
      Style           =   1  'Graphical
      TabIndex        =   4
      Tag             =   "Cliquer pour sélectionner la date dans un calendrier."
      Top             =   75
      Width           =   315
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
      Left            =   5160
      TabIndex        =   9
      Top             =   960
      Width           =   1350
   End
   Begin VB.TextBox txtNomAssistant 
      BackColor       =   &H8000000F&
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
      Left            =   1800
      Locked          =   -1  'True
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   420
      Width           =   3255
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
      Left            =   900
      MaxLength       =   2
      TabIndex        =   3
      Tag             =   "Entrez les deux lettres de l'assistant. F4 pour une recherche."
      Top             =   420
      Width           =   495
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
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
      Left            =   5160
      TabIndex        =   7
      Top             =   60
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
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
      Left            =   5160
      TabIndex        =   8
      Top             =   465
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   330
      Left            =   0
      TabIndex        =   10
      Top             =   1380
      Width           =   6570
      _ExtentX        =   11589
      _ExtentY        =   582
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
   Begin Plannings.ChampDate txtDate 
      Height          =   315
      Left            =   900
      TabIndex        =   1
      Tag             =   "Entrez la date du planning, F4 pour le calendrier."
      Top             =   60
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   556
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      SaisieAssistée  =   ""
   End
   Begin VB.Label lblCréationPossible 
      AutoSize        =   -1  'True
      Caption         =   "Période actuelle ouverte à partir du"
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
      Left            =   60
      TabIndex        =   11
      Top             =   960
      Width           =   3360
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
      Left            =   60
      TabIndex        =   2
      Top             =   480
      Width           =   810
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
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   585
   End
End
Attribute VB_Name = "frmNouveauPlanning"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Fenêtre de création de planning"
' frmNouveauPlanning
' Fenêtre de création de planning
' 19/09/1997 PV Contrôle des lettres avec bOkLettresActuelles
' 26/12/1997 PV Contrôle des dimanches et des jours fériés pour un nouveau planning
' 25/11/1998 PV Boutons
' 28/12/1998 PV Limite dans le passé à 15 jours
' 20/01/1999 PV Internationalisation
' 21/09/2000 PV Lettres non prises en charge en bleu


Option Explicit


Private Sub Form_Load()
  Internationalisation
  
  bContrôleClôtureMensuelle Today   ' Lit si nécessaire le planning marqueur
  lblCréationPossible = sprintf(sGetIntlLib("NPPerOuverte", "Période actuelle ouverte à partir du %1"), Format(dPremierJourNonClôt, "short date"))
End Sub


Private Sub btnAide_Click()
  Aide "frmnouvp"
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnCalendrier_Click()
  RechercheDate
End Sub

Private Sub btnOk_Click()
  Dim sMsgErr As String
  Dim dDatePlanning As Date
  
  If Not bOkDate(txtDate.DateSaisie) Then
    MsgBox2i "CO004", txtDate       ' Date incorrecte
    txtDate.SetFocus
    Exit Sub
  End If
  dDatePlanning = txtDate.DateSaisie
    
  Dim sFête As String
  If Weekday(dDatePlanning) = vbSunday Then
    MsgBox2i "PL106"                ' Avertissement: La date de planning est un dimanche
  ElseIf IsJourFérié(dDatePlanning, sFête) Then
    MsgBox2i "PL107", sFête         ' Avertissement: La date de planning est un jour férié
  End If
  
  If Not bOkLettresActuelles(txtLettres, sMsgErr) Then
    MsgBox2 sMsgErr, "PL013"
    txtLettres.SetFocus
    If Not bShiftPressed Then Exit Sub
  End If
  
  If Not bOkLettresAssistant(txtLettres, cSystèmeCA) Then
    MsgBox "Avertissement - Les lettres " & txtLettres & " ne sont par gérées par le système " & sSystèmeDistant & " mais par le système unix " & sLettreSystèmeGérantLesLettres(txtLettres) & "." & vbCrLf & vbCrLf & _
      "La validation des interventions ne pourra être réalisée que sur ce système." & vbCrLf & _
      "Lors de la validation aux labos, les résultats seront transmis sur ce système.", _
      vbInformation, App.Title
  End If
  
  If Not frmPlanning.bContrôlesPréalableAjout(dDatePlanning) Then Exit Sub
  
  If msdTesteClôture(dDatePlanning, txtLettres) >= 0 Then
    MsgBox2i "PL109"    ' Un planning existe déjà à cette date pour ces lettres, création impossible !" & vbCrLf & "Le planning existant va être affiché.
    Me.Hide
    frmPlanning.DoLecture sNormaliseQuery(dDatePlanning, "d"), txtLettres, "", "", "", 0, "Planning existant"
    Unload Me
    Exit Sub
  End If
        
  Me.Hide
  Dim s As String
  s = txtLettres
  Unload Me
  
  frmPlanning.NouveauPlanning dDatePlanning, s
End Sub


'======================================================================
Private Sub RechercheDate()
  Dim d As String
  d = frmRechercheDate.Cherche(txtDate.DateSaisie)
  If d <> "" Then
    txtDate.DateSaisie = d
    txtDate.SelStart = 0
    txtDate.SelLength = 99
    txtDate.SetFocus
  End If
End Sub

Private Sub txtDate_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then RechercheDate
End Sub

'======================================================================

Private Sub txtLettres_Change()
  If txtLettres <> UCase(txtLettres) Then
    ToMaj txtLettres
    Exit Sub
  End If
  
  txtLettres.ForeColor = &H80000008
  txtNomAssistant.ForeColor = &H80000008
  Dim u As Utilisateur, sMsgErr As String
  If bOkLettres(txtLettres, sMsgErr) Then
    Dim s As String
    s = UCase(txtLettres)
    Set u = UtiParLettres(s)
    If u Is Nothing Then
      txtNomAssistant = ""
      txtLettres.ForeColor = coulLettresAutresSys
      txtNomAssistant.ForeColor = coulLettresAutresSys
    Else
      txtNomAssistant = u.uti_nom
      If Not bOkLettresAssistant(s, cSystèmeCA) Then
        txtLettres.ForeColor = coulLettresAutresSys
        txtNomAssistant.ForeColor = coulLettresAutresSys
      End If
    End If
  Else
    txtNomAssistant = ""
  End If
End Sub

Private Sub RechercheLettres()
  Dim l As String
  l = frmRechercheLettres.Cherche
  If l <> "" Then
    txtLettres = l
    txtLettres.SelStart = 0
    txtLettres.SelLength = 99
    txtLettres.SetFocus
  End If
End Sub

Private Sub txtLettres_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then RechercheLettres
End Sub

Private Sub btnLettres_Click()
  RechercheLettres
End Sub

Private Sub txtLettres_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc("/") Then
    KeyAscii = 0
    RechercheLettres
  End If
End Sub



Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF1 And Shift = 0 Then btnAide_Click
End Sub


Private Sub GotFocus()
  sbStatus.SimpleText = ActiveControl.Tag
  
  On Error GoTo FinGotFocus
  ActiveControl.SelStart = 0
  ActiveControl.SelLength = 100
FinGotFocus:
End Sub


Private Sub txtDate_GotFocus(): GotFocus: End Sub
Private Sub btnCalendrier_GotFocus(): GotFocus: End Sub
Private Sub txtLettres_GotFocus(): GotFocus: End Sub
Private Sub btnLettres_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub


' ============================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "NPCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib lblDate, "Caption", "NPlblDate"
  SetLib txtDate, "Tag", "NPtxtDate.tag"
  SetLib btnCalendrier, "Tag", "NPbtnCalendrier.tag"
  SetLib btnCalendrier, "ToolTipText", "NPbtnCalendrier.tag"
  SetLib lblLettres, "Caption", "NPlblLettres"
  SetLib txtLettres, "Tag", "NPtxtLettres.tag"
  SetLib btnLettres, "Tag", "NPbtnLettres.tag"
  SetLib btnLettres, "ToolTipText", "NPbtnLettres.tag"
End Sub
