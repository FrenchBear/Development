VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmLot 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Enregistrement de la préparation des milieux"
   ClientHeight    =   6540
   ClientLeft      =   630
   ClientTop       =   615
   ClientWidth     =   8190
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmLot.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6540
   ScaleWidth      =   8190
   ShowInTaskbar   =   0   'False
   Begin VB.ComboBox cboFournisseur 
      Height          =   330
      Left            =   1860
      TabIndex        =   9
      Top             =   1500
      Width           =   3555
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_dlu"
      Height          =   315
      Index           =   13
      Left            =   5760
      TabIndex        =   27
      Tag             =   "Date limite d'utilisation"
      Top             =   3300
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*lot_numlotprepare"
      Height          =   315
      Index           =   12
      Left            =   1860
      TabIndex        =   21
      Tag             =   "N° de lot préparé (n° unique !)"
      Top             =   2940
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      BackColor       =   &H8000000F&
      DataField       =   "lot_serie"
      Height          =   315
      Index           =   0
      Left            =   1860
      Locked          =   -1  'True
      TabIndex        =   1
      TabStop         =   0   'False
      Tag             =   "N° interne du lot de miieu (automatique)"
      Top             =   60
      Width           =   1095
   End
   Begin VB.TextBox txtChamp 
      BackColor       =   &H8000000F&
      DataField       =   "timestamp"
      Height          =   315
      Index           =   2
      Left            =   1860
      Locked          =   -1  'True
      TabIndex        =   33
      TabStop         =   0   'False
      Tag             =   "Timestamp de dernière modification des données"
      Top             =   4020
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_lotbase"
      Height          =   315
      Index           =   1
      Left            =   1860
      TabIndex        =   11
      Tag             =   "Lot de base déshydraté utilisé"
      Top             =   1860
      Width           =   3555
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_valsteril"
      Height          =   315
      Index           =   3
      Left            =   5760
      TabIndex        =   19
      Tag             =   "Validation de la stérilisation"
      Top             =   2580
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_teststeril"
      Height          =   315
      Index           =   4
      Left            =   1860
      TabIndex        =   29
      Tag             =   "Résultat du test de stérilité"
      Top             =   3660
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_poidsbase"
      Height          =   315
      Index           =   6
      Left            =   1860
      TabIndex        =   13
      Tag             =   "Poids de base utilisé"
      Top             =   2220
      Width           =   1515
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_volumeeau"
      Height          =   315
      Index           =   7
      Left            =   5760
      TabIndex        =   15
      Tag             =   "Volume d'eau utilisé"
      Top             =   2220
      Width           =   1515
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_ph"
      Height          =   315
      Index           =   5
      Left            =   1860
      TabIndex        =   25
      Tag             =   "pH du milieu"
      Top             =   3300
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_testfertil"
      Height          =   315
      Index           =   8
      Left            =   5760
      TabIndex        =   31
      Tag             =   "Résultat du test de fertilité"
      Top             =   3660
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lot_dateheure"
      Height          =   315
      Index           =   9
      Left            =   1860
      TabIndex        =   3
      Tag             =   "Date + heure de préparation du milieu"
      Top             =   420
      Width           =   2355
   End
   Begin VB.Frame Frame1 
      Caption         =   "Derniers enre&gistrements"
      Height          =   2115
      Left            =   60
      TabIndex        =   34
      Top             =   4380
      Width           =   8055
      Begin VB.CommandButton btnRechercher 
         Caption         =   "&Rechercher un n° de lot préparé"
         Height          =   375
         Left            =   4620
         TabIndex        =   40
         Top             =   1620
         Width           =   3315
      End
      Begin VB.CommandButton btnModifier 
         Caption         =   "&Modifier"
         Height          =   375
         Left            =   120
         TabIndex        =   36
         Top             =   1620
         Width           =   1455
      End
      Begin VB.CommandButton btnSupprimer 
         Caption         =   "&Supprimer"
         Height          =   375
         Left            =   1740
         TabIndex        =   37
         Top             =   1620
         Width           =   1455
      End
      Begin MSComctlLib.ListView lvDE 
         Height          =   1305
         Left            =   120
         TabIndex        =   35
         Top             =   240
         Width           =   7815
         _ExtentX        =   13785
         _ExtentY        =   2302
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         Appearance      =   1
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "N°"
            Object.Width           =   1182
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Heure"
            Object.Width           =   1940
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Milieu"
            Object.Width           =   1411
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Pers"
            Object.Width           =   582
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "Lot préparé"
            Object.Width           =   2540
         EndProperty
      End
   End
   Begin VB.CommandButton btnInitialiser 
      Caption         =   "Initialiser (F3)"
      Height          =   375
      Left            =   6660
      TabIndex        =   39
      Top             =   540
      Width           =   1455
   End
   Begin VB.CommandButton btnValider 
      Caption         =   "Valider (F2)"
      Height          =   375
      Left            =   6660
      TabIndex        =   38
      Top             =   60
      Width           =   1455
   End
   Begin SaisieLabo.BDCombo bdcPers 
      Height          =   330
      Left            =   1860
      TabIndex        =   5
      Tag             =   "Code personne ayant signalé l'événement"
      Top             =   780
      Width           =   4275
      _ExtentX        =   7541
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
      DataField       =   "*lot_pers"
   End
   Begin SaisieLabo.BDCombo bdcMilieu 
      Height          =   330
      Left            =   1860
      TabIndex        =   7
      Tag             =   "Milieu stocké dans l'étuve"
      Top             =   1140
      Width           =   4275
      _ExtentX        =   7541
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
      DataField       =   "lot_milieu"
   End
   Begin SaisieLabo.BDCombo bdcConditionnement 
      Height          =   330
      Left            =   5760
      TabIndex        =   23
      Tag             =   "Conditionnement"
      Top             =   2940
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
      DataField       =   "lot_condition"
   End
   Begin SaisieLabo.BDCombo bdcAppareil 
      Height          =   330
      Left            =   1860
      TabIndex        =   17
      Tag             =   "Appareil de stérilisation"
      Top             =   2580
      Width           =   2235
      _ExtentX        =   3942
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
      DataField       =   "lot_autoprep"
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Conditionn. :"
      Height          =   210
      Index           =   15
      Left            =   4140
      TabIndex        =   22
      Top             =   3000
      Width           =   1215
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Date limite d'ut. :"
      Height          =   210
      Index           =   14
      Left            =   4140
      TabIndex        =   26
      Top             =   3360
      Width           =   1620
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "N° lot préparé :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   20
      Top             =   3000
      Width           =   1485
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Appareil :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   16
      Top             =   2640
      Width           =   900
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Milieu :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   6
      Top             =   1200
      Width           =   660
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Fournisseur+Ref :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   8
      Top             =   1560
      Width           =   1680
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   270
      Index           =   9
      Left            =   60
      TabIndex        =   32
      Top             =   4080
      Width           =   1155
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Serial :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   120
      Width           =   660
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Lot de base :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   10
      Top             =   1920
      Width           =   1260
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Stérilisation :"
      Height          =   210
      Index           =   2
      Left            =   4140
      TabIndex        =   18
      Top             =   2640
      Width           =   1245
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Test de stérilité :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   28
      Top             =   3720
      Width           =   1605
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "pH :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   24
      Top             =   3360
      Width           =   390
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Personne :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   4
      Top             =   840
      Width           =   1035
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Poids de base :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   12
      Top             =   2280
      Width           =   1470
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Volume d'eau :"
      Height          =   210
      Index           =   7
      Left            =   4140
      TabIndex        =   14
      Top             =   2280
      Width           =   1410
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Test de fertilité :"
      Height          =   210
      Index           =   8
      Left            =   4140
      TabIndex        =   30
      Top             =   3720
      Width           =   1560
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Date + Heure :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   2
      Top             =   480
      Width           =   1410
   End
