VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.MDIForm MDIServeur 
   BackColor       =   &H8000000C&
   Caption         =   "Gestion des tables serveur"
   ClientHeight    =   7215
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   10605
   Icon            =   "MDIServeur.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Timer timMédor 
      Left            =   960
      Top             =   660
   End
   Begin MSComDlg.CommonDialog cdPrinter 
      Left            =   240
      Top             =   1320
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
         NumButtons      =   19
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Etb"
            Object.ToolTipText     =   "Gestion des établissements"
            Object.Tag             =   "Etb"
            ImageKey        =   "imgEtb"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Sec"
            Object.ToolTipText     =   "Gestion des secteurs"
            Object.Tag             =   "Sec"
            ImageKey        =   "imgSec"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Drg"
            Object.ToolTipText     =   "Gestion des directions régionales"
            Object.Tag             =   "Drg"
            ImageKey        =   "imgDrg"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Dna"
            Object.ToolTipText     =   "Gestion des directions nationales"
            Object.Tag             =   "Dna"
            ImageKey        =   "imgDna"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Grp"
            Object.ToolTipText     =   "Gestion des groupes"
            Object.Tag             =   "Grp"
            ImageKey        =   "imgGrp"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Pro"
            Object.ToolTipText     =   "Gestion des produits"
            Object.Tag             =   "Pro"
            ImageKey        =   "imgPro"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Fab"
            Object.ToolTipText     =   "Gestion des fabricants"
            Object.Tag             =   "Fab"
            ImageKey        =   "imgFab"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Dis"
            Object.ToolTipText     =   "Gestion des distributeurs"
            Object.Tag             =   "Dis"
            ImageKey        =   "imgDis"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Type"
            Object.ToolTipText     =   "Gestion des types"
            Object.Tag             =   "Type"
            ImageKey        =   "imgType"
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Tarif"
            Object.ToolTipText     =   "Gestion des tarifs"
            Object.Tag             =   "Tarif"
            ImageKey        =   "imgTarifs"
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Copie"
            Object.ToolTipText     =   "Copie les données dans le presse-papiers"
            Object.Tag             =   "Cop"
            ImageKey        =   "imgCopie"
         EndProperty
         BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Impr"
            Object.ToolTipText     =   "Impression"
            Object.Tag             =   "Imp"
            ImageKey        =   "imgImpr"
         EndProperty
         BeginProperty Button18 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Aperçu"
            Object.ToolTipText     =   "Aperçu avant impression"
            Object.Tag             =   "Aper"
            ImageKey        =   "imgAperçu"
         EndProperty
         BeginProperty Button19 {66833FEA-8583-11D1-B16A-00C0F0283628} 
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
            Object.Width           =   10239
            Key             =   "Message"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5292
            MinWidth        =   5292
            Picture         =   "MDIServeur.frx":0442
            Key             =   "Utilisateur"
            Object.ToolTipText     =   "Utilisateur connecté"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2646
            MinWidth        =   2646
            Picture         =   "MDIServeur.frx":0994
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
         NumListImages   =   19
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":0D16
            Key             =   "imgCopie"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":0E28
            Key             =   "imgExplorer"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":0F8C
            Key             =   "imgAperçu"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":10F0
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":1548
            Key             =   "imgEtb"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":16A4
            Key             =   "imgSec"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":1800
            Key             =   "imgDrg"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":195C
            Key             =   "imgDna"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":1AB8
            Key             =   "imgGrp"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":1C14
            Key             =   "imgPro"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":2068
            Key             =   "imgFab"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":2384
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":23E2
            Key             =   "imgConcl"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":2836
            Key             =   "imgImpr"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":294A
            Key             =   "imgDis"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":2C66
            Key             =   "imgType"
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":2DC2
            Key             =   "imgTarifs"
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":2F1E
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "MDIServeur.frx":3370
            Key             =   "imgFimebio"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuTable 
      Caption         =   "&Table"
      Begin VB.Menu cmdEtablissements 
         Caption         =   "&Etablissements…"
         Shortcut        =   ^E
      End
      Begin VB.Menu cmdSecteurs 
         Caption         =   "&Secteurs…"
         Shortcut        =   ^S
      End
      Begin VB.Menu cmdDirectionsRegionales 
         Caption         =   "Directions &régionales…"
         Shortcut        =   ^R
      End
      Begin VB.Menu cmdDirectionsNationales 
         Caption         =   "Directions &nationales…"
         Shortcut        =   ^N
      End
      Begin VB.Menu cmdGroupes 
         Caption         =   "&Groupes…"
         Shortcut        =   ^G
      End
      Begin VB.Menu sepa 
         Caption         =   "-"
      End
      Begin VB.Menu cmdProduits 
         Caption         =   "&Produits…"
         Shortcut        =   ^P
      End
      Begin VB.Menu cmdFabricants 
         Caption         =   "&Fabricants…"
         Shortcut        =   ^F
      End
      Begin VB.Menu cmdDistributeurs 
         Caption         =   "&Distributeurs…"
         Shortcut        =   ^D
      End
      Begin VB.Menu sep9 
         Caption         =   "-"
      End
      Begin VB.Menu cmdTypes 
         Caption         =   "&Types…"
         Shortcut        =   ^T
      End
      Begin VB.Menu sep11 
         Caption         =   "-"
      End
      Begin VB.Menu cmdTarifs 
         Caption         =   "Tar&ifs..."
         Shortcut        =   ^I
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
      Begin VB.Menu sep3b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdTableau 
         Caption         =   "&Tableau"
      End
      Begin VB.Menu cmdZoomTableau 
         Caption         =   "&Zoom tableau"
         Shortcut        =   {F4}
      End
      Begin VB.Menu sep4b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdCopie 
         Caption         =   "C&opier enregistrement"
         Shortcut        =   ^C
      End
      Begin VB.Menu cmdCopieTableau 
         Caption         =   "Co&pier tableau"
      End
      Begin VB.Menu sep3d 
         Caption         =   "-"
      End
      Begin VB.Menu cmdMémorise 
         Caption         =   "&Mémorise"
         Shortcut        =   ^{F5}
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
      Begin VB.Menu cmdAjouteWeb 
         Caption         =   "&Ajoute Web…"
      End
      Begin VB.Menu cmdRécupère 
         Caption         =   "&Récupère un enregistrement supprimé"
      End
      Begin VB.Menu cmdTransfertEtbCompta 
         Caption         =   "Transfert des établissements en &comptabilité"
      End
      Begin VB.Menu cmdSélectionAttachementsNmoins1 
         Caption         =   "Sélection &attachements N-1..."
         Shortcut        =   ^A
      End
      Begin VB.Menu cmdSélectionAttachementsEtablissements 
         Caption         =   "Sélection attachements éta&blissements..."
         Shortcut        =   ^B
      End
      Begin VB.Menu cmdHistorique 
         Caption         =   "&Historique des opérations"
         Shortcut        =   ^H
      End
      Begin VB.Menu cmdDernierNo 
         Caption         =   "&Dernier n° attribué"
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
Attribute VB_Name = "MDIServeur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' MDIServeur
' Feuille MDI principale de la gestion des tables du serveur
' 10/05/1999 PV
' 15/06/1999 PV Mémorise
'  7/07/1999 PV Enregistrement de la source ODBC par défaut
' 15/07/1999 PV Droits d'accès 64 spécifiques à ce programme
'  3/08/1999 PV Types
' 11/08/1999 PV sbMessage intégré à bdSél; chargement tardif des collections
' 21/10/1999 PV IsServeur pour déterminer le mode lecture seule, pour éviter de modifier la base sur grenoble par exemple
' 11/07/2000 PV Début de la traduction en anglais
'  5/09/2000 PV Sélection hiérarchique
' 29/09/2000 PV Fin de la table Nbex locale
' 14/01/2001 PV Conversion des tarifs Satti
' 27/07/2001 PV Fin de la conversion des tarifs Satti
'  9/08/2001 PV Chien de garde à 1h
' 29/11/2001 PV Gestion de l'historique
' 06/12/2001 PV Menu commande contextuel (sMéthodesGlobales)
'  7/12/2001 PV Contrôle connexion sur zen depuis Cergy 2 (temporaire)


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

