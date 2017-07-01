VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmConfigImprimante 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Configuration des imprimantes"
   ClientHeight    =   3780
   ClientLeft      =   1710
   ClientTop       =   2565
   ClientWidth     =   8250
   Icon            =   "frmConfigImprimante.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   252
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   550
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton btnCodesBacs 
      Height          =   330
      Left            =   6120
      Picture         =   "frmConfigImprimante.frx":0442
      Style           =   1  'Graphical
      TabIndex        =   20
      Tag             =   "Cliquer pour sélectionner la date dans un calendrier."
      Top             =   60
      Width           =   315
   End
   Begin VB.Frame fraImpAiguilles 
      Caption         =   "Imprimantes à aiguilles"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   60
      TabIndex        =   9
      Top             =   2160
      Width           =   6675
      Begin VB.TextBox txtBacAP 
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
         Left            =   6000
         MaxLength       =   2
         TabIndex        =   15
         Tag             =   "Bac à papier (pour Windows)"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtBacFP 
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
         Left            =   6000
         MaxLength       =   2
         TabIndex        =   12
         Tag             =   "Bac à papier (pour Windows)"
         Top             =   300
         Width           =   495
      End
      Begin VB.ComboBox cboAiguillesFP 
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
         ItemData        =   "frmConfigImprimante.frx":058C
         Left            =   1380
         List            =   "frmConfigImprimante.frx":058E
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Tag             =   "Choisissez l'imprimante pour les fiches de prélèvement"
         Top             =   300
         Width           =   4515
      End
      Begin VB.ComboBox cboAiguillesAP 
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
         ItemData        =   "frmConfigImprimante.frx":0590
         Left            =   1380
         List            =   "frmConfigImprimante.frx":0592
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   14
         Tag             =   "Choisissez l'imprimante pour les bons de livraison"
         Top             =   720
         Width           =   4515
      End
      Begin VB.Label lblFP 
         Caption         =   "&FP :"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   180
         TabIndex        =   10
         Top             =   360
         Width           =   1035
      End
      Begin VB.Label lblAP 
         Caption         =   "&AP :"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   180
         TabIndex        =   13
         Top             =   780
         Width           =   1035
      End
   End
   Begin VB.Frame fraImpLaser 
      Caption         =   "Imprimantes laser"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1635
      Left            =   60
      TabIndex        =   0
      Top             =   360
      Width           =   6675
      Begin VB.TextBox txtBacEtiquettes 
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
         Left            =   6000
         MaxLength       =   2
         TabIndex        =   6
         Tag             =   "Bac à papier (pour Windows)"
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox txtBacPlannings 
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
         Left            =   6000
         MaxLength       =   2
         TabIndex        =   3
         Tag             =   "Bac à papier (pour Windows)"
         Top             =   300
         Width           =   495
      End
      Begin VB.ComboBox cboLaserDocuments 
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
         ItemData        =   "frmConfigImprimante.frx":0594
         Left            =   1380
         List            =   "frmConfigImprimante.frx":0596
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         Tag             =   "Choisissez l'imprimante pour les fiches de prélèvement"
         Top             =   1140
         Width           =   4515
      End
      Begin VB.ComboBox cboLaserPlannings 
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
         ItemData        =   "frmConfigImprimante.frx":0598
         Left            =   1380
         List            =   "frmConfigImprimante.frx":059A
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Tag             =   "Choisissez l'imprimante pour les fiches de prélèvement"
         Top             =   300
         Width           =   4515
      End
      Begin VB.ComboBox cboLaserEtiquettes 
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
         ItemData        =   "frmConfigImprimante.frx":059C
         Left            =   1380
         List            =   "frmConfigImprimante.frx":059E
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Tag             =   "Choisissez l'imprimante pour les fiches de prélèvement"
         Top             =   720
         Width           =   4515
      End
      Begin VB.Label lblDocuments 
         AutoSize        =   -1  'True
         Caption         =   "&Documents :"
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
         Left            =   180
         TabIndex        =   7
         Top             =   1200
         Width           =   1185
      End
      Begin VB.Label lblEtiquettes 
         AutoSize        =   -1  'True
         Caption         =   "&Etiquettes :"
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
         Left            =   180
         TabIndex        =   4
         Top             =   780
         Width           =   1110
      End
      Begin VB.Label lblPlannings 
         AutoSize        =   -1  'True
         Caption         =   "&Plannings :"
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
         Left            =   180
         TabIndex        =   1
         Top             =   360
         Width           =   1050
      End
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
      Left            =   6840
      TabIndex        =   18
      Top             =   960
      Width           =   1350
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
      Left            =   6840
      TabIndex        =   16
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
      Left            =   6840
      TabIndex        =   17
      Top             =   480
      Width           =   1350
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   19
      Top             =   3465
      Width           =   8250
      _ExtentX        =   14552
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
End
Attribute VB_Name = "frmConfigImprimante"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Gère le choix des imprimantes"
' frmConfigImprimante
' Gère le choix des imprimantes
' 24/11/96    Gestion de la liste via collection
' 17/03/97    Imprimantes wprint
'  1/02/99 PV Internationalisation
' 28/04/00 PV Contrôle du choix des imprimantes lors de la validation par Ok
' 16/11/00 PV Laser étiquettes
'  6/12/00 PV Gestion des bacs
' 28/12/00 PV Prise en compte de toutes les imprimantes Windows

