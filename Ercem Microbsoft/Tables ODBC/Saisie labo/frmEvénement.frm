VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmEv�nement 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Enregistrement d'un �v�nement par s�rie"
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
   Icon            =   "frmEv�nement.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   7230
   ScaleWidth      =   8190
   ShowInTaskbar   =   0   'False
   Begin MSComctlLib.ListView lvEv�nements 
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
   Begin VB.CommandButton btnAvanc� 
      Caption         =   "Avanc�"
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
      Tag             =   "N� de supers�rie � laquelle sera rattach�e la s�rie"
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
      Begin VB.CommandButton btnEv�nementsDeS�rie 
         Caption         =   "�v�nements &de la s�rie"
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
            Text            =   "N�"
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
   Begin VB.TextBox txtNumEv�nement 
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
      Tag             =   "Info compl�mentaire"
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
      Tag             =   "Info compl�mentaire"
      Top             =   3540
      Width           =   2715
   End
   Begin VB.TextBox txtInfo 
      DataField       =   "evt_info3"
      Height          =   315
      Index           =   3
      Left            =   1320
      TabIndex        =   23
      Tag             =   "Info compl�mentaire"
      Top             =   3900
      Width           =   2715
   End
   Begin VB.TextBox txtS�rieLabo 
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
      Tag             =   "Code personne ayant signal� l'�v�nement"
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
      Tag             =   "Code personne ayant signal� l'�v�nement"
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
   Begin MSComctlLib.ImageList ilEv�nement 
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
            Picture         =   "frmEv�nement.frx":0442
            Key             =   "H1"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEv�nement.frx":061C
            Key             =   "H2"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEv�nement.frx":07F6
            Key             =   "H'2"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEv�nement.frx":09D0
            Key             =   "H3"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEv�nement.frx":0BAA
            Key             =   "H'3"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEv�nement.frx":0D84
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
      Caption         =   "�v�nement :"
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
      Caption         =   "S�rie / &FSE  :"
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
Attribute VB_Name = "frmEv�nement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmEv�nement
' Enregistrement des �v�nements FSE
' 14/04/1998 PV
' 06/07/1998 PV Contr�le des doublons (plus d'index unique)
' 27/07/1998 PV On v�rifie que le lot de g�lose est rempli
' 02/09/1998 PV N� de supers�rie avec l'�v�nement H2 (eD�butRM)
' 06/04/1999 PV Champ evt_ts
' 14/04/1999 PV Gestion g�n�ralis�e des �v�nements; liste des �tuves


Option Explicit

Dim sNomEvt As String

Private timLastKey As Single      ' Heure du dernier �v�nement clavier

Public Sub SetMode(sEv�nement As String)
  bSetMode sEv�nement
End Sub

