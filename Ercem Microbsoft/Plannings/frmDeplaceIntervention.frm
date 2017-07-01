VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmDéplaceIntervention 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Déplacement d'une intervention"
   ClientHeight    =   2550
   ClientLeft      =   2130
   ClientTop       =   2640
   ClientWidth     =   6930
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmDeplaceIntervention.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   170
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   462
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnLettres 
      Height          =   330
      Left            =   1620
      Picture         =   "frmDeplaceIntervention.frx":014A
      Style           =   1  'Graphical
      TabIndex        =   12
      Tag             =   "Cliquer pour rechercher les lettres d'un assistant."
      ToolTipText     =   "Cliquer pour rechercher les lettres d'un assistant."
      Top             =   1800
      Width           =   315
   End
   Begin VB.CommandButton btnCalendrier 
      Height          =   330
      Left            =   2520
      Picture         =   "frmDeplaceIntervention.frx":0294
      Style           =   1  'Graphical
      TabIndex        =   11
      Tag             =   "Cliquer pour sélectionner la date dans un calendrier."
      ToolTipText     =   "Cliquer pour sélectionner la date dans un calendrier"
      Top             =   1440
      Width           =   315
   End
   Begin Plannings.ChampDate txtDate 
      Height          =   315
      Left            =   1140
      TabIndex        =   8
      Tag             =   "Entrez la date de destination, ou ATTENTE"
      Top             =   1440
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
      SaisieAssistée  =   "ATTENTE=1/1/2019"
   End
   Begin VB.TextBox txtLettresOrigine 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1140
      Locked          =   -1  'True
      MaxLength       =   2
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   720
      Width           =   435
   End
   Begin VB.TextBox txtNomAssistantOrigine 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   720
      Width           =   3675
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   5520
      TabIndex        =   16
      Top             =   960
      Width           =   1350
   End
   Begin VB.TextBox txtNomAssistant 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1980
      Locked          =   -1  'True
      TabIndex        =   13
      TabStop         =   0   'False
      Top             =   1800
      Width           =   3375
   End
   Begin VB.TextBox txtLettres 
      Height          =   315
      Left            =   1140
      MaxLength       =   2
      TabIndex        =   10
      Tag             =   "Entrez les lettres de destination. F4 pour une recherche."
      Top             =   1800
      Width           =   435
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   5520
      TabIndex        =   14
      Top             =   60
      Width           =   1350
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   5520
      TabIndex        =   15
      Top             =   465
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   17
      Top             =   2235
      Width           =   6930
      _ExtentX        =   12224
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
   Begin Plannings.ChampDate txtDateOrigine 
      Height          =   315
      Left            =   1140
      TabIndex        =   2
      TabStop         =   0   'False
      Tag             =   "Entrez la date de destination"
      Top             =   360
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
      BackColor       =   -2147483633
      Locked          =   -1  'True
      SaisieAssistée  =   "ATTENTE=1/1/2019"
   End
   Begin VB.Label lblDestination 
      AutoSize        =   -1  'True
      Caption         =   "Vers :"
      Height          =   210
      Left            =   60
      TabIndex        =   6
      Top             =   1200
      Width           =   555
   End
   Begin VB.Label lblSource 
      AutoSize        =   -1  'True
      Caption         =   "Déplacer l'intervention :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   2250
   End
   Begin VB.Label lblDate1 
      AutoSize        =   -1  'True
      Caption         =   "Date :"
      Height          =   210
      Left            =   300
      TabIndex        =   1
      Top             =   420
      Width           =   585
   End
   Begin VB.Label lblLettres1 
      AutoSize        =   -1  'True
      Caption         =   "Lettres :"
      Height          =   210
      Left            =   300
      TabIndex        =   3
      Top             =   780
      Width           =   810
   End
   Begin VB.Label lblLettres2 
      AutoSize        =   -1  'True
      Caption         =   "&Lettres :"
      Height          =   210
      Left            =   300
      TabIndex        =   9
      Top             =   1860
      Width           =   810
   End
   Begin VB.Label lblDate2 
      AutoSize        =   -1  'True
      Caption         =   "&Date :"
      Height          =   210
      Left            =   300
      TabIndex        =   7
      Top             =   1500
      Width           =   585
   End