Option Explicit

Private sSystèmeOrigine As String                 ' Nom du système qui a fourni la liste des imprimantes
Private colImprimantesLaser As New Collection     ' Liste d'imprimantes laser disponibles
Private colImprimantesAiguilles As New Collection ' Liste d'imprimantes à aiguilles disponibles

Private Const sSéparateur = "……"

Public Function bOkImprimantes() As Boolean
  If sImprimanteEtiquettes = "" Or sImprimantePlannings = "" Or sImprimanteDocuments = "" Or sImprimanteAP = "" Or sImprimanteFP = "" Then Show vbModal
  bOkImprimantes = sImprimantePlannings <> "" And sImprimanteEtiquettes <> "" And sImprimanteDocuments <> "" And sImprimanteAP <> "" And sImprimanteFP <> ""
End Function

Public Sub InitImprimantes()
  sImprimantePlannings = GetSetting(sApplicationGlobale, "Impression", "ImprimanteLaserPlan." & sSystèmeDistant, "[Win]")
  iBacPlannings = GetSetting(sApplicationGlobale, "Impression", "BacPlannings." & sSystèmeDistant, 0)
  sImprimanteDocuments = GetSetting(sApplicationGlobale, "Impression", "ImprimanteLaser." & sSystèmeDistant, "[Win]")
  ' Pas de bac pour les documents actuellement
  sImprimanteEtiquettes = GetSetting(sApplicationGlobale, "Impression", "ImprimanteLaserEtiq." & sSystèmeDistant, "[Win]")
  iBacEtiquettes = GetSetting(sApplicationGlobale, "Impression", "BacEtiquettes." & sSystèmeDistant, 0)
  sImprimanteAP = GetSetting(sApplicationGlobale, "Impression", "ImprimanteAiguillesBL." & sSystèmeDistant, "[Win]")
  iBacAP = GetSetting(sApplicationGlobale, "Impression", "BacBL." & sSystèmeDistant, 0)
  sImprimanteFP = GetSetting(sApplicationGlobale, "Impression", "ImprimanteAiguillesFP." & sSystèmeDistant, "[Win]")
  iBacFP = GetSetting(sApplicationGlobale, "Impression", "BacFP." & sSystèmeDistant, 0)
  
  If sImprimantePlannings = "" Or sImprimanteEtiquettes = "" Or sImprimanteDocuments = "" Or sImprimanteAP = "" Or sImprimanteFP = "" Then Show vbModal
  frmPlanning.sbStatus.Panels("Impr").Text = sImprimantePlannings & ", " & sImprimanteEtiquettes & ", " & sImprimanteDocuments & ", " & sImprimanteFP & ", " & sImprimanteAP
End Sub


Private Sub btnAide_Click()
  Aide "frmconfi"
End Sub

Private Sub btnCodesBacs_Click()
  frmCodesBacs.Show vbModal
