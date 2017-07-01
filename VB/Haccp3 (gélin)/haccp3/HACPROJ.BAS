Attribute VB_Name = "HACPROJ"
Option Explicit


'raffraichit l'onglet des dispositions en place dans toutes
'les fenêtres ouvertes sur un même projet
'entrée:
'   clé du projet
Public Sub RefreshDispositionsActuellesProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).RefreshDispositionsActuelles
        End If
    Next

End Sub
'raffraichit l'onglet de la documentation dans
'les fenêtres ouvertes sur un même projet
'entrée:
'   clé du projet
Public Sub RefreshDocumentationProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).RefreshDocumentation
        End If
    Next

End Sub

'raffraichit l'onglet de paramètres dans
'les fenêtres ouvertes sur un même projet
'entrée:
'   clé du projet
Public Sub RefreshParamètresProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).RefreshParamètres
        End If
    Next

End Sub


'raffraichit l'onglet de l'équipe dans
'les fenêtres ouvertes sur un même projet
'entrée:
'   clé du projet
Public Sub RefreshEquipeProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).RefreshEquipe
        End If
    Next

End Sub


'raffraichit l'onglet des étapes et sujets dans toutes
'les fenêtres ouvertes sur un même projet
'entrée:
'   clé du projet
Public Sub RefreshEtapesEtSujetsProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).RefreshEtapesEtSujets
        End If
    Next

End Sub

'raffraichit l'onglet Arbre HACCP dans toutes
'les fenêtres ouvertes sur un même projet
'entrée:
'   clé du projet
Public Sub RefreshArbreHACCPProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).RefreshArbreHACCP
        End If
    Next

End Sub




'raffraichit l'onglet Dangers dans toutes
'les fenêtres ouvertes sur un même projet
'entrée:
'   clé du projet
Public Sub RefreshDangersProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).RefreshDangers
        End If
    Next

End Sub





'raffraichit le spread des sujets/dangers dans toutes
'les fenêtres ouvertes sur un même projet
'entrée:
'   clé du projet
Public Sub RefreshSujetsDangersProjet(ByVal CléProjet As String, ByVal idDanger As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).RefreshSujetsDangers idDanger
        End If
    Next

End Sub






'raffraichit l'état des boutons de l'onglet Etapes et Sujets dans toutes
'les fenêtres ouvertes sur un même projet
'entrée:
'   clé du projet
Public Sub RefreshBoutonsEtapesSujetsProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).RefreshBoutonsEtapesSujets
        End If
    Next

End Sub


