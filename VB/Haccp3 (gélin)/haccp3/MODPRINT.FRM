VERSION 4.00
Begin VB.Form formImprimer 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Impression"
   ClientHeight    =   3390
   ClientLeft      =   1440
   ClientTop       =   1935
   ClientWidth     =   5835
   Height          =   3795
   HelpContextID   =   6
   Left            =   1380
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3390
   ScaleWidth      =   5835
   ShowInTaskbar   =   0   'False
   Top             =   1590
   Width           =   5955
   Begin VB.CheckBox chkAper�u 
      Caption         =   "chkAper�u"
      Height          =   195
      Left            =   4080
      TabIndex        =   9
      Top             =   2280
      Visible         =   0   'False
      Width           =   1515
   End
   Begin VB.CommandButton btnAide 
      Caption         =   "Aide"
      Height          =   375
      Left            =   4170
      TabIndex        =   8
      Top             =   1590
      Width           =   1500
   End
   Begin VB.CommandButton btnAnnuler 
      Cancel          =   -1  'True
      Caption         =   "&Fermer"
      Height          =   375
      Left            =   4170
      TabIndex        =   7
      Top             =   630
      Width           =   1500
   End
   Begin VB.CommandButton btnImprimer 
      Caption         =   "&Imprimer"
      Height          =   375
      Left            =   4170
      TabIndex        =   6
      Top             =   210
      Width           =   1500
   End
   Begin VB.CommandButton btnAper�u 
      Caption         =   "&Aper�u"
      Height          =   375
      Left            =   4170
      TabIndex        =   5
      Top             =   1050
      Visible         =   0   'False
      Width           =   1500
   End
   Begin VB.Frame Frame2 
      Caption         =   "Vous souhaitez"
      Height          =   3075
      Left            =   180
      TabIndex        =   1
      Top             =   120
      Width           =   3795
      Begin VB.ListBox lstAffichages 
         Height          =   1980
         Left            =   660
         MultiSelect     =   2  'Extended
         TabIndex        =   4
         Top             =   885
         Width           =   2595
      End
      Begin VB.OptionButton optS�lection 
         Caption         =   " Imprimer tous les affichages"
         Height          =   195
         Index           =   0
         Left            =   300
         TabIndex        =   3
         Top             =   300
         Value           =   -1  'True
         Width           =   3075
      End
      Begin VB.OptionButton optS�lection 
         Caption         =   " Imprimer un onglet particulier"
         Height          =   195
         Index           =   1
         Left            =   300
         TabIndex        =   2
         Top             =   600
         Width           =   3375
      End
   End
   Begin vsViewLib.vsPrinter vsPrinter 
      Height          =   2115
      Left            =   4125
      TabIndex        =   0
      Top             =   2025
      Visible         =   0   'False
      Width           =   1695
      _version        =   65536
      _extentx        =   2990
      _extenty        =   3731
      _stockprops     =   101
      BeginProperty font {FB8F0823-0164-101B-84ED-08002B2EC713} 
         name            =   "Arial"
         charset         =   1
         weight          =   400
         size            =   9.75
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      BeginProperty hdrfont {FB8F0823-0164-101B-84ED-08002B2EC713} 
         name            =   "Courier New"
         charset         =   1
         weight          =   700
         size            =   13.5
         underline       =   0   'False
         italic          =   0   'False
         strikethrough   =   0   'False
      EndProperty
      convinfo        =   1474733486
      abortwindow     =   -1  'True
      abortcaption    =   ""
      filename        =   ""
      tablesep        =   "|/"
      columns         =   1
      pageborder      =   3
      tableborder     =   7
      header          =   ""
      footer          =   ""
      spaceafter      =   0
      indentfirst     =   0
      indentleft      =   0
      indentright     =   0
      indenttab       =   0
      linespacing     =   100
      textalign       =   0
      textangle       =   0
      marginleft      =   720
      marginright     =   720
      margintop       =   720
      marginbottom    =   720
      preview         =   0   'False
      hdrcolor        =   0
      textcolor       =   0
      pencolor        =   0
      penwidth        =   0
      penstyle        =   0
      brushcolor      =   0
      brushstyle      =   0
      physicalpage    =   0   'False
      previewmode     =   0
      spacebefore     =   0
   End
