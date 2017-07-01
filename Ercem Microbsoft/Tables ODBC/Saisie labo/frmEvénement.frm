VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmEvénement 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Enregistrement d'un événement par série"
   ClientHeight    =   7230
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
   Icon            =   "frmEvénement.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7230
   ScaleWidth      =   8190
   ShowInTaskbar   =   0   'False
   Begin MSComctlLib.ListView lvEvénements 
      Height          =   1635
      Left            =   1320
      TabIndex        =   34
      Top             =   60
      Width           =   5235
      _ExtentX        =   9234
      _ExtentY        =   2884
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      HideColumnHeaders=   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Evt"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Titre"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.CommandButton btnAvancé 
      Caption         =   "Avancé"
      Height          =   330
      Left            =   6660
      TabIndex        =   17
      Top             =   3180
      Width           =   1455
   End
   Begin VB.Timer timAutoInit 
      Enabled         =   0   'False
      Interval        =   30000
      Left            =   1200
      Top             =   3420
   End
   Begin VB.PictureBox picTiming 
      AutoRedraw      =   -1  'True
      Height          =   1395
      Left            =   4740
      ScaleHeight     =   1335
      ScaleWidth      =   3315
      TabIndex        =   31
      Top             =   2820
      Width           =   3375
      Begin VB.Label lblInfoSS 
         Caption         =   "InfoSS"
         Height          =   675
         Left            =   60
         TabIndex        =   32
         Top             =   660
         Width           =   3195
      End
   End
   Begin VB.TextBox txtNumSS 
      Height          =   315
      Left            =   1320
      TabIndex        =   13
      Tag             =   "N° de supersérie à laquelle sera rattachée la série"
      Top             =   2820
      Width           =   1155
   End
   Begin VB.Frame Frame1 
      Caption         =   "Derniers enre&gistrements"
      Height          =   2955
      Left            =   60
      TabIndex        =   25
      Top             =   4260
      Width           =   8055
      Begin VB.CommandButton btnEvénementsDeSérie 
         Caption         =   "Événements &de la série"
         Height          =   375
         Left            =   5520
         TabIndex        =   33
         Top             =   2460
         Width           =   2415
      End
      Begin VB.CommandButton btnModifier 
         Caption         =   "&Modifier"
         Height          =   375
         Left            =   120
         TabIndex        =   27
         Top             =   2460
         Width           =   1455
      End
      Begin VB.CommandButton btnSupprimer 
         Caption         =   "&Supprimer"
         Height          =   375
         Left            =   1740
         TabIndex        =   28
         Top             =   2460
         Width           =   1455
      End
      Begin MSComctlLib.ListView lvDE 
         Height          =   2145
         Left            =   120
         TabIndex        =   26
         Top             =   240
         Width           =   7815
         _ExtentX        =   13785
         _ExtentY        =   3784
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         Appearance      =   1
         NumItems        =   8
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
            Text            =   "FSE"
            Object.Width           =   1411
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Pers"
            Object.Width           =   582
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "Evt"
            Object.Width           =   423
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Text            =   "Info1"
            Object.Width           =   1235
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Text            =   "Info2"
            Object.Width           =   1235
         EndProperty
         BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   7
            Text            =   "Info3"
            Object.Width           =   1235
         EndProperty
      End
   End
   Begin VB.TextBox txtDateHeure 
      Height          =   315
      Left            =   5820
      TabIndex        =   3
      Top             =   1740
      Width           =   2295
   End
   Begin VB.TextBox txtNumEvénement 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1320
      Locked          =   -1  'True
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   1740
      Width           =   1215
   End
   Begin VB.CheckBox chkConserver 
      Caption         =   "Conserver"
      Height          =   210
      Index           =   2
      Left            =   4800
      TabIndex        =   21
      Top             =   3600
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.CheckBox chkConserver 
      Caption         =   "Conserver"
      Height          =   210
      Index           =   3
      Left            =   4800
      TabIndex        =   24
      Top             =   3960
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.CheckBox chkConserver 
      Caption         =   "Conserver"
      Height          =   210
      Index           =   1
      Left            =   4800
      TabIndex        =   18
      Top             =   3240
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.CommandButton btnInitialiser 
      Caption         =   "Initialiser (F3)"
      Height          =   375
      Left            =   6660
      TabIndex        =   30
      Top             =   540
      Width           =   1455
   End
   Begin VB.CommandButton btnValider 
      Caption         =   "Valider (F2)"
      Height          =   375
      Left            =   6660
      TabIndex        =   29
      Top             =   60
      Width           =   1455
   End
   Begin VB.TextBox txtInfo 
      DataField       =   "evt_info1"
      Height          =   315
      Index           =   1
      Left            =   1320
      MaxLength       =   20
      TabIndex        =   16
      Tag             =   "Info complémentaire"
      Top             =   3180
      Width           =   2715
   End
   Begin VB.TextBox txtInfo 
      DataField       =   "evt_info2"
      Height          =   315
      Index           =   2
      Left            =   1320
      MaxLength       =   10
      TabIndex        =   20
      Tag             =   "Info complémentaire"
      Top             =   3540
      Width           =   2715
   End
   Begin VB.TextBox txtInfo 
      DataField       =   "evt_info3"
      Height          =   315
      Index           =   3
      Left            =   1320
      TabIndex        =   23
      Tag             =   "Info complémentaire"
      Top             =   3900
      Width           =   2715
   End
   Begin VB.TextBox txtSérieLabo 
      Height          =   315
      Left            =   5820
      TabIndex        =   8
      Top             =   2100
      Width           =   2295
   End
   Begin VB.TextBox txtCB 
      Height          =   315
      Left            =   1320
      TabIndex        =   5
      Top             =   2100
      Width           =   2295
   End
   Begin SaisieLabo.BDCombo bdcPers 
      Height          =   330
      Left            =   1320
      TabIndex        =   10
      Tag             =   "Code personne ayant signalé l'événement"
      Top             =   2460
      Width           =   3735
      _ExtentX        =   6588
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
      DataField       =   "*evt_pers"
   End
   Begin SaisieLabo.BDCombo bdcMilieu 
      Height          =   330
      Left            =   1320
      TabIndex        =   12
      Tag             =   "Code personne ayant signalé l'événement"
      Top             =   2820
      Width           =   3735
      _ExtentX        =   6588
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
      DataField       =   "*evt_pers"
   End
   Begin MSComctlLib.ImageList ilEvénement 
      Left            =   1140
      Top             =   2700
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   6
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEvénement.frx":0442
            Key             =   "H1"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEvénement.frx":061C
            Key             =   "H2"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEvénement.frx":07F6
            Key             =   "H'2"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEvénement.frx":09D0
            Key             =   "H3"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEvénement.frx":0BAA
            Key             =   "H'3"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEvénement.frx":0D84
            Key             =   "H4"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvEtuves 
      Height          =   1035
      Left            =   4080
      TabIndex        =   14
      Top             =   3180
      Visible         =   0   'False
      Width           =   4035
      _ExtentX        =   7117
      _ExtentY        =   1826
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "No"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Germe"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "DI"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Remarques"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Label lblMilieu 
      AutoSize        =   -1  'True
      Caption         =   "&Milieu :"
      Height          =   210
      Left            =   60
      TabIndex        =   11
      Top             =   2880
      Width           =   660
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Date heure :"
      Height          =   210
      Index           =   4
      Left            =   4560
      TabIndex        =   2
      Top             =   1800
      Width           =   1200
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Serial :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   0
      Top             =   1800
      Width           =   660
   End
   Begin VB.Label lblInfo 
      AutoSize        =   -1  'True
      Caption         =   "Info &1 :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   15
      Top             =   3240
      Width           =   690
   End
   Begin VB.Label lblInfo 
      AutoSize        =   -1  'True
      Caption         =   "Info &2 :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   19
      Top             =   3600
      Width           =   690
   End
   Begin VB.Label lblInfo 
      AutoSize        =   -1  'True
      Caption         =   "Info &3 :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   22
      Top             =   3960
      Width           =   690
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Événement :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   6
      Top             =   120
      Width           =   1200
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "&Personne :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   9
      Top             =   2520
      Width           =   1035
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Série / &FSE  :"
      Height          =   210
      Index           =   3
      Left            =   4560
      TabIndex        =   7
      Top             =   2160
      Width           =   1215
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "&Code barre :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   4
      Top             =   2160
      Width           =   1200
   End
