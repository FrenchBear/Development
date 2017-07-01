VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "mswless.ocx"
Begin VB.Form frmAjoutGerme 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Ajout/Modification d'un germe"
   ClientHeight    =   5745
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7590
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAjoutGerme.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5745
   ScaleWidth      =   7590
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtSensibilité 
      Height          =   315
      Left            =   3720
      MaxLength       =   2
      TabIndex        =   14
      Tag             =   "Entrez la valeur du seuil minimum."
      Top             =   1980
      Width           =   675
   End
   Begin VB.TextBox txtPrixSpécifique 
      Height          =   315
      Left            =   1320
      TabIndex        =   16
      Tag             =   "200"
      Top             =   2340
      Width           =   1035
   End
   Begin SCRAW.BDCombo bdcMMéthode 
      Height          =   330
      Left            =   1320
      TabIndex        =   3
      Top             =   480
      Width           =   2355
      _ExtentX        =   4154
      _ExtentY        =   582
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
   Begin VB.TextBox txtLibelléMéthode 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1680
      Locked          =   -1  'True
      TabIndex        =   6
      TabStop         =   0   'False
      Tag             =   "200"
      Top             =   840
      Width           =   4215
   End
   Begin VB.TextBox txtMéthode 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1320
      Locked          =   -1  'True
      TabIndex        =   5
      TabStop         =   0   'False
      Tag             =   "200"
      Top             =   840
      Width           =   315
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   330
      Left            =   6180
      TabIndex        =   22
      Top             =   1080
      Width           =   1350
   End
   Begin VB.ComboBox cboGerme 
      Height          =   330
      Left            =   1320
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   60
      Width           =   4575
   End
   Begin VB.TextBox txtUnité 
      Height          =   315
      Left            =   1320
      MaxLength       =   10
      TabIndex        =   8
      Tag             =   "Entrez l'unité sur laquelle est exprimé le résultat, généralement /g."
      Top             =   1260
      Width           =   1335
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   330
      Left            =   6180
      TabIndex        =   21
      Top             =   480
      Width           =   1350
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   330
      Left            =   6180
      TabIndex        =   20
      Top             =   60
      Width           =   1350
   End
   Begin VB.TextBox txtSeuil 
      Height          =   315
      Left            =   1320
      MaxLength       =   8
      TabIndex        =   12
      Tag             =   "Entrez la valeur du seuil minimum."
      Top             =   1980
      Width           =   1035
   End
   Begin VB.TextBox txtM 
      Height          =   315
      Left            =   1320
      MaxLength       =   8
      TabIndex        =   10
      Tag             =   "Entrez la valeur de m qui apparaîtra sur le CRA: vide ou numérique ou - ou ABSENCE."
      Top             =   1620
      Width           =   1035
   End
   Begin MSFlexGridLib.MSFlexGrid fgBoîtes 
      Height          =   2175
      Left            =   60
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   3180
      Width           =   4635
      _ExtentX        =   8176
      _ExtentY        =   3836
      _Version        =   393216
      Rows            =   8
      Cols            =   6
      FixedCols       =   0
      FocusRect       =   0
      HighLight       =   0
      ScrollBars      =   2
      SelectionMode   =   1
      BorderStyle     =   0
      FormatString    =   "<Milieu    |>Dil  |>Qté  |>No bte|<Type bte|Légende"
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   23
      Top             =   5430
      Width           =   7590
      _ExtentX        =   13388
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
   Begin SCRAW.BDCombo bdcDevise 
      Height          =   330
      Left            =   2400
      TabIndex        =   17
      Top             =   2340
      Width           =   2475
      _ExtentX        =   4366
      _ExtentY        =   582
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
   Begin VB.Label lblSensibilité 
      AutoSize        =   -1  'True
      Caption         =   "Sensibilité :"
      Height          =   210
      Left            =   2520
      TabIndex        =   13
      Top             =   2040
      Width           =   1095
   End
   Begin VB.Label lblPrix 
      AutoSize        =   -1  'True
      Caption         =   "Prix :"
      Height          =   210
      Left            =   60
      TabIndex        =   15
      Tag             =   "204"
      Top             =   2400
      Width           =   480
   End
   Begin MSWLess.WLCommand btnNouveau 
      Height          =   315
      Index           =   1
      Left            =   4920
      TabIndex        =   25
      TabStop         =   0   'False
      Tag             =   "prix"
      ToolTipText     =   "Cliquez pour voir le rôle de ce nouveau champ"
      Top             =   2340
      Visible         =   0   'False
      Width           =   405
      _ExtentX        =   714
      _ExtentY        =   556
      _Version        =   393216
      Caption         =   "ç"
      ForeColor       =   -1
      BackColor       =   65535
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Wingdings"
         Size            =   12
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Style           =   1
   End
   Begin VB.Label lblInfo 
      Caption         =   "La liste des boîtes est définie par les dilutions du critère spécial RE01 pour la métaméthode sélectionnée."
      Height          =   915
      Left            =   4860
      TabIndex        =   24
      Top             =   3180
      Width           =   2655
   End
   Begin VB.Label lblMéthode 
      AutoSize        =   -1  'True
      Caption         =   "Méthode :"
      Height          =   210
      Left            =   60
      TabIndex        =   4
      Tag             =   "204"
      Top             =   900
      Width           =   960
   End
   Begin VB.Label lblMMéthode 
      AutoSize        =   -1  'True
      Caption         =   "MMéthode :"
      Height          =   210
      Left            =   60
      TabIndex        =   2
      Tag             =   "204"
      Top             =   540
      Width           =   1110
   End
   Begin VB.Label lblListeBoîte 
      AutoSize        =   -1  'True
      Caption         =   "Liste des boîtes (pour information) :"
      Height          =   210
      Left            =   60
      TabIndex        =   18
      Top             =   2880
      Width           =   3405
   End
   Begin VB.Label lblUnité 
      AutoSize        =   -1  'True
      Caption         =   "Unité :"
      Height          =   210
      Left            =   60
      TabIndex        =   7
      Top             =   1320
      Width           =   630
   End
   Begin VB.Label lblSeuil 
      AutoSize        =   -1  'True
      Caption         =   "Seuil :"
      Height          =   210
      Left            =   60
      TabIndex        =   11
      Top             =   2040
      Width           =   585
   End
   Begin VB.Label lblM 
      AutoSize        =   -1  'True
      Caption         =   "m :"
      Height          =   210
      Left            =   60
      TabIndex        =   9
      Top             =   1680
      Width           =   300
   End
   Begin VB.Label lblGerme 
      AutoSize        =   -1  'True
      Caption         =   "Germe"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   615
   End