End
Attribute VB_Name = "formImprimer"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Const VARIATION_INDENT_LEFT = 500

'module � imprimer
Private Module As Module
'compte le nombre de chaines s�lectionn�es dans une list-box multis�lection
'entr�e:
'   list-box
Private Function GetNbAffichages(ctl As Control)

Dim i As Integer
Dim n As Integer

    n = 0
    For i = 0 To ctl.ListCount - 1
        If ctl.Selected(i) Then
            n = n + 1
        End If
    Next
    GetNbAffichages = n

End Function



'imprime un onglet du module courant
Sub ImprimerOnglet(ByVal NumOnglet As Integer)

    Select Case NumOnglet
        Case 0
            'g�n�ral
            ImprimerG�n�ral True, lstAffichages
        Case 1
            'textes
            ImprimerTextes True, lstAffichages
        Case 2
            'suggestions
            ImprimerSuggestions True, lstAffichages
        Case 3
            'natures et sp�cificit�s
            ImprimerNaturesEtSp�cificit�s True, lstAffichages
        Case 4
            'pertinence dangers
            ImprimerQuestPertinences True, lstAffichages
        Case 5
            'criticit� dangers
            ImprimerCriticit�Dangers True, lstAffichages
    End Select
    
End Sub

'imprime l'onglet texte
'entr�e:
'   NewPrinter � vrai pour commencer une impression
'   titre � imprimer
Private Sub ImprimerTextes(ByVal NewPrinter As Integer, ByVal Titre As String)

Const DX = 4000
Dim i As Integer
Dim fmt As String
Dim tbl As String

    If NewPrinter Then
        vsPrinter.Preview = chkAper�u.Value
        vsPrinter.Action = 3    'd�but de transfert
        If vsPrinter.Error Then
            Exit Sub
        End If
        InitHautEtBasDePage
    End If
    
    vsPrinter.IndentLeft = 0
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.FontSize = 16
    vsPrinter.FontUnderline = True
    vsPrinter.Paragraph = Titre
    vsPrinter.FontUnderline = False
    vsPrinter.FontBold = False
    vsPrinter.FontSize = 10
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
        
    'entete de tableau
    vsPrinter.FontBold = True
    fmt = "4500|4500/"
    tbl = fmt & "Titre d'affichage|Commentaire/"
    vsPrinter.Table = tbl
    'corps du tableau des dangers
    vsPrinter.FontBold = False
    For i = 1 To Module.AffichagesCount
        If i = 1 Then
            tbl = fmt & Module.AffichageTitre(i) & "|" & Module.AffichageCommentaire(i) & "/"
        Else
            tbl = tbl & Module.AffichageTitre(i) & "|" & Module.AffichageCommentaire(i) & "/"
        End If
    Next
    vsPrinter.Table = tbl
    
    If NewPrinter Then
        vsPrinter.Action = 6    'fin de transfert
    End If
    
End Sub






'imprime les suggestions
'entr�e:
'   NewPrinter � vrai pour commencer une impression
'   titre � imprimer
Private Sub ImprimerSuggestions(ByVal NewPrinter As Integer, ByVal Titre As String)

