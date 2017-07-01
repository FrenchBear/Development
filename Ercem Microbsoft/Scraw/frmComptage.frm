VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmComptage 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Comptage des analyses pr�vues"
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
      Tag             =   "Cliquer pour s�lectionner la date dans un calendrier."
      ToolTipText     =   "Cliquer pour s�lectionner la date dans un calendrier"
      Top             =   120
      Width           =   315
   End
   Begin VB.CheckBox chkImpression 
      Caption         =   "&Imprimer les r�f�rences s�lectionn�es"
      Height          =   195
      Left            =   120
      TabIndex        =   9
      Tag             =   "Lance l'impression des r�f�rences s�lectionn�es."
      Top             =   2220
      Width           =   4455
   End
   Begin VB.Frame fraCadrePr�l 
      Caption         =   "Cadre de pr�l�vement"
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
         Tag             =   "Entrez le num�ro du cadre de pr�l�vement, F4 pour une recherche."
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
         Caption         =   "Tous les cadres de pr�l�vement"
         Height          =   315
         Left            =   120
         TabIndex        =   5
         Top             =   540
         Width           =   3915
      End
      Begin VB.OptionButton optDLC 
         Caption         =   "Analyse � la DLC (8)"
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
   Begin SCRAW.ChampDate txtDatePr�vue 
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
   Begin VB.Label lblDatePr�vue 
      AutoSize        =   -1  'True
      Caption         =   "D&ate pr�vue :"
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
'  1/12/1998 PV Impression des r�f�rences s�lectionn�es
' 27/01/1999 NC Internationalisation


Option Explicit

Private Sub btnAide_Click()
  Aide "frmcomptage"
End Sub

Private Sub btnAide_GotFocus()
  SetLib sbStatus, "SimpleText", "CPtxtbtnAide.tag"
  'sbStatus.SimpleText = "Affiche l'aide sur cette bo�te de dialogue"
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnAnnuler_GotFocus()
  SetLib sbStatus, "SimpleText", "CPtxtbtnAnnuler.tag"
  'sbStatus.SimpleText = "Ferme la fen�tre sans lancer le comptage"
End Sub

Private Sub btnCalendrier_Click()
  frmRA.calendrier txtDatePr�vue
End Sub

Private Sub btnCalendrier_GotFocus()
  sbStatus.SimpleText = btnCalendrier.Tag
End Sub

Private Sub btnOk_Click()
  If Not bOkDate(txtDatePr�vue.DateSaisie) Then
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
    If Not bCheckCadreDePr�l�vement(True) Then Exit Sub
    cpr = Val(txtNumCpr)
  End If
  
  ' Comptage�
  Screen.MousePointer = vbHourglass
  SetLib sbStatus, "SimpleText", "CPtxtMP.tag"
  'sbStatus.SimpleText = "Comptage en cours, patientez�"
  Dim iNb As Long
  iNb = CompteAnalysesPr�vues(txtDatePr�vue.DateSaisie, cpr, chkImpression = vbChecked)
  
  Dim sMessage As String
  
  If iNb > 0 Then
    sMessage = iNb & " "
  Else
    sMessage = sGetIntlLib("CPtxtCompt1", "Aucune ")
  End If
  If iNb > 1 Then
    sMessage = sMessage & sGetIntlLib("CPtxtCompt2", "analyses pr�vues")
  Else
    sMessage = sMessage & sGetIntlLib("CPtxtCompt3", "analyse pr�vue")
  End If
  sMessage = sMessage & sprintf(sGetIntlLib("CPtxtCompt4", " au %1"), Format(txtDatePr�vue.DateSaisie, "dd/mm/yyyy"))
  If cpr > 0 Then sMessage = sMessage & sprintf(sGetIntlLib("CPtxtCompt5", " pour le cadre de pr�l�vement %1 ."), cpr)
  
  If chkImpression = vbChecked Then
    sMessage = sMessage & vbCrLf & vbCrLf & sprintf(sGetIntlLib("CPtxtCompt6", "La liste des r�f�rences concern�es a �t� imprim�e sur %1 ."), sImprimanteLaser)
  End If
  
  SetLib sbStatus, "SimpleText", "CPtxtFin.tag"
  'sbStatus.SimpleText = "Termin� !"
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
  Dim sF�te As String
  
  d = Today + 1   ' A priori on cherche pour demain
  Do
    If Weekday(d) = vbSunday Then
      d = d + 1   ' On saute les dimanches
    ElseIf IsJourF�ri�(d, sF�te) Then
      d = d + 1   ' On saute les f�tes
    Else
      Exit Do
    End If
  Loop

  txtDatePr�vue.DateSaisie = d
