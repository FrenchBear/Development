VERSION 4.00
Begin VB.Form FormConfiguration 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "- Configuration"
   ClientHeight    =   2385
   ClientLeft      =   1275
   ClientTop       =   1680
   ClientWidth     =   6390
   Height          =   2790
   HelpContextID   =   5
   Left            =   1215
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2385
   ScaleWidth      =   6390
   ShowInTaskbar   =   0   'False
   Top             =   1335
   Width           =   6510
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   375
      Left            =   4680
      TabIndex        =   2
      Top             =   1080
      Width           =   1395
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   4680
      TabIndex        =   1
      Top             =   600
      Width           =   1395
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   375
      Left            =   4680
      TabIndex        =   0
      Top             =   180
      Width           =   1395
   End
   Begin VB.Frame Frame1 
      Caption         =   "Affichage"
      Height          =   1890
      Left            =   180
      TabIndex        =   3
      Top             =   120
      Width           =   4215
      Begin VB.CheckBox chkBulles 
         Caption         =   "avec bulles d'aide"
         Height          =   255
         Left            =   480
         TabIndex        =   8
         Top             =   1500
         Width           =   2835
      End
      Begin VB.CheckBox chkAcceuil 
         Caption         =   "&Afficher l'écran d'accueil au démarrage"
         Height          =   255
         Left            =   180
         TabIndex        =   7
         Top             =   300
         Width           =   3855
      End
      Begin VB.CheckBox chkOnglets 
         Caption         =   "&Onglets"
         Height          =   255
         Left            =   180
         TabIndex        =   6
         Top             =   600
         Width           =   3855
      End
      Begin VB.CheckBox chkBarreIcones 
         Caption         =   "Barre de &boutons"
         Height          =   255
         Left            =   180
         TabIndex        =   5
         Top             =   1200
         Width           =   3855
      End
      Begin VB.CheckBox chkBarreEtat 
         Caption         =   "Barre d'&état"
         Height          =   255
         Left            =   180
         TabIndex        =   4
         Top             =   900
         Width           =   3855
      End
   End
End
Attribute VB_Name = "FormConfiguration"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit


Private Sub btnAide_Click()
    AideProgramme HelpContextID
End Sub


Private Sub btnAide_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour obtenir de l'aide ou appuyez sur F1"
End Sub


'sortie sans validation
Private Sub btnAnnuler_Click()
    Unload Me
End Sub

Private Sub btnAnnuler_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour fermer la fenêtre sans valider les informations modifiées"
End Sub


'sortie par OK
Private Sub btnOk_Click()

Dim i As Integer
Dim TabHeight As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    'affichage acceuil
    bAfficherAcceuil = chkAcceuil.Value
    SetConfig SECTION_CONFIG_PARAMETRES, KEY_CONFIG_ACCUEIL, bAfficherAcceuil
    
    If bAfficherOnglets <> chkOnglets.Value Then
        'affichage des onglets changé
        bAfficherOnglets = chkOnglets.Value
        SetConfig SECTION_CONFIG_PARAMETRES, KEY_CONFIG_ONGLETS, bAfficherOnglets
        'modifie la hauteur des onglets des fenêtres MdiChild sauf la fenêtre accueil
        TabHeight = iif2(bAfficherOnglets, 300, 1)
        For i = 1 To Forms.Count - 1
            If Forms(i).MDIChild And Not Forms(i) Is formAccueil Then
                Forms(i).SSTab1.TabHeight = TabHeight
                Forms(i).SSTabResize
            End If
        Next
    End If
    'affichage de la barre d'icones et des bulles d'aide
    bAfficherBarreIcones = chkBarreIcones.Value
    FormMain.picToolbar.Visible = bAfficherBarreIcones
    SetConfig SECTION_CONFIG_PARAMETRES, KEY_CONFIG_BARRE_ICONES, bAfficherBarreIcones
    bAfficherBarreEtat = chkBarreEtat.Value
    bAfficherBulles = chkBulles.Value
    FormMain.picBarreEtat.Visible = bAfficherBarreEtat
    SetConfig SECTION_CONFIG_PARAMETRES, KEY_CONFIG_BARRE_ETAT, bAfficherBarreEtat
    SetConfig SECTION_CONFIG_PARAMETRES, KEY_CONFIG_BULLES, bAfficherBulles
    
    
    MetAJourMenus
    Unload Me
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue
    
End Sub


Private Sub btnOk_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour valider les informations saisies"
End Sub

Private Sub chkBarreIcones_Click()
    chkBulles.Enabled = chkBarreIcones.Value <> False
End Sub

'fenêtre de configuration du programme
Private Sub Form_Load()

    CenterInScreen Me
    Caption = NomApplication & Caption
    
    'état des contrôles à partir des flags globaux
    chkAcceuil.Value = Abs(bAfficherAcceuil)
    chkOnglets.Value = Abs(bAfficherOnglets)
    chkBarreIcones.Value = Abs(bAfficherBarreIcones)
    chkBarreEtat.Value = Abs(bAfficherBarreEtat)
    chkBulles.Value = Abs(bAfficherBulles)

End Sub


Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


