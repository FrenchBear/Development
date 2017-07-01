Attribute VB_Name = "MODGLOB"
Option Explicit


'-------------------------------------------------------------------------
'                           Constantes de l'application
'-------------------------------------------------------------------------
Global Const NOM_REPERTOIRE_APPLI = "HACCP"
Global Const NOM_MODULE_EXE = "HACMOD.EXE"
Global Const NOM_COURT_APPLICATION = "HACMOD"
Global Const VERSION_APPLICATION = "3.0"
Global Const FICHIER_CONFIG = "hacmodul.ini"
Global Const FICHIER_HLP = "hacmod.hlp"


'-------------------------------------------------------------------------
'                           Types de données
'-------------------------------------------------------------------------


'-------------------------------------------------------------------------
'                           Variables globales à l'application
'-------------------------------------------------------------------------
Global CrLf As String   'chr$(13) + chr$(10)

'répertoires de l'applications
Global RepertoireWindows As String
Global RepertoireApplication  As String

'fichiers de l'application avec chemin d'accès complet
Global FichierConfig As String
Global FichierAideProgramme As String

'nom de l'application
Global NomApplication As String

'gap inter-controles
Global gap As Integer
Global gap2 As Integer

'flag utilisé pour éviter les actions en chaine
Global ActionLimitée As Integer

'liste des derniers fichiers utilisés
Global MRUListe As New MRUFilesClass



'affiche l'aide en ligne du programme pour un sujet donnée
'entrée:
'   sujet à afficher
Public Sub AideProgramme(ByVal Sujet As Integer)

    WinHelpVB FormMain.CMDialog1, FichierAideProgramme, HELP_CONTEXT, Sujet
    
End Sub


'ote la ligne courante d'un spread (ne diminue pas le spread d'une ligne, la dernière ligne est blanche)
'entrée:
'   spread
Sub SpreadOteLigne(ctl As Control)

Dim i As Integer
Dim j As Integer
Dim t As String
Dim bt As Long

    HourGlass "show"
    With ctl
        .Col = 1
        For i = .ActiveRow + 1 To .MaxRows
            For j = 1 To .MaxCols
                .Col = j
                .Row = i
                bt = 0
                If .CellType = SS_CELL_TYPE_BUTTON Then
                    bt = .TypeButtonPicture '.TypeButtonText
                End If
                t = .Text
                .Row = i - 1
                .Text = t
                If .CellType = SS_CELL_TYPE_BUTTON Then
                    If bt Then
                        '.TypeButtonPicture = ctlPictureFleche.Picture
                    Else
                        '.TypeButtonPicture = LoadPicture("")
                    End If
                End If
            Next
        Next
        .Row = .MaxRows
        For j = 1 To .MaxCols
            .Col = j
            .Text = ""
        Next
    End With
    HourGlass "hide"


End Sub


'insère une ligne blache dans un spread (n'ajoute pas une ligne au spread)
'entrée:
'   spread
Sub SpreadInsereLigneBlanche(ctl As Control)

Dim i As Integer
Dim j As Integer
Dim t As String
Dim l As Integer
Dim bt As String

    HourGlass "show"
    With ctl
        .Col = 1
        For i = .MaxRows To .ActiveRow + 1 Step -1
            For j = 1 To .MaxCols
                .Col = j
                .Row = i - 1
                t = .Text
                l = .Lock
                If .CellType = SS_CELL_TYPE_BUTTON Then
                    bt = .TypeButtonPicture '.TypeButtonText
                End If
                .Row = i
                .Text = t
                .Lock = l
            Next
        Next
        .Row = .ActiveRow
        For j = 1 To .MaxCols
            .Col = j
            .Text = ""
            If .CellType = SS_CELL_TYPE_BUTTON Then
                .Lock = True
                .TypeButtonText = ""
                .TypeButtonPicture = LoadPicture("")
            End If
        Next
    End With
    HourGlass "hide"

End Sub



'obtient le type d'une réponse à une question de pertinence
'entrée:
'   chaine de texte entrée dans le spread
'retour:
'   type de la réponse
Function GetTypeReponsePertinence(ByVal chRéponse As String) As String

    Select Case chRéponse
        Case MODULE_REPONSE_DANGER_PERTINENT
            GetTypeReponsePertinence = MODULE_TYPE_REPONSE_DANGER_PERTINENT
        Case MODULE_REPONSE_DANGER_NON_PERTINENT
            GetTypeReponsePertinence = MODULE_TYPE_REPONSE_DANGER_NON_PERTINENT
        Case Else
            GetTypeReponsePertinence = chRéponse
    End Select

End Function

'initialisations de chargement d'application
Sub Initialisations()

