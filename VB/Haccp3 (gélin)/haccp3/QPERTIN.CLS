VERSION 1.0 CLASS
BEGIN
  MultiUse = 0   'False
END
Attribute VB_Name = "QuestPertinence"
Attribute VB_Creatable = True
Attribute VB_Exposed = False
Option Explicit
'classe d'objet question de questionnaire de pertinence

'une question de pertinence est
'- un identificateur
'- une chaine de caractères
'- un identificateur pour réponse affirmative
'- un identificateur pour réponse négative

'propriétés
Private chQuestion As String
Private chId As String
Private chRéponseOui As String
Private chRéponseNon As String






Public Property Get Question() As String
    
    Question = chQuestion

End Property

Public Property Get Id() As String
    
    Id = chId

End Property


Public Property Let RéponseOui(ByVal RéponseOui As String)

    chRéponseOui = RéponseOui

End Property

Public Property Let RéponseNon(ByVal RéponseNon As String)

    chRéponseNon = RéponseNon

End Property


Public Property Get RéponseNon() As String
    
    RéponseNon = chRéponseNon

End Property


Public Property Get RéponseOui() As String
    
    RéponseOui = chRéponseOui

End Property



Public Property Let Question(ByVal Question As String)

    chQuestion = Question

End Property

Public Property Let Id(ByVal Id As String)

    chId = Id

End Property


