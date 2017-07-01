VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmGDoc 
   Caption         =   "Gestionnaire de documents"
   ClientHeight    =   6210
   ClientLeft      =   150
   ClientTop       =   2115
   ClientWidth     =   10320
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmGDoc.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   414
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   688
   Begin VB.TextBox txtOperValidationLabo 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   5880
      Locked          =   -1  'True
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   4020
      Width           =   2715
   End
   Begin VB.TextBox txtDateValidationLabo 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   5880
      Locked          =   -1  'True
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   3660
      Width           =   2715
   End
   Begin VB.TextBox txtValidationAssistant 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   5880
      Locked          =   -1  'True
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   2940
      Width           =   2715
   End
   Begin MSFlexGridLib.MSFlexGrid fgEtat 
      Height          =   2295
      Left            =   60
      TabIndex        =   4
      Top             =   3240
      Width           =   5475
      _ExtentX        =   9657
      _ExtentY        =   4048
      _Version        =   393216
      Rows            =   9
      Cols            =   4
      FocusRect       =   0
      HighLight       =   0
      ScrollBars      =   0
      BorderStyle     =   0
      Appearance      =   0
      FormatString    =   "^�tat|Date+heure|N�|Pers"
   End
   Begin MSComctlLib.TreeView tvDoc 
      Height          =   1995
      Left            =   45
      TabIndex        =   3
      Top             =   600
      Width           =   10095
      _ExtentX        =   17806
      _ExtentY        =   3519
      _Version        =   393217
      Indentation     =   556
      LabelEdit       =   1
      Style           =   7
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComctlLib.Toolbar tbBoutons 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10320
      _ExtentX        =   18203
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      AllowCustomize  =   0   'False
      Wrappable       =   0   'False
      Appearance      =   1
      ImageList       =   "ImageListTB"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   17
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            ImageKey        =   "imgNouveau"
            Style           =   3
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Lire"
            Object.ToolTipText     =   "S�lectionne des documents (Ctrl+L)"
            ImageKey        =   "imgLire"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Retards"
            Object.ToolTipText     =   "S�lectionne les documents en retard (Ctrl+R)"
            ImageKey        =   "imgRetards"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Utilisateur"
            Object.ToolTipText     =   "Change l'utilisateur courant"
            ImageKey        =   "imgUtilisateur"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Unix"
            Object.ToolTipText     =   "Change de syst�me Unix"
            ImageKey        =   "imgUnix"
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Imprimante"
            Object.ToolTipText     =   "Change l'imprimante courante"
            ImageKey        =   "imgImprimante"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
            MixedState      =   -1  'True
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "AjoutDoc"
            Object.ToolTipText     =   "Ajoute un document � l'intervention"
            ImageKey        =   "imgAjoutDoc"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "SupDoc"
            Object.ToolTipText     =   "Supprime un document de l'intervention"
            ImageKey        =   "imgSupDoc"
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Voir"
            Object.ToolTipText     =   "Visualise le document s�lectionn�"
            ImageKey        =   "imgVisualisation"
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Saisie"
            Object.ToolTipText     =   "Modifie le document s�lectionn�"
            ImageKey        =   "imgSaisie"
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "ImpRel"
            Object.ToolTipText     =   "Impression de relecture"
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Valid"
            Object.ToolTipText     =   "Validation"
            ImageKey        =   "imgValid�"
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "ImpDef"
            Object.ToolTipText     =   "Impression d�finitive"
         EndProperty
         BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Envoy�"
            Object.ToolTipText     =   "Bascule les documents � l'�tat envoy�"
            ImageKey        =   "imgEnvoy�"
         EndProperty
      EndProperty
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   8880
      Top             =   4620
   End
   Begin MSComctlLib.ProgressBar pbProgress 
      Height          =   165
      Left            =   60
      TabIndex        =   1
      Top             =   5640
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
      TabIndex        =   2
      Top             =   5895
      Width           =   10320
      _ExtentX        =   18203
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   4
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   8890
            MinWidth        =   7408
            Key             =   "Info"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   3175
            MinWidth        =   3175
            Picture         =   "frmGDoc.frx":0442
            Key             =   "Impr"
            Object.ToolTipText     =   "Imprimante s�lectionn�e"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   529
            MinWidth        =   529
            Picture         =   "frmGDoc.frx":0994
            Key             =   "EInt"
            Object.ToolTipText     =   "Le cadenas indique que le programme communique"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5027
            MinWidth        =   5027
            Picture         =   "frmGDoc.frx":0D46
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
   Begin MSComctlLib.ImageList ImageListTB 
      Left            =   8760
      Top             =   3360
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
            Picture         =   "frmGDoc.frx":110C
            Key             =   "imgLireAvanc�"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":1426
            Key             =   "imgUnix0"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":1978
            Key             =   "imgUtilisateur"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":1C92
            Key             =   "imgImprimante"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":1DA4
            Key             =   "imgEtablissement"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":20BE
            Key             =   "imgImprimeFRT"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":23D8
            Key             =   "imgSaisie0"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":26F2
            Key             =   "imgNouveau"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":2A0C
            Key             =   "imgUnix"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":2D26
            Key             =   "imgFRT"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":3040
            Key             =   "Anomalie"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":335A
            Key             =   "imgLire"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":347A
            Key             =   "imgAjoutDoc"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":35D6
            Key             =   "imgSupDoc"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":3732
            Key             =   "imgRetards"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":3B8A
            Key             =   "imgVisualisation"
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":3CE6
            Key             =   "imgSaisie"
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":3DFA
            Key             =   "imgEnvoy�"
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmGDoc.frx":424E
            Key             =   "imgValid�"
         EndProperty
      EndProperty
   End
   Begin VB.Label lblValidationLabo 
      AutoSize        =   -1  'True
      Caption         =   "Validation labo :"
      Height          =   210
      Left            =   5880
      TabIndex        =   7
      Top             =   3420
      Width           =   1530
   End
   Begin VB.Label lblValidationAssistant 
      AutoSize        =   -1  'True
      Caption         =   "Validation assistant :"
      Height          =   210
      Left            =   5940
      TabIndex        =   5
      Top             =   2700
      Width           =   1995
   End
   Begin VB.Menu mnuIntervention 
      Caption         =   "&Intervention"
      Begin VB.Menu cmdLire 
         Caption         =   "&Lire�"
         Shortcut        =   ^L
      End
      Begin VB.Menu cmdRetards 
         Caption         =   "&Retards�"
         Shortcut        =   ^R
      End
      Begin VB.Menu sep11 
         Caption         =   "-"
      End
      Begin VB.Menu cmdImprimeLC 
         Caption         =   "&Impression liste courante"
      End
      Begin VB.Menu sep10 
         Caption         =   "-"
      End
      Begin VB.Menu cmdSyst�meUnix 
         Caption         =   "&Syst�me unix�"
      End
      Begin VB.Menu cmdIdentification 
         Caption         =   "&Identification de l'utilisateur�"
      End
      Begin VB.Menu cmdConfigImprimante 
         Caption         =   "Configuration &imprimante�"
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
      End
      Begin VB.Menu cmdQuitter 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu mnuDocument 
      Caption         =   "&Document"
      Begin VB.Menu cmdVisualisation 
         Caption         =   "Vis&ualisation�"
      End
      Begin VB.Menu cmdSaisie 
         Caption         =   "&Saisie�"
      End
      Begin VB.Menu cmdSaisieRestreinte 
         Caption         =   "Saisie &restreinte"
      End
      Begin VB.Menu cmdImpressionRelecture 
         Caption         =   "&Impression relecture"
         Shortcut        =   ^P
      End
      Begin VB.Menu cmdSimulImpRelect 
         Caption         =   "Si&mulation impression relecture"
      End
      Begin VB.Menu cmdValidation 
         Caption         =   "&Validation�"
         Shortcut        =   ^V
      End
      Begin VB.Menu cmdImpressionD�finitive 
         Caption         =   "Impression d�finitive"
         Shortcut        =   ^F
      End
      Begin VB.Menu cmdEnvoy� 
         Caption         =   "&Envoy�"
         Shortcut        =   ^E
      End
      Begin VB.Menu sep1b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdAjoute 
         Caption         =   "&Ajoute�"
      End
      Begin VB.Menu cmdSupprime 
         Caption         =   "Su&pprime�"
      End
      Begin VB.Menu sep7 
         Caption         =   "-"
      End
      Begin VB.Menu cmdD�laiNormal 
         Caption         =   "&D�lai normal"
      End
      Begin VB.Menu cmdD�laiHors 
         Caption         =   "&Hors d�lai"
      End
      Begin VB.Menu sep7b 
         Caption         =   "-"
      End
      Begin VB.Menu cmdImpressionD�taill�e 
         Caption         =   "Impression d�&taill�e�"
      End
   End
   Begin VB.Menu mnuAnnulation 
      Caption         =   "A&nnulation"
      Begin VB.Menu cmdAnnulationSaisie 
         Caption         =   "&Saisie (1,2,3 � 0)"
      End
      Begin VB.Menu cmdAnnulationValidation 
         Caption         =   "&Validation (4,5 � 3)"
      End
      Begin VB.Menu cmdAnnulationImprDef 
         Caption         =   "Impression d�&finitive (6 � 5)"
      End
      Begin VB.Menu cmdAnnulationEnvoy� 
         Caption         =   "&Envoy� (7 � 6)"
      End
      Begin VB.Menu sep7a 
         Caption         =   "-"
      End
      Begin VB.Menu cmdTrafiquer 
         Caption         =   "&Trafiquer�"
      End
      Begin VB.Menu cmdAnnulerValidationLabo 
         Caption         =   "Validation &labo�"
      End
   End
   Begin VB.Menu mnuRecherche 
      Caption         =   "&Recherche"
      Begin VB.Menu cmdRechEtablissement 
         Caption         =   "&Etablissement�"
      End
      Begin VB.Menu cmdRechLettres 
         Caption         =   "&Lettres d'assistant�"
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu cmdOptions 
         Caption         =   "&Options�"
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
Attribute VB_Name = "frmGDoc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "Feuille d'accueil de la saisie des CRA sous Windows"
' frmGDoc
' Feuille d'accueil du gestionnaire de documents Windows (GDocW)
'  1/02/1999 PV

