VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmRecherche 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Saisie des RA"
   ClientHeight    =   4140
   ClientLeft      =   135
   ClientTop       =   2100
   ClientWidth     =   10290
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmRecherche.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   276
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   686
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   13
      Top             =   0
      Width           =   10290
      _ExtentX        =   18150
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      Appearance      =   1
      ImageList       =   "ImageListTB"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   10
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Nouveau"
            Object.ToolTipText     =   "Efface tous les champs"
            ImageKey        =   "imgNouveau"
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Utilisateur"
            Object.ToolTipText     =   "Change l'utilisateur courant"
            ImageKey        =   "imgUtilisateur"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Unix"
            Object.ToolTipText     =   "Change de système Unix"
            ImageKey        =   "imgUnix"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Imprimante"
            Object.ToolTipText     =   "Change l'imprimante courante"
            ImageKey        =   "imgImprimante"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Key             =   "ImprimeFRT"
            Object.ToolTipText     =   "Lance l'impression de la FRT courante"
            ImageKey        =   "imgImprimeFRT"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "DétailFRT"
            Object.ToolTipText     =   "Détail FRT"
            ImageKey        =   "imgFRT"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Anomalie"
            Object.ToolTipText     =   "Saisie des anomalies"
            ImageKey        =   "Anomalie"
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton btnAction 
      Caption         =   "Action"
      Enabled         =   0   'False
      Height          =   315
      Left            =   8340
      TabIndex        =   10
      Tag             =   "Cliquez sur ce bouton pour afficher/saisir le CRA"
      Top             =   1380
      Width           =   1875
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   8220
      Top             =   480
   End
   Begin VB.CommandButton btnDémo 
      Caption         =   "&Démo"
      Enabled         =   0   'False
      Height          =   315
      Left            =   4140
      TabIndex        =   2
      Top             =   540
      Width           =   855
   End
   Begin VB.TextBox txtNumEtb 
      Height          =   315
      Left            =   1620
      MaxLength       =   6
      TabIndex        =   4
      Tag             =   "Entrez le n° d'établissement. F4 pour une recherche."
      Top             =   960
      Width           =   960
   End
   Begin VB.TextBox txtPréfixe 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   2700
      Locked          =   -1  'True
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   960
      Width           =   1335
   End
   Begin VB.TextBox txtNomEtb 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   4140
      Locked          =   -1  'True
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   960
      Width           =   6075
   End
   Begin VB.CommandButton btnRechercher 
      Caption         =   "Rec&hercher"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   315
      Left            =   3300
      TabIndex        =   9
      Tag             =   "Cliquez sur ce bouton pour afficher/saisir le CRA"
      Top             =   1380
      Width           =   1350
   End
   Begin VB.TextBox txtRéférence 
      Height          =   315
      Left            =   1620
      TabIndex        =   8
      Tag             =   "Entrez la référence d'analyse"
      Top             =   1380
      Width           =   1575
   End
   Begin VB.TextBox txtCB 
      Height          =   315
      Left            =   1620
      MaxLength       =   20
      TabIndex        =   1
      Tag             =   "Scannez ou saisissez le code barre de la FP"
      Top             =   540
      Width           =   2415
   End
   Begin MSComctlLib.ProgressBar pbProgress 
      Height          =   165
      Left            =   0
      TabIndex        =   14
      Top             =   3600
      Visible         =   0   'False
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   291
      _Version        =   393216
      Appearance      =   1
   End
   Begin MSComctlLib.StatusBar sbStatus 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   15
      Top             =   3825
      Width           =   10290
      _ExtentX        =   18150
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   4
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   9287
            MinWidth        =   7408
            Key             =   "Info"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   3175
            MinWidth        =   3175
            Picture         =   "frmRecherche.frx":0442
            Key             =   "Impr"
            Object.ToolTipText     =   "Imprimante sélectionnée"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   529
            MinWidth        =   529
            Picture         =   "frmRecherche.frx":0994
            Key             =   "EInt"
            Object.ToolTipText     =   "Le cadenas indique que le programme communique"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5027
            MinWidth        =   5027
            Picture         =   "frmRecherche.frx":0D46
            Key             =   "ECom"
            Object.ToolTipText     =   "État de la connexion avec le système Unix"
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComctlLib.ListView lvRéférences 
      Height          =   1755
      Left            =   1605
      TabIndex        =   12
      Tag             =   "Sélectionnez la référence."
      Top             =   1800
      Width           =   8625
      _ExtentX        =   15214
      _ExtentY        =   3096
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Key             =   "Re"
         Text            =   "Référence"
         Object.Width           =   2646
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Key             =   "Cl"
         Text            =   "Cl"
         Object.Width           =   0
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Key             =   "Et"
         Text            =   "Etat"
         Object.Width           =   7937
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Key             =   "Ac"
         Text            =   "Action"
         Object.Width           =   2646
      EndProperty
   End
   Begin MSComctlLib.ImageList ImageListTB 
      Left            =   8760
      Top             =   420
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
            Picture         =   "frmRecherche.frx":110C
            Key             =   "imgLireAvancé"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecherche.frx":1426
            Key             =   "imgUnix0"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecherche.frx":1978
            Key             =   "imgUtilisateur"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecherche.frx":1C92
            Key             =   "imgImprimante"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecherche.frx":1DA4
            Key             =   "imgEtablissement"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecherche.frx":20BE
            Key             =   "imgImprimeFRT"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecherche.frx":23D8
            Key             =   "imgSaisie"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecherche.frx":26F2
            Key             =   "imgNouveau"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecherche.frx":2A0C
            Key             =   "imgUnix"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecherche.frx":2D26
            Key             =   "imgFRT"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmRecherche.frx":3040
            Key             =   "Anomalie"
         EndProperty
      EndProperty
   End
   Begin VB.Label lblRA 
      AutoSize        =   -1  'True
      Caption         =   "R&A :"
      Height          =   210
      Left            =   60
      TabIndex        =   11
      Top             =   1800
      Width           =   375
   End
   Begin VB.Label lblEtablissement 
      AutoSize        =   -1  'True
      Caption         =   "&Etablissement :"
      Height          =   210
      Left            =   60
      TabIndex        =   3
      Top             =   1020
      Width           =   1470
   End
   Begin VB.Label lblRéférence 
      AutoSize        =   -1  'True
      Caption         =   "Référe&nce :"
      Height          =   210
      Left            =   60
      TabIndex        =   7
      Top             =   1440
      Width           =   1080
   End
   Begin VB.Label lblCodeBarre 
      AutoSize        =   -1  'True
      Caption         =   "Code &barre :"
      Height          =   210
      Left            =   60
      TabIndex        =   0
      Top             =   600
      Width           =   1200
   End
   Begin VB.Menu mnuRA 
      Caption         =   "&RA"
      Begin VB.Menu cmdEffacer 
         Caption         =   "&Effacer"
      End
      Begin VB.Menu sep11 
         Caption         =   "-"
      End
      Begin VB.Menu cmdModeVisualisation 
         Caption         =   "Mode &visualisation"
         Checked         =   -1  'True
      End
      Begin VB.Menu cmdModeSaisie 
         Caption         =   "Mode &saisie / correction"
      End
      Begin VB.Menu sep10 
         Caption         =   "-"
      End
      Begin VB.Menu cmdTableST 
         Caption         =   "Tables &secrétariat/serveur"
      End
      Begin VB.Menu cmdTableSL 
         Caption         =   "Tables &labo"
         Checked         =   -1  'True
      End
      Begin VB.Menu sep0 
         Caption         =   "-"
      End
      Begin VB.Menu cmdSystèmeUnix 
         Caption         =   "&Système unix…"
      End
      Begin VB.Menu cmdIdentification 
         Caption         =   "&Identification de l'utilisateur…"
      End
      Begin VB.Menu cmdConfigImprimante 
         Caption         =   "Configuration &imprimantes…"
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuFRT 
      Caption         =   "&FRT"
      Begin VB.Menu cmdFRTImprimeCourant 
         Caption         =   "&Imprimer la FRT courante"
      End
      Begin VB.Menu cmdFRTAccèsGénéral 
         Caption         =   "Imprimer une FRT &quelconque…"
      End
      Begin VB.Menu cmdFRTImprimée 
         Caption         =   "&Considérer la FRT courante imprimée"
      End
      Begin VB.Menu sep1b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdFRTEtat 
         Caption         =   "&Etat de la FRT courante…"
      End
      Begin VB.Menu sep7 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAttacherEchus 
         Caption         =   "Imprimer la FRT des &analyses à échéance"
      End
      Begin VB.Menu sep7b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdDétailFRT 
         Caption         =   "&Détail FRT…"
      End
   End
   Begin VB.Menu mnuRecherche 
      Caption         =   "Rec&herche"
      Begin VB.Menu cmdRechEtablissement 
         Caption         =   "&Etablissement…"
      End
      Begin VB.Menu cmdRechLettres 
         Caption         =   "&Lettres d'assistant…"
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu cmdRANonValidés 
         Caption         =   "&RA non validés à J+1"
      End
      Begin VB.Menu cmdRAEchus 
         Caption         =   "&Analyses arrivées à échéance"
      End
      Begin VB.Menu cmdComptageDLC 
         Caption         =   "&Co&mptage des analyses prévues…"
      End
      Begin VB.Menu sep3b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdSaisieAnomalie 
         Caption         =   "&Saisie des anomalies"
      End
      Begin VB.Menu sep3 
         Caption         =   "-"
      End
      Begin VB.Menu cmdOptions 
         Caption         =   "&Options…"
      End
   End
   Begin VB.Menu mnuAvancé 
      Caption         =   "Avanc&é"
      Begin VB.Menu cmdAfficheVerrousCrad 
         Caption         =   "&Verrous…"
      End
      Begin VB.Menu sep4 
         Caption         =   "-"
      End
      Begin VB.Menu cmdModifAprèsValidation 
         Caption         =   "&Modification RA validé…"
      End
   End
   Begin VB.Menu mnuSystème 
      Caption         =   "&Système"
      Begin VB.Menu cmdTCPFenetre 
         Caption         =   "&Fenêtre TCP"
      End
      Begin VB.Menu cmdRelâcher 
         Caption         =   "&Débloquer interface"
         Enabled         =   0   'False
      End
      Begin VB.Menu sep41 
         Caption         =   "-"
      End
      Begin VB.Menu cmdCache 
         Caption         =   "&Cache…"
      End
      Begin VB.Menu cmdPurgeCache 
         Caption         =   "&Purger les fichiers cache"
      End
      Begin VB.Menu sep6 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAfficheVerrousScraw 
         Caption         =   "&Verrous scraw…"
      End
      Begin VB.Menu sep5 
         Caption         =   "-"
      End
      Begin VB.Menu cmdConnexion 
         Caption         =   "C&onnexion"
      End
      Begin VB.Menu cmdDéconnexion 
         Caption         =   "Déconne&xion"
      End
   End
   Begin VB.Menu mnuAide 
      Caption         =   "&?"
      Begin VB.Menu cmdAideSommaire 
         Caption         =   "&Sommaire de l'aide"
      End
      Begin VB.Menu cmdAideContextuelle 
         Caption         =   "Aide &contextuelle"
         Shortcut        =   {F1}
      End
      Begin VB.Menu sep8 
         Caption         =   "-"
      End
      Begin VB.Menu cmdDernièresModifs 
         Caption         =   "&Dernières modifications…"
      End
      Begin VB.Menu sep9 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A propos de…"
      End
   End
   Begin VB.Menu mnuBarreBoutons 
      Caption         =   "(BarreBoutons)"
      Visible         =   0   'False
      Begin VB.Menu cmdBarreStandard 
         Caption         =   "&Barre de boutons standard"
         Checked         =   -1  'True
      End
      Begin VB.Menu cmdEtiquettes 
         Caption         =   "&Afficher les étiquettes"
      End
   End