End
Attribute VB_Name = "frmAjoutGerme"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille d'ajout et de modification de germe"
' frmAjoutGerme
' Feuille d'ajout et de modification de germe
' L'ajout est basé sur le critère RE01, rapatrié au 1er besoin
' --> protection contre la ré-entrance
'  6/09/1997 PV
' 14/05/1998 PV Sablier pendant le chargement
' 22/07/1998 PV Possibilité de changer de métaméthode pour un germe ajouté
' 11/12/1998 PV Si germe=7/-7, légende de la boîte = unité du germe
' 22/01/1999 PV Métaméthode B, AFNOR Bis
' 27/01/1999 NC Internationalisation
' 29/03/1999 PV 26 métaméthodes
'  5/12/2000 PV Prix et sensibilité


' A voir:
' Ajouter le libellé descriptif de la méthode, pour info

Option Explicit

' Collection des modèles RE01, puisque chaque métaméthode d'analyse
' donne une liste de germes différents. Clé: métaméthode
Private colModèles As New Collection

' Modèle sélectionné en fonction de la métaméthode
Private lg As RA


Private bModeModification As Boolean

' Résultat
Private g As GermeRecherché


Private Sub SetMétaMéthode(ByVal sMMéthode As String)
  cboGerme.Clear
  fgBoîtes.Rows = 1
  txtMéthode = ""
  txtLibelléMéthode = ""
  If sMMéthode = "" Then Exit Sub
  
  Dim iErr As Long
  On Error Resume Next
  Set lg = colModèles(sMMéthode)
  iErr = Err
  On Error GoTo 0
  
  If iErr > 0 Then  ' Modèle pas encore chargé
    Set lg = LireCritèreDilutions("RE01", 0, sMMéthode, "")
    If lg Is Nothing Then Stop
    colModèles.Add lg, sMMéthode
  End If
  
  Dim ga As GermeRecherché
  For Each ga In lg.cGermes
    cboGerme.AddItem ga.iGerme & ": " & LireGerme(ga.iGerme).ger_libelle
  Next
  
