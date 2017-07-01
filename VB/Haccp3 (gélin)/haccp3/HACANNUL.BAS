Attribute VB_Name = "modAnnulation"
Option Explicit

Private AnnulationAction As String

Private AnnulationTexte As String
Private AnnulationControl As Control
Private AnnulationCléProjet As String
Private AnnulationObjet As Object
Private AnnulationParamètre As String
Private AnnulationNomDonnée As String
Private AnnulationObjet2 As Object
Private AnnulationIndexAff As Integer
Private AnnulationBeforeKey As Variant

Sub ProgAnnulationDeleteDonnée(ByVal CléProjet As String, ByVal Donnée As Donnee, ByVal Parent As Object, ByVal NomDonnée As String, ByVal IndexAff As Integer, ByVal BeforeKey As Variant)
    
    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    Set AnnulationObjet = Donnée
    AnnulationNomDonnée = NomDonnée
    Set AnnulationObjet2 = Parent
    AnnulationIndexAff = IndexAff
    AnnulationBeforeKey = BeforeKey
    FormMain.MnuEditionAnnuler.Caption = "&Annuler effacement " & NomDonnée
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "deletedonnée"
    
End Sub

Sub AnnulerAnnulation()
    AnnulationAction = ""
    FormMain.MnuEditionAnnuler.Caption = "&Annuler"
    FormMain.MnuEditionAnnuler.Enabled = False
End Sub

Sub ExécuterAnnulation()
    
