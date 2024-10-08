Attribute VB_Name = "modAnnulation"
Option Explicit

Private AnnulationAction As String

Private AnnulationTexte As String
Private AnnulationControl As Control
Private AnnulationCl�Projet As String
Private AnnulationObjet As Object
Private AnnulationParam�tre As String
Private AnnulationNomDonn�e As String
Private AnnulationObjet2 As Object
Private AnnulationIndexAff As Integer
Private AnnulationBeforeKey As Variant

Sub ProgAnnulationDeleteDonn�e(ByVal Cl�Projet As String, ByVal Donn�e As Donnee, ByVal Parent As Object, ByVal NomDonn�e As String, ByVal IndexAff As Integer, ByVal BeforeKey As Variant)
    
    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    Set AnnulationObjet = Donn�e
    AnnulationNomDonn�e = NomDonn�e
    Set AnnulationObjet2 = Parent
    AnnulationIndexAff = IndexAff
    AnnulationBeforeKey = BeforeKey
    FormMain.MnuEditionAnnuler.Caption = "&Annuler effacement " & NomDonn�e
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "deletedonn�e"
    
End Sub

Sub AnnulerAnnulation()
    AnnulationAction = ""
    FormMain.MnuEditionAnnuler.Caption = "&Annuler"
    FormMain.MnuEditionAnnuler.Enabled = False
End Sub

Sub Ex�cuterAnnulation()
    