End
Attribute VB_Name = "frmEvénement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmEvénement
' Enregistrement des événements FSE
' 14/04/1998 PV
' 06/07/1998 PV Contrôle des doublons (plus d'index unique)
' 27/07/1998 PV On vérifie que le lot de gélose est rempli
' 02/09/1998 PV N° de supersérie avec l'événement H2 (eDébutRM)
' 06/04/1999 PV Champ evt_ts
' 14/04/1999 PV Gestion généralisée des événements; liste des étuves


Option Explicit

Dim sNomEvt As String

Private timLastKey As Single      ' Heure du dernier événement clavier

Public Sub SetMode(sEvénement As String)
  bSetMode sEvénement
End Sub

Public Function bSetMode(sEvénement As String) As Boolean

  ' Tous les événements ne sont théoriquement pas modifiables (ex: H0)
  On Error Resume Next
  Set lvEvénements.SelectedItem = lvEvénements.ListItems(sEvénement)
  If Err Then
    MsgBox "Cet événement ne peut pas être modifié par ce programme.", vbExclamation, App.Title
    If Not bShiftPressed Then
      bSetMode = False
      Exit Function
    End If
    Dim l As ListItem
    For Each l In lvEvénements.ListItems
      l.Selected = False
    Next
  End If
  On Error GoTo 0
  
  sNomEvt = sEvénement
  
  InitialiseChamps True       ' provoque l'exécution de form_load
  Select Case sNomEvt
    Case "H1":
      lblInfo(1) = "&Balance :"
      lblInfo(2) = "&N° lot EPT :"
      lblInfo(3) = "Info &3 :"
      chkConserver(1) = vbUnchecked
      chkConserver(2) = vbChecked
      chkConserver(3) = vbUnchecked
      lvDE.ColumnHeaders(6).Text = "Bal"
      lvDE.ColumnHeaders(7).Text = "EPT"
      lvDE.ColumnHeaders(8).Text = "Info3"
      txtInfo(1).Tag = "Entrer le n° de balance"
      txtInfo(2).Tag = "Entrer le n° de lot d'eau peptonée tamponée"
      txtInfo(3).Tag = "Champ supplémentaire 3 libre"
      bdcMilieu.Clear
      bdcMilieu.AddItem "EPT", "Eau peptonée tamponée"
      bdcMilieu.Text = "EPT"
      BDActiveChamp bdcMilieu, False
      
    Case "H2", "H'2":
      lblInfo(1) = IIf(sNomEvt = "H2", "Info &1 :", "&N° lot TS :")
      lblInfo(2) = IIf(sNomEvt = "H2", "Info &2 :", "Milieu &2")
      lblInfo(3) = IIf(sNomEvt = "H2", "Info &3 :", "Milieu &3")
      chkConserver(1) = vbChecked
      chkConserver(2) = vbUnchecked
      chkConserver(3) = vbUnchecked
      lvDE.ColumnHeaders(6).Text = IIf(sNomEvt = "H2", "Info1", "TS")
      lvDE.ColumnHeaders(7).Text = "Info2"
      lvDE.ColumnHeaders(8).Text = "Info3"
      txtInfo(1).Tag = IIf(sNomEvt = "H2", "Champ supplémentaire 1 libre", "Entrer le n° de lot de typtone sel")
      txtInfo(2).Tag = IIf(sNomEvt = "H2", "Champ supplémentaire 2 libre", "N° de lot du 2ème milieu utilisé (après TS)")
      txtInfo(3).Tag = IIf(sNomEvt = "H2", "Champ supplémentaire 3 libre", "N° de lot du 3ème milieu utilisé (après TS)")
      bdcMilieu.Clear
      If sNomEvt = "H'2" Then
        bdcMilieu.AddItem "TS", "Tryptone Sel"
        bdcMilieu.Text = "TS"
      Else
        bdcMilieu = "(Pas d'information de milieu)"
      End If
      BDActiveChamp bdcMilieu, False
    
    Case "H3":
      lblInfo(1) = "&N° lot :"
      lblInfo(2) = "Info &2 :"
      lblInfo(3) = "Info &3 :"
      chkConserver(1) = vbUnchecked
      chkConserver(2) = vbUnchecked
      chkConserver(3) = vbUnchecked
      lvDE.ColumnHeaders(6).Text = "LotMil"
      lvDE.ColumnHeaders(7).Text = "Info2"
      lvDE.ColumnHeaders(8).Text = "Info3"
      txtInfo(1).Tag = "Entrer le n° de lot de milieu utilisé"
      txtInfo(2).Tag = "Champ supplémentaire 2 libre"
      txtInfo(3).Tag = "Champ supplémentaire 3 libre"
      RemplitComboMilieux bdcMilieu, 0
      BDActiveChamp bdcMilieu, True

    Case "H'3":
      lblInfo(1) = "Info &1 :"
      lblInfo(2) = "Info &2 :"
      lblInfo(3) = "Info &3 :"
      chkConserver(1) = vbUnchecked
      chkConserver(2) = vbUnchecked
      chkConserver(3) = vbUnchecked
      lvDE.ColumnHeaders(6).Text = "Info1"
      lvDE.ColumnHeaders(7).Text = "Info2"
      lvDE.ColumnHeaders(8).Text = "Info3"
      txtInfo(1).Tag = "Champ supplémentaire 1 libre"
      txtInfo(2).Tag = "Champ supplémentaire 2 libre"
      txtInfo(3).Tag = "Champ supplémentaire 3 libre"
      RemplitComboMilieux bdcMilieu, 0
      BDActiveChamp bdcMilieu, True

    Case "H4":
      lblInfo(1) = "Étuve :"
      lblInfo(2) = "Info &2 :"
      lblInfo(3) = "Info &3 :"
      chkConserver(1) = vbUnchecked
      chkConserver(2) = vbUnchecked
      chkConserver(3) = vbUnchecked
      lvDE.ColumnHeaders(6).Text = "Étuve"
      lvDE.ColumnHeaders(7).Text = "Info2"
      lvDE.ColumnHeaders(8).Text = "Info3"
      txtInfo(1).Tag = "N° d'étuve dans laquelle sont rangées les boîtes / Durée d'incubation en heures"
      txtInfo(2).Tag = "Champ supplémentaire 2 libre"
      txtInfo(3).Tag = "Champ supplémentaire 3 libre"
      RemplitComboMilieux bdcMilieu, 0
      BDActiveChamp bdcMilieu, True

    Case Else:
      lblInfo(1) = "Info &1 :"
      lblInfo(2) = "Info &2 :"
      lblInfo(3) = "Info &3 :"
      chkConserver(1) = vbUnchecked
      chkConserver(2) = vbUnchecked
      chkConserver(3) = vbUnchecked
      lvDE.ColumnHeaders(6).Text = "Info1"
      lvDE.ColumnHeaders(7).Text = "Info2"
      lvDE.ColumnHeaders(8).Text = "Info3"
      txtInfo(1).Tag = "Champ supplémentaire 1 libre"
      txtInfo(2).Tag = "Champ supplémentaire 2 libre"
      txtInfo(3).Tag = "Champ supplémentaire 3 libre"
      If colCatEvénements(sNomEvt).cev_dependmilieu Then
        Select Case sNomEvt
          Case "H12", "H13", "H14", "H15":
            RemplitComboMilieux bdcMilieu, 2
          Case Else:
            RemplitComboMilieux bdcMilieu, 0
        End Select
        BDActiveChamp bdcMilieu, True
      Else
        bdcMilieu.Clear
        BDActiveChamp bdcMilieu, False
      End If
  End Select
  
  lblMilieu = IIf(sNomEvt = "H2", "&Supersérie :", "&Milieu :")
  bdcMilieu.Visible = sNomEvt <> "H2"
  txtNumSS.Visible = sNomEvt = "H2"
  btnAvancé.Caption = IIf(sNomEvt = "H1", "Ba&lances…", "&Etuves…")
  btnAvancé.Visible = sNomEvt = "H1" Or sNomEvt = "H4"
  lvEtuves.Visible = False
  picTiming.Visible = sNomEvt = "H2"
  timAutoInit.Enabled = sNomEvt = "H2"
  bSetMode = True
