VERSION 4.00
Begin VB.Form FormQuestCriticité 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Arbre de décision HACCP"
   ClientHeight    =   6045
   ClientLeft      =   2355
   ClientTop       =   465
   ClientWidth     =   6120
   Height          =   6450
   HelpContextID   =   30
   Left            =   2295
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6045
   ScaleWidth      =   6120
   ShowInTaskbar   =   0   'False
   Top             =   120
   Width           =   6240
   Begin VB.Frame Frame1 
      Height          =   75
      Left            =   45
      TabIndex        =   21
      Top             =   1440
      Width           =   6015
   End
   Begin VB.CommandButton btnRetourRésultat 
      Caption         =   "ç"
      BeginProperty Font 
         name            =   "Wingdings"
         charset         =   1
         weight          =   400
         size            =   12
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   60
      TabIndex        =   20
      Top             =   5160
      Visible         =   0   'False
      Width           =   795
   End
   Begin VB.CommandButton btnAideRésultat 
      Caption         =   "Pour en savoir plus..."
      Height          =   315
      Left            =   900
      TabIndex        =   19
      Top             =   5160
      Visible         =   0   'False
      Width           =   1875
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   375
      Left            =   2700
      TabIndex        =   17
      Top             =   5580
      Width           =   1275
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   1380
      TabIndex        =   16
      Top             =   5580
      Width           =   1275
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Height          =   375
      Left            =   60
      TabIndex        =   15
      Top             =   5580
      Width           =   1275
   End
   Begin VB.CommandButton btnRéponse 
      Caption         =   "Pour en savoir plus..."
      Height          =   315
      Index           =   3
      Left            =   3240
      TabIndex        =   7
      Top             =   1980
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.CommandButton btnRéponse 
      Caption         =   "ç"
      BeginProperty Font 
         name            =   "Wingdings"
         charset         =   1
         weight          =   400
         size            =   12
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   2
      Left            =   2400
      TabIndex        =   6
      Top             =   1980
      Visible         =   0   'False
      Width           =   795
   End
   Begin VB.CommandButton btnRéponse 
      Caption         =   "&Non"
      Height          =   315
      Index           =   1
      Left            =   1560
      TabIndex        =   5
      Top             =   1980
      Visible         =   0   'False
      Width           =   795
   End
   Begin VB.CommandButton btnRéponse 
      Caption         =   "&Oui"
      Height          =   315
      Index           =   0
      Left            =   720
      TabIndex        =   4
      Top             =   1980
      Visible         =   0   'False
      Width           =   795
   End
   Begin VB.Label lblRésultat 
      Appearance      =   0  'Flat
      Caption         =   "Label1"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   435
      Left            =   60
      TabIndex        =   18
      Top             =   4680
      Visible         =   0   'False
      Width           =   6000
   End
   Begin VB.Label lblQuestion 
      Caption         =   "Label1"
      Height          =   375
      Index           =   4
      Left            =   60
      TabIndex        =   14
      Top             =   4260
      Visible         =   0   'False
      Width           =   6000
   End
   Begin VB.Label lblRéponse 
      Caption         =   "Label1"
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
      Index           =   3
      Left            =   60
      TabIndex        =   13
      Top             =   4020
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label lblQuestion 
      Caption         =   "Label1"
      Height          =   375
      Index           =   3
      Left            =   60
      TabIndex        =   12
      Top             =   3600
      Visible         =   0   'False
      Width           =   6000
   End
   Begin VB.Label lblRéponse 
      Caption         =   "Label1"
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
      Index           =   2
      Left            =   60
      TabIndex        =   11
      Top             =   3360
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label lblQuestion 
      Caption         =   "Label1"
      Height          =   375
      Index           =   2
      Left            =   60
      TabIndex        =   10
      Top             =   2940
      Visible         =   0   'False
      Width           =   6000
   End
   Begin VB.Label lblRéponse 
      Caption         =   "Label1"
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
      Index           =   1
      Left            =   60
      TabIndex        =   9
      Top             =   2700
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label lblQuestion 
      Caption         =   "Label1"
      Height          =   375
      Index           =   1
      Left            =   60
      TabIndex        =   8
      Top             =   2280
      Visible         =   0   'False
      Width           =   6000
   End
   Begin VB.Label lblRéponse 
      Caption         =   "Label1"
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
      Index           =   0
      Left            =   60
      TabIndex        =   3
      Top             =   1980
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.Label lblQuestion 
      Caption         =   "Label1"
      Height          =   375
      Index           =   0
      Left            =   60
      TabIndex        =   2
      Top             =   1560
      Visible         =   0   'False
      Width           =   6000
   End
   Begin VB.Label lblTitre 
      Caption         =   "lblTitre"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   700
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      Height          =   1155
      Index           =   1
      Left            =   60
      TabIndex        =   1
      Top             =   300
      Width           =   6000
   End
   Begin VB.Label lblTitre 
      Caption         =   "lblTitre"
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
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   6000
   End
