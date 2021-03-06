Attribute VB_Name = "modChoixDoc"
Option Explicit

Public SpreadDocuments As Control

'choix d'un document sur un disque
'sortie:
'   Fichier et Titre du document si Ok
'   btnAjouterUtilis� � vrai si le bouton ajouter a �t� utilis�
'retour:
'   vrai si sortie par OK
'   faux si sortie par annule
Function ChoixDocument(ByVal TitreDialog As String, ctlSpread As Control, Fichier As String, TitreFichier As String, btnAjouterUtilis� As Integer) As Integer

    'spread sur lequel les documents sont ajout�s
    Set SpreadDocuments = ctlSpread
    
    'charge, initialise et affiche la boite de dialogue de choix d'un document
    Load formChoixDocument
    With formChoixDocument
        .Caption = TitreDialog
        .txtFichier.Text = Fichier
        .txtTitre.Text = TitreFichier
        .btnAjouter.Enabled = False
    End With
    formChoixDocument.Show MODAL
    HourGlass "show"
    'g�re l'appui sur ok ou annule
    If formChoixDocument.Tag <> "" Then
        'sortie par OK
        Fichier = formChoixDocument.txtFichier
        TitreFichier = formChoixDocument.txtTitre
    End If
    ChoixDocument = (formChoixDocument.Tag <> "")
    'le bouton ajouter a �t� utilis�
    btnAjouterUtilis� = formChoixDocument.btnAjouter.Tag <> ""
    
    Set SpreadDocuments = Nothing
    Unload formChoixDocument
    
End Function