Dim SujetDanger As SujetDanger
Dim Danger As Danger
Dim Projet As Projet
    
    Set Projet = Projets.Item(AnnulationCl�Projet)
    Select Case AnnulationAction
        Case "frappe", "deletetextbox"
            'r�affecte ancien texte
            AnnulationControl.Text = AnnulationTexte
            'refresh
            Select Case AnnulationParam�tre
                Case "titre"
                    Projet.Titre = AnnulationTexte
                Case "auteur"
                    Projet.Auteur = AnnulationTexte
                Case "reference"
                    Projet.R�f�rence = AnnulationTexte
                Case "commentaire"
                    Projet.Commentaire = AnnulationTexte
            End Select
            RefreshFenetresProjet AnnulationParam�tre, AnnulationCl�Projet
            AnnulerAnnulation
        Case "�quipe"
            'r�affecte ancienne �quipe
            Set Projet.Equipe = AnnulationObjet
            'refresh
            RefreshEquipeProjet AnnulationCl�Projet
            AnnulerAnnulation
        Case "documentation"
            'r�affecte ancienne documentation
            Set Projet.Documentation = AnnulationObjet
            'refresh
            RefreshDocumentationProjet AnnulationCl�Projet
            AnnulerAnnulation
        Case "ajoutetape"
            'efface l'�tape ajout�e
            Projet.DeleteEtape AnnulationObjet.id
            'refresh
            RefreshEtapesEtSujetsProjet AnnulationCl�Projet
            AnnulerAnnulation
        Case "ajoutdonn�e"
            'efface la donn�e ajout�e
            AnnulationObjet2.colEnfants.Remove AnnulationObjet.id
            'refresh
            Select Case AnnulationIndexAff
                Case INDEX_AFF_ETAPES_ET_SUJETS
                    RefreshEtapesEtSujetsProjet AnnulationCl�Projet
                Case INDEX_AFF_DISPOSITIONS
                    RefreshDispositionsActuellesProjet AnnulationCl�Projet
                Case INDEX_AFF_ARBRE
                    RefreshArbreHACCPProjet AnnulationCl�Projet
            End Select
            AnnulerAnnulation
        Case "modifdonn�e"
            'restaure les champs de la donn�e modifi�e
            AnnulationObjet.MiniPaste AnnulationObjet2
            'refresh
            Select Case AnnulationIndexAff
                Case INDEX_AFF_ETAPES_ET_SUJETS
                    RefreshEtapesEtSujetsProjet AnnulationCl�Projet
                    RefreshDangersProjet AnnulationCl�Projet
                    RefreshArbreHACCPProjet AnnulationCl�Projet
                Case INDEX_AFF_DISPOSITIONS
                    RefreshDispositionsActuellesProjet AnnulationCl�Projet
                Case INDEX_AFF_ARBRE
                    RefreshArbreHACCPProjet AnnulationCl�Projet
            End Select
            AnnulerAnnulation
        Case "deletedonn�e"
            'rajout la donn�e � son parent
            If AnnulationBeforeKey <> "" Then
                AnnulationObjet2.AddEnfant AnnulationObjet, BeforeKey:=AnnulationBeforeKey
            Else
                AnnulationObjet2.AddEnfant AnnulationObjet
            End If
            'refresh
            Select Case AnnulationIndexAff
                Case INDEX_AFF_ETAPES_ET_SUJETS
                    RefreshEtapesEtSujetsProjet AnnulationCl�Projet
                    RefreshDangersProjet AnnulationCl�Projet
                    RefreshArbreHACCPProjet AnnulationCl�Projet
                Case INDEX_AFF_DISPOSITIONS
                    RefreshDispositionsActuellesProjet AnnulationCl�Projet
                Case INDEX_AFF_ARBRE
                    RefreshArbreHACCPProjet AnnulationCl�Projet
            End Select
            AnnulerAnnulation
        Case "deletesujet"
            'rajoute le sujet � l'�tape
            If AnnulationBeforeKey <> "" Then
                AnnulationObjet2.AddEnfant AnnulationObjet, BeforeKey:=AnnulationBeforeKey
            Else
                AnnulationObjet2.AddEnfant AnnulationObjet
            End If
            'd�marque l'effacement des sujets/dangers du sujet
            For Each SujetDanger In Projet.colSujetsDangers
                If SujetDanger.Sujet = AnnulationObjet.id Then
                    SujetDanger.Effac� = False
                End If
            Next
            'refresh
            RefreshEtapesEtSujetsProjet AnnulationCl�Projet
            RefreshDispositionsActuellesProjet AnnulationCl�Projet
            RefreshDangersProjet AnnulationCl�Projet
            RefreshArbreHACCPProjet AnnulationCl�Projet
            AnnulerAnnulation
        Case "deleteetape"
            'rajoute l'�tape au projet
            If AnnulationBeforeKey <> "" Then
                Projet.AddEtape AnnulationObjet, BeforeKey:=AnnulationBeforeKey
            Else
                Projet.AddEtape AnnulationObjet
            End If
            'd�marque l'effacement des sujets/dangers des sujets de l'�tape
            Dim Sujet As Donnee
            For Each Sujet In AnnulationObjet.colEnfants
                For Each SujetDanger In Projet.colSujetsDangers
                    If SujetDanger.Sujet = Sujet.id Then
                        SujetDanger.Effac� = False
                    End If
                Next
            Next
            'refresh
            RefreshEtapesEtSujetsProjet AnnulationCl�Projet
            RefreshDispositionsActuellesProjet AnnulationCl�Projet
            RefreshDangersProjet AnnulationCl�Projet
            RefreshArbreHACCPProjet AnnulationCl�Projet
            AnnulerAnnulation
        Case "deletesujetdanger"
            'rajoute le sujet/danger au projet
            If AnnulationBeforeKey <> "" Then
                Projet.AddSujetDanger AnnulationObjet, IndexDanger:=AnnulationBeforeKey
            Else
                Projet.AddSujetDanger AnnulationObjet
            End If
            'refresh
            RefreshDangersProjet AnnulationCl�Projet
            RefreshArbreHACCPProjet AnnulationCl�Projet
            AnnulerAnnulation
        Case "ajoutsujetdanger"
            'supprime le sujet/danger ajout�
            Projet.DeleteSujetDanger AnnulationObjet.id
            'refresh
            RefreshDangersProjet AnnulationCl�Projet
            RefreshArbreHACCPProjet AnnulationCl�Projet
            AnnulerAnnulation
        Case "modifsujetdanger"
            'restaure les champs du sujet/danger
            AnnulationObjet.MiniPaste AnnulationObjet2
            'refresh
            RefreshDangersProjet AnnulationCl�Projet
            RefreshArbreHACCPProjet AnnulationCl�Projet
            AnnulerAnnulation
        Case "deletedanger"
            If AnnulationBeforeKey <> "" Then
                Projet.AddDanger AnnulationObjet, IndexDanger:=AnnulationBeforeKey
            Else
                Projet.AddDanger AnnulationObjet
            End If
            'd�marque l'effacement des sujets/dangers du danger
            For Each SujetDanger In Projet.colSujetsDangers
                If SujetDanger.Danger = AnnulationObjet.id Then
                    SujetDanger.Effac� = False
                End If
            Next
            'refresh
            RefreshDangersProjet AnnulationCl�Projet
            RefreshArbreHACCPProjet AnnulationCl�Projet
            AnnulerAnnulation
        Case "ajoutdanger"
            'supprime le danger ajout�
            Projet.DeleteDanger AnnulationObjet.id
            'refresh
            RefreshDangersProjet AnnulationCl�Projet
            RefreshArbreHACCPProjet AnnulationCl�Projet
            AnnulerAnnulation
        Case "modifdanger"
            'restaure les champs du danger
            AnnulationObjet.MiniPaste AnnulationObjet2
            'refresh
            RefreshDangersProjet AnnulationCl�Projet
            RefreshArbreHACCPProjet AnnulationCl�Projet
            AnnulerAnnulation
    End Select

