VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "Donnee"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit
'classe d'objet donnée

'une donnée est
'- une clé (utilisée uniquement pour les sujets)
'- un Titre
'- un commentaire
'- une collection de données enfants (cf tableau ci-dessous pour chaque parent)
'-      DP=dispositions en place, AH=Arbre HACCP
'-      parents                     Enfants
'-      ---------------------------------------------
'-      Etapes                      Sujets
'-      Sujets                      Mesures préventives des dispositions en place
'-      Mesures préventives des DP  Valeurs cibles des dispositions en place
'-      Valeurs cibles des DP       Procéd. Surveillance des dispositions en place
'-      Procéd Surv. des DP         Corrections des dispositions en place
'-      Corrections des DP          Actions correctives des dispositions en place
'-      Action correctives des DP   Enregistrements des DP
'-      Points à maitriser de AH    Mesures préventives de AH
'-      Mesures préventives de AH   Valeurs cibles de AH
'-      Valeurs cibles de AH        Procéd. Surveillance de AH
'-      Procéd Surv. de AH          Corrections de AH
'-      Corrections de AH           Actions correctives de AH
'-      Action correctives de AH    Enregistrements de AH
'- une collection de documents associés
'- un état de criticité et un questionnaire de criticité (utilisé seulement pour les données de niveau Points à maitriser et mesures préventives)

'propriétés
Private chId As String
Private chTitre As String
Private chCommentaire As String
Public colEnfants As New Collection 'Données
Private colDocuments As New Documents
Private chCritique As String
Public QuestCriticité As QuestCriticite 'pas de new pour gain de mémoire pour la plupart des données


Public Function CopyToClipboard(ByVal Affichage As Integer, ByVal Niveau As Integer, ByVal Identification As String)

Dim chTexte As String

    chTexte = Identification & Sep & Affichage & Sep & Me.GetTexte(Niveau, "")
    Clipboard.SetText chTexte

End Function

Function MiniCopy() As Donnee

Dim Copie As New Donnee

    'l'id reste vide
    Copie.Titre = chTitre
    Copie.Commentaire = Commentaire
    Copie.Criticité = chCritique
    Set Copie.Documents = colDocuments.Copy
    If Not QuestCriticité Is Nothing Then
        Set Copie.QuestCriticité = QuestCriticité.Copy
    End If
    
    Set MiniCopy = Copie

End Function


Public Property Get Documents() As Documents

    Set Documents = colDocuments

End Property

Public Property Set Documents(Documents As Documents)

    Set colDocuments = Documents

End Property


Sub MiniPaste(ByVal Donnée As Donnee)

    'l'id reste vide
    Titre = Donnée.Titre
    Commentaire = Donnée.Commentaire
    chCritique = Donnée.Criticité
    Set colDocuments = Donnée.Documents
    Set QuestCriticité = Donnée.QuestCriticité
    
End Sub


Public Function PasteFromClipboard(ByVal Projet As Projet, ByVal Affichage As Integer, ByVal Niveau As Integer)

Dim chTexte As String
Dim chLigne As String
    
    'texte provenant du presse-papiers
    chTexte = Clipboard.GetText(vbCFText)
    
    'saute premiers caractères
    chTexte = suppfirstchar(chTexte, InStr(InStr(1, chTexte, Sep) + 1, chTexte, Sep))
    
    'convertit le texte en donnée
    Me.LetTexte Projet, Niveau, "", chTexte
        
End Function


Public Function GetTexte(ByVal Niveau As Integer, ByVal DébutLigne As String) As String

Dim chTexte As String
Dim n As Integer
Dim i As Integer

    'propriétés
    chTexte = DébutLigne & Niveau & Sep & chId & vbCrLf
    chTexte = chTexte & DébutLigne & chTitre & vbCrLf
    n = GetNbLignesDansChaine(chCommentaire)
    chTexte = chTexte & DébutLigne & n & vbCrLf
    If n > 0 Then
        chTexte = chTexte & DébutLigne & chCommentaire & vbCrLf
    End If
    'documents
    n = colDocuments.Count
    chTexte = chTexte & DébutLigne & n & vbCrLf
    For i = 1 To n
        chTexte = chTexte & DébutLigne & colDocuments.Item(i).Fichier & Sep & colDocuments.Item(i).Titre & vbCrLf
    Next
    'questionnaire de criticité
    chTexte = chTexte & DébutLigne & (Not QuestCriticité Is Nothing) & vbCrLf
    If Not QuestCriticité Is Nothing Then
        chTexte = chTexte & DébutLigne
        For i = 0 To 4
            chTexte = chTexte & QuestCriticité.Question(i) & Sep
        Next
        chTexte = chTexte & vbCrLf
        chTexte = chTexte & DébutLigne
        For i = 0 To 4
            chTexte = chTexte & QuestCriticité.Réponse(i) & Sep
        Next
        chTexte = chTexte & vbCrLf
        chTexte = chTexte & DébutLigne & QuestCriticité.RéponsesCount & Sep & QuestCriticité.Résultat & vbCrLf
    End If
    chTexte = chTexte & DébutLigne & chCritique & vbCrLf
    'enfants
    n = colEnfants.Count
    chTexte = chTexte & DébutLigne & n & vbCrLf
    For i = 1 To n
        chTexte = chTexte & colEnfants(i).GetTexte(Niveau + 1, DébutLigne & Sep) & vbCrLf
    Next
    GetTexte = chTexte
    