End Function


Private Sub InitialiseChamps(Optional bTousLesChamps As Boolean)
  BDActiveChamp txtDateHeure, False
  txtNumEvénement = ""
  txtDateHeure = ""
  txtCB = ""
  txtSérieLabo = ""
  bdcPers = ""
  If Not bdcMilieu.Locked Then bdcMilieu = ""
  If bTousLesChamps Or chkConserver(1) = vbUnchecked Then txtInfo(1) = ""
  If bTousLesChamps Or chkConserver(2) = vbUnchecked Then txtInfo(2) = ""
  If bTousLesChamps Or chkConserver(3) = vbUnchecked Then txtInfo(3) = ""
  txtCB.SetFocus
  If sNomEvt = "H2" Then
    SetNoSSDéfaut txtNumSS
    DessineTiming picTiming, lblInfoSS
    timLastKey = Timer
  End If
  btnAvancé.Visible = sNomEvt = "H1" Or sNomEvt = "H4"
  lvEtuves.Visible = False
End Sub


Private Sub bdcMilieu1_Change()
  lvEtuves.Visible = False
  btnAvancé.Visible = True
End Sub

Private Sub bdcMilieu1_Click()
  lvEtuves.Visible = False
  btnAvancé.Visible = True
End Sub

Private Sub bdcMilieu_Change()
  bdcMilieu_Click
