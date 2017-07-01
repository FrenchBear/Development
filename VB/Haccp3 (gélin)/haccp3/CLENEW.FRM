VERSION 4.00
Begin VB.Form formClef 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   2640
   ClientLeft      =   1710
   ClientTop       =   2625
   ClientWidth     =   5445
   Height          =   3045
   HelpContextID   =   6
   Left            =   1650
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2640
   ScaleWidth      =   5445
   ShowInTaskbar   =   0   'False
   Top             =   2280
   Width           =   5565
   Begin VB.CommandButton btnImprimer 
      Caption         =   "Imprimer"
      Height          =   375
      Left            =   3900
      TabIndex        =   11
      Top             =   1980
      Width           =   1395
   End
   Begin VB.TextBox txtUtilisateur 
      Height          =   285
      Left            =   180
      MaxLength       =   50
      TabIndex        =   5
      Top             =   1560
      Width           =   3555
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   375
      Left            =   3900
      TabIndex        =   9
      Top             =   960
      Width           =   1395
   End
   Begin VB.CommandButton btnCalculClef 
      Caption         =   "Calcul de clé"
      Height          =   375
      Left            =   180
      TabIndex        =   6
      Top             =   1980
      Width           =   1395
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   375
      Left            =   3900
      TabIndex        =   7
      Top             =   60
      Width           =   1395
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   3900
      TabIndex        =   8
      Top             =   480
      Width           =   1395
   End
   Begin VB.TextBox txtNumSérie 
      Height          =   285
      Left            =   180
      MaxLength       =   8
      TabIndex        =   3
      Top             =   960
      Width           =   3555
   End
   Begin VB.TextBox txtNumInstallation 
      Height          =   285
      Left            =   180
      MaxLength       =   8
      TabIndex        =   1
      Top             =   360
      Width           =   3555
   End
   Begin VB.Label Label1 
      Caption         =   "Utilisateur"
      Height          =   255
      Left            =   180
      TabIndex        =   4
      Top             =   1320
      Width           =   2535
   End
   Begin VB.Label lblClef 
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1680
      TabIndex        =   10
      Top             =   2040
      Width           =   2055
   End
   Begin VB.Label Label2 
      Caption         =   "N° de série"
      Height          =   255
      Left            =   180
      TabIndex        =   2
      Top             =   720
      Width           =   2535
   End
   Begin VB.Label Label3 
      Caption         =   "N° d'installation"
      Height          =   255
      Left            =   180
      TabIndex        =   0
      Top             =   120
      Width           =   2535
   End
End
Attribute VB_Name = "formClef"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit


'met à jour l'état des boutons
Public Sub RefreshBoutons()

    btnCalculClef.Enabled = Trim$(txtUtilisateur.Text) <> "" And Trim$(txtNumSérie.Text) <> "" And Trim$(txtNumInstallation.Text) <> ""
    btnOk.Enabled = Trim$(lblClef.Caption) <> ""
    
End Sub

'aide sur la fenêtre
Private Sub btnAide_Click()
    AideProgramme HelpContextID
End Sub

'sortie sans valider
Private Sub btnAnnuler_Click()
    Hide
End Sub

'calcul de la clé
Private Sub btnCalculClef_Click()
    lblClef.Caption = LicenceGénérerClé(Trim$(txtNumInstallation.Text), Trim$(txtNumSérie.Text))
    RefreshBoutons
End Sub

'impression de la clé
Private Sub btnImprimer_Click()

Dim r As Integer
Dim ch As String

    On Error GoTo err_btnImprimer_Click
    HourGlass "show"
    'espace avant et texte d'introduction
    For r = 1 To 10
        Printer.Print
    Next
    Printer.FontBold = True
    Printer.FontName = "Arial"
    Printer.FontSize = 16
    Printer.Print , "Clé d'activation du programme HACCP 3"
    Printer.Print
    Printer.FontBold = False
    Printer.FontSize = 12
    Printer.Print , "Voici votre clé d'activation pour passer le logiciel HACCP en mode EXPLOITATION."
    Printer.Print , "Pour l'utiliser, lancez le programme HACCP et dans la fenêtre acceuil,"
    Printer.Print , "cliquez sur le bouton 'Passer en mode EXPLOITATION' puis suivez les instructions."
    Printer.Print
    'informations pour l'utilisateur
    Printer.FontBold = True
    Printer.Print , "N° d'installation: ", txtNumInstallation.Text
    Printer.Print
    Printer.Print , "N° de série:       ", txtNumSérie.Text
    Printer.Print
    Printer.Print , "Utilisateur:       ", txtUtilisateur.Text
    Printer.Print
    Printer.Print , "Clé d'activation:  ", lblClef.Caption
    
    'sortie de la feuille
    Printer.EndDoc
    
fin_btnImprimer_Click:
    HourGlass "hide"
    Exit Sub
    
err_btnImprimer_Click:
    ErreurUserBox "Problème d'impression." & CrLf2 & "L'impression ne peut pas s'effectuer." & CrLf2 & "Contactez votre administrateur système.", MB_ICONSTOP
    Resume fin_btnImprimer_Click
    
End Sub

'sortie avec validation
Private Sub btnOk_Click()
    Tag = "1"
    Hide
End Sub

'initialisations de chargement
Private Sub Form_Load()
    CenterInScreen Me
End Sub






'la clé doit être recalculée quand le numéro d'installation change
Private Sub txtNumInstallation_Change()
    lblClef.Caption = ""
    RefreshBoutons
End Sub

Private Sub txtNumInstallation_GotFocus()
    SelectionneZoneTexte ActiveControl
End Sub


'la clé doit être recalculée quand le numéro de série change
Private Sub txtNumSérie_Change()
    lblClef.Caption = ""
    RefreshBoutons
End Sub

Private Sub txtNumSérie_GotFocus()
    SelectionneZoneTexte txtNumSérie
End Sub



Private Sub txtUtilisateur_Change()
    RefreshBoutons
End Sub


Private Sub txtUtilisateur_GotFocus()
    SelectionneZoneTexte txtUtilisateur
End Sub


