VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Specificite"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'classe d'objet spécificité

'une spécificité est
'- une chaine de caractères
'- une collection de Questions


'propriétés
Private chLibellé As String
Public QuestPertinences As New QuestPertinences


Public Function AddQuestPertinence(ByVal Id As String, ByVal Question As String, ByVal RéponseOui As String, ByVal RéponseNon As String) As QuestPertinence

    AddQuestPertinence = QuestPertinences.Add(Id, Question, RéponseOui, RéponseNon)
    
End Function

Public Sub QuestPertinencesClear()

   While QuestPertinences.Count
         QuestPertinences.Delete QuestPertinences.Item(1).Id
   Wend

End Sub


Public Property Get Libellé() As String
    
    Libellé = chLibellé

End Property


Public Property Let Libellé(ByVal Libellé As String)

    chLibellé = Libellé
    
End Property