End Sub

Private Sub bdcMilieu_Click()
  If sNomEvt = "H4" Then
    lvEtuves.Visible = False
    btnAvancé.Visible = True
    If StrComp(bdcMilieu, "VRBL", vbTextCompare) = 0 Then
      lblInfo(1) = "Étuve C30:"
      lblInfo(2) = "Étuve CTH:"
      txtInfo(1).Tag = "N° d'étuve dans laquelle sont rangées les boîtes de C30"
      txtInfo(2).Tag = "N° d'étuve dans laquelle sont rangées les boîtes de CTH"
    Else
      lblInfo(1) = "N° étuve:"
      lblInfo(2) = "Info &2:"
      txtInfo(1).Tag = "N° d'étuve dans laquelle sont rangées les boîtes"
      txtInfo(2).Tag = "Info complémentaire 2"
    End If
  End If
End Sub


Private Sub lvEtuves_Click()
  If Not (lvEtuves.SelectedItem Is Nothing) Then
    If lvEtuves.SelectedItem.SubItems(1) = "CTH" Then
      txtInfo(2) = lvEtuves.SelectedItem.Text
    Else
      txtInfo(1) = lvEtuves.SelectedItem.Text
    End If
  End If
End Sub

Private Sub btnAvancé_Click()
  If sNomEvt = "H1" Then
    frmBalances.Show vbModal
  Else
    ' Vérification du n° de série
    If Not bOkSérie Then Exit Sub
    
    bdcMilieu.Synchronise
    If bdcMilieu.ListIndex < 0 Then
      MsgBox "Vous devez choisir le milieu avant d'afficher la liste des étuves possibles.", vbExclamation, App.Title
      Exit Sub
    End If
    
    Dim iMilieu As Integer, iSS
    iMilieu = iIndiceMilieu(bdcMilieu)
    iSS = BDCurseurExpress("select ser_superserie from c_serielabo where ser_numserie=" & txtSérieLabo)
    If IsEmpty(iSS) Or IsNull(iSS) Then
      MsgBox "L'événement H2 doit être enregistré afin d'attribuer un n° de supersérie avant d'afficher la liste des étuves possibles.", vbExclamation, App.Title
      Exit Sub
    End If
 
    EtuvesDispo Me, lvEtuves, btnAvancé, iMilieu, iSS
  End If
End Sub

Private Sub btnInitialiser_Click()
  InitialiseChamps
End Sub

Private Sub btnModifier_Click()
  ModifierEnregistrement
End Sub

Private Sub btnSupprimer_Click()
  SupprimerEnregistrement
End Sub

Private Sub btnEvénementsDeSérie_Click()
  ' Vérification du n° de FSE
  If Not bOkSérie Then Exit Sub
  
  lvDE.ListItems.Clear
  Dim cEvt As New BDCurseur, iNb As Integer
  cEvt.OpenCurseur "select * from c_evenement where evt_serielabo=" & sFormToSQL(txtSérieLabo, BDTypeINTEGER) & " order by evt_ts"
  Do
    If cEvt.EOF Then Exit Do
    
    Dim s As String
    s = cEvt!evt_evenement
    If s = "H3" Or s = "H'3" Or s = "H4" Or s = "H5" Or s = "H6" Then s = s & "." & sAbrégéMilieu(cEvt!evt_milieu)

    Dim itmX As ListItem
    Set itmX = lvDE.ListItems.Add
    itmX.Text = cEvt!evt_serie
    itmX.SubItems(1) = Format(cEvt!evt_ts, "dd/mm hh:mm")
    itmX.SubItems(2) = cEvt!evt_serielabo
    itmX.SubItems(3) = cEvt!evt_pers
    itmX.SubItems(4) = s
    itmX.SubItems(5) = NV(cEvt!evt_info1)
    itmX.SubItems(6) = NV(cEvt!evt_info2)
    itmX.SubItems(7) = NV(cEvt!evt_info3)

    iNb = iNb + 1
    'If iNb = 4 Then Exit Do
    cEvt.MoveNext
  Loop
  cEvt.CloseCurseur
  
  ' On ajuste la taille des colonnes
  AjusteListView Me, lvDE

End Sub

