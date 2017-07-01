VERSION 4.00
Begin VB.Form formListeDocuments 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Documents associés"
   ClientHeight    =   4095
   ClientLeft      =   555
   ClientTop       =   1890
   ClientWidth     =   7230
   Height          =   4500
   HelpContextID   =   81
   Left            =   495
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4095
   ScaleWidth      =   7230
   ShowInTaskbar   =   0   'False
   Top             =   1545
   Width           =   7350
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   435
      Left            =   1740
      TabIndex        =   5
      Top             =   3540
      Width           =   1455
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   435
      Left            =   3360
      TabIndex        =   6
      Top             =   3540
      Width           =   1455
   End
   Begin VB.CommandButton btnOk 
      Caption         =   "Ok"
      Default         =   -1  'True
      Height          =   435
      Left            =   120
      TabIndex        =   4
      Top             =   3540
      Width           =   1455
   End
   Begin FPSpread.vaSpread SpreadDocuments 
      Height          =   2655
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6990
      _version        =   131077
      _extentx        =   12330
      _extenty        =   4683
      _stockprops     =   64
      colheaderdisplay=   0
      colsfrozen      =   1
      displayrowheaders=   0   'False
      BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
         name            =   "MS Sans Serif"
         charset         =   1
         weight          =   400
         size            =   8.25
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      maxcols         =   4
      maxrows         =   1
      processtab      =   -1  'True
      scrollbars      =   2
      spreaddesigner  =   "LSTDOCS.frx":0000
      unittype        =   2
      userresize      =   1
      visiblecols     =   1
      visiblerows     =   1
   End
   Begin VB.CommandButton btnAjouterDocument 
      Height          =   390
      Left            =   120
      TabIndex        =   1
      Top             =   2820
      Width           =   1695
      caption         =   "&Ajouter/Modifier"
   End
   Begin VB.CommandButton btnInsérerDocument 
      Height          =   390
      Left            =   1860
      TabIndex        =   2
      Top             =   2820
      Width           =   1335
      caption         =   "In&sérer"
   End
   Begin VB.CommandButton btnSupprimerDocument 
      Height          =   390
      Left            =   3240
      TabIndex        =   3
      Top             =   2820
      Width           =   1335
      caption         =   "S&upprimer"
   End
End
Attribute VB_Name = "formListeDocuments"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Dim bAjoutsEffectués As Integer

Private Sub btnAide_Click()
    AideProgramme HelpContextID
End Sub


Private Sub btnAide_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    LigneEtat "Cliquez ici pour obtenir de l'aide ou appuyez sur F1"
End Sub


Private Sub btnAjouterDocument_Click()

Dim chTitre As String
Dim chFichier As String
Dim NouveauDocument As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    HourGlass "show"
    'appui sur le bouton d'ajout/modification de document
    With SpreadDocuments
        .Row = .ActiveRow
        .Col = 1
        chFichier = .Text
        'nouveau document si la ligne courante est vide
        NouveauDocument = (chFichier = "")
        .Col = 3
        chTitre = .Text
        If ChoixDocument("Document associé", SpreadDocuments, chFichier, chTitre, bAjoutsEffectués) Then
            'sortie par OK
            'affiche le document dans le spread
            .Row = .ActiveRow
            .Col = 1
            .Text = chFichier
            .Col = 2
            .Text = GetFichierSansChemin(chFichier)
            .Col = 3
            .Text = chTitre
            .Col = 4
            .TypeButtonPicture = FormMain.ActiveForm.picFleche.Picture
            .TypeButtonPictureDown = FormMain.ActiveForm.picFleche.Picture
            .Text = chFichier
            If NouveauDocument Then
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
            End If
        End If

    End With
    HourGlass "hide"

    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub

Private Sub btnAnnuler_Click()
    Tag = ""
    Hide
End Sub


Private Sub btnInsérerDocument_Click()

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    SpreadDocuments.MaxRows = SpreadDocuments.MaxRows + 1
    SpreadInsereLigneBlanche SpreadDocuments, FormMain.ActiveForm.picFleche
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub





Private Sub btnOk_Click()
    Tag = "1"
    Hide
End Sub

Private Sub btnSupprimerDocument_Click()

Dim cr As Integer

    'gestion d'erreur inattendue
    On Error GoTo err_inattendue

    With SpreadDocuments
        If .MaxRows > 1 Then
            .Row = .ActiveRow
            .Col = 1
            cr = IIf(.Row <> .MaxRows, IDYES, IDNO)
            If .Text <> "" Then
                cr = MsgBox(InsereChaine(GetChaineCrLf("M0"), .Text), MB_ICONQUESTION Or MB_YESNO, NomApplication)
            End If
            If cr = IDYES Then
                SpreadOteLigne SpreadDocuments, FormMain.ActiveForm.picFleche
                .MaxRows = .MaxRows - 1
            End If
        End If
    End With
    
    Exit Sub

err_inattendue:
    GestionErreurInattendue

End Sub



Private Sub Form_Load()

    Tag = ""
    CenterInScreen Me
    'SpreadDocuments.ColWidth(2) = (SpreadDocuments.Width - SpreadDocuments.ColWidth(4) - SpreadDocuments.ColWidth(1)) / 2
    'SpreadDocuments.ColWidth(3) = SpreadDocuments.ColWidth(2)
    SpreadDocuments.Col = 1
    SpreadDocuments.ColHidden = True
    bAjoutsEffectués = False
    HourGlass "hide"
    
End Sub


Private Sub SpreadDocuments_ButtonClicked(ByVal Col As Long, ByVal Row As Long, ByVal ButtonDown As Long)

    If Col = 4 Then
        With SpreadDocuments
            .Row = Row
            .Col = 1
            OuvrirDocument .Text, FormMain.ActiveForm.Projet.RépertoireDocuments
        End With
    End If

End Sub


Private Sub SpreadDocuments_Click(ByVal Col As Long, ByVal Row As Long)
    If Col = 4 Then
        With SpreadDocuments
            .Row = Row
            .Col = 1
            OuvrirDocument .Text, FormMain.ActiveForm.Projet.RépertoireDocuments
        End With
    End If

End Sub

Private Sub SpreadDocuments_DblClick(ByVal Col As Long, ByVal Row As Long)
    If Col = 4 Then
        With SpreadDocuments
            .Row = Row
            .Col = 1
            OuvrirDocument .Text, FormMain.ActiveForm.Projet.RépertoireDocuments
        End With
    Else
        btnAjouterDocument_Click
    End If
End Sub