Option Explicit

Public iOldEtat As Integer       ' �tat courant de la connexion TCP
Private bD�chargementFinalEnCours As Boolean

Private colDocuments As New Collection

Private iNiveauCourant As Integer
'-1: Pas de lecture
' 0: Tous les documents s�lectionn�s
' 1: R�f�rence s�lectionn�e
' 2: Document s�lectionn�


Private Sub cmdAideContextuelle_Click()
  Aide "frmgdoc"
End Sub

Private Sub cmdAideSommaire_Click()
  Aide "index"
End Sub

Private Sub cmdAjoute_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If tvDoc.Nodes.Count = 0 Or tvDoc.SelectedItem Is Nothing Then
    MsgBox2i "GD007"      ' S�lectionnez une intervention ou un document avant de choisir la commande Ajout
    Exit Sub
  End If
  
  Dim dMod�le As Document, dNouvDoc As Document
  Dim sRefInt As String
  Select Case Left(tvDoc.SelectedItem.Key, 1)
    Case "R":   ' Tous les documents s�lectionn�s
      MsgBox2i "GD007"    ' S�lectionnez une intervention ou un document avant !
      Exit Sub
      
    Case "I":   ' Intervention
      sRefInt = tvDoc.SelectedItem.Key
      Set dMod�le = colDocuments(tvDoc.SelectedItem.Child.Key)
      
    Case "D":   ' Document
      sRefInt = tvDoc.SelectedItem.Parent.Key
      Set dMod�le = colDocuments(tvDoc.SelectedItem.Key)
  End Select
  
  Dim sClasse As String, sNo As String
  If frmAjoutDocument.bAjouteDocument(dMod�le, sClasse, sNo) Then
    If bAjouteDocument(dMod�le, dNouvDoc, sClasse, sNo) Then    ' Cr�ation par la classe Ok
      colDocuments.Add dNouvDoc, dNouvDoc.Key                   ' Ajout dans la collection
      AjouteLigneDocument sRefInt, dNouvDoc                     ' Ajout dans le treeview
      AjusteIntervention sRefInt                                ' Mise � jour des indicateurs de l'intervention
    Else
      MsgBox2i "GD026"    ' Echec lors de la cr�ation du document.
    End If
  End If