Public Function bSetMode(sEv�nement As String) As Boolean

  ' Tous les �v�nements ne sont th�oriquement pas modifiables (ex: H0)
  On Error Resume Next
  Set lvEv�nements.SelectedItem = lvEv�nements.ListItems(sEv�nement)
  If Err Then
    MsgBox "Cet �v�nement ne peut pas �tre modifi� par ce programme.", vbExclamation, App.Title
    If Not bShiftPressed Then
      bSetMode = False
      Exit Function
    End If
    Dim l As ListItem
    For Each l In lvEv�nements.ListItems
      l.Selected = False
    Next
  End If
  On Error GoTo 0
  
  sNomEvt = sEv�nement
  
  InitialiseChamps True       ' provoque l'ex�cution de form_load
  Select Case sNomEvt
    Case "H1":
      lblInfo(1) = "&Balance :"
      lblInfo(2) = "&N� lot EPT :"
      lblInfo(3) = "Info &3 :"
      chkConserver(1) = vbUnchecked
      chkConserver(2) = vbChecked
      chkConserver(3) = vbUnchecked
      lvDE.ColumnHeaders(6).Text = "Bal"
      lvDE.ColumnHeaders(7).Text = "EPT"
      lvDE.ColumnHeaders(8).Text = "Info3"
      txtInfo(1).Tag = "Entrer le n� de balance"
      txtInfo(2).Tag = "Entrer le n� de lot d'eau pepton�e tampon�e"
      txtInfo(3).Tag = "Champ suppl�mentaire 3 libre"
      bdcMilieu.Clear
      bdcMilieu.AddItem "EPT", "Eau pepton�e tampon�e"
      bdcMilieu.Text = "EPT"
      BDActiveChamp bdcMilieu, False
      
    Case "H2", "H'2":
      lblInfo(1) = IIf(sNomEvt = "H2", "Info &1 :", "&N� lot TS :")
      lblInfo(2) = IIf(sNomEvt = "H2", "Info &2 :", "Milieu &2")
      lblInfo(3) = IIf(sNomEvt = "H2", "Info &3 :", "Milieu &3")
      chkConserver(1) = vbChecked
      chkConserver(2) = vbUnchecked
      chkConserver(3) = vbUnchecked
      lvDE.ColumnHeaders(6).Text = IIf(sNomEvt = "H2", "Info1", "TS")
      lvDE.ColumnHeaders(7).Text = "Info2"
      lvDE.ColumnHeaders(8).Text = "Info3"
      txtInfo(1).Tag = IIf(sNomEvt = "H2", "Champ suppl�mentaire 1 libre", "Entrer le n� de lot de typtone sel")
      txtInfo(2).Tag = IIf(sNomEvt = "H2", "Champ suppl�mentaire 2 libre", "N� de lot du 2�me milieu utilis� (apr�s TS)")
      txtInfo(3).Tag = IIf(sNomEvt = "H2", "Champ suppl�mentaire 3 libre", "N� de lot du 3�me milieu utilis� (apr�s TS)")
      bdcMilieu.Clear
      If sNomEvt = "H'2" Then
        bdcMilieu.AddItem "TS", "Tryptone Sel"
        bdcMilieu.Text = "TS"
      Else
        bdcMilieu = "(Pas d'information de milieu)"
      End If
      BDActiveChamp bdcMilieu, False
    
    Case "H3":
      lblInfo(1) = "&N� lot :"
      lblInfo(2) = "Info &2 :"
      lblInfo(3) = "Info &3 :"
      chkConserver(1) = vbUnchecked
      chkConserver(2) = vbUnchecked
      chkConserver(3) = vbUnchecked
      lvDE.ColumnHeaders(6).Text = "LotMil"
      lvDE.ColumnHeaders(7).Text = "Info2"
      lvDE.ColumnHeaders(8).Text = "Info3"
      txtInfo(1).Tag = "Entrer le n� de lot de milieu utilis�"
      txtInfo(2).Tag = "Champ suppl�mentaire 2 libre"
      txtInfo(3).Tag = "Champ suppl�mentaire 3 libre"
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
      txtInfo(1).Tag = "Champ suppl�mentaire 1 libre"
      txtInfo(2).Tag = "Champ suppl�mentaire 2 libre"
      txtInfo(3).Tag = "Champ suppl�mentaire 3 libre"
      RemplitComboMilieux bdcMilieu, 0
      BDActiveChamp bdcMilieu, True

    Case "H4":
      lblInfo(1) = "�tuve :"
      lblInfo(2) = "Info &2 :"
      lblInfo(3) = "Info &3 :"
      chkConserver(1) = vbUnchecked
      chkConserver(2) = vbUnchecked
      chkConserver(3) = vbUnchecked
      lvDE.ColumnHeaders(6).Text = "�tuve"
      lvDE.ColumnHeaders(7).Text = "Info2"
      lvDE.ColumnHeaders(8).Text = "Info3"
      txtInfo(1).Tag = "N� d'�tuve dans laquelle sont rang�es les bo�tes / Dur�e d'incubation en heures"
      txtInfo(2).Tag = "Champ suppl�mentaire 2 libre"
      txtInfo(3).Tag = "Champ suppl�mentaire 3 libre"
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
      txtInfo(1).Tag = "Champ suppl�mentaire 1 libre"
      txtInfo(2).Tag = "Champ suppl�mentaire 2 libre"
      txtInfo(3).Tag = "Champ suppl�mentaire 3 libre"
      If colCatEv�nements(sNomEvt).cev_dependmilieu Then
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
  
  lblMilieu = IIf(sNomEvt = "H2", "&Supers�rie :", "&Milieu :")
  bdcMilieu.Visible = sNomEvt <> "H2"
  txtNumSS.Visible = sNomEvt = "H2"
  btnAvanc�.Caption = IIf(sNomEvt = "H1", "Ba&lances�", "&Etuves�")
  btnAvanc�.Visible = sNomEvt = "H1" Or sNomEvt = "H4"
  lvEtuves.Visible = False
  picTiming.Visible = sNomEvt = "H2"
  timAutoInit.Enabled = sNomEvt = "H2"
  bSetMode = True
End Function