Public Sub RefreshFenetresProjet(ByVal Elem As String, ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer

    If Projets(CléProjet).NbFenêtres > 1 Then
        n = Forms.Count - 1
        Select Case LCase$(Elem)
            Case "titre"
                Dim Titre As String
                Titre = Projets(CléProjet).Titre
                For i = 0 To n
                    If Forms(i).Tag = CléProjet Then
                        Forms(i).txtTitre.Text = Titre
                    End If
                Next
            Case "auteur"
                Dim Auteur As String
                Auteur = Projets(CléProjet).Auteur
                For i = 0 To n
                    If Forms(i).Tag = CléProjet Then
                        Forms(i).txtAuteur.Text = Auteur
                    End If
                Next
            Case "reference"
                Dim Référence As String
                Référence = Projets(CléProjet).Référence
                For i = 0 To n
                    If Forms(i).Tag = CléProjet Then
                        Forms(i).txtRéférence.Text = Référence
                    End If
                Next
            Case "commentaire"
                Dim Commentaire As String
                Commentaire = Projets(CléProjet).Commentaire
                For i = 0 To n
                    If Forms(i).Tag = CléProjet Then
                        Forms(i).txtCommentaire.Text = Commentaire
                    End If
                Next
        End Select
    End If
    MetAJourMenus
    
End Sub





Public Sub RefreshListeEtapesProjet(ctl As Control, ByVal CléProjet As String, ByVal Index As Integer)

Dim i As Integer
Dim n As Integer

    'If Projets(CléProjet).NbFenêtres > 1 Then
        n = Forms.Count - 1
        For i = 0 To n
            If Forms(i).Tag = CléProjet Then
                If Index <> -1 Then
                    Forms(i).RefreshListeEtapes Forms(i).Controls(ctl.Name)(Index)
                Else
                    Forms(i).RefreshListeEtapes Forms(i).Controls(ctl.Name)
                End If
            End If
        Next
    'End If
End Sub



Public Sub RefreshListeSujetsDangersProjet(ctl As Control, ByVal CléProjet As String, ByVal Index As Integer)

Dim i As Integer
Dim n As Integer

    'If Projets(CléProjet).NbFenêtres > 1 Then
        n = Forms.Count - 1
        For i = 0 To n
            If Forms(i).Tag = CléProjet Then
                If Index <> -1 Then
                    If Forms(i).Controls(ctl.Name)(Index).ListIndex <> -1 Then
                        Forms(i).RefreshListeSujetsDangers Forms(i).Controls(ctl.Name)(Index), Forms(i).EtapeEnCours(Index), Forms(i).SujetEnCours(Index)
                    End If
                Else
                    If Forms(i).Controls(ctl.Name)(Index).ListIndex <> -1 Then
                        Forms(i).RefreshListeSujetsDangers Forms(i).Controls(ctl.Name), Forms(i).EtapeEnCours(Index), Forms(i).SujetEnCours(Index)
                    End If
                End If
            End If
        Next
    'End If
End Sub




'raffraichit un controle 'liste de sujets' (listbox ou combobox) dans toutes les
'fenêtres d'un même projet
'entrée:
'   ctl: control list ou combo box à raffraichir
'   Etape: donnée Etape fournissant la liste des sujets
'   CléProjet: projet concerné
'   Index: index du controle ctl si il s'agit d'un tableau de contrôles (-1 sinon)
'   IndexAff: index du mode d'affichage contenant le controle ctl (on en a besoin
'             pour tester l'étape en cours de ce mode d'affichage, si il ne s'agit
'             pas de l'étape passée en paramètre, il ne faut pas traiter la fenêtre)
Public Sub RefreshListeSujetsProjet(ctl As Control, ByVal Etape As Donnee, ByVal CléProjet As String, ByVal Index As Integer, ByVal IndexAff As Integer)

Dim i As Integer
Dim n As Integer

    'If Projets(CléProjet).NbFenêtres > 1 Then
        'seuls les projet à plusieurs fenêtres ouvertes sont concernés
        n = Forms.Count - 1
        For i = 0 To n
            If Forms(i).Tag = CléProjet Then
                'fenêtre ouverte sur le projet
                If Etape.id = Forms(i).EtapeEnCours(IndexAff).id Then
                    'l'étape en cours dans le mode d'affichage du controle à raffraichir
                    'est la même étape que celle passée en paramètre: la liste des sujets
                    'doit être raffraichie
                    'remplissage du controle
                    If Index <> -1 Then
                        'cas d'un tableau de controles
                        Forms(i).RefreshListeSujets Forms(i).Controls(ctl.Name)(Index), Etape
                    Else
                        'cas d'un control simple
                        Forms(i).RefreshListeSujets Forms(i).Controls(ctl.Name), Etape
                    End If
                End If
            End If
        Next
    'End If
End Sub




'raffraichit l'état des boutons de l'onglet Arbre HACCP dans toutes
'les fenêtres ouvertes sur un même projet
'entrée:
'   clé du projet
Public Sub RefreshBoutonsArbreHACCPProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).RefreshBoutonsArbreHACCP
        End If
    Next

End Sub



