VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Specificite"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

'classe d'objet sp�cificit�

'une sp�cificit� est
'- une chaine de caract�res
'- une collection de Questions


'propri�t�s
Private chLibell� As String
Public QuestPertinences As New QuestPertinences


Public Function AddQuestPertinence(ByVal Id As String, ByVal Question As String, ByVal R�ponseOui As String, ByVal R�ponseNon As String) As QuestPertinence

    AddQuestPertinence = QuestPertinences.Add(Id, Question, R�ponseOui, R�ponseNon)
    
End Function

Public Sub QuestPertinencesClear()

   While QuestPertinences.Count
         QuestPertinences.Delete QuestPertinences.Item(1).Id
   Wend

End Sub


Public Property Get Libell�() As String
    
    Libell� = chLibell�

End Property


Public Property Let Libell�(ByVal Libell� As String)

    chLibell� = Libell�
    
End Property