Private Sub InitialiseChamps(Optional bTousLesChamps As Boolean)
  BDActiveChamp txtDateHeure, False
  txtNumEv�nement = ""
  txtDateHeure = ""
  txtCB = ""
  txtS�rieLabo = ""
  bdcPers = ""
  If Not bdcMilieu.Locked Then bdcMilieu = ""
  If bTousLesChamps Or chkConserver(1) = vbUnchecked Then txtInfo(1) = ""
  If bTousLesChamps Or chkConserver(2) = vbUnchecked Then txtInfo(2) = ""
  If bTousLesChamps Or chkConserver(3) = vbUnchecked Then txtInfo(3) = ""
  txtCB.SetFocus
  If sNomEvt = "H2" Then
    SetNoSSD�faut txtNumSS
    DessineTiming picTiming, lblInfoSS
    timLastKey = Timer
  End If
  btnAvanc�.Visible = sNomEvt = "H1" Or sNomEvt = "H4"
  lvEtuves.Visible = False
End Sub


Private Sub bdcMilieu1_Change()
  lvEtuves.Visible = False
  btnAvanc�.Visible = True
End Sub

Private Sub bdcMilieu1_Click()
  lvEtuves.Visible = False
  btnAvanc�.Visible = True
End Sub

Private Sub bdcMilieu_Change()
  bdcMilieu_Click
End Sub

Private Sub bdcMilieu_Click()
  If sNomEvt = "H4" Then
    lvEtuves.Visible = False
    btnAvanc�.Visible = True
    If StrComp(bdcMilieu, "VRBL", vbTextCompare) = 0 Then
      lblInfo(1) = "�tuve C30:"
      lblInfo(2) = "�tuve CTH:"
      txtInfo(1).Tag = "N� d'�tuve dans laquelle sont rang�es les bo�tes de C30"
      txtInfo(2).Tag = "N� d'�tuve dans laquelle sont rang�es les bo�tes de CTH"
    Else
      lblInfo(1) = "N� �tuve:"
      lblInfo(2) = "Info &2:"
      txtInfo(1).Tag = "N� d'�tuve dans laquelle sont rang�es les bo�tes"
      txtInfo(2).Tag = "Info compl�mentaire 2"
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

Private Sub btnAvanc�_Click()
  If sNomEvt = "H1" Then
    frmBalances.Show vbModal
  Else
    ' V�rification du n� de s�rie
    If Not bOkS�rie Then Exit Sub
    
    bdcMilieu.Synchronise
    If bdcMilieu.ListIndex < 0 Then
      MsgBox "Vous devez choisir le milieu avant d'afficher la liste des �tuves possibles.", vbExclamation, App.Title
      Exit Sub
    End If
    
    Dim iMilieu As Integer, iSS
    iMilieu = iIndiceMilieu(bdcMilieu)
    iSS = BDCurseurExpress("select ser_superserie from c_serielabo where ser_numserie=" & txtS�rieLabo)
    If IsEmpty(iSS) Or IsNull(iSS) Then
      MsgBox "L'�v�nement H2 doit �tre enregistr� afin d'attribuer un n� de supers�rie avant d'afficher la liste des �tuves possibles.", vbExclamation, App.Title
      Exit Sub
    End If
 
    EtuvesDispo Me, lvEtuves, btnAvanc�, iMilieu, iSS
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

Private Sub btnEv�nementsDeS�rie_Click()
  ' V�rification du n� de FSE
  If Not bOkS�rie Then Exit Sub
  
  lvDE.ListItems.Clear
  Dim cEvt As New BDCurseur, iNb As Integer
  cEvt.OpenCurseur "select * from c_evenement where evt_serielabo=" & sFormToSQL(txtS�rieLabo, BDTypeINTEGER) & " order by evt_ts"
  Do
    If cEvt.EOF Then Exit Do
    
    Dim s As String
    s = cEvt!evt_evenement
    If s = "H3" Or s = "H'3" Or s = "H4" Or s = "H5" Or s = "H6" Then s = s & "." & sAbr�g�Milieu(cEvt!evt_milieu)

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

