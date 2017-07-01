VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.MDIForm MDIGrilles 
   BackColor       =   &H8000000C&
   Caption         =   "Grilles d'évaluation"
   ClientHeight    =   7215
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   10605
   Icon            =   "MDIGrilles.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Timer timMédor 
      Left            =   1860
      Top             =   1140
   End
   Begin MSComDlg.CommonDialog cdPrinter 
      Left            =   720
      Top             =   1440
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10605
      _ExtentX        =   18706
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      Appearance      =   1
      ImageList       =   "ilAdmin"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   12
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Items"
            Object.ToolTipText     =   "Gestion des items"
            Object.Tag             =   "Items"
            ImageKey        =   "imgItems"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "LS"
            Object.ToolTipText     =   "Libellés standard"
            Object.Tag             =   "LS"
            ImageKey        =   "imgLS"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Section"
            Object.ToolTipText     =   "Gestion des titres de section"
            Object.Tag             =   "Sect"
            ImageKey        =   "imgSection"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Structure"
            Object.ToolTipText     =   "Constitution des grilles"
            Object.Tag             =   "Struct"
            ImageKey        =   "imgStruct"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Scénario"
            Object.ToolTipText     =   "Scénario des grilles"
            Object.Tag             =   "Scén"
            ImageKey        =   "imgScénario"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Copie"
            Object.ToolTipText     =   "Copie les données dans le presse-papiers"
            Object.Tag             =   "Cop"
            ImageKey        =   "imgCopie"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Impr"
            Object.ToolTipText     =   "Impression"
            Object.Tag             =   "Imp"
            ImageKey        =   "imgImpr"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Aperçu"
            Object.ToolTipText     =   "Aperçu avant impression"
            Object.Tag             =   "Aper"
            ImageKey        =   "imgAperçu"
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Web"
            Object.ToolTipText     =   "Affiche les informations sur le Web"
            Object.Tag             =   "Web"
            ImageKey        =   "imgExplorer"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   1
      Top             =   6900
      Width           =   10605
      _ExtentX        =   18706
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   10213
            Key             =   "Message"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5292
            MinWidth        =   5292
            Picture         =   "MDIGrilles.frx":014A
            Key             =   "Utilisateur"
            Object.ToolTipText     =   "Utilisateur connecté"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Picture         =   "MDIGrilles.frx":069C
            Key             =   "DataSource"
            Object.ToolTipText     =   "Source de données"
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
   Begin MSComctlLib.ImageList ilAdmin 
      Left            =   660
      Top             =   720
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   9
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIGrilles.frx":0A1E
            Key             =   "imgCopie"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIGrilles.frx":0B30
            Key             =   "imgExplorer"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIGrilles.frx":0C94
            Key             =   "imgAperçu"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIGrilles.frx":0DF8
            Key             =   "imgImpr"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIGrilles.frx":0F0C
            Key             =   "imgStruct"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIGrilles.frx":1068
            Key             =   "imgItems"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIGrilles.frx":11CC
            Key             =   "imgScénario"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIGrilles.frx":1328
            Key             =   "imgLS"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIGrilles.frx":1484
            Key             =   "imgSection"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuTable 
      Caption         =   "&Table"
      Begin VB.Menu cmdItems 
         Caption         =   "&Items…"
         Shortcut        =   ^I
      End
      Begin VB.Menu cmdLS 
         Caption         =   "&Libellés standard…"
         Shortcut        =   ^L
      End
      Begin VB.Menu cmdSection 
         Caption         =   "&Titres de section…"
         Shortcut        =   ^T
      End
      Begin VB.Menu sepc 
         Caption         =   "-"
      End
      Begin VB.Menu cmdStructure 
         Caption         =   "&Structure des grilles…"
         Shortcut        =   ^G
      End
      Begin VB.Menu cmdScénario 
         Caption         =   "S&cénarios…"
         Shortcut        =   ^S
      End
      Begin VB.Menu sepb 
         Caption         =   "-"
      End
      Begin VB.Menu cmdConfiguration 
         Caption         =   "&Source de données…"
      End
      Begin VB.Menu cmdUtilisateur 
         Caption         =   "&Utilisateur…"
      End
      Begin VB.Menu cmdOptions 
         Caption         =   "&Options…"
      End
      Begin VB.Menu sep0 
         Caption         =   "-"
      End
      Begin VB.Menu cmdFermer 
         Caption         =   "&Fermer"
         Visible         =   0   'False
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuEnregistrement 
      Caption         =   "&Enregistrement"
      Begin VB.Menu cmdQuery 
         Caption         =   "&Rechercher"
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu cmdFirst 
         Caption         =   "&Premier"
      End
      Begin VB.Menu cmdPrevious 
         Caption         =   "P&récédent"
      End
      Begin VB.Menu cmdNext 
         Caption         =   "&Suivant"
      End
      Begin VB.Menu cmdLast 
         Caption         =   "&Dernier"
      End
      Begin VB.Menu sep3 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAdd 
         Caption         =   "&Ajouter"
      End
      Begin VB.Menu cmdChange 
         Caption         =   "&Changer"
      End
      Begin VB.Menu cmdDelete 
         Caption         =   "&Supprimer"
      End
      Begin VB.Menu sep4b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdTableau 
         Caption         =   "&Tableau"
      End
      Begin VB.Menu sep3b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdCopie 
         Caption         =   "C&opier enregistrement"
      End
      Begin VB.Menu cmdCopieTableau 
         Caption         =   "Co&pier tableau"
      End
      Begin VB.Menu sep3d 
         Caption         =   "-"
      End
      Begin VB.Menu cmdMémorise 
         Caption         =   "&Mémoriser"
      End
      Begin VB.Menu sep3c 
         Caption         =   "-"
      End
      Begin VB.Menu cmdImpr 
         Caption         =   "&Imprimer"
      End
      Begin VB.Menu cmdAperçu 
         Caption         =   "Aperçu a&vant impression…"
      End
   End
   Begin VB.Menu mnuCommandes 
      Caption         =   "&Commandes"
      Begin VB.Menu cmdUnregistrerNAV2000 
         Caption         =   "&Unregister Norton AntiVirus OfficeAV.DLL add-in"
      End
      Begin VB.Menu cmdRegistrerNAV2000 
         Caption         =   "&Register Norton AntiVirus OfficeAV.DLL add-in"
      End
      Begin VB.Menu sepa 
         Caption         =   "-"
      End
      Begin VB.Menu cmdCopierLS 
         Caption         =   "Copier les LS privés sur une nouvelle grille"
      End
      Begin VB.Menu cmdImporter 
         Caption         =   "&Importer des données..."
      End
   End
   Begin VB.Menu mnuFenêtre 
      Caption         =   "Fe&nêtre"
      WindowList      =   -1  'True
      Begin VB.Menu cmdWeb 
         Caption         =   "&Web"
      End
      Begin VB.Menu sep4 
         Caption         =   "-"
      End
      Begin VB.Menu cmdCascade 
         Caption         =   "&Cascade"
      End
      Begin VB.Menu cmdMosaïque 
         Caption         =   "&Mosaïque"
      End
      Begin VB.Menu cmdRéorganiser 
         Caption         =   "&Réorganiser les icônes"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&Aide"
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A Propos de…"
      End
   End
   Begin VB.Menu mnuBarreBoutons 
      Caption         =   "(PopUp BdB)"
      Visible         =   0   'False
      Begin VB.Menu cmdBdBEtiquettes 
         Caption         =   "&Etiquettes texte"
      End
   End