End Sub


' Point d'entrée en cas de modification
Public Function Modifie(ByVal sMMéthode As String, g0 As GermeRecherché) As GermeRecherché
  ' Contrôle des arguments
  Assert sMMéthode >= "A" And sMMéthode <= "Z" And Len(sMMéthode) = 1
  
  bModeModification = True
  
  cboGerme.Enabled = False
  bdcMMéthode.Visible = False
  lblMMéthode.Visible = False
  
  cboGerme.Clear
  cboGerme.AddItem g0.iGerme & ": " & LireGerme(g0.iGerme).ger_libelle
  cboGerme.ListIndex = 0
  
  txtMéthode = g0.sMéthode
  txtLibelléMéthode = sLibelléMéthode(g0.iGerme, g0.sMéthode)
  txtUnité = g0.sUnité
  txtM = g0.m
  txtSeuil = NV(g0.s)
  txtSensibilité = NV(g0.sSensibilité)
  txtPrixSpécifique = NV(g0.dPrix)
  bdcDevise = g0.cDevise

  ' On affiche (pour rien !) la liste des boîtes
  fgBoîtes.Rows = 1
  Dim b As Boîte
  For Each b In g0.cBoîtes
    fgBoîtes.AddItem b.boi_milieu & ": " & LireMilieu(b.boi_milieu).mil_abrege & vbTab & b.boi_dilution & vbTab & NV(b.boi_quantite) & vbTab & b.boi_numboite & vbTab & b.boi_typemarquage & " / " & b.boi_typeboite & vbTab & _
      IIf(Abs(g0.iGerme) = 7, "[Unité]", b.boi_legende)
  Next
  
  If g0.bOrigineCritère Then
    MsgBox2i "CR160"
    'MsgBox "Attention, ce germe est issu d'un critère, il n'est pas modifiable.", vbInformation, sNomApp
    Caption = sGetIntlLib("CR327", "Visualisation d'un germe")
    txtUnité.Locked = True
    txtM.Locked = True
    txtSeuil.Locked = True
    btnOK.Enabled = True
  Else
    Caption = sGetIntlLib("CR328", "Modification d'un germe")
    txtUnité.Locked = False
    txtM.Locked = False
    txtSeuil.Locked = False
    btnOK.Enabled = True
  End If
  
  lblInfo.Visible = False
  Set g = Nothing   ' Pas de retour par défaut
  Me.Show 1
  
  ' Optimisation
  If Not g Is Nothing Then
    If g.iGerme = g0.iGerme And g.sUnité = g0.sUnité And g.m = g0.m And g.s = g0.s And g.sSensibilité = g0.sSensibilité And g.dPrix = g0.dPrix And g.cDevise = g0.cDevise Then
      Set g = Nothing
      MsgBox2i "CR161"
      'MsgBox "Rien n'a été modifié !", vbInformation, sNomApp
    End If
  End If
  
  Set Modifie = g
End Function


' Point d'entrée en cas d'ajout
Public Function Ajout(ByVal sMMéthode As String) As GermeRecherché
  ' Contrôle des arguments
  Assert sMMéthode >= "A" And sMMéthode <= "Z" And Len(sMMéthode) = 1
  
  bModeModification = False
    
  cboGerme.Enabled = True
  bdcMMéthode.Visible = True
  lblMMéthode.Visible = True

  txtUnité.Locked = False
  txtM.Locked = False
  txtSeuil.Locked = False
  btnOK.Enabled = True
  
  ' Initialisation de la combo, ce qui appelle SetMétaMéthode
  bdcMMéthode = sMMéthode
  
  fgBoîtes.Rows = 1
  txtUnité = ""
  txtM = ""
  txtSeuil = ""
  txtSensibilité = ""
  txtPrixSpécifique = ""
  bdcDevise = ""
  
  Caption = sGetIntlLib("CR329", "Ajout d'un germe")
  lblInfo.Visible = True
  Set g = Nothing
  Me.Show vbModal
  If Not g Is Nothing Then g.bOrigineCritère = False    ' Par principe !
  Set Ajout = g