End
Attribute VB_Name = "frmLot"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmLot
' Saisie des lots de milieux
' 28/05/1998 PV
' 14/04/1999 PV Reprise plus complète, ajout du milieu (!)
' 20/05/1999 PV Dans la liste des derniers enregistrements, base -> milieu; Rechercher lot
' 25/08/1999 PV Test de l'existence de la table c_lotmilieu à l'ouverture de la feuille

Option Explicit

Private Const sTable = "c_lotmilieu"


Private Sub InitialiseChamps(Optional bTousLesChamps As Boolean)
  Dim t As TextBox
  For Each t In txtChamp
    t = ""
  Next
  bdcPers = ""
  bdcMilieu = ""
  bdcAppareil = ""
  bdcConditionnement = ""
  cboFournisseur = ""
  bdcPers.SetFocus
End Sub


Private Sub btnInitialiser_Click()
  InitialiseChamps
End Sub

Private Sub btnModifier_Click()
  ModifierEnregistrement
End Sub

Private Sub btnRechercher_Click()
  Dim sRef As String
  sRef = InputBox("Entrez le n° de lot préparé à rechercher:")
  If sRef = "" Then Exit Sub
  
  Dim cLot As New BDCurseur
  cLot.OpenCurseur "select * from c_lotmilieu where lot_numlotprepare=" & sFormToSQL(sRef, BDTypeCHAR)
  If cLot.EOF Then
    cLot.CloseCurseur
    MsgBox "Lot non trouvé dans la base.", vbExclamation, App.Title
    Exit Sub
  End If
  
  InitialiseChamps
  RécupèreLot cLot
  cLot.CloseCurseur