End
Attribute VB_Name = "MDIGrilles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MDIGrilles
' Feuille MDI principale de la gestion des tables de la facturation
' 25/08/1999 PV+NC
' 15/01/2000 PV Gestion de la langue de travail
'  5/06/2000 PV Mémoire F5 des items
' 10/07/2000 PV Début de la traduction de l'interface en anglais


Option Explicit


' Appelé à la connexion initiale, et après un changement d'identité d'utilisateur
' Autorisé au Service Informatique et au bit 6 des droits d'accès
Private Sub DétermineModeLectureSeule()
  ' Seul le Service Informatique ou les utilisateurs ayant le droit d'administration serveur (64) peuvent modifier les données
  bAdminServeur = colUtilisateur("U" & iNumOpérateur).uti_unite = 902 Or (colUtilisateur("U" & iNumOpérateur).uti_niveau And 64) <> 0
  bLectureSeule = Not bAdminServeur Or Not IsServeur
End Sub

Private Sub ChargementInitial(ByVal bDemandeSource As Boolean)
  ChargementInitialCommun Me, bDemandeSource, frmBDODBCLogon.GetSourceODBCDéfaut
  DétermineModeLectureSeule
End Sub


Private Sub cmdOptions_Click()
  frmOptions.Show
End Sub


Private Sub cmdUtilisateur_Click()
  Dim F As Form
  For Each F In Forms
    If Not F Is MDIGrilles Then Unload F
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fenêtres document avant de changer d'utilisateur !"
    Exit Sub
  End If
  
  If frmBDLogin.iInitUtilisateur(False, True) = 0 Then
    sbStatus.Panels("Utilisateur") = sNomOpérateur & " (" & iNumOpérateur & ")"
    DétermineModeLectureSeule
  End If