Private Sub cmdTableau_Click()
  On Error Resume Next
  ActiveForm.ActionTabChange
End Sub

Private Sub cmdZoomTableau_Click()
  On Error Resume Next
  ActiveForm.ZoomTableau
End Sub


Private Sub cmdUtilisateur_Click()
  Dim F As Form
  For Each F In Forms
    If Not F Is MDIServeur Then Unload F
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
    If Not F Is MDIServeur Then Unload F
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



Private Sub cmdImpr_Click()
  On Error Resume Next
  If Left(TypeName(ActiveForm), 2) = "dr" Then          ' DataReport
    ActiveForm.PrintReport
  ElseIf TypeName(ActiveForm) = "frmImprimante" Then    ' Apeçu artisanal
    ActiveForm.PrintReport
  Else
    ActiveForm.Imprime
  End If
End Sub

Private Sub cmdAperçu_Click()
'  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Aperçu
End Sub



' Le menu Commandes est contextuel
' En attendant la réflexion, on utilise la propriété publique sMéthodesGlobales
' de la feuille active pour déterminer les commandes supportées
Private Sub mnuCommandes_Click()
  Dim sMéthodesGlobales As String
 
  On Error Resume Next
  sMéthodesGlobales = ActiveForm.sMéthodesGlobales
  On Error GoTo 0
  
  cmdRécupère.Enabled = InStr(1, sMéthodesGlobales, "Récupère", vbTextCompare) > 0
  cmdAjouteWeb.Enabled = InStr(1, sMéthodesGlobales, "AjouteWeb", vbTextCompare) > 0
  cmdSélectionAttachementsNmoins1.Enabled = InStr(1, sMéthodesGlobales, "SélectionAttachementsNmoins1", vbTextCompare) > 0
  cmdSélectionAttachementsEtablissements.Enabled = InStr(1, sMéthodesGlobales, "SélectionAttachementsEtablissements", vbTextCompare) > 0
  cmdTransfertEtbCompta.Enabled = InStr(1, sMéthodesGlobales, "TransfertEtbCompta", vbTextCompare) > 0
  cmdHistorique.Enabled = InStr(1, sMéthodesGlobales, "Historique", vbTextCompare) > 0
  cmdDernierNo.Enabled = InStr(1, sMéthodesGlobales, "DernierNo", vbTextCompare) > 0
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
  
  
  ' Contrôle temporaire pour Cergy2
  Dim si As New SocketInfo
  If Left(si.sAdresseIP, 12) = "200.200.207." And BDSource = "co2" Then
    MsgBox "ATTENTION - Vous êtes relié au réseau de Cergy 2, et vous êtes connectés à la source de données co2 qui est située sur Cergy 1. " & _
      "Pour améliorer considérablement les performances, vous devriez vous connecter à la source de données spip du site de Cergy 2." & vbCrLf & _
      "Utilisez la commande Fichier, Source de connées, sélectionnez la source spip, et cochez la case 'Par défaut au lancement'. Voyez avec le correspondant informatique de vore service si vous avez besoin d'aide.", vbInformation, App.Title
  End If
  
  If BDSource = "serveur" Then
    Dim iDisplay As Integer
    iDisplay = GetSetting(App.EXEName, "Infos", "DisplayHistoryInfo", 1)
    If iDisplay Then
      MsgBox "NOUVELLE FONCTION : L'historique des modifications" & vbCrLf & vbCrLf & "Désormais, la commande Historique du menu Commandes affiche la trace des opérations sur les établissements, produits, ...  En plus, dans la feuille établissement, le bouton [Histo] devient jaune quand des informations d'historique sont disponibles.", vbInformation, App.Title
      SaveSetting App.EXEName, "Infos", "DisplayHistoryInfo", 0
    End If
  End If

  ResetChienDeGarde