'raffraichit l'état des boutons de l'onglet documentation dans toutes
'les fenêtres ouvertes sur un même projet
'entrée:
'   clé du projet
Public Sub RefreshBoutonsDocumentationProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).RefreshBoutonsDocumentation
        End If
    Next

End Sub




'raffraichit l'état des boutons de l'onglet dangers dans toutes
'les fenêtres ouvertes sur un même projet
'entrée:
'   clé du projet
Public Sub RefreshBoutonsDangersProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).RefreshBoutonsDangers
        End If
    Next

End Sub

'raffraichit l'état de tous les boutons des onglets dans toutes
'les fenêtres ouvertes sur un même projet
'entrée:
'   clé du projet
Public Sub RefreshTousBoutonsProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).RefreshBoutonsDocumentation
            Forms(i).RefreshBoutonsEtapesSujets
            Forms(i).RefreshBoutonsDispositionsActuelles
            Forms(i).RefreshBoutonsDangers
            Forms(i).RefreshBoutonsArbreHACCP
        End If
    Next

End Sub

'raffraichit l'état des boutons de l'onglet Dispositions en place dans toutes
'les fenêtres ouvertes sur un même projet
'entrée:
'   clé du projet
Public Sub RefreshBoutonsDispositionsActuellesProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).RefreshBoutonsDispositionsActuelles
        End If
    Next

End Sub


Sub ActiverProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer

    n = Forms.Count - 1

    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            Forms(i).SetFocus
            Exit Sub
        End If
    Next

End Sub


Sub FermerFormChildProjet(ByVal CléProjet As String)

Dim i As Integer
Dim n As Integer

    n = Forms.Count - 1

    For i = n To 0 Step -1
        If Forms(i).Tag = CléProjet Then
            Unload Forms(i)
            DoEvents
        End If
    Next
    
End Sub

Sub FermerProjet(ByVal CléProjet As String)

    'ferme les fenêtres ouvertes sur le projet
    'à la fermeture de la dernière fenêtre, l'objet Projet est oté de la
    'collection Projets
    FermerFormChildProjet CléProjet

    MetAJourMenus

End Sub



Sub NouvelleFenetrePourProjet(ByVal CléProjet As String)

Dim frm As New FormChildModel

    frm.CléProjet = CléProjet
    frm.Show
    
End Sub

Sub NumeroteFenetresProjet(ByVal CléProjet As String)
    
Dim i As Integer
Dim n As Integer
Dim i1 As Integer
Dim c As Integer

    n = Forms.Count - 1
    i1 = -1
    For i = 0 To n
        If Forms(i).Tag = CléProjet Then
            If i1 = -1 Then
                i1 = i
            Else
                If i1 <> -2 Then
                    Forms(i1).Caption = GetItemDansChaineSep(Forms(i1).Caption, 1, ":") & ":1"
                    Forms(i).Caption = GetItemDansChaineSep(Forms(i1).Caption, 1, ":") & ":2"
                    c = 3
                    i1 = -2
                Else
                    Forms(i).Caption = GetItemDansChaineSep(Forms(i).Caption, 1, ":") & ":" & c
                    c = c + 1
                End If
            End If
        End If
    Next

    If i1 <> -1 And i1 <> -2 Then
       Forms(i1).Caption = GetItemDansChaineSep(Forms(i1).Caption, 1, ":")
    End If

End Sub

'ouverture d'un nouveau projet ou d'un projet existant
'entrée:
'   nom du fichier du projet à ouvrir (avec chemin d'accès complet)
'   ou "" pour un nouveau projet
Function OuvrirProjet(ByVal FichierProjet As String) As Integer

