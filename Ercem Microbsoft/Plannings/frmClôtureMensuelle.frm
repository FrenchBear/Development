VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmCl�tureMensuelle 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cl�ture mensuelle"
   ClientHeight    =   1680
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5670
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmCl�tureMensuelle.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1680
   ScaleWidth      =   5670
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   4260
      TabIndex        =   5
      Top             =   465
      Width           =   1350
   End
   Begin VB.CommandButton btnOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   4260
      TabIndex        =   4
      Top             =   60
      Width           =   1350
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   4260
      TabIndex        =   6
      Top             =   960
      Width           =   1350
   End
   Begin Plannings.ChampDate txtDateCl�tureActuelle 
      Height          =   315
      Left            =   2700
      TabIndex        =   1
      TabStop         =   0   'False
      Tag             =   "Entrez la date de destination"
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
      BackColor       =   -2147483633
      Locked          =   -1  'True
      SaisieAssist�e  =   "ATTENTE=1/1/2019"
   End
   Begin Plannings.ChampDate txtNouvelleDateCl�ture 
      Height          =   315
      Left            =   2700
      TabIndex        =   3
      Tag             =   "Entrez la nouvelle date, F4 pour le calendrier."
      Top             =   420
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
      SaisieAssist�e  =   "ATTENTE=1/1/2019"
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   7
      Top             =   1365
      Width           =   5670
      _ExtentX        =   10001
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
   Begin VB.Label lblNouvelleP�riode 
      AutoSize        =   -1  'True
      Caption         =   "Nouvelle p�riode ouverte :"
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Top             =   480
      Width           =   2520
   End
   Begin VB.Label lblP�riodeActuelle 
      AutoSize        =   -1  'True
      Caption         =   "P�riode actuelle ouverte :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   2445
   End
End
Attribute VB_Name = "frmCl�tureMensuelle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmCl�tureMensuelle
' Gestion de la cl�ture mensuelle des plannings
' 18/03/1999 PV

Option Explicit

Private Sub btnAide_Click()
  Aide "frmclotm"
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub btnOk_Click()
  If bBlocageEnCours Then Beep: Exit Sub
  
  ' Contr�les�
  If Not bOkDate(txtNouvelleDateCl�ture) Then
    MsgBox2i "CO004", txtNouvelleDateCl�ture
    'MsgBox2 "Date incorrecte.", "PL020"
    txtNouvelleDateCl�ture.SetFocus
    Exit Sub
  End If
  
  Dim dNDC As Date
  dNDC = dD�codeDate(txtNouvelleDateCl�ture)
  
  If dNDC > Today Then
    MsgBox2i "PL120"
    'MsgBox "Vous ne pouvez pas effectuer une cl�ture des plannings dans le futur.", vbExclamation, sNomApp
    If Not bShiftPressed Then Exit Sub
  End If
  
  If dNDC < dPremierJourNonCl�t Then
    MsgBox2i "PL121"
    'MsgBox "Vous ne pouvez pas reculer la date de cl�ture mensuelle.", vbExclamation, sNomApp
    If Not bShiftPressed Then Exit Sub
  End If


  ' Gestion du marqueur
  Dim cp As Collection
  Dim p As Intervention
  Set cp = RecherchePlanning(dPremierJourNonCl�t, "@A")
  
  If cp.count = 0 Then
    ' Cr�ation du planning marqueur
    Set p = New Intervention
    p.pla_systeme = cSyst�meCA
    p.pla_serie = 0     ' Nouveau
    p.pla_iref = Null
    p.pla_lettres = "@A"
    p.pla_pers = 0
    p.pla_unite = 0
    p.pla_etb = 7
    p.pla_operbl = Null
    p.pla_tsbl = Null
    p.pla_operfp = Null
    p.pla_tsfp = Null
    p.pla_comment = ""
    p.pla_nbab = Null
    p.pla_nbeh = Null
    p.pla_nbbs = Null
    p.pla_nbli = Null
    p.pla_nbfs = Null
    p.pla_nbhu = Null
    p.pla_nbch = Null
    p.etb_prefixe = "DI.CP"
    p.etb_nom = "MARQUEUR DE CL�TURE DE PLANNING"
    p.etb_proprio = "E"
    p.pla_harrivee = Null
    p.pla_hdepart = Null
    p.pla_typeprest = Null
    p.pla_activite = Null
    p.pla_client = ""
    p.pla_dateorigine = Null
  Else
    ' D�calage du marqueur
    Set p = cp(1)
  End If
  p.pla_dateplan = dNDC
  EcritPlanning p

  dPremierJourNonCl�t = dNDC
  Unload Me
End Sub


Private Sub Form_Load()
  Internationalisation
  
  ' On lit le planning de l'�tablissement 7
  bContr�leCl�tureMensuelle Today
  txtDateCl�tureActuelle = dPremierJourNonCl�t
  
  Dim d As Date
  d = DateSerial(Year(Now), Month(Now), 1)
  If d <= dPremierJourNonCl�t Then d = DateSerial(Year(Now), Month(Now) + 1, 1)
  txtNouvelleDateCl�ture = d
End Sub

'======================================================================

Private Sub RechercheDate()
  Dim d As String
  d = frmRechercheDate.Cherche(txtNouvelleDateCl�ture.DateSaisie)
  If d <> "" Then
    txtNouvelleDateCl�ture.DateSaisie = d
    txtNouvelleDateCl�ture.SelStart = 0
    txtNouvelleDateCl�ture.SelLength = 99
  End If
End Sub

Private Sub txtNouvelleDateCl�ture_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then RechercheDate
End Sub

Private Sub btnCalendrier_Click()
  RechercheDate
End Sub

'======================================================================

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

Private Sub txtNouvelleDateCl�ture_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub


'=============================================================================

Private Sub Internationalisation()
  SetLib Me, "Caption", "CLCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib lblP�riodeActuelle, "Caption", "CLlblP�riodeActuelle"
  SetLib lblNouvelleP�riode, "Caption", "CLlblNouvelleP�riode"
  SetLib txtDateCl�tureActuelle, "Tag", "CLtxtDateCl�tAct.tag"
  SetLib txtNouvelleDateCl�ture, "Tag", "CLtxtNouvDatCl�t.tag"
  
End Sub