Dim SujetDanger As SujetDanger
Dim Danger As Danger
Dim Projet As Projet
    
    Set Projet = Projets.Item(AnnulationCléProjet)
    Select Case AnnulationAction
        Case "frappe", "deletetextbox"
            'réaffecte ancien texte
            AnnulationControl.Text = AnnulationTexte
            'refresh
            Select Case AnnulationParamètre
                Case "titre"
                    Projet.Titre = AnnulationTexte
                Case "auteur"
                    Projet.Auteur = AnnulationTexte
                Case "reference"
                    Projet.Référence = AnnulationTexte
                Case "commentaire"
                    Projet.Commentaire = AnnulationTexte
            End Select
            RefreshFenetresProjet AnnulationParamètre, AnnulationCléProjet
            AnnulerAnnulation
        Case "équipe"
            'réaffecte ancienne équipe
            Set Projet.Equipe = AnnulationObjet
            'refresh
            RefreshEquipeProjet AnnulationCléProjet
            AnnulerAnnulation
        Case "documentation"
            'réaffecte ancienne documentation
            Set Projet.Documentation = AnnulationObjet
            'refresh
            RefreshDocumentationProjet AnnulationCléProjet
            AnnulerAnnulation
        Case "ajoutetape"
            'efface l'étape ajoutée
            Projet.DeleteEtape AnnulationObjet.id
            'refresh
            RefreshEtapesEtSujetsProjet AnnulationCléProjet
            AnnulerAnnulation
        Case "ajoutdonnée"
            'efface la donnée ajoutée
            AnnulationObjet2.colEnfants.Remove AnnulationObjet.id
            'refresh
            Select Case AnnulationIndexAff
                Case INDEX_AFF_ETAPES_ET_SUJETS
                    RefreshEtapesEtSujetsProjet AnnulationCléProjet
                Case INDEX_AFF_DISPOSITIONS
                    RefreshDispositionsActuellesProjet AnnulationCléProjet
                Case INDEX_AFF_ARBRE
                    RefreshArbreHACCPProjet AnnulationCléProjet
            End Select
            AnnulerAnnulation
        Case "modifdonnée"
            'restaure les champs de la donnée modifiée
            AnnulationObjet.MiniPaste AnnulationObjet2
            'refresh
            Select Case AnnulationIndexAff
                Case INDEX_AFF_ETAPES_ET_SUJETS
                    RefreshEtapesEtSujetsProjet AnnulationCléProjet
                    RefreshDangersProjet AnnulationCléProjet
                    RefreshArbreHACCPProjet AnnulationCléProjet
                Case INDEX_AFF_DISPOSITIONS
                    RefreshDispositionsActuellesProjet AnnulationCléProjet
                Case INDEX_AFF_ARBRE
                    RefreshArbreHACCPProjet AnnulationCléProjet
            End Select
            AnnulerAnnulation
        Case "deletedonnée"
            'rajout la donnée à son parent
            If AnnulationBeforeKey <> "" Then
                AnnulationObjet2.AddEnfant AnnulationObjet, BeforeKey:=AnnulationBeforeKey
            Else
                AnnulationObjet2.AddEnfant AnnulationObjet
            End If
            'refresh
            Select Case AnnulationIndexAff
                Case INDEX_AFF_ETAPES_ET_SUJETS
                    RefreshEtapesEtSujetsProjet AnnulationCléProjet
                    RefreshDangersProjet AnnulationCléProjet
                    RefreshArbreHACCPProjet AnnulationCléProjet
                Case INDEX_AFF_DISPOSITIONS
                    RefreshDispositionsActuellesProjet AnnulationCléProjet
                Case INDEX_AFF_ARBRE
                    RefreshArbreHACCPProjet AnnulationCléProjet
            End Select
            AnnulerAnnulation
        Case "deletesujet"
            'rajoute le sujet à l'étape
            If AnnulationBeforeKey <> "" Then
                AnnulationObjet2.AddEnfant AnnulationObjet, BeforeKey:=AnnulationBeforeKey
            Else
                AnnulationObjet2.AddEnfant AnnulationObjet
            End If
            'démarque l'effacement des sujets/dangers du sujet
            For Each SujetDanger In Projet.colSujetsDangers
                If SujetDanger.Sujet = AnnulationObjet.id Then
                    SujetDanger.Effacé = False
                End If
            Next
            'refresh
            RefreshEtapesEtSujetsProjet AnnulationCléProjet
            RefreshDispositionsActuellesProjet AnnulationCléProjet
            RefreshDangersProjet AnnulationCléProjet
            RefreshArbreHACCPProjet AnnulationCléProjet
            AnnulerAnnulation
        Case "deleteetape"
            'rajoute l'étape au projet
            If AnnulationBeforeKey <> "" Then
                Projet.AddEtape AnnulationObjet, BeforeKey:=AnnulationBeforeKey
            Else
                Projet.AddEtape AnnulationObjet
            End If
            'démarque l'effacement des sujets/dangers des sujets de l'étape
            Dim Sujet As Donnee
            For Each Sujet In AnnulationObjet.colEnfants
                For Each SujetDanger In Projet.colSujetsDangers
                    If SujetDanger.Sujet = Sujet.id Then
                        SujetDanger.Effacé = False
                    End If
                Next
            Next
            'refresh
            RefreshEtapesEtSujetsProjet AnnulationCléProjet
            RefreshDispositionsActuellesProjet AnnulationCléProjet
            RefreshDangersProjet AnnulationCléProjet
            RefreshArbreHACCPProjet AnnulationCléProjet
            AnnulerAnnulation
        Case "deletesujetdanger"
            'rajoute le sujet/danger au projet
            If AnnulationBeforeKey <> "" Then
                Projet.AddSujetDanger AnnulationObjet, IndexDanger:=AnnulationBeforeKey
            Else
                Projet.AddSujetDanger AnnulationObjet
            End If
            'refresh
            RefreshDangersProjet AnnulationCléProjet
            RefreshArbreHACCPProjet AnnulationCléProjet
            AnnulerAnnulation
        Case "ajoutsujetdanger"
            'supprime le sujet/danger ajouté
            Projet.DeleteSujetDanger AnnulationObjet.id
            'refresh
            RefreshDangersProjet AnnulationCléProjet
            RefreshArbreHACCPProjet AnnulationCléProjet
            AnnulerAnnulation
        Case "modifsujetdanger"
            'restaure les champs du sujet/danger
            AnnulationObjet.MiniPaste AnnulationObjet2
            'refresh
            RefreshDangersProjet AnnulationCléProjet
            RefreshArbreHACCPProjet AnnulationCléProjet
            AnnulerAnnulation
        Case "deletedanger"
            If AnnulationBeforeKey <> "" Then
                Projet.AddDanger AnnulationObjet, IndexDanger:=AnnulationBeforeKey
            Else
                Projet.AddDanger AnnulationObjet
            End If
            'démarque l'effacement des sujets/dangers du danger
            For Each SujetDanger In Projet.colSujetsDangers
                If SujetDanger.Danger = AnnulationObjet.id Then
                    SujetDanger.Effacé = False
                End If
            Next
            'refresh
            RefreshDangersProjet AnnulationCléProjet
            RefreshArbreHACCPProjet AnnulationCléProjet
            AnnulerAnnulation
        Case "ajoutdanger"
            'supprime le danger ajouté
            Projet.DeleteDanger AnnulationObjet.id
            'refresh
            RefreshDangersProjet AnnulationCléProjet
            RefreshArbreHACCPProjet AnnulationCléProjet
            AnnulerAnnulation
        Case "modifdanger"
            'restaure les champs du danger
            AnnulationObjet.MiniPaste AnnulationObjet2
            'refresh
            RefreshDangersProjet AnnulationCléProjet
            RefreshArbreHACCPProjet AnnulationCléProjet
            AnnulerAnnulation
    End Select