Private Function bOkSérie() As Boolean
  bOkSérie = False
  If txtSérieLabo = "" Then
    MsgBox "Entrez un n° de FSE/Série.", vbExclamation, App.Title
    txtSérieLabo.SetFocus
    Exit Function
  End If
  If Not IsNumeric(txtSérieLabo) Then
    MsgBox "Le n° de FSE/Série est invalide.", vbExclamation, App.Title
    txtSérieLabo.SetFocus
    Exit Function
  End If
  Dim d
  d = BDCurseurExpress("select min(ser_dh) from c_serielabo where ser_numserie=" & txtSérieLabo)
  If IsEmpty(d) Or IsNull(d) Then
    MsgBox "N° de série inexistant.", vbExclamation, App.Title
    If Not bShiftPressed Then Exit Function
  ElseIf Int(d) <> Today Then
    Select Case sNomEvt
      Case "H1", "H2", "H'2", "H3", "H'3", "H4", "H11"
        MsgBox "Ancienne série." & vbCrLf & "Cette série a été enregistrée le " & Format(d, "dddd d mmmm yyyy") & ", vous ne pouvez pas enregistrer un événement aujourd'hui.", vbExclamation, App.Title
        If Not bShiftPressed Then Exit Function
    End Select
  End If
  bOkSérie = True
End Function