End Sub

Private Sub btnSupprimer_Click()
  SupprimerEnregistrement
End Sub


Private Sub btnValider_Click()
  ' Contrôle de la personne
  If Not IsNumeric(bdcPers) Then
    MsgBox "Le n° de personne est incorrect.", vbExclamation, App.Title
    bdcPers.SetFocus
    Exit Sub
  End If
  bdcPers.Synchronise
  If bdcPers.ListIndex < 0 Then
    MsgBox "Le n° de personne doit faire partie de la liste.", vbExclamation, App.Title
    bdcPers.SetFocus
    Exit Sub
  End If
  
  ' Contrôle du milieu
  Dim iMilieu As Integer
  If bdcMilieu = "" Then
    MsgBox "Le milieu est obligatoire.", vbExclamation, App.Title
    bdcMilieu.SetFocus
    Exit Sub
  End If
  bdcMilieu.Synchronise
  iMilieu = iIndiceMilieu(bdcMilieu)
  If iMilieu = 0 Then
    MsgBox "Milieu inexistant.", vbExclamation, App.Title
    bdcMilieu.SetFocus
    Exit Sub
  End If
  
  ' Contrôle du pH
  If txtChamp(5) <> "" Then
    Dim p As Integer
    p = InStr(txtChamp(5), ".")
    If p <> 0 Then txtChamp(5) = Left(txtChamp(5), p - 1) & "," & Mid(txtChamp(5), p + 1)
    If Not IsNumeric(txtChamp(5)) Then
      MsgBox "Le pH incorrect.", vbExclamation, App.Title
      txtChamp(5).SetFocus
      Exit Sub
    End If
    If txtChamp(5) < 1 Or txtChamp(5) > 14 Then
      MsgBox "Le pH doit être compris entre 1 et 14.", vbExclamation, App.Title
      txtChamp(5).SetFocus
      Exit Sub
    End If
  End If
  
  
  ' Date de préparation
  If txtChamp(9) <> "" Then
    If Not IsDate(txtChamp(9)) Then
      MsgBox "Date incorrecte.", vbExclamation, App.Title
      txtChamp(9).SetFocus
      Exit Sub
    End If
    
    If CDate(txtChamp(9)) < Today Then
      MsgBox "Date de préparation incorrecte (ne peut être antérieure à la date du jour).", vbExclamation, App.Title
      If Not bShiftPressed Then
        txtChamp(9).SetFocus
        Exit Sub
      End If
    End If
  End If


  ' N° de lot préparé
  If txtChamp(12) = "" Then
    MsgBox "Le n° de lot préparé est obligatoire, et doit être unique.", vbExclamation, App.Title
    txtChamp(12).SetFocus
    Exit Sub
  End If
  
  
  ' Contrôle de la DLU
  If txtChamp(13) = "" Then
    MsgBox "La date limite d'utilisation est obligatoire. Il est possible de saisir +n pour indiquer une date limite d'utilisation dans n jours, ou +0 pour le jour même.", vbExclamation, App.Title
    txtChamp(13).SetFocus
    Exit Sub
  End If
  If Left(txtChamp(13), 1) = "+" Then
    txtChamp(13) = Format(Now + Val(Mid(txtChamp(13), 2)), "dd/mm/yyyy")
  End If
  If Not IsDateSouple(txtChamp(13)) Then
    MsgBox "Date limite d'utilisation invalide.", vbExclamation, App.Title
    txtChamp(13).SetFocus
    Exit Sub
  End If
  Dim d As Date
  d = dDecodeDate(txtChamp(13))
  If d < Today Then
    MsgBox "Date limite d'utilisation incorrecte (ne peut être antérieure à la date du jour).", vbExclamation, App.Title
    If Not bShiftPressed Then
      txtChamp(13).SetFocus
      Exit Sub
    End If
  End If
  
  
  
  ' Tout est Ok !
  
  
  ' Constitution de la liste des valeurs récentes
  If cboFournisseur.Text <> "" Then
    Dim i As Integer
    For i = 0 To cboFournisseur.ListCount - 1
      If StrComp(cboFournisseur.Text, cboFournisseur.List(i), vbTextCompare) = 0 Then Exit For
    Next
    If i < cboFournisseur.ListCount Then
      cboFournisseur.List(i) = cboFournisseur.Text
      cboFournisseur.ListIndex = i
    Else
      cboFournisseur.AddItem cboFournisseur.Text
    End If
  End If


  Screen.MousePointer = vbHourglass
  SetStatus "Enregistrement des informations…"
  
  If txtChamp(9) = "" Then txtChamp(9) = Format(Now, "dd/mm/yyyy hh:mm:ss")
  
  ' Création de l'enregistrement
  Dim cLot As New BDCurseur
  If txtChamp(0) = "" Then
    cLot.OpenCurseur "select * from c_lotmilieu where lot_serie=0"
    cLot.AddNew
  Else
    cLot.OpenCurseur "select * from c_lotmilieu where lot_serie=" & txtChamp(0)
    cLot.Edit
  End If
  cLot!lot_dateheure = txtChamp(9)
  cLot!lot_pers = bdcPers
  cLot!lot_milieu = iMilieu
  cLot!lot_fournisseur = VN(cboFournisseur)
  cLot!lot_lotbase = VN(txtChamp(1))
  cLot!lot_poidsbase = VN(txtChamp(6))
  cLot!lot_volumeeau = VN(txtChamp(7))
  cLot!lot_autoprep = VN(bdcAppareil)
  cLot!lot_valsteril = VN(txtChamp(3))
  cLot!lot_numlotprepare = VN(txtChamp(12))
  cLot!lot_condition = VN(bdcConditionnement)
  cLot!lot_ph = VN(txtChamp(5))
  cLot!lot_dlu = VN(txtChamp(13))
  cLot!lot_teststeril = VN(txtChamp(4))
  cLot!lot_testfertil = VN(txtChamp(8))
  cLot!timestamp = BDTime
  
  On Error Resume Next
  cLot.Update
  If Err Then
    AfficheErreurODBC "Échec lors de la validation des données. Vérifiez que le n° de lot préparé est abolument unique et n'a jamais été utilisé."
    Screen.MousePointer = vbDefault
    SetStatus
    Exit Sub
  End If
  On Error GoTo 0
  
  cLot.CloseCurseur
  
  SetStatus "Lecture du n° de lot…"
  Dim iMax As Long
  If txtChamp(0) = "" Then
    ' triche: pour récupérer un sérial, on lit le max…
    iMax = BDCurseurExpress("select max(lot_serie) from c_lotmilieu")
  Else
    iMax = CLng(txtChamp(0))
    ' On efface l'ancien lot de l'historique
    For i = 1 To lvDE.ListItems.Count
      If lvDE.ListItems(i).Text = iMax Then lvDE.ListItems.Remove i: Exit For
    Next
  End If
  
  ' Ajout de l'événement en tête la liste d'historique
  Dim itmX As ListItem
  Set itmX = lvDE.ListItems.Add(1)
  itmX.Text = iMax
  itmX.SubItems(1) = Format(txtChamp(9), "dd/mm hh:mm")
  itmX.SubItems(2) = bdcMilieu
  itmX.SubItems(3) = bdcPers.Text
  itmX.SubItems(4) = txtChamp(12)     ' N° de lot préparé
  If lvDE.ListItems.Count > 4 Then
    lvDE.ListItems.Remove 5
  End If
  Set lvDE.SelectedItem = itmX
  
  ' On ajuste la taille des colonnes
  AjusteListView Me, lvDE
  
  ' On efface les champs
  InitialiseChamps
  
  Screen.MousePointer = vbDefault
  SetStatus
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  If Not bExisteTable(sTable) Then
    MsgBox "La table '" & sTable & "' n'est pas présente dans la base de données courante, affichage impossible.", vbCritical, App.Title
    Unload Me
    Exit Sub
  End If
  
  Show
  SetStatus "Chargement en cours, patientez…"
  
  ' Chargement des combos
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcPers.AddItem u.uti_numuti, u.uti_nom
  Next
  
  RemplitComboMilieux bdcMilieu, 0

  bdcAppareil.AddItem "AP", "Autopréparateur"
  bdcAppareil.AddItem "AC", "Autoclave"
  bdcAppareil.AddItem "CA", "Casserole"
  
  bdcConditionnement.AddItem "AP", "Autopréparateur"
  bdcConditionnement.AddItem "BP", "Boîte de Pétri"
  bdcConditionnement.AddItem "B", "Bouteille"
  bdcConditionnement.AddItem "T", "Tube"
  
  
  SetStatus "Lecture des derniers lots, patientez…"
  Dim cLot As New BDCurseur, iNb As Integer
  cLot.OpenCurseur "select * from c_lotmilieu order by lot_serie desc"
  Do
    If cLot.EOF Then Exit Do

    Dim itmX As ListItem
    Set itmX = lvDE.ListItems.Add
    itmX.Text = cLot!lot_serie
    itmX.SubItems(1) = Format(cLot!lot_dateheure, "dd/mm hh:mm")
    itmX.SubItems(2) = sAbrégéMilieu(cLot!lot_milieu)
    itmX.SubItems(3) = cLot!lot_pers
    itmX.SubItems(4) = cLot!lot_numlotprepare

    iNb = iNb + 1
    If iNb = 4 Then Exit Do
    cLot.MoveNext
  Loop
  cLot.CloseCurseur
  
  AjusteListView Me, lvDE
  
  bdcPers.SetFocus
  SetStatus