End
Attribute VB_Name = "FormQuestCriticité"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Dim QuestCriticité As QuestCriticite

Dim Niveau As Integer
'question en cours
Dim Question As Integer
'position en cours
Dim Position As Integer
'résultat du questionnaire
Dim Résultat As Integer

Public Function ExécuterQuestionnaireCriticité(ByVal Niveau1 As Integer, ByVal Titre1 As String, ByVal Titre0 As String, ByVal QuestCriticité1 As QuestCriticite, ByRef Criticité As String) As Integer

Dim i As Integer
    
    Set QuestCriticité = QuestCriticité1
    'niveau forcé à 1 pour l'instant malgré la capacités du gestionnaire de modules
    Niveau = Niveau1
        
    ExécuterQuestionnaireCriticité = False
    
    Load FormQuestCriticité
    FormQuestCriticité.lblTitre(0).Caption = Titre0
    FormQuestCriticité.lblTitre(1).Caption = Titre1
    
    If Criticité <> "" Or QuestCriticité.Résultat = 6 Then
        'modification de questionnaire
        For i = 0 To QuestCriticité.RéponsesCount - 1
            lblQuestion(i).Tag = QuestCriticité.Question(i)
            lblQuestion(i).Caption = Module.QuestionCriticité(Niveau, Val(lblQuestion(i).Tag))
            lblRéponse(i).Tag = QuestCriticité.Réponse(i)
            lblRéponse(i).Caption = "[" & lblRéponse(i).Tag & "]"
            lblQuestion(i).Visible = True
            lblRéponse(i).Visible = True
            Question = QuestCriticité.Question(i)
            Résultat = QuestCriticité.Résultat
            Position = i
        Next
        If QuestCriticité.RéponsesCount = 0 Then
            AfficherQuestion 0, 1
        Else
            AfficherRésultat QuestCriticité.Résultat
        End If
    Else
        'nouveau questionnaire: on commence par la première question
        'sur la première ligne
        AfficherQuestion 0, 1
    End If
    
    'affichage du questionnaire
    FormQuestCriticité.Show MODAL
    
    If FormQuestCriticité.Tag <> "" Then
        For i = 0 To Position
            QuestCriticité.Réponse(i) = lblRéponse(i).Tag
            QuestCriticité.Question(i) = lblQuestion(i).Tag
        Next
        QuestCriticité.RéponsesCount = Position + 1
        QuestCriticité.Résultat = Résultat
        Criticité = IIf(Résultat = 7, "OUI", IIf(Résultat = 8, "NON", ""))
        ExécuterQuestionnaireCriticité = True
    End If
    Unload FormQuestCriticité

End Function


Private Sub Label1_Click()

End Sub


Private Sub AfficherQuestion(ByVal Position1 As Integer, ByVal NumQuestion As Integer)

Dim i As Integer

    Position = Position1
    'question
    lblQuestion(Position).Caption = Module.QuestionCriticité(Niveau, NumQuestion)
    lblQuestion(Position).Visible = True
    'numéro de la question stocké dans le tag de la question
    lblQuestion(Position).Tag = NumQuestion
    'boutons de réponse
    For i = 0 To 3
        btnRéponse(i).Top = lblRéponse(Position).Top
        btnRéponse(i).Visible = True
        btnRéponse(i).Enabled = True
    Next
    If Position = 0 Then
        btnRéponse(2).Enabled = False
    End If
    Question = NumQuestion
    
    'rend invisible toute les questions suivantes et le résultat
    For i = Position + 1 To 3
        lblQuestion(i).Visible = False
        lblRéponse(i).Visible = False
    Next
    lblRésultat.Visible = False
    btnRetourRésultat.Visible = False
    btnAideRésultat.Visible = False
    btnOk.Enabled = False
    