Private Function bOkS�rie() As Boolean
  bOkS�rie = False
  If txtS�rieLabo = "" Then
    MsgBox "Entrez un n� de FSE/S�rie.", vbExclamation, App.Title
    txtS�rieLabo.SetFocus
    Exit Function
  End If
  If Not IsNumeric(txtS�rieLabo) Then
    MsgBox "Le n� de FSE/S�rie est invalide.", vbExclamation, App.Title
    txtS�rieLabo.SetFocus
    Exit Function
  End If
  Dim d
  d = BDCurseurExpress("select min(ser_dh) from c_serielabo where ser_numserie=" & txtS�rieLabo)
  If IsEmpty(d) Or IsNull(d) Then
    MsgBox "N� de s�rie inexistant.", vbExclamation, App.Title
    If Not bShiftPressed Then Exit Function
  ElseIf Int(d) <> Today Then
    Select Case sNomEvt
      Case "H1", "H2", "H'2", "H3", "H'3", "H4", "H11"
        MsgBox "Ancienne s�rie." & vbCrLf & "Cette s�rie a �t� enregistr�e le " & Format(d, "dddd d mmmm yyyy") & ", vous ne pouvez pas enregistrer un �v�nement aujourd'hui.", vbExclamation, App.Title
        If Not bShiftPressed Then Exit Function
    End Select
  End If
  bOkS�rie = True
End Function