End Sub

Sub ProgAnnulationAjoutEtape(ByVal Cl�Projet As String, ByVal Etape As Donnee, ByVal NomDonn�e As String)
    
    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    Set AnnulationObjet = Etape
    AnnulationNomDonn�e = NomDonn�e
    FormMain.MnuEditionAnnuler.Caption = "&Annuler ajout " & NomDonn�e
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "ajoutetape"
    
End Sub


Sub ProgAnnulationAjoutDonn�e(ByVal Cl�Projet As String, ByVal Donn�e As Donnee, ByVal Parent As Object, ByVal NomDonn�e As String, ByVal IndexAff As Integer)
    
    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    Set AnnulationObjet = Donn�e
    AnnulationNomDonn�e = NomDonn�e
    Set AnnulationObjet2 = Parent
    AnnulationIndexAff = IndexAff
    FormMain.MnuEditionAnnuler.Caption = "&Annuler ajout " & NomDonn�e
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "ajoutdonn�e"
    
End Sub



Sub ProgAnnulationAjoutSujetDanger(ByVal Cl�Projet As String, ByVal SujetDanger As SujetDanger, ByVal NomDonn�e As String)
    
    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    Set AnnulationObjet = SujetDanger
    AnnulationNomDonn�e = NomDonn�e
    FormMain.MnuEditionAnnuler.Caption = "&Annuler ajout " & NomDonn�e
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "ajoutsujetdanger"
    
End Sub




Sub ProgAnnulationAjoutDanger(ByVal Cl�Projet As String, ByVal Danger As Danger, ByVal NomDonn�e As String)
    
    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    Set AnnulationObjet = Danger
    AnnulationNomDonn�e = NomDonn�e
    FormMain.MnuEditionAnnuler.Caption = "&Annuler ajout " & NomDonn�e
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "ajoutdanger"
    
End Sub





Sub ProgAnnulationModifSujetDanger(ByVal Cl�Projet As String, ByVal SujetDanger As SujetDanger, ByVal NomDonn�e As String)
    
    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    Set AnnulationObjet = SujetDanger
    Set AnnulationObjet2 = SujetDanger.MiniCopy
    AnnulationNomDonn�e = NomDonn�e
    FormMain.MnuEditionAnnuler.Caption = "&Annuler modification " & NomDonn�e
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "modifsujetdanger"
    
End Sub





Sub ProgAnnulationModifDanger(ByVal Cl�Projet As String, ByVal Danger As Danger, ByVal NomDonn�e As String)
    
    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    Set AnnulationObjet = Danger
    Set AnnulationObjet2 = Danger.MiniCopy
    AnnulationNomDonn�e = NomDonn�e
    FormMain.MnuEditionAnnuler.Caption = "&Annuler modification " & NomDonn�e
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "modifdanger"
    
End Sub






Sub ProgAnnulationCollerDonn�e(ByVal Cl�Projet As String, ByVal Donn�e As Donnee, ByVal Parent As Object, ByVal NomDonn�e As String, ByVal IndexAff As Integer)
    
    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    Set AnnulationObjet = Donn�e
    AnnulationNomDonn�e = NomDonn�e
    Set AnnulationObjet2 = Parent
    AnnulationIndexAff = IndexAff
    FormMain.MnuEditionAnnuler.Caption = "&Annuler collage " & NomDonn�e
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "ajoutdonn�e"
    
End Sub




Sub ProgAnnulationDeleteSujet(ByVal Cl�Projet As String, ByVal Etape As Donnee, ByVal Sujet As Donnee, ByVal NomDonn�e As String, ByVal BeforeKey As Variant)

    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    AnnulationBeforeKey = BeforeKey
    Set AnnulationObjet = Sujet
    AnnulationNomDonn�e = NomDonn�e
    Set AnnulationObjet2 = Etape
    FormMain.MnuEditionAnnuler.Caption = "&Annuler effacement " & NomDonn�e
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "deletesujet"
        
End Sub

Sub ProgAnnulationDeleteDanger(ByVal Cl�Projet As String, ByVal Danger As Danger, ByVal NomDonn�e As String, ByVal IndexDanger As Integer)

    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    Set AnnulationObjet = Danger
    AnnulationNomDonn�e = NomDonn�e
    AnnulationBeforeKey = IndexDanger
    FormMain.MnuEditionAnnuler.Caption = "&Annuler effacement " & NomDonn�e
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "deletedanger"
        