End Sub
Private Sub AfficherRésultat(ByVal Résultat As Integer)
    
Dim i As Integer

    'message résultat
    lblRésultat.Caption = Module.QuestionCriticité(Niveau, Résultat)

    'résultat visible
    lblRésultat.Visible = True
    btnRetourRésultat.Visible = True
    btnAideRésultat.Visible = True
    
    'boutons de dernière question posée invisible
    For i = 0 To 3
        btnRéponse(i).Visible = False
    Next
    btnOk.Enabled = True
    
End Sub
Private Sub RefreshBoutons()

End Sub

Private Sub btnAide_Click()
    AideProgramme HelpContextID
End Sub

Private Sub btnAide_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour obtenir de l'aide ou appuyez sur F1"
End Sub


Private Sub btnAideRésultat_Click()
    AideHACCP 30 + Résultat
End Sub

Private Sub btnAideRésultat_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour avoir de l'aide sur le résultat"
End Sub


Private Sub btnAnnuler_Click()
    Tag = ""
    Hide
    
End Sub

Private Sub btnAnnuler_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour fermer le questionnaire sans valider les modifications"
End Sub


Private Sub btnOk_Click()
    Tag = "1"
    Hide
End Sub

Private Sub btnOk_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour valider le questionnaire"
End Sub


Private Sub btnRéponse_Click(Index As Integer)

Dim QuestionSuivante As Integer
Dim PositionSuivante As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    QuestionSuivante = -1
    Résultat = -1
    Select Case Index
        Case 0
            'oui
            lblRéponse(Position).Caption = "[" & btnRéponse(Index).Caption & "]"
            lblRéponse(Position).Tag = suppfirstchar(btnRéponse(Index).Caption, 1)
            lblRéponse(Position).Visible = True
            Select Case Question
                Case 1
                    QuestionSuivante = 3
                    PositionSuivante = Position + 1
                Case 2
                    Résultat = 6
                Case 3
                    Résultat = 7
                Case 4
                    QuestionSuivante = 5
                    PositionSuivante = Position + 1
                Case 5
                    Résultat = 8
            End Select
        Case 1
            'non
            lblRéponse(Position).Caption = "[" & btnRéponse(Index).Caption & "]"
            lblRéponse(Position).Tag = suppfirstchar(btnRéponse(Index).Caption, 1)
            lblRéponse(Position).Visible = True
            Select Case Question
                Case 1
                    QuestionSuivante = 2
                    PositionSuivante = Position + 1
                Case 2
                    Résultat = 8
                Case 3
                    QuestionSuivante = 4
                    PositionSuivante = Position + 1
                Case 4
                    Résultat = 8
                Case 5
                    Résultat = 7
            End Select
        Case 2
            'retour
            PositionSuivante = Position - 1
            QuestionSuivante = Val(lblQuestion(PositionSuivante).Tag)
        Case 3
            'aide
            If Résultat <> -1 Then
                AideHACCP 30 + Résultat
            Else
                AideHACCP 30 + Val(lblQuestion(Position).Tag)
            End If
    End Select
    If QuestionSuivante <> -1 Then
        AfficherQuestion PositionSuivante, QuestionSuivante
    End If
    If Résultat <> -1 Then
        AfficherRésultat Résultat
    End If
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub



Private Sub btnRéponse_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Select Case Index
        Case 0
            LigneEtat "Cliquez ici pour répondre Oui"
        Case 1
            LigneEtat "Cliquez ici pour répondre Non"
        Case 2
            LigneEtat "Cliquez ici pour revenir à la question précédente"
        Case 3
            LigneEtat "Cliquez ici pour avoir de l'aide sur la question posée"
    End Select
End Sub

Private Sub btnRetourRésultat_Click()

    AfficherQuestion Position, Question

End Sub

Private Sub btnRetourRésultat_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Retour à la dernière question de l'arbre de décision"
End Sub

Private Sub Form_Load()
    CenterInScreen Me
End Sub


Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat ""
End Sub