End Sub

Private Sub Form_Unload(Cancel As Integer)
  SetStatus
  MDISaisieLabo.AjusteMenus -1
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF2 Then
    KeyCode = 0
    btnValider_Click
  ElseIf KeyCode = vbKeyF3 Then
    KeyCode = 0
    btnInitialiser_Click
  End If
End Sub



Private Sub lvDE_DblClick()
  ModifierEnregistrement
End Sub

Private Sub ModifierEnregistrement()
  If Not bContrôleSélection Then Exit Sub
  
  InitialiseChamps
  
  Dim cLot As New BDCurseur
  cLot.OpenCurseur "select * from c_lotmilieu where lot_serie=" & lvDE.SelectedItem.Text
  If cLot.EOF Then
    cLot.CloseCurseur
    MsgBox "Lot non trouvé dans la base, prévenez la DI.", vbExclamation, App.Title
    Exit Sub
  End If
  
  RécupèreLot cLot
  cLot.CloseCurseur
End Sub

Private Sub RécupèreLot(cLot As BDCurseur)
  txtChamp(0) = cLot!lot_serie
  txtChamp(9) = Format(cLot!lot_dateheure, "dd/mm/yyyy hh:mm:ss")
  bdcPers = cLot!lot_pers
  bdcMilieu = sAbrégéMilieu(cLot!lot_milieu)
  txtChamp(1) = NV(cLot!lot_lotbase)
  cboFournisseur = NV(cLot!lot_fournisseur)
  txtChamp(6) = NV(cLot!lot_poidsbase)
  txtChamp(7) = NV(cLot!lot_volumeeau)
  bdcAppareil = NV(cLot!lot_autoprep)
  txtChamp(3) = NV(cLot!lot_valsteril)
  txtChamp(12) = NV(cLot!lot_numlotprepare)
  bdcConditionnement = NV(cLot!lot_condition)
  txtChamp(5) = Format(NV(cLot!lot_ph), "0.0")
  txtChamp(13) = NV(cLot!lot_dlu)
  txtChamp(4) = NV(cLot!lot_teststeril)
  txtChamp(8) = NV(cLot!lot_testfertil)
  txtChamp(2) = NV(cLot!timestamp)
