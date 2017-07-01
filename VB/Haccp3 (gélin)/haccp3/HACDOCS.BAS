Attribute VB_Name = "modListeDocuments"
Option Explicit

'affichage de la liste des documents associés à un objet
Sub AfficherDocuments(Element As Object)

    HourGlass "show"
    
    'charge, initialise et affiche la boite de dialogue de choix d'un document
    Load formListeDocuments
    
    'remplit le spread avec les documents de l'objet
    RemplitSpreadDocuments Element
    
    formListeDocuments.Show MODAL
    'gère l'appui sur ok ou annule
    If formListeDocuments.Tag <> "" Then
        'sortie par OK
        TransfertDocumentsDansElement Element
    End If
    Unload formListeDocuments
    
End Sub



Private Sub RemplitSpreadDocuments(Element As Object)

Dim i As Integer
Dim j As Integer
Dim n As Integer

    With formListeDocuments.SpreadDocuments
        .MaxRows = Element.DocumentsCount + 1
        .Row = 1
        .Row2 = .MaxRows
        .Col = 1
        .Col2 = .MaxCols - 1
        .BlockMode = True
        .Action = SS_ACTION_CLEAR_TEXT
        .BlockMode = False
        .Col = 1
    End With
    n = Element.DocumentsCount
    For i = 1 To n
        With formListeDocuments.SpreadDocuments
            .Row = i
            .Col = 1
            .Text = Element.DocumentFichier(i)
            .Col = 2
            .Text = GetFichierSansChemin(Element.DocumentFichier(i))
            .Col = 3
            .Text = Element.DocumentTitre(i)
            .Col = 4
            .Text = Element.DocumentFichier(i)
            .TypeButtonPicture = FormMain.ActiveForm.picFleche.Picture
            .TypeButtonPictureDown = FormMain.ActiveForm.picFleche.Picture
        End With
    Next

End Sub






Private Sub TransfertDocumentsDansElement(Element As Object)

Dim Fichier As String
Dim i As Integer

    Element.DocumentsClear
    With formListeDocuments.SpreadDocuments
        For i = 1 To .MaxRows
            .Row = i
            .Col = 1
            Fichier = Trim$(.Text)
            If Fichier <> "" Then
                .Col = 3
                Element.AddDocument Fichier, .Text
            End If
        Next
    End With

End Sub