End Sub


Private Sub cmdSupprime_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If tvDoc.Nodes.Count = 0 Or tvDoc.SelectedItem Is Nothing Then
    MsgBox2i "GD011"      ' S�lectionnez un document avant de choisir la commande supprimer
    Exit Sub
  End If
  
  Dim d As Document
  Select Case Left(tvDoc.SelectedItem.Key, 1)
    Case "R":   ' Tous les documents s�lectionn�s
    Case "I":   ' Intervention
      MsgBox2i "GD011"    ' S�lectionnez un document avant de choisir cette commande
      Exit Sub
      
    Case "D":   ' Document
      Set d = colDocuments(tvDoc.SelectedItem.Key)
  End Select
  
  If d.doc_etat > "0" Then
    MsgBox2i "GD012"      ' Vous ne pouvez pas supprimer un document qui n'est pas � l'�tat 0.||Commencez par ramener son �tat � 0 avec les commandes d'annulation
    Exit Sub
  End If

  
  Dim sClasse As String, sNo As String
  If frmSupprimeDocument.bSupprimeDocument(d) Then
    SupprimeDocument d                      ' Suppression dans la base + tra�abilit�
    colDocuments.Remove d.Key               ' Suppression dans la collection de documents
    Dim sRefInt As String
    sRefInt = tvDoc.Nodes(d.Key).Parent.Key
    tvDoc.Nodes.Remove d.Key                ' Suppression dans le TreeView
    AjusteIntervention sRefInt              ' Mise � jour des indicateurs de l'intervention
  End If
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

Private Sub cmdLire_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  frmLectureDocument.DoFormRecherche False
End Sub

Private Sub cmdRetards_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  frmRetards.DoForm
End Sub


Private Sub cmdPurgeCache_Click()
  On Error Resume Next
  Kill App.Path & "\Cache utilisateurs 2.dat"
  Kill App.Path & "\Cache lettres 2.dat"
  Kill App.Path & "\Cache germes.dat"
  Kill App.Path & "\Cache milieux.dat"
  Kill App.Path & "\Cache conclusions.dat"
  Kill App.Path & "\Cache unit�s.dat"
  Kill App.Path & "\Cache m�thodes.dat"
  Kill App.Path & "\Cache libell�s Ercem.dat"
  Kill App.Path & "\Cache libell�s CRA.dat"
  On Error GoTo 0
  
  MsgBox "Les fichiers cache ont �t� effac�s.", vbInformation, sNomApp
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
  'mnuAvanc�.Visible = (iNiveau And 16) <> 0
End Sub



' =============================================================================
' Options

