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
            Object.ToolTipText     =   "Change de syst�me Unix"
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
            Key             =   "D�tailFRT"
            Object.ToolTipText     =   "D�tail FRT"
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
   Begin VB.CommandButton btnD�mo 
      Caption         =   "&D�mo"
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
      Tag             =   "Entrez le n� d'�tablissement. F4 pour une recherche."
      Top             =   960
      Width           =   960
   End
   Begin VB.TextBox txtPr�fixe 
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
   Begin VB.TextBox txtR�f�rence 
      Height          =   315
      Left            =   1620
      TabIndex        =   8
      Tag             =   "Entrez la r�f�rence d'analyse"
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
            Object.ToolTipText     =   "Imprimante s�lectionn�e"
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
            Object.ToolTipText     =   "�tat de la connexion avec le syst�me Unix"
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
   Begin MSComctlLib.ListView lvR�f�rences 
      Height          =   1755
      Left            =   1605
      TabIndex        =   12
      Tag             =   "S�lectionnez la r�f�rence."
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
         Text            =   "R�f�rence"
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
            Key             =   "imgLireAvanc�"
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
   Begin VB.Label lblR�f�rence 
      AutoSize        =   -1  'True
      Caption         =   "R�f�re&nce :"
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
         Caption         =   "Tables &secr�tariat/serveur"
      End
      Begin VB.Menu cmdTableSL 
         Caption         =   "Tables &labo"
         Checked         =   -1  'True
      End
      Begin VB.Menu sep0 
         Caption         =   "-"
      End
      Begin VB.Menu cmdSyst�meUnix 
         Caption         =   "&Syst�me unix�"
      End
      Begin VB.Menu cmdIdentification 
         Caption         =   "&Identification de l'utilisateur�"
      End
      Begin VB.Menu cmdConfigImprimante 
         Caption         =   "Configuration &imprimantes�"
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
      Begin VB.Menu cmdFRTAcc�sG�n�ral 
         Caption         =   "Imprimer une FRT &quelconque�"
      End
      Begin VB.Menu cmdFRTImprim�e 
         Caption         =   "&Consid�rer la FRT courante imprim�e"
      End
      Begin VB.Menu sep1b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdFRTEtat 
         Caption         =   "&Etat de la FRT courante�"
      End
      Begin VB.Menu sep7 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAttacherEchus 
         Caption         =   "Imprimer la FRT des &analyses � �ch�ance"
      End
      Begin VB.Menu sep7b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdD�tailFRT 
         Caption         =   "&D�tail FRT�"
      End
   End
   Begin VB.Menu mnuRecherche 
      Caption         =   "Rec&herche"
      Begin VB.Menu cmdRechEtablissement 
         Caption         =   "&Etablissement�"
      End
      Begin VB.Menu cmdRechLettres 
         Caption         =   "&Lettres d'assistant�"
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu cmdRANonValid�s 
         Caption         =   "&RA non valid�s � J+1"
      End
      Begin VB.Menu cmdRAEchus 
         Caption         =   "&Analyses arriv�es � �ch�ance"
      End
      Begin VB.Menu cmdComptageDLC 
         Caption         =   "&Co&mptage des analyses pr�vues�"
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
         Caption         =   "&Options�"
      End
   End
   Begin VB.Menu mnuAvanc� 
      Caption         =   "Avanc&�"
      Begin VB.Menu cmdAfficheVerrousCrad 
         Caption         =   "&Verrous�"
      End
      Begin VB.Menu sep4 
         Caption         =   "-"
      End
      Begin VB.Menu cmdModifApr�sValidation 
         Caption         =   "&Modification RA valid�"
      End
   End
   Begin VB.Menu mnuSyst�me 
      Caption         =   "&Syst�me"
      Begin VB.Menu cmdTCPFenetre 
         Caption         =   "&Fen�tre TCP"
      End
      Begin VB.Menu cmdRel�cher 
         Caption         =   "&D�bloquer interface"
         Enabled         =   0   'False
      End
      Begin VB.Menu sep41 
         Caption         =   "-"
      End
      Begin VB.Menu cmdCache 
         Caption         =   "&Cache�"
      End
      Begin VB.Menu cmdPurgeCache 
         Caption         =   "&Purger les fichiers cache"
      End
      Begin VB.Menu sep6 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAfficheVerrousScraw 
         Caption         =   "&Verrous scraw�"
      End
      Begin VB.Menu sep5 
         Caption         =   "-"
      End
      Begin VB.Menu cmdConnexion 
         Caption         =   "C&onnexion"
      End
      Begin VB.Menu cmdD�connexion 
         Caption         =   "D�conne&xion"
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
      Begin VB.Menu cmdDerni�resModifs 
         Caption         =   "&Derni�res modifications�"
      End
      Begin VB.Menu sep9 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAPropos 
         Caption         =   "&A propos de�"
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
         Caption         =   "&Afficher les �tiquettes"
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
' 17/11/1997 PV 1.1 Identification syst�matique au lancement; mots de passe;
'                   Pas de changement de syst�me Unix si RA affich� ou FRT non imprim�e
' 10/12/1997 PV     V�rification que les deux premi�res lettres sont bien affect�es
' 23/12/1997 PV     Code d'autorisation sp�cial secret�
'  9/01/1998 PV     Analyses arriv�es � �ch�ance
' 13/04/1998 PV     Option -autologin
' 15/05/1998 PV     D�tail FRT, anomalies
'  5/06/1998 PV     L�gende des boutons suppl�mentaires
' 22/07/1998 PV     -autologin --> -nologin
' 14/08/1998 PV     Case � cocher chkNouvellePr�sentation
' 26/08/1998 PV     Bug dans cmdAttacherEchus_Click, iFRT as integer --> long
' 17/12/1998 PV     Trois options de pr�sentation
' 21/12/1998 PV 1.4 G�n�ralisation des Libell�RA; KillAnciensCaches
' 01/02/1999 NC     Internationalisation
' 29/03/1999 PV     Fin des anciennes pr�sentations
' 22/10/1999 PV     Cas de la belgique, n�etb=3 si scan code barre avec lettre en X?
' 25/11/1999 PV     Reprise de la protection r�entrance pour les douchettes rapides...
' 23/10/2000 PV 2.0 iTestPlanning, validation des r�f�rences dans les plannings
'  9/11/2000 PV     D�brayage du contr�le planning pour la Belgique (etb n�3)
' 17/01/2001 PV     Classe de document dans lvR�f�rences
' 26/02/2001 PV     EchusWindows pour imprimer la FRT des analyses �chues sous Windows
'  2/08/2001 PV     iTestPlanning avec n�ech (appelle TPL2 au lieu de TPLA)
'  6/11/2001 PV     Appel � InitCommonControls pour XP

Option Explicit

Public iOldEtat As Integer       ' �tat courant de la connexion TCP
Private bD�chargementFinalEnCours As Boolean
Private bEnCours As Boolean      ' Saisie de code barre en cours/G�n�ration de r�f�rence

Public bModeSp�cial As Boolean   ' Autoriser la modif apr�s validation�

' Pour le style visuel XP
Private Declare Function InitCommonControls Lib "Comctl32.dll" () As Long


Public Sub EffaceListeR�f�rences()
  If lvR�f�rences.ListItems.Count > 0 Then
    lvR�f�rences.ListItems.Clear
    btnAction.Enabled = False
    btnRechercher.Default = True
  End If
End Sub

