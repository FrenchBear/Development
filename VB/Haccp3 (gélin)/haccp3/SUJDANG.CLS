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
'- des r�ponses 1 � 8 aux questions d'�valuation de la criticit� du danger
'- un �tat de criticit� (utilis� seulement pour les donn�es de niveau Points � maitriser et mesures pr�ventives)
'- une collection de donn�es enfants (points � maitriser)
'- une collection de documents associ�s

'propri�t�s
Private chId As String
Private chEtape As String    'id de la classe Donn�e
Private chSujet As String    'id de la classe Donn�e
Private chDanger As String   'id de la classe Danger
Private chNom As String
Private chCommentaire As String
Private chCritique As String
Public colEnfants As New Collection  'Points � maitriser class Donn�e)
Private colDocuments As New Documents
Public QuestCriticit� As New QuestCriticite
Private iEffac� As Integer   'flag � vrai quand le sujetdanger a �t� effac� dans l'attente de l'�ventuelle annulation d'effacement

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



Public Property Get Effac�() As Integer
    Effac� = iEffac�
End Property


Public Property Let Effac�(ByVal Effac� As Integer)
    iEffac� = Effac�
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
    
    'questionnaire de criticit�
    stream.GetString chInfo
    Set QuestCriticit� = Nothing
    If chInfo = "Vrai" Then
        Set QuestCriticit� = New QuestCriticite
        QuestCriticit�.Load stream
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
    
    'questionnaire de criticit�
    chInfo = Not QuestCriticit� Is Nothing
    stream.PutString chInfo, VarType(chInfo), False
    If Not QuestCriticit� Is Nothing Then
        QuestCriticit�.Save stream
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

    'customize le titre si apr�s ajour, il y a deux �l�ments de m�me titre
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
    Copie.Criticit� = chCritique
    Set Copie.Documents = colDocuments.Copy
    If Not QuestCriticit� Is Nothing Then
        Set Copie.QuestCriticit� = QuestCriticit�.Copy
    End If
    'Copie.iEffac� = iEffac�
    
    Set MiniCopy = Copie

End Function



Sub MiniPaste(ByVal SujetDanger As SujetDanger)

    'l'id reste vide
    chEtape = SujetDanger.Etape
    chSujet = SujetDanger.Sujet
    chDanger = SujetDanger.Danger
    chNom = SujetDanger.Nom
    chCommentaire = SujetDanger.Commentaire
    chCritique = SujetDanger.Criticit�
    Set colDocuments = SujetDanger.Documents
    Set QuestCriticit� = SujetDanger.QuestCriticit�
    
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





Public Property Get Criticit�() As String
    
    Criticit� = chCritique

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




Public Property Let Criticit�(ByVal Criticit� As String)

    chCritique = Criticit�

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

