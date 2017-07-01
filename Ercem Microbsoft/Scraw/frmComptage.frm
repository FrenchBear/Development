VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmComptage 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Comptage des analyses prévues"
   ClientHeight    =   2835
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6270
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmComptage.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2835
   ScaleWidth      =   6270
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnCalendrier 
      Height          =   330
      Left            =   3060
      Picture         =   "frmComptage.frx":014A
      Style           =   1  'Graphical
      TabIndex        =   2
      Tag             =   "Cliquer pour sélectionner la date dans un calendrier."
      ToolTipText     =   "Cliquer pour sélectionner la date dans un calendrier"
      Top             =   120
      Width           =   315
   End
   Begin VB.CheckBox chkImpression 
      Caption         =   "&Imprimer les références sélectionnées"
      Height          =   195
      Left            =   120
      TabIndex        =   9
      Tag             =   "Lance l'impression des références sélectionnées."
      Top             =   2220
      Width           =   4455
   End
   Begin VB.Frame fraCadrePrél 
      Caption         =   "Cadre de prélèvement"
      Height          =   1515
      Left            =   120
      TabIndex        =   3
      Top             =   600
      Width           =   4455
      Begin VB.TextBox txtNomCpr 
         BackColor       =   &H8000000F&
         Height          =   555
         Left            =   1920
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   8
         TabStop         =   0   'False
         Tag             =   "200"
         Top             =   840
         Width           =   2415
      End
      Begin VB.TextBox txtNumCpr 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   315
         Left            =   1140
         TabIndex        =   7
         Tag             =   "Entrez le numéro du cadre de prélèvement, F4 pour une recherche."
         Top             =   840
         Width           =   720
      End
      Begin VB.OptionButton optAutre 
         Caption         =   "Autre :"
         Height          =   315
         Left            =   120
         TabIndex        =   6
         Top             =   840
         Width           =   1095
      End
      Begin VB.OptionButton optTout 
         Caption         =   "Tous les cadres de prélèvement"
         Height          =   315
         Left            =   120
         TabIndex        =   5
         Top             =   540
         Width           =   3915
      End
      Begin VB.OptionButton optDLC 
         Caption         =   "Analyse à la DLC (8)"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   280
         Value           =   -1  'True
         Width           =   2775
      End
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   4860
      TabIndex        =   12
      Top             =   480
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   4860
      TabIndex        =   11
      Top             =   60
      Width           =   1350
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   4860
      TabIndex        =   13
      Top             =   960
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   10
      Top             =   2520
      Width           =   6270
      _ExtentX        =   11060
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
   Begin SCRAW.ChampDate txtDatePrévue 
      Height          =   315
      Left            =   1560
      TabIndex        =   1
      Top             =   120
      Width           =   1455
      _ExtentX        =   2566
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
   End
   Begin VB.Label lblDatePrévue 
      AutoSize        =   -1  'True
      Caption         =   "D&ate prévue :"
      Height          =   210
      Left            =   120
      TabIndex        =   0
      Tag             =   "204"
      Top             =   180
      Width           =   1305
   End
End
Attribute VB_Name = "frmComptage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmComptage
' Comptage des analyses dans la base
' 06/04/1998 PV
'  1/12/1998 PV Impression des références sélectionnées
' 27/01/1999 NC Internationalisation


Option Explicit

Private Sub btnAide_Click()
  Aide "frmcomptage"
End Sub

Private Sub btnAide_GotFocus()
  SetLib sbStatus, "SimpleText", "CPtxtbtnAide.tag"
  'sbStatus.SimpleText = "Affiche l'aide sur cette boîte de dialogue"
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnAnnuler_GotFocus()
  SetLib sbStatus, "SimpleText", "CPtxtbtnAnnuler.tag"
  'sbStatus.SimpleText = "Ferme la fenêtre sans lancer le comptage"
End Sub

Private Sub btnCalendrier_Click()
  frmRA.calendrier txtDatePrévue
End Sub

Private Sub btnCalendrier_GotFocus()
  sbStatus.SimpleText = btnCalendrier.Tag