End Sub


Private Sub cmdConfiguration_Click()
  Dim F As Form
  For Each F In Forms
    If Not F Is MDIGrilles Then Unload F
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fenêtres document avant de changer la source de données !"
    Exit Sub
  End If
  
  ChargementInitial True
End Sub


Private Sub cmdCopie_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Copie
End Sub

Private Sub cmdCopieTableau_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.CopieTableau
End Sub

Private Sub cmdMémorise_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Mémorise
End Sub

Private Sub cmdImpr_Click()
'  On Error Resume Next
  If Left(TypeName(ActiveForm), 2) = "dr" Then    ' DataReport
    ActiveForm.PrintReport
  Else
    ActiveForm.Imprime
  End If
End Sub

Private Sub cmdAperçu_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Aperçu
End Sub

Private Sub cmdCopierLS_Click()
  If ActiveForm Is frmLS Then ActiveForm.CopierLS
End Sub

Private Sub cmdImporter_Click()
'  On Error Resume Next
  ActiveForm.Importer
End Sub

Private Sub mnuCommandes_Click()
  cmdCopierLS.Enabled = ActiveForm Is frmLS
End Sub


Private Sub MDIForm_Load()
  IntlInit
  Internationalisation

  NoPreviousInstance Me
  sVersionApp = App.Major & "." & App.Minor & "." & App.Revision
  
  ' Retouche des raccourcis menus (raccourcis que l'on ne peut pas définir dans l'éditeur de menus)
  cmdFermer.Caption = cmdFermer.Caption & Chr(9) & "Ctrl+F4"
  cmdQuitter.Caption = cmdQuitter.Caption & Chr(9) & "Alt+F4"
  
  frmOptions.InitOptions
  If InStr(1, Command, "-d") Then bDebug = True
  
  AjusteMenus 0
  AjusteEtiquettesBoutons tbBoutons
  
  Show
  ChargementInitial bShiftPressed
End Sub

Private Sub cmdItems_Click()
  On Error GoTo Problème

  Dim F
  If bShiftPressed Then
    Set F = New frmItem
  Else
    Set F = frmItem
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0

Problème:
End Sub

Private Sub cmdLS_Click()
  On Error GoTo Problème

  Dim F
  If bShiftPressed Then
    Set F = New frmLS
  Else
    Set F = frmLS
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0

Problème:
End Sub

Private Sub cmdSection_Click()
  On Error GoTo Problème

  Dim F
  If bShiftPressed Then
    Set F = New frmSection
  Else
    Set F = frmSection
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0

Problème:
End Sub


Private Sub cmdStructure_Click()
  On Error GoTo Problème

  Dim F
  If bShiftPressed Then
    Set F = New frmStructure
  Else
    Set F = frmStructure
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0

Problème:
End Sub

Private Sub cmdScénario_Click()
  On Error GoTo Problème

  Dim F
  If bShiftPressed Then
    Set F = New frmScénario
  Else
    Set F = frmScénario
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0

Problème:
End Sub

Private Sub cmdQuitter_Click()
  Unload Me
End Sub


Private Sub cmdCascade_Click()
  MDIGrilles.Arrange vbCascade
End Sub

Private Sub cmdRéorganiser_Click()
  MDIGrilles.Arrange vbArrangeIcons