End Sub


Private Sub cmdEtablissements_Click()
  On Error GoTo pb
  Dim F
  If bShiftPressed Then
    Set F = New frmEtablissement
  Else
    Set F = frmEtablissement
  End If

  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
  Exit Sub
pb:
  MessageErreurStandard "Echec à l'ouverture de la feuille"
End Sub


Private Sub cmdSecteurs_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmSecteur
  Else
    Set F = frmSecteur
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdDirectionsRegionales_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmDirReg
  Else
    Set F = frmDirReg
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdDirectionsNationales_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmDirNat
  Else
    Set F = frmDirNat
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdGroupes_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmGroupe
  Else
    Set F = frmGroupe
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdProduits_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmProduit
  Else
    Set F = frmProduit
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdFabricants_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmFabricant
  Else
    Set F = frmFabricant
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub


Private Sub cmdDistributeurs_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmDistributeur
  Else
    Set F = frmDistributeur
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub

Private Sub cmdTypes_Click()
  Dim F
  If bShiftPressed Then
    Set F = New frmType
  Else
    Set F = frmType
  End If

  On Error GoTo fin
  F.Show
  F.ZOrder 0
fin:
  AjusteMenus 0
End Sub



Private Sub cmdTarifs_Click()
  On Error GoTo Problème
  
  Dim F
  If bShiftPressed Then
    Set F = New frmTarif
  Else
    Set F = frmTarif
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
  MDIServeur.Arrange vbCascade