Const DX = 4000
Dim i As Integer
Dim fmt As String
Dim tbl As String
Dim Niveau As Integer
Dim Affichage As Integer
Dim iEnteteImprim�e As Integer
Dim iAuMoinsUneSuggestion As Integer

    If NewPrinter Then
        vsPrinter.Preview = chkAper�u.Value
        vsPrinter.Action = 3    'd�but de transfert
        If vsPrinter.Error Then
            Exit Sub
        End If
        InitHautEtBasDePage
    End If
    
    vsPrinter.IndentLeft = 0
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.FontSize = 16
    vsPrinter.FontUnderline = True
    vsPrinter.Paragraph = Titre
    vsPrinter.FontUnderline = False
    vsPrinter.FontBold = False
    vsPrinter.FontSize = 10
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
        
    fmt = "3000|3000|4000/"
    For Affichage = 0 To 1
        vsPrinter.Paragraph = ""
        If Affichage = 0 Then
            vsPrinter.Paragraph = "Pour les dispositions en place"
        Else
            vsPrinter.Paragraph = "Pour l'arbre HACCP"
        End If
        iEnteteImprim�e = False
        iAuMoinsUneSuggestion = False
        For Niveau = 1 To Module.NiveauxCount
            'corps du tableau des suggestions
            tbl = ""
            For i = 1 To Module.SuggestionsCount(Niveau, Affichage)
                If i = 1 Then
                    tbl = fmt & Module.Niveau(Niveau) & "|" & Module.Suggestion(Niveau, i, Affichage) & "|" & Module.Suggestion(Niveau, i, Affichage) & "/"
                Else
                    tbl = tbl & "|" & Module.Suggestion(Niveau, i, Affichage) & "|" & Module.SuggestionDescription(Niveau, i, Affichage) & "/"
                End If
            Next
            If tbl <> "" Then
                If Not iEnteteImprim�e Then
                    Dim tbl1 As String
                    'entete de tableau
                    vsPrinter.FontBold = True
                    tbl1 = fmt & "Niveau|Suggestion|Description/"
                    vsPrinter.Table = tbl1
                    iEnteteImprim�e = True
                End If
                vsPrinter.FontBold = False
                vsPrinter.Table = tbl
                iAuMoinsUneSuggestion = True
            End If
        Next
        If Not iAuMoinsUneSuggestion Then
            vsPrinter.Paragraph = "* aucune suggestion *"
        End If
    Next
        
    If NewPrinter Then
        vsPrinter.Action = 6    'fin de transfert
    End If
    
End Sub
'n'imprime que le questionnaire de criticit� pour le niveau de donn�e 0
'entr�e:
'   NewPrinter � vrai pour commencer une impression
'   titre � imprimer
Private Sub ImprimerCriticit�Dangers(ByVal NewPrinter As Integer, ByVal Titre As String)

Const DX = 4000
Dim i As Integer
Dim Niveau As Integer
Dim fmt As String
Dim tbl As String
Dim iEnteteImprim�e As Integer
Dim iAuMoinsUneQuestion As Integer

    If NewPrinter Then
        vsPrinter.Preview = chkAper�u.Value
        vsPrinter.Action = 3    'd�but de transfert
        If vsPrinter.Error Then
            Exit Sub
        End If
        InitHautEtBasDePage
    End If
    
    vsPrinter.IndentLeft = 0
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.FontSize = 16
    vsPrinter.FontUnderline = True
    vsPrinter.Paragraph = Titre
    vsPrinter.FontUnderline = False
    vsPrinter.FontBold = False
    vsPrinter.FontSize = 10
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
        
    fmt = "1000|8000/"
    For Niveau = 1 To 3
        iEnteteImprim�e = False
        iAuMoinsUneQuestion = False
        tbl = ""
        For i = 1 To Module.QuestionsCriticit�Count
            'corps du tableau des questions de criticit�
            If Module.QuestionCriticit�(Niveau, i) <> "" Then
                If i = 1 Then
                    tbl = fmt & i & "|" & Module.QuestionCriticit�(Niveau, i) & "/"
                Else
                    tbl = tbl & i & "|" & Module.QuestionCriticit�(Niveau, i) & "/"
                End If
            End If
        Next
        If tbl <> "" Then
            If Not iEnteteImprim�e Then
                Dim tbl1 As String
                'entete de tableau
                vsPrinter.FontBold = True
                vsPrinter.Paragraph = "Niveau de donn�es '" & FormMain.ActiveForm.lstNiveauxCriticit�.List(Niveau) & "'"
                tbl1 = fmt & "Num�ro|Question/"
                vsPrinter.Table = tbl1
                iEnteteImprim�e = True
            End If
            vsPrinter.FontBold = False
            vsPrinter.Table = tbl
            iAuMoinsUneQuestion = True
            vsPrinter.Paragraph = ""
        End If
        If Not iAuMoinsUneQuestion Then
            vsPrinter.FontBold = True
            vsPrinter.Paragraph = ""
            vsPrinter.Paragraph = "Niveau de donn�es '" & FormMain.ActiveForm.lstNiveauxCriticit�.List(Niveau) & "'"
            vsPrinter.FontBold = False
            vsPrinter.Paragraph = "* pas de questionnaire *"
        End If
    Next
        
    If NewPrinter Then
        vsPrinter.Action = 6    'fin de transfert
    End If
    
End Sub