End Sub

Private Sub cmdMosaïque_Click()
  MDIGrilles.Arrange vbTileHorizontal
End Sub


Private Sub cmdAPropos_Click()
  frmAbout.APropos Me.Icon
End Sub


Private Sub mnuEnregistrement_Click()
  Dim F As Form
  
  Set F = ActiveForm
  cmdQuery.Enabled = F.bdSél.ButtonEnabled("Query")

  cmdFirst.Enabled = F.bdSél.ButtonEnabled("First")
  cmdPrevious.Enabled = F.bdSél.ButtonEnabled("Previous")
  cmdNext.Enabled = F.bdSél.ButtonEnabled("Next")
  cmdLast.Enabled = F.bdSél.ButtonEnabled("Last")

  cmdAdd.Enabled = F.bdSél.ButtonEnabled("Add")
  cmdChange.Enabled = F.bdSél.ButtonEnabled("Change")
  cmdDelete.Enabled = F.bdSél.ButtonEnabled("Delete")
End Sub


Public Sub AjusteMenus(ByVal iOffset As Integer)
  Dim iNbFeuillesChargées As Integer, F As Form
  iNbFeuillesChargées = iOffset
  For Each F In Forms
    If F.Tag = "Données" Then iNbFeuillesChargées = iNbFeuillesChargées + 1
  Next
  
  Dim bFeuilleChargée As Boolean
  bFeuilleChargée = iNbFeuillesChargées > 0
  
  cmdFermer.Visible = bFeuilleChargée
  sep1.Visible = bFeuilleChargée
  mnuEnregistrement.Visible = bFeuilleChargée
  mnuFenêtre.Visible = bFeuilleChargée
  
  tbBoutons.Buttons("Copie").Enabled = bFeuilleChargée
  tbBoutons.Buttons("Impr").Enabled = bFeuilleChargée
  tbBoutons.Buttons("Aperçu").Enabled = bFeuilleChargée
  tbBoutons.Buttons("Web").Enabled = bFeuilleChargée
End Sub



' ===============================================================================
' Menus sous-traités aux feuilles de données

Private Sub cmdQuery_Click()
  ActiveForm.ActionQuery
End Sub

Private Sub cmdFirst_Click()
  ActiveForm.ActionFirst
End Sub

Private Sub cmdPrevious_Click()
  ActiveForm.ActionFirst
End Sub

Private Sub cmdNext_Click()
  ActiveForm.ActionNext
End Sub

Private Sub cmdLast_Click()
  ActiveForm.ActionLast
End Sub

Private Sub cmdAdd_Click()
  ActiveForm.ActionAdd
End Sub

Private Sub cmdChange_Click()
  ActiveForm.ActionChange
End Sub

Private Sub cmdDelete_Click()
  ActiveForm.ActionDelete
End Sub

Private Sub cmdTableau_Click()
  On Error Resume Next
  ActiveForm.ActionTabChange
End Sub

Private Sub cmdWeb_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.FenêtreWeb
End Sub

Private Sub sbStatus_PanelDblClick(ByVal Panel As MSComctlLib.Panel)
  Select Case Panel.Key
    Case "Utilisateur": cmdUtilisateur_Click
    Case "DataSource":  cmdConfiguration_Click
  End Select
End Sub

Private Sub tbBoutons_ButtonClick(ByVal Button As MSComctlLib.Button)
  tbBoutons.Refresh
  Select Case Button.Key
    Case "Items":       cmdItems_Click
    Case "LS":          cmdLS_Click
    Case "Section":     cmdSection_Click
    Case "Structure":   cmdStructure_Click
    Case "Scénario":    cmdScénario_Click
        
    Case "Web":         cmdWeb_Click
    Case "Impr":        cmdImpr_Click
    Case "Aperçu":      cmdAperçu_Click
    Case "Copie":       cmdCopie_Click
    
    Case Else:      Stop
  End Select
End Sub

Private Sub tbBoutons_MouseDown(Button As Integer, Shift As Integer, x As Single, Y As Single)
  If Button = 2 Then PopupMenu mnuBarreBoutons
End Sub

Private Sub mnuBarreBoutons_Click()
  cmdBdBEtiquettes.Checked = tbBoutons.Buttons(2).Caption <> ""
