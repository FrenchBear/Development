Attribute VB_Name = "HACPROJ"
Option Explicit


'raffraichit l'onglet des dispositions en place dans toutes
'les fen�tres ouvertes sur un m�me projet
'entr�e:
'   cl� du projet
Public Sub RefreshDispositionsActuellesProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).RefreshDispositionsActuelles
        End If
    Next

End Sub
'raffraichit l'onglet de la documentation dans
'les fen�tres ouvertes sur un m�me projet
'entr�e:
'   cl� du projet
Public Sub RefreshDocumentationProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).RefreshDocumentation
        End If
    Next

End Sub

'raffraichit l'onglet de param�tres dans
'les fen�tres ouvertes sur un m�me projet
'entr�e:
'   cl� du projet
Public Sub RefreshParam�tresProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).RefreshParam�tres
        End If
    Next

End Sub


'raffraichit l'onglet de l'�quipe dans
'les fen�tres ouvertes sur un m�me projet
'entr�e:
'   cl� du projet
Public Sub RefreshEquipeProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).RefreshEquipe
        End If
    Next

End Sub


'raffraichit l'onglet des �tapes et sujets dans toutes
'les fen�tres ouvertes sur un m�me projet
'entr�e:
'   cl� du projet
Public Sub RefreshEtapesEtSujetsProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).RefreshEtapesEtSujets
        End If
    Next

End Sub

'raffraichit l'onglet Arbre HACCP dans toutes
'les fen�tres ouvertes sur un m�me projet
'entr�e:
'   cl� du projet
Public Sub RefreshArbreHACCPProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).RefreshArbreHACCP
        End If
    Next

End Sub




'raffraichit l'onglet Dangers dans toutes
'les fen�tres ouvertes sur un m�me projet
'entr�e:
'   cl� du projet
Public Sub RefreshDangersProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).RefreshDangers
        End If
    Next

End Sub





'raffraichit le spread des sujets/dangers dans toutes
'les fen�tres ouvertes sur un m�me projet
'entr�e:
'   cl� du projet
Public Sub RefreshSujetsDangersProjet(ByVal Cl�Projet As String, ByVal idDanger As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).RefreshSujetsDangers idDanger
        End If
    Next

End Sub






'raffraichit l'�tat des boutons de l'onglet Etapes et Sujets dans toutes
'les fen�tres ouvertes sur un m�me projet
'entr�e:
'   cl� du projet
Public Sub RefreshBoutonsEtapesSujetsProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).RefreshBoutonsEtapesSujets
        End If
    Next

End Sub


