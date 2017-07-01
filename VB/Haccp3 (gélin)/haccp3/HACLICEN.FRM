VERSION 4.00
Begin VB.Form formSaisieLicence 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "- Validation de la licence"
   ClientHeight    =   3030
   ClientLeft      =   1350
   ClientTop       =   2370
   ClientWidth     =   5445
   Height          =   3435
   HelpContextID   =   85
   Left            =   1290
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3030
   ScaleWidth      =   5445
   ShowInTaskbar   =   0   'False
   Top             =   2025
   Width           =   5565
   Begin VB.TextBox txtClé 
      Height          =   285
      Left            =   180
      TabIndex        =   5
      Top             =   1980
      Width           =   3555
   End
   Begin VB.TextBox txtNumSérie 
      Height          =   285
      Left            =   180
      TabIndex        =   3
      Top             =   1380
      Width           =   3555
   End
   Begin VB.TextBox txtUtilisateur 
      Height          =   285
      Left            =   180
      TabIndex        =   1
      Top             =   780
      Width           =   3555
   End
   Begin VB.CommandButton btnAide 
      Cancel          =   -1  'True
      Caption         =   "Aide"
      Height          =   375
      Left            =   3900
      TabIndex        =   8
      Top             =   960
      Width           =   1395
   End
   Begin VB.CommandButton btnAnnuler 
      Caption         =   "Annuler"
      Height          =   375
      Left            =   3900
      TabIndex        =   7
      Top             =   480
      Width           =   1395
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   375
      Left            =   3900
      TabIndex        =   6
      Top             =   60
      Width           =   1395
   End
   Begin VB.Label lblNumInstallation 
      Caption         =   "N° d'installation :"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   180
      TabIndex        =   10
      Top             =   120
      Width           =   3375
   End
   Begin VB.Label Label4 
      Caption         =   $"HACLICEN.frx":0000
      ForeColor       =   &H00FF0000&
      Height          =   495
      Left            =   180
      TabIndex        =   9
      Top             =   2400
      Width           =   5115
   End
   Begin VB.Label Label3 
      Caption         =   "Votre &clé :"
      Height          =   255
      Left            =   180
      TabIndex        =   4
      Top             =   1740
      Width           =   2535
   End
   Begin VB.Label Label2 
      Caption         =   "Votre n° de &série :"
      Height          =   255
      Left            =   180
      TabIndex        =   2
      Top             =   1140
      Width           =   2535
   End
   Begin VB.Label Label1 
      Caption         =   "Votre nom d'&utilisateur :"
      Height          =   255
      Left            =   180
      TabIndex        =   0
      Top             =   540
      Width           =   2535
   End
End
Attribute VB_Name = "formSaisieLicence"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit


Private Sub RefreshBoutons()

    btnOk.Enabled = Trim$(txtUtilisateur.Text) <> "" And Trim$(txtNumSérie.Text) <> "" And Trim$(txtClé.Text) <> ""
    
End Sub

Private Sub btnAide_Click()
    AideProgramme HelpContextID
End Sub


Private Sub btnAide_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour obtenir de l'aide ou appuyez sur F1"
End Sub


Private Sub btnAnnuler_Click()
    Unload Me
End Sub

Private Sub btnAnnuler_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour fermer la fenêtre sans activer le programme " & NomApplication
End Sub


Private Sub btnOk_Click()
    
    'vérifie la clé d'activation
    bLicenceOk = LicenceOk(txtNumSérie.Text, txtClé.Text)
    If bLicenceOk Then
        'ok
        'enregistre les éléments de la clé dans le .INI
        SetConfig SECTION_CONFIG_LICENCE, KEY_CONFIG_UTILISATEUR, txtUtilisateur.Text
        SetConfig SECTION_CONFIG_LICENCE, KEY_CONFIG_NUM_SERIE, txtNumSérie.Text
        SetConfig SECTION_CONFIG_LICENCE, KEY_CONFIG_CLE, LicenceCoder(txtClé.Text)
        MsgBox GetChaineCrLf("M13"), MB_ICONINFORMATION, NomApplication
        Unload Me
    Else
        'pas ok
        MsgBox GetChaineCrLf("M12"), MB_ICONEXCLAMATION, NomApplication
    End If
    
End Sub


Private Sub btnOk_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour procéder à l'activation du programme " & NomApplication
End Sub


Private Sub Form_Load()

    CenterInScreen Me
    lblNumInstallation.Caption = formAccueil.lblNumInstallation.Caption
    Caption = NomApplication & Caption
    
End Sub



Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub

Private Sub txtClé_Change()
    RefreshBoutons
End Sub

Private Sub txtClé_GotFocus()
    SelectionneZoneTexte txtClé, 4 * 16 + 3
End Sub

Private Sub txtClé_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If txtClé.Text = "" Then
        LigneEtat "Entrez ici la clé d'activation qui vous a été communiqué"
    Else
        LigneEtat "Clé d'activation du programme " & NomApplication
    End If
End Sub

Private Sub txtNumSérie_Change()
    RefreshBoutons
End Sub

Private Sub txtNumSérie_GotFocus()
    SelectionneZoneTexte txtNumSérie, 5 * 16 + 2
End Sub



Private Sub txtNumSérie_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If txtNumSérie.Text = "" Then
        LigneEtat "Entrez ici le numéro de série qui vous a été communiqué"
    Else
        LigneEtat "Numéro de série du programme " & NomApplication
    End If
End Sub

Private Sub txtUtilisateur_Change()
    RefreshBoutons
End Sub


Private Sub txtUtilisateur_GotFocus()
    SelectionneZoneTexte txtUtilisateur, 16 * 5 + 5
End Sub


Private Sub txtUtilisateur_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If txtUtilisateur.Text = "" Then
        LigneEtat "Entrez ici votre nom d'utilisateur"
    Else
        LigneEtat "Nom de l'utilisateur"
    End If
End Sub