Private Sub cmdOptions_Click()
  frmOptions.Show 1
  DoOptionsAffichage
End Sub

Public Sub DoOptionsAffichage()
  ' On masque les contr�les et menus si on n'est pas en mode avanc�
  mnuSyst�me.Visible = bAfficherMenuSyst�me
  
  ' Barre de boutons de la feuille
  AjusterBarreBoutons
  
  ' On met � jour les barres de boutons sur les feuilles CRA
  Dim f
  For Each f In Forms
    'If TypeOf f Is frmCRA Then f.AjusterBarreBoutonsCRA
  Next
End Sub


' ===============================================================================
' Barre de boutons

Private Sub tbBoutons_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
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
  Form_Resize
End Sub


Private Sub AjusterBarreBoutons()
  If bAfficherBarreDeBoutons Then
    tbBoutons.Visible = True
    
    If bAfficherEtiquettesDeBoutons Then
      tbBoutons.Buttons("Lire").Caption = "Lire"
      tbBoutons.Buttons("Retards").Caption = "Ret"
      tbBoutons.Buttons("Utilisateur").Caption = "Util"
      tbBoutons.Buttons("Unix").Caption = "Unix"
      tbBoutons.Buttons("Imprimante").Caption = "Impr"
      tbBoutons.Buttons("AjoutDoc").Caption = "+Doc"
      tbBoutons.Buttons("SupDoc").Caption = "-Doc"
      tbBoutons.Buttons("Voir").Caption = "Voir"
      tbBoutons.Buttons("Saisie").Caption = "Saisie"
      tbBoutons.Buttons("ImpRel").Caption = "ImpRel"
      tbBoutons.Buttons("Valid").Caption = "Valid"
      tbBoutons.Buttons("ImpDef").Caption = "ImpD�f"
      tbBoutons.Buttons("Envoy�").Caption = "Envoy�"
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
    vOff = tbBoutons.Height
  Else
    vOff = 0
  End If
  vOff = vOff - 28 ' Hauteur de la barre en mode d�veloppement (offset des top relev�s)
  
  'lblCodeBarre.Top = vOff + 40
  'txtCB.Top = vOff + 36
End Sub


' ===============================================================================

Private Sub cmdQuitter_Click()
  Unload Me
End Sub


Private Function bCRAOuvert() As Boolean
'  Dim f As Form
'  For Each f In Forms
'    If TypeOf f Is frmCRA Then
'      MsgBox "Vous ne pouvez pas effectuer cette op�ration tant qu'il reste un CRA affich� !", vbExclamation, sNomApp
'      bCRAOuvert = True
'      Exit Function
'    End If
'  Next
  bCRAOuvert = False
End Function

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If bCRAOuvert Then
    Cancel = 1
    Exit Sub
  End If
  
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
    MsgBox "�tablissement(s) s�lectionn�(s) :" & sMessage, vbInformation, sNomApp
  End If
End Sub

Private Sub cmdRechLettres_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  Dim l As String
  l = frmRechercheLettres.Cherche()
  If l <> "" Then
    MsgBox "Lettres s�lectionn�es: " & l, vbInformation, sNomApp
  End If
End Sub


'========================================================

Private Sub cmdSyst�meUnix_Click()
  If bBlocageEnCours Then Beep: Exit Sub
  If bCRAOuvert Then Exit Sub

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
    
    iOldEtat = 0    ' Force l'affichage de la mise � jour de l'�tat

    Connexion
    Unload frmSplash
    Screen.MousePointer = vbDefault
    
    frmSplash.Hide
    Select Case frmLogin.iInitUtilisateur(True)
      Case 1:       ' Annuler
        MsgBox2i "CO025"
        Unload Me     ' Sans risque, on sait que tous les CRA sont ferm�s
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