End Sub

Private Sub btnOk_Click()
  If Not bOkDate(txtDatePrévue.DateSaisie) Then
    MsgBox2i "CR279"
    'MsgBox "Entrez une date valide !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  Dim cpr As Integer
  If optDLC.Value Then
    cpr = 8
  ElseIf optTout.Value Then
    cpr = 0
  Else
    If Not bCheckCadreDePrélèvement(True) Then Exit Sub
    cpr = Val(txtNumCpr)
  End If
  
  ' Comptage…
  Screen.MousePointer = vbHourglass
  SetLib sbStatus, "SimpleText", "CPtxtMP.tag"
  'sbStatus.SimpleText = "Comptage en cours, patientez…"
  Dim iNb As Long
  iNb = CompteAnalysesPrévues(txtDatePrévue.DateSaisie, cpr, chkImpression = vbChecked)
  
  Dim sMessage As String
  
  If iNb > 0 Then
    sMessage = iNb & " "
  Else
    sMessage = sGetIntlLib("CPtxtCompt1", "Aucune ")
  End If
  If iNb > 1 Then
    sMessage = sMessage & sGetIntlLib("CPtxtCompt2", "analyses prévues")
  Else
    sMessage = sMessage & sGetIntlLib("CPtxtCompt3", "analyse prévue")
  End If
  sMessage = sMessage & sprintf(sGetIntlLib("CPtxtCompt4", " au %1"), Format(txtDatePrévue.DateSaisie, "dd/mm/yyyy"))
  If cpr > 0 Then sMessage = sMessage & sprintf(sGetIntlLib("CPtxtCompt5", " pour le cadre de prélèvement %1 ."), cpr)
  
  If chkImpression = vbChecked Then
    sMessage = sMessage & vbCrLf & vbCrLf & sprintf(sGetIntlLib("CPtxtCompt6", "La liste des références concernées a été imprimée sur %1 ."), sImprimanteLaser)
  End If
  
  SetLib sbStatus, "SimpleText", "CPtxtFin.tag"
  'sbStatus.SimpleText = "Terminé !"
  Screen.MousePointer = vbDefault
  MsgBox sMessage, vbInformation, sNomApp
  
  Unload Me
End Sub

Private Sub btnOk_GotFocus()
  SetLib sbStatus, "SimpleText", "CPtxtbtnOk.tag"
  'sbStatus.SimpleText = "Lance le comptage"
End Sub

Private Sub chkImpression_GotFocus()
  sbStatus.SimpleText = chkImpression.Tag
End Sub

Private Sub Form_Load()
  Internationalisation
  
  Dim d As Date
  Dim sFête As String
  
  d = Today + 1   ' A priori on cherche pour demain
  Do
    If Weekday(d) = vbSunday Then
      d = d + 1   ' On saute les dimanches
    ElseIf IsJourFérié(d, sFête) Then
      d = d + 1   ' On saute les fêtes
    Else
      Exit Do
    End If
  Loop

  txtDatePrévue.DateSaisie = d
End Sub

Private Sub optAutre_Click()
  txtNumCpr.Enabled = True
  txtNumCpr.BackColor = &H80000005
End Sub

Private Sub optAutre_GotFocus()
  SetLib sbStatus, "SimpleText", "CPtxtoptAut.tag"
  'sbStatus.SimpleText = "Compte les analyses d'un cadre de prélèvement donné"
End Sub

Private Sub optDLC_Click()
  txtNumCpr.Enabled = False
  txtNumCpr.BackColor = &H8000000F
End Sub

Private Sub optDLC_GotFocus()
  SetLib sbStatus, "SimpleText", "CPtxtoptDLC.tag"
  'sbStatus.SimpleText = "Compte uniquement les analyses à la DLC"
End Sub

Private Sub optTout_Click()
  txtNumCpr.Enabled = False
  txtNumCpr.BackColor = &H8000000F
End Sub

