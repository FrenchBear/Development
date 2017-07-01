VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.MDIForm MDIFacturation 
   BackColor       =   &H8000000C&
   Caption         =   "Gestion des tables de la facturation"
   ClientHeight    =   7215
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   10605
   Icon            =   "MDIFacturation.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin MSComDlg.CommonDialog cdPrinter 
      Left            =   9060
      Top             =   1620
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
            Key             =   "Grf"
            Object.ToolTipText     =   "Gestion des groupements"
            Object.Tag             =   "Grf"
            ImageKey        =   "imgGrf"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Ban"
            Object.ToolTipText     =   "Gestion des banques"
            Object.Tag             =   "Ban"
            ImageKey        =   "imgBanque"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "RFac"
            Object.ToolTipText     =   "Rubriques de facturation"
            Object.Tag             =   "RFac"
            ImageKey        =   "imgRubFac"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "RVen"
            Object.ToolTipText     =   "Rubriques de ventilation"
            Object.Tag             =   "RVen"
            ImageKey        =   "imgRubVent"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "CTva"
            Object.ToolTipText     =   "Gestion des codes TVA"
            Object.Tag             =   "TVA"
            ImageKey        =   "imgTVA"
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
            Picture         =   "MDIFacturation.frx":0442
            Key             =   "Utilisateur"
            Object.ToolTipText     =   "Utilisateur connecté"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Picture         =   "MDIFacturation.frx":0994
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
      Left            =   9000
      Top             =   900
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   11
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIFacturation.frx":0D16
            Key             =   "imgCopie"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIFacturation.frx":0E28
            Key             =   "imgExplorer"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIFacturation.frx":0F8C
            Key             =   "imgAperçu"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIFacturation.frx":10F0
            Key             =   "imgEtb"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIFacturation.frx":124C
            Key             =   "imgGrf"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIFacturation.frx":13A8
            Key             =   "imgImpr"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIFacturation.frx":14BC
            Key             =   "imgBanque"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIFacturation.frx":1618
            Key             =   "imgRubVent"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIFacturation.frx":1774
            Key             =   "imgRubFac"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIFacturation.frx":18D0
            Key             =   "imgTVA"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIFacturation.frx":1A2C
            Key             =   "imgTarifs"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuTable 
      Caption         =   "&Table"
      Begin VB.Menu cmdGroupements 
         Caption         =   "&Groupements…"
      End
      Begin VB.Menu sepa 
         Caption         =   "-"
      End
      Begin VB.Menu CmdBanques 
         Caption         =   "&Banques..."
      End
      Begin VB.Menu cmdRubFac 
         Caption         =   "Rubriques de &facturation…"
         Shortcut        =   ^F
      End
      Begin VB.Menu cmdRubVent 
         Caption         =   "Rubriques de &ventilation…"
      End
      Begin VB.Menu cmdCodesTVA 
         Caption         =   "&Codes TVA..."
      End
      Begin VB.Menu sep11 
         Caption         =   "-"
      End
      Begin VB.Menu cmdTarifs 
         Caption         =   "&Tarifs..."
         Shortcut        =   ^T
      End
      Begin VB.Menu sep10 
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
         Caption         =   "C&opier"
         Shortcut        =   ^C
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
Attribute VB_Name = "MDIFacturation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MDIFacturation
' Feuille MDI principale de la gestion des tables de la facturation
' 25/08/1999 PV+NC
' 12/03/2001 PV En lecture seule si on n'est pas sur spip
' 18/12/01   PV En modification sur serveur, brux et bergamo


Option Explicit


' Appelé à la connexion initiale, et après un changement d'identité d'utilisateur
Private Sub DétermineModeLectureSeule()
  bLectureSeule = colUtilisateur("U" & iNumOpérateur).uti_unite <> 902 And colUtilisateur("U" & iNumOpérateur).uti_unite <> 702
  bLectureSeule = bLectureSeule Or Not (cSystèmeCA Like "[WXB]")
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
    If Not F Is MDIFacturation Then Unload F
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
    If Not F Is MDIFacturation Then Unload F
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

