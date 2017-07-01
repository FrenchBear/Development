VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmSuperEvénement 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Enregistrement d'un événement par supersérie"
   ClientHeight    =   5475
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
   Icon            =   "frmEvtSS.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5475
   ScaleWidth      =   8190
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnAvancé 
      Caption         =   "Avancé"
      Height          =   330
      Left            =   6660
      TabIndex        =   20
      Top             =   2580
      Width           =   1455
   End
   Begin VB.Frame Frame1 
      Caption         =   "Derniers enre&gistrements"
      Height          =   1695
      Left            =   60
      TabIndex        =   14
      Top             =   3720
      Width           =   8055
      Begin MSComctlLib.ListView lvDE 
         Height          =   1305
         Left            =   120
         TabIndex        =   15
         Top             =   300
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
         NumItems        =   7
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "SS"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Heure"
            Object.Width           =   1940
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Pers"
            Object.Width           =   582
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Evt"
            Object.Width           =   423
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "Info1"
            Object.Width           =   1235
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Text            =   "Info2"
            Object.Width           =   1235
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Text            =   "Info3"
            Object.Width           =   1235
         EndProperty
      End
   End
   Begin VB.CommandButton btnInitialiser 
      Caption         =   "Initialiser (F3)"
      Height          =   375
      Left            =   6660
      TabIndex        =   17
      Top             =   540
      Width           =   1455
   End
   Begin VB.CommandButton btnValider 
      Caption         =   "Valider (F2)"
      Height          =   375
      Left            =   6660
      TabIndex        =   16
      Top             =   60
      Width           =   1455
   End
   Begin VB.TextBox txtInfo 
      DataField       =   "evt_info1"
      Height          =   315
      Index           =   1
      Left            =   1560
      MaxLength       =   20
      TabIndex        =   9
      Tag             =   "Info complémentaire"
      Top             =   2580
      Width           =   2715
   End
   Begin VB.TextBox txtInfo 
      DataField       =   "evt_info2"
      Height          =   315
      Index           =   2
      Left            =   1560
      MaxLength       =   10
      TabIndex        =   11
      Tag             =   "Info complémentaire"
      Top             =   2940
      Width           =   2715
   End
   Begin VB.TextBox txtInfo 
      DataField       =   "evt_info3"
      Height          =   315
      Index           =   3
      Left            =   1560
      TabIndex        =   13
      Tag             =   "Info complémentaire"
      Top             =   3300
      Width           =   2715
   End
   Begin VB.TextBox txtNumSS 
      Height          =   315
      Left            =   1920
      TabIndex        =   2
      Top             =   1380
      Width           =   675
   End
   Begin SaisieLabo.BDCombo bdcPers 
      Height          =   330
      Left            =   1560
      TabIndex        =   4
      Tag             =   "Code personne ayant signalé l'événement"
      Top             =   1740
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
      DataField       =   "*evt_pers"
   End
   Begin SaisieLabo.BDCombo bdcMilieu 
      Height          =   330
      Left            =   1560
      TabIndex        =   6
      Tag             =   "Code personne ayant signalé l'événement"
      Top             =   2160
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
      DataField       =   "*evt_pers"
   End
   Begin MSComctlLib.ImageList ilSuperEvénement 
      Left            =   7260
      Top             =   1320
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483633
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   16776960
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEvtSS.frx":014A
            Key             =   "H3"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEvtSS.frx":0324
            Key             =   "H'3"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmEvtSS.frx":04FE
            Key             =   "H4"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvEvénements 
      Height          =   1275
      Left            =   1560
      TabIndex        =   18
      Top             =   60
      Width           =   4995
      _ExtentX        =   8811
      _ExtentY        =   2249
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
   Begin MSComctlLib.ListView lvEtuves 
      Height          =   1035
      Left            =   4320
      TabIndex        =   7
      Top             =   2580
      Visible         =   0   'False
      Width           =   3795
      _ExtentX        =   6694
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
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Événement :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   19
      Top             =   120
      Width           =   1200
   End
   Begin VB.Label lblJour 
      AutoSize        =   -1  'True
      Caption         =   "--"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   210
      Left            =   1620
      TabIndex        =   1
      Top             =   1440
      Width           =   180
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "&Milieu :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   5
      Top             =   2220
      Width           =   660
   End
   Begin VB.Label lblInfo 
      AutoSize        =   -1  'True
      Caption         =   "Lot :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   8
      Top             =   2640
      Width           =   435
   End
   Begin VB.Label lblInfo 
      AutoSize        =   -1  'True
      Caption         =   "Info &2 :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   10
      Top             =   3000
      Width           =   690
   End
   Begin VB.Label lblInfo 
      AutoSize        =   -1  'True
      Caption         =   "Info &3 :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   12
      Top             =   3360
      Width           =   690
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "&Personne :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   3
      Top             =   1800
      Width           =   1035
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "SuperSérie :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   1440
      Width           =   1170
   End