Private Sub Form_Load()
  Dim bPremierLancement As Boolean
  Dim sBienvenue As String
  
  IntlInit
  Internationalisation
  
  If App.PrevInstance Then
    If InStr(Command, "-h") = 0 Then MsgBox2i "CR024", sNomApp
    sNomOp�rateur = GetSetting(sApplicationGlobale, "Utilisateur", "Nom", "")
    On Error Resume Next
    AppActivate sNomApp & " [" & sNomOp�rateur & "]"
    Unload frmTCP
    Unload Me
    End
  End If
  
  Set frmBase = Me
  Caption = sNomApp
  
  CommandesInitiales
  
  Contr�leDerni�reVersion   ' On v�rifie qu'il n'y a pas une version plus r�cente sur Z
  Contr�leEnvironnement     ' On v�rifie que l'environnement du programme est Ok
  
  frmOptions.InitOptions
  If GetSetting(sApplicationGlobale, "Options", "Fen�treTCP", 0) Then
    cmdTCPFenetre.Checked = True
    tcps.AfficheTrace True
  End If
  
  ' Initialisation du tableau des �tats
  Dim l As Integer
  For l = 1 To 8
    fgEtat.TextMatrix(l, 0) = l - 1
  Next
  fgEtat.ColWidth(1) = 2000
  fgEtat.ColWidth(2) = 500
  fgEtat.ColWidth(3) = 2500
  sbStatus.ZOrder 0       ' sbStatus au 1er plan dans les retaillages "short"

  
  DoOptionsAffichage
  Show
  DoEvents
  
  ' On centre la fen�tre
  ' Move (Screen.Width - Width) / 2, (Screen.Height - Height) / 2, Width, Height / 2
  
  If GetSetting(sApplicationGlobale, "Utilisateur", "Nom", "") = "" Then bPremierLancement = True
  
  If bPremierLancement Then
    Dim cSauveLangage As String
    Do
      frmSplash.lblChargement.Visible = False
      frmSplash.lblBienvenue.Visible = True
    
      sBienvenue = sGetIntlLib("sBienvenue", "Bienvenue !") & vbCrLf & vbCrLf
      frmSplash.lblBienvenue = sBienvenue
      frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("sBienvenue1", "") & vbCrLf
      frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("sBienvenue2", "") & vbCrLf & vbCrLf
      frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("sBienvenue3", "")
      
      frmSplash.Width = 7035
      frmSplash.Height = 3700
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
  Select Case frmLogin.iInitUtilisateur(InStr(LCase(Command), "-nologin") = 0)         ' Utilisateur courant, identification forc�e
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
  
  If bPremierLancement Then
    frmSplash.lblChargement.Visible = False
    frmSplash.lblBienvenue.Visible = True
    frmSplash.lblBienvenue = sBienvenue
    frmSplash.lblBienvenue = frmSplash.lblBienvenue & "Pour le premier lancement, vous allez choisir l'imprimante que vous utiliserez." & vbCrLf
    frmSplash.lblBienvenue = frmSplash.lblBienvenue & "Vous pourrez modifier ce choix � tout moment par la suite avec la commande CRA, Configuration imprimante."
    frmSplash.Width = 7035
    frmSplash.Height = 3700
    frmSplash.Show 1
  End If

  ' On lit le nom de l'imprimante dans la registry
  frmConfigImprimante.InitImprimantes
  If sImprimanteLaser = "" Then
    MsgBox2i "CO039"
    End
  End If
  
  If bPremierLancement Then
    frmSplash.lblChargement.Visible = False
    frmSplash.lblBienvenue.Visible = True
    frmSplash.lblBienvenue = sBienvenue
    frmSplash.lblBienvenue = frmSplash.lblBienvenue & sGetIntlLib("sBienvenue4", "Fin de l'initialisation")
    frmSplash.Width = 7035
    frmSplash.Height = 3700
    frmSplash.Show 1
  End If
  
  ' Fin du chargement
  Enabled = True
  Unload frmSplash
  
  '' Installation automatique de l'agent
  'frmInstallAgent.AutoInstallAgent
  
  ' Affichage des informations sur la nouvelle version
  InfoVersion True
  
  ' Initialisation des classes de document (colShellDoc)
  InitColClasseDocument
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

' =============================================================================
' Administration de la feuille

Private Sub Form_Paint()
  Line (0, 0)-Step(ScaleWidth, 0), vbButtonShadow
  Line (0, 1)-Step(ScaleWidth, 0), vb3DHighlight
  
  If (bAfficherBarreDeBoutons) Then
    Line (0, tbBoutons.Height)-Step(ScaleWidth, 0), vbButtonShadow
    Line (0, tbBoutons.Height + 1)-Step(ScaleWidth, 0), vb3DHighlight
  End If
End Sub

Private Sub Form_Resize()
  If ScaleHeight < 250 Or ScaleWidth < 250 Then Exit Sub
  
  Dim vOff As Integer
  If bAfficherBarreDeBoutons Then
    vOff = tbBoutons.Height
  Else
    vOff = 0
  End If
  
  On Error Resume Next
  tvDoc.Top = vOff + 4
  tvDoc.Height = ScaleHeight - vOff - 182
  tvDoc.Width = ScaleWidth - 6
  fgEtat.Top = ScaleHeight - 175
  
  lblValidationAssistant.Top = fgEtat.Top + 4
  txtValidationAssistant.Top = fgEtat.Top + 20
  lblValidationLabo.Top = fgEtat.Top + 52
  txtDateValidationLabo.Top = fgEtat.Top + 68
  txtOperValidationLabo.Top = fgEtat.Top + 92
End Sub


' =============================================================================
' Barre de boutons

Private Sub tbBoutons_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Key
    Case "Lire":        cmdLire_Click
    Case "Retards":     cmdRetards_Click
    
    Case "Utilisateur": cmdIdentification_Click
    Case "Unix":        cmdSyst�meUnix_Click
    Case "Imprimante":  cmdConfigImprimante_Click
    
    Case "AjoutDoc":    cmdAjoute_Click
    Case "SupDoc":      cmdSupprime_Click
    
    Case "Voir":        cmdVisualisation_Click
    Case "Saisie":      '
    Case "ImpRel":      '
    Case "Valid":       '
    Case "ImpDef":      '
    Case "Envoy�":      '
    
    Case Else:          MsgBox "Bouton '" & Button.Key & "' inconnu !", vbCritical, sNomApp: Stop
  End Select