Private Sub btnValider_Click()
  Dim i As Integer          ' fourre-tout
  Dim iMilieu As Integer    ' Milieu s�lectionn�, ou 0
  
  ' Si le formulaire est vide, on d�gage silencieusement
  If txtS�rieLabo = "" And bdcPers = "" And bdcMilieu = "" And txtNumSS = "" Then Exit Sub
  
  ' V�rification du n� de FSE
  If Not bOkS�rie Then Exit Sub
  
  ' V�rification �ventuelle du n� de supers�rie
  If sNomEvt = "H2" Then
    If Not bCheckNoSS(txtNumSS) Then Exit Sub
  End If
  
  ' On contr�le tout de suite le milieu, on en a besoin pour lire l'�v�nement pr�c�dent
  If colCatEv�nements(sNomEvt).cev_dependmilieu Then
    If bdcMilieu = "" Then
      MsgBox "Le milieu est obligatoire pour cet �v�nement.", vbExclamation, App.Title
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
  
  
  ' Contr�le de date et d'heure
  If txtDateHeure <> "" Then
    If Not IsDate(txtDateHeure) Then
      MsgBox "Date et heure d'�v�nement incorrecte !"
      Exit Sub
    End If
  Else
    txtDateHeure = Format(Now, "dd/mm/yyyy hh:mm:ss")
  End If
  
  ' On v�rifie l'ordre des �v�nements
  Dim sEvtPr�c�dent As String
  Dim iPersPr�c�dent As Variant   ' Peut contenir empty
  Dim tsPr�c�dent As Date
  Select Case sNomEvt
    Case "H1":     sEvtPr�c�dent = "H0"
    Case "H2":     sEvtPr�c�dent = "H1"
    Case "H'2":    sEvtPr�c�dent = "H2"
    Case "H3":     sEvtPr�c�dent = "H'2"
    Case "H'3":    sEvtPr�c�dent = "H3"
    Case "H4":     sEvtPr�c�dent = "H'3"
    Case "H5":     sEvtPr�c�dent = "H4"
    
    Case "H11":    sEvtPr�c�dent = "H0"
    Case "H12":    sEvtPr�c�dent = "H11"
    Case "H13":    sEvtPr�c�dent = "H12"
    Case "H14":    sEvtPr�c�dent = "H13"
    Case "H15":    sEvtPr�c�dent = "H14"

    Case Else:     sEvtPr�c�dent = ""
  End Select
  
  If sEvtPr�c�dent <> "" Then
    Dim sSQL As String
    sSQL = "select evt_pers,evt_ts from c_evenement where evt_serielabo=" & sFormToSQL(txtS�rieLabo, BDTypeINTEGER) & " and evt_evenement=" & Chr(34) & sEvtPr�c�dent & Chr(34)
    If colCatEv�nements(sEvtPr�c�dent).cev_dependmilieu Then sSQL = sSQL & " and evt_milieu=" & iMilieu
    Dim cPrec As New BDCurseur
    cPrec.OpenCurseur sSQL
    If Not cPrec.EOF Then
      iPersPr�c�dent = cPrec!evt_pers
      tsPr�c�dent = cPrec!evt_ts
    End If
    cPrec.CloseCurseur
    
    Dim sMsg As String
    If IsEmpty(iPersPr�c�dent) Then
      sMsg = "Avertissement: L'�v�nement " & sEvtPr�c�dent
      If colCatEv�nements(sNomEvt).cev_dependmilieu Then sMsg = sMsg & "." & sAbr�g�Milieu(iMilieu)
      If vbNo = MsgBox(sMsg & " n'a pas �t� enregistr� pour cette s�rie." & vbCrLf & "V�rifiez qu'il n'y a pas d'erreur." & vbCrLf & vbCrLf & "Voulez-vous enregistrer ?", vbQuestion + vbYesNo, App.Title) Then
        Exit Sub
      End If
    Else
      If CDate(txtDateHeure) < tsPr�c�dent Then
        sMsg = "L'�v�nement pr�c�dent " & sEvtPr�c�dent
        If colCatEv�nements(sNomEvt).cev_dependmilieu Then sMsg = sMsg & "." & sAbr�g�Milieu(iMilieu)
        sMsg = sMsg & " a �t� enregistr� � " & Format(tsPr�c�dent, "hh:mm:ss") & "." & vbCrLf & vbCrLf & "Vous ne pouvez pas enregistrer l'�v�nement actuel � " & Format(CDate(txtDateHeure), "hh:mm:ss") & "."
        MsgBox sMsg, vbExclamation, App.Title
        If Not bShiftPressed Then Exit Sub
      End If
    End If
  End If


  ' Si le n� de personne n'est pas pr�cis�, on le r�cup�re en priorit�
  ' de l'�v�nement pr�cedent, sinon on le prend de la FSE
  If bdcPers = "" Then
    Dim iPers As Integer
    If Not IsEmpty(iPersPr�c�dent) Then
      iPers = iPersPr�c�dent
    Else
      iPers = iPersonneDeFSE
      If iPers < 0 Then
        MsgBox "N� de FSE/S�rie incorrect, inexistant ou trop ancien (recherche du n� de personne � partir du n� de s�rie).", vbExclamation, App.Title
        txtS�rieLabo.SetFocus
        Exit Sub
      End If
    End If
    bdcPers = iPers
  End If

  If Not IsNumeric(bdcPers) Then
    MsgBox "Le n� de personne est incorrect.", vbExclamation, App.Title
    bdcPers.SetFocus
    Exit Sub
  End If
  bdcPers.Synchronise
  If bdcPers.ListIndex < 0 Then
    MsgBox "Le n� de personne doit faire partie de la liste.", vbExclamation, App.Title
    bdcPers.SetFocus
    Exit Sub
  End If
  
  ' On v�rifie les champs d'info, sp�cifiques � l'�v�nement
  Select Case sNomEvt
    Case "H1":
      If txtInfo(1) <> UCase(txtInfo(1)) Then txtInfo(1) = UCase(txtInfo(1))
      If Left(txtInfo(1), 2) <> "LM" Then
        MsgBox "Le n� de balance est incorrect (doit �tre de la forme LMxxx).", vbExclamation, App.Title
        txtInfo(1).SetFocus
        Exit Sub
      End If
      
      If txtInfo(2) = "" Then
        MsgBox "Le n� de lot d'eau pepton�e tampon�e est obligatoire.", vbExclamation, App.Title
        txtInfo(2).SetFocus
        Exit Sub
      End If
    
    Case "H'2":
      If txtInfo(1) = "" Then
        MsgBox "Le n� de lot de tryptone sel est obligatoire.", vbExclamation, App.Title
        txtInfo(1).SetFocus
        Exit Sub
      End If
      
      If txtInfo(1) <> UCase(txtInfo(1)) Then txtInfo(1) = UCase(txtInfo(1))
      If Left(txtInfo(1), 3) = "TS:" Then txtInfo(1) = Mid(txtInfo(1), 4)
    
    Case "H3":
      If txtInfo(1) = "" And bdcMilieu <> "PM" Then
        MsgBox "Le n� de lot de milieu est obligatoire.", vbExclamation, App.Title
        txtInfo(1).SetFocus
        Exit Sub
      End If
      
    Case "H4":
      If Not bContr�leEtuve(txtInfo(1)) Then
        txtInfo(1).SetFocus
        Exit Sub
      End If
      If txtInfo(2) <> "" Then
        If Not bContr�leEtuve(txtInfo(2)) Then
          txtInfo(2).SetFocus
          Exit Sub
        End If
      End If
      
  End Select
  
  ' On v�rifie les doublons (m�me s�rie / m�me ev�nement / m�me milieu)
  ' si on n'est pas en train de faire une modif
  If txtNumEv�nement = "" Then
    Dim bDoublon As Boolean
    sSQL = "select count(*) from c_evenement where evt_serielabo=" & sFormToSQL(txtS�rieLabo, BDTypeINTEGER) & " and evt_evenement=" & Chr(34) & sNomEvt & Chr(34)
    If colCatEv�nements(sNomEvt).cev_dependmilieu Then sSQL = sSQL & " and evt_milieu=" & iMilieu
    bDoublon = BDCurseurExpress(sSQL) > 0
    If bDoublon Then
      Dim sMessage As String
      If sNomEvt = "H3" Or sNomEvt = "H4" Then
        sMessage = "Cet �v�nement a d�ja �t� enregistr� pour cette s�rie et ce milieu."
      Else
        sMessage = "Cet �v�nement a d�ja �t� enregistr� pour cette s�rie."
      End If
      MsgBox sMessage, vbExclamation, App.Title
      Exit Sub
    End If
  End If
  
  ' Tout est Ok !
  Screen.MousePointer = vbHourglass
  SetStatus "Enregistrement de l'�v�nement�"
  
  ' Mise � jour �ventuelle du n� de supers�rie
  If sNomEvt = "H2" Then RattacheS�rie CLng(txtS�rieLabo), CInt(txtNumSS)
  
  ' Cr�ation de l'enregistrement
  Dim cEvt As New BDCurseur
  If txtNumEv�nement = "" Then
    cEvt.OpenCurseur "select * from c_evenement where evt_serie=0"
    cEvt.AddNew
  Else
    cEvt.OpenCurseur "select * from c_evenement where evt_serie=" & txtNumEv�nement
    cEvt.Edit
  End If
  
  cEvt!evt_date = Today
  cEvt!evt_evenement = sNomEvt
  cEvt!evt_milieu = iMilieu
  cEvt!evt_pers = bdcPers
  cEvt!evt_serielabo = CLng(txtS�rieLabo)
  cEvt!evt_info1 = txtInfo(1)
  cEvt!evt_info2 = txtInfo(2)
  cEvt!evt_info3 = txtInfo(3)
  cEvt!evt_ts = CDate(txtDateHeure)
  cEvt!timestamp = BDTime
  
  On Error Resume Next
  cEvt.Update
  If Err Then
    MsgBox "�chec lors de la validation des donn�es. L'�v�nement a peut-�tre d�j� �t� enregistr� pour cette s�rie." & vbCrLf & vbCrLf & "Erreur " & Err.Number & ": " & Err.Source & ": " & sAjusteMessageODBC(Err.Description), vbExclamation, App.Title
    Screen.MousePointer = vbDefault
    SetStatus
    Exit Sub
  End If
  On Error GoTo 0
  
  cEvt.CloseCurseur
  
  SetStatus "Lecture du n� d'�v�nement�"
  Dim iMax As Long
  If txtNumEv�nement = "" Then
    ' triche: pour r�cup�rer un s�rial, on lit le max�
    iMax = BDCurseurExpress("select max(evt_serie) from c_evenement")
  Else
    iMax = CLng(txtNumEv�nement)
    ' On efface l'ancien �v�nement de l'historique
    For i = 1 To lvDE.ListItems.Count
      If lvDE.ListItems(i).Text = iMax Then lvDE.ListItems.Remove i: Exit For
    Next
  End If
  
  ' Ajout de l'�v�nement en t�te la liste d'historique
  Dim s As String
  s = sNomEvt
  If colCatEv�nements(sNomEvt).cev_dependmilieu Then s = s & "." & bdcMilieu
  
  Dim itmX As ListItem
  Set itmX = lvDE.ListItems.Add(1)
  itmX.Text = iMax
  itmX.SubItems(1) = Format(CDate(txtDateHeure), "dd/mm hh:mm")
  itmX.SubItems(2) = txtS�rieLabo
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

  ' Par s�curit�, on ferme la fen�tre des supers�ries si elle est ouverte
  On Error Resume Next
  Unload frmSuperS�rie
  On Error GoTo 0

  ' R�initialisation du chien de garde d'inactivit�
  RAZTimerInactif
  
  Screen.MousePointer = vbDefault
  SetStatus