Dim i As Integer

    CrLf = Chr$(13) + Chr$(10)

    'taille des gap
    gap2 = 1 * Screen.TwipsPerPixelX
    gap = 5 * Screen.TwipsPerPixelX
   
    'création du menu des anciens projets
    For i = 1 To MRUListe.MaxCount
        Load FormMain.MnuDerniersFichiers(i)
    Next
    MRUListe.Load
    
    'aide contextuelle (peut être remplacée par une version modifiée quise trouve dans le module)
    FichierAideProgramme = RepertoireApplication & "\" & FICHIER_HLP
    App.HelpFile = FichierAideProgramme

End Sub

'raffraichit les menus et la barre de boutons en fonction du contexte
'entrée:
'   flag optionnel indiquant si les menus doivent être réduits au minimum
Sub MetAJourMenus(Optional bMenusRéduits As Variant)

Dim i As Integer
Dim bModuleOuvert As Integer
Dim bModuleChoisi As Integer
Dim bModuleModifié As Integer
    
    If IsMissing(bMenusRéduits) Then
        bMenusRéduits = False
    End If

    bModuleOuvert = Forms.Count > 1
    If bModuleOuvert Then
        If Not FormMain.ActiveForm Is Nothing Then
            bModuleModifié = Not bMenusRéduits And FormMain.ActiveForm.Module.Modifié
        Else
            bModuleOuvert = False
        End If
    End If
        
    'menus
    FormMain.MnuFichier.Visible = True
    FormMain.MnuAffichages.Visible = bModuleOuvert
    FormMain.MnuFenetres.Visible = bModuleOuvert
    FormMain.MnuAides.Visible = True
    
    'menu fichier
    FormMain.MnuFichierFermer = bModuleOuvert
    FormMain.MnuFichierEnregistrer = bModuleOuvert
    FormMain.btnFichierEnregistrer.Visible = bModuleOuvert
    FormMain.MnuFichierEnregistrerSous = bModuleOuvert
    FormMain.MnuFichierImprimer = bModuleOuvert
        
End Sub


'crée un nouveau module ou ouvre un module existant
'entrée:
'   nom du répertoire du module
Function OuvrirModule(ByVal RépertoireModule As String) As Integer

'nouvelle feuille pour le module ouvert
Dim frm As New FormModule
'compte les nouveaux modules dans une session de HACMOD
Static NuméroModule As Integer
    
    HourGlass "show"
    OuvrirModule = False
    If RépertoireModule = "" Then
        'cas d'un nouveau module
        NuméroModule = NuméroModule + 1
        frm.NomModuleACharger = "MODULE" & NuméroModule
    Else
        'cas d'un module existant
        frm.NomModuleACharger = UCase$(GetFichierSansChemin(RépertoireModule))
        If Not ExisteFichier(RépertoireModule & "\" & FICHIER_MODULE_INI) Then
            'il ne s'agit pas d'un module HACCP
            ErreurUserBox "Impossible d'accéder au module " & UCase$(frm.NomModuleACharger) & "." & CrLf & CrLf & "Il n'y a pas de fichier " & UCase$(FICHIER_MODULE_INI) & " dans le répertoire que vous avez choisi (" & RépertoireModule & ") ou ce répertoire n'existe pas." & CrLf & CrLf & "Choisissez un autre module.", MB_ICONEXCLAMATION
            HourGlass "hide"
            Exit Function
        End If
    End If
    'affiche la fenêtre, charge le module
    frm.RépertoireModuleACharger = RépertoireModule
    frm.Show
    'module ouvert
    OuvrirModule = True
    HourGlass "hide"
    
End Function

'sauve le module de la fenêtre de module active
Sub SauverModule()

    FormMain.ActiveForm.Module.Erreur = 0
    FormMain.ActiveForm.Module.Save
    If FormMain.ActiveForm.Module.Erreur Then
        ErreurUserBox "Le module n'a pas pu être enregistré. Vérifier qu'il n'est pas en lecture seule ou que le disque n'est pas plein.", MB_ICONEXCLAMATION
    Else
        MRUListe.PutFirst FormMain.ActiveForm.Module.Répertoire
    End If

End Sub


'obtient la chaine à mettre dans le spread de pertinence pour une réponse à une question
'à partir du type de la réponse
'inverse de GetTypeRéponsePertinence()
Function SetLibelléRéponsePertinence(ByVal chTypeRéponse As String) As String

    Select Case chTypeRéponse
        Case MODULE_TYPE_REPONSE_DANGER_PERTINENT
            SetLibelléRéponsePertinence = MODULE_REPONSE_DANGER_PERTINENT
        Case MODULE_TYPE_REPONSE_DANGER_NON_PERTINENT
            SetLibelléRéponsePertinence = MODULE_REPONSE_DANGER_NON_PERTINENT
        Case Else
            SetLibelléRéponsePertinence = chTypeRéponse
    End Select

End Function