End Function


Public Sub LetTexte(ByVal Projet As Projet, ByVal Niveau As Integer, ByVal DébutLigne As String, chTexte As String)

Dim chLigne As String
Dim n As Integer
Dim i As Integer

    'id
    chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(DébutLigne))
    chId = Left$(GetItemDansChaineSep(chLigne, 2, Sep), 1) & Projet.NewId
    chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(DébutLigne))
    'titre
    chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(DébutLigne))
    chTitre = GetItemDansChaineSep(chLigne, 1, Sep)
    chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(DébutLigne))
    'nombre de lignes dans commentaire
    chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(DébutLigne))
    n = Val(GetItemDansChaineSep(chLigne, 1, vbCrLf))
    chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(DébutLigne))
    'commentaire
    chCommentaire = ""
    For i = 1 To n
        chLigne = GetItemDansChaineSep(chTexte, 1, vbCrLf)
        If i > 1 Then
            chCommentaire = chCommentaire & vbCrLf
        End If
        If i = 1 Then
            chCommentaire = chCommentaire & suppfirstchar(chLigne, Len(DébutLigne))
        Else
            chCommentaire = chCommentaire & chLigne
        End If
        chTexte = suppfirstchar(chTexte, Len(chLigne) + 2)
    Next
    'nombre de documents
    chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(DébutLigne))
    n = Val(GetItemDansChaineSep(chLigne, 1, Sep))
    chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(DébutLigne))
    'documents
    For i = 1 To n
        chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(DébutLigne))
        Me.AddDocument GetItemDansChaineSep(chLigne, 1, Sep), GetItemDansChaineSep(chLigne, 2, Sep)
        chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(DébutLigne))
    Next
    'questionnaire de criticité
    chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(DébutLigne))
    n = Left$(GetItemDansChaineSep(chLigne, 1, Sep), 1) <> "F"
    chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(DébutLigne))
    If n Then
        Dim TempQuestCriticité As New QuestCriticite
        'questions
        chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(DébutLigne))
        For i = 0 To 4
            TempQuestCriticité.Question(i) = Val(GetItemDansChaineSep(chLigne, i + 1, Sep))
        Next
        chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(DébutLigne))
        'réponses
        chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(DébutLigne))
        For i = 0 To 4
            TempQuestCriticité.Réponse(i) = GetItemDansChaineSep(chLigne, i + 1, Sep)
        Next
        chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(DébutLigne))
        'nombre de réponses et résultat
        chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(DébutLigne))
        TempQuestCriticité.RéponsesCount = Val(GetItemDansChaineSep(chLigne, 1, Sep))
        TempQuestCriticité.Résultat = Val(GetItemDansChaineSep(chLigne, 2, Sep))
        chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(DébutLigne))
        Set QuestCriticité = TempQuestCriticité
    End If
    'criticité
    chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(DébutLigne))
    chCritique = GetItemDansChaineSep(chLigne, 1, Sep)
    chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(DébutLigne))
    'nombre d'enfants
    chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(DébutLigne))
    n = Val(GetItemDansChaineSep(chLigne, 1, Sep))
    chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(DébutLigne))
    'enfants
    Dim NewEnfant As Donnee
    For i = 1 To n
        Set NewEnfant = New Donnee
        NewEnfant.LetTexte Projet, Niveau + 1, DébutLigne & Sep, chTexte
        Me.AddEnfant NewEnfant
        chTexte = suppfirstchar(chTexte, 2)
    Next

End Sub



Public Property Get Criticité() As String
    
    Criticité = chCritique

End Property







Public Property Let Criticité(ByVal Criticité As String)

    chCritique = Criticité

End Property







Public Function Enfant(ByVal id As Variant) As Donnee

    On Error Resume Next
    Set Enfant = colEnfants.Item(id)
    On Error GoTo 0
    
End Function

Public Sub Save(ByVal stream As Object)