End Sub

'=================================================================================
' Fonctions de service

Private Sub AjouteEv�nement(ByVal sCode As String)
  Dim itmX As ListItem
  Set itmX = lvEv�nements.ListItems.Add(, sCode, sCode)
  itmX.SubItems(1) = colCatEv�nements(sCode).cev_libelle
End Sub

Private Sub Form_Load()
  Show
  SetStatus "Chargement en cours, patientez�"
  
  ' Chargement des combos
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcPers.AddItem u.uti_numuti, u.uti_nom
  Next
  
  AjouteEv�nement "H1"
  AjouteEv�nement "H2"
  AjouteEv�nement "H'2"
  AjouteEv�nement "H3"
  AjouteEv�nement "H'3"
  AjouteEv�nement "H4"
  AjouteEv�nement "H5"
  AjouteEv�nement "H11"
  AjouteEv�nement "H12"
  AjouteEv�nement "H13"
  AjouteEv�nement "H14"
  AjouteEv�nement "H15"
  AjusteListView Me, lvEv�nements
  
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
' D�codage g�n�ral des codes barres
  
  Dim sRefEch As String ' r�f�rence de l'�chantillon

  ' Caract�re % d'intro envoy� par le lecteur
  If KeyAscii = &H25 Then   ' &h25 = caract�re pourcent %
    txtCB = ""
    txtCB.SetFocus
    KeyAscii = 0
    Exit Sub
  End If
  
  If KeyAscii = 13 And ActiveControl Is txtCB Then
    Select Case UCase(Left(txtCB, 1))
      Case "K"    ' Simulation clavier
        Dim sCmd As String
        sCmd = Subst(Mid(txtCB, 2), "$", "%")   ' %=pr�fixe Alt dans sendkeys, mais utilis� en pr�fixe CB�
        On Error Resume Next
        SendKeys sCmd
        On Error GoTo 0
        txtCB = ""
      
      Case "F":   ' FSE
        txtS�rieLabo = CLng(Mid(txtCB, 3))
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
          MsgBox "Un n� de balance n'est valide qu'en fin de PSM.", vbExclamation, App.Title
        End If
        
      Case Else:  ' Ancienne m�thode, d�tection � la longueur
        If Len(Me.txtCB) = 10 And IsNumeric(txtCB) Then
          txtS�rieLabo = Me.txtCB
          PersonneDeFSE
          Me.txtCB = ""
          txtInfo(1).SetFocus
        ElseIf Len(txtCB) = 18 And IsNumeric(txtCB) Then
          S�rieDeEchantillon
        Else
          If Me.txtCB <> "" Then MsgBox "Code barre [" & Me.txtCB & "] invalide !", _
              vbCritical + vbOKOnly, App.Title
          Me.txtCB = ""
        End If
      
    End Select
    KeyAscii = 0
  End If