End Sub

Private Sub SupprimerEnregistrement()
  If Not bContrôleSélection Then Exit Sub
  
  RunSQL "delete from c_lotmilieu where lot_serie=" & lvDE.SelectedItem.Text
  lvDE.ListItems.Remove lvDE.SelectedItem.Index
  Set lvDE.SelectedItem = Nothing ' Pas sur que ce soit nécessaire
End Sub

Private Function bContrôleSélection() As Boolean
  Dim bOk As Boolean
  
  If lvDE.SelectedItem Is Nothing Then
    bOk = False
  Else
    bOk = lvDE.SelectedItem.Selected
  End If
  
  If Not bOk Then MsgBox "Sélectionnez une ligne dans les derniers événements avant de cliquer sur ce bouton.", vbExclamation, App.Title
  bContrôleSélection = bOk
End Function


Private Sub bdcPers_GotFocus()
  SetStatus "Entrer le numéro de personne, ou sélectionner dans la liste (F4)"
End Sub

Private Sub bdcPers_LostFocus()
  bdcPers.Synchronise
End Sub

Private Sub bdcMilieu_GotFocus()
  SetStatus bdcMilieu.Tag
End Sub

Private Sub bdcMilieu_LostFocus()
  bdcMilieu.Synchronise
End Sub


Private Sub bdcAppareil_GotFocus()
  SetStatus bdcAppareil.Tag
End Sub

Private Sub bdcAppareil_LostFocus()
  bdcAppareil.Synchronise
End Sub


Private Sub bdcConditionnement_GotFocus()
  SetStatus bdcConditionnement.Tag
End Sub

Private Sub bdcConditionnement_LostFocus()
  bdcConditionnement.Synchronise
End Sub


Private Sub txtChamp_GotFocus(Index As Integer)
  SetStatus txtChamp(Index).Tag
  AutoSelect txtChamp(Index)
End Sub

Private Sub lvDE_GotFocus()
  SetStatus "Historique des derniers événements saisis sur ce poste"
End Sub

Private Sub btnValider_GotFocus()
  SetStatus "Enregistrer les données de l'événement"
End Sub

Private Sub btnInitialiser_GotFocus()
  SetStatus "Effacer les informations saisies à l'écran"
End Sub

Private Sub btnModifier_GotFocus()
  SetStatus "Rappeler les données de l'événement sélectionné"
End Sub

Private Sub btnSupprimer_GotFocus()
  SetStatus "Supprimer de la base les données de l'événement sélectionné"
End Sub