Dim chInfo As String
Dim i As Integer
Dim n As Integer

    chInfo = chId
    stream.PutString chInfo, VarType(chInfo), False
    chInfo = chTitre
    SVariantPut stream, chTitre
    SVariantPut stream, chCommentaire
    'stream.PutString chInfo, VarType(chInfo), False
    chInfo = chCritique
    stream.PutString chInfo, VarType(chInfo), False
    
    'enfants
    chInfo = colEnfants.Count
    n = Val(chInfo)
    stream.PutString chInfo, VarType(chInfo), False
    For i = 1 To n
        colEnfants(i).Save stream
    Next

    'documents
    colDocuments.Save stream
    
    'questionnaire de criticité
    chInfo = Not QuestCriticité Is Nothing
    stream.PutString chInfo, VarType(chInfo), False
    If Not QuestCriticité Is Nothing Then
        QuestCriticité.Save stream
    End If
    
    stream.Flush STG_DEFAULT

End Sub

Private Sub SVariantPut(ByVal stream As Object, ByVal Info As Variant)

Dim vInfo As Variant

    If Info = "" Then
        vInfo = "~#"
    Else
        vInfo = Info
    End If
    stream.VariantPut STG_SEEK_DONTMOVE, vInfo

End Sub

Public Sub Load(ByVal stream As Object)

Dim chInfo As String
Dim i As Integer
Dim n As Integer

    stream.GetString chId
    
    chTitre = SVariantGet(stream)
    chCommentaire = SVariantGet(stream)
    stream.GetString chCritique
    
    'enfants
    stream.GetString chInfo
    n = Val(chInfo)
    Dim NewEnfant As Donnee
    While colEnfants.Count
        colEnfants.Remove 1
    Wend
    For i = 1 To n
        Set NewEnfant = New Donnee
        NewEnfant.Load stream
        Me.AddEnfant NewEnfant
    Next

    'documents
    stream.GetString chInfo
    n = Val(chInfo)
    Dim NewDocument As Document
    colDocuments.clear
    For i = 1 To n
        Set NewDocument = New Document
        NewDocument.Load stream
        Me.AddDocument NewDocument.Fichier, NewDocument.Titre
    Next
    
    'questionnaire de criticité
    stream.GetString chInfo
    Set QuestCriticité = Nothing
    If chInfo = "Vrai" Then
        Set QuestCriticité = New QuestCriticite
        QuestCriticité.Load stream
    End If

End Sub

Private Function SVariantGet(ByVal stream As Object) As Variant

Dim vInfo As Variant

    stream.VariantGet STG_SEEK_DONTMOVE, vInfo
    If vInfo = "~#" Then
        SVariantGet = ""
    Else
        SVariantGet = vInfo
    End If

End Function


Public Function AddEnfant(ByVal Enfant As Donnee, Optional AfterKey As Variant, Optional BeforeKey As Variant)

Dim i As Integer

    'customize le titre si après ajour, il y a deux éléments de même titre
    For i = 1 To colEnfants.Count
        If colEnfants.Item(i).Titre = Enfant.Titre Then
            Enfant.Titre = Enfant.Titre & " (copie)"
            Exit For
        End If
    Next
    If IsMissing(AfterKey) Then
        If IsMissing(BeforeKey) Then
            'ajouté en fin de liste
            colEnfants.Add Enfant, Enfant.id
        Else
            'ajouté avant un élément déterminé
            colEnfants.Add Enfant, Enfant.id, Before:=BeforeKey
        End If
    Else
        'ajouté après un élément déterminé
        colEnfants.Add Enfant, Enfant.id, After:=AfterKey
    End If

End Function


Public Property Get id() As String
    
    id = chId

End Property

Public Property Let id(ByVal id As String)

    chId = id

End Property




Public Sub DocumentsClear()

    While colDocuments.Count
         colDocuments.Delete 1
    Wend

End Sub

Public Property Get DocumentsCount()

    DocumentsCount = colDocuments.Count
    
End Property

Public Property Get EnfantsCount()

    EnfantsCount = colEnfants.Count
    
End Property


Public Property Get DocumentFichier(ByVal i As Integer)
    DocumentFichier = colDocuments.Item(i).Fichier
End Property

Public Property Get DocumentTitre(ByVal i As Integer)
    DocumentTitre = colDocuments.Item(i).Titre
End Property

Public Property Get EnfantTitre(ByVal i As Variant)
    EnfantTitre = colEnfants.Item(i).Titre
End Property


Public Property Get EnfantId(ByVal i As Variant)
    EnfantId = colEnfants.Item(i).id
End Property


Public Function AddDocument(ByVal Fichier As String, ByVal Titre As String) As Document
 
    Set AddDocument = colDocuments.Add(Fichier, Titre)
    
End Function


Public Sub EnfantsClear()

    While colEnfants.Count
        colEnfants.Delete 1
    Wend

End Sub





Public Property Get Titre() As String
    
    Titre = chTitre

End Property



Public Property Let Commentaire(ByVal Commentaire As String)

    chCommentaire = Commentaire

End Property



Public Property Get Commentaire() As String
    
    Commentaire = chCommentaire

End Property



Public Property Let Titre(ByVal Titre As String)

    chTitre = Titre

End Property