Public Sub RefreshFenetresProjet(ByVal Elem As String, ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer

    If Projets(Cl�Projet).NbFen�tres > 1 Then
        n = Forms.Count - 1
        Select Case LCase$(Elem)
            Case "titre"
                Dim Titre As String
                Titre = Projets(Cl�Projet).Titre
                For i = 0 To n
                    If Forms(i).Tag = Cl�Projet Then
                        Forms(i).txtTitre.Text = Titre
                    End If
                Next
            Case "auteur"
                Dim Auteur As String
                Auteur = Projets(Cl�Projet).Auteur
                For i = 0 To n
                    If Forms(i).Tag = Cl�Projet Then
                        Forms(i).txtAuteur.Text = Auteur
                    End If
                Next
            Case "reference"
                Dim R�f�rence As String
                R�f�rence = Projets(Cl�Projet).R�f�rence
                For i = 0 To n
                    If Forms(i).Tag = Cl�Projet Then
                        Forms(i).txtR�f�rence.Text = R�f�rence
                    End If
                Next
            Case "commentaire"
                Dim Commentaire As String
                Commentaire = Projets(Cl�Projet).Commentaire
                For i = 0 To n
                    If Forms(i).Tag = Cl�Projet Then
                        Forms(i).txtCommentaire.Text = Commentaire
                    End If
                Next
        End Select
    End If
    MetAJourMenus
    
End Sub





Public Sub RefreshListeEtapesProjet(ctl As Control, ByVal Cl�Projet As String, ByVal Index As Integer)

Dim i As Integer
Dim n As Integer

    'If Projets(Cl�Projet).NbFen�tres > 1 Then
        n = Forms.Count - 1
        For i = 0 To n
            If Forms(i).Tag = Cl�Projet Then
                If Index <> -1 Then
                    Forms(i).RefreshListeEtapes Forms(i).Controls(ctl.Name)(Index)
                Else
                    Forms(i).RefreshListeEtapes Forms(i).Controls(ctl.Name)
                End If
            End If
        Next
    'End If
End Sub



Public Sub RefreshListeSujetsDangersProjet(ctl As Control, ByVal Cl�Projet As String, ByVal Index As Integer)

Dim i As Integer
Dim n As Integer

    'If Projets(Cl�Projet).NbFen�tres > 1 Then
        n = Forms.Count - 1
        For i = 0 To n
            If Forms(i).Tag = Cl�Projet Then
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
'fen�tres d'un m�me projet
'entr�e:
'   ctl: control list ou combo box � raffraichir
'   Etape: donn�e Etape fournissant la liste des sujets
'   Cl�Projet: projet concern�
'   Index: index du controle ctl si il s'agit d'un tableau de contr�les (-1 sinon)
'   IndexAff: index du mode d'affichage contenant le controle ctl (on en a besoin
'             pour tester l'�tape en cours de ce mode d'affichage, si il ne s'agit
'             pas de l'�tape pass�e en param�tre, il ne faut pas traiter la fen�tre)
Public Sub RefreshListeSujetsProjet(ctl As Control, ByVal Etape As Donnee, ByVal Cl�Projet As String, ByVal Index As Integer, ByVal IndexAff As Integer)

Dim i As Integer
Dim n As Integer

    'If Projets(Cl�Projet).NbFen�tres > 1 Then
        'seuls les projet � plusieurs fen�tres ouvertes sont concern�s
        n = Forms.Count - 1
        For i = 0 To n
            If Forms(i).Tag = Cl�Projet Then
                'fen�tre ouverte sur le projet
                If Etape.id = Forms(i).EtapeEnCours(IndexAff).id Then
                    'l'�tape en cours dans le mode d'affichage du controle � raffraichir
                    'est la m�me �tape que celle pass�e en param�tre: la liste des sujets
                    'doit �tre raffraichie
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




'raffraichit l'�tat des boutons de l'onglet Arbre HACCP dans toutes
'les fen�tres ouvertes sur un m�me projet
'entr�e:
'   cl� du projet
Public Sub RefreshBoutonsArbreHACCPProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).RefreshBoutonsArbreHACCP
        End If
    Next

End Sub



'raffraichit l'�tat des boutons de l'onglet documentation dans toutes
'les fen�tres ouvertes sur un m�me projet
'entr�e:
'   cl� du projet
Public Sub RefreshBoutonsDocumentationProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).RefreshBoutonsDocumentation
        End If
    Next

End Sub




'raffraichit l'�tat des boutons de l'onglet dangers dans toutes
'les fen�tres ouvertes sur un m�me projet
'entr�e:
'   cl� du projet
Public Sub RefreshBoutonsDangersProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).RefreshBoutonsDangers
        End If
    Next

End Sub

'raffraichit l'�tat de tous les boutons des onglets dans toutes
'les fen�tres ouvertes sur un m�me projet
'entr�e:
'   cl� du projet
Public Sub RefreshTousBoutonsProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).RefreshBoutonsDocumentation
            Forms(i).RefreshBoutonsEtapesSujets
            Forms(i).RefreshBoutonsDispositionsActuelles
            Forms(i).RefreshBoutonsDangers
            Forms(i).RefreshBoutonsArbreHACCP
        End If
    Next

End Sub

'raffraichit l'�tat des boutons de l'onglet Dispositions en place dans toutes
'les fen�tres ouvertes sur un m�me projet
'entr�e:
'   cl� du projet
Public Sub RefreshBoutonsDispositionsActuellesProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer
    
    n = Forms.Count - 1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).RefreshBoutonsDispositionsActuelles
        End If
    Next

End Sub


Sub ActiverProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer

    n = Forms.Count - 1

    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
            Forms(i).SetFocus
            Exit Sub
        End If
    Next

End Sub


Sub FermerFormChildProjet(ByVal Cl�Projet As String)

Dim i As Integer
Dim n As Integer

    n = Forms.Count - 1

    For i = n To 0 Step -1
        If Forms(i).Tag = Cl�Projet Then
            Unload Forms(i)
            DoEvents
        End If
    Next
    
End Sub