End Function


Private Sub bdcMMéthode_Click()
  If bdcMMéthode = "" Then Exit Sub
  If InStr(bdcMMéthode.FullText, bdcMMéthode.Séparateur) = 0 Then bdcMMéthode.Synchronise
  If InStr(bdcMMéthode.FullText, bdcMMéthode.Séparateur) = 0 Then bdcMMéthode = ""
  SetMétaMéthode bdcMMéthode
End Sub

Private Sub bdcMMéthode_Change()
  If bdcMMéthode = "" Then Exit Sub
  If InStr(bdcMMéthode.FullText, bdcMMéthode.Séparateur) = 0 Then bdcMMéthode.Synchronise
  If InStr(bdcMMéthode.FullText, bdcMMéthode.Séparateur) = 0 Then bdcMMéthode = ""
  SetMétaMéthode bdcMMéthode
End Sub

Private Sub bdcMMéthode_LostFocus()
  bdcMMéthode.Synchronise
End Sub

' ===================================================
' Boutons

Private Sub btnAide_Click()
  Aide "frmajger"
End Sub

Private Sub btnAnnuler_Click()
  Hide
End Sub

Private Sub btnNouveau_Click(Index As Integer)
  Select Case btnNouveau(Index).Tag
    Case "prix":        Nouveau "Permet de préciser un prix spécifique du germe, ou 0 pour un germe gratuit.|Laisser le champ vide pour une facturation ordinaire."
  End Select
End Sub