End
Attribute VB_Name = "frmSuperEvénement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmSuperEvénement
' Enregistrement des événements FSE par supersérie
' 25/08/1998 PV
' 17/12/1998 PV Message détaillé si enregistrement impossible
' 14/04/1999 PV Gestion généralisée des événements

Option Explicit

Dim sNomEvt As String


Public Sub SetMode(sEvénement As String)
  sNomEvt = sEvénement
  Set lvEvénements.SelectedItem = lvEvénements.ListItems(sEvénement)
  
  InitialiseChamps True       ' provoque l'exécution de form_load
  
  Select Case sEvénement
    Case "H3":
      lblInfo(1) = "N° de lot :"
      txtInfo(1).Tag = "N° de lot de milieu utilisé"
      lblInfo(2) = "Info &2 :"
      txtInfo(2).Tag = "Info complémentaire 2"
      lvDE.ColumnHeaders(5).Text = "Lot milieu"
      RemplitComboMilieux bdcMilieu, 1
      
    Case "H'3":
      lblInfo(1) = "Info &1 :"
      txtInfo(1).Tag = "Info complémentaire 1"
      lblInfo(2) = "Info &2 :"
      txtInfo(2).Tag = "Info complémentaire 2"
      lvDE.ColumnHeaders(5).Text = "Info 1"
      RemplitComboMilieux bdcMilieu, 1
      
    Case "H4":
      lblInfo(1) = "N° étuve :"
      txtInfo(1).Tag = "N° d'étuve dans laquelle sont rangées les boîtes"
      lblInfo(2) = "Info &2 :"
      txtInfo(2).Tag = "Info complémentaire 2"
      lvDE.ColumnHeaders(5).Text = "Étuve"
      RemplitComboMilieux bdcMilieu, 0
  End Select
  AjusteListView Me, lvDE
  
  btnAvancé.Caption = "&Etuves…"
  btnAvancé.Visible = sNomEvt = "H4"
  lvEtuves.Visible = False
End Sub


Private Sub InitialiseChamps(Optional bTousLesChamps As Boolean)
  bdcPers = ""
  bdcMilieu = ""
  txtInfo(1) = ""
  txtInfo(2) = ""
  txtInfo(3) = ""
  
  ' Détermination automatique du jour et du n° de série
  ' Décalage: 1 SS de retard en RM, 2 SS de retard pour la mise en étuve
  ' (retard par rapport à la DE)
  SetLabelJourSS lblJour
  If sNomEvt = "H4" Then
    SetNoSSDéfaut txtNumSS, -2
  Else
    SetNoSSDéfaut txtNumSS, -1
  End If
  
  btnAvancé.Visible = sNomEvt = "H1" Or sNomEvt = "H4"
  lvEtuves.Visible = False

  txtNumSS.SetFocus
  AutoSelect txtNumSS, True