Private Sub cmdMémorise_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Mémorise
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
  If Not ActiveForm Is Nothing Then ActiveForm.Aperçu
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
  cmdTableau.Caption = cmdTableau.Caption & Chr(9) & "T"
  
  frmOptions.InitOptions
  If InStr(1, Command, "-d") Then bDebug = True
  
  AjusteMenus 0
  AjusteEtiquettesBoutons tbBoutons
  
  Show
  ChargementInitial bShiftPressed
  
  
  ' Contrôle temporaire pour Cergy2
  Dim si As New SocketInfo
  If Left(si.sAdresseIP, 12) = "200.200.207." And BDSource = "co2" Then
    MsgBox "ATTENTION - Vous êtes relié au réseau de Cergy 2, et vous êtes connectés à la source de données co2 qui est située sur Cergy 1. " & _
      "Pour améliorer considérablement les performances, vous devriez vous connecter à la source de données spip du site de Cergy 2." & vbCrLf & _
      "Utilisez la commande Fichier, Source de connées, sélectionnez la source spip, et cochez la case 'Par défaut au lancement'. Voyez avec le correspondant informatique de vore service si vous avez besoin d'aide.", vbInformation, App.Title
  End If
  
  If BDSource = "spip" Then
    Dim iDisplay As Integer
    iDisplay = GetSetting(App.EXEName, "Infos", "DisplayInfoSourceServeur", 1)
    If iDisplay Then
      MsgBox "ATTENTION - Suite à la mise en place de la facturation en Belgique et en Italie, les données gérées par ce programme doivent être mises à jour sur la source de données serveur." & vbCrLf & _
        "La source de données spip n'est accessible qu'en lecture seule.", vbInformation, App.Title
      SaveSetting App.EXEName, "Infos", "DisplayInfoSourceServeur", 0
    End If
  End If

End Sub


Private Sub cmdGroupements_Click()
  On Error GoTo Problème
  
  Dim F
  If bShiftPressed Then
    Set F = New frmGroupement
  Else
    Set F = frmGroupement
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0

Problème:
End Sub


Private Sub cmdBanques_Click()
  On Error GoTo Problème
  
  Dim F
  If bShiftPressed Then
    Set F = New frmBanque
  Else
    Set F = frmBanque
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0

Problème:
End Sub


Private Sub cmdRubFac_Click()
  On Error GoTo Problème

  Dim F
  If bShiftPressed Then
    Set F = New frmRubFacturation
  Else
    Set F = frmRubFacturation
  End If

'  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0

Problème:
End Sub


Private Sub cmdRubVent_Click()
  On Error GoTo Problème

  Dim F
  If bShiftPressed Then
    Set F = New frmRubVentilation
  Else
    Set F = frmRubVentilation
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0

Problème:
End Sub


Private Sub cmdCodesTVA_Click()
  On Error GoTo Problème
  
  Dim F
  If bShiftPressed Then
    Set F = New frmCodesTVA
  Else
    Set F = frmCodesTVA
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
  MDIFacturation.Arrange vbCascade
End Sub

Private Sub cmdRéorganiser_Click()
  MDIFacturation.Arrange vbArrangeIcons
End Sub

Private Sub cmdMosaïque_Click()
  MDIFacturation.Arrange vbTileHorizontal
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
    Case "Grf":     cmdGroupements_Click
    Case "Ban":     cmdBanques_Click
    Case "RFac":    cmdRubFac_Click
    Case "RVen":    cmdRubVent_Click
    Case "CTva":    cmdCodesTVA_Click
    
    Case "Web":     cmdWeb_Click
    Case "Impr":    cmdImpr_Click
    Case "Aperçu":  cmdAperçu_Click
    Case "Copie":   cmdCopie_Click
    
    Case Else:      Stop
  End Select
End Sub

Private Sub tbBoutons_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
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
