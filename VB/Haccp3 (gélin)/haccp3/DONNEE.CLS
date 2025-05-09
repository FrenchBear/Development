VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "Donnee"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit
'classe d'objet donn�e

'une donn�e est
'- une cl� (utilis�e uniquement pour les sujets)
'- un Titre
'- un commentaire
'- une collection de donn�es enfants (cf tableau ci-dessous pour chaque parent)
'-      DP=dispositions en place, AH=Arbre HACCP
'-      parents                     Enfants
'-      ---------------------------------------------
'-      Etapes                      Sujets
'-      Sujets                      Mesures pr�ventives des dispositions en place
'-      Mesures pr�ventives des DP  Valeurs cibles des dispositions en place
'-      Valeurs cibles des DP       Proc�d. Surveillance des dispositions en place
'-      Proc�d Surv. des DP         Corrections des dispositions en place
'-      Corrections des DP          Actions correctives des dispositions en place
'-      Action correctives des DP   Enregistrements des DP
'-      Points � maitriser de AH    Mesures pr�ventives de AH
'-      Mesures pr�ventives de AH   Valeurs cibles de AH
'-      Valeurs cibles de AH        Proc�d. Surveillance de AH
'-      Proc�d Surv. de AH          Corrections de AH
'-      Corrections de AH           Actions correctives de AH
'-      Action correctives de AH    Enregistrements de AH
'- une collection de documents associ�s
'- un �tat de criticit� et un questionnaire de criticit� (utilis� seulement pour les donn�es de niveau Points � maitriser et mesures pr�ventives)

'propri�t�s
Private chId As String
Private chTitre As String
Private chCommentaire As String
Public colEnfants As New Collection 'Donn�es
Private colDocuments As New Documents
Private chCritique As String
Public QuestCriticit� As QuestCriticite 'pas de new pour gain de m�moire pour la plupart des donn�es


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
    Copie.Criticit� = chCritique
    Set Copie.Documents = colDocuments.Copy
    If Not QuestCriticit� Is Nothing Then
        Set Copie.QuestCriticit� = QuestCriticit�.Copy
    End If
    
    Set MiniCopy = Copie

End Function


Public Property Get Documents() As Documents

    Set Documents = colDocuments

End Property

Public Property Set Documents(Documents As Documents)

    Set colDocuments = Documents

End Property


Sub MiniPaste(ByVal Donn�e As Donnee)

    'l'id reste vide
    Titre = Donn�e.Titre
    Commentaire = Donn�e.Commentaire
    chCritique = Donn�e.Criticit�
    Set colDocuments = Donn�e.Documents
    Set QuestCriticit� = Donn�e.QuestCriticit�
    
End Sub


Public Function PasteFromClipboard(ByVal Projet As Projet, ByVal Affichage As Integer, ByVal Niveau As Integer)

Dim chTexte As String
Dim chLigne As String
    
    'texte provenant du presse-papiers
    chTexte = Clipboard.GetText(vbCFText)
    
    'saute premiers caract�res
    chTexte = suppfirstchar(chTexte, InStr(InStr(1, chTexte, Sep) + 1, chTexte, Sep))
    
    'convertit le texte en donn�e
    Me.LetTexte Projet, Niveau, "", chTexte
        
End Function


Public Function GetTexte(ByVal Niveau As Integer, ByVal D�butLigne As String) As String

Dim chTexte As String
Dim n As Integer
Dim i As Integer

    'propri�t�s
    chTexte = D�butLigne & Niveau & Sep & chId & vbCrLf
    chTexte = chTexte & D�butLigne & chTitre & vbCrLf
    n = GetNbLignesDansChaine(chCommentaire)
    chTexte = chTexte & D�butLigne & n & vbCrLf
    If n > 0 Then
        chTexte = chTexte & D�butLigne & chCommentaire & vbCrLf
    End If
    'documents
    n = colDocuments.Count
    chTexte = chTexte & D�butLigne & n & vbCrLf
    For i = 1 To n
        chTexte = chTexte & D�butLigne & colDocuments.Item(i).Fichier & Sep & colDocuments.Item(i).Titre & vbCrLf
    Next
    'questionnaire de criticit�
    chTexte = chTexte & D�butLigne & (Not QuestCriticit� Is Nothing) & vbCrLf
    If Not QuestCriticit� Is Nothing Then
        chTexte = chTexte & D�butLigne
        For i = 0 To 4
            chTexte = chTexte & QuestCriticit�.Question(i) & Sep
        Next
        chTexte = chTexte & vbCrLf
        chTexte = chTexte & D�butLigne
        For i = 0 To 4
            chTexte = chTexte & QuestCriticit�.R�ponse(i) & Sep
        Next
        chTexte = chTexte & vbCrLf
        chTexte = chTexte & D�butLigne & QuestCriticit�.R�ponsesCount & Sep & QuestCriticit�.R�sultat & vbCrLf
    End If
    chTexte = chTexte & D�butLigne & chCritique & vbCrLf
    'enfants
    n = colEnfants.Count
    chTexte = chTexte & D�butLigne & n & vbCrLf
    For i = 1 To n
        chTexte = chTexte & colEnfants(i).GetTexte(Niveau + 1, D�butLigne & Sep) & vbCrLf
    Next
    GetTexte = chTexte
    