Static NuméroProjet As Integer
Dim NewProjet As New Projet
Dim frm As New FormChildModel

    HourGlass "show"
    OuvrirProjet = False
    
    'clé du projet ouvert: ce n'est pas un nom de fichier car un nouveau projet
    'n'a pas de nom de fichier et la clé d'un objet dans une collection ne
    'peut pas être changée, ce qui serait nécessaire si on enregistrer le
    'projet sous un nouveau nom
    NuméroProjet = NuméroProjet + 1
    frm.CléProjet = "PROJET" & NuméroProjet
    
    If FichierProjet <> "" Then
        'cas d'un projet existant
        If ProjetEstOuvert(FichierProjet) Then
            'le projet est déjà ouvert, on active la fenêtre Child correspondante
            ActiverProjet FichierProjet
            OuvrirProjet = True
            HourGlass "hide"
            Exit Function
        Else
            If Not ExisteFichier(FichierProjet) Then
                ErreurUserBox "Impossible d'accéder au projet " & UCase$(FichierProjet) & "." & CrLf2 & "Choisissez un autre projet.", MB_ICONEXCLAMATION
                HourGlass "hide"
                Exit Function
            End If
            If FileLen(FichierProjet) <> 0 Then
                'charge le projet si fichier non vide
                NewProjet.Erreur = 0
                NewProjet.Load FormMain.DwStorage1, FichierProjet
                If NewProjet.Erreur Then
                    Dim MonErreur As Long
                    MonErreur = NewProjet.Erreur - vbObjectError
                    If MonErreur > 0 And MonErreur < 65535 Then
                        ErreurUserBox InsereChaine(GetChaineCrLf("M24"), UCase$(FichierProjet)), MB_ICONEXCLAMATION
                    Else
                        'erreur Visual Basic.
                        ErreurSystemeBox Error$, MB_ICONEXCLAMATION, NomApplication
                    End If
                    HourGlass "hide"
                    Exit Function
                End If
            Else
                'fichier vide
                NewProjet.FichierProjet = FichierProjet
                NewProjet.Nom = GetFichierSansChemin(FichierProjet)
                NewProjet.Répertoire = GetCheminSansFichier(FichierProjet)
                NewProjet.NomModule = Module.Nom
            End If
        End If
    Else
        'cas d'un nouveau projet, options par défaut
        NewProjet.LectureSeule = False
        NewProjet.Verrouillé = False
        NewProjet.NiveauMaxiCopie = NIVEAU_MESURE_PREVENTIVE
        NewProjet.NomModule = Module.Nom
        NewProjet.TitreModule = Module.Titre
        NewProjet.RépertoireDocuments = ""
    End If
    
    'cas du chargement d'un projet de module différent
    If NewProjet.NomModule <> Module.Nom Then
        ErreurUserBox InsereChaine(InsereChaine(InsereChaine(GetChaineCrLf("M16"), UCase$(FichierProjet)), NewProjet.NomModule), Module.Nom), MB_ICONEXCLAMATION
    End If
        
    'cas où le répertoire de documents du projet n'existe pas
    If Not ExisteRépertoire(NewProjet.RépertoireDocuments) Then
        ErreurUserBox InsereChaine(GetChaineCrLf("M22"), NewProjet.RépertoireDocuments), MB_ICONEXCLAMATION
    End If
    'ajoute le projet à la collection de projets
    Projets.Add NewProjet, frm.CléProjet
    
    'ajoute une feuille MDIChild relative au projet ouvert
    frm.Show
    
    MetAJourMenus
    
    OuvrirProjet = True
    HourGlass "hide"
    
End Function


'test si un projet est déjà chargé dans l'application
'entrée:
'   FichierProjet: nom complet du fichier du projet à tester
'retour:
'    true ou false
Function ProjetEstOuvert(ByVal FichierProjet As String) As Integer

Dim n As Integer
Dim i As Integer

    ProjetEstOuvert = False
    n = Projets.Count
    'parcours de la table des projets chargés
    For i = 1 To n
        If UCase$(Projets(i).FichierProjet) = UCase$(FichierProjet) Then
            'projet déjà ouvert
            ProjetEstOuvert = True
            Exit Function
        End If
    Next

End Function