Public Sub AjouteR�f�rence(ByVal sRef As String, Optional ByVal sClasse As String, Optional ByVal sStatus As String = "", Optional ByVal sAction As String = "")
  If InStr(sRef, ".") = 0 Then sRef = Left(sRef, Len(sRef) - 2) & "." & Right(sRef, 2)
  
  Dim itmX As ListItem

  Set itmX = lvR�f�rences.ListItems.Add()
  itmX.Text = sRef
  itmX.SubItems(1) = sClasse
  itmX.SubItems(2) = sStatus
  itmX.SubItems(3) = sAction
End Sub


' Mise � jour du status d'une r�f�rence
' Si sMessage est vide, demande au d�mon
Public Sub MAJStatus(ByVal sRef As String, ByVal sMessage As String)
  If bD�chargementFinalEnCours Then Exit Sub
  If InStr(sRef, ".") = 0 Then sRef = Left(sRef, Len(sRef) - 2) & "." & Right(sRef, 2)
  
  Dim i As ListItem
  For Each i In lvR�f�rences.ListItems
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
      
      ' On oublie pas de mettre � jour le bouton action
      ' si on modifie la ligne s�lectionn�e�
      If lvR�f�rences.SelectedItem Is i Then btnAction.Caption = sCaptionAcc(sAction)
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
  For i = 1 To lvR�f�rences.ListItems.Count
    ' On ne met � jour que les status effac�s
    If lvR�f�rences.ListItems(i).SubItems(2) = "" Then
      MAJStatus lvR�f�rences.ListItems(i).Text, ""
    End If
  Next
End Sub

Private Sub cmdAfficheVerrousScraw_Click()
  AfficheVerrousScraw
End Sub

Private Sub cmdComptageDLC_Click()
  frmComptage.Show vbModal
End Sub

Private Sub cmdD�tailFRT_Click()
  Dim sRep As String
  sRep = InputBox(sGetIntlLib("CRtxtD�tailFRT", "Num�ro de FRT ?"), "Infos FRT")
  If IsNumeric(sRep) Then frmD�tailFRT.Affiche Val(sRep)
End Sub

