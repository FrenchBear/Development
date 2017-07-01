VERSION 4.00
Begin VB.Form formChoixDocument 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Document associé"
   ClientHeight    =   2220
   ClientLeft      =   1200
   ClientTop       =   1935
   ClientWidth     =   6855
   Height          =   2625
   HelpContextID   =   82
   Left            =   1140
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2220
   ScaleWidth      =   6855
   ShowInTaskbar   =   0   'False
   Top             =   1590
   Width           =   6975
   Begin VB.CommandButton btnAide 
      Caption         =   "&Aide"
      Height          =   405
      Left            =   5280
      TabIndex        =   8
      Top             =   1680
      Width           =   1455
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   405
      Left            =   5280
      TabIndex        =   7
      Top             =   1080
      Width           =   1455
   End
   Begin VB.CommandButton btnAjouter 
      Caption         =   "Ajo&uter"
      Enabled         =   0   'False
      Height          =   405
      Left            =   5280
      TabIndex        =   6
      Top             =   600
      Width           =   1455
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   420
      Left            =   5280
      TabIndex        =   5
      Top             =   105
      Width           =   1455
   End
   Begin VB.TextBox txtTitre 
      Height          =   285
      Left            =   1065
      TabIndex        =   4
      Top             =   540
      Width           =   3630
   End
   Begin VB.TextBox txtFichier 
      Height          =   285
      Left            =   1065
      TabIndex        =   1
      Top             =   105
      Width           =   3630
   End
   Begin MSComDlg.CommonDialog CmDialog1 
      Left            =   960
      Top             =   1320
      _version        =   65536
      _extentx        =   847
      _extenty        =   847
      _stockprops     =   0
      cancelerror     =   -1  'True
   End
   Begin Threed.SSCommand btnChoix 
      Height          =   390
      Left            =   4695
      TabIndex        =   2
      Top             =   105
      Width           =   375
      _version        =   65536
      _extentx        =   661
      _extenty        =   688
      _stockprops     =   78
      picture         =   "CHOIXDOC.frx":0000
   End
   Begin VB.Label Label2 
      Caption         =   "&Titre:"
      Height          =   255
      Left            =   120
      TabIndex        =   3
      Top             =   540
      Width           =   870
   End
   Begin VB.Label Label1 
      Caption         =   "&Document:"
      Height          =   270
      Left            =   120
      TabIndex        =   0
      Top             =   135
      Width           =   930
   End
End
Attribute VB_Name = "formChoixDocument"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit


Private Sub btnAide_Click()
    AideProgramme HelpContextID
End Sub

Private Sub btnAide_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour obtenir de l'aide ou appuyez sur F1"
End Sub


Private Sub btnAjouter_Click()

Dim NouveauDocument As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue
        
    'travail sur le spread concerné (soit celui de la documentation du projet, soit celui de la fenêtre FormListeDocuments
    With SpreadDocuments
        'ajout le document à la dernière ligne (vierge)
        .Row = .MaxRows
        .Col = 1
        .Text = txtFichier.Text
        .Col = 2
        .Text = GetFichierSansChemin(txtFichier.Text)
        .Col = 3
        .Text = txtTitre.Text
        .Col = 4
        .TypeButtonPicture = FormMain.ActiveForm.picFleche.Picture
        .TypeButtonPictureDown = FormMain.ActiveForm.picFleche.Picture
        'toujours une ligne vierge dans le tableau
        .Col = 1
        .Row = .MaxRows
        If .Text <> "" Then
            .MaxRows = .MaxRows + 1
        End If
        'se positionne sur ligne vierge
        .Row = .MaxRows
        .Col = .ActiveCol
        .Action = SS_ACTION_ACTIVE_CELL
    End With
    txtFichier.Text = ""
    txtTitre.Text = ""
    'marque que le bouton Ajouter a été utilisé
    btnAjouter.Tag = "1"
    btnAnnuler.Caption = "&Fermer"
    txtFichier.SetFocus

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub


Private Sub btnAjouter_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour ajouter le document à la liste et en choisir un autre"
End Sub


'sortie sans valider
Private Sub btnAnnuler_Click()
    Tag = ""
    Hide
End Sub


Private Sub btnAnnuler_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Fermeture de la fenêtre sans ajout ou modification du document"
End Sub


'choix du fichier sur le disque
Private Sub btnChoix_Click()

    CMDialog1.InitDir = CurDir$
    CMDialog1.DialogTitle = "Recherche d'un document"
    CMDialog1.Filter = "Tous (*.*)|*.*|Word (*.DOC)|*.doc|Texte (*.TXT)|*.txt|Write (*.WRI)|*.wri"
    CMDialog1.Flags = OFN_HIDEREADONLY
    CMDialog1.FileName = "*.*"
    CMDialog1.CancelError = False
    'affiche la boite de sélection de fichiers
    On Error Resume Next
    Err = 0
    CMDialog1.CancelError = True
    CMDialog1.ShowOpen
    If Err <> CDERR_CANCEL Then
            'l'opérateur n'a pas annulé
        txtFichier.Text = UCase$(CMDialog1.FileName)
        'pour saisie du titre
        txtTitre.SetFocus
    Else
        'pour saisie du fichier
        txtFichier.SetFocus
    End If
End Sub

'sortie avec validation
Private Sub btnOk_Click()
    Tag = "1"
    Hide
End Sub

Private Sub btnOk_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Validation des informations saisies et fermeture de la fenêtre"
End Sub


'feuille de saisie du fichier et du titre d'un document associé
Private Sub Form_Load()

    'en cas de sortie par double-click sur case système
    Tag = ""
    CenterInScreen Me
    'bouton ajouter pas encore utilisé
    btnAjouter.Tag = ""
    HourGlass "hide"
    
End Sub

Private Sub txtFichier_Change()
        
    RefreshBoutons

End Sub


Private Sub txtFichier_GotFocus()
    SelectionneZoneTexte ActiveControl, 16 * 4 + 4
End Sub


Private Sub txtFichier_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If txtFichier.Text = "" Then
        LigneEtat "Entrez ici le nom d'un fichier document ou cliquez sur le bouton à droite"
    Else
        LigneEtat "Nom du fichier document"
    End If
End Sub

Private Sub txtTitre_Change()
    
    RefreshBoutons
    
End Sub

Private Sub txtTitre_GotFocus()
    SelectionneZoneTexte ActiveControl, 16 * 5 + 4
End Sub



'maj des boutons en fonction du contexte
Private Sub RefreshBoutons()

    btnOk.Enabled = Trim$(txtFichier.Text) <> "" And Trim$(txtTitre.Text) <> ""
    btnAjouter.Enabled = btnOk.Enabled

End Sub

Private Sub txtTitre_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If txtTitre.Text = "" Then
        LigneEtat "Entrez ici un titre pour le document (saisie obligatoire)"
    Else
        LigneEtat "Titre du document"
    End If
End Sub


