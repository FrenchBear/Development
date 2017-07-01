VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "QuestCriticite"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit
'classe d'objet réponses de questionnaire de criticité

'un questionnaire de criticité est
'- un tableau de numéro de questions (de 1 à 5)
'- un tableau de réponses correspondantes ("", "Oui", "Non")
'- le nombre de postes valides dans ces tableaux
'- le résultat (6, 7 ou 8)

'propriétés
Private tQuestions(0 To 4) As Integer
Private tRéponses(0 To 4) As String
Private iNbRéponses As Integer
Private iRésultat As Integer

Sub Load(ByVal stream As Object)

Dim i As Integer
Dim n As Integer
Dim chInfo As String

    stream.GetString chInfo
    n = Val(chInfo)
    For i = 0 To n
        stream.GetString chInfo
        tQuestions(i) = CInt(chInfo)
    Next
    
    stream.GetString chInfo
    n = Val(chInfo)
    For i = 0 To n
        stream.GetString tRéponses(i)
    Next
    
    stream.GetString chInfo
    iNbRéponses = Val(chInfo)
    
    stream.GetString chInfo
    iRésultat = Val(chInfo)
        
End Sub

Public Sub Save(ByVal stream As Object)

Dim i As Integer
Dim n As Integer
Dim chInfo As String

    chInfo = UBound(tQuestions)
    n = Val(chInfo)
    stream.PutString chInfo, VarType(chInfo), False
    For i = 0 To n
        chInfo = tQuestions(i)
        n = Val(chInfo)
        stream.PutString chInfo, VarType(chInfo), False
    Next
    
    chInfo = UBound(tRéponses)
    n = Val(chInfo)
    stream.PutString chInfo, VarType(chInfo), False
    For i = 0 To n
        chInfo = tRéponses(i)
        n = Val(chInfo)
        stream.PutString chInfo, VarType(chInfo), False
    Next
    
    chInfo = iNbRéponses
    n = Val(chInfo)
    stream.PutString chInfo, VarType(chInfo), False
    
    chInfo = iRésultat
    n = Val(chInfo)
    stream.PutString chInfo, VarType(chInfo), False
    
    stream.Flush STG_DEFAULT
    
End Sub

Public Function Copy() As QuestCriticite
    
Dim Copie As New QuestCriticite
Dim i As Integer
    
    For i = 0 To 4
        Copie.Réponse(i) = Me.Réponse(i)
        Copie.Question(i) = Me.Question(i)
    Next
    Copie.RéponsesCount = Me.RéponsesCount
    Copie.Résultat = Me.Résultat
    Set Copy = Copie
    
End Function


Public Property Let Réponse(ByVal i As Integer, ByVal Réponse As String)

    tRéponses(i) = Réponse

End Property


Public Property Let Question(ByVal i As Integer, ByVal Question As Integer)

    tQuestions(i) = Question

End Property



Public Property Let RéponsesCount(ByVal n As Integer)

    iNbRéponses = n

End Property



Public Property Get Réponse(ByVal i As Integer) As String
    
    Réponse = tRéponses(i)

End Property



Public Property Get Résultat() As Integer
    
    Résultat = iRésultat

End Property




Public Property Let Résultat(ByVal Résultat As Integer)
    
    iRésultat = Résultat

End Property





Public Property Get Question(ByVal i As Integer) As Integer
    
    Question = tQuestions(i)

End Property




Public Property Get RéponsesCount() As Integer
    RéponsesCount = iNbRéponses
End Property



