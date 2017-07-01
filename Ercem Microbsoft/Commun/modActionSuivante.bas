Attribute VB_Name = "modActionSuivante"
Attribute VB_Description = "Implante un mécanisme de file de fonctions à appeler en séquence, pour éviter les problèmes de réentrance"
' module modActionSuivante
' Implante un mécanisme de file de fonctions à appeler en séquence, quand
' le blocage des communications (séquence critique) ne permet pas un appel immédiat.
' Les pointeurs de fonction n'existant pas en VB (addressof n'est pas utilisable
' depuis le VB !!!), on stocke le nom de la fonction, et à charge d'une fonction
' de rappel DoActionSuivante implantée sur la feuille à qui on passe ce nom de fonction
' d'effectuer l'appel réel.
'
' 27/10/97 PV

Option Explicit


' Collection des actions à effectuer au moment du relâcher
Dim colAction As New Collection


' Mémorise une action à traiter ultérieurement
Sub ActionSuivante(fBase As Form, sAction As String)
  Dim a As New ActionSuivante
  Set a.f = fBase
  a.sProc = sAction
  
  colAction.Add a
End Sub


' Appelé par relâcher
Sub TraiteActionSuivante()
  If colAction.Count > 0 Then
    Dim a As ActionSuivante
    Set a = colAction(1)
    colAction.Remove 1
    a.f.DoActionSuivante a.sProc
  End If
End Sub
