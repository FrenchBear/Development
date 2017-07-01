VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm MDIDocConsultants 
   BackColor       =   &H8000000C&
   Caption         =   "Gestion des documents consultants"
   ClientHeight    =   7215
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   10605
   Icon            =   "MDIDocConsultants.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
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
         NumButtons      =   10
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.Tag             =   "K"
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "TypesPrestation"
            Object.ToolTipText     =   "Types de prestation"
            Object.Tag             =   "TP"
            ImageKey        =   "imgTypePrestation"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "SecteursActivité"
            Object.ToolTipText     =   "Secteurs d'activité"
            Object.Tag             =   "SA"
            ImageKey        =   "imgSecteurActivité"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Systèmes"
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "DocConsultants"
            Object.ToolTipText     =   "Saisie des documents"
            Object.Tag             =   "Doc"
            ImageKey        =   "imgUnDocument"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Copie"
            Object.ToolTipText     =   "Copie les données dans le presse-papiers"
            Object.Tag             =   "Copie"
            ImageKey        =   "imgCopie"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Impr"
            Object.ToolTipText     =   "Imprime les enregistrements sélectionnés"
            Object.Tag             =   "Impr"
            ImageKey        =   "imgImprime"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Aperçu"
            Object.ToolTipText     =   "Aperçu avant impression"
            Object.Tag             =   "Aper"
            ImageKey        =   "imgAperçu"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
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
            Picture         =   "MDIDocConsultants.frx":0442
            Key             =   "Utilisateur"
            Object.ToolTipText     =   "Utilisateur connecté"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Picture         =   "MDIDocConsultants.frx":0994
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
      Left            =   8220
      Top             =   1320
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
            Picture         =   "MDIDocConsultants.frx":0D16
            Key             =   "imgUnDocument"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIDocConsultants.frx":1030
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIDocConsultants.frx":134A
            Key             =   "imgTypePrestation"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIDocConsultants.frx":1664
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIDocConsultants.frx":197E
            Key             =   "imgSecteurActivité"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIDocConsultants.frx":1C98
            Key             =   "imgCopie"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIDocConsultants.frx":1DAA
            Key             =   "imgImprime"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIDocConsultants.frx":1EBC
            Key             =   "imgExplorer"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIDocConsultants.frx":2024
            Key             =   "imgAperçu"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuTable 
      Caption         =   "&Table"
      Begin VB.Menu cmdTypesPrestation 
         Caption         =   "&Types de prestation"
      End
      Begin VB.Menu cmdSecteursActivité 
         Caption         =   "&Secteurs d'activité"
      End
      Begin VB.Menu sep8 
         Caption         =   "-"
      End
      Begin VB.Menu cmdDocConsultants 
         Caption         =   "&Documents consultants"
      End
      Begin VB.Menu sep9 
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
      Begin VB.Menu sep3b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdCopie 
         Caption         =   "C&opier"
         Shortcut        =   ^C
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
Attribute VB_Name = "MDIDocConsultants"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' mdiDocConsultants
' Feuille MDI principale de la gestion des documents consultants
'  5/05/1998 PV
' 15/07/1998 PV 1.1 Identification de l'utilisateur
'  4/08/1998 PV NoPreviousInstance
' 15/08/1998 PV ChargementInitialCommun, VBLibODBC, frmMsgBoxTimer, sAjusteMessageODBC, BDActiveChamp
' 30/03/1999 PV 1.2 Impression
' 16/04/1999 PV Rattrappage général d'erreurs sur effacement d'enregistrement
'  7/07/1999 PV Source ODBC par défaut dans la registry
' 12/08/1999 PV Chargement tardif des collections générales


Option Explicit


Private Sub ChargementInitial(ByVal bDemandeSource As Boolean)
  ChargementInitialCommun Me, bDemandeSource, frmBDODBCLogon.GetSourceODBCDéfaut()
End Sub


Private Sub cmdOptions_Click()
  frmOptions.Show
End Sub

Private Sub cmdUtilisateur_Click()
  Dim f As Form
  For Each f In Forms
    If Not f Is MDIDocConsultants Then Unload f
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fenêtres document avant de changer d'utilisateur !"
    Exit Sub
  End If
  
  If frmBDLogin.iInitUtilisateur(False, True) = 0 Then
    sbStatus.Panels("Utilisateur") = sNomOpérateur & " (" & iNumOpérateur & ")"
  End If
End Sub

Private Sub cmdConfiguration_Click()
  Dim f As Form
  For Each f In Forms
    If Not f Is MDIDocConsultants Then Unload f
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

Private Sub cmdImpr_Click()
  On Error Resume Next
  If Left(TypeName(ActiveForm), 2) = "dr" Then    ' DataReport
    ActiveForm.PrintReport
  Else
    ActiveForm.Imprime
  End If
End Sub

Private Sub cmdAperçu_Click()
  On Error Resume Next
  ActiveForm.Aperçu
End Sub