'imprime les natures et sp�cificit�s
'entr�e:
'   NewPrinter � vrai pour commencer une impression
'   titre � imprimer
Private Sub ImprimerNaturesEtSp�cificit�s(ByVal NewPrinter As Integer, ByVal Titre As String)

Const DX = 4000
Dim i As Integer
Dim j As Integer
Dim fmt As String
Dim tbl As String
Dim Nature As Nature
Dim iEnteteImprim�e As Integer
Dim iAuMoinsUneNature As Integer

    If NewPrinter Then
        vsPrinter.Preview = chkAper�u.Value
        vsPrinter.Action = 3    'd�but de transfert
        If vsPrinter.Error Then
            Exit Sub
        End If
        InitHautEtBasDePage
    End If
    
    vsPrinter.IndentLeft = 0
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.FontSize = 16
    vsPrinter.FontUnderline = True
    vsPrinter.Paragraph = Titre
    vsPrinter.FontUnderline = False
    vsPrinter.FontBold = False
    vsPrinter.FontSize = 10
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
        
    fmt = "4500|4500/"
    iEnteteImprim�e = False
    iAuMoinsUneNature = False
    For i = 1 To Module.Natures.Count
    
        Set Nature = Module.Natures.Item(i)
        'corps du tableau des sp�cificit�s
        tbl = ""
        For j = 1 To Nature.Sp�cificit�s.Count
            If j = 1 Then
                tbl = fmt & Nature.Libell� & "|" & Nature.Sp�cificit�s.Item(j).Libell� & "/"
            Else
                tbl = tbl & "|" & Nature.Sp�cificit�s.Item(j).Libell� & "/"
            End If
        Next
        If tbl <> "" Then
            If Not iEnteteImprim�e Then
                Dim tbl1 As String
                'entete de tableau
                vsPrinter.FontBold = True
                tbl1 = fmt & "Natures|Sp�cificit�s/"
                vsPrinter.Table = tbl1
                iEnteteImprim�e = True
            End If
            vsPrinter.FontBold = False
            vsPrinter.Table = tbl
            iAuMoinsUneNature = True
        End If
    Next
    If Not iAuMoinsUneNature Then
        vsPrinter.Paragraph = "* aucune nature *"
    End If
        
    If NewPrinter Then
        vsPrinter.Action = 6    'fin de transfert
    End If
    
End Sub

'imprime les questionnaires de pertinence
'entr�e:
'   NewPrinter � vrai pour commencer une impression
'   titre � imprimer
Private Sub ImprimerQuestPertinences(ByVal NewPrinter As Integer, ByVal Titre As String)
 
Const DX = 4000
Dim i As Integer
Dim j As Integer
Dim k As Integer
Dim fmt As String
Dim tbl As String
Dim Nature As Nature
Dim Sp�cificit� As Specificite
Dim iEnteteImprim�e As Integer
Dim iAuMoinsUneQuestion As Integer

    If NewPrinter Then
        vsPrinter.Preview = chkAper�u.Value
        vsPrinter.Action = 3    'd�but de transfert
        If vsPrinter.Error Then
            Exit Sub
        End If
        InitHautEtBasDePage
    End If
    
    vsPrinter.IndentLeft = 0
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.FontSize = 16
    vsPrinter.FontUnderline = True
    vsPrinter.Paragraph = Titre
    vsPrinter.FontUnderline = False
    vsPrinter.FontBold = False
    vsPrinter.FontSize = 10
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
        
    fmt = "800|4500|1800|1800/"
    For i = 1 To Module.Natures.Count
        Set Nature = Module.Natures.Item(i)
        For j = 1 To Nature.Sp�cificit�s.Count
            Set Sp�cificit� = Nature.Sp�cificit�s.Item(j)
            iEnteteImprim�e = False
            iAuMoinsUneQuestion = False
            'corps du tableau des questionnaires de pertinence
            tbl = ""
            For k = 1 To Sp�cificit�.QuestPertinences.Count
                If k = 1 Then
                    tbl = fmt & Sp�cificit�.QuestPertinences.Item(k).Id & "|" & Sp�cificit�.QuestPertinences.Item(k).Question & "|" & SetLibell�R�ponsePertinence(Sp�cificit�.QuestPertinences.Item(k).R�ponseOui) & "|" & SetLibell�R�ponsePertinence(Sp�cificit�.QuestPertinences.Item(k).R�ponseNon) & "/"
                Else
                    tbl = tbl & Sp�cificit�.QuestPertinences.Item(k).Id & "|" & Sp�cificit�.QuestPertinences.Item(k).Question & "|" & SetLibell�R�ponsePertinence(Sp�cificit�.QuestPertinences.Item(k).R�ponseOui) & "|" & SetLibell�R�ponsePertinence(Sp�cificit�.QuestPertinences.Item(k).R�ponseNon) & "/"
                End If
            Next
            If tbl <> "" Then
                If Not iEnteteImprim�e Then
                    Dim tbl1 As String
                    'entete de tableau
                    vsPrinter.FontBold = True
                    vsPrinter.Paragraph = "Nature '" & Nature.Libell� & "' Sp�cificit� '" & Sp�cificit�.Libell� & "'"
                    tbl1 = fmt & "Id|Question|R�ponse Oui|R�ponse Non/"
                    vsPrinter.Table = tbl1
                    iEnteteImprim�e = True
                End If
                vsPrinter.FontBold = False
                vsPrinter.Table = tbl
                iAuMoinsUneQuestion = True
            End If
            If Not iAuMoinsUneQuestion Then
                vsPrinter.FontBold = True
                vsPrinter.Paragraph = "Nature '" & Nature.Libell� & "' Sp�cificit� '" & Sp�cificit�.Libell�
                vsPrinter.FontBold = False
                vsPrinter.Paragraph = "* pas de questionnaire *"
            End If
            vsPrinter.Paragraph = ""
        Next
    Next
        
    If NewPrinter Then
        vsPrinter.Action = 6    'fin de transfert
    End If
    