End
Attribute VB_Name = "frmRecherche"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille d'accueil de la saisie des CRA sous Windows"
' frmRecherche
' Feuille d'accueil de la Saisie des RA sous Windows (SCRAW)
'  1/09/1997 PV
' 16/10/1997 PV Jeux de tables
' 17/11/1997 PV 1.1 Identification systématique au lancement; mots de passe;
'                   Pas de changement de système Unix si RA affiché ou FRT non imprimée
' 10/12/1997 PV     Vérification que les deux premières lettres sont bien affectées
' 23/12/1997 PV     Code d'autorisation spécial secret…
'  9/01/1998 PV     Analyses arrivées à échéance
' 13/04/1998 PV     Option -autologin
' 15/05/1998 PV     Détail FRT, anomalies
'  5/06/1998 PV     Légende des boutons supplémentaires
' 22/07/1998 PV     -autologin --> -nologin
' 14/08/1998 PV     Case à cocher chkNouvellePrésentation
' 26/08/1998 PV     Bug dans cmdAttacherEchus_Click, iFRT as integer --> long
' 17/12/1998 PV     Trois options de présentation
' 21/12/1998 PV 1.4 Généralisation des LibelléRA; KillAnciensCaches
' 01/02/1999 NC     Internationalisation
' 29/03/1999 PV     Fin des anciennes présentations
' 22/10/1999 PV     Cas de la belgique, n°etb=3 si scan code barre avec lettre en X?
' 25/11/1999 PV     Reprise de la protection réentrance pour les douchettes rapides...
' 23/10/2000 PV 2.0 iTestPlanning, validation des références dans les plannings
'  9/11/2000 PV     Débrayage du contrôle planning pour la Belgique (etb n°3)
' 17/01/2001 PV     Classe de document dans lvRéférences
' 26/02/2001 PV     EchusWindows pour imprimer la FRT des analyses échues sous Windows
'  2/08/2001 PV     iTestPlanning avec n°ech (appelle TPL2 au lieu de TPLA)
'  6/11/2001 PV     Appel à InitCommonControls pour XP

Option Explicit

Public iOldEtat As Integer       ' État courant de la connexion TCP
Private bDéchargementFinalEnCours As Boolean
Private bEnCours As Boolean      ' Saisie de code barre en cours/Génération de référence

Public bModeSpécial As Boolean   ' Autoriser la modif après validation…

' Pour le style visuel XP
Private Declare Function InitCommonControls Lib "Comctl32.dll" () As Long


Public Sub EffaceListeRéférences()
  If lvRéférences.ListItems.Count > 0 Then
    lvRéférences.ListItems.Clear
    btnAction.Enabled = False
    btnRechercher.Default = True
  End If
End Sub

Public Sub AjouteRéférence(ByVal sRef As String, Optional ByVal sClasse As String, Optional ByVal sStatus As String = "", Optional ByVal sAction As String = "")
  If InStr(sRef, ".") = 0 Then sRef = Left(sRef, Len(sRef) - 2) & "." & Right(sRef, 2)
  
  Dim itmX As ListItem

  Set itmX = lvRéférences.ListItems.Add()
  itmX.Text = sRef
  itmX.SubItems(1) = sClasse
  itmX.SubItems(2) = sStatus
  itmX.SubItems(3) = sAction
End Sub


' Mise à jour du status d'une référence
' Si sMessage est vide, demande au démon
Public Sub MAJStatus(ByVal sRef As String, ByVal sMessage As String)
  If bDéchargementFinalEnCours Then Exit Sub
  If InStr(sRef, ".") = 0 Then sRef = Left(sRef, Len(sRef) - 2) & "." & Right(sRef, 2)
  
  Dim i As ListItem
  For Each i In lvRéférences.ListItems
    If i.Text = sRef Then
      Dim sAction As String
      Dim cEtatPH As String, cEtatLabo As String
      
      If sMessage = "" Then
        sMessage = sGetRefStatusEch(sRef, cEtatPH, cEtatLabo)
      
        If cEtatPH = "" And cEtatLabo = "" Then
          sAction = sGetIntlLib("CRtxtStaNou", "Nouveau")
        Else
          If cEtatPH >= "3" Or cEtatLabo >= "3" Then
            sAction = sGetIntlLib("CRtxtStaVis", "Visualisation")
          Else
            If cEtatLabo <> "" Then
              sAction = sGetIntlLib("CRtxtStaSaiRes", "Saisie restreinte")
            Else
              sAction = sGetIntlLib("CRtxtStaCorVal", "Correction/Valid")
            End If
          End If
        End If
      Else
        sAction = ""
      End If
      
      i.SubItems(2) = sMessage
      i.SubItems(3) = sAction
      
      ' On oublie pas de mettre à jour le bouton action
      ' si on modifie la ligne sélectionnée…
      If lvRéférences.SelectedItem Is i Then btnAction.Caption = sCaptionAcc(sAction)
      Exit Sub
    End If
  Next
End Sub

Private Function sCaptionAcc(ByVal sAction As String) As String
  Select Case sAction
    Case "Nouveau": sCaptionAcc = sGetIntlLib("CR115", "Nou&veau")
    Case "Visualisation": sCaptionAcc = sGetIntlLib("CR183", "&Visualisation")
    Case "Saisie restreinte": sCaptionAcc = sGetIntlLib("CR187", "Sa&isie restreinte")
    Case "Correction/Valid": sCaptionAcc = sGetIntlLib("CR188", "Correction/&Valid")
    Case Else: sCaptionAcc = sAction
  End Select
End Function

Private Sub MAJTousStatus()
  Dim i As Integer
  For i = 1 To lvRéférences.ListItems.Count
    ' On ne met à jour que les status effacés
    If lvRéférences.ListItems(i).SubItems(2) = "" Then
      MAJStatus lvRéférences.ListItems(i).Text, ""
    End If
  Next
End Sub

Private Sub cmdAfficheVerrousScraw_Click()
  AfficheVerrousScraw
End Sub

Private Sub cmdComptageDLC_Click()
  frmComptage.Show vbModal
End Sub

Private Sub cmdDétailFRT_Click()
  Dim sRep As String
  sRep = InputBox(sGetIntlLib("CRtxtDétailFRT", "Numéro de FRT ?"), "Infos FRT")
  If IsNumeric(sRep) Then frmDétailFRT.Affiche Val(sRep)
End Sub