End Sub


Private Sub sbStatus_PanelDblClick(ByVal Panel As Panel)
  If Panel.Key = "Info" Then MsgBox "Cette zone affiche des messages d'aide et d'information g�n�raux, en particulier le r�le de l'�l�ment s�lectionn�.", vbInformation, sNomApp
  If Panel.Key = "Impr" Then cmdConfigImprimante_Click
  If Panel.Key = "EInt" Then MsgBox "Cette zone indique si le programme �change des donn�es avec le d�mon Unix." & vbCrLf & "Pr�t indique qu'il n'y a pas de communication en cours." & vbCrLf & "Bloqu� indique qu'il y a un �change de donn�es en cours.", vbInformation, sNomApp
  If Panel.Key = "ECom" Then cmdSyst�meUnix_Click
End Sub


' =============================================================================
' Gestion du GotFocus (affichage de l'aide sur le contr�le courant)

Private Sub GotFocus()
  sbStatus.Panels("Info").Text = ActiveControl.Tag
  If TypeOf ActiveControl Is TextBox Then AutoSelect ActiveControl
End Sub

Private Sub txtCB_GotFocus(): GotFocus: End Sub

'========================================================

Public Sub AfficheBarreProgression(iMin As Integer, iMax As Integer, iValeur As Integer)
  pbProgress.Min = iMin
  pbProgress.Max = iMax
  pbProgress.Value = iValeur
  
  pbProgress.Move sbStatus.Panels(2).Left, sbStatus.Top + 2, sbStatus.Panels(2).Width, sbStatus.Height - 2
  pbProgress.ZOrder 0
  pbProgress.Visible = True
End Sub



'========================================================
' Protection contre les probl�mes de r�-entrance

Sub DoActionSuivante(ByVal sAction As String)
  Select Case sAction
'    Case "btnRechercher_Click": btnRechercher_Click
'    Case "txtNumEtb_LostFocus": txtNumEtb_LostFocus
'    Case "btnAction_Click": btnAction_Click
    Case Else: MsgBox "frmGDoc.DoActionSuivante: Action suivante " & sAction & " inconnue !", vbCritical, sNomApp: Stop
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

Private Sub EffaceInformations()
  tvDoc.Nodes.Clear
  EffaceD�tail
End Sub

Private Sub EffaceD�tail()
  Dim l As Integer
  For l = 1 To 8
    fgEtat.TextMatrix(l, 1) = ""
    fgEtat.TextMatrix(l, 2) = ""
    fgEtat.TextMatrix(l, 3) = ""
  Next
  txtValidationAssistant = ""
  txtDateValidationLabo = ""
  txtOperValidationLabo = ""
End Sub

Private Sub AfficheD�tailDocument(sRefDoc As String)
  Dim d As Document
  Set d = colDocuments(sRefDoc)
  With d
    Dim l As Integer
    For l = 1 To 8
      fgEtat.TextMatrix(l, 1) = NV(.doc_ts(l - 1))
      fgEtat.TextMatrix(l, 2) = NV(.doc_oper(l - 1))
      If IsNull(.doc_oper(l - 1)) Then
        fgEtat.TextMatrix(l, 3) = ""
      Else
        fgEtat.TextMatrix(l, 3) = sNomUtilisateur(.doc_oper(l - 1))
      End If
    Next
    
    txtValidationAssistant = sNomUtilisateur(.doc_assval)
    txtDateValidationLabo = NV(.doc_tsvallabo)
    txtOperValidationLabo = sNomUtilisateur(.doc_opervallabo)
  End With
End Sub


'========================================================
' Ajuste les indicateurs d'�tat d'une ligne (d'intervention) de tvDoc

Private Sub AjusteIntervention(sRefInt As String)
  If sRefInt = "" Then Exit Sub
  
  ' On n'ajuste que des interventions
  Assert Left(tvDoc.Nodes(sRefInt).Key, 1) = "I"
  
  Dim n As Node
  Dim sEMin As String, sEMax As String
  If tvDoc.Nodes(sRefInt).Children = 0 Then
    sEMin = "-"
    sEMax = "-"
  Else
    sEMin = "9"
    sEMax = "."
    Set n = tvDoc.Nodes(sRefInt).Child
    Do
      Dim d As Document
      Set d = colDocuments(n.Key)
      If d.doc_etat < sEMin Then sEMin = d.doc_etat
      If d.doc_etat > sEMax Then sEMax = d.doc_etat
      
      If n Is tvDoc.Nodes(sRefInt).Child.LastSibling Then Exit Do
      Set n = n.Next
    Loop
  End If
  
  Dim sNewText As String
  sNewText = sJustifieCha�ne(tvDoc.Nodes(sRefInt).Text, 70, ejGauche) & "  " & sEMin & "-" & sEMax
  tvDoc.Nodes(sRefInt).Text = sNewText
End Sub


'========================================================
' G�re l'affichage d'une ligne de document