End Sub


'imprime l'onglet g�n�ral
'entr�e:
'   NewPrinter � vrai pour commencer une impression
'   titre � imprimer
Private Sub ImprimerG�n�ral(ByVal NewPrinter As Integer, ByVal Titre As String)

Const DX = 4000
Dim i As Integer
Dim fmt As String
Dim tbl As String

    If NewPrinter Then
        vsPrinter.Preview = chkAper�u.Value
        vsPrinter.Action = 3    'd�but de transfert
        If vsPrinter.Error Then
            Exit Sub
        End If
        InitHautEtBasDePage
    End If
    
    vsPrinter.IndentLeft = 0
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.FontSize = 16
    vsPrinter.FontUnderline = True
    vsPrinter.Paragraph = Titre
    vsPrinter.FontUnderline = False
    vsPrinter.FontBold = False
    vsPrinter.FontSize = 10
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = True
    vsPrinter.Paragraph = ""
    vsPrinter.Text = "Nom: "
    vsPrinter.FontBold = False
    vsPrinter.CurrentX = DX
    vsPrinter.Paragraph = Module.Nom
    vsPrinter.FontBold = True
    vsPrinter.Paragraph = ""
    vsPrinter.Text = "Fichier logo: "
    vsPrinter.FontBold = False
    vsPrinter.CurrentX = DX
    vsPrinter.Paragraph = Module.FichierLogo
    vsPrinter.FontBold = True
    vsPrinter.Paragraph = ""
    vsPrinter.Text = "Fichier aide: "
    vsPrinter.FontBold = False
    vsPrinter.CurrentX = DX
    vsPrinter = Module.FichierAide
    
    'niveaux de donn�es
    vsPrinter.FontBold = True
    vsPrinter.Paragraph = ""
    vsPrinter.Text = "Niveaux de donn�es:"
    vsPrinter.Paragraph = ""
    vsPrinter.FontBold = False
    For i = 1 To Module.NiveauxCount
        vsPrinter.CurrentX = DX
        vsPrinter.Text = Module.Niveau(i)
        vsPrinter.Paragraph = ""
    Next
    vsPrinter.Paragraph = ""
    vsPrinter.Paragraph = ""
    
    'sujets de documentation
    'entete de tableau
    vsPrinter.FontBold = True
    vsPrinter.Paragraph = "Sujets et identificateurs de contexte de la documentation"
    fmt = "3500|3500/"
    tbl = fmt & "Sujet|ContextID/"
    vsPrinter.Table = tbl
    'corps du tableau des dangers
    vsPrinter.FontBold = False
    For i = 1 To Module.DocSujetCount
        If i = 1 Then
            tbl = fmt & Module.DocSujetTitre(i) & "|" & Module.DocSujetTopic(i) & "/"
        Else
            tbl = tbl & Module.DocSujetTitre(i) & "|" & Module.DocSujetTopic(i) & "/"
        End If
    Next
    vsPrinter.Table = tbl
    
    If NewPrinter Then
        vsPrinter.Action = 6    'fin de transfert
    End If
    