End Sub

Private Sub btnAnnuler_Click()
  Unload Me
End Sub

Private Sub MémoriseImprimantes()
  DémonJournalUnix "Impression", "ChoixImprimante", "LaserPlan=" & sImprimantePlannings & "|LaserEtiq=" & sImprimanteEtiquettes & "|AiguillesBL=" & sImprimanteAP & "|AiguillesFP=" & sImprimanteFP
  
  SaveSetting sApplicationGlobale, "Impression", "ImprimanteLaserPlan." & sSystèmeDistant, sImprimantePlannings
  SaveSetting sApplicationGlobale, "Impression", "BacPlannings." & sSystèmeDistant, iBacPlannings
  SaveSetting sApplicationGlobale, "Impression", "ImprimanteLaserEtiq." & sSystèmeDistant, sImprimanteEtiquettes
  SaveSetting sApplicationGlobale, "Impression", "BacEtiquettes." & sSystèmeDistant, iBacEtiquettes
  SaveSetting sApplicationGlobale, "Impression", "ImprimanteLaser." & sSystèmeDistant, sImprimanteDocuments
  SaveSetting sApplicationGlobale, "Impression", "ImprimanteAiguillesBL." & sSystèmeDistant, sImprimanteAP
  SaveSetting sApplicationGlobale, "Impression", "BacBL." & sSystèmeDistant, iBacAP
  SaveSetting sApplicationGlobale, "Impression", "ImprimanteAiguillesFP." & sSystèmeDistant, sImprimanteFP
  SaveSetting sApplicationGlobale, "Impression", "BacFP." & sSystèmeDistant, iBacFP
End Sub


Private Function bOkBac(txtBac As TextBox, ByRef iBCh As Integer) As Boolean
  iBCh = Val(txtBac)
  If iBCh < 0 Or iBCh > 20 Then
    MsgBox "Bac incorrect.", vbExclamation, App.Title
    txtBac.SetFocus
    AutoSelect txtBac, True
    bOkBac = False
  Else
    bOkBac = True
  End If
End Function


' Retourne le nom de l'imprimante, la partie avant sSéparateur ou le texte complet
Private Function sNomImp(sTxt) As String
  Dim p As Integer
  p = InStr(1, sTxt, sSéparateur)
  If p = 0 Then p = Len(sTxt) + 1
  sNomImp = Left(sTxt, p - 1)
End Function