End Sub

Private Sub cmdBdBEtiquettes_Click()
  cmdBdBEtiquettes.Checked = Not cmdBdBEtiquettes.Checked
  SaveSetting App.EXEName, "Affichage", "Etiquettes", IIf(cmdBdBEtiquettes.Checked, 1, 0)
  AjusteEtiquettesBoutons tbBoutons
End Sub



'=================================================================================
' Problème d'erreur 2147417846 au lancement de Word via automation…
' http://support.microsoft.com/support/kb/articles/q243/5/79.asp?LNG=ENG&SA=ALLKB
' regsvr32 /u "c:\program files\norton antivirus\officeav.dll"

Private Sub cmdUnregistrerNAV2000_Click()
  RunCmd "regsvr32 /u ""c:\program files\norton antivirus\officeav.dll"""
End Sub

Private Sub cmdRegistrerNAV2000_Click()
  RunCmd "regsvr32 ""c:\program files\norton antivirus\officeav.dll"""
End Sub

Private Sub RunCmd(sCmd As String)
  sCmd = InputBox("Commande à exécuter ?", App.Title, sCmd)
  If sCmd = "" Then Exit Sub
  Shell sCmd, vbNormalFocus
End Sub




'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "F:" & App.Title & " - " & App.FileDescription & "%%A:" & App.Title & " - " & "Audit definition management"

  SetLib mnuTable, "Caption", "A:&Table"
  SetLib mnuEnregistrement, "Caption", "A:&Record"
  SetLib mnuCommandes, "Caption", "A:&Commands"
  SetLib mnuFenêtre, "Caption", "A:&Window"
  SetLib mnuAide, "Caption", "A:&Help"
  
  SetLib cmdConfiguration, "Caption", "A:Data source…"
  SetLib cmdUtilisateur, "Caption", "A:User…"
  SetLib cmdOptions, "Caption", "A:Options…"
  SetLib cmdFermer, "Caption", "A:Close"
  SetLib cmdQuitter, "Caption", "A:Exit"
  
  SetLib cmdQuery, "Caption", "F:Rechercher\t?%%A:Query\t?"
  SetLib cmdFirst, "Caption", "F:Premier\tDébut%%A:First\tHome"
  SetLib cmdPrevious, "Caption", "F:Précédent\t-%%A:Previous\t-"
  SetLib cmdNext, "Caption", "F:Suivant\t+%%A:Next\t+"
  SetLib cmdLast, "Caption", "F:Dernier\tFin%%A:Last\tEnd"
  SetLib cmdAdd, "Caption", "F:Ajouter\tA%%A:Add\tA"
  SetLib cmdChange, "Caption", "F:Changer\tC%%A:Change\tC"
  SetLib cmdDelete, "Caption", "F:Supprimer\tSuppr%%A:Delete\tDel"
  SetLib cmdTableau, "Caption", "F:Tableau\tT%%A:Grid\tT"
  SetLib cmdCopie, "Caption", "A:Record Copy"
  SetLib cmdCopieTableau, "Caption", "A:Grid Copy"
  SetLib cmdMémorise, "Caption", "A:Memorize"
  SetLib cmdImpr, "Caption", "A:Print"
  SetLib cmdAperçu, "Caption", "A:Print preview…"
  
  SetLib cmdAPropos, "Caption", "A:About…"
End Sub

' ===============================================================================
' Chien de garde

Public Sub ResetChienDeGarde()
  tMédor = Timer
  timMédor.Interval = 1000
End Sub

Private Sub timMédor_Timer()
  Dim t As Single
  t = Timer - tMédor
  If t < 0 And t > -1 Then t = 0        ' Imprécision du timer
  If t < 0 Then t = t + 24! * 60 * 60
  If t > 60 * 60 Then
    Dim sMsg As String
    sMsg = sIntlLib("F:Programme inactif depuis plus d'une heure, sortie du programme par le chien de garde.%%" & _
                    "A:Inactive application for more than one hour, exit by watchdog.")
    frmMsgBoxTimer.MsgBoxTimer sMsg, vbOKOnly, App.Title, 15
    EmergencyExit
  End If
End Sub