Private Sub cmdSaisieAnomalie_Click()
  On Error Resume Next
  AppActivate "Saisie FSE"
  If Err = 5 Then Shell """" & App.Path & "\SaisieFSE"" -a", vbNormalFocus
  If Err = 53 Then Shell sSysDisk & "\Microbsoft\SaisieFSE -a", vbNormalFocus
End Sub

Private Sub mnuAvancé_Click()
  cmdAfficheVerrousCrad.Caption = sprintf(sGetIntlLib("CRcmdAffVerrousCrad", "Verrous"), sSystèmeDistant)
  'cmdAfficheVerrousCrad.Caption = "&Verrous " & sSystèmeDistant & "…"
End Sub

Private Sub cmdAfficheVerrousCrad_Click()
  AfficheVerrousCrad
End Sub

Private Sub cmdModifAprèsValidation_Click()
  If lvRéférences.SelectedItem Is Nothing Then Beep: Exit Sub
  
  Dim iRep As VbMsgBoxResult
  Dim sMsg As String
  sMsg = sGetIntlLib("CR249", "Question 249")
  iRep = MsgBox(sMsg, vbExclamation + vbYesNo + vbDefaultButton2, sNomApp)
  'iRep = MsgBox("ATTENTION !" & vbCrLf & vbCrLf & _
    "Cette commande permet de modifier les données après validation/transfert." & vbCrLf & vbCrLf & _
    "Elle ne doit être utilisée EXCLUSIVEMENT qu'après consultation de la DI, de façon à s'assurer que les corrections à apportées seront bien transférées." & vbCrLf & vbCrLf & _
    "Ok pour continuer ?", _
    vbExclamation + vbYesNo + vbDefaultButton2, sNomApp)
  If iRep = vbNo Then Exit Sub
  
  Dim sRep As String
  sRep = InputBox(sGetIntlLib("CRtxtModifAV", "Code d'autorisation ? (Demander à la DI)"), sNomApp)
  If sRep <> "14142136" Then
    If sRep = "" Or Not IsNumeric(sRep) Then
      MsgBox2i "CO004", sRep
      'MsgBox "Code invalide !", vbExclamation, sNomApp
      Exit Sub
    End If
    If CLng(sRep) <> CLng(Int(Now)) + Int(Val(Mid(lvRéférences.SelectedItem.Text, 3))) Then
      MsgBox2i "CR285"
      'MsgBox "Code invalide, accès refusé !", vbExclamation, sNomApp
      Exit Sub
    End If
  End If

  bModeSpécial = True
  btnAction_Click
  bModeSpécial = False
End Sub


Private Sub lvRéférences_Click()
  If lvRéférences.SelectedItem Is Nothing Then Exit Sub
  btnAction.Caption = sCaptionAcc(lvRéférences.SelectedItem.SubItems(3))
  btnAction.Default = True
End Sub

Private Sub lvRéférences_DblClick()
  btnAction_Click
End Sub

Private Sub lvRéférences_KeyPress(KeyAscii As Integer)
  If KeyAscii = 37 Then       ' Asc("%")
    Form_KeyPress KeyAscii
    KeyAscii = 0
  End If
End Sub



Private Sub btnAction_Click()
  If lvRéférences.SelectedItem Is Nothing Then Exit Sub
  
  Static bActionEnCours As Boolean
  If bActionEnCours Then
    Beep
    Exit Sub
  End If
  
  bActionEnCours = True
  btnAction_Click2 lvRéférences.SelectedItem.Index
  bActionEnCours = False
End Sub


' Code actif de l'événement btnAction_Click
' Séparé pour éviter les problèmes liés à la ré-entrance
Private Sub btnAction_Click2(Index As Integer)
  If bDéconnecté() Then Exit Sub
  
  If bBlocageEnCours Then
    ActionSuivante Me, "btnAction_Click"
    Exit Sub
  End If
  
  Dim sRéférenceSélectionnée As String
  sRéférenceSélectionnée = lvRéférences.SelectedItem.Text
  
  ' Contrôles simples, et récupération des infos du serveur
  Dim bStatusEchantillon As Boolean     ' Déjà saisi ou pas
  Dim sStatusIntervention As String     ' n° établissement
  
  If Not bOkRéférence(sRéférenceSélectionnée, True, sStatusIntervention, bStatusEchantillon) Then Exit Sub
  If Not bOkNumEtb(True) Then Exit Sub
  
  ' Si on est en mode spécial, on garde une trace
  If bModeSpécial Then
    DémonJournalUnix "ModifSpéciale", "", "Ref=" & sRéférenceSélectionnée
  End If
  
  ' On normalise la référence selon les règles internes
  Dim sRefSansPoint As String, p As Integer
  p = InStr(sRéférenceSélectionnée, ".")    ' Obligatoire après bOkRéférence
  sRefSansPoint = Left(sRéférenceSélectionnée, p - 1) & Mid(sRéférenceSélectionnée, p + 1)
  
  ' Tests détaillés, selon le mode
  If cmdModeVisualisation.Checked Then     ' Mode visualisation
  
    If Val(sStatusIntervention) < 0 Then
      MsgBox2i "CR286"
      'MsgBox "Référence d'intervention inexistante !", vbExclamation, sNomApp
      Exit Sub
    End If
    If bStatusEchantillon = False Then
      MsgBox2i "CR287"
      'MsgBox "Echantillon non saisi pour cette référence d'intervention !", vbExclamation, sNomApp
      Exit Sub
    End If
    If txtNumEtb <> "" Then
      If txtNumEtb <> sStatusIntervention Then
        MsgBox2i "CR288", sStatusIntervention, txtNumEtb
        'MsgBox "Attention - La référence est saisie pour l'établissement " & iStatusIntervention & ", alors que vous demandez la visualisation pour l'établissement " & txtNumEtb & ".", vbExclamation, sNomApp
        Exit Sub
      End If
    End If
    VisualiseRA sRefSansPoint
    ' Pas besoin de purger le cache, dans le cas d'une visualisation en principe on ne peut rien faire
  
  Else  ' Mode saisie/modification
  
    ' Premier RA d'une intervention
    If Val(sStatusIntervention) < 0 Then
      If txtNumEtb = "" Then
        MsgBox2i "CR289"
        'MsgBox "Pour la première saisie d'une intervention, le numéro d'établissement est obligatoire." & vbCrLf & vbCrLf & "Si l'établissement n'est pas encore créé, utiliser le code 0 et spécifier manuellement les options d'édition et les options laboratoire appropriées pour cet établissement.", vbExclamation, sNomApp
        txtNumEtb.SetFocus
        Exit Sub
      End If
      
      ' Contrôle des plannings, désactivé pour l'établissement Belgique
      ' ansi que pour les démos en ZZ
      If txtNumEtb <> "3" And Left(sRefSansPoint, 2) <> "ZZ" Then
        Dim sRefInt As String, iEch As Integer
        sRefInt = Left(sRefSansPoint, Len(sRefSansPoint) - 2)
        iEch = Val(Right(sRefSansPoint, 2))
        
        Dim iErr As Integer
        iErr = iTestPlanning(sRefInt, txtNumEtb, iEch)
        Select Case iErr
          Case 0:   ' Nop, tout est Ok
          
          Case 1:   ' Planning inexistant
            ' Planning inexistant.||Vous ne pouvez pas enregistrer d'échantillon sous la référence %1 il n'existe pas de planning correspondant.|Corrigez la référence, ou créez le planning correspondant.
            MsgBox2i "CR331", sRefSansPoint
            Exit Sub
          Case 2:
            ' Attention ! Le cadre de prélèvement sélectionné n'est pas de type intervention exceptionnelle, alors que la case IE est cochée...||Vérifiez qu'il n'y a pas d'erreur.
            MsgBox2i "CR332"
            Exit Sub
          Case 65 To 90:
            ' L'échantillon %1 a déjà été enregsitré sur le labo %2, l'enregistrement est impossible.
            MsgBox2i "CR232b", iEch, Chr(iErr)
            Exit Sub
        End Select
      End If
      
      If bNouveauRA(sRefSansPoint, txtNumEtb) Then
        MAJStatus sRéférenceSélectionnée, sGetIntlLib("CRtxtNouveauRA", "Saisie nouveau RA en cours")
      End If
      Exit Sub
    End If
    
    ' Nouveau RA dans une intervention où il y en a déjà
    If bStatusEchantillon = False Then
      If txtNumEtb <> "" Then
        If txtNumEtb <> sStatusIntervention Then
          MsgBox2i "CR290", sStatusIntervention, txtNumEtb
          'MsgBox "Attention - Des RA sont déjà saisis pour l'établissement " & iStatusIntervention & " pour cette référence d'intervention, alors que vous demandez la saisie pour l'établissement " & txtNumEtb & ".", vbExclamation, sNomApp
          Exit Sub
        End If
      End If
      If bNouveauRA(sRefSansPoint, sStatusIntervention) Then
        MAJStatus sRéférenceSélectionnée, sGetIntlLib("CRtxtNouveauRA", "Saisie nouveau RA en cours")
      End If
      Exit Sub
    End If
    
    ' RA existant
    If txtNumEtb <> "" Then
      If txtNumEtb <> sStatusIntervention Then
        MsgBox2i "CR291", sStatusIntervention, txtNumEtb
        'MsgBox "Attention - Ce RA est saisi pour l'établissement " & iStatusIntervention & ", alors que vous demandez l'établissement " & txtNumEtb & ".", vbExclamation, sNomApp
        Exit Sub
      End If
    End If
    If bModifieRA(sRefSansPoint) Then
      MAJStatus sRéférenceSélectionnée, sGetIntlLib("CRtxtSaiViRA", "Saisie / Visualisation RA en cours")
    End If
  End If
End Sub


Private Sub btnDémo_click()
  txtRéférence = "ZZ200000.01"
  txtNumEtb = ""
  EffaceListeRéférences
  btnRechercher_Click
End Sub

Private Sub cmdEffacer_Click()
  EffaceListeRéférences
  txtCB = ""
  txtNumEtb = ""
  txtRéférence = ""
  On Error Resume Next      ' Au cas où la feuille ne soit pas active
  txtRéférence.SetFocus
  On Error GoTo 0
  btnRechercher.Default = True
End Sub


Private Sub cmdAideContextuelle_Click()
  Aide "frmrech"
End Sub

Private Sub cmdAideSommaire_Click()
  Aide "index"
End Sub

Private Sub cmdAPropos_Click()
  If bShiftPressed Then
    frmAPropos.AProposAgent
  Else
    frmAPropos.Show vbModal
  End If
End Sub

Private Sub cmdCache_Click()
  frmCache.Show 1
End Sub

Private Sub cmdPurgeCache_Click()
  On Error Resume Next
  Kill App.Path & "\Cache utilisateurs 3.dat"
  Kill App.Path & "\Cache lettres 2.dat"
  Kill App.Path & "\Cache germes.dat"
  Kill App.Path & "\Cache milieux.dat"
  Kill App.Path & "\Cache conclusions.dat"
  Kill App.Path & "\Cache unités.dat"
  Kill App.Path & "\Cache méthodes.dat"
  Kill App.Path & "\Cache libellés Ercem.dat"
  Kill App.Path & "\Cache libellés CRA.dat"
  On Error GoTo 0
  MsgBox2i "CR292"
  'MsgBox "Les fichiers cache ont été effacés.", vbInformation, sNomApp
End Sub

Private Sub KillAnciensCaches()
  On Error Resume Next
  Kill App.Path & "\Cache lieux de prélèvement.dat"
  Kill App.Path & "\Cache cadres de prélèvement.dat"
  Kill App.Path & "\Cache aspects à réception.dat"
  Kill App.Path & "\Cache conditionnements.dat"
End Sub



Private Sub cmdConfigImprimante_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  frmConfigImprimante.Show 1
End Sub

Private Sub cmdConnexion_Click()
  If tcps.Etat() = 7 Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Connexion
  frmConfigImprimante.InitImprimantes
End Sub

Private Sub cmdDéconnexion_Click()
  If tcps.Etat() <> 7 Then Exit Sub  ' Déjà déconnecté
  If bBlocageEnCours Then Beep: Exit Sub
  
  Déconnexion
End Sub

Private Sub cmdDernièresModifs_Click()
  InfoVersion False
End Sub

Private Sub cmdIdentification_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim iRep As Integer
  iRep = frmLogin.iInitUtilisateur(True)
  Select Case iRep
    Case 0: AjusteSelonNiveauUtilisateur
    Case 1: ' Rien (on a annulé la commande)
    Case 2: cmdSystèmeUnix_Click
  End Select
End Sub

' Les utilisateurs de niveau 16 ont le menu avancé
Private Sub AjusteSelonNiveauUtilisateur()
  Dim iNiveau As Integer
  iNiveau = NZ(UtiParNuméro(iNumOpérateur).uti_niveau)
  mnuAvancé.Visible = (iNiveau And 16) <> 0
End Sub


' =============================================================================
' RA non validés à J+1

Private Sub cmdRANonValidés_Click()
  EffaceListeRéférences
  txtCB = ""
  txtNumEtb = ""
  txtRéférence = ""
  
  sbStatus.Panels("Info").Text = sGetIntlLib("CO091", "Recherche en cours, patientez…")
  Screen.MousePointer = vbHourglass
  
  Bloquer
    Dim br As New Rev
    tcps.Envoie "CRANV"
    
    Dim sLigne As String
    Dim sRef As String, dDateSais As Date
    Do
      sLigne = tcps.Reçoit
      If Left(sLigne, 2) = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sRef, dDateSais
      AjouteRéférence sRef, "", sprintf(sGetIntlLib("CRtxtRANonVal2", "Saisi le %1, A valider"), Format(dDateSais, "dd/mm/yyyy"))
      'AjouteRéférence sRef, "Saisi le " & Format(dDateSais, "dd/mm/yyyy"), "A valider"
    Loop
  Relâcher
'  MAJTousStatus
  If lvRéférences.ListItems.Count > 0 Then
    btnAction.Enabled = True
    btnAction.Default = True
    lvRéférences.SetFocus
    SendKeys " "
    DoEvents
  End If
  GotFocus
  Screen.MousePointer = vbDefault
End Sub


' =============================================================================
' Analyses arrivées à échéance

' Recherche des références
Private Sub cmdRAEchus_Click()
  EffaceListeRéférences
  txtCB = ""
  txtNumEtb = ""
  txtRéférence = ""
  
  sbStatus.Panels("Info").Text = sGetIntlLib("CO091", "Recherche en cours, patientez…")
  Screen.MousePointer = vbHourglass
  
  Bloquer
    Dim br As New Rev
    tcps.Envoie "ECHU"
    
    Dim sLigne As String
    Dim sRef As String, dDateSais As Date
    Do
      sLigne = tcps.Reçoit
      If Left(sLigne, 2) = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sRef, dDateSais
      AjouteRéférence sRef, "", sprintf(sGetIntlLib("CRtxtRANonVal3", "Saisi le %1, Attacher FRT"), Format(dDateSais, "dd/mm/yyyy"))
      'AjouteRéférence sRef, "Saisi le " & Format(dDateSais, "dd/mm/yyyy"), "Attacher FRT"
    Loop
  Relâcher
  If lvRéférences.ListItems.Count > 0 Then
    btnAction.Enabled = True
    btnAction.Default = True
    lvRéférences.SetFocus
    SendKeys " "
    DoEvents
    lvRéférences_Click
  Else
    MsgBox2i "CR293"
    'MsgBox "Aucune analyse arrivée à échéance n'a été sélectionnée !", vbExclamation, sNomApp
  End If
  GotFocus
  Screen.MousePointer = vbDefault
End Sub


' Rattachement et impression de la FRT des analyses arrivées à échéance
Private Sub cmdAttacherEchus_Click()
  Dim br As New Rev
  Dim iFRT As Long, sMessage As String
  
  If Left(sImprimanteLaser, 5) = "[Nul]" Then Exit Sub
  
  If Left(sImprimanteLaser, 5) = "[Win]" Then
    EchusWindows
    Exit Sub
  End If
  
  sbStatus.Panels("Info").Text = sGetIntlLib("CO091", "Recherche en cours, patientez…")

  Bloquer
    br.AddField sImprimanteLaser
    tcps.Envoie "ECHF " & br.Buffer
    
    Dim sLigne As String
    
    sLigne = tcps.Reçoit
    br.Buffer = sLigne
    br.GetField iFRT, sMessage
    
    AttendSynchro
  Relâcher
      
  Select Case iFRT
    Case 0:
      MsgBox2i "CR293"
      'MsgBox "Aucune analyse arrivée à échéance n'a été sélectionnée !", vbExclamation, sNomApp
      
    Case Is < 0:
      MsgBox2i "CR294", sMessage
      'MsgBox "Échec pendant la sélection des analyses : " & vbCrLf & sMessage, vbExclamation, sNomApp
      
    Case Else:
      MsgBox2i "CR295", iFRT
      'MsgBox "La FRT " & iFRT & " a été imprimée.", vbInformation, sNomApp
  End Select

  GotFocus    ' Affiche le status du champ qui a le focus
End Sub


' Impression de la FRT des analyses échues, version Windows
' Dans ce cas, on demande à Unix le n° de FRT des analyses échues
' et on se charge de l'impression
Private Sub EchusWindows()
  Dim br As New Rev, iFRT As Long
  Bloquer
    tcps.Envoie "NFE"     ' N° de FRT Echue
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    br.Buffer = sLigne
    br.GetField iFRT
    
    AttendSynchro
  Relâcher
  
  If iFRT > 0 Then ImprimeFRT iFRT
End Sub


' =============================================================================
' Fiche récapitulative tournée

Private Sub mnuFRT_Click()
  cmdFRTImprimeCourant.Enabled = iNumFRTCourante > 0
  cmdFRTImprimée.Enabled = iNumFRTCourante > 0
End Sub

Private Sub cmdFRTImprimeCourant_Click()
  If iNumFRTCourante = 0 Then
    MsgBox2i "CR296"
    'MsgBox "Pas de FRT courante à imprimer !", vbInformation, sNomApp
    Exit Sub
  End If
  ImprimeFRT iNumFRTCourante
  EffaceFRTCourante
End Sub

Private Sub cmdFRTAccèsGénéral_Click()
  Dim iFRT
  
  iFRT = InputBox(sGetIntlLib("CRtxtAG1", "No de FRT à imprimer, ou à réimprimer ?"), sNomApp)
  If iFRT = "" Then Exit Sub
  
  If Not IsNumeric(iFRT) Then
    MsgBox2i "CO004", iFRT
    'MsgBox "No de FRT invalide !", vbExclamation, sNomApp
    Exit Sub
  End If
  iFRT = CLng(iFRT)
  If iFRT < 1 Then
    MsgBox2i "CO004", iFRT
    'MsgBox "No de FRT invalide !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  DoImprimeFRT iFRT
End Sub

Public Sub DoImprimeFRT(ByVal iFRT As Long)
  ImprimeFRT iFRT
  If iFRT = iNumFRTCourante Then EffaceFRTCourante
End Sub

Private Sub cmdFRTImprimée_Click()
  EffaceFRTCourante
End Sub

Private Sub cmdFRTEtat_Click()
  AfficheEtatFRT
End Sub


' =============================================================================
' Mode de travail (saisie, visualisation)

Private Sub cmdModeVisualisation_Click()
  cmdModeVisualisation.Checked = True
  cmdModeSaisie.Checked = False
End Sub

Private Sub cmdModeSaisie_Click()
  cmdModeVisualisation.Checked = False
  cmdModeSaisie.Checked = True
End Sub

' =============================================================================
' Jeu de tables

Private Sub cmdTableST_Click()
  cmdTableST.Checked = True
  cmdTableSL.Checked = False
End Sub

Private Sub cmdTableSL_Click()
  cmdTableSL.Checked = True
  cmdTableST.Checked = False
End Sub



Private Sub cmdOptions_Click()
  frmOptions.Show 1
  DoOptionsAffichage
End Sub

Public Sub DoOptionsAffichage()
  ' On masque les contrôles et menus si on n'est pas en mode avancé
  mnuSystème.Visible = bAfficherMenuSystème
  cmdTableST.Visible = bAfficherMenuSystème
  cmdTableSL.Visible = bAfficherMenuSystème
  sep0.Visible = bAfficherMenuSystème
  btnDémo.Visible = bAfficherMenuSystème
  cmdFRTImprimée.Visible = bAfficherMenuSystème
  
  ' Barre de boutons de la feuille
  AjusterBarreBoutons
  
  ' On met à jour les barres de boutons sur les feuilles RA
  Dim f
  For Each f In Forms
    If TypeOf f Is frmRA Then f.AjusterBarreBoutonsRA
  Next
End Sub

' ===============================================================================
' Barre de boutons

Private Sub tbBoutons_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then PopupMenu mnuBarreBoutons
End Sub

Private Sub mnuBarreBoutons_Click()
  cmdEtiquettes.Checked = bAfficherEtiquettesDeBoutons
End Sub

' L'effacement de la barre de boutons est sous-traité plus haut
Private Sub cmdBarreStandard_Click()
  frmOptions.PasDeBarreDeBoutons
  DoOptionsAffichage
End Sub

Private Sub cmdEtiquettes_Click()
  frmOptions.AfficherEtiquettesDeBoutons Not cmdEtiquettes.Checked
  DoOptionsAffichage
End Sub


Private Sub AjusterBarreBoutons()
  If bAfficherBarreDeBoutons Then
    tbBoutons.Visible = True
    
    If bAfficherEtiquettesDeBoutons Then
      SetLib tbBoutons.Buttons("Nouveau"), "Caption", "CRtbNouveau"
      SetLib tbBoutons.Buttons("Utilisateur"), "Caption", "CRtbUtilisateur"
      SetLib tbBoutons.Buttons("Unix"), "Caption", "CRtbUnix"
      SetLib tbBoutons.Buttons("Imprimante"), "Caption", "CRtbImprimante"
      SetLib tbBoutons.Buttons("ImprimeFRT"), "Caption", "CRtbImprimeFRT"
      SetLib tbBoutons.Buttons("DétailFRT"), "Caption", "CRtbDétailFRT"
      SetLib tbBoutons.Buttons("Anomalie"), "Caption", "CRtbAnomalie"
        
      
    Else
      Dim b As Button
      For Each b In tbBoutons.Buttons
        b.Caption = ""
      Next
    End If
  Else
    tbBoutons.Visible = False
  End If
  
  DoEvents    ' Sinon la propriété height n'est pas mise à jour !
  Cls
  Form_Paint

  Dim vOff As Integer
  If bAfficherBarreDeBoutons Then
    vOff = tbBoutons.height
  Else
    vOff = 0
  End If
  vOff = vOff - 28 ' Hauteur de la barre en mode développement (offset des top relevés)
  
  lblCodeBarre.Top = vOff + 40
  txtCB.Top = vOff + 36
  btnDémo.Top = vOff + 36
  lblEtablissement.Top = vOff + 68
  txtNumEtb.Top = vOff + 64
  txtPréfixe.Top = vOff + 64
  txtNomEtb.Top = vOff + 64
  lblRéférence.Top = vOff + 96
  txtRéférence.Top = vOff + 92
  btnRechercher.Top = vOff + 92
  btnAction.Top = vOff + 92
  lblRA.Top = vOff + 120
  lvRéférences.Top = vOff + 120
End Sub

' ===============================================================================

Private Sub cmdQuitter_Click()
  Unload Me
End Sub


Private Function bRAOuvert() As Boolean
  Dim f As Form
  For Each f In Forms
    If TypeOf f Is frmRA Then
      MsgBox2i "CR297"
      'MsgBox "Vous ne pouvez pas effectuer cette opération tant qu'il reste un RA affiché !", vbExclamation, sNomApp
      bRAOuvert = True
      Exit Function
    End If
  Next
  bRAOuvert = False
End Function

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iNumFRTCourante > 0 Then
    MsgBox2i "CR298"
    'MsgBox "Vous ne pouvez pas quitter le programme tant que la FRT courante n'a pas été imprimée !", vbExclamation, sNomApp
    Cancel = 1
    Exit Sub
  End If
  
  If bRAOuvert Then
    Cancel = 1
    Exit Sub
  End If
  
  ContrôleVerrous
  Cancel = 0
End Sub


Private Sub Form_Unload(Cancel As Integer)
  If bBlocageEnCours Then Beep: Cancel = True: Exit Sub

  bDéchargementFinalEnCours = True
  Dim f
  For Each f In Forms
    If Not f Is Me Then Unload f
  Next

  Unload Me
  tcps.Ferme
  tcps.Destruction
End Sub

'========================================================

Private Sub cmdRechEtablissement_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim e As Etablissement, c As Collection
  Set c = frmRechercheEtablissement.Cherche2()
  Dim sMessage As String
  For Each e In c
    sMessage = sMessage & vbCrLf & e.etb_numetb & ": " & e.etb_prefixe & " " & e.etb_nom
  Next
  If sMessage <> "" Then
    MsgBox2i "CR299", sMessage
    'MsgBox "Établissement(s) sélectionné(s) :" & sMessage, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechLettres_Click()
  If bDéconnecté() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim l As String
  l = frmRechercheLettres.Cherche()
  If l <> "" Then
    MsgBox2i "CR300"
    'MsgBox "Lettres sélectionnées: " & l, vbInformation, sNomApp
  End If
End Sub


'========================================================

Private Sub cmdSystèmeUnix_Click()
  If bBlocageEnCours Then Beep: Exit Sub
  If bRAOuvert Then Exit Sub
  If iNumFRTCourante > 0 Then
    MsgBox2i "CR301"
    'MsgBox "Vous ne pouvez pas changer de système Unix tant que la FRT courante n'a pas été imprimée !", vbExclamation, sNomApp
    Exit Sub
  End If

  Dim sOldSystème As String
  sOldSystème = sSystèmeDistant
  
restart:
  frmConfigUnix.Show vbModal
  If sSystèmeDistant <> sOldSystème Then
    frmSplash.Show
    frmSplash.Refresh
    frmSplash.ZOrder 0
    Screen.MousePointer = vbHourglass
    
    Déconnexion
    frmLogin.EffaceCacheMotsDePasse
    cmdEffacer_Click
    iOldEtat = 0    ' Force l'affichage de la mise à jour de l'état

    Connexion
    Unload frmSplash
    Screen.MousePointer = vbDefault
    
    frmSplash.Hide
    Select Case frmLogin.iInitUtilisateur(False)
      Case 1:       ' Annuler
        MsgBox2i "CO025"
        Unload Me     ' Sans risque, on sait que tous les RA sont fermés
        Exit Sub
      
      Case 0:       ' Ok
        
      Case 2:       ' Changement de système Unix
        GoTo restart
    End Select

    frmConfigUnix.MémoriseSystèmeDistant
    frmConfigImprimante.InitImprimantes
    
  End If
End Sub

Private Sub cmdTCPFenetre_Click()
  cmdTCPFenetre.Checked = Not cmdTCPFenetre.Checked
  tcps.AfficheTrace cmdTCPFenetre.Checked
  SaveSetting sApplicationGlobale, "Options", "FenêtreTCP", IIf(cmdTCPFenetre.Checked, 1, 0)
End Sub

Private Sub cmdRelâcher_Click()
  Relâcher
End Sub


Private Sub Form_KeyPress(KeyAscii As Integer)
  If bEnCours Then
    KeyAscii = 0
  ElseIf KeyAscii = 37 Then       ' Asc("%")
    btnAction.Enabled = False
    txtCB = ""
    txtRéférence = ""
    txtNumEtb = ""
    txtCB.SetFocus
    KeyAscii = 0
  End If
End Sub


' Style visuel XP
Private Sub Form_Initialize()
  Dim x As Long
  x = InitCommonControls
End Sub

Private Sub Form_Load()
  Dim bPremierLancement As Boolean
  Dim sBienvenue As String
  
  IntlInit
  Internationalisation
  
  If App.PrevInstance Then
    If InStr(Command, "-h") = 0 Then MsgBox2i "CO024", sNomApp
    sNomOpérateur = GetSetting(sApplicationGlobale, "Utilisateur", "Nom", "")
    On Error Resume Next
    Caption = sNomApp
    AppActivate sNomApp & " [" & sNomOpérateur & "]"
    Unload frmTCP
    Unload Me
    End
  End If
  
  Set frmBase = Me
  
  CommandesInitiales
  
  ContrôleDernièreVersion   ' On vérifie qu'il n'y a pas une version plus récente sur Z
  ContrôleEnvironnement     ' On vérifie que l'environnement du programme est Ok
  
  frmOptions.InitOptions
  If GetSetting(sApplicationGlobale, "Options", "FenêtreTCP", 0) Then
    cmdTCPFenetre.Checked = True
    tcps.AfficheTrace True
  End If
  
  DoOptionsAffichage
  Show
  AppActivate Caption       ' Au cas où on lance avec la touche shift pressée
  DoEvents
  
  If GetSetting(sApplicationGlobale, "Utilisateur", "Nom", "") = "" Then bPremierLancement = True
  
  If bPremierLancement Then
    Do
      frmSplash.lblChargement.Visible = False
      frmSplash.lblBienvenue.Visible = True
      
      sBienvenue = sGetIntlLib("sBienvenue", "Bienvenue !") & vbCrLf & vbCrLf
      frmSplash.lblBienvenue = sBienvenue
      frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("sBienvenue1", "") & vbCrLf
      frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("sBienvenue2", "") & vbCrLf & vbCrLf
      frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("sBienvenue3", "")
      
      frmSplash.Width = 7035
      frmSplash.height = 3700
      
      Dim cSauveLangage As String
      cSauveLangage = cLangage
      frmSplash.Show vbModal
    Loop Until cSauveLangage = cLangage
    frmSplash.btnLangue.Visible = False
  Else
    Enabled = False
    frmSplash.Show
    frmSplash.Refresh
  End If
  

  frmConfigUnix.InitSystème
  If sSystèmeDistant = "" Then
    MsgBox2i "CO037"
    Unload Me
    End
  End If
  
  
  ' On se connecte…
  Connexion
  frmConfigUnix.MémoriseSystèmeDistant
  
  ' Connexion
'  Select Case frmLogin.iInitUtilisateur(InStr(LCase(Command), "-nologin") = 0)         ' Utilisateur courant, identification forcée
  Select Case frmLogin.iInitUtilisateur(False)
    Case 0:   ' Ok
    
    Case 1:   ' Annuler
      MsgBox2i "CO025"
      Unload Me
      End
      
    Case 2:   ' Changement de système Unix
      cmdSystèmeUnix_Click
  End Select
  
  
  ' Si le cache de messages internationaux n'existe pas, on le charge
  ' et on remet à jour l'interface
  If bIntlInitCache Then Internationalisation

  
  AjusteSelonNiveauUtilisateur
  
'  If bPremierLancement Then
'    frmSplash.lblChargement.Visible = False
'    frmSplash.lblBienvenue.Visible = True
'    frmSplash.lblBienvenue = sBienvenue
'    frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("CO089", "Pour le premier lancement, vous allez choisir l'imprimante que vous utiliserez.")
'    frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("CR190", "Vous pourrez modifier ce choix à tout moment par la suite avec la commande RA, Configuration imprimante.")
'    frmSplash.Width = 7035
'    frmSplash.height = 3700
'    frmSplash.Show 1
'  End If

  ' On lit le nom de l'imprimante dans la registry
  frmConfigImprimante.InitImprimantes
  If sImprimanteLaser = "" Then
    MsgBox2i "CO039"
    End
  End If
  
'  If bPremierLancement Then
'    frmSplash.lblChargement.Visible = False
'    frmSplash.lblBienvenue.Visible = True
'    frmSplash.lblBienvenue = sBienvenue
'    frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("sBienvenue4", "Fin de l'initialisation")
'    frmSplash.Width = 7035
'    frmSplash.height = 3700
'    frmSplash.Show 1
'  End If
  
  ' Fin du chargement
  Enabled = True
  Unload frmSplash
  
  '' Installation automatique de l'agent
  'frmInstallAgent.AutoInstallAgent
  
  ' Affichage des informations sur la nouvelle version
  InfoVersion True
  
  ' Par défaut en saisie
  cmdModeSaisie_Click
  
  ' On active les boutons, désactivés à la création par sécurité
  btnDémo.Enabled = True
  ' le bouton Action sera enabled quand la liste sera remplie
  ' le bouton Rechercher sera actif après la saisie d'une référence
  
  KillAnciensCaches
  
  ' On récupère le n° de version de la biblio des RAs ainsi que le nombre maxi de germes
  RécupèreInfosLibRA
  
  ' On récupère les infos de la table traitepar
  ChargeInfosTraitéPar
End Sub


Private Sub InfoVersion(bDémarrage As Boolean)
  Dim sVersionInfo As String, sVersionProgramme As String
  
  sVersionInfo = GetSetting(sApplicationGlobale, "Général", "VersionInfo", "")
  sVersionProgramme = App.Major & "." & App.Minor & "." & App.Revision
  If Not bDémarrage Or sVersionProgramme <> sVersionInfo Then
'    MsgBox "Informations sur la version " & sVersionProgramme & vbCrLf & vbCrLf & _
'      "Cette version imprime désormais correctement les plannings de plus de 20 interventions, avec pagination." & vbCrLf & vbCrLf, _
'      vbInformation, "Plannings version " & sVersionProgramme
    If sVersionProgramme <> sVersionInfo Then SaveSetting sApplicationGlobale, "Général", "VersionInfo", sVersionProgramme
  End If
End Sub


Private Sub Form_Paint()
  Line (0, 0)-Step(ScaleWidth, 0), vbButtonShadow
  Line (0, 1)-Step(ScaleWidth, 0), vb3DHighlight
  
  If (bAfficherBarreDeBoutons) Then
    Line (0, tbBoutons.height)-Step(ScaleWidth, 0), vbButtonShadow
    Line (0, tbBoutons.height + 1)-Step(ScaleWidth, 0), vb3DHighlight
  End If
End Sub


' =============================================================================
' Barre de boutons

Private Sub tbBoutons_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Key
    Case "Nouveau":     cmdEffacer_Click
    Case "Utilisateur": cmdIdentification_Click
    Case "Unix":        cmdSystèmeUnix_Click
    Case "Imprimante":  cmdConfigImprimante_Click
    
    Case "ImprimeFRT":  cmdFRTImprimeCourant_Click
    Case "DétailFRT":   cmdDétailFRT_Click
    
    Case "Anomalie":    cmdSaisieAnomalie_Click
    
    Case Else:          MsgBox2i "CR302", Button.Key
                        'MsgBox "Bouton '" & Button.Key & "' inconnu !", vbCritical, sNomApp: Stop
  End Select
End Sub


Private Sub sbStatus_PanelDblClick(ByVal Panel As Panel)
  If Panel.Key = "Info" Then MsgBox2i "CR303"
                              'MsgBox "Cette zone affiche des messages d'aide et d'information généraux, en particulier le rôle de l'élément sélectionné.", vbInformation, sNomApp
  If Panel.Key = "Impr" Then cmdConfigImprimante_Click
  If Panel.Key = "EInt" Then MsgBox2i "CR304"
                              'MsgBox "Cette zone indique si le programme échange des données avec le démon Unix." & vbCrLf & "Prêt indique qu'il n'y a pas de communication en cours." & vbCrLf & "Bloqué indique qu'il y a un échange de données en cours.", vbInformation, sNomApp
  If Panel.Key = "ECom" Then cmdSystèmeUnix_Click
End Sub


' =============================================================================
' Gestion du GotFocus (affichage de l'aide sur le contrôle courant)

Private Sub GotFocus()
  If ActiveControl Is lvRéférences Then
    If lvRéférences.ListItems.Count > 0 Then
      sbStatus.Panels("Info").Text = ActiveControl.Tag
    Else
      sbStatus.Panels("Info").Text = ""
    End If
  Else
    sbStatus.Panels("Info").Text = ActiveControl.Tag
  End If

  If TypeOf ActiveControl Is TextBox Then AutoSelect ActiveControl
End Sub

Private Sub txtCB_GotFocus(): GotFocus: End Sub

Private Sub txtCB_KeyPress(KeyAscii As Integer)
  If bEnCours Then KeyAscii = 0: Exit Sub
 
  If txtRéférence <> "" Then txtRéférence = ""
  If txtNumEtb <> "" Then txtNumEtb = ""
  
  If KeyAscii = 13 Then
    KeyAscii = 0
    If Len(txtCB) = 18 Then CBChange
  End If
End Sub

Private Sub txtRéférence_GotFocus(): GotFocus: End Sub
Private Sub txtNumEtb_GotFocus(): GotFocus: End Sub
Private Sub txtPréfixe_GotFocus(): GotFocus: End Sub
Private Sub txtNomEtb_GotFocus(): GotFocus: End Sub
Private Sub btnAction_GotFocus(): GotFocus: End Sub
Private Sub btnDémo_GotFocus(): GotFocus: End Sub
Private Sub lvRéférences_GotFocus(): GotFocus: End Sub


' =============================================================================
' Code barre

Private Sub CBChange()
  bEnCours = True
  
  Const cSite As String = "GAPMOTBCDEFHIJKLNQRSUVWXYZ"
  Dim iSite As Integer, iPrel As Integer, iCS As Integer, iIng As Integer
  Dim iPrest As Long, sEtb As String
  Dim bEtbFimebio As Boolean
  
  iSite = Val(Left(txtCB, 3))
  iPrest = Val(Mid(txtCB, 4, 6))
  iPrel = Val(Mid(txtCB, 10, 2))
  sEtb = Val(Mid(txtCB, 12, 5))     ' Ne gère pas les n°s alphanumériques
  iCS = Val(Mid(txtCB, 17, 2))
  
  ' Vérification de la somme de contrôle
  ' Formule stupide, le premier chiffre n'est pas pris en compte (on multiplie par zéro…)
  Dim i As Integer, iCS2 As Integer
  For i = 0 To 15
    iCS2 = iCS2 + (Asc(Mid(txtCB, i + 1, 1)) - 48) * i
  Next
  If iCS = (iCS2 + 11) Mod 100 Then
    iCS2 = iCS2 + 11
    bEtbFimebio = True
  Else
    bEtbFimebio = False
  End If
  iCS2 = iCS2 Mod 100
  If iCS <> iCS2 Then
    MsgBox2i "CR305", iCS, iCS2
    'MsgBox "Erreur de check-sum !" & vbCrLf & "Lu: " & iCS & "  Calculé: " & iCS2, vbExclamation, sNomApp
  Else
    Dim sCB As String
    sCB = txtCB
    
    iIng = iSite Mod 26
    iSite = iSite \ 26
    
    ' Fin du test le 12/7/01 PV
    '' Cas spécial de la Belgique, on force l'établissement à 3
    'If Mid(cSite, iSite + 1, 1) = "X" Then sEtb = "3"
    
    If iPrel = 0 Then       ' Cas des étiquettes .FP
      txtNumEtb = ""        ' Pas n° d'établissement dans ce cas (celui de la planche d'IE est parfois buggé…)
      iPrel = 1
    Else
      If sEtb = "1" Then    ' Scan de la FRT (idiot, mais…)
        txtNumEtb = ""
      Else
        If bEtbFimebio Then sEtb = sEtb & Chr(65 + Val(sEtb) Mod 26)
        txtNumEtb = sEtb
      End If
    End If
    txtNumEtb_LostFocus
    
    txtRéférence = Mid(cSite, iSite + 1, 1) & Chr(65 + iIng) & iPrest & "." & Right(Str(100 + iPrel), 2)
    Génère6Références False
    btnRechercher.Enabled = False
    MAJTousStatus
    txtCB = sCB
    
    ' On restaure le bouton par défaut
    btnAction.Enabled = True
    btnAction.Default = True
  End If
 
  bEnCours = False
End Sub


' ==============================================================================
' Référence

' Retourne le status d'intervention sous la forme de deux code d'état: cEtatPH et cEtatLabo
' Les deux sont à vide si l'échantillon n'a pas encore été saisi
Function sGetRefStatusEch(ByVal sRef As String, ByRef cEtatPH As String, ByRef cEtatLabo As String)

  ' Normalisation interne de la référence, sans point
  Dim p As Integer
  Dim sRefSansPoint As String
  p = InStr(sRef, ".")
  If p > 0 Then
    sRefSansPoint = Left(sRef, p - 1) & Mid(sRef, p + 1)
  Else
    sRefSansPoint = sRef
  End If
  
  
  Bloquer
    Dim br As New Rev
    br.AddField IIf(frmRecherche.cmdTableSL.Checked, tcLabo, tcBacterio)
    br.AddField sRefSansPoint
    tcps.Envoie "TECH " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    br.Buffer = sLigne
    br.GetField cEtatPH
    br.GetField cEtatLabo

    ' Contrôle
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  Relâcher
  
  Dim sStatus As String
  
  If cEtatPH = "" And cEtatLabo = "" Then
    sStatus = "Nouveau RA"
  Else
    sStatus = cEtatPH & "/" & cEtatLabo & ": "
    
    Select Case cEtatPH
      Case "": sStatus = sStatus & sGetIntlLib("CREtatPH0", "Pas de saisie PH")
      Case "1": sStatus = sStatus & sGetIntlLib("CREtatPH1", "Saisie PH labo")
      Case "2": sStatus = sStatus & sGetIntlLib("CREtatPH2", "Saisie PH en cours")
      Case "3": sStatus = sStatus & sGetIntlLib("CREtatPH3", "Saisie PH validée")
    End Select
  
    If cEtatLabo <> "" Then
      sStatus = sStatus & ", " & sLibelléEtatLabo(cEtatLabo)
    Else
      sStatus = sprintf(sGetIntlLib("CREtatL0", "analyse pas commencée."), sStatus)
      'sStatus = sStatus & ", analyse pas commencée."
    End If
  End If
   
  sGetRefStatusEch = sStatus
End Function


' Vérifie si une référence est valide
' Si c'est le cas, retourne le n° d'établissement déjà utilisé sur l'intervention, ou -1 si il n'y a eu aucune saisie
Function bOkRéférence(txtRéférence As String, ByVal bMessage As Boolean, ByRef sStatusIntervention As String, ByRef bStatusEchantillon As Boolean) As Boolean
  
  ' Première partie: vérifications simples
  If txtRéférence = "" Then
    If bMessage Then MsgBox2i "CR306"
                      'MsgBox "La référence est obligatoire !", vbExclamation, sNomApp
    bOkRéférence = False
    Exit Function
  End If
  
  If Len(txtRéférence) < 9 Or Len(txtRéférence) > 11 Then
    If bMessage Then MsgBox2i "CO004", txtRéférence
                      'MsgBox "Référence invalide ! (doit faire de 9 à 11 caractères)", vbExclamation, sNomApp
    bOkRéférence = False
    Exit Function
  End If
  
  ' Normalisation externe de la référence, avec point
  If txtRéférence <> UCase(txtRéférence) Then txtRéférence = UCase(txtRéférence)
  
  If Left(txtRéférence, 1) < "A" Or Left(txtRéférence, 1) > "Z" Or Mid(txtRéférence, 2, 1) < "A" Or Mid(txtRéférence, 2, 1) > "Z" Then
    If bMessage Then MsgBox2i "CR307"
                      'MsgBox "La référence doit commencer par 2 lettres !", vbExclamation, sNomApp
    bOkRéférence = False
    Exit Function
  End If
  
  ' On vérifie que les deux lettres sont bien affectées. ZZ est autorisé pour les essais
  If Left(txtRéférence, 2) <> "ZZ" And UtiParLettres(Left(txtRéférence, 2)) Is Nothing Then
    If bMessage Then MsgBox2i "CR308"
                      'MsgBox "Les deux lettres de la référence ne sont pas affectées à un assistant !", vbExclamation, sNomApp
    bOkRéférence = False
    Exit Function
  End If
      
  Dim p As Integer
  Dim sRefSansPoint As String

  p = InStr(txtRéférence, ".")
  If p = 0 Then
    sRefSansPoint = txtRéférence
    txtRéférence = Left(txtRéférence, Len(txtRéférence) - 2) & "." & Right(txtRéférence, 2)
  Else
    If p <> Len(txtRéférence) - 2 Then
      If bMessage Then MsgBox2i "CR309"
                        'MsgBox "Le numéro d'échantillon après le point doit être compris entre 01 et 99 !", vbExclamation, sNomApp
      bOkRéférence = False
      Exit Function
    End If
    sRefSansPoint = Left(txtRéférence, p - 1) & Mid(txtRéférence, p + 1)
  End If
  
  Dim dRef As Double
  dRef = Val(Mid(txtRéférence, 3))
  
  If dRef < 10000 Or dRef = Int(dRef) Then
    If bMessage Then MsgBox2i "CR310"
                      'MsgBox "La référence d'intervention est un nombre supérieur à 10000." & vbCrLf & "Le numéro d'échantillon est compris entre 01 et 99", vbExclamation, sNomApp
    bOkRéférence = False
    Exit Function
  End If
  
  ' On récupère les informations du démon
  Dim vStatus As Variant
  Bloquer
    Dim br As New Rev
    br.AddField IIf(frmRecherche.cmdTableSL.Checked, tcLabo, tcBacterio)
    br.AddField sRefSansPoint
    tcps.Envoie "TREF " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    br.Buffer = sLigne
    br.GetField vStatus: sStatusIntervention = NZ(vStatus)      ' numetb à NULL possible, on le traite en interne sous la valeur 0
    br.GetField bStatusEchantillon

    ' Contrôle
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  Relâcher
  
  If vStatus = -2 Then    ' Incohérence
    If bMessage Then MsgBox2i "CR311"
                      'MsgBox "Erreur de cohérence interne de la base de données, plusieurs établissements pour une même référence d'intervention." & vbCrLf & vbCrLf & "Ne faites pas de saisie sous cette référence, et prévenez immédiatement la DI !", vbCritical, sNomApp
    bOkRéférence = False
    Exit Function
  End If
  
  If vStatus = -3 Then    ' Référence d'archive
    If bMessage Then MsgBox2i "CR312", txtRéférence
                      'MsgBox "Cette référence est inutilisable, elle est présente dans les tables d'archives." & vbCrLf & "Affichez le RA " & txtRéférence & " sur le Web pour voir le détail.", vbExclamation, sNomApp
    bOkRéférence = False
    Exit Function
  End If
  
  ' On ne peut rien conclure de plus sur les infos récupérées à ce moment
  ' Les tests sont continués dans btnAction_click
  bOkRéférence = True
End Function



Private Function iTestPlanning(ByVal sRefInt As String, ByVal txtNumEtb As String, ByVal iEch As Integer) As Integer
  ' On récupère les informations du démon
  Dim iStatus As Integer
  Bloquer
    Dim br As New Rev
    br.AddField sRefInt
    br.AddField txtNumEtb
    br.AddField iEch
    tcps.Envoie "TPL2 " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Reçoit
    br.Buffer = sLigne
    br.GetField iStatus

    ' Contrôle
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  Relâcher

  iTestPlanning = iStatus
End Function


' Sur changement de référence, on détruit les références de rab
Private Sub txtRéférence_Change()
  EffaceListeRéférences
  txtRéférence.ForeColor = vbWindowText
  btnRechercher.Enabled = txtRéférence <> ""
End Sub


Private Sub btnRechercher_Click()
  If bBlocageEnCours Then
    ActionSuivante Me, "btnRechercher_Click"
    Exit Sub
  End If
  
  Dim sFiller As String, bFiller As Boolean
  If bOkRéférence(txtRéférence, True, sFiller, bFiller) Then
    txtRéférence.ForeColor = vbWindowText
    Génère6Références True
    btnRechercher.Enabled = False
    MAJTousStatus
  Else
    txtRéférence.SetFocus
    txtRéférence.ForeColor = RGB(255, 0, 0)
  End If
End Sub


Private Sub txtRéférence_KeyPress(KeyAscii As Integer)
  If KeyAscii >= Asc("a") And KeyAscii <= Asc("z") Then
    KeyAscii = KeyAscii - 32
  End If
  If Not (KeyAscii >= Asc("A") And KeyAscii <= Asc("Z") Or KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = Asc(".") Or KeyAscii = 8 Or KeyAscii = Asc("V") - 64 Or KeyAscii = Asc("C") - 64 Or KeyAscii = Asc("X") - 64 Or KeyAscii = Asc("Z") - 64) Then
    KeyAscii = 0
  End If
  txtCB = ""
End Sub

    
Private Sub Génère6Références(bAvecProtectionRéentrance As Boolean)
  If bAvecProtectionRéentrance Then
    If bEnCours Then Exit Sub
    bEnCours = True
  End If
  
  Dim iEch As Integer
  Dim sRefIntervention As String
  Dim p As Integer
  p = InStr(txtRéférence, ".")
  If p <> 0 Then
    sRefIntervention = Left(txtRéférence, p - 1)
    iEch = Val(Mid(txtRéférence, p + 1))
  Else
    sRefIntervention = Left(txtRéférence, Len(txtRéférence) - 2)
    iEch = Val(Right(txtRéférence, 2))
  End If
  
  Dim iLoop As Integer
  iLoop = 0
  Do
    If iEch = 100 Then Exit Do
    If iLoop = 6 Then Exit Do
          
    Dim sRefRab As String
    sRefRab = sRefIntervention & "." & Right(100 + iEch, 2)
    AjouteRéférence sRefRab

    iLoop = iLoop + 1
    iEch = iEch + 1
  Loop
  
  lvRéférences.SetFocus
  SendKeys " "
  DoEvents
  
  
  If bAvecProtectionRéentrance Then
    bEnCours = False
    ' On restaure le bouton par défaut
    btnAction.Enabled = True
    btnAction.Default = True
  End If
End Sub


'========================================================
' Saisie n° d'établissement

Function bOkNumEtb(ByVal bMessage As Boolean) As Boolean
  
  ' Première partie: vérifications simples
  If txtNumEtb = "" Then
    bOkNumEtb = True
    Exit Function
  End If
  
'  If Not IsNumeric(txtNumEtb) Then
'    If bMessage Then MsgBox2i "CO003", txtNumEtb
'                      'MsgBox "Le n° d'établissement doit être un nombre !", vbExclamation, sNomApp
'    txtNumEtb.SetFocus
'    bOkNumEtb = False
'    Exit Function
'  End If
  
  ' Recherche de l'établissement à proprement parler
  Dim e As Etablissement
  
  If txtNumEtb = "0" Then           ' Cas très spécial…
    Set e = New Etablissement
    e.etb_prefixe = "AC"
    e.etb_nom = sGetIntlLib("CRtxtEtb", "ÉTABLISSEMENT EN COURS DE CRÉATION")
    'e.etb_nom = "ÉTABLISSEMENT EN COURS DE CRÉATION"
  Else
    Set e = LireEtablissement(txtNumEtb, False)
    If e Is Nothing Then
      If bMessage Then MsgBox2i "CO005", txtNumEtb
                        'MsgBox "Établissement inexistant !", vbExclamation, sNomApp
      bOkNumEtb = False
      Exit Function
    End If
  End If
  
  txtPréfixe = e.etb_prefixe
  txtNomEtb = e.etb_nom
  bOkNumEtb = True
End Function


Private Sub RechercheEtablissement()
  Dim e As Etablissement
  Set e = frmRechercheEtablissement.Cherche()
  If Not e Is Nothing Then
    txtNumEtb = e.etb_numetb
    txtPréfixe = e.etb_prefixe
    txtNomEtb = e.etb_nom
  End If
End Sub


Private Sub txtNumEtb_LostFocus()
  If txtNumEtb <> "" Then
    If bBlocageEnCours Then
      ActionSuivante Me, "txtNumEtb_LostFocus"
      Exit Sub
    End If
    
    If bOkNumEtb(False) Then
      txtNumEtb.ForeColor = vbWindowText
    Else
      txtNumEtb.ForeColor = RGB(255, 0, 0)
    End If
  End If
End Sub


Private Sub txtNumEtb_Change()
  txtPréfixe = ""
  txtNomEtb = ""
  txtNumEtb.ForeColor = vbWindowText
  If Not bEnCours Then txtCB = ""
End Sub

Private Sub txtNumEtb_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyF4 And Shift = 0 Then RechercheEtablissement
End Sub

Private Sub txtNumEtb_KeyPress(KeyAscii As Integer)
  If KeyAscii >= Asc("a") And KeyAscii <= Asc("z") Then
    KeyAscii = KeyAscii - 32
  End If
  If KeyAscii = Asc("/") Then
    KeyAscii = 0
    RechercheEtablissement
  End If
  If KeyAscii = Asc("?") Then KeyAscii = 65 + Val(txtNumEtb) Mod 26
End Sub

Private Sub txtNumEtb_DblClick()
  RechercheEtablissement
End Sub


'========================================================

Public Sub AfficheBarreProgression(iMin As Integer, iMax As Integer, iValeur As Integer)
  pbProgress.Min = iMin
  pbProgress.Max = iMax
  pbProgress.Value = iValeur
  
  pbProgress.Move sbStatus.Panels(2).Left, sbStatus.Top + 2, sbStatus.Panels(2).Width, sbStatus.height - 2
  pbProgress.ZOrder 0
  pbProgress.Visible = True
End Sub


'========================================================
' Protection contre les problèmes de ré-entrance

Sub DoActionSuivante(ByVal sAction As String)
  Select Case sAction
    Case "btnRechercher_Click": btnRechercher_Click
    Case "txtNumEtb_LostFocus": txtNumEtb_LostFocus
    Case "btnAction_Click": btnAction_Click
    Case Else: MsgBox "frmRecherche.DoActionSuivante: Action suivante " & sAction & " inconnue !", vbCritical, sNomApp: Stop
  End Select
End Sub


'========================================================
' Affichage de l'état des connexions

Private Sub Timer1_Timer()
  Dim e As Integer
  e = tcps.Etat()
  If e <> iOldEtat Then
    sbStatus.Panels("ECom").Text = tcps.sEtatDécodé
    sbStatus.Refresh
    iOldEtat = e
  End If
End Sub


'========================================================
' Passage à l'analyse suivante
' Appelé depuis la feuille RA

Public Sub Suivant()
  If lvRéférences.ListItems.Count = lvRéférences.SelectedItem.Index Then
    MsgBox2i "CR313"
    'MsgBox "Il n'y a pas de suivant dans la liste !", vbExclamation, sNomApp
  Else
    Set lvRéférences.SelectedItem = lvRéférences.ListItems(lvRéférences.SelectedItem.Index + 1)
    btnAction_Click
  End If
End Sub



'========================================================
' Internationalisation

Public Sub Internationalisation()
  sNomApp = sGetIntlLib("sNomApp", "Microb'Soft - Saisie des Rapprorts d'Analyse")
  sAttente = sGetIntlLib("sAttente", "ATTENTE")
  If sNomOpérateur <> "" Then Caption = sNomApp & " [" & sNomOpérateur & "]"
  
  SetLib mnuRA, "Caption", "CRmnuCRA"
  SetLib cmdEffacer, "Caption", "CRcmdEffacer"
  SetLib cmdModeVisualisation, "Caption", "CRcmdModeVisualisa"
  SetLib cmdModeSaisie, "Caption", "CRcmdModeSaisie"
  SetLib cmdTableST, "Caption", "CRcmdTableST"
  SetLib cmdTableSL, "Caption", "CRcmdTableSL"
  SetLib cmdSystèmeUnix, "Caption", "CRcmdSystèmeUnix"
  SetLib cmdIdentification, "Caption", "CRcmdIdentification"
  SetLib cmdConfigImprimante, "Caption", "CRcmdConfigImprim"
  SetLib cmdQuitter, "Caption", "CRcmdQuitter"
  
  SetLib mnuFRT, "Caption", "CRmnuFRT"
  SetLib cmdFRTImprimeCourant, "Caption", "CRcmdFRTImprimeCour"
  SetLib cmdFRTAccèsGénéral, "Caption", "CRcmdFRTAccèsGénéral"
  SetLib cmdFRTImprimée, "Caption", "CRcmdFRTImprimée"
  SetLib cmdFRTEtat, "Caption", "cmdFRTEtat"
  SetLib cmdAttacherEchus, "Caption", "CRcmdAttacherEchus"
  SetLib cmdDétailFRT, "Caption", "CRcmdDétailFRT"
  
  SetLib mnuRecherche, "Caption", "CRmnuRecherche"
  SetLib cmdRechEtablissement, "Caption", "CRcmdRechEtabliss"
  SetLib cmdRechLettres, "Caption", "CRcmdRechLettres"
  SetLib cmdRANonValidés, "Caption", "CRcmdCRANonValidés"
  SetLib cmdRAEchus, "Caption", "CRcmdCRAEchus"
  SetLib cmdComptageDLC, "Caption", "CRcmdComptageDLC"
  SetLib cmdSaisieAnomalie, "Caption", "CRcmdSaisieAnomalie"
  SetLib cmdOptions, "Caption", "CRcmdOptions"
  
  SetLib mnuAvancé, "Caption", "CRmnuAvancé"
  SetLib cmdAfficheVerrousCrad, "Caption", "CRcmdAffVerrousCrad"
  SetLib cmdModifAprèsValidation, "Caption", "CRcmdModifAprèsValid"
  
  SetLib mnuSystème, "Caption", "CRmnuSystème"
  SetLib cmdTCPFenetre, "Caption", "CRcmdTCPFenetre"
  SetLib cmdRelâcher, "Caption", "CRcmdRelâcher"
  SetLib cmdCache, "Caption", "CRcmdCache"
  SetLib cmdPurgeCache, "Caption", "CRcmdPurgeCache"
  SetLib cmdAfficheVerrousScraw, "Caption", "CRcmdAffichVerrScraw"
  SetLib cmdConnexion, "Caption", "CRcmdConnexion"
  SetLib cmdDéconnexion, "Caption", "CRcmdDéconnexion"
  
  SetLib mnuAide, "Caption", "CRmnuAide"
  SetLib cmdAideSommaire, "Caption", "CRcmdAideSommaire"
  SetLib cmdAideContextuelle, "Caption", "CRcmdAideContextuel"
  SetLib cmdDernièresModifs, "Caption", "CRcmdDernièresModifs"
  SetLib cmdAPropos, "Caption", "CRcmdAPropos"
  
  'SetLib mnuBarreBoutons, "Caption", "CRmnuBarreBoutons"
  SetLib cmdBarreStandard, "Caption", "CRcmdBarreStandard"
  SetLib cmdEtiquettes, "Caption", "CRcmdEtiquettes"
   
  SetLib Me, "Caption", "CRCaption"
  
  SetLib btnDémo, "Caption", "btnDémo"
  SetLib btnRechercher, "Caption", "btnRechercher"
  SetLib btnAction, "Caption", "btnAction"
  
  SetLib lblCodeBarre, "Caption", "CRlblCodeBarre"
  SetLib txtCB, "Tag", "CRtxtCB.tag"
  SetLib lblEtablissement, "Caption", "CRlblEtablissement"
  SetLib txtNumEtb, "Tag", "CRtxtNumEtb.tag"
  SetLib lblRéférence, "Caption", "CRlblRéférence"
  SetLib txtRéférence, "Tag", "CRtxtRéférence.tag"
  SetLib lblRA, "Caption", "CRlblCRA"
  SetLib lvRéférences.ColumnHeaders(1), "Text", "CRchRéférence"
  'SetLib lvRéférences.ColumnHeaders(2), "Text", "CRchClasse"
  SetLib lvRéférences.ColumnHeaders(3), "Text", "CRchEtat"
  SetLib lvRéférences.ColumnHeaders(4), "Text", "CRchAction"
  
  SetLib tbBoutons.Buttons("Nouveau"), "ToolTipText", "CRtbNouveau.tt"
  SetLib tbBoutons.Buttons("Utilisateur"), "ToolTipText", "CRtbUtilisateur.tt"
  SetLib tbBoutons.Buttons("Unix"), "ToolTipText", "CRtbUnix.tt"
  SetLib tbBoutons.Buttons("Imprimante"), "ToolTipText", "CRtbImprimante.tt"
  SetLib tbBoutons.Buttons("ImprimeFRT"), "ToolTipText", "CRtbImprimeFRT.tt"
  SetLib tbBoutons.Buttons("DétailFRT"), "ToolTipText", "CRtbDétailFRT.tt"
  SetLib tbBoutons.Buttons("Anomalie"), "ToolTipText", "CRtbAnomalie.tt"
  
End Sub

