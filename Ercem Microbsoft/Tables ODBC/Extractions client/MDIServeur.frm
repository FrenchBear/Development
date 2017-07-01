VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm MDIExtCli 
   BackColor       =   &H8000000C&
   Caption         =   "Gestion des extractions client"
   ClientHeight    =   7215
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   10605
   Icon            =   "MDIServeur.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Timer timMédor 
      Left            =   1080
      Top             =   660
   End
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10605
      _ExtentX        =   18706
      _ExtentY        =   635
      ButtonWidth     =   609
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      Appearance      =   1
      Style           =   1
      ImageList       =   "ilAdmin"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   2
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Car"
            Object.ToolTipText     =   "Extraction EH Carrefour 2002"
            Object.Tag             =   "Car"
            ImageKey        =   "C2002"
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
            Object.Width           =   10239
            Key             =   "Message"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5292
            MinWidth        =   5292
            Picture         =   "MDIServeur.frx":014A
            Key             =   "Utilisateur"
            Object.ToolTipText     =   "Utilisateur connecté"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Picture         =   "MDIServeur.frx":069C
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
      Left            =   240
      Top             =   600
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   1
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":0A1E
            Key             =   "C2002"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuExtractions 
      Caption         =   "&Extractions"
      Begin VB.Menu cmdCarrefour 
         Caption         =   "&EH Carrefour 2002"
         Shortcut        =   ^E
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
   Begin VB.Menu mnuFenêtre 
      Caption         =   "Fe&nêtre"
      WindowList      =   -1  'True
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
Attribute VB_Name = "MDIExtCli"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MDIExtCli
' Feuille MDI principale des extractions spécifiques client
' 17/12/2001 PV


Option Explicit


' Appelé à la connexion initiale, et après un changement d'identité d'utilisateur
' Autorisé au service informatique et au bit 6 des droits d'accès
Private Sub DétermineModeLectureSeule()
  
  ' Seule le service informatique peut modifier les tables Serveur !
  bAdminServeur = NZ(colUtilisateur("U" & iNumOpérateur).uti_unite) = 902 Or (NZ(colUtilisateur("U" & iNumOpérateur).uti_niveau) And 64) <> 0
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
    If Not F Is MDIExtCli Then Unload F
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
    If Not F Is MDIExtCli Then Unload F
  Next
  If Forms.Count <> 1 Then
    MsgBox "Fermez les fenêtres document avant de changer la source de données !"
    Exit Sub
  End If
  
  ChargementInitial True
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
  
  'AjusteMenus 0
'  AjusteEtiquettesBoutons tbBoutons
  
  Show
  ChargementInitial bShiftPressed
  
  ResetChienDeGarde
  
  cmdCarrefour_Click
End Sub


Private Sub cmdCarrefour_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmCarrefour
  Else
    Set F = frmCarrefour
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  'AjusteMenus 0
End Sub



Private Sub cmdQuitter_Click()
  Unload Me
End Sub



Private Sub cmdCascade_Click()
  MDIExtCli.Arrange vbCascade
End Sub

Private Sub cmdRéorganiser_Click()
  MDIExtCli.Arrange vbArrangeIcons
End Sub

Private Sub cmdMosaïque_Click()
  MDIExtCli.Arrange vbTileHorizontal
End Sub


Private Sub cmdAPropos_Click()
  frmAbout.APropos Me.Icon
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
    Case "Car":     cmdCarrefour_Click
    
    Case Else:      Stop
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


'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "F:" & App.Title & " - " & App.FileDescription

  SetLib mnuExtractions, "Caption", "A:&Extraction"
  SetLib mnuFenêtre, "Caption", "A:&Window"
  SetLib mnuAide, "Caption", "A:&Help"
  
  SetLib cmdConfiguration, "Caption", "A:Data source…"
  SetLib cmdUtilisateur, "Caption", "A:User…"
  SetLib cmdOptions, "Caption", "A:Options…"
  SetLib cmdFermer, "Caption", "A:Close"
  SetLib cmdQuitter, "Caption", "A:Exit"
  
  SetLib cmdAPropos, "Caption", "A:About…"
End Sub



' ===============================================================================
' Chien de garde

Public Sub ResetChienDeGarde()
  tMédor = Timer
  timMédor.Interval = 10000
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

