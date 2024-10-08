VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "QuestCriticite"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit
'classe d'objet r�ponses de questionnaire de criticit�

'un questionnaire de criticit� est
'- un tableau de num�ro de questions (de 1 � 5)
'- un tableau de r�ponses correspondantes ("", "Oui", "Non")
'- le nombre de postes valides dans ces tableaux
'- le r�sultat (6, 7 ou 8)

'propri�t�s
Private tQuestions(0 To 4) As Integer
Private tR�ponses(0 To 4) As String
Private iNbR�ponses As Integer
Private iR�sultat As Integer

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
        stream.GetString tR�ponses(i)
    Next
    
    stream.GetString chInfo
    iNbR�ponses = Val(chInfo)
    
    stream.GetString chInfo
    iR�sultat = Val(chInfo)
        
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
    
    chInfo = UBound(tR�ponses)
    n = Val(chInfo)
    stream.PutString chInfo, VarType(chInfo), False
    For i = 0 To n
        chInfo = tR�ponses(i)
        n = Val(chInfo)
        stream.PutString chInfo, VarType(chInfo), False
    Next
    
    chInfo = iNbR�ponses
    n = Val(chInfo)
    stream.PutString chInfo, VarType(chInfo), False
    
    chInfo = iR�sultat
    n = Val(chInfo)
    stream.PutString chInfo, VarType(chInfo), False
    
    stream.Flush STG_DEFAULT
    
End Sub

Public Function Copy() As QuestCriticite
    
Dim Copie As New QuestCriticite
Dim i As Integer
    
    For i = 0 To 4
        Copie.R�ponse(i) = Me.R�ponse(i)
        Copie.Question(i) = Me.Question(i)
    Next
    Copie.R�ponsesCount = Me.R�ponsesCount
    Copie.R�sultat = Me.R�sultat
    Set Copy = Copie
    
End Function


Public Property Let R�ponse(ByVal i As Integer, ByVal R�ponse As String)

    tR�ponses(i) = R�ponse

End Property


Public Property Let Question(ByVal i As Integer, ByVal Question As Integer)

    tQuestions(i) = Question

End Property



Public Property Let R�ponsesCount(ByVal n As Integer)

    iNbR�ponses = n

End Property



Public Property Get R�ponse(ByVal i As Integer) As String
    
    R�ponse = tR�ponses(i)

End Property



Public Property Get R�sultat() As Integer
    
    R�sultat = iR�sultat

End Property




Public Property Let R�sultat(ByVal R�sultat As Integer)
    
    iR�sultat = R�sultat

End Property





Public Property Get Question(ByVal i As Integer) As Integer
    
    Question = tQuestions(i)

End Property




Public Property Get R�ponsesCount() As Integer
    R�ponsesCount = iNbR�ponses
End Property