Private Sub btnValider_Click()
  Dim i As Integer          ' fourre-tout
  Dim iMilieu As Integer    ' Milieu sélectionné, ou 0
  
  ' Si le formulaire est vide, on dégage silencieusement
  If txtSérieLabo = "" And bdcPers = "" And bdcMilieu = "" And txtNumSS = "" Then Exit Sub
  
  ' Vérification du n° de FSE
  If Not bOkSérie Then Exit Sub
  
  ' Vérification éventuelle du n° de supersérie
  If sNomEvt = "H2" Then
    If Not bCheckNoSS(txtNumSS) Then Exit Sub
  End If
  
  ' On contrôle tout de suite le milieu, on en a besoin pour lire l'événement précédent
  If colCatEvénements(sNomEvt).cev_dependmilieu Then
    If bdcMilieu = "" Then
      MsgBox "Le milieu est obligatoire pour cet événement.", vbExclamation, App.Title
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
  Else
    iMilieu = 0
  End If
  
  
  ' Contrôle de date et d'heure
  If txtDateHeure <> "" Then
    If Not IsDate(txtDateHeure) Then
      MsgBox "Date et heure d'événement incorrecte !"
      Exit Sub
    End If
  Else
    txtDateHeure = Format(Now, "dd/mm/yyyy hh:mm:ss")
  End If
  
  ' On vérifie l'ordre des événements
  Dim sEvtPrécédent As String
  Dim iPersPrécédent As Variant   ' Peut contenir empty
  Dim tsPrécédent As Date
  Select Case sNomEvt
    Case "H1":     sEvtPrécédent = "H0"
    Case "H2":     sEvtPrécédent = "H1"
    Case "H'2":    sEvtPrécédent = "H2"
    Case "H3":     sEvtPrécédent = "H'2"
    Case "H'3":    sEvtPrécédent = "H3"
    Case "H4":     sEvtPrécédent = "H'3"
    Case "H5":     sEvtPrécédent = "H4"
    
    Case "H11":    sEvtPrécédent = "H0"
    Case "H12":    sEvtPrécédent = "H11"
    Case "H13":    sEvtPrécédent = "H12"
    Case "H14":    sEvtPrécédent = "H13"
    Case "H15":    sEvtPrécédent = "H14"

    Case Else:     sEvtPrécédent = ""
  End Select
  
  If sEvtPrécédent <> "" Then
    Dim sSQL As String
    sSQL = "select evt_pers,evt_ts from c_evenement where evt_serielabo=" & sFormToSQL(txtSérieLabo, BDTypeINTEGER) & " and evt_evenement=" & Chr(34) & sEvtPrécédent & Chr(34)
    If colCatEvénements(sEvtPrécédent).cev_dependmilieu Then sSQL = sSQL & " and evt_milieu=" & iMilieu
    Dim cPrec As New BDCurseur
    cPrec.OpenCurseur sSQL
    If Not cPrec.EOF Then
      iPersPrécédent = cPrec!evt_pers
      tsPrécédent = cPrec!evt_ts
    End If
    cPrec.CloseCurseur
    
    Dim sMsg As String
    If IsEmpty(iPersPrécédent) Then
      sMsg = "Avertissement: L'événement " & sEvtPrécédent
      If colCatEvénements(sNomEvt).cev_dependmilieu Then sMsg = sMsg & "." & sAbrégéMilieu(iMilieu)
      If vbNo = MsgBox(sMsg & " n'a pas été enregistré pour cette série." & vbCrLf & "Vérifiez qu'il n'y a pas d'erreur." & vbCrLf & vbCrLf & "Voulez-vous enregistrer ?", vbQuestion + vbYesNo, App.Title) Then
        Exit Sub
      End If
    Else
      If CDate(txtDateHeure) < tsPrécédent Then
        sMsg = "L'événement précédent " & sEvtPrécédent
        If colCatEvénements(sNomEvt).cev_dependmilieu Then sMsg = sMsg & "." & sAbrégéMilieu(iMilieu)
        sMsg = sMsg & " a été enregistré à " & Format(tsPrécédent, "hh:mm:ss") & "." & vbCrLf & vbCrLf & "Vous ne pouvez pas enregistrer l'événement actuel à " & Format(CDate(txtDateHeure), "hh:mm:ss") & "."
        MsgBox sMsg, vbExclamation, App.Title
        If Not bShiftPressed Then Exit Sub
      End If
    End If
  End If


  ' Si le n° de personne n'est pas précisé, on le récupère en priorité
  ' de l'événement précedent, sinon on le prend de la FSE
  If bdcPers = "" Then
    Dim iPers As Integer
    If Not IsEmpty(iPersPrécédent) Then
      iPers = iPersPrécédent
    Else
      iPers = iPersonneDeFSE
      If iPers < 0 Then
        MsgBox "N° de FSE/Série incorrect, inexistant ou trop ancien (recherche du n° de personne à partir du n° de série).", vbExclamation, App.Title
        txtSérieLabo.SetFocus
        Exit Sub
      End If
    End If
    bdcPers = iPers
  End If

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
  
  ' On vérifie les champs d'info, spécifiques à l'événement
  Select Case sNomEvt
    Case "H1":
      If txtInfo(1) <> UCase(txtInfo(1)) Then txtInfo(1) = UCase(txtInfo(1))
      If Left(txtInfo(1), 2) <> "LM" Then
        MsgBox "Le n° de balance est incorrect (doit être de la forme LMxxx).", vbExclamation, App.Title
        txtInfo(1).SetFocus
        Exit Sub
      End If
      
      If txtInfo(2) = "" Then
        MsgBox "Le n° de lot d'eau peptonée tamponée est obligatoire.", vbExclamation, App.Title
        txtInfo(2).SetFocus
        Exit Sub
      End If
    
    Case "H'2":
      If txtInfo(1) = "" Then
        MsgBox "Le n° de lot de tryptone sel est obligatoire.", vbExclamation, App.Title
        txtInfo(1).SetFocus
        Exit Sub
      End If
      
      If txtInfo(1) <> UCase(txtInfo(1)) Then txtInfo(1) = UCase(txtInfo(1))
      If Left(txtInfo(1), 3) = "TS:" Then txtInfo(1) = Mid(txtInfo(1), 4)
    
    Case "H3":
      If txtInfo(1) = "" And bdcMilieu <> "PM" Then
        MsgBox "Le n° de lot de milieu est obligatoire.", vbExclamation, App.Title
        txtInfo(1).SetFocus
        Exit Sub
      End If
      
    Case "H4":
      If Not bContrôleEtuve(txtInfo(1)) Then
        txtInfo(1).SetFocus
        Exit Sub
      End If
      If txtInfo(2) <> "" Then
        If Not bContrôleEtuve(txtInfo(2)) Then
          txtInfo(2).SetFocus
          Exit Sub
        End If
      End If
      
  End Select
  
  ' On vérifie les doublons (même série / même evénement / même milieu)
  ' si on n'est pas en train de faire une modif
  If txtNumEvénement = "" Then
    Dim bDoublon As Boolean
    sSQL = "select count(*) from c_evenement where evt_serielabo=" & sFormToSQL(txtSérieLabo, BDTypeINTEGER) & " and evt_evenement=" & Chr(34) & sNomEvt & Chr(34)
    If colCatEvénements(sNomEvt).cev_dependmilieu Then sSQL = sSQL & " and evt_milieu=" & iMilieu
    bDoublon = BDCurseurExpress(sSQL) > 0
    If bDoublon Then
      Dim sMessage As String
      If sNomEvt = "H3" Or sNomEvt = "H4" Then
        sMessage = "Cet événement a déja été enregistré pour cette série et ce milieu."
      Else
        sMessage = "Cet événement a déja été enregistré pour cette série."
      End If
      MsgBox sMessage, vbExclamation, App.Title
      Exit Sub
    End If
  End If
  
  ' Tout est Ok !
  Screen.MousePointer = vbHourglass
  SetStatus "Enregistrement de l'événement…"
  
  ' Mise à jour éventuelle du n° de supersérie
  If sNomEvt = "H2" Then RattacheSérie CLng(txtSérieLabo), CInt(txtNumSS)
  
  ' Création de l'enregistrement
  Dim cEvt As New BDCurseur
  If txtNumEvénement = "" Then
    cEvt.OpenCurseur "select * from c_evenement where evt_serie=0"
    cEvt.AddNew
  Else
    cEvt.OpenCurseur "select * from c_evenement where evt_serie=" & txtNumEvénement
    cEvt.Edit
  End If
  
  cEvt!evt_date = Today
  cEvt!evt_evenement = sNomEvt
  cEvt!evt_milieu = iMilieu
  cEvt!evt_pers = bdcPers
  cEvt!evt_serielabo = CLng(txtSérieLabo)
  cEvt!evt_info1 = txtInfo(1)
  cEvt!evt_info2 = txtInfo(2)
  cEvt!evt_info3 = txtInfo(3)
  cEvt!evt_ts = CDate(txtDateHeure)
  cEvt!timestamp = BDTime
  
  On Error Resume Next
  cEvt.Update
  If Err Then
    MsgBox "Échec lors de la validation des données. L'événement a peut-être déjà été enregistré pour cette série." & vbCrLf & vbCrLf & "Erreur " & Err.Number & ": " & Err.Source & ": " & sAjusteMessageODBC(Err.Description), vbExclamation, App.Title
    Screen.MousePointer = vbDefault
    SetStatus
    Exit Sub
  End If
  On Error GoTo 0
  
  cEvt.CloseCurseur
  
  SetStatus "Lecture du n° d'événement…"
  Dim iMax As Long
  If txtNumEvénement = "" Then
    ' triche: pour récupérer un sérial, on lit le max…
    iMax = BDCurseurExpress("select max(evt_serie) from c_evenement")
  Else
    iMax = CLng(txtNumEvénement)
    ' On efface l'ancien événement de l'historique
    For i = 1 To lvDE.ListItems.Count
      If lvDE.ListItems(i).Text = iMax Then lvDE.ListItems.Remove i: Exit For
    Next
  End If
  
  ' Ajout de l'événement en tête la liste d'historique
  Dim s As String
  s = sNomEvt
  If colCatEvénements(sNomEvt).cev_dependmilieu Then s = s & "." & bdcMilieu
  
  Dim itmX As ListItem
  Set itmX = lvDE.ListItems.Add(1)
  itmX.Text = iMax
  itmX.SubItems(1) = Format(CDate(txtDateHeure), "dd/mm hh:mm")
  itmX.SubItems(2) = txtSérieLabo
  itmX.SubItems(3) = bdcPers.Text
  itmX.SubItems(4) = s
  itmX.SubItems(5) = txtInfo(1)
  itmX.SubItems(6) = txtInfo(2)
  itmX.SubItems(7) = txtInfo(3)
  Do While lvDE.ListItems.Count > 49
    lvDE.ListItems.Remove 50
  Loop
  Set lvDE.SelectedItem = itmX
  
  ' On ajuste la taille des colonnes
  AjusteListView Me, lvDE

  ' On efface les champs
  InitialiseChamps

  ' Par sécurité, on ferme la fenêtre des superséries si elle est ouverte
  On Error Resume Next
  Unload frmSuperSérie
  On Error GoTo 0

  ' Réinitialisation du chien de garde d'inactivité
  RAZTimerInactif
  
  Screen.MousePointer = vbDefault
  SetStatus