End Sub

Sub ProgAnnulationAjoutEtape(ByVal CléProjet As String, ByVal Etape As Donnee, ByVal NomDonnée As String)
    
    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    Set AnnulationObjet = Etape
    AnnulationNomDonnée = NomDonnée
    FormMain.MnuEditionAnnuler.Caption = "&Annuler ajout " & NomDonnée
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "ajoutetape"
    
End Sub


Sub ProgAnnulationAjoutDonnée(ByVal CléProjet As String, ByVal Donnée As Donnee, ByVal Parent As Object, ByVal NomDonnée As String, ByVal IndexAff As Integer)
    
    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    Set AnnulationObjet = Donnée
    AnnulationNomDonnée = NomDonnée
    Set AnnulationObjet2 = Parent
    AnnulationIndexAff = IndexAff
    FormMain.MnuEditionAnnuler.Caption = "&Annuler ajout " & NomDonnée
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "ajoutdonnée"
    
End Sub



Sub ProgAnnulationAjoutSujetDanger(ByVal CléProjet As String, ByVal SujetDanger As SujetDanger, ByVal NomDonnée As String)
    
    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    Set AnnulationObjet = SujetDanger
    AnnulationNomDonnée = NomDonnée
    FormMain.MnuEditionAnnuler.Caption = "&Annuler ajout " & NomDonnée
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "ajoutsujetdanger"
    
End Sub




Sub ProgAnnulationAjoutDanger(ByVal CléProjet As String, ByVal Danger As Danger, ByVal NomDonnée As String)
    
    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    Set AnnulationObjet = Danger
    AnnulationNomDonnée = NomDonnée
    FormMain.MnuEditionAnnuler.Caption = "&Annuler ajout " & NomDonnée
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "ajoutdanger"
    
End Sub





Sub ProgAnnulationModifSujetDanger(ByVal CléProjet As String, ByVal SujetDanger As SujetDanger, ByVal NomDonnée As String)
    
    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    Set AnnulationObjet = SujetDanger
    Set AnnulationObjet2 = SujetDanger.MiniCopy
    AnnulationNomDonnée = NomDonnée
    FormMain.MnuEditionAnnuler.Caption = "&Annuler modification " & NomDonnée
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "modifsujetdanger"
    
End Sub





Sub ProgAnnulationModifDanger(ByVal CléProjet As String, ByVal Danger As Danger, ByVal NomDonnée As String)
    
    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    Set AnnulationObjet = Danger
    Set AnnulationObjet2 = Danger.MiniCopy
    AnnulationNomDonnée = NomDonnée
    FormMain.MnuEditionAnnuler.Caption = "&Annuler modification " & NomDonnée
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "modifdanger"
    
End Sub






Sub ProgAnnulationCollerDonnée(ByVal CléProjet As String, ByVal Donnée As Donnee, ByVal Parent As Object, ByVal NomDonnée As String, ByVal IndexAff As Integer)
    
    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    Set AnnulationObjet = Donnée
    AnnulationNomDonnée = NomDonnée
    Set AnnulationObjet2 = Parent
    AnnulationIndexAff = IndexAff
    FormMain.MnuEditionAnnuler.Caption = "&Annuler collage " & NomDonnée
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "ajoutdonnée"
    
End Sub




Sub ProgAnnulationDeleteSujet(ByVal CléProjet As String, ByVal Etape As Donnee, ByVal Sujet As Donnee, ByVal NomDonnée As String, ByVal BeforeKey As Variant)

    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    AnnulationBeforeKey = BeforeKey
    Set AnnulationObjet = Sujet
    AnnulationNomDonnée = NomDonnée
    Set AnnulationObjet2 = Etape
    FormMain.MnuEditionAnnuler.Caption = "&Annuler effacement " & NomDonnée
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "deletesujet"
        
End Sub

Sub ProgAnnulationDeleteDanger(ByVal CléProjet As String, ByVal Danger As Danger, ByVal NomDonnée As String, ByVal IndexDanger As Integer)

    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    Set AnnulationObjet = Danger
    AnnulationNomDonnée = NomDonnée
    AnnulationBeforeKey = IndexDanger
    FormMain.MnuEditionAnnuler.Caption = "&Annuler effacement " & NomDonnée
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "deletedanger"
        