Sub FermerProjet(ByVal Cl�Projet As String)

    'ferme les fen�tres ouvertes sur le projet
    '� la fermeture de la derni�re fen�tre, l'objet Projet est ot� de la
    'collection Projets
    FermerFormChildProjet Cl�Projet

    MetAJourMenus

End Sub



Sub NouvelleFenetrePourProjet(ByVal Cl�Projet As String)

Dim frm As New FormChildModel

    frm.Cl�Projet = Cl�Projet
    frm.Show
    
End Sub

Sub NumeroteFenetresProjet(ByVal Cl�Projet As String)
    
Dim i As Integer
Dim n As Integer
Dim i1 As Integer
Dim c As Integer

    n = Forms.Count - 1
    i1 = -1
    For i = 0 To n
        If Forms(i).Tag = Cl�Projet Then
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
'entr�e:
'   nom du fichier du projet � ouvrir (avec chemin d'acc�s complet)
'   ou "" pour un nouveau projet
Function OuvrirProjet(ByVal FichierProjet As String) As Integer

Static Num�roProjet As Integer
Dim NewProjet As New Projet
Dim frm As New FormChildModel

    HourGlass "show"
    OuvrirProjet = False
    
    'cl� du projet ouvert: ce n'est pas un nom de fichier car un nouveau projet
    'n'a pas de nom de fichier et la cl� d'un objet dans une collection ne
    'peut pas �tre chang�e, ce qui serait n�cessaire si on enregistrer le
    'projet sous un nouveau nom
    Num�roProjet = Num�roProjet + 1
    frm.Cl�Projet = "PROJET" & Num�roProjet
    
    If FichierProjet <> "" Then
        'cas d'un projet existant
        If ProjetEstOuvert(FichierProjet) Then
            'le projet est d�j� ouvert, on active la fen�tre Child correspondante
            ActiverProjet FichierProjet
            OuvrirProjet = True
            HourGlass "hide"
            Exit Function
        Else
            If Not ExisteFichier(FichierProjet) Then
                ErreurUserBox "Impossible d'acc�der au projet " & UCase$(FichierProjet) & "." & CrLf2 & "Choisissez un autre projet.", MB_ICONEXCLAMATION
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
                NewProjet.R�pertoire = GetCheminSansFichier(FichierProjet)
                NewProjet.NomModule = Module.Nom
            End If
        End If
    Else
        'cas d'un nouveau projet, options par d�faut
        NewProjet.LectureSeule = False
        NewProjet.Verrouill� = False
        NewProjet.NiveauMaxiCopie = NIVEAU_MESURE_PREVENTIVE
        NewProjet.NomModule = Module.Nom
        NewProjet.TitreModule = Module.Titre
        NewProjet.R�pertoireDocuments = ""
    End If
    
    'cas du chargement d'un projet de module diff�rent
    If NewProjet.NomModule <> Module.Nom Then
        ErreurUserBox InsereChaine(InsereChaine(InsereChaine(GetChaineCrLf("M16"), UCase$(FichierProjet)), NewProjet.NomModule), Module.Nom), MB_ICONEXCLAMATION
    End If
        
    'cas o� le r�pertoire de documents du projet n'existe pas
    If Not ExisteR�pertoire(NewProjet.R�pertoireDocuments) Then
        ErreurUserBox InsereChaine(GetChaineCrLf("M22"), NewProjet.R�pertoireDocuments), MB_ICONEXCLAMATION
    End If
    'ajoute le projet � la collection de projets
    Projets.Add NewProjet, frm.Cl�Projet
    
    'ajoute une feuille MDIChild relative au projet ouvert
    frm.Show
    
    MetAJourMenus
    
    OuvrirProjet = True
    HourGlass "hide"
    
End Function


'test si un projet est d�j� charg� dans l'application
'entr�e:
'   FichierProjet: nom complet du fichier du projet � tester
'retour:
'    true ou false
Function ProjetEstOuvert(ByVal FichierProjet As String) As Integer

Dim n As Integer
Dim i As Integer

    ProjetEstOuvert = False
    n = Projets.Count
    'parcours de la table des projets charg�s
    For i = 1 To n
        If UCase$(Projets(i).FichierProjet) = UCase$(FichierProjet) Then
            'projet d�j� ouvert
            ProjetEstOuvert = True
            Exit Function
        End If
    Next

End Function