End Sub

'=================================================================================
' Fonctions de service

Private Sub AjouteEvénement(ByVal sCode As String)
  Dim itmX As ListItem
  Set itmX = lvEvénements.ListItems.Add(, sCode, sCode)
  itmX.SubItems(1) = colCatEvénements(sCode).cev_libelle
End Sub

Private Sub Form_Load()
  Show
  SetStatus "Chargement en cours, patientez…"
  
  ' Chargement des combos
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcPers.AddItem u.uti_numuti, u.uti_nom
  Next
  
  AjouteEvénement "H1"
  AjouteEvénement "H2"
  AjouteEvénement "H'2"
  AjouteEvénement "H3"
  AjouteEvénement "H'3"
  AjouteEvénement "H4"
  AjouteEvénement "H5"
  AjouteEvénement "H11"
  AjouteEvénement "H12"
  AjouteEvénement "H13"
  AjouteEvénement "H14"
  AjouteEvénement "H15"
  AjusteListView Me, lvEvénements
  
  AjusteListView Me, lvDE
  
  SetStatus
End Sub

Private Sub Form_Unload(Cancel As Integer)
  SetStatus
  MDISaisieLabo.AjusteMenus -1
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  timLastKey = Timer
  
  If KeyCode = vbKeyF2 Then
    KeyCode = 0
    btnValider_Click
  ElseIf KeyCode = vbKeyF3 Then
    KeyCode = 0
    btnInitialiser_Click
  End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
' Décodage général des codes barres
  
  Dim sRefEch As String ' référence de l'échantillon

  ' Caractère % d'intro envoyé par le lecteur
  If KeyAscii = &H25 Then   ' &h25 = caractère pourcent %
    txtCB = ""
    txtCB.SetFocus
    KeyAscii = 0
    Exit Sub
  End If
  
  If KeyAscii = 13 And ActiveControl Is txtCB Then
    Select Case UCase(Left(txtCB, 1))
      Case "K"    ' Simulation clavier
        Dim sCmd As String
        sCmd = Subst(Mid(txtCB, 2), "$", "%")   ' %=préfixe Alt dans sendkeys, mais utilisé en préfixe CB…
        On Error Resume Next
        SendKeys sCmd
        On Error GoTo 0
        txtCB = ""
      
      Case "F":   ' FSE
        txtSérieLabo = CLng(Mid(txtCB, 3))
        PersonneDeFSE
        txtCB = ""
        txtInfo(1).SetFocus
        
      Case "U":   ' Utilisateur
        bdcPers = Mid(txtCB, 2)
        txtCB = ""
        txtInfo(1).SetFocus
      
      Case "B":   ' Balance
        If sNomEvt = "H1" Then
          txtInfo(1) = Mid(txtCB, 2)
          txtCB = ""
          btnValider.SetFocus
        Else
          MsgBox "Un n° de balance n'est valide qu'en fin de PSM.", vbExclamation, App.Title
        End If
        
      Case Else:  ' Ancienne méthode, détection à la longueur
        If Len(Me.txtCB) = 10 And IsNumeric(txtCB) Then
          txtSérieLabo = Me.txtCB
          PersonneDeFSE
          Me.txtCB = ""
          txtInfo(1).SetFocus
        ElseIf Len(txtCB) = 18 And IsNumeric(txtCB) Then
          SérieDeEchantillon
        Else
          If Me.txtCB <> "" Then MsgBox "Code barre [" & Me.txtCB & "] invalide !", _
              vbCritical + vbOKOnly, App.Title
          Me.txtCB = ""
        End If
      
    End Select
    KeyAscii = 0
  End If
End Sub




' Recherche un code personne à partir d'un n° de FSE
Private Function iPersonneDeFSE() As Integer
  iPersonneDeFSE = -1
  If Len(txtSérieLabo) < 5 Then Exit Function
  If Not IsNumeric(txtSérieLabo) Then Exit Function
  
  Dim iRes
  iRes = BDCurseurExpress("select ser_numtech from c_serielabo where ser_numserie=" & CLng(txtSérieLabo))
  If Not IsEmpty(iRes) Then iPersonneDeFSE = CInt(iRes)