Private Sub optTout_GotFocus()
  SetLib sbStatus, "SimpleText", "CPtxtoptTout.tag"
  'sbStatus.SimpleText = "Compte toutes les analyses"
End Sub

Private Sub txtNomCpr_GotFocus()
  SetLib sbStatus, "SimpleText", "CPtxtNomCpr.tag"
  'sbStatus.SimpleText = "Précisez le cadre de prélèvement à sélectionner, F4 pour la liste"
End Sub


' ===============================================================
' Date prévue

Private Sub txtDatePrévue_GotFocus()
  SetLib sbStatus, "SimpleText", "CPtxtDPrévue.tag"
  'sbStatus.SimpleText = "Entrez la date pour le comptage, F4 pour le calendrier"
  AutoSelect txtDatePrévue, True
End Sub

Private Sub txtDatePrévue_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then frmRA.calendrier txtDatePrévue
End Sub



' ===============================================================
' N° de cadre de prélèvement

Private Sub RechercheCadreDePrélèvement()
  Dim p As LibelléRA
  Set p = frmRechercheLibelléRA.Cherche(rCadrePrélèvement)
  If Not p Is Nothing Then
    txtNumCpr = p.lcr_indice
    txtNomCpr = p.lcr_libelle
    
    AutoSelect txtNumCpr, True
  End If
End Sub

Private Sub txtNumcpr_Change()
  txtNomCpr = ""
End Sub

Private Function bCheckCadreDePrélèvement(bMessage As Boolean) As Boolean
  Dim bOk As Boolean
  
  bOk = True
  If Not IsNumeric(txtNumCpr) Then
    bOk = False
  Else
    If txtNumCpr < 1 Or txtNumCpr > 1000 Then
      bOk = False
    Else
      If txtNumCpr <> CStr(CInt(txtNumCpr)) Then bOk = False
    End If
  End If
  
  If Not bOk Then
    txtNomCpr = ""
    If bMessage Then
      txtNumCpr.SetFocus
      MsgBox2i "CO004", txtNumCpr
      'MsgBox "Numéro de cadre de prélèvement invalide.", vbExclamation, sNomApp
      txtNumCpr.SetFocus
    End If
    bCheckCadreDePrélèvement = False
    Exit Function
  End If
  
  Dim p As LibelléRA
  Set p = LireLibelléRA(rCadrePrélèvement, txtNumCpr)
  If p Is Nothing Then
    txtNomCpr = ""
    If bMessage Then
      txtNumCpr.SetFocus
      MsgBox2i "CO005", txtNumCpr
      'MsgBox "Cadre de prélèvement inexistant.", vbExclamation, sNomApp
      txtNumCpr.SetFocus
    End If
    bCheckCadreDePrélèvement = False
    Exit Function
  End If
  
  txtNomCpr = p.lcr_libelle
  bCheckCadreDePrélèvement = True
End Function

Private Sub txtNumcpr_GotFocus()
  AutoSelect txtNumCpr
  sbStatus.SimpleText = txtNumCpr.Tag
End Sub

Private Sub txtNumcpr_LostFocus()
  If bCheckCadreDePrélèvement(False) Or txtNumCpr = "" Then
    txtNumCpr.ForeColor = &H80000008
  Else
    txtNumCpr.ForeColor = &HFF&
  End If
End Sub

Private Sub txtNumcpr_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtNumCpr.Locked = False Then RechercheCadreDePrélèvement
End Sub



'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "CPCaption"
  
  SetLib btnOk, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib lblDatePrévue, "Caption", "CPlblDatePrévue"
  SetLib txtDatePrévue, "Tag", "CPtxtDatePrévue.tag"
  SetLib fraCadrePrél, "Caption", "CPfraCadrePrél"
  SetLib optDLC, "Caption", "CPoptDLC"
  SetLib optTout, "Caption", "CPoptTout"
  SetLib optAutre, "Caption", "CPoptAutre"
  SetLib txtNumCpr, "Tag", "CPtxtNumCpr.tag"
  SetLib chkImpression, "Caption", "CPchkImpression"
    
End Sub