End Sub


Sub ProgAnnulationDeleteEtape(ByVal Cl�Projet As String, ByVal Etape As Donnee, ByVal NomDonn�e As String, ByVal BeforeKey As Variant)
    
    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    AnnulationBeforeKey = BeforeKey
    Set AnnulationObjet = Etape
    AnnulationNomDonn�e = NomDonn�e
    FormMain.MnuEditionAnnuler.Caption = "&Annuler effacement " & NomDonn�e
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "deleteetape"
        
End Sub


Sub ProgAnnulationDeleteSujetDanger(ByVal Cl�Projet As String, ByVal SujetDanger As SujetDanger, ByVal NomDonn�e As String, ByVal IndexDanger As Integer)
    
    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    Set AnnulationObjet = SujetDanger
    AnnulationNomDonn�e = NomDonn�e
    AnnulationBeforeKey = IndexDanger
    FormMain.MnuEditionAnnuler.Caption = "&Annuler effacement " & NomDonn�e
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "deletesujetdanger"
        
End Sub



Sub ProgAnnulationDeleteTextBox(ByVal Cl�Projet As String, ctlTextBox As Control, ByVal Texte As String, ByVal Param�tre As String)

    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    AnnulationParam�tre = Param�tre
    Set AnnulationControl = ctlTextBox
    AnnulationTexte = Texte
    FormMain.MnuEditionAnnuler.Caption = "&Annuler suppression"
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "deletetextbox"
    
End Sub

Sub ProgAnnulationModifDonn�e(ByVal Cl�Projet As String, ByVal Donn�e As Donnee, ByVal NomDonn�e As String, ByVal IndexAff As Integer)
    
    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    Set AnnulationObjet = Donn�e
    Set AnnulationObjet2 = Donn�e.MiniCopy
    AnnulationNomDonn�e = NomDonn�e
    AnnulationIndexAff = IndexAff
    FormMain.MnuEditionAnnuler.Caption = "&Annuler modification " & NomDonn�e
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "modifdonn�e"
    
End Sub




Sub ProgAnnulationFrappeTextBox(ByVal Cl�Projet As String, ctlTextBox As Control, ByVal Texte As String, ByVal Param�tre As String)

    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    AnnulationParam�tre = Param�tre
    Set AnnulationControl = ctlTextBox
    AnnulationTexte = Texte
    FormMain.MnuEditionAnnuler.Caption = "&Annuler frappe"
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "frappe"
    
End Sub


Sub ProgAnnulationSaisieSpread(ByVal Cl�Projet As String, Equipe As Personnes)

    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    Set AnnulationObjet = Equipe
    FormMain.MnuEditionAnnuler.Caption = "&Annuler la frappe..."
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "�quipe"

End Sub
Sub ProgAnnulationSaisieDocumentation(ByVal Cl�Projet As String, Documents As Documents)

    PurgeAnnulation
    
    AnnulationCl�Projet = Cl�Projet
    Set AnnulationObjet = Documents
    FormMain.MnuEditionAnnuler.Caption = "&Annuler la modification de la documentation"
    FormMain.MnuEditionAnnuler.Enabled = True
    AnnulationAction = "documentation"

End Sub

'purge les donn�es qui n'avait pas �t� effac�es physiquement par une
'suppression dans l'attente d'une annulation �ventuelle de la suppression
Sub PurgeAnnulation()

Dim i As Integer
Dim Projet As Projet

    If AnnulationAction = "" Then
        Exit Sub
    End If
    
    Set Projet = Projets.Item(AnnulationCl�Projet)
    Select Case AnnulationAction
        Case "deletesujet"
            'suppression des sujets/dangers relatifs au sujet pr�c�demment effac�
            For i = Projet.SujetsDangersCount To 1 Step -1
                If Projet.SujetDanger(i).Sujet = AnnulationObjet.id Then
                    Projet.DeleteSujetDanger (i)
                End If
            Next
        Case "deleteetape"
            'suppression des sujets/dangers relatifs � l'�tape pr�c�demment effac�e
            For i = Projet.SujetsDangersCount To 1 Step -1
                If Projet.SujetDanger(i).Etape = AnnulationObjet.id Then
                    Projet.DeleteSujetDanger (i)
                End If
            Next
        Case "deletedanger"
            'suppression des sujets/dangers relatifs au danger pr�c�demment effac�
            For i = Projet.SujetsDangersCount To 1 Step -1
                If Projet.SujetDanger(i).Danger = AnnulationObjet.id Then
                    Projet.DeleteSujetDanger (i)
                End If
            Next
    End Select
    
End Sub


