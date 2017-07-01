VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "SujetDanger"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit
'classe d'objet sujet/danger

'une sujet/danger est
'- un sujet
'- un danger
'- un type
'- des réponses 1 à 8 aux questions d'évaluation de la criticité du danger
'- un état de criticité (utilisé seulement pour les données de niveau Points à maitriser et mesures préventives)
'- une collection de données enfants (points à maitriser)
'- une collection de documents associés

'propriétés
Private chId As String
Private chEtape As String    'id de la classe Donnée
Private chSujet As String    'id de la classe Donnée
Private chDanger As String   'id de la classe Danger
Private chNom As String
Private chCommentaire As String
Private chCritique As String
Public colEnfants As New Collection  'Points à maitriser class Donnée)
Private colDocuments As New Documents
Public QuestCriticité As New QuestCriticite
Private iEffacé As Integer   'flag à vrai quand le sujetdanger a été effacé dans l'attente de l'éventuelle annulation d'effacement

Private Sub SVariantPut(ByVal stream As Object, ByVal Info As Variant)

Dim vInfo As Variant

    If Info = "" Then
        vInfo = "~#"
    Else
        vInfo = Info
    End If
    stream.VariantPut STG_SEEK_DONTMOVE, vInfo

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



Public Property Get Effacé() As Integer
    Effacé = iEffacé
End Property


Public Property Let Effacé(ByVal Effacé As Integer)
    iEffacé = Effacé
End Property



Public Sub Load(ByVal stream As Object)

Dim chInfo As String
Dim i As Integer
Dim n As Integer

    stream.GetString chId
    stream.GetString chEtape
    stream.GetString chSujet
    stream.GetString chDanger
    chNom = SVariantGet(stream)
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


Public Sub Save(ByVal stream As Object)

Dim chInfo As String
Dim i As Integer
Dim n As Integer

    chInfo = chId: stream.PutString chInfo, VarType(chInfo), False
    chInfo = chEtape: stream.PutString chInfo, VarType(chInfo), False
    chInfo = chSujet: stream.PutString chInfo, VarType(chInfo), False
    chInfo = chDanger: stream.PutString chInfo, VarType(chInfo), False
    SVariantPut stream, chNom
    SVariantPut stream, chCommentaire
    chInfo = chCritique: stream.PutString chInfo, VarType(chInfo), False
    
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

End Sub



Public Property Get EnfantsCount()

    EnfantsCount = colEnfants.Count
    
End Property



Public Function Enfant(ByVal id As Variant) As Donnee

    Set Enfant = colEnfants.Item(id)


End Function


Public Function AddEnfant(ByVal Enfant As Donnee, Optional AfterKey As Variant)

Dim i As Integer

    'customize le titre si après ajour, il y a deux éléments de même titre
    For i = 1 To colEnfants.Count
        If colEnfants.Item(i).Titre = Enfant.Titre Then
            Enfant.Titre = Enfant.Titre & " (copie)"
            Exit For
        End If
    Next
    If IsMissing(AfterKey) Then
        colEnfants.Add Enfant, Enfant.id
    Else
        colEnfants.Add Enfant, Enfant.id, , AfterKey
    End If
    
End Function



Function MiniCopy() As SujetDanger

Dim Copie As New SujetDanger

    'l'id reste vide
    Copie.Etape = chEtape
    Copie.Sujet = chSujet
    Copie.Danger = chDanger
    Copie.Nom = chNom
    Copie.Commentaire = chCommentaire
    Copie.Criticité = chCritique
    Set Copie.Documents = colDocuments.Copy
    If Not QuestCriticité Is Nothing Then
        Set Copie.QuestCriticité = QuestCriticité.Copy
    End If
    'Copie.iEffacé = iEffacé
    
    Set MiniCopy = Copie

End Function



Sub MiniPaste(ByVal SujetDanger As SujetDanger)

    'l'id reste vide
    chEtape = SujetDanger.Etape
    chSujet = SujetDanger.Sujet
    chDanger = SujetDanger.Danger
    chNom = SujetDanger.Nom
    chCommentaire = SujetDanger.Commentaire
    chCritique = SujetDanger.Criticité
    Set colDocuments = SujetDanger.Documents
    Set QuestCriticité = SujetDanger.QuestCriticité
    
End Sub



Public Property Get Documents() As Documents

    Set Documents = colDocuments

End Property


Public Property Set Documents(Documents As Documents)

    Set colDocuments = Documents

End Property



Public Sub EnfantsClear()

    While colEnfants.Count
        colEnfants.Delete 1
    Wend

End Sub





Public Property Get Nom() As String
    
    Nom = chNom

End Property





Public Property Get Commentaire() As String
    
    Commentaire = chCommentaire

End Property






Public Property Get Sujet() As String
    
    Sujet = chSujet

End Property




Public Property Get id() As String
    
    id = chId

End Property





Public Property Get Etape() As String
    
    Etape = chEtape

End Property





Public Property Get Danger() As String
    
    Danger = chDanger

End Property





Public Property Get Criticité() As String
    
    Criticité = chCritique

End Property






Public Property Let Nom(ByVal Nom As String)

    chNom = Nom

End Property


Public Property Let Commentaire(ByVal Commentaire As String)

    chCommentaire = Commentaire

End Property



Public Property Let id(ByVal id As String)

    chId = id

End Property



Public Property Let Sujet(ByVal Sujet As String)

    chSujet = Sujet

End Property



Public Property Let Etape(ByVal Etape As String)

    chEtape = Etape

End Property




Public Property Let Danger(ByVal Danger As String)

    chDanger = Danger

End Property




Public Property Let Criticité(ByVal Criticité As String)

    chCritique = Criticité

End Property






Public Sub DocumentsClear()

    While colDocuments.Count
        colDocuments.Delete 1
    Wend

End Sub

Public Property Get DocumentsCount()

    DocumentsCount = colDocuments.Count
    
End Property

Public Function DocumentFichier(ByVal i As Integer)
    DocumentFichier = colDocuments.Item(i).Fichier
End Function

Public Function DocumentTitre(ByVal i As Integer)
    DocumentTitre = colDocuments.Item(i).Titre
End Function

Public Function AddDocument(ByVal Fichier As String, ByVal Titre As String) As Document
 
    Set AddDocument = colDocuments.Add(Fichier, Titre)
    
End Function

Public Property Get Titre() As String
  Titre = chNom
End Property