End Sub

Private Sub optAutre_Click()
  txtNumCpr.Enabled = True
  txtNumCpr.BackColor = &H80000005
End Sub

Private Sub optAutre_GotFocus()
  SetLib sbStatus, "SimpleText", "CPtxtoptAut.tag"
  'sbStatus.SimpleText = "Compte les analyses d'un cadre de pr�l�vement donn�"
End Sub

Private Sub optDLC_Click()
  txtNumCpr.Enabled = False
  txtNumCpr.BackColor = &H8000000F
End Sub

Private Sub optDLC_GotFocus()
  SetLib sbStatus, "SimpleText", "CPtxtoptDLC.tag"
  'sbStatus.SimpleText = "Compte uniquement les analyses � la DLC"
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
  'sbStatus.SimpleText = "Pr�cisez le cadre de pr�l�vement � s�lectionner, F4 pour la liste"
End Sub


' ===============================================================
' Date pr�vue

Private Sub txtDatePr�vue_GotFocus()
  SetLib sbStatus, "SimpleText", "CPtxtDPr�vue.tag"
  'sbStatus.SimpleText = "Entrez la date pour le comptage, F4 pour le calendrier"
  AutoSelect txtDatePr�vue, True
End Sub

Private Sub txtDatePr�vue_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then frmRA.calendrier txtDatePr�vue
End Sub



' ===============================================================
' N� de cadre de pr�l�vement

Private Sub RechercheCadreDePr�l�vement()
  Dim p As Libell�RA
  Set p = frmRechercheLibell�RA.Cherche(rCadrePr�l�vement)
  If Not p Is Nothing Then
    txtNumCpr = p.lcr_indice
    txtNomCpr = p.lcr_libelle
    
    AutoSelect txtNumCpr, True
  End If
End Sub

Private Sub txtNumcpr_Change()
  txtNomCpr = ""
End Sub

Private Function bCheckCadreDePr�l�vement(bMessage As Boolean) As Boolean
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
      'MsgBox "Num�ro de cadre de pr�l�vement invalide.", vbExclamation, sNomApp
      txtNumCpr.SetFocus
    End If
    bCheckCadreDePr�l�vement = False
    Exit Function
  End If
  
  Dim p As Libell�RA
  Set p = LireLibell�RA(rCadrePr�l�vement, txtNumCpr)
  If p Is Nothing Then
    txtNomCpr = ""
    If bMessage Then
      txtNumCpr.SetFocus
      MsgBox2i "CO005", txtNumCpr
      'MsgBox "Cadre de pr�l�vement inexistant.", vbExclamation, sNomApp
      txtNumCpr.SetFocus
    End If
    bCheckCadreDePr�l�vement = False
    Exit Function
  End If
  
  txtNomCpr = p.lcr_libelle
  bCheckCadreDePr�l�vement = True
End Function

Private Sub txtNumcpr_GotFocus()
  AutoSelect txtNumCpr
  sbStatus.SimpleText = txtNumCpr.Tag
End Sub

Private Sub txtNumcpr_LostFocus()
  If bCheckCadreDePr�l�vement(False) Or txtNumCpr = "" Then
    txtNumCpr.ForeColor = &H80000008
  Else
    txtNumCpr.ForeColor = &HFF&
  End If
End Sub

Private Sub txtNumcpr_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 And txtNumCpr.Locked = False Then RechercheCadreDePr�l�vement
End Sub



'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "CPCaption"
  
  SetLib btnOk, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib lblDatePr�vue, "Caption", "CPlblDatePr�vue"
  SetLib txtDatePr�vue, "Tag", "CPtxtDatePr�vue.tag"
  SetLib fraCadrePr�l, "Caption", "CPfraCadrePr�l"
  SetLib optDLC, "Caption", "CPoptDLC"
  SetLib optTout, "Caption", "CPoptTout"
  SetLib optAutre, "Caption", "CPoptAutre"
  SetLib txtNumCpr, "Tag", "CPtxtNumCpr.tag"
  SetLib chkImpression, "Caption", "CPchkImpression"
    
End Sub