Private Sub MDIForm_Load()
  ' Internationalisation
  IntlInit

  Caption = App.Title & " - " & App.FileDescription
  NoPreviousInstance Me
  sVersionApp = App.Major & "." & App.Minor & "." & App.Revision
  
  ' Retouche des raccourcis menus (raccourcis que l'on ne peut pas définir dans l'éditeur de menus)
  cmdQuery.Caption = cmdQuery.Caption & Chr(9) & "?"
  cmdFermer.Caption = cmdFermer.Caption & Chr(9) & "Ctrl+F4"
  cmdQuitter.Caption = cmdQuitter.Caption & Chr(9) & "Alt+F4"
  cmdFirst.Caption = cmdFirst.Caption & Chr(9) & "Début"
  cmdPrevious.Caption = cmdPrevious.Caption & Chr(9) & "-"
  cmdNext.Caption = cmdNext.Caption & Chr(9) & "+"
  cmdLast.Caption = cmdLast.Caption & Chr(9) & "Fin"
  cmdAdd.Caption = cmdAdd.Caption & Chr(9) & "A"
  cmdChange.Caption = cmdChange.Caption & Chr(9) & "C"
  cmdDelete.Caption = cmdDelete.Caption & Chr(9) & "Suppr"
  
  AjusteMenus 0
  AjusteEtiquettesBoutons tbBoutons

  Show
  ChargementInitial bShiftPressed
End Sub


Private Sub cmdTypesPrestation_Click()
  Dim f
  If bShiftPressed Then
    Set f = New frmTypePrestation
  Else
    Set f = frmTypePrestation
  End If
  f.Show
  f.ZOrder 0
  AjusteMenus 0
End Sub

Private Sub cmdSecteursActivité_Click()
  Dim f
  If bShiftPressed Then
    Set f = New frmSecteurActivité
  Else
    Set f = frmSecteurActivité
  End If
  f.Show
  f.ZOrder 0
  AjusteMenus 0
End Sub

Private Sub cmdDocConsultants_Click()
  Dim f
  If bShiftPressed Then
    Set f = New frmDocConsultants
  Else
    Set f = frmDocConsultants
  End If
  f.Show
  f.ZOrder 0
  AjusteMenus 0
End Sub



Private Sub cmdQuitter_Click()
  Unload Me
End Sub


Private Sub cmdCascade_Click()
  MDIDocConsultants.Arrange vbCascade
End Sub

Private Sub cmdRéorganiser_Click()
  MDIDocConsultants.Arrange vbArrangeIcons
End Sub

Private Sub cmdMosaïque_Click()
  MDIDocConsultants.Arrange vbTileHorizontal
End Sub


Private Sub cmdAPropos_Click()
  frmAbout.APropos Me.Icon
End Sub


' ===============================================================================
' Synchronisation des menus

Private Sub mnuEnregistrement_Click()
  Dim f As Form
  
  Set f = ActiveForm
  cmdQuery.Enabled = f.bdSél.ButtonEnabled("Query")

  cmdFirst.Enabled = f.bdSél.ButtonEnabled("First")
  cmdPrevious.Enabled = f.bdSél.ButtonEnabled("Previous")
  cmdNext.Enabled = f.bdSél.ButtonEnabled("Next")
  cmdLast.Enabled = f.bdSél.ButtonEnabled("Last")

  cmdAdd.Enabled = f.bdSél.ButtonEnabled("Add")
  cmdChange.Enabled = f.bdSél.ButtonEnabled("Change")
  cmdDelete.Enabled = f.bdSél.ButtonEnabled("Delete")
End Sub


Public Sub AjusteMenus(ByVal iOffset As Integer)
  Dim iNbFeuillesChargées As Integer, f As Form
  iNbFeuillesChargées = iOffset
  For Each f In Forms
    If f.Tag = "Données" Then iNbFeuillesChargées = iNbFeuillesChargées + 1
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

Private Sub cmdQuery_Click():     ActiveForm.ActionQuery:   End Sub
Private Sub cmdFirst_Click():     ActiveForm.ActionFirst:   End Sub
Private Sub cmdPrevious_Click():  ActiveForm.ActionFirst:   End Sub
Private Sub cmdNext_Click():      ActiveForm.ActionNext:    End Sub
Private Sub cmdLast_Click():      ActiveForm.ActionLast:    End Sub
Private Sub cmdAdd_Click():       ActiveForm.ActionAdd:     End Sub
Private Sub cmdChange_Click():    ActiveForm.ActionChange:  End Sub
Private Sub cmdDelete_Click():    ActiveForm.ActionDelete:  End Sub

Private Sub cmdWeb_Click():
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
    Case "TypesPrestation":   cmdTypesPrestation_Click
    Case "SecteursActivité":  cmdSecteursActivité_Click
    Case "DocConsultants":    cmdDocConsultants_Click
    
    Case "Web":               cmdWeb_Click
    Case "Impr":              cmdImpr_Click
    Case "Aperçu":            cmdAperçu_Click
    Case "Copie":             cmdCopie_Click
    
    Case Else:                Stop
  End Select
End Sub

Private Sub tbBoutons_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
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