End Function


Public Sub LetTexte(ByVal Projet As Projet, ByVal Niveau As Integer, ByVal D�butLigne As String, chTexte As String)

Dim chLigne As String
Dim n As Integer
Dim i As Integer

    'id
    chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(D�butLigne))
    chId = Left$(GetItemDansChaineSep(chLigne, 2, Sep), 1) & Projet.NewId
    chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(D�butLigne))
    'titre
    chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(D�butLigne))
    chTitre = GetItemDansChaineSep(chLigne, 1, Sep)
    chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(D�butLigne))
    'nombre de lignes dans commentaire
    chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(D�butLigne))
    n = Val(GetItemDansChaineSep(chLigne, 1, vbCrLf))
    chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(D�butLigne))
    'commentaire
    chCommentaire = ""
    For i = 1 To n
        chLigne = GetItemDansChaineSep(chTexte, 1, vbCrLf)
        If i > 1 Then
            chCommentaire = chCommentaire & vbCrLf
        End If
        If i = 1 Then
            chCommentaire = chCommentaire & suppfirstchar(chLigne, Len(D�butLigne))
        Else
            chCommentaire = chCommentaire & chLigne
        End If
        chTexte = suppfirstchar(chTexte, Len(chLigne) + 2)
    Next
    'nombre de documents
    chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(D�butLigne))
    n = Val(GetItemDansChaineSep(chLigne, 1, Sep))
    chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(D�butLigne))
    'documents
    For i = 1 To n
        chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(D�butLigne))
        Me.AddDocument GetItemDansChaineSep(chLigne, 1, Sep), GetItemDansChaineSep(chLigne, 2, Sep)
        chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(D�butLigne))
    Next
    'questionnaire de criticit�
    chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(D�butLigne))
    n = Left$(GetItemDansChaineSep(chLigne, 1, Sep), 1) <> "F"
    chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(D�butLigne))
    If n Then
        Dim TempQuestCriticit� As New QuestCriticite
        'questions
        chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(D�butLigne))
        For i = 0 To 4
            TempQuestCriticit�.Question(i) = Val(GetItemDansChaineSep(chLigne, i + 1, Sep))
        Next
        chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(D�butLigne))
        'r�ponses
        chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(D�butLigne))
        For i = 0 To 4
            TempQuestCriticit�.R�ponse(i) = GetItemDansChaineSep(chLigne, i + 1, Sep)
        Next
        chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(D�butLigne))
        'nombre de r�ponses et r�sultat
        chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(D�butLigne))
        TempQuestCriticit�.R�ponsesCount = Val(GetItemDansChaineSep(chLigne, 1, Sep))
        TempQuestCriticit�.R�sultat = Val(GetItemDansChaineSep(chLigne, 2, Sep))
        chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(D�butLigne))
        Set QuestCriticit� = TempQuestCriticit�
    End If
    'criticit�
    chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(D�butLigne))
    chCritique = GetItemDansChaineSep(chLigne, 1, Sep)
    chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(D�butLigne))
    'nombre d'enfants
    chLigne = suppfirstchar(GetItemDansChaineSep(chTexte, 1, vbCrLf), Len(D�butLigne))
    n = Val(GetItemDansChaineSep(chLigne, 1, Sep))
    chTexte = suppfirstchar(chTexte, Len(chLigne) + 2 + Len(D�butLigne))
    'enfants
    Dim NewEnfant As Donnee
    For i = 1 To n
        Set NewEnfant = New Donnee
        NewEnfant.LetTexte Projet, Niveau + 1, D�butLigne & Sep, chTexte
        Me.AddEnfant NewEnfant
        chTexte = suppfirstchar(chTexte, 2)
    Next

End Sub



Public Property Get Criticit�() As String
    
    Criticit� = chCritique

End Property







Public Property Let Criticit�(ByVal Criticit� As String)

    chCritique = Criticit�

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
    
    'questionnaire de criticit�
    chInfo = Not QuestCriticit� Is Nothing
    stream.PutString chInfo, VarType(chInfo), False
    If Not QuestCriticit� Is Nothing Then
        QuestCriticit�.Save stream
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
    
    'questionnaire de criticit�
    stream.GetString chInfo
    Set QuestCriticit� = Nothing
    If chInfo = "Vrai" Then
        Set QuestCriticit� = New QuestCriticite
        QuestCriticit�.Load stream
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

    'customize le titre si apr�s ajour, il y a deux �l�ments de m�me titre
    For i = 1 To colEnfants.Count
        If colEnfants.Item(i).Titre = Enfant.Titre Then
            Enfant.Titre = Enfant.Titre & " (copie)"
            Exit For
        End If
    Next
    If IsMissing(AfterKey) Then
        If IsMissing(BeforeKey) Then
            'ajout� en fin de liste
            colEnfants.Add Enfant, Enfant.id
        Else
            'ajout� avant un �l�ment d�termin�
            colEnfants.Add Enfant, Enfant.id, Before:=BeforeKey
        End If
    Else
        'ajout� apr�s un �l�ment d�termin�
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