End Sub




' Recherche un code personne � partir d'un n� de FSE
Private Function iPersonneDeFSE() As Integer
  iPersonneDeFSE = -1
  If Len(txtS�rieLabo) < 5 Then Exit Function
  If Not IsNumeric(txtS�rieLabo) Then Exit Function
  
  Dim iRes
  iRes = BDCurseurExpress("select ser_numtech from c_serielabo where ser_numserie=" & CLng(txtS�rieLabo))
  If Not IsEmpty(iRes) Then iPersonneDeFSE = CInt(iRes)
End Function

Private Sub PersonneDeFSE()
  SetStatus "Recherche de la s�rie�"
  Screen.MousePointer = vbHourglass
  Dim iPers As Integer
  iPers = iPersonneDeFSE
  If iPers > 0 Then bdcPers = iPers
  SetStatus
  Screen.MousePointer = vbDefault
End Sub

Private Sub S�rieDeEchantillon()
' Recherche un code de s�rie � partir d'un n� d'�chantillon
' PC 21/11/2001 : contr�le code barre avec fonction bDecodeCB_FP

  Dim sRefEch As String
  Dim iS�rie As Variant
  Dim c As New BDCurseur
  Dim sMbMsg As String  ' message d'une boite de message
  Dim sReqSql As String ' Requ�te SQL
  