End Sub


Private Sub bdcMilieu_Change()
  bdcMilieu_Click
End Sub

Private Sub bdcMilieu_Click()
  If sNomEvt = "H4" Then
    lvEtuves.Visible = False
    btnAvancé.Visible = True
    If StrComp(bdcMilieu, "VRBL", vbTextCompare) = 0 Then
      lblInfo(1) = "N° étuve C30 :"
      lblInfo(2) = "N° étuve CTH :"
      txtInfo(1).Tag = "N° d'étuve dans laquelle sont rangées les boîtes de C30"
      txtInfo(2).Tag = "N° d'étuve dans laquelle sont rangées les boîtes de CTH"
    Else
      lblInfo(1) = "N° étuve :"
      lblInfo(2) = "Info &2 :"
      txtInfo(1).Tag = "N° d'étuve dans laquelle sont rangées les boîtes"
      txtInfo(2).Tag = "Info complémentaire 2"
    End If
  End If
End Sub


Private Sub btnAvancé_Click()
  ' Vérification du n° de supersérie
  If Not bCheckNoSS(txtNumSS) Then Exit Sub
  Dim iSS As Integer
  iSS = CInt(txtNumSS)
  
  bdcMilieu.Synchronise
  If bdcMilieu.ListIndex < 0 Then
    MsgBox "Vous devez choisir le milieu avant d'afficher la liste des étuves possibles.", vbExclamation, App.Title
    Exit Sub
  End If
  Dim iMilieu As Integer
  iMilieu = iIndiceMilieu(bdcMilieu)
  
  EtuvesDispo Me, lvEtuves, btnAvancé, iMilieu, iSS
End Sub


Private Sub btnInitialiser_Click()
  InitialiseChamps
End Sub