Private Sub btnOK_Click()
  If cboGerme.ListIndex < 0 Then
    MsgBox2i "CR167"
    'MsgBox "Choisissez un germe avant de valider !", vbInformation, sNomApp
    Exit Sub
  End If
  
  If txtUnité = "" Then
    Dim iRep As Integer
    Dim sMsg As String
    sMsg = sGetIntlLib("CR168", "Question 168")
    iRep = MsgBox(sMsg, vbOKCancel + vbQuestion, sNomApp)
    'iRep = MsgBox("Attention !" & vbCrLf & "L'unité n'est pas définie. Ok pour ajouter un germe sans unité ?", vbOKCancel + vbQuestion, sNomApp)
    
    If iRep = vbCancel Then Exit Sub
  End If
  
  If txtM <> "" And txtM <> "ABSENCE" And txtM <> "-" And Not IsNumeric(txtM) Then
    MsgBox2i "CR170"
    'MsgBox "Le champ m doit être numérique, ou être vide, ou valoir - ou ABSENCE !", vbInformation, sNomApp
    Exit Sub
  End If
  If IsNumeric(txtM) Then
    If txtM < -1 Or txtM > 10000000# Or txtM <> CStr(CLng(txtM)) Then
      MsgBox2i "CR171"
      'MsgBox "Le champ m doit être entier et compris entre -1 et 10 000 000", vbInformation, sNomApp
      txtM.SetFocus
      Exit Sub
    End If
  End If
  
  If InStr(txtSeuil, ".") <> 0 Then txtSeuil = Replace(txtSeuil, ".", ",")
  If Not IsNumeric(txtSeuil) Then
    MsgBox2i "CR175"
    'MsgBox "Le seuil est obligatoire et doit être numérique !", vbInformation, sNomApp
    txtSeuil.SetFocus
    If txtSeuil = "" And Not bShiftPressed Then Exit Sub
  End If
  If IsNumeric(txtSeuil) Then
    If txtSeuil <> -1 And (txtSeuil < 0 Or txtSeuil > 10000000#) Then
      MsgBox2i "CR177"
      'MsgBox "Le seuil doit être entier et compris entre 0 et 10 000 000", vbInformation, sNomApp
      Exit Sub
    End If
    Dim dSeuil As Double
    dSeuil = CDbl(txtSeuil)
    If dSeuil > 0 And 10 * dSeuil <> CLng(10 * dSeuil) Then
      MsgBox2i "CR177b"   ' Une seule décimale pour le seuil
      Exit Sub
    End If
  End If
  
  
  If IsNumeric(txtM) And IsNumeric(txtSeuil) Then
    If CLng(txtSeuil) > CLng(txtM) Then
      MsgBox2i "CR181"
      'MsgBox "Le seuil doit être inférieur ou égal à m !", vbInformation, sNomApp
      Exit Sub
    End If
  End If
  
  ' Pas de contrôle sur la sensibilité
  ' Le maxlength=2 du champ fait le travail
  
  ' Prix
  Dim dPrix As Variant
  If txtPrixSpécifique <> "" Then
    If Not IsNumeric(txtPrixSpécifique) Then
      txtPrixSpécifique.SetFocus
      MsgBox2i "CR163P"
      Exit Sub
    End If
  End If
  If txtPrixSpécifique = "" Then
    dPrix = Null
  Else
    dPrix = CSng(txtPrixSpécifique)
  End If
  
  ' Devise
  ' On râle si prix sans devise, devise sans prix, ou devise inconnue
  If bdcDevise.ListIndex < 0 Then bdcDevise.Synchronise
  If (IsNull(dPrix) And bdcDevise.ListIndex <> 0) Or bdcDevise.ListIndex < 0 Or ((Not IsNull(dPrix)) And bdcDevise.ListIndex = 0) Then
    MsgBox2i "CR163P"
    bdcDevise.SetFocus
    Exit Sub
  End If
  
  
  If bModeModification Then
    Set g = New GermeRecherché
    g.iGerme = Val(cboGerme.Text)     ' Uniquement pour SetRésultatDéfaut
    g.bGermeModifié = True
  Else
    ' Ajout d'un germe
    Set g = lg.cGermes(cboGerme.ListIndex + 1)
    g.bOrigineCritère = False
  End If
  g.sUnité = txtUnité
  g.m = txtM
  g.s = txtSeuil
  g.sSensibilité = Trim(txtSensibilité)
  g.dPrix = dPrix
  g.cDevise = Trim(bdcDevise)
  g.SetRésultatDéfaut
  
  ' S'il s'agit du germe -7 (Salmonelle), on change la légende des boîtes pour
  ' remplacer la légende d'origine par l'unité
  If Abs(g.iGerme) = 7 Then
    Dim b As Boîte
    For Each b In g.cBoîtes
      b.boi_legende = txtUnité
    Next
  End If
  
  Unload Me
End Sub




' ===================================================
' Liste des germes

Private Sub cboGerme_Click()
  If cboGerme.ListCount > 1 Then
    If cboGerme.ListIndex = -1 Then Exit Sub
    
    ' On verrouille provisoirement la combo
    ' pour évite les problèmes de ré-entrance sur LireMilieu et sLibelléAbrégé
    cboGerme.Locked = True
    
    fgBoîtes.Rows = 1 + lg.cGermes(cboGerme.ListIndex + 1).cBoîtes.Count
    Dim b As Boîte
    Dim i As Integer
    i = 1
    For Each b In lg.cGermes(cboGerme.ListIndex + 1).cBoîtes
      fgBoîtes.TextMatrix(i, 0) = b.boi_milieu & ": " & LireMilieu(b.boi_milieu).mil_abrege
      fgBoîtes.TextMatrix(i, 1) = b.boi_dilution
      fgBoîtes.TextMatrix(i, 2) = NV(b.boi_quantite)
      fgBoîtes.TextMatrix(i, 3) = b.boi_numboite
      fgBoîtes.TextMatrix(i, 4) = b.boi_typemarquage & " / " & b.boi_typeboite
      fgBoîtes.TextMatrix(i, 5) = IIf(Abs(lg.cGermes(cboGerme.ListIndex + 1).iGerme) = 7, "[Unité]", b.boi_legende)
      i = i + 1
    Next
    txtMéthode = lg.cGermes(cboGerme.ListIndex + 1).sMéthode
    txtLibelléMéthode = sLibelléMéthode(lg.cGermes(cboGerme.ListIndex + 1).iGerme, txtMéthode)
    
    cboGerme.Locked = False
  End If
End Sub

Private Sub cboGerme_GotFocus()
  SetLib sbStatus, "SimpleText", "AGtxtcboGerme.tag"
  'sbStatus.SimpleText = "Choisissez le germe à ajouter, F4 ouvre la liste."
End Sub


' =============================================================
' Feuille

Private Sub Form_Activate()
  On Error Resume Next
  If cboGerme.Enabled Then
    cboGerme.SetFocus
  Else
    txtUnité.SetFocus
  End If
End Sub

Private Sub Form_Load()
  Internationalisation
  
  ' Remplissage des combos
  Dim cMM As Integer
  For cMM = Asc("A") To Asc("Z")
    bdcMMéthode.AddItem Chr(cMM), sLibelléMétaméthode(Chr(cMM))
  Next
  
  '$$ A généraliser
  bdcDevise.AddItem "", ""
  bdcDevise.AddItem "F", "Franc"
  bdcDevise.AddItem "E", "Euro"
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  Hide
End Sub


' ===========================================================
' Champ Unité

Private Sub txtUnité_GotFocus()
  txtUnité.SelStart = 0
  txtUnité.SelLength = 99
  sbStatus.SimpleText = txtUnité.Tag
End Sub


' ===========================================================
' Champ m

Private Sub txtM_GotFocus()
  txtM.SelStart = 0
  txtM.SelLength = 99
  sbStatus.SimpleText = txtM.Tag
End Sub

Private Sub txtM_Change()
  ' On convertit en majuscules
  ' Subtil: marche pour la saisie et pour un coller
  If txtM <> UCase(txtM) Then
    Dim sStart As Integer, sLength As Integer
    sStart = txtM.SelStart
    sLength = txtM.SelLength
    txtM = UCase(txtM)
    txtM.SelStart = sStart
    txtM.SelLength = sLength
  End If
End Sub


' ===========================================================
' Champ seuil

Private Sub txtSeuil_GotFocus()
  txtSeuil.SelStart = 0
  txtSeuil.SelLength = 99
  sbStatus.SimpleText = txtSeuil.Tag
End Sub


' ===============================================================
' Prix spécifique

Private Sub txtPrixSpécifique_GotFocus()
  AutoSelect txtPrixSpécifique
  sbStatus.SimpleText = txtPrixSpécifique.Tag
End Sub



' ===============================================================
' Devise

Private Sub bdcDevise_GotFocus()
  AutoSelect bdcDevise
  sbStatus.SimpleText = bdcDevise.Tag
End Sub

Private Sub bdcDevise_LostFocus()
  bdcDevise.Synchronise
End Sub


' ============================================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "AGCaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib lblGerme, "Caption", "AGlblGerme"
  SetLib lblMMéthode, "Caption", "AGlblMMéthode"
  SetLib lblMéthode, "Caption", "AGlblMéthode"
  SetLib lblUnité, "Caption", "AGlblUnité"
  SetLib txtUnité, "Tag", "AGtxtUnité.tag"
  SetLib lblM, "Caption", "AGlblm"
  SetLib txtM, "Tag", "AGtxtM.tag"
  SetLib lblSeuil, "Caption", "AGlblSeuil"
  SetLib txtSeuil, "Tag", "AGtxtSeuil.tag"
  SetLib lblSensibilité, "Caption", "AGlblSensibilité"    '$$ A ajouter dans la base
  SetLib txtSensibilité, "Tag", "AGtxtSensibilité.tag"    '$$ A ajouter dans la base
  SetLib lblPrix, "Caption", "AGlblPrix"
  SetLib txtPrixSpécifique, "Tag", "AGtxtPrix.tag"
  SetLib bdcDevise, "Tag", "AGbdcDevise.tag"
  SetLib lblListeBoîte, "Caption", "AGlblListeBoîte"
  SetLib lblInfo, "Caption", "AGlblInfo"
  
  Dim sMsg As String
  sMsg = sGetIntlLib("AGtêteBoîtes", "<Milieu    |>Dil  |>Qté  |>No bte|<Type bte|Légende")
  fgBoîtes.FormatString = Subst(sMsg, vbCrLf, "|")
End Sub

