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
'                           Types de donn�es
'-------------------------------------------------------------------------


'-------------------------------------------------------------------------
'                           Variables globales � l'application
'-------------------------------------------------------------------------
Global CrLf As String   'chr$(13) + chr$(10)

'r�pertoires de l'applications
Global RepertoireWindows As String
Global RepertoireApplication  As String

'fichiers de l'application avec chemin d'acc�s complet
Global FichierConfig As String
Global FichierAideProgramme As String

'nom de l'application
Global NomApplication As String

'gap inter-controles
Global gap As Integer
Global gap2 As Integer

'flag utilis� pour �viter les actions en chaine
Global ActionLimit�e As Integer

'liste des derniers fichiers utilis�s
Global MRUListe As New MRUFilesClass



'affiche l'aide en ligne du programme pour un sujet donn�e
'entr�e:
'   sujet � afficher
Public Sub AideProgramme(ByVal Sujet As Integer)

    WinHelpVB FormMain.CMDialog1, FichierAideProgramme, HELP_CONTEXT, Sujet
    
End Sub


'ote la ligne courante d'un spread (ne diminue pas le spread d'une ligne, la derni�re ligne est blanche)
'entr�e:
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


'ins�re une ligne blache dans un spread (n'ajoute pas une ligne au spread)
'entr�e:
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



'obtient le type d'une r�ponse � une question de pertinence
'entr�e:
'   chaine de texte entr�e dans le spread
'retour:
'   type de la r�ponse
Function GetTypeReponsePertinence(ByVal chR�ponse As String) As String

    Select Case chR�ponse
        Case MODULE_REPONSE_DANGER_PERTINENT
            GetTypeReponsePertinence = MODULE_TYPE_REPONSE_DANGER_PERTINENT
        Case MODULE_REPONSE_DANGER_NON_PERTINENT
            GetTypeReponsePertinence = MODULE_TYPE_REPONSE_DANGER_NON_PERTINENT
        Case Else
            GetTypeReponsePertinence = chR�ponse
    End Select

End Function

'initialisations de chargement d'application
Sub Initialisations()

Dim i As Integer

    CrLf = Chr$(13) + Chr$(10)

    'taille des gap
    gap2 = 1 * Screen.TwipsPerPixelX
    gap = 5 * Screen.TwipsPerPixelX
   
    'cr�ation du menu des anciens projets
    For i = 1 To MRUListe.MaxCount
        Load FormMain.MnuDerniersFichiers(i)
    Next
    MRUListe.Load
    
    'aide contextuelle (peut �tre remplac�e par une version modifi�e quise trouve dans le module)
    FichierAideProgramme = RepertoireApplication & "\" & FICHIER_HLP
    App.HelpFile = FichierAideProgramme

End Sub

'raffraichit les menus et la barre de boutons en fonction du contexte
'entr�e:
'   flag optionnel indiquant si les menus doivent �tre r�duits au minimum
Sub MetAJourMenus(Optional bMenusR�duits As Variant)

Dim i As Integer
Dim bModuleOuvert As Integer
Dim bModuleChoisi As Integer
Dim bModuleModifi� As Integer
    
    If IsMissing(bMenusR�duits) Then
        bMenusR�duits = False
    End If

    bModuleOuvert = Forms.Count > 1
    If bModuleOuvert Then
        If Not FormMain.ActiveForm Is Nothing Then
            bModuleModifi� = Not bMenusR�duits And FormMain.ActiveForm.Module.Modifi�
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


'cr�e un nouveau module ou ouvre un module existant
'entr�e:
'   nom du r�pertoire du module
Function OuvrirModule(ByVal R�pertoireModule As String) As Integer

'nouvelle feuille pour le module ouvert
Dim frm As New FormModule
'compte les nouveaux modules dans une session de HACMOD
Static Num�roModule As Integer
    
    HourGlass "show"
    OuvrirModule = False
    If R�pertoireModule = "" Then
        'cas d'un nouveau module
        Num�roModule = Num�roModule + 1
        frm.NomModuleACharger = "MODULE" & Num�roModule
    Else
        'cas d'un module existant
        frm.NomModuleACharger = UCase$(GetFichierSansChemin(R�pertoireModule))
        If Not ExisteFichier(R�pertoireModule & "\" & FICHIER_MODULE_INI) Then
            'il ne s'agit pas d'un module HACCP
            ErreurUserBox "Impossible d'acc�der au module " & UCase$(frm.NomModuleACharger) & "." & CrLf & CrLf & "Il n'y a pas de fichier " & UCase$(FICHIER_MODULE_INI) & " dans le r�pertoire que vous avez choisi (" & R�pertoireModule & ") ou ce r�pertoire n'existe pas." & CrLf & CrLf & "Choisissez un autre module.", MB_ICONEXCLAMATION
            HourGlass "hide"
            Exit Function
        End If
    End If
    'affiche la fen�tre, charge le module
    frm.R�pertoireModuleACharger = R�pertoireModule
    frm.Show
    'module ouvert
    OuvrirModule = True
    HourGlass "hide"
    
End Function

'sauve le module de la fen�tre de module active
Sub SauverModule()

    FormMain.ActiveForm.Module.Erreur = 0
    FormMain.ActiveForm.Module.Save
    If FormMain.ActiveForm.Module.Erreur Then
        ErreurUserBox "Le module n'a pas pu �tre enregistr�. V�rifier qu'il n'est pas en lecture seule ou que le disque n'est pas plein.", MB_ICONEXCLAMATION
    Else
        MRUListe.PutFirst FormMain.ActiveForm.Module.R�pertoire
    End If

End Sub


'obtient la chaine � mettre dans le spread de pertinence pour une r�ponse � une question
'� partir du type de la r�ponse
'inverse de GetTypeR�ponsePertinence()
Function SetLibell�R�ponsePertinence(ByVal chTypeR�ponse As String) As String

    Select Case chTypeR�ponse
        Case MODULE_TYPE_REPONSE_DANGER_PERTINENT
            SetLibell�R�ponsePertinence = MODULE_REPONSE_DANGER_PERTINENT
        Case MODULE_TYPE_REPONSE_DANGER_NON_PERTINENT
            SetLibell�R�ponsePertinence = MODULE_REPONSE_DANGER_NON_PERTINENT
        Case Else
            SetLibell�R�ponsePertinence = chTypeR�ponse
    End Select

End Function