Private Sub btnValider_Click()
  Dim i As Integer          ' fourre-tout
  Dim iMilieu As Integer    ' Milieu sélectionné
  Dim sMsg As String
  
  ' Vérification du n° de supersérie
  If Not bCheckNoSS(txtNumSS) Then Exit Sub
  
  ' Si rien de rempli, on dégage en silence
  If bdcPers = "" And bdcMilieu = "" Then Exit Sub
  
  ' On vérifie le milieu
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

  
  ' On vérifie le n° de personne
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
  
  
  ' On vérifie les champs d'info, spécifiques au mode
  Select Case sNomEvt
    Case "H3":
      If txtInfo(1) = "" And bdcMilieu <> "PM" Then
        MsgBox "Le n°de lot de milieu est obligatoire.", vbExclamation, App.Title
        txtInfo(1).SetFocus
        Exit Sub
      End If
      
    Case "H'3":
      ' Nop
      
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
      
    Case Else:
      Stop
  End Select
  

  SetStatus "Vérifications en cours…"
  Screen.MousePointer = vbHourglass

  ' On vérifie que la supersérie existe
  Dim colSérie As New Collection
  Dim cSérie As New BDCurseur
  Dim ser As SérieLabo
  
  cSérie.OpenCurseur "select ser_numserie,ser_numtech,ser_dh,ser_superserie from c_serielabo where ser_superserie=" & txtNumSS & " and date(ser_dh)=today"
  While Not cSérie.EOF
    Set ser = New SérieLabo
    ser.ser_numserie = cSérie!ser_numserie
    ser.ser_numtech = cSérie!ser_numtech
    ser.ser_dh = cSérie!ser_dh
    ser.ser_superserie = cSérie!ser_superserie
    colSérie.Add ser
    Set ser = Nothing
    cSérie.MoveNext
  Wend
  cSérie.CloseCurseur
  
  If colSérie.Count = 0 Then
    SetStatus
    Screen.MousePointer = vbDefault
    MsgBox "Il n'y a aucune série rattachée à cette supersérie, l'enregistrement de l'événement " & sNomEvt & "." & sAbrégéMilieu(iMilieu) & " est impossible.", vbExclamation, App.Title
    If Not bShiftPressed Then Exit Sub
  End If
  
  
  ' On fabrique la liste des séries rattachées à la supersérie
  Dim sSQL As String, sNumérosSéries As String
  For Each ser In colSérie
    If sNumérosSéries <> "" Then sNumérosSéries = sNumérosSéries & ","
    sNumérosSéries = sNumérosSéries & ser.ser_numserie
  Next
  
  ' Garde-fou au cas où on aurait franchi le message "pas de série rattachée…"
  If sNumérosSéries = "" Then sNumérosSéries = 0
  
  ' On vérifie que l'événement n'a pas déjà été enregistré
  sSQL = "select count(*) from c_evenement where evt_evenement=""" & sNomEvt & """ and evt_milieu=" & iMilieu & " and evt_serielabo in (" & sNumérosSéries & ")"
  Dim iNb As Integer
  iNb = BDCurseurExpress(sSQL)
  If iNb > 0 Then
    sMsg = "Il y a déjà " & iNb & " série" & s(iNb) & " rattachée" & s(iNb) & " à cette supersérie et pour " & IIf(iNb > 1, "lesquelles", "laquelle") & " l'événement " & sNomEvt & "." & sAbrégéMilieu(iMilieu) & " a déjà été enregistré." _
      & vbCrLf & vbCrLf & "Vous ne pouvez pas faire l'enregistrement par supersérie, vous devez enregistrer individuellement l'événement pour chacune des séries pour lesquelles il n'est pas enregistré." & vbCrLf & vbCrLf & "Séries concernées:"
    Dim cd As New BDCurseur
    cd.OpenCurseur "select * from c_evenement where evt_evenement=""" & sNomEvt & """ and evt_milieu=" & iMilieu & " and evt_serielabo in (" & sNumérosSéries & ")"
    While Not cd.EOF
      sMsg = sMsg & vbCrLf & cd!evt_serielabo & " enregistré par " & cd!evt_pers & " (" & sNomUtilisateur(cd!evt_pers) & ") à " & Format(cd!timestamp, "h:mm:ss")
      cd.MoveNext
    Wend
    cd.CloseCurseur
      
    SetStatus
    Screen.MousePointer = vbDefault
    MsgBox sMsg, vbExclamation, App.Title
    Exit Sub
  End If
  
  
  ' On vérifie que l'événement précédent a été enregistré pour toutes les séries
  Dim sEvtPrécédent As String
  Select Case sNomEvt
    Case "H3":     sEvtPrécédent = "H'2"
    Case "H'3":    sEvtPrécédent = "H3"
    Case "H4":     sEvtPrécédent = "H'3"
    Case Else:     Stop
  End Select
  sSQL = "select count(*) from c_evenement where evt_evenement=""" & sEvtPrécédent & """ "
  If sNomEvt <> "H3" Then sSQL = sSQL & "and evt_milieu=" & iMilieu & " "
  sSQL = sSQL & "and evt_serielabo in (" & sNumérosSéries & ")"
  iNb = BDCurseurExpress(sSQL)
  If iNb <> colSérie.Count Then
    sMsg = "Avertissement: L'événement " & sEvtPrécédent
    If sNomEvt <> "H3" Then sMsg = sMsg & "." & sAbrégéMilieu(iMilieu)
    sMsg = sMsg & " (" & sNomCatEvénement(sEvtPrécédent) & ") " & IIf(iNb > 0, "", "n'") & "a été enregistré pour " & _
      IIf(iNb = 0, "aucune", iNb) & " série" & s(iNb) & " sur " & IIf(colSérie.Count > 1, "les " & colSérie.Count, "la") & " série" & s(colSérie.Count) & " rattachée" & s(colSérie.Count) & " cette supersérie." & vbCrLf & vbCrLf
    If vbNo = MsgBox(sMsg & "Vérifiez qu'il n'y a pas d'erreur." & vbCrLf & vbCrLf & "Voulez-vous enregistrer malgré tout ?", vbQuestion + vbYesNo, App.Title) Then
      SetStatus
      Screen.MousePointer = vbDefault
      Exit Sub
    End If
  End If
  

  ' Tout est Ok !

  ' Création des enregistrements
  ' curseur sur toutes les séries
  Dim dBDTime As Date
  dBDTime = BDTime
  Dim cEvt As New BDCurseur
  i = 0
  cEvt.OpenCurseur "select * from c_evenement where evt_serie=0"
  For Each ser In colSérie
    i = i + 1
    SetStatus "Enregistrement de l'événement… " & i & "/" & colSérie.Count
    cEvt.AddNew
    cEvt!evt_milieu = iMilieu
    cEvt!evt_date = Today
    cEvt!evt_evenement = sNomEvt
    cEvt!evt_pers = bdcPers
    cEvt!evt_serielabo = ser.ser_numserie
    cEvt!evt_info1 = txtInfo(1)
    cEvt!evt_info2 = txtInfo(2)
    cEvt!evt_info3 = txtInfo(3)
    cEvt!timestamp = dBDTime
    On Error Resume Next
    cEvt.Update
    If Err Then
      MsgBox "Échec lors de l'enregistrement de l'événement pour la série " & _
        ser.ser_numserie & "." & vbCrLf & vbCrLf & "Erreur " & Err.Number & _
        ": " & Err.Source & ": " & sAjusteMessageODBC(Err.Description), _
        vbExclamation, App.Title
    End If
    On Error GoTo 0
  Next
  cEvt.CloseCurseur
  
  ' Ajout de l'événement en tête la liste d'historique
  Dim itmX As ListItem
  Set itmX = lvDE.ListItems.Add(1)
  itmX.Text = txtNumSS
  itmX.SubItems(1) = Format(Now, "dd/mm hh:mm")
  itmX.SubItems(2) = bdcPers.Text
  itmX.SubItems(3) = sNomEvt & "." & bdcMilieu
  itmX.SubItems(4) = txtInfo(1)
  itmX.SubItems(5) = txtInfo(2)
  itmX.SubItems(6) = txtInfo(3)
  If lvDE.ListItems.Count > 49 Then
    lvDE.ListItems.Remove 50
  End If
  Set lvDE.SelectedItem = itmX
  AjusteListView Me, lvDE
  
  ' On efface les champs
  InitialiseChamps
  
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
  
  AjouteEvénement "H3"
  AjouteEvénement "H'3"
  AjouteEvénement "H4"
  AjouteEvénement "H5"
  AjusteListView Me, lvEvénements

  
  ' Chargement des combos
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcPers.AddItem u.uti_numuti, u.uti_nom
  Next
  
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



Private Sub bdcPers_GotFocus()
  SetStatus "Entrer le numéro de personne, ou sélectionner dans la liste (F4)"
End Sub

Private Sub bdcPers_LostFocus()
  bdcPers.Synchronise
End Sub


Private Sub bdcMilieu_GotFocus()
  SetStatus "Entrer le code gélose, ou sélectionner dans la liste (F4)"
End Sub

Private Sub bdcMilieu_LostFocus()
  bdcMilieu.Synchronise
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

Private Sub lvEvénements_Click()
  If lvEvénements.SelectedItem.Text = "H5" Then
    SetMode "H3"
    MDISaisieLabo.SaisieSuperEvénement "H5"
  Else
    SetMode lvEvénements.SelectedItem.Text
  End If
End Sub

Private Sub txtInfo_GotFocus(Index As Integer)
  SetStatus txtInfo(Index).Tag
  AutoSelect txtInfo(Index)
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

Private Sub txtNumSS_GotFocus()
  AutoSelect txtNumSS
End Sub