Private Sub cmdSaisieAnomalie_Click()
  On Error Resume Next
  AppActivate "Saisie FSE"
  If Err = 5 Then Shell """" & App.Path & "\SaisieFSE"" -a", vbNormalFocus
  If Err = 53 Then Shell sSysDisk & "\Microbsoft\SaisieFSE -a", vbNormalFocus
End Sub

Private Sub mnuAvanc�_Click()
  cmdAfficheVerrousCrad.Caption = sprintf(sGetIntlLib("CRcmdAffVerrousCrad", "Verrous"), sSyst�meDistant)
  'cmdAfficheVerrousCrad.Caption = "&Verrous " & sSyst�meDistant & "�"
End Sub

Private Sub cmdAfficheVerrousCrad_Click()
  AfficheVerrousCrad
End Sub

Private Sub cmdModifApr�sValidation_Click()
  If lvR�f�rences.SelectedItem Is Nothing Then Beep: Exit Sub
  
  Dim iRep As VbMsgBoxResult
  Dim sMsg As String
  sMsg = sGetIntlLib("CR249", "Question 249")
  iRep = MsgBox(sMsg, vbExclamation + vbYesNo + vbDefaultButton2, sNomApp)
  'iRep = MsgBox("ATTENTION !" & vbCrLf & vbCrLf & _
    "Cette commande permet de modifier les donn�es apr�s validation/transfert." & vbCrLf & vbCrLf & _
    "Elle ne doit �tre utilis�e EXCLUSIVEMENT qu'apr�s consultation de la DI, de fa�on � s'assurer que les corrections � apport�es seront bien transf�r�es." & vbCrLf & vbCrLf & _
    "Ok pour continuer ?", _
    vbExclamation + vbYesNo + vbDefaultButton2, sNomApp)
  If iRep = vbNo Then Exit Sub
  
  Dim sRep As String
  sRep = InputBox(sGetIntlLib("CRtxtModifAV", "Code d'autorisation ? (Demander � la DI)"), sNomApp)
  If sRep <> "14142136" Then
    If sRep = "" Or Not IsNumeric(sRep) Then
      MsgBox2i "CO004", sRep
      'MsgBox "Code invalide !", vbExclamation, sNomApp
      Exit Sub
    End If
    If CLng(sRep) <> CLng(Int(Now)) + Int(Val(Mid(lvR�f�rences.SelectedItem.Text, 3))) Then
      MsgBox2i "CR285"
      'MsgBox "Code invalide, acc�s refus� !", vbExclamation, sNomApp
      Exit Sub
    End If
  End If

  bModeSp�cial = True
  btnAction_Click
  bModeSp�cial = False
End Sub


Private Sub lvR�f�rences_Click()
  If lvR�f�rences.SelectedItem Is Nothing Then Exit Sub
  btnAction.Caption = sCaptionAcc(lvR�f�rences.SelectedItem.SubItems(3))
  btnAction.Default = True
End Sub

Private Sub lvR�f�rences_DblClick()
  btnAction_Click
End Sub

Private Sub lvR�f�rences_KeyPress(KeyAscii As Integer)
  If KeyAscii = 37 Then       ' Asc("%")
    Form_KeyPress KeyAscii
    KeyAscii = 0
  End If
End Sub



Private Sub btnAction_Click()
  If lvR�f�rences.SelectedItem Is Nothing Then Exit Sub
  
  Static bActionEnCours As Boolean
  If bActionEnCours Then
    Beep
    Exit Sub
  End If
  
  bActionEnCours = True
  btnAction_Click2 lvR�f�rences.SelectedItem.Index
  bActionEnCours = False
End Sub


' Code actif de l'�v�nement btnAction_Click
' S�par� pour �viter les probl�mes li�s � la r�-entrance
Private Sub btnAction_Click2(Index As Integer)
  If bD�connect�() Then Exit Sub
  
  If bBlocageEnCours Then
    ActionSuivante Me, "btnAction_Click"
    Exit Sub
  End If
  
  Dim sR�f�renceS�lectionn�e As String
  sR�f�renceS�lectionn�e = lvR�f�rences.SelectedItem.Text
  
  ' Contr�les simples, et r�cup�ration des infos du serveur
  Dim bStatusEchantillon As Boolean     ' D�j� saisi ou pas
  Dim sStatusIntervention As String     ' n� �tablissement
  
  If Not bOkR�f�rence(sR�f�renceS�lectionn�e, True, sStatusIntervention, bStatusEchantillon) Then Exit Sub
  If Not bOkNumEtb(True) Then Exit Sub
  
  ' Si on est en mode sp�cial, on garde une trace
  If bModeSp�cial Then
    D�monJournalUnix "ModifSp�ciale", "", "Ref=" & sR�f�renceS�lectionn�e
  End If
  
  ' On normalise la r�f�rence selon les r�gles internes
  Dim sRefSansPoint As String, p As Integer
  p = InStr(sR�f�renceS�lectionn�e, ".")    ' Obligatoire apr�s bOkR�f�rence
  sRefSansPoint = Left(sR�f�renceS�lectionn�e, p - 1) & Mid(sR�f�renceS�lectionn�e, p + 1)
  
  ' Tests d�taill�s, selon le mode
  If cmdModeVisualisation.Checked Then     ' Mode visualisation
  
    If Val(sStatusIntervention) < 0 Then
      MsgBox2i "CR286"
      'MsgBox "R�f�rence d'intervention inexistante !", vbExclamation, sNomApp
      Exit Sub
    End If
    If bStatusEchantillon = False Then
      MsgBox2i "CR287"
      'MsgBox "Echantillon non saisi pour cette r�f�rence d'intervention !", vbExclamation, sNomApp
      Exit Sub
    End If
    If txtNumEtb <> "" Then
      If txtNumEtb <> sStatusIntervention Then
        MsgBox2i "CR288", sStatusIntervention, txtNumEtb
        'MsgBox "Attention - La r�f�rence est saisie pour l'�tablissement " & iStatusIntervention & ", alors que vous demandez la visualisation pour l'�tablissement " & txtNumEtb & ".", vbExclamation, sNomApp
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
        'MsgBox "Pour la premi�re saisie d'une intervention, le num�ro d'�tablissement est obligatoire." & vbCrLf & vbCrLf & "Si l'�tablissement n'est pas encore cr��, utiliser le code 0 et sp�cifier manuellement les options d'�dition et les options laboratoire appropri�es pour cet �tablissement.", vbExclamation, sNomApp
        txtNumEtb.SetFocus
        Exit Sub
      End If
      
      ' Contr�le des plannings, d�sactiv� pour l'�tablissement Belgique
      ' ansi que pour les d�mos en ZZ
      If txtNumEtb <> "3" And Left(sRefSansPoint, 2) <> "ZZ" Then
        Dim sRefInt As String, iEch As Integer
        sRefInt = Left(sRefSansPoint, Len(sRefSansPoint) - 2)
        iEch = Val(Right(sRefSansPoint, 2))
        
        Dim iErr As Integer
        iErr = iTestPlanning(sRefInt, txtNumEtb, iEch)
        Select Case iErr
          Case 0:   ' Nop, tout est Ok
          
          Case 1:   ' Planning inexistant
            ' Planning inexistant.||Vous ne pouvez pas enregistrer d'�chantillon sous la r�f�rence %1 il n'existe pas de planning correspondant.|Corrigez la r�f�rence, ou cr�ez le planning correspondant.
            MsgBox2i "CR331", sRefSansPoint
            Exit Sub
          Case 2:
            ' Attention ! Le cadre de pr�l�vement s�lectionn� n'est pas de type intervention exceptionnelle, alors que la case IE est coch�e...||V�rifiez qu'il n'y a pas d'erreur.
            MsgBox2i "CR332"
            Exit Sub
          Case 65 To 90:
            ' L'�chantillon %1 a d�j� �t� enregsitr� sur le labo %2, l'enregistrement est impossible.
            MsgBox2i "CR232b", iEch, Chr(iErr)
            Exit Sub
        End Select
      End If
      
      If bNouveauRA(sRefSansPoint, txtNumEtb) Then
        MAJStatus sR�f�renceS�lectionn�e, sGetIntlLib("CRtxtNouveauRA", "Saisie nouveau RA en cours")
      End If
      Exit Sub
    End If
    
    ' Nouveau RA dans une intervention o� il y en a d�j�
    If bStatusEchantillon = False Then
      If txtNumEtb <> "" Then
        If txtNumEtb <> sStatusIntervention Then
          MsgBox2i "CR290", sStatusIntervention, txtNumEtb
          'MsgBox "Attention - Des RA sont d�j� saisis pour l'�tablissement " & iStatusIntervention & " pour cette r�f�rence d'intervention, alors que vous demandez la saisie pour l'�tablissement " & txtNumEtb & ".", vbExclamation, sNomApp
          Exit Sub
        End If
      End If
      If bNouveauRA(sRefSansPoint, sStatusIntervention) Then
        MAJStatus sR�f�renceS�lectionn�e, sGetIntlLib("CRtxtNouveauRA", "Saisie nouveau RA en cours")
      End If
      Exit Sub
    End If
    
    ' RA existant
    If txtNumEtb <> "" Then
      If txtNumEtb <> sStatusIntervention Then
        MsgBox2i "CR291", sStatusIntervention, txtNumEtb
        'MsgBox "Attention - Ce RA est saisi pour l'�tablissement " & iStatusIntervention & ", alors que vous demandez l'�tablissement " & txtNumEtb & ".", vbExclamation, sNomApp
        Exit Sub
      End If
    End If
    If bModifieRA(sRefSansPoint) Then
      MAJStatus sR�f�renceS�lectionn�e, sGetIntlLib("CRtxtSaiViRA", "Saisie / Visualisation RA en cours")
    End If
  End If
End Sub


Private Sub btnD�mo_click()
  txtR�f�rence = "ZZ200000.01"
  txtNumEtb = ""
  EffaceListeR�f�rences
  btnRechercher_Click
End Sub

Private Sub cmdEffacer_Click()
  EffaceListeR�f�rences
  txtCB = ""
  txtNumEtb = ""
  txtR�f�rence = ""
  On Error Resume Next      ' Au cas o� la feuille ne soit pas active
  txtR�f�rence.SetFocus
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
  Kill App.Path & "\Cache unit�s.dat"
  Kill App.Path & "\Cache m�thodes.dat"
  Kill App.Path & "\Cache libell�s Ercem.dat"
  Kill App.Path & "\Cache libell�s CRA.dat"
  On Error GoTo 0
  MsgBox2i "CR292"
  'MsgBox "Les fichiers cache ont �t� effac�s.", vbInformation, sNomApp
End Sub

Private Sub KillAnciensCaches()
  On Error Resume Next
  Kill App.Path & "\Cache lieux de pr�l�vement.dat"
  Kill App.Path & "\Cache cadres de pr�l�vement.dat"
  Kill App.Path & "\Cache aspects � r�ception.dat"
  Kill App.Path & "\Cache conditionnements.dat"
End Sub



Private Sub cmdConfigImprimante_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  frmConfigImprimante.Show 1
End Sub

Private Sub cmdConnexion_Click()
  If tcps.Etat() = 7 Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Connexion
  frmConfigImprimante.InitImprimantes
End Sub

Private Sub cmdD�connexion_Click()
  If tcps.Etat() <> 7 Then Exit Sub  ' D�j� d�connect�
  If bBlocageEnCours Then Beep: Exit Sub
  
  D�connexion
End Sub

Private Sub cmdDerni�resModifs_Click()
  InfoVersion False
End Sub

Private Sub cmdIdentification_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim iRep As Integer
  iRep = frmLogin.iInitUtilisateur(True)
  Select Case iRep
    Case 0: AjusteSelonNiveauUtilisateur
    Case 1: ' Rien (on a annul� la commande)
    Case 2: cmdSyst�meUnix_Click
  End Select
End Sub

' Les utilisateurs de niveau 16 ont le menu avanc�
Private Sub AjusteSelonNiveauUtilisateur()
  Dim iNiveau As Integer
  iNiveau = NZ(UtiParNum�ro(iNumOp�rateur).uti_niveau)
  mnuAvanc�.Visible = (iNiveau And 16) <> 0
End Sub


' =============================================================================
' RA non valid�s � J+1

Private Sub cmdRANonValid�s_Click()
  EffaceListeR�f�rences
  txtCB = ""
  txtNumEtb = ""
  txtR�f�rence = ""
  
  sbStatus.Panels("Info").Text = sGetIntlLib("CO091", "Recherche en cours, patientez�")
  Screen.MousePointer = vbHourglass
  
  Bloquer
    Dim br As New Rev
    tcps.Envoie "CRANV"
    
    Dim sLigne As String
    Dim sRef As String, dDateSais As Date
    Do
      sLigne = tcps.Re�oit
      If Left(sLigne, 2) = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sRef, dDateSais
      AjouteR�f�rence sRef, "", sprintf(sGetIntlLib("CRtxtRANonVal2", "Saisi le %1, A valider"), Format(dDateSais, "dd/mm/yyyy"))
      'AjouteR�f�rence sRef, "Saisi le " & Format(dDateSais, "dd/mm/yyyy"), "A valider"
    Loop
  Rel�cher
'  MAJTousStatus
  If lvR�f�rences.ListItems.Count > 0 Then
    btnAction.Enabled = True
    btnAction.Default = True
    lvR�f�rences.SetFocus
    SendKeys " "
    DoEvents
  End If
  GotFocus
  Screen.MousePointer = vbDefault
End Sub


' =============================================================================
' Analyses arriv�es � �ch�ance

' Recherche des r�f�rences
Private Sub cmdRAEchus_Click()
  EffaceListeR�f�rences
  txtCB = ""
  txtNumEtb = ""
  txtR�f�rence = ""
  
  sbStatus.Panels("Info").Text = sGetIntlLib("CO091", "Recherche en cours, patientez�")
  Screen.MousePointer = vbHourglass
  
  Bloquer
    Dim br As New Rev
    tcps.Envoie "ECHU"
    
    Dim sLigne As String
    Dim sRef As String, dDateSais As Date
    Do
      sLigne = tcps.Re�oit
      If Left(sLigne, 2) = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sRef, dDateSais
      AjouteR�f�rence sRef, "", sprintf(sGetIntlLib("CRtxtRANonVal3", "Saisi le %1, Attacher FRT"), Format(dDateSais, "dd/mm/yyyy"))
      'AjouteR�f�rence sRef, "Saisi le " & Format(dDateSais, "dd/mm/yyyy"), "Attacher FRT"
    Loop
  Rel�cher
  If lvR�f�rences.ListItems.Count > 0 Then
    btnAction.Enabled = True
    btnAction.Default = True
    lvR�f�rences.SetFocus
    SendKeys " "
    DoEvents
    lvR�f�rences_Click
  Else
    MsgBox2i "CR293"
    'MsgBox "Aucune analyse arriv�e � �ch�ance n'a �t� s�lectionn�e !", vbExclamation, sNomApp
  End If
  GotFocus
  Screen.MousePointer = vbDefault
End Sub


' Rattachement et impression de la FRT des analyses arriv�es � �ch�ance
Private Sub cmdAttacherEchus_Click()
  Dim br As New Rev
  Dim iFRT As Long, sMessage As String
  
  If Left(sImprimanteLaser, 5) = "[Nul]" Then Exit Sub
  
  If Left(sImprimanteLaser, 5) = "[Win]" Then
    EchusWindows
    Exit Sub
  End If
  
  sbStatus.Panels("Info").Text = sGetIntlLib("CO091", "Recherche en cours, patientez�")

  Bloquer
    br.AddField sImprimanteLaser
    tcps.Envoie "ECHF " & br.Buffer
    
    Dim sLigne As String
    
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField iFRT, sMessage
    
    AttendSynchro
  Rel�cher
      
  Select Case iFRT
    Case 0:
      MsgBox2i "CR293"
      'MsgBox "Aucune analyse arriv�e � �ch�ance n'a �t� s�lectionn�e !", vbExclamation, sNomApp
      
    Case Is < 0:
      MsgBox2i "CR294", sMessage
      'MsgBox "�chec pendant la s�lection des analyses : " & vbCrLf & sMessage, vbExclamation, sNomApp
      
    Case Else:
      MsgBox2i "CR295", iFRT
      'MsgBox "La FRT " & iFRT & " a �t� imprim�e.", vbInformation, sNomApp
  End Select

  GotFocus    ' Affiche le status du champ qui a le focus
End Sub


' Impression de la FRT des analyses �chues, version Windows
' Dans ce cas, on demande � Unix le n� de FRT des analyses �chues
' et on se charge de l'impression
Private Sub EchusWindows()
  Dim br As New Rev, iFRT As Long
  Bloquer
    tcps.Envoie "NFE"     ' N� de FRT Echue
    
    Dim sLigne As String
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField iFRT
    
    AttendSynchro
  Rel�cher
  
  If iFRT > 0 Then ImprimeFRT iFRT
End Sub


' =============================================================================
' Fiche r�capitulative tourn�e

Private Sub mnuFRT_Click()
  cmdFRTImprimeCourant.Enabled = iNumFRTCourante > 0
  cmdFRTImprim�e.Enabled = iNumFRTCourante > 0
End Sub

Private Sub cmdFRTImprimeCourant_Click()
  If iNumFRTCourante = 0 Then
    MsgBox2i "CR296"
    'MsgBox "Pas de FRT courante � imprimer !", vbInformation, sNomApp
    Exit Sub
  End If
  ImprimeFRT iNumFRTCourante
  EffaceFRTCourante
End Sub

Private Sub cmdFRTAcc�sG�n�ral_Click()
  Dim iFRT
  
  iFRT = InputBox(sGetIntlLib("CRtxtAG1", "No de FRT � imprimer, ou � r�imprimer ?"), sNomApp)
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

Private Sub cmdFRTImprim�e_Click()
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
  ' On masque les contr�les et menus si on n'est pas en mode avanc�
  mnuSyst�me.Visible = bAfficherMenuSyst�me
  cmdTableST.Visible = bAfficherMenuSyst�me
  cmdTableSL.Visible = bAfficherMenuSyst�me
  sep0.Visible = bAfficherMenuSyst�me
  btnD�mo.Visible = bAfficherMenuSyst�me
  cmdFRTImprim�e.Visible = bAfficherMenuSyst�me
  
  ' Barre de boutons de la feuille
  AjusterBarreBoutons
  
  ' On met � jour les barres de boutons sur les feuilles RA
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

' L'effacement de la barre de boutons est sous-trait� plus haut
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
      SetLib tbBoutons.Buttons("D�tailFRT"), "Caption", "CRtbD�tailFRT"
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
  
  DoEvents    ' Sinon la propri�t� height n'est pas mise � jour !
  Cls
  Form_Paint

  Dim vOff As Integer
  If bAfficherBarreDeBoutons Then
    vOff = tbBoutons.height
  Else
    vOff = 0
  End If
  vOff = vOff - 28 ' Hauteur de la barre en mode d�veloppement (offset des top relev�s)
  
  lblCodeBarre.Top = vOff + 40
  txtCB.Top = vOff + 36
  btnD�mo.Top = vOff + 36
  lblEtablissement.Top = vOff + 68
  txtNumEtb.Top = vOff + 64
  txtPr�fixe.Top = vOff + 64
  txtNomEtb.Top = vOff + 64
  lblR�f�rence.Top = vOff + 96
  txtR�f�rence.Top = vOff + 92
  btnRechercher.Top = vOff + 92
  btnAction.Top = vOff + 92
  lblRA.Top = vOff + 120
  lvR�f�rences.Top = vOff + 120
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
      'MsgBox "Vous ne pouvez pas effectuer cette op�ration tant qu'il reste un RA affich� !", vbExclamation, sNomApp
      bRAOuvert = True
      Exit Function
    End If
  Next
  bRAOuvert = False
End Function

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iNumFRTCourante > 0 Then
    MsgBox2i "CR298"
    'MsgBox "Vous ne pouvez pas quitter le programme tant que la FRT courante n'a pas �t� imprim�e !", vbExclamation, sNomApp
    Cancel = 1
    Exit Sub
  End If
  
  If bRAOuvert Then
    Cancel = 1
    Exit Sub
  End If
  
  Contr�leVerrous
  Cancel = 0
End Sub


Private Sub Form_Unload(Cancel As Integer)
  If bBlocageEnCours Then Beep: Cancel = True: Exit Sub

  bD�chargementFinalEnCours = True
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
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim e As Etablissement, c As Collection
  Set c = frmRechercheEtablissement.Cherche2()
  Dim sMessage As String
  For Each e In c
    sMessage = sMessage & vbCrLf & e.etb_numetb & ": " & e.etb_prefixe & " " & e.etb_nom
  Next
  If sMessage <> "" Then
    MsgBox2i "CR299", sMessage
    'MsgBox "�tablissement(s) s�lectionn�(s) :" & sMessage, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechLettres_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim l As String
  l = frmRechercheLettres.Cherche()
  If l <> "" Then
    MsgBox2i "CR300"
    'MsgBox "Lettres s�lectionn�es: " & l, vbInformation, sNomApp
  End If
End Sub


'========================================================

Private Sub cmdSyst�meUnix_Click()
  If bBlocageEnCours Then Beep: Exit Sub
  If bRAOuvert Then Exit Sub
  If iNumFRTCourante > 0 Then
    MsgBox2i "CR301"
    'MsgBox "Vous ne pouvez pas changer de syst�me Unix tant que la FRT courante n'a pas �t� imprim�e !", vbExclamation, sNomApp
    Exit Sub
  End If

  Dim sOldSyst�me As String
  sOldSyst�me = sSyst�meDistant
  
restart:
  frmConfigUnix.Show vbModal
  If sSyst�meDistant <> sOldSyst�me Then
    frmSplash.Show
    frmSplash.Refresh
    frmSplash.ZOrder 0
    Screen.MousePointer = vbHourglass
    
    D�connexion
    frmLogin.EffaceCacheMotsDePasse
    cmdEffacer_Click
    iOldEtat = 0    ' Force l'affichage de la mise � jour de l'�tat

    Connexion
    Unload frmSplash
    Screen.MousePointer = vbDefault
    
    frmSplash.Hide
    Select Case frmLogin.iInitUtilisateur(False)
      Case 1:       ' Annuler
        MsgBox2i "CO025"
        Unload Me     ' Sans risque, on sait que tous les RA sont ferm�s
        Exit Sub
      
      Case 0:       ' Ok
        
      Case 2:       ' Changement de syst�me Unix
        GoTo restart
    End Select

    frmConfigUnix.M�moriseSyst�meDistant
    frmConfigImprimante.InitImprimantes
    
  End If
End Sub

Private Sub cmdTCPFenetre_Click()
  cmdTCPFenetre.Checked = Not cmdTCPFenetre.Checked
  tcps.AfficheTrace cmdTCPFenetre.Checked
  SaveSetting sApplicationGlobale, "Options", "Fen�treTCP", IIf(cmdTCPFenetre.Checked, 1, 0)
End Sub

Private Sub cmdRel�cher_Click()
  Rel�cher
End Sub


Private Sub Form_KeyPress(KeyAscii As Integer)
  If bEnCours Then
    KeyAscii = 0
  ElseIf KeyAscii = 37 Then       ' Asc("%")
    btnAction.Enabled = False
    txtCB = ""
    txtR�f�rence = ""
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
    sNomOp�rateur = GetSetting(sApplicationGlobale, "Utilisateur", "Nom", "")
    On Error Resume Next
    Caption = sNomApp
    AppActivate sNomApp & " [" & sNomOp�rateur & "]"
    Unload frmTCP
    Unload Me
    End
  End If
  
  Set frmBase = Me
  
  CommandesInitiales
  
  Contr�leDerni�reVersion   ' On v�rifie qu'il n'y a pas une version plus r�cente sur Z
  Contr�leEnvironnement     ' On v�rifie que l'environnement du programme est Ok
  
  frmOptions.InitOptions
  If GetSetting(sApplicationGlobale, "Options", "Fen�treTCP", 0) Then
    cmdTCPFenetre.Checked = True
    tcps.AfficheTrace True
  End If
  
  DoOptionsAffichage
  Show
  AppActivate Caption       ' Au cas o� on lance avec la touche shift press�e
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
  

  frmConfigUnix.InitSyst�me
  If sSyst�meDistant = "" Then
    MsgBox2i "CO037"
    Unload Me
    End
  End If
  
  
  ' On se connecte�
  Connexion
  frmConfigUnix.M�moriseSyst�meDistant
  
  ' Connexion
'  Select Case frmLogin.iInitUtilisateur(InStr(LCase(Command), "-nologin") = 0)         ' Utilisateur courant, identification forc�e
  Select Case frmLogin.iInitUtilisateur(False)
    Case 0:   ' Ok
    
    Case 1:   ' Annuler
      MsgBox2i "CO025"
      Unload Me
      End
      
    Case 2:   ' Changement de syst�me Unix
      cmdSyst�meUnix_Click
  End Select
  
  
  ' Si le cache de messages internationaux n'existe pas, on le charge
  ' et on remet � jour l'interface
  If bIntlInitCache Then Internationalisation

  
  AjusteSelonNiveauUtilisateur
  
'  If bPremierLancement Then
'    frmSplash.lblChargement.Visible = False
'    frmSplash.lblBienvenue.Visible = True
'    frmSplash.lblBienvenue = sBienvenue
'    frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("CO089", "Pour le premier lancement, vous allez choisir l'imprimante que vous utiliserez.")
'    frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("CR190", "Vous pourrez modifier ce choix � tout moment par la suite avec la commande RA, Configuration imprimante.")
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
  
  ' Par d�faut en saisie
  cmdModeSaisie_Click
  
  ' On active les boutons, d�sactiv�s � la cr�ation par s�curit�
  btnD�mo.Enabled = True
  ' le bouton Action sera enabled quand la liste sera remplie
  ' le bouton Rechercher sera actif apr�s la saisie d'une r�f�rence
  
  KillAnciensCaches
  
  ' On r�cup�re le n� de version de la biblio des RAs ainsi que le nombre maxi de germes
  R�cup�reInfosLibRA
  
  ' On r�cup�re les infos de la table traitepar
  ChargeInfosTrait�Par
End Sub


Private Sub InfoVersion(bD�marrage As Boolean)
  Dim sVersionInfo As String, sVersionProgramme As String
  
  sVersionInfo = GetSetting(sApplicationGlobale, "G�n�ral", "VersionInfo", "")
  sVersionProgramme = App.Major & "." & App.Minor & "." & App.Revision
  If Not bD�marrage Or sVersionProgramme <> sVersionInfo Then
'    MsgBox "Informations sur la version " & sVersionProgramme & vbCrLf & vbCrLf & _
'      "Cette version imprime d�sormais correctement les plannings de plus de 20 interventions, avec pagination." & vbCrLf & vbCrLf, _
'      vbInformation, "Plannings version " & sVersionProgramme
    If sVersionProgramme <> sVersionInfo Then SaveSetting sApplicationGlobale, "G�n�ral", "VersionInfo", sVersionProgramme
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
    Case "Unix":        cmdSyst�meUnix_Click
    Case "Imprimante":  cmdConfigImprimante_Click
    
    Case "ImprimeFRT":  cmdFRTImprimeCourant_Click
    Case "D�tailFRT":   cmdD�tailFRT_Click
    
    Case "Anomalie":    cmdSaisieAnomalie_Click
    
    Case Else:          MsgBox2i "CR302", Button.Key
                        'MsgBox "Bouton '" & Button.Key & "' inconnu !", vbCritical, sNomApp: Stop
  End Select
End Sub


Private Sub sbStatus_PanelDblClick(ByVal Panel As Panel)
  If Panel.Key = "Info" Then MsgBox2i "CR303"
                              'MsgBox "Cette zone affiche des messages d'aide et d'information g�n�raux, en particulier le r�le de l'�l�ment s�lectionn�.", vbInformation, sNomApp
  If Panel.Key = "Impr" Then cmdConfigImprimante_Click
  If Panel.Key = "EInt" Then MsgBox2i "CR304"
                              'MsgBox "Cette zone indique si le programme �change des donn�es avec le d�mon Unix." & vbCrLf & "Pr�t indique qu'il n'y a pas de communication en cours." & vbCrLf & "Bloqu� indique qu'il y a un �change de donn�es en cours.", vbInformation, sNomApp
  If Panel.Key = "ECom" Then cmdSyst�meUnix_Click
End Sub


' =============================================================================
' Gestion du GotFocus (affichage de l'aide sur le contr�le courant)

Private Sub GotFocus()
  If ActiveControl Is lvR�f�rences Then
    If lvR�f�rences.ListItems.Count > 0 Then
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
 
  If txtR�f�rence <> "" Then txtR�f�rence = ""
  If txtNumEtb <> "" Then txtNumEtb = ""
  
  If KeyAscii = 13 Then
    KeyAscii = 0
    If Len(txtCB) = 18 Then CBChange
  End If
End Sub

Private Sub txtR�f�rence_GotFocus(): GotFocus: End Sub
Private Sub txtNumEtb_GotFocus(): GotFocus: End Sub
Private Sub txtPr�fixe_GotFocus(): GotFocus: End Sub
Private Sub txtNomEtb_GotFocus(): GotFocus: End Sub
Private Sub btnAction_GotFocus(): GotFocus: End Sub
Private Sub btnD�mo_GotFocus(): GotFocus: End Sub
Private Sub lvR�f�rences_GotFocus(): GotFocus: End Sub


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
  sEtb = Val(Mid(txtCB, 12, 5))     ' Ne g�re pas les n�s alphanum�riques
  iCS = Val(Mid(txtCB, 17, 2))
  
  ' V�rification de la somme de contr�le
  ' Formule stupide, le premier chiffre n'est pas pris en compte (on multiplie par z�ro�)
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
    'MsgBox "Erreur de check-sum !" & vbCrLf & "Lu: " & iCS & "  Calcul�: " & iCS2, vbExclamation, sNomApp
  Else
    Dim sCB As String
    sCB = txtCB
    
    iIng = iSite Mod 26
    iSite = iSite \ 26
    
    ' Fin du test le 12/7/01 PV
    '' Cas sp�cial de la Belgique, on force l'�tablissement � 3
    'If Mid(cSite, iSite + 1, 1) = "X" Then sEtb = "3"
    
    If iPrel = 0 Then       ' Cas des �tiquettes .FP
      txtNumEtb = ""        ' Pas n� d'�tablissement dans ce cas (celui de la planche d'IE est parfois bugg�)
      iPrel = 1
    Else
      If sEtb = "1" Then    ' Scan de la FRT (idiot, mais�)
        txtNumEtb = ""
      Else
        If bEtbFimebio Then sEtb = sEtb & Chr(65 + Val(sEtb) Mod 26)
        txtNumEtb = sEtb
      End If
    End If
    txtNumEtb_LostFocus
    
    txtR�f�rence = Mid(cSite, iSite + 1, 1) & Chr(65 + iIng) & iPrest & "." & Right(Str(100 + iPrel), 2)
    G�n�re6R�f�rences False
    btnRechercher.Enabled = False
    MAJTousStatus
    txtCB = sCB
    
    ' On restaure le bouton par d�faut
    btnAction.Enabled = True
    btnAction.Default = True
  End If
 
  bEnCours = False
End Sub


' ==============================================================================
' R�f�rence

' Retourne le status d'intervention sous la forme de deux code d'�tat: cEtatPH et cEtatLabo
' Les deux sont � vide si l'�chantillon n'a pas encore �t� saisi
Function sGetRefStatusEch(ByVal sRef As String, ByRef cEtatPH As String, ByRef cEtatLabo As String)

  ' Normalisation interne de la r�f�rence, sans point
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
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField cEtatPH
    br.GetField cEtatLabo

    ' Contr�le
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop
  Rel�cher
  
  Dim sStatus As String
  
  If cEtatPH = "" And cEtatLabo = "" Then
    sStatus = "Nouveau RA"
  Else
    sStatus = cEtatPH & "/" & cEtatLabo & ": "
    
    Select Case cEtatPH
      Case "": sStatus = sStatus & sGetIntlLib("CREtatPH0", "Pas de saisie PH")
      Case "1": sStatus = sStatus & sGetIntlLib("CREtatPH1", "Saisie PH labo")
      Case "2": sStatus = sStatus & sGetIntlLib("CREtatPH2", "Saisie PH en cours")
      Case "3": sStatus = sStatus & sGetIntlLib("CREtatPH3", "Saisie PH valid�e")
    End Select
  
    If cEtatLabo <> "" Then
      sStatus = sStatus & ", " & sLibell�EtatLabo(cEtatLabo)
    Else
      sStatus = sprintf(sGetIntlLib("CREtatL0", "analyse pas commenc�e."), sStatus)
      'sStatus = sStatus & ", analyse pas commenc�e."
    End If
  End If
   
  sGetRefStatusEch = sStatus
End Function


' V�rifie si une r�f�rence est valide
' Si c'est le cas, retourne le n� d'�tablissement d�j� utilis� sur l'intervention, ou -1 si il n'y a eu aucune saisie
Function bOkR�f�rence(txtR�f�rence As String, ByVal bMessage As Boolean, ByRef sStatusIntervention As String, ByRef bStatusEchantillon As Boolean) As Boolean
  
  ' Premi�re partie: v�rifications simples
  If txtR�f�rence = "" Then
    If bMessage Then MsgBox2i "CR306"
                      'MsgBox "La r�f�rence est obligatoire !", vbExclamation, sNomApp
    bOkR�f�rence = False
    Exit Function
  End If
  
  If Len(txtR�f�rence) < 9 Or Len(txtR�f�rence) > 11 Then
    If bMessage Then MsgBox2i "CO004", txtR�f�rence
                      'MsgBox "R�f�rence invalide ! (doit faire de 9 � 11 caract�res)", vbExclamation, sNomApp
    bOkR�f�rence = False
    Exit Function
  End If
  
  ' Normalisation externe de la r�f�rence, avec point
  If txtR�f�rence <> UCase(txtR�f�rence) Then txtR�f�rence = UCase(txtR�f�rence)
  
  If Left(txtR�f�rence, 1) < "A" Or Left(txtR�f�rence, 1) > "Z" Or Mid(txtR�f�rence, 2, 1) < "A" Or Mid(txtR�f�rence, 2, 1) > "Z" Then
    If bMessage Then MsgBox2i "CR307"
                      'MsgBox "La r�f�rence doit commencer par 2 lettres !", vbExclamation, sNomApp
    bOkR�f�rence = False
    Exit Function
  End If
  
  ' On v�rifie que les deux lettres sont bien affect�es. ZZ est autoris� pour les essais
  If Left(txtR�f�rence, 2) <> "ZZ" And UtiParLettres(Left(txtR�f�rence, 2)) Is Nothing Then
    If bMessage Then MsgBox2i "CR308"
                      'MsgBox "Les deux lettres de la r�f�rence ne sont pas affect�es � un assistant !", vbExclamation, sNomApp
    bOkR�f�rence = False
    Exit Function
  End If
      
  Dim p As Integer
  Dim sRefSansPoint As String

  p = InStr(txtR�f�rence, ".")
  If p = 0 Then
    sRefSansPoint = txtR�f�rence
    txtR�f�rence = Left(txtR�f�rence, Len(txtR�f�rence) - 2) & "." & Right(txtR�f�rence, 2)
  Else
    If p <> Len(txtR�f�rence) - 2 Then
      If bMessage Then MsgBox2i "CR309"
                        'MsgBox "Le num�ro d'�chantillon apr�s le point doit �tre compris entre 01 et 99 !", vbExclamation, sNomApp
      bOkR�f�rence = False
      Exit Function
    End If
    sRefSansPoint = Left(txtR�f�rence, p - 1) & Mid(txtR�f�rence, p + 1)
  End If
  
  Dim dRef As Double
  dRef = Val(Mid(txtR�f�rence, 3))
  
  If dRef < 10000 Or dRef = Int(dRef) Then
    If bMessage Then MsgBox2i "CR310"
                      'MsgBox "La r�f�rence d'intervention est un nombre sup�rieur � 10000." & vbCrLf & "Le num�ro d'�chantillon est compris entre 01 et 99", vbExclamation, sNomApp
    bOkR�f�rence = False
    Exit Function
  End If
  
  ' On r�cup�re les informations du d�mon
  Dim vStatus As Variant
  Bloquer
    Dim br As New Rev
    br.AddField IIf(frmRecherche.cmdTableSL.Checked, tcLabo, tcBacterio)
    br.AddField sRefSansPoint
    tcps.Envoie "TREF " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField vStatus: sStatusIntervention = NZ(vStatus)      ' numetb � NULL possible, on le traite en interne sous la valeur 0
    br.GetField bStatusEchantillon

    ' Contr�le
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop
  Rel�cher
  
  If vStatus = -2 Then    ' Incoh�rence
    If bMessage Then MsgBox2i "CR311"
                      'MsgBox "Erreur de coh�rence interne de la base de donn�es, plusieurs �tablissements pour une m�me r�f�rence d'intervention." & vbCrLf & vbCrLf & "Ne faites pas de saisie sous cette r�f�rence, et pr�venez imm�diatement la DI !", vbCritical, sNomApp
    bOkR�f�rence = False
    Exit Function
  End If
  
  If vStatus = -3 Then    ' R�f�rence d'archive
    If bMessage Then MsgBox2i "CR312", txtR�f�rence
                      'MsgBox "Cette r�f�rence est inutilisable, elle est pr�sente dans les tables d'archives." & vbCrLf & "Affichez le RA " & txtR�f�rence & " sur le Web pour voir le d�tail.", vbExclamation, sNomApp
    bOkR�f�rence = False
    Exit Function
  End If
  
  ' On ne peut rien conclure de plus sur les infos r�cup�r�es � ce moment
  ' Les tests sont continu�s dans btnAction_click
  bOkR�f�rence = True
End Function



Private Function iTestPlanning(ByVal sRefInt As String, ByVal txtNumEtb As String, ByVal iEch As Integer) As Integer
  ' On r�cup�re les informations du d�mon
  Dim iStatus As Integer
  Bloquer
    Dim br As New Rev
    br.AddField sRefInt
    br.AddField txtNumEtb
    br.AddField iEch
    tcps.Envoie "TPL2 " & br.Buffer
    
    Dim sLigne As String
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField iStatus

    ' Contr�le
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop
  Rel�cher

  iTestPlanning = iStatus
End Function


' Sur changement de r�f�rence, on d�truit les r�f�rences de rab
Private Sub txtR�f�rence_Change()
  EffaceListeR�f�rences
  txtR�f�rence.ForeColor = vbWindowText
  btnRechercher.Enabled = txtR�f�rence <> ""
End Sub


Private Sub btnRechercher_Click()
  If bBlocageEnCours Then
    ActionSuivante Me, "btnRechercher_Click"
    Exit Sub
  End If
  
  Dim sFiller As String, bFiller As Boolean
  If bOkR�f�rence(txtR�f�rence, True, sFiller, bFiller) Then
    txtR�f�rence.ForeColor = vbWindowText
    G�n�re6R�f�rences True
    btnRechercher.Enabled = False
    MAJTousStatus
  Else
    txtR�f�rence.SetFocus
    txtR�f�rence.ForeColor = RGB(255, 0, 0)
  End If
End Sub


Private Sub txtR�f�rence_KeyPress(KeyAscii As Integer)
  If KeyAscii >= Asc("a") And KeyAscii <= Asc("z") Then
    KeyAscii = KeyAscii - 32
  End If
  If Not (KeyAscii >= Asc("A") And KeyAscii <= Asc("Z") Or KeyAscii >= Asc("0") And KeyAscii <= Asc("9") Or KeyAscii = Asc(".") Or KeyAscii = 8 Or KeyAscii = Asc("V") - 64 Or KeyAscii = Asc("C") - 64 Or KeyAscii = Asc("X") - 64 Or KeyAscii = Asc("Z") - 64) Then
    KeyAscii = 0
  End If
  txtCB = ""
End Sub

    
Private Sub G�n�re6R�f�rences(bAvecProtectionR�entrance As Boolean)
  If bAvecProtectionR�entrance Then
    If bEnCours Then Exit Sub
    bEnCours = True
  End If
  
  Dim iEch As Integer
  Dim sRefIntervention As String
  Dim p As Integer
  p = InStr(txtR�f�rence, ".")
  If p <> 0 Then
    sRefIntervention = Left(txtR�f�rence, p - 1)
    iEch = Val(Mid(txtR�f�rence, p + 1))
  Else
    sRefIntervention = Left(txtR�f�rence, Len(txtR�f�rence) - 2)
    iEch = Val(Right(txtR�f�rence, 2))
  End If
  
  Dim iLoop As Integer
  iLoop = 0
  Do
    If iEch = 100 Then Exit Do
    If iLoop = 6 Then Exit Do
          
    Dim sRefRab As String
    sRefRab = sRefIntervention & "." & Right(100 + iEch, 2)
    AjouteR�f�rence sRefRab

    iLoop = iLoop + 1
    iEch = iEch + 1
  Loop
  
  lvR�f�rences.SetFocus
  SendKeys " "
  DoEvents
  
  
  If bAvecProtectionR�entrance Then
    bEnCours = False
    ' On restaure le bouton par d�faut
    btnAction.Enabled = True
    btnAction.Default = True
  End If
End Sub


'========================================================
' Saisie n� d'�tablissement

Function bOkNumEtb(ByVal bMessage As Boolean) As Boolean
  
  ' Premi�re partie: v�rifications simples
  If txtNumEtb = "" Then
    bOkNumEtb = True
    Exit Function
  End If
  
'  If Not IsNumeric(txtNumEtb) Then
'    If bMessage Then MsgBox2i "CO003", txtNumEtb
'                      'MsgBox "Le n� d'�tablissement doit �tre un nombre !", vbExclamation, sNomApp
'    txtNumEtb.SetFocus
'    bOkNumEtb = False
'    Exit Function
'  End If
  
  ' Recherche de l'�tablissement � proprement parler
  Dim e As Etablissement
  
  If txtNumEtb = "0" Then           ' Cas tr�s sp�cial�
    Set e = New Etablissement
    e.etb_prefixe = "AC"
    e.etb_nom = sGetIntlLib("CRtxtEtb", "�TABLISSEMENT EN COURS DE CR�ATION")
    'e.etb_nom = "�TABLISSEMENT EN COURS DE CR�ATION"
  Else
    Set e = LireEtablissement(txtNumEtb, False)
    If e Is Nothing Then
      If bMessage Then MsgBox2i "CO005", txtNumEtb
                        'MsgBox "�tablissement inexistant !", vbExclamation, sNomApp
      bOkNumEtb = False
      Exit Function
    End If
  End If
  
  txtPr�fixe = e.etb_prefixe
  txtNomEtb = e.etb_nom
  bOkNumEtb = True
End Function


Private Sub RechercheEtablissement()
  Dim e As Etablissement
  Set e = frmRechercheEtablissement.Cherche()
  If Not e Is Nothing Then
    txtNumEtb = e.etb_numetb
    txtPr�fixe = e.etb_prefixe
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
  txtPr�fixe = ""
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
' Protection contre les probl�mes de r�-entrance

Sub DoActionSuivante(ByVal sAction As String)
  Select Case sAction
    Case "btnRechercher_Click": btnRechercher_Click
    Case "txtNumEtb_LostFocus": txtNumEtb_LostFocus
    Case "btnAction_Click": btnAction_Click
    Case Else: MsgBox "frmRecherche.DoActionSuivante: Action suivante " & sAction & " inconnue !", vbCritical, sNomApp: Stop
  End Select
End Sub


'========================================================
' Affichage de l'�tat des connexions

Private Sub Timer1_Timer()
  Dim e As Integer
  e = tcps.Etat()
  If e <> iOldEtat Then
    sbStatus.Panels("ECom").Text = tcps.sEtatD�cod�
    sbStatus.Refresh
    iOldEtat = e
  End If
End Sub


'========================================================
' Passage � l'analyse suivante
' Appel� depuis la feuille RA

Public Sub Suivant()
  If lvR�f�rences.ListItems.Count = lvR�f�rences.SelectedItem.Index Then
    MsgBox2i "CR313"
    'MsgBox "Il n'y a pas de suivant dans la liste !", vbExclamation, sNomApp
  Else
    Set lvR�f�rences.SelectedItem = lvR�f�rences.ListItems(lvR�f�rences.SelectedItem.Index + 1)
    btnAction_Click
  End If
End Sub



'========================================================
' Internationalisation

Public Sub Internationalisation()
  sNomApp = sGetIntlLib("sNomApp", "Microb'Soft - Saisie des Rapprorts d'Analyse")
  sAttente = sGetIntlLib("sAttente", "ATTENTE")
  If sNomOp�rateur <> "" Then Caption = sNomApp & " [" & sNomOp�rateur & "]"
  
  SetLib mnuRA, "Caption", "CRmnuCRA"
  SetLib cmdEffacer, "Caption", "CRcmdEffacer"
  SetLib cmdModeVisualisation, "Caption", "CRcmdModeVisualisa"
  SetLib cmdModeSaisie, "Caption", "CRcmdModeSaisie"
  SetLib cmdTableST, "Caption", "CRcmdTableST"
  SetLib cmdTableSL, "Caption", "CRcmdTableSL"
  SetLib cmdSyst�meUnix, "Caption", "CRcmdSyst�meUnix"
  SetLib cmdIdentification, "Caption", "CRcmdIdentification"
  SetLib cmdConfigImprimante, "Caption", "CRcmdConfigImprim"
  SetLib cmdQuitter, "Caption", "CRcmdQuitter"
  
  SetLib mnuFRT, "Caption", "CRmnuFRT"
  SetLib cmdFRTImprimeCourant, "Caption", "CRcmdFRTImprimeCour"
  SetLib cmdFRTAcc�sG�n�ral, "Caption", "CRcmdFRTAcc�sG�n�ral"
  SetLib cmdFRTImprim�e, "Caption", "CRcmdFRTImprim�e"
  SetLib cmdFRTEtat, "Caption", "cmdFRTEtat"
  SetLib cmdAttacherEchus, "Caption", "CRcmdAttacherEchus"
  SetLib cmdD�tailFRT, "Caption", "CRcmdD�tailFRT"
  
  SetLib mnuRecherche, "Caption", "CRmnuRecherche"
  SetLib cmdRechEtablissement, "Caption", "CRcmdRechEtabliss"
  SetLib cmdRechLettres, "Caption", "CRcmdRechLettres"
  SetLib cmdRANonValid�s, "Caption", "CRcmdCRANonValid�s"
  SetLib cmdRAEchus, "Caption", "CRcmdCRAEchus"
  SetLib cmdComptageDLC, "Caption", "CRcmdComptageDLC"
  SetLib cmdSaisieAnomalie, "Caption", "CRcmdSaisieAnomalie"
  SetLib cmdOptions, "Caption", "CRcmdOptions"
  
  SetLib mnuAvanc�, "Caption", "CRmnuAvanc�"
  SetLib cmdAfficheVerrousCrad, "Caption", "CRcmdAffVerrousCrad"
  SetLib cmdModifApr�sValidation, "Caption", "CRcmdModifApr�sValid"
  
  SetLib mnuSyst�me, "Caption", "CRmnuSyst�me"
  SetLib cmdTCPFenetre, "Caption", "CRcmdTCPFenetre"
  SetLib cmdRel�cher, "Caption", "CRcmdRel�cher"
  SetLib cmdCache, "Caption", "CRcmdCache"
  SetLib cmdPurgeCache, "Caption", "CRcmdPurgeCache"
  SetLib cmdAfficheVerrousScraw, "Caption", "CRcmdAffichVerrScraw"
  SetLib cmdConnexion, "Caption", "CRcmdConnexion"
  SetLib cmdD�connexion, "Caption", "CRcmdD�connexion"
  
  SetLib mnuAide, "Caption", "CRmnuAide"
  SetLib cmdAideSommaire, "Caption", "CRcmdAideSommaire"
  SetLib cmdAideContextuelle, "Caption", "CRcmdAideContextuel"
  SetLib cmdDerni�resModifs, "Caption", "CRcmdDerni�resModifs"
  SetLib cmdAPropos, "Caption", "CRcmdAPropos"
  
  'SetLib mnuBarreBoutons, "Caption", "CRmnuBarreBoutons"
  SetLib cmdBarreStandard, "Caption", "CRcmdBarreStandard"
  SetLib cmdEtiquettes, "Caption", "CRcmdEtiquettes"
   
  SetLib Me, "Caption", "CRCaption"
  
  SetLib btnD�mo, "Caption", "btnD�mo"
  SetLib btnRechercher, "Caption", "btnRechercher"
  SetLib btnAction, "Caption", "btnAction"
  
  SetLib lblCodeBarre, "Caption", "CRlblCodeBarre"
  SetLib txtCB, "Tag", "CRtxtCB.tag"
  SetLib lblEtablissement, "Caption", "CRlblEtablissement"
  SetLib txtNumEtb, "Tag", "CRtxtNumEtb.tag"
  SetLib lblR�f�rence, "Caption", "CRlblR�f�rence"
  SetLib txtR�f�rence, "Tag", "CRtxtR�f�rence.tag"
  SetLib lblRA, "Caption", "CRlblCRA"
  SetLib lvR�f�rences.ColumnHeaders(1), "Text", "CRchR�f�rence"
  'SetLib lvR�f�rences.ColumnHeaders(2), "Text", "CRchClasse"
  SetLib lvR�f�rences.ColumnHeaders(3), "Text", "CRchEtat"
  SetLib lvR�f�rences.ColumnHeaders(4), "Text", "CRchAction"
  
  SetLib tbBoutons.Buttons("Nouveau"), "ToolTipText", "CRtbNouveau.tt"
  SetLib tbBoutons.Buttons("Utilisateur"), "ToolTipText", "CRtbUtilisateur.tt"
  SetLib tbBoutons.Buttons("Unix"), "ToolTipText", "CRtbUnix.tt"
  SetLib tbBoutons.Buttons("Imprimante"), "ToolTipText", "CRtbImprimante.tt"
  SetLib tbBoutons.Buttons("ImprimeFRT"), "ToolTipText", "CRtbImprimeFRT.tt"
  SetLib tbBoutons.Buttons("D�tailFRT"), "ToolTipText", "CRtbD�tailFRT.tt"
  SetLib tbBoutons.Buttons("Anomalie"), "ToolTipText", "CRtbAnomalie.tt"
  
End Sub