' sRefEch = sD�codeCBFP(txtCB)
  If bDecodeCB_FP(Me.txtCB, sRefEch) Then
    sReqSql = "select lct_numserie,lct_codetech from c_labcrat where lct_ref='" & sRefEch & "'"
    c.OpenCurseur sReqSql
    If c.EOF Then
      sMbMsg = "Impossible de d�terminer le n� de s�rie � partir du n� d'�chantillon. " & vbCrLf & _
        "(�chantillon [" & sRefEch & "] trop ancien ou non affect� � une s�rie)"
      MsgBox sMbMsg, vbExclamation, App.Title
      iS�rie = 0
    Else
      txtS�rieLabo = c("lct_numserie")
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
  If Not bContr�leS�lection Then Exit Sub
  
  InitialiseChamps
  Dim cEvt As New BDCurseur
  cEvt.OpenCurseur "select * from c_evenement where evt_serie=" & lvDE.SelectedItem.Text
  If cEvt.EOF Then
    cEvt.CloseCurseur
    MsgBox "Ev�nement non trouv� dans la base, pr�venez la DI.", vbExclamation, App.Title
    Exit Sub
  End If
  
  If Not bSetMode(cEvt!evt_evenement) Then Exit Sub
  BDActiveChamp txtDateHeure, True
  
  txtNumEv�nement = cEvt!evt_serie
  txtDateHeure = cEvt!evt_ts
  txtS�rieLabo = cEvt!evt_serielabo
  bdcPers = cEvt!evt_pers
  If cEvt!evt_milieu = 0 Then
    bdcMilieu = ""
  Else
    bdcMilieu = sAbr�g�Milieu(cEvt!evt_milieu)
  End If
  txtInfo(1) = cEvt!evt_info1
  txtInfo(2) = NV(cEvt!evt_info2)
  txtInfo(3) = NV(cEvt!evt_info3)
  cEvt.CloseCurseur
End Sub

Private Sub SupprimerEnregistrement()
  If Not bContr�leS�lection Then Exit Sub
  
  RunSQL "delete from c_evenement where evt_serie=" & lvDE.SelectedItem.Text
  lvDE.ListItems.Remove lvDE.SelectedItem.Index
  Set lvDE.SelectedItem = Nothing ' Pas sur que ce soit n�cessaire
End Sub

Private Function bContr�leS�lection() As Boolean
  Dim bOk As Boolean
  
  If lvDE.SelectedItem Is Nothing Then
    bOk = False
  Else
    bOk = lvDE.SelectedItem.Selected
  End If
  
  If Not bOk Then MsgBox "S�lectionnez une ligne dans les derniers �v�nements avant de cliquer sur ce bouton.", vbExclamation, App.Title
  bContr�leS�lection = bOk
End Function

Private Sub lvEv�nements_Click()
  SetMode lvEv�nements.SelectedItem.Text
End Sub

Private Sub txtCB_GotFocus()
  SetStatus "Scanner un code barre, ou taper le code barre puis [Entr�e]"
End Sub

Private Sub lvEv�nements_GotFocus()
  SetStatus "S�lectionner l'�v�nement concern�"
End Sub

Private Sub bdcPers_GotFocus()
  SetStatus "Entrer le num�ro de personne, ou s�lectionner dans la liste (F4)"
End Sub

Private Sub bdcPers_LostFocus()
  bdcPers.Synchronise
End Sub


Private Sub bdcMilieu_GotFocus()
  SetStatus "Entrer le code milieu, ou s�lectionner dans la liste (F4)"
End Sub

Private Sub bdcMilieu_LostFocus()
  bdcMilieu.Synchronise
End Sub


Private Sub txtNumEv�nement_GotFocus()
  SetStatus "N� interne de l'�v�nement"
End Sub

Private Sub txtDateHeure_GotFocus()
  SetStatus "Date et heure de l'�v�nement"
End Sub

Private Sub txtDateHeure_DblClick()
  BDActiveChamp txtDateHeure, True
End Sub


Private Sub txtS�rieLabo_GotFocus()
  SetStatus "Entrer le num�ro de s�rie (n� de FSE)"
  AutoSelect txtS�rieLabo
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
  SetStatus "Cocher pour ne pas effacer cette ligne apr�s validation"
End Sub

Private Sub lvDE_GotFocus()
  SetStatus "Historique des derniers �v�nements saisis sur ce poste"
End Sub

Private Sub btnValider_GotFocus()
  SetStatus "Enregistrer les donn�es de l'�v�nement"
End Sub

Private Sub btnInitialiser_GotFocus()
  SetStatus "Effacer les informations saisies � l'�cran"
End Sub

Private Sub btnModifier_GotFocus()
  SetStatus "Rappeler les donn�es de l'�v�nement s�lectionn�"
End Sub

Private Sub btnSupprimer_GotFocus()
  SetStatus "Supprimer de la base les donn�es de l'�v�nement s�lectionn�"
End Sub


' Timer de mise � jour du n� de SS
' Uniquement si le dernier �v�nement clavier date de plus de 10 secondes
Private Sub timAutoInit_Timer()
  If Timer - timLastKey > 10 Then
    SetNoSSD�faut txtNumSS
    DessineTiming picTiming, lblInfoSS
  End If
End Sub