End Sub


Sub ProgAnnulationDeleteEtape(ByVal CléProjet As String, ByVal Etape As Donnee, ByVal NomDonnée As String, ByVal BeforeKey As Variant)
    
    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    AnnulationBeforeKey = BeforeKey
    Set AnnulationObjet = Etape
    AnnulationNomDonnée = NomDonnée
    FormMain.MnuEditionAnnuler.Caption = "&Annuler effacement " & NomDonnée
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "deleteetape"
        
End Sub


Sub ProgAnnulationDeleteSujetDanger(ByVal CléProjet As String, ByVal SujetDanger As SujetDanger, ByVal NomDonnée As String, ByVal IndexDanger As Integer)
    
    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    Set AnnulationObjet = SujetDanger
    AnnulationNomDonnée = NomDonnée
    AnnulationBeforeKey = IndexDanger
    FormMain.MnuEditionAnnuler.Caption = "&Annuler effacement " & NomDonnée
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "deletesujetdanger"
        
End Sub



Sub ProgAnnulationDeleteTextBox(ByVal CléProjet As String, ctlTextBox As Control, ByVal Texte As String, ByVal Paramètre As String)

    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    AnnulationParamètre = Paramètre
    Set AnnulationControl = ctlTextBox
    AnnulationTexte = Texte
    FormMain.MnuEditionAnnuler.Caption = "&Annuler suppression"
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "deletetextbox"
    
End Sub

Sub ProgAnnulationModifDonnée(ByVal CléProjet As String, ByVal Donnée As Donnee, ByVal NomDonnée As String, ByVal IndexAff As Integer)
    
    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    Set AnnulationObjet = Donnée
    Set AnnulationObjet2 = Donnée.MiniCopy
    AnnulationNomDonnée = NomDonnée
    AnnulationIndexAff = IndexAff
    FormMain.MnuEditionAnnuler.Caption = "&Annuler modification " & NomDonnée
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "modifdonnée"
    
End Sub




Sub ProgAnnulationFrappeTextBox(ByVal CléProjet As String, ctlTextBox As Control, ByVal Texte As String, ByVal Paramètre As String)

    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    AnnulationParamètre = Paramètre
    Set AnnulationControl = ctlTextBox
    AnnulationTexte = Texte
    FormMain.MnuEditionAnnuler.Caption = "&Annuler frappe"
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "frappe"
    
End Sub


Sub ProgAnnulationSaisieSpread(ByVal CléProjet As String, Equipe As Personnes)

    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    Set AnnulationObjet = Equipe
    FormMain.MnuEditionAnnuler.Caption = "&Annuler la frappe..."
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "équipe"

End Sub
Sub ProgAnnulationSaisieDocumentation(ByVal CléProjet As String, Documents As Documents)

    PurgeAnnulation
    
    AnnulationCléProjet = CléProjet
    Set AnnulationObjet = Documents
    FormMain.MnuEditionAnnuler.Caption = "&Annuler la modification de la documentation"
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "documentation"

End Sub

'purge les données qui n'avait pas été effacées physiquement par une
'suppression dans l'attente d'une annulation éventuelle de la suppression
Sub PurgeAnnulation()

Dim i As Integer
Dim Projet As Projet

    If AnnulationAction = "" Then
        Exit Sub
    End If
    
    Set Projet = Projets.Item(AnnulationCléProjet)
    Select Case AnnulationAction
        Case "deletesujet"
            'suppression des sujets/dangers relatifs au sujet précédemment effacé
            For i = Projet.SujetsDangersCount To 1 Step -1
                If Projet.SujetDanger(i).Sujet = AnnulationObjet.id Then
                    Projet.DeleteSujetDanger (i)
                End If
            Next
        Case "deleteetape"
            'suppression des sujets/dangers relatifs à l'étape précédemment effacée
            For i = Projet.SujetsDangersCount To 1 Step -1
                If Projet.SujetDanger(i).Etape = AnnulationObjet.id Then
                    Projet.DeleteSujetDanger (i)
                End If
            Next
        Case "deletedanger"
            'suppression des sujets/dangers relatifs au danger précédemment effacé
            For i = Projet.SujetsDangersCount To 1 Step -1
                If Projet.SujetDanger(i).Danger = AnnulationObjet.id Then
                    Projet.DeleteSujetDanger (i)
                End If
            Next
    End Select
    
End Sub