End Sub





'initialise les haut et bas de page
Private Sub InitHautEtBasDePage()
    
    vsPrinter.HdrFontName = "Arial"
    vsPrinter.HdrFontSize = 10
    vsPrinter.HdrFontBold = False
    vsPrinter.HdrFontItalic = False
    vsPrinter.HdrFontUnderline = False
    vsPrinter.Header = "Module HACCP '" & Module.Nom & "'"
    vsPrinter.Footer = Now & "||Page %d"

End Sub


Private Sub RefreshBoutons()
    btnImprimer.Enabled = GetNbAffichages(lstAffichages) > 0 Or optS�lection(0).Value <> 0
End Sub

Private Sub btnAide_Click()
    AideProgramme HelpContextID
End Sub

Private Sub btnAnnuler_Click()
    Unload Me
End Sub



Private Sub btnImprimer_Click()

    'optS�lection(0).Tag contient l'index du bouton d'option cliqu�
    Select Case optS�lection(0).Tag
        Case "0"
            'tout imprimer avec vsPrinter
            ImprimerTout
        Case "1"
            'imprimer l'onglet s�lectionn� avec vsPrinter
            ImprimerOnglet lstAffichages.ListIndex
    End Select
    
End Sub





'imprime tous les onglets � la suite les uns des autres
Private Sub ImprimerTout()

    vsPrinter.Preview = chkAper�u.Value
    vsPrinter.Action = 3    'd�but de transfert
    If vsPrinter.Error Then
        Exit Sub
    End If
    InitHautEtBasDePage
    
    ImprimerG�n�ral False, lstAffichages.List(0)
    vsPrinter.Action = 4 'NewPage
    ImprimerTextes False, lstAffichages.List(1)
    vsPrinter.Action = 4 'NewPage
    ImprimerSuggestions False, lstAffichages.List(2)
    vsPrinter.Action = 4 'NewPage
    ImprimerNaturesEtSp�cificit�s False, lstAffichages.List(3)
    vsPrinter.Action = 4 'NewPage
    ImprimerQuestPertinences False, lstAffichages.List(4)
    vsPrinter.Action = 4 'NewPage
    
    
    vsPrinter.Action = 6 'EndDoc
    
End Sub


Private Sub Form_Load()

Dim i As Integer

    CenterInScreen Me
    
    'remplit la liste des onglets � imprimer
    For i = 0 To 5
        lstAffichages.AddItem FormMain.ActiveForm.SSTAB1.TabCaption(i)
    Next
    RefreshBoutons
    
    'Module � imprimer r�f�renc� dans la feuille pour simplifier la syntaxe
    Set Module = FormMain.ActiveForm.Module
    
End Sub


'changement d'affichage
Private Sub lstAffichages_Click()
    optS�lection(1).Value = 1
    RefreshBoutons
End Sub



'ins�re un tableau de documents associ�s dans l'impression
'entr�e:
'   donn�e propri�taire des documents � imprimer
Private Sub Ins�rerTableauDocuments(ByVal Donn�e As Object)

Dim fmt As String
Dim tbl As String
Dim i As Integer

    'entete de tableau
    vsPrinter.FontBold = True
    fmt = "4000|4000/"
    tbl = fmt & "Fichier|Titre/"
    vsPrinter.Table = tbl
    
    'corps du tableau
    vsPrinter.FontBold = False
    For i = 1 To Donn�e.DocumentsCount
        If i = 1 Then
            tbl = fmt & Donn�e.DocumentFichier(i) & "|" & Donn�e.DocumentTitre(i) & "/"
        Else
            tbl = tbl & Donn�e.DocumentFichier(i) & "|" & Donn�e.DocumentTitre(i) & "/"
        End If
    Next
    vsPrinter.Table = tbl

End Sub


Private Sub optS�lection_Click(Index As Integer)
    optS�lection(0).Tag = Index
    RefreshBoutons
End Sub