Private Function sLigneDocument(d As Document) As String
  sLigneDocument = sJustifieCha�ne(d.doc_classe & " " & d.doc_refdoc, 10, ejGauche) & sJustifieCha�ne(d.doc_titre, 54, ejGauche) & "    " & d.doc_horsdelai & sJustifieCha�ne(d.doc_etat, 4, ejDroite)
End Function

Private Sub AjouteLigneDocument(sRefInt As String, d As Document)
  tvDoc.Nodes.Add sRefInt, tvwChild, d.Key, sLigneDocument(d)
End Sub

' Met � jour l'affichage du document d, et des totaux sup�rieurs
Private Sub MAJAffichage(d As Document)
  ' On r�affiche la ligne
  tvDoc.Nodes(d.Key).Text = sLigneDocument(d)

  ' Puis on ajuste le total (pas performant si on est dans une
  ' boucle qui modiie successivement les �l�ments du total�)
  AjusteIntervention tvDoc.Nodes(d.Key).Parent.Key  ' cl� de l'intervention
End Sub


'========================================================
' Lecture des documents

Public Sub DoLecture(txtDate As String, txtLettres As String, txtR�f�rence As String, txtNumEtb As String, txtPr�fixe As String, txtTypeDocument As String, txtEtatDocument As String, iHorsD�lai As Integer, bOuter As Boolean)
  Dim sReq As String        ' Requ�te sur document/planning
  Dim sReqEtb As String     ' Requ�te sur la table �tablissement
  
  If txtDate = "" And txtLettres = "" And txtR�f�rence = "" And txtNumEtb = "" Then
    MsgBox2i "GD001"
    Exit Sub
  End If
  
  ' On fabrique le query global
  ' Requ�te sur document/planning
  If txtDate <> "" Then
    sReq = "pla_dateplan$" & sNormaliseQuery(txtDate, "d")
  End If
  
  If txtLettres <> "" Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "pla_lettres$" & sNormaliseQuery(txtLettres, "l")
  End If
  
  If txtR�f�rence <> "" Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "pla_iref$" & sNormaliseQuery(txtR�f�rence, "n")
  End If
  
  If txtNumEtb <> "" Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "pla_etb$" & sNormaliseQuery(txtNumEtb, "a")
  End If
  
  If txtTypeDocument <> "" Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "doc_classe$" & sNormaliseQuery(txtTypeDocument, "a")
  End If
  
  If txtEtatDocument <> "" Then
    If sReq <> "" Then sReq = sReq & "$"
    sReq = sReq & "doc_etat$" & sNormaliseQuery(txtEtatDocument, "n")
  End If
  
  If iHorsD�lai <> 0 Then
    If sReq <> "" Then sReq = sReq & "$"
    If iHorsD�lai = 1 Then sReq = sReq & "doc_horsdelai$<>"
    If iHorsD�lai = 2 Then sReq = sReq & "doc_horsdelai$="
  End If
  
  ' Requ�te sur la partie �tablissement
  If txtPr�fixe <> "" Then
    If sReqEtb <> "" Then sReqEtb = sReq & "$"
    sReqEtb = sReqEtb & "etb_prefixe$" & sNormaliseQuery(txtPr�fixe, "a")
  End If
  

  
  sbStatus.Panels("Info").Text = sGetIntlLib("GDRechEnCours", "Recherche des documents en cours�")
  EffaceInformations

  RechercheDocuments colDocuments, sReq, sReqEtb, bOuter

  If colDocuments.Count = 0 Then
    sbStatus.Panels("Info").Text = ""
    iNiveauCourant = -1                 ' Pas de document s�lectionn�
    MsgBox2i "GD002"
    Exit Sub
  End If
  
  Dim nodX As Node
  Set nodX = tvDoc.Nodes.Add(, , "R", "Documents s�lectionn�s")
  nodX.Expanded = True
  
  Dim iLastRef As Long, sRefInt As String
  iLastRef = 0
  
  Dim d As Document
  Dim sLigne As String
  For Each d In colDocuments
    If d.pla_iref <> iLastRef Then
      iLastRef = d.pla_iref
      AjusteIntervention sRefInt
      sRefInt = "I" & d.pla_iref
      
      sLigne = sJustifieCha�ne(d.pla_lettres & d.pla_iref, 9, ejGauche)
      sLigne = sLigne & Format(d.pla_dateplan, "dd/mm/yyyy") & " "
      sLigne = sLigne & d.etb_prefixe & " " & d.etb_nom
      Set nodX = tvDoc.Nodes.Add("R", tvwChild, sRefInt, sLigne)
    End If
    
    ' doc_serial<0 correspond aux documents NULL g�n�r�s par le outer
    If d.doc_serial > 0 Then
      AjouteLigneDocument sRefInt, d
    End If
  Next
  AjusteIntervention sRefInt
  
  sbStatus.Panels("Info").Text = ""
  
  ' Positionnement de la s�lection
  If tvDoc.Nodes.Count > 1 Then
    Set tvDoc.SelectedItem = tvDoc.Nodes(1)
  End If
  tvDoc_Click
End Sub