End
Attribute VB_Name = "frmDéplaceIntervention"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille gérant le déplacement d'une autervention (autre date ou autres lettres)"
' Feuille frmDéplaceIntervention
' Feuille gérant le déplacement d'une autervention (autre date ou autres lettres)
' PV Novembre 96
' 26/12/1997 PV Contrôle de mouvement vers un dimanche ou un jour férié
' 19/04/1998 PV Champ date; attente
' 26/11/1998 PV Boutons de recherche
' 28/12/1998 PV Limite de déplacement à 15 jours
' 25/01/1999 PV Internationalisation
' 18/03/1999 PV Clôture mensuelle
' 31/12/1999 PV Contrôle des codes unité lors d'un déplacement


Option Explicit

Private gdDateOrigine As Date
Private gsLettresOrigine As String

Private Sub btnAide_Click()
  Aide "frmdepin"
End Sub

Private Sub btnAnnuler_Click()
  If bBlocageEnCours Then Beep: Exit Sub
  
  txtLettres = ""
  txtDate.DateSaisie = ""
  Hide
End Sub

Private Sub btnOk_Click()
  If bBlocageEnCours Then Beep: Exit Sub
  Dim dCible As Date

  Dim sMsgErr As String
  
  If Not bOkDate(txtDate.DateSaisie) Then
    MsgBox2i "CO004", txtDate
    'MsgBox2 "Date incorrecte.", "PL020"
    txtDate.SetFocus
    Exit Sub
  End If
  dCible = dDécodeDate(txtDate.DateSaisie)
  
  Dim sFête As String
  If Weekday(dCible) = vbSunday Then
    MsgBox2i "PL110"
    'MsgBox "Avertissement: La date de planning est un dimanche. Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
  ElseIf IsJourFérié(dCible, sFête) Then
    MsgBox2i "PL107", sFête
    'MsgBox "Avertissement: La date de planning est un jour férié (" & sFête & "). Vérifiez qu'il n'y a pas d'erreur.", vbInformation, sNomApp
  End If

  If Not bOkLettresActuelles(txtLettres, sMsgErr) Then
    MsgBox2 sMsgErr, "PL013"
    txtLettres.SetFocus
    Exit Sub
  End If
  
  If dCible < Now - MaxJoursPassé Then
    MsgBox2i "PL021"
    'MsgBox2 "Vous ne pouvez pas créer un planning plus de 1 mois avant la date courante.", "PL021"
    If Not bShiftPressed Then Exit Sub
  End If
  
  If Not bContrôleClôtureMensuelle(dCible) Then
    MsgBox2i "PL108", Format(dPremierJourNonClôt, "short date")
    'MsgBox "Période close pour les plannings." & vbCrLf & "Vous ne pouvez pas créer de planning avant le " & Format(dPremierJourNonClôt, "short date") & ".", vbExclamation, sNomApp
    If Not bShiftPressed Then Exit Sub
  End If
  
  
  ' On vérifie qu'à partir du 1/1/2000 on utilise les codes région, et pas avant
  ' Ne concerne que la france
  If cSystèmeCA = "G" Or cSystèmeCA = "P" Then
    If dCible < DateSerial(2000, 1, 1) And gdDateOrigine >= DateSerial(2000, 1, 1) Or _
      dCible > DateSerial(2000, 1, 1) And gdDateOrigine <= DateSerial(2000, 1, 1) Then
      MsgBox "ATTENTION - Déplacement 1999-2000." & vbCrLf & vbCrLf & "Modifiez IMPÉRATIVEMENT les codes unité :" & vbCrLf & "Pour 1999 utiliser les codes UOP (10..111 820..830)" & vbCrLf & "Pour 2000 utilisez les codes région (310..360)", vbExclamation, App.Title
    End If
  End If


'  ' Test de clôture
'  Dim sReq As String
'  sReq = "pla_dateplan$" & sNormaliseQuery(txtDate.DateSaisie, "d")
'  sReq = sReq & "$pla_lettres$" & sNormaliseQuery(txtLettres, "l")
'  Dim journées As New AccJournee
'  Dim iNbJournées As Integer
'  iNbJournées = journées.RechercheJournee(sReq)
'
'  If iNbJournées <> 0 Then
'    Dim j As Journee
'    Set j = journées.Item(1)
'    If j.bClôt Then
'      MsgBox2i "PL030"
'      'MsgBox2 "Déplacement vers un planning clôt." & vbCrLf & vbCrLf & "Vous ne pouvez pas déplacer une intervention vers un planning clôt.", "PL030"
'      Exit Sub
'    End If
'  End If
  
  If txtDateOrigine.DateSaisie = dCible And UCase(txtLettresOrigine) = UCase(txtLettres) Then
    MsgBox2i "PL029"
    'MsgBox2 "Déplacement sans effet." & vbCrLf & vbCrLf & "Vous devez modifier la date ou les lettres pour effectuer un déplacement.", "PL029"
    Exit Sub
  End If
  
  ' Avertissement
  If gsLettresOrigine <> UCase(txtLettres) Then
    MsgBox2i "PL034"
    'MsgBox2 "Changement de lettres lors du déplacement." & vbCrLf & vbCrLf & "Vérifiez que le code personne est correct suite à ce changement de lettres", "PL034"
  End If
  
  ' Le déplacement est fait par le code appelant
  Hide