End Function

Private Sub PersonneDeFSE()
  SetStatus "Recherche de la série…"
  Screen.MousePointer = vbHourglass
  Dim iPers As Integer
  iPers = iPersonneDeFSE
  If iPers > 0 Then bdcPers = iPers
  SetStatus
  Screen.MousePointer = vbDefault
End Sub

Private Sub SérieDeEchantillon()
' Recherche un code de série à partir d'un n° d'échantillon
' PC 21/11/2001 : contrôle code barre avec fonction bDecodeCB_FP

  Dim sRefEch As String
  Dim iSérie As Variant
  Dim c As New BDCurseur
  Dim sMbMsg As String  ' message d'une boite de message
  Dim sReqSql As String ' Requête SQL
  
' sRefEch = sDécodeCBFP(txtCB)
  If bDecodeCB_FP(Me.txtCB, sRefEch) Then
    sReqSql = "select lct_numserie,lct_codetech from c_labcrat where lct_ref='" & sRefEch & "'"
    c.OpenCurseur sReqSql
    If c.EOF Then
      sMbMsg = "Impossible de déterminer le n° de série à partir du n° d'échantillon. " & vbCrLf & _
        "(Échantillon [" & sRefEch & "] trop ancien ou non affecté à une série)"
      MsgBox sMbMsg, vbExclamation, App.Title
      iSérie = 0
    Else
      txtSérieLabo = c("lct_numserie")
      bdcPers = c("lct_codetech")
    End If
    Me.txtCB = ""
  Else
    sMbMsg = "Code barre [" & Me.txtCB & "] incorrect !"
    MsgBox sMbMsg, vbCritical + vbDefaultButton1 + vbOKOnly, App.Title
    Me.txtCB = ""
  End If
End Sub

Private Sub lvDE_DblClick()
  ModifierEnregistrement
End Sub

Private Sub ModifierEnregistrement()
  If Not bContrôleSélection Then Exit Sub
  
  InitialiseChamps
  Dim cEvt As New BDCurseur
  cEvt.OpenCurseur "select * from c_evenement where evt_serie=" & lvDE.SelectedItem.Text
  If cEvt.EOF Then
    cEvt.CloseCurseur
    MsgBox "Evénement non trouvé dans la base, prévenez la DI.", vbExclamation, App.Title
    Exit Sub
  End If
  
  If Not bSetMode(cEvt!evt_evenement) Then Exit Sub
  BDActiveChamp txtDateHeure, True
  
  txtNumEvénement = cEvt!evt_serie
  txtDateHeure = cEvt!evt_ts
  txtSérieLabo = cEvt!evt_serielabo
  bdcPers = cEvt!evt_pers
  If cEvt!evt_milieu = 0 Then
    bdcMilieu = ""
  Else
    bdcMilieu = sAbrégéMilieu(cEvt!evt_milieu)
  End If
  txtInfo(1) = cEvt!evt_info1
  txtInfo(2) = NV(cEvt!evt_info2)
  txtInfo(3) = NV(cEvt!evt_info3)
  cEvt.CloseCurseur
End Sub

Private Sub SupprimerEnregistrement()
  If Not bContrôleSélection Then Exit Sub
  
  RunSQL "delete from c_evenement where evt_serie=" & lvDE.SelectedItem.Text
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

Private Sub lvEvénements_Click()
  SetMode lvEvénements.SelectedItem.Text
End Sub

Private Sub txtCB_GotFocus()
  SetStatus "Scanner un code barre, ou taper le code barre puis [Entrée]"
End Sub

Private Sub lvEvénements_GotFocus()
  SetStatus "Sélectionner l'événement concerné"
End Sub

Private Sub bdcPers_GotFocus()
  SetStatus "Entrer le numéro de personne, ou sélectionner dans la liste (F4)"
End Sub

Private Sub bdcPers_LostFocus()
  bdcPers.Synchronise
End Sub


Private Sub bdcMilieu_GotFocus()
  SetStatus "Entrer le code milieu, ou sélectionner dans la liste (F4)"
End Sub

Private Sub bdcMilieu_LostFocus()
  bdcMilieu.Synchronise
End Sub


Private Sub txtNumEvénement_GotFocus()
  SetStatus "N° interne de l'événement"
End Sub

Private Sub txtDateHeure_GotFocus()
  SetStatus "Date et heure de l'événement"
End Sub

Private Sub txtDateHeure_DblClick()
  BDActiveChamp txtDateHeure, True
End Sub


Private Sub txtSérieLabo_GotFocus()
  SetStatus "Entrer le numéro de série (n° de FSE)"
  AutoSelect txtSérieLabo
End Sub

Private Sub txtInfo_GotFocus(Index As Integer)
  SetStatus txtInfo(Index).Tag
  AutoSelect txtInfo(Index)
End Sub

Private Sub txtNumSS_GotFocus()
  SetStatus txtNumSS.Tag
  AutoSelect txtNumSS
End Sub

Private Sub chkConserver_GotFocus(Index As Integer)
  SetStatus "Cocher pour ne pas effacer cette ligne après validation"
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


' Timer de mise à jour du n° de SS
' Uniquement si le dernier événement clavier date de plus de 10 secondes
Private Sub timAutoInit_Timer()
  If Timer - timLastKey > 10 Then
    SetNoSSDéfaut txtNumSS
    DessineTiming picTiming, lblInfoSS
  End If
End Sub