Private Sub tvDoc_Click()
  If tvDoc.Nodes.Count = 0 Then Exit Sub
  If tvDoc.SelectedItem Is Nothing Then Exit Sub
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Exit Sub
  
  Dim sDate As String
  Select Case Left(tvDoc.SelectedItem.Key, 1)
    Case "R":   ' Tous les documents s�lectionn�s
      EffaceD�tail
      
    Case "I":   ' Intervention
      EffaceD�tail
      
    Case "D":   ' Document
      AfficheD�tailDocument tvDoc.SelectedItem.Key
  End Select
End Sub

Private Sub tvDoc_DblClick()
  cmdVisualisation_Click
End Sub

Private Sub tvDoc_KeyPress(KeyAscii As Integer)
  If KeyAscii = 13 Then
    cmdVisualisation_Click
    KeyAscii = 0
  End If
End Sub


'========================================================
' Commandes sur les documents

Private Sub cmdVisualisation_Click()
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If tvDoc.Nodes.Count = 0 Or tvDoc.SelectedItem Is Nothing Then
    MsgBox2i "GD011"      ' S�lectionnez un document avant de choisir cette commande
    Exit Sub
  End If
  
  ' Pas de message d'erreur, des clics rapides sur [+] et [-] g�n�rent un �v�nement DblClick�
  If Left(tvDoc.SelectedItem.Key, 1) <> "D" Then Exit Sub
  
  sbStatus.Panels("Info").Text = "Visualisation document�"
  colDocuments(tvDoc.SelectedItem.Key).ShellVisualisation
  sbStatus.Panels("Info").Text = ""
End Sub

Private Sub cmdSaisie_Click()
  DoSaisie False
End Sub

Private Sub cmdSaisieRestreinte_Click()
  DoSaisie True
End Sub

Private Sub DoSaisie(ByVal bRestreint As Boolean)
  If bD�connect�() Then Exit Sub
  If bBlocageEnCours Then Beep: Exit Sub
  
  If tvDoc.Nodes.Count = 0 Or tvDoc.SelectedItem Is Nothing Then
    MsgBox2i "GD011"      ' S�lectionnez un document avant de choisir cette commande
    Exit Sub
  End If
  
  Select Case Left(tvDoc.SelectedItem.Key, 1)
    Case "R":   ' Tous les documents s�lectionn�s
    Case "I":   ' Intervention
      MsgBox2i "GD011"    ' S�lectionnez un document avant de choisir cette commande
      Exit Sub
  End Select
  
  Dim d As Document
  Set d = colDocuments(tvDoc.SelectedItem.Key)
  
  ' Le mode restreint n'existe pas pour les �tats 0 � 3
  If d.doc_etat < "4" Then bRestreint = False
  
  If Not bRestreint Then
    If d.doc_etat >= "4" Then
      MsgBox2i "GD015"      ' Document valid�, vous ne pouvez pas y acc�der en saisie (�tat>=4).
      Exit Sub
    End If
  Else
    If d.doc_etat >= "6" Then
      MsgBox2i "GD015b"     ' Document edit� en version client, vous ne pouvez pas y acc�der en saisie restreinte (�tat>=6).
      Exit Sub
    End If
  End If
  
  Dim sNTitre As String, sNRef As String
  sNTitre = d.doc_titre
  sNRef = d.doc_refdoc

  If d.doc_etat = "0" Then  ' Document vierge
    ' Fonction de cr�ation initiale
    Dim bOk As Boolean
    bOk = d.bShellCr�ation(sNRef)
    If Not bOk Then Exit Sub  ' Refus d'initialisation !
  End If

  Dim bModif As Boolean, iOperContr�le As Integer
  bModif = d.bShellSaisie(sNTitre, iOperContr�le, sNRef, bRestreint)

  If bModif Then
    If iOperContr�le Then
      ' Simulation du current year to second
      MajValidLabo d, iNumOp�rateur, Now
      MajEtat d, 5, 1                   ' Prise de contr�le: maj etat 5
    End If
    If IsNull(d.doc_ts(1)) Then
      MajEtat d, 1, 1                   ' Etat 1: 1�re saisie
    End If
    MajEtat d, 2, IIf(bRestreint, 1, 0) ' En mode restreint on conserve l'�tat
    If sNTitre <> d.doc_titre Or sNRef <> d.doc_refdoc Then
      MajRefTitre d, sNRef, sNTitre
    End If
  
    ' Mise � jour de l'affichage
    MAJAffichage d
    AfficheD�tailDocument d.Key
  End If
End Sub


'========================================================
' Internationalisation

Public Sub Internationalisation()
  sNomApp = sGetIntlLib("sNomApp", "Microb'Soft - Gestionnaire de documents")
  If sNomOp�rateur <> "" Then Caption = sNomApp & " [" & sNomOp�rateur & "]"
  
  mnuSyst�me.Caption = sGetIntlLib("mnuSyst�me", "&Syst�me")
  
  SetLib lblValidationAssistant, "Caption", "GDlblValAss"
  SetLib lblValidationLabo, "Caption", "GDlblValLabo"
  
  
End Sub