End Sub


Public Sub AfficheFeuille(dDateOrigine As Date, sLettresOrigine As String, bJournéeComplète As Boolean)
  gdDateOrigine = dDateOrigine
  gsLettresOrigine = sLettresOrigine
  txtLettres = ""
  txtDate.DateSaisie = ""
  
  If bJournéeComplète Then
    Caption = "Déplacement d'une journée"
    lblSource = "Déplacer toutes les interventions :"
  Else
    Caption = "Déplacement des interventions sélectionnées"
    lblSource = "Déplacer les interventions :"
  End If
  
  txtDateOrigine.DateSaisie = dDateOrigine
  txtLettresOrigine = sLettresOrigine
  AssertOkDate dDateOrigine
  AssertOkLettres txtLettresOrigine
  txtLettres = sLettresOrigine        ' Lettres par défaut
  txtNomAssistantOrigine = sNomAssistant(txtLettresOrigine)
  Show vbModal
End Sub

Private Sub Form_Activate()
  On Error Resume Next
  txtDate.SetFocus
End Sub

Private Sub Form_Load()
  Internationalisation
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If bBlocageEnCours Then Beep: Cancel = True: Exit Sub
End Sub

'Private Sub txtDate_LostFocus()
'  If bOkDate(txtDate.DateSaisie) Or txtDate.DateSaisie = "" Then
'    txtDate.ForeColor = &H80000008
'  Else
'    txtDate.ForeColor = &HFF&
'  End If
'End Sub

Private Sub txtLettres_Change()
  Dim u As Utilisateur, sMsgErr As String
  If bOkLettres(txtLettres, sMsgErr) Then
    Set u = UtiParLettres(UCase(txtLettres))
    If u Is Nothing Then
      txtNomAssistant = ""
    Else
      txtNomAssistant = u.uti_nom
    End If
  Else
    txtNomAssistant = ""
  End If
End Sub

'======================================================================

Private Sub RechercheDate()
  Dim d As String
  d = frmRechercheDate.Cherche(txtDate.DateSaisie)
  If d <> "" Then
    txtDate.DateSaisie = d
    txtDate.SelStart = 0
    txtDate.SelLength = 99
  End If
End Sub

Private Sub txtDate_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then RechercheDate
End Sub

Private Sub btnCalendrier_Click()
  RechercheDate
End Sub


'======================================================================
Private Sub RechercheLettres()
  Dim l As String
  l = frmRechercheLettres.Cherche
  If l <> "" Then
    txtLettres = l
    txtLettres.SelStart = 9
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

Private Sub btnLettres_Click()
  RechercheLettres
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
Private Sub txtLettres_GotFocus(): GotFocus: End Sub
Private Sub txtDateOrigine_GotFocus(): GotFocus: End Sub
Private Sub txtLettresOrigine_GotFocus(): GotFocus: End Sub
Private Sub txtNomAssistantOrigine_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub



'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "DICaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"

  SetLib lblSource, "Caption", "DIlblSource"
  SetLib lblDate1, "Caption", "DIlblDate2"
  SetLib lblLettres1, "Caption", "DIlblLettres1"
  SetLib lblDestination, "Caption", "DIlblDestination"
  SetLib lblDate2, "Caption", "DIlblDate2"
  SetLib txtDate, "Tag", "DItxtDate.tag"
  SetLib lblLettres2, "Caption", "DIlblLettres2"
  SetLib txtLettres, "Tag", "DItxtLettres.tag"

  txtDateOrigine.SaisieAssistée = sAttente & "=" & dAttente
  txtDate.SaisieAssistée = sAttente & "=" & dAttente
End Sub