Private Sub btnOk_Click()
  ' Imprimantes choisies
  Dim sIChPlannings As String, sIChEtiquettes As String, sImpDocumentsChoisie As String
  Dim sIChAP As String, sIChFP As String
  ' Bacs choisis
  Dim iBChPlannings As Integer, iBChEtiquettes As Integer
  Dim iBChAP As Integer, iBChFP As Integer
  
  If cboLaserPlannings.ListIndex >= 0 Then
    sIChPlannings = sNomImp(cboLaserPlannings.List(cboLaserPlannings.ListIndex))
  Else
    MsgBox2i "CFcboLaser.tag"
    cboLaserPlannings.SetFocus
    Exit Sub
  End If
  If Not bOkBac(txtBacPlannings, iBChPlannings) Then Exit Sub
  
  If cboLaserEtiquettes.ListIndex >= 0 Then
    sIChEtiquettes = sNomImp(cboLaserEtiquettes.List(cboLaserEtiquettes.ListIndex))
  Else
    MsgBox2i "CFcboLaser.tag"
    cboLaserEtiquettes.SetFocus
    Exit Sub
  End If
  If Not bOkBac(txtBacEtiquettes, iBChEtiquettes) Then Exit Sub

  If cboLaserDocuments.ListIndex >= 0 Then
    sImpDocumentsChoisie = sNomImp(cboLaserDocuments.List(cboLaserDocuments.ListIndex))
  Else
    MsgBox2i "CFcboLaser.tag"
    cboLaserDocuments.SetFocus
    Exit Sub
  End If

  If cboAiguillesAP.ListIndex >= 0 Then
    sIChAP = sNomImp(cboAiguillesAP.List(cboAiguillesAP.ListIndex))
  Else
    MsgBox2i "CIcboAiguillesAP.tag"
    cboAiguillesAP.SetFocus
    Exit Sub
  End If
  If Not bOkBac(txtBacAP, iBChAP) Then Exit Sub
  
  If cboAiguillesFP.ListIndex >= 0 Then
    sIChFP = sNomImp(cboAiguillesFP.List(cboAiguillesFP.ListIndex))
  Else
    MsgBox2i "CIcboAiguillesFP.tag"
    cboAiguillesFP.SetFocus
    Exit Sub
  End If
  If Not bOkBac(txtBacFP, iBChFP) Then Exit Sub
  
  If sImprimantePlannings <> sIChPlannings Or _
     sImprimanteEtiquettes <> sIChEtiquettes Or _
     sImprimanteDocuments <> sImpDocumentsChoisie Or _
     sImprimanteAP <> sIChAP Or _
     sImprimanteFP <> sIChFP Or _
     iBChPlannings <> iBacPlannings Or iBChEtiquettes <> iBacEtiquettes Or _
     iBChAP <> iBacAP Or iBChFP <> iBacFP Then
     
    sImprimantePlannings = sIChPlannings
    sImprimanteEtiquettes = sIChEtiquettes
    sImprimanteDocuments = sImpDocumentsChoisie
    sImprimanteAP = sIChAP
    sImprimanteFP = sIChFP
    iBacPlannings = iBChPlannings
    iBacEtiquettes = iBChEtiquettes
    iBacAP = iBChAP
    iBacFP = iBChFP
    
    MémoriseImprimantes
    frmPlanning.sbStatus.Panels("Impr").Text = sImprimantePlannings & ", " & sImprimanteEtiquettes & ", " & sImprimanteDocuments & ", " & sImprimanteFP & ", " & sImprimanteAP
  End If
  
  Unload Me
End Sub


Private Sub Form_Activate()
  Dim s As Variant, i As Integer
  
  cboLaserEtiquettes.Clear
  cboLaserDocuments.Clear
  cboLaserPlannings.Clear
  For Each s In colImprimantesLaser
    cboLaserPlannings.AddItem s
    cboLaserEtiquettes.AddItem s
    cboLaserDocuments.AddItem s
  Next
  
  For i = 0 To cboLaserPlannings.ListCount - 1
    If StrComp(sImprimantePlannings, sNomImp(cboLaserPlannings.List(i)), vbTextCompare) = 0 Then
      cboLaserPlannings.ListIndex = i
      Exit For
    End If
  Next
  txtBacPlannings = iBacPlannings
  
  For i = 0 To cboLaserEtiquettes.ListCount - 1
    If StrComp(sImprimanteEtiquettes, sNomImp(cboLaserEtiquettes.List(i)), vbTextCompare) = 0 Then
      cboLaserEtiquettes.ListIndex = i
      Exit For
    End If
  Next
  txtBacEtiquettes = iBacEtiquettes
  
  For i = 0 To cboLaserDocuments.ListCount - 1
    If StrComp(sImprimanteDocuments, sNomImp(cboLaserDocuments.List(i)), vbTextCompare) = 0 Then
      cboLaserDocuments.ListIndex = i
      Exit For
    End If
  Next
  
  
  cboAiguillesAP.Clear
  cboAiguillesFP.Clear
  For Each s In colImprimantesAiguilles
    cboAiguillesAP.AddItem s
    If StrComp(sImprimanteAP, sNomImp(s), vbTextCompare) = 0 Then cboAiguillesAP.ListIndex = cboAiguillesAP.NewIndex
    cboAiguillesFP.AddItem s
    If StrComp(sImprimanteFP, sNomImp(s), vbTextCompare) = 0 Then cboAiguillesFP.ListIndex = cboAiguillesFP.NewIndex
  Next
  txtBacAP = iBacAP
  txtBacFP = iBacFP
End Sub