End Sub

Private Sub cmdRéorganiser_Click()
  MDIServeur.Arrange vbArrangeIcons
End Sub

Private Sub cmdMosaïque_Click()
  MDIServeur.Arrange vbTileHorizontal
End Sub

Private Sub mnuAide_Click()
'  cmdChargementEtablissement2.Visible = iNumOpérateur = 46
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
'  mnuCommandes.Visible = bFeuilleChargée
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
    Case "Etb":     cmdEtablissements_Click
    Case "Sec":     cmdSecteurs_Click
    Case "Drg":     cmdDirectionsRegionales_Click
    Case "Dna":     cmdDirectionsNationales_Click
    Case "Grp":     cmdGroupes_Click
    
    Case "Pro":     cmdProduits_Click
    Case "Fab":     cmdFabricants_Click
    Case "Dis":     cmdDistributeurs_Click
    
    Case "Type":    cmdTypes_Click
       
    Case "Tarif":   cmdTarifs_Click
       
    Case "Web":     cmdWeb_Click
    Case "Impr":    cmdImpr_Click
    Case "Aperçu":  cmdAperçu_Click
    Case "Copie":   cmdCopie_Click
    
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


' ===============================================================================
' Commandes sous-traitées aux feuilles de données

Private Sub cmdAjouteWeb_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.AjouteWeb
End Sub

Private Sub cmdRécupère_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Récupère
End Sub

Private Sub cmdMémorise_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Mémorise
End Sub

Private Sub cmdTransfertEtbCompta_Click()
  frmTransfertEtb.Show
End Sub

Private Sub cmdSélectionAttachementsNmoins1_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.cmdSélectionAttachements False
End Sub

Private Sub cmdSélectionAttachementsEtablissements_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.cmdSélectionAttachements True
End Sub

Private Sub cmdHistorique_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.Historique
End Sub

Private Sub cmdDernierNo_Click()
  On Error Resume Next
  If Not ActiveForm Is Nothing Then ActiveForm.DernierNo
End Sub


'========================================================
' Internationalisation

Public Sub Internationalisation()
  SetLib Me, "Caption", "F:" & App.Title & " - " & App.FileDescription & "%%A:" & App.Title & " - " & "Customer management"

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
  SetLib cmdTableau, "Caption", "F:Tableau\tT%%A:Array\tT"
  SetLib cmdCopie, "Caption", "A:Copy"
  SetLib cmdImpr, "Caption", "A:Print"
  SetLib cmdAperçu, "Caption", "A:Print preview…"
  
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