Sub ChargeListeImprimantes()
  Dim sLigne As String, i As Integer
  Dim sNomImp As String, sCommentaire As String
  Dim br As New Rev
  
  ' Si la liste est en mémoire, terminé !
  If sSystèmeOrigine = sSystèmeDistant Then Exit Sub
  
  sSystèmeOrigine = sSystèmeDistant
  cboLaserPlannings.Clear
  cboLaserEtiquettes.Clear
  cboAiguillesAP.Clear
  cboAiguillesFP.Clear
  For i = 1 To colImprimantesLaser.count
    colImprimantesLaser.Remove 1
  Next
  For i = 1 To colImprimantesAiguilles.count
    colImprimantesAiguilles.Remove 1
  Next
    
  br.AddField 1       ' Enum imprimantes classe 1(laser) + 16(wprint)
  Bloquer
    tcps.Envoie "EIMP " & br.Buffer
    
    Do
      sLigne = tcps.Reçoit
      If Left(sLigne, 2) = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sNomImp, sCommentaire
      colImprimantesLaser.Add sNomImp & sSéparateur & sCommentaire
    Loop
  
    br.Clear
    br.AddField 2       ' Enum imprimantes classe 2 (aiguilles)
    tcps.Envoie "EIMP " & br.Buffer
    
    Do
      sLigne = tcps.Reçoit
      If Left(sLigne, 2) = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sNomImp, sCommentaire
      colImprimantesAiguilles.Add sNomImp & sSéparateur & sCommentaire
    Loop
    
    ' A internationaliser (mais pas [Nul] ni [Win])
    colImprimantesAiguilles.Add "[Nul]" & sSéparateur & sNoPrinter
    colImprimantesAiguilles.Add "[Win]" & sSéparateur & sDefaultPrinter
    Dim p As Printer
    For Each p In Printers
      colImprimantesAiguilles.Add "[Win] " & p.DeviceName
    Next
    
    colImprimantesLaser.Add "[Nul]" & sSéparateur & sNoPrinter
    colImprimantesLaser.Add "[Win]" & sSéparateur & sDefaultPrinter
    For Each p In Printers
      colImprimantesLaser.Add "[Win] " & p.DeviceName
    Next
  Relâcher
End Sub


Private Sub Form_Load()
  Internationalisation
  
  ChargeListeImprimantes
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


Private Sub cboLaserPlannings_GotFocus(): GotFocus: End Sub
Private Sub txtBacPlannings_GotFocus(): GotFocus: End Sub
Private Sub cboLaserEtiquettes_GotFocus(): GotFocus: End Sub
Private Sub txtBacEtiquettes_GotFocus(): GotFocus: End Sub
Private Sub cboAiguillesAP_GotFocus(): GotFocus: End Sub
Private Sub txtBacAP_GotFocus(): GotFocus: End Sub
Private Sub cboAiguillesFP_GotFocus(): GotFocus: End Sub
Private Sub txtBacFP_GotFocus(): GotFocus: End Sub
Private Sub btnOk_GotFocus(): GotFocus: End Sub
Private Sub btnAnnuler_GotFocus(): GotFocus: End Sub
Private Sub btnAide_GotFocus(): GotFocus: End Sub




'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "CICaption"
  
  SetLib btnOK, "Caption", "btnOK"
  SetLib btnAnnuler, "Caption", "btnAnnuler"
  SetLib btnAide, "Caption", "btnAide"
  
  SetLib fraImpLaser, "Caption", "CIfraImpLaser"
  SetLib lblPlannings, "Caption", "CIlblPlannings"
  SetLib lblEtiquettes, "Caption", "CIlblEtiquettes"
  SetLib lblDocuments, "Caption", "CIlblDocuments"
  SetLib cboLaserPlannings, "Tag", "CIcboLaser.tag"
  SetLib cboLaserEtiquettes, "Tag", "CIcboLaserEtiq.tag"
  SetLib cboLaserDocuments, "Tag", "CIcboLaserDoc.tag"
  SetLib fraImpAiguilles, "Caption", "CIfraImpAiguilles"
  SetLib lblFP, "Caption", "CIlblFp"
  SetLib cboAiguillesFP, "Tag", "CIcboAiguillesFP.tag"
  SetLib lblAP, "Caption", "CIlblAP"
  SetLib cboAiguillesAP, "Tag", "CIcboAiguillesAP.tag"
End Sub

