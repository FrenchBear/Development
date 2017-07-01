Attribute VB_Name = "modActionSuivante"
Attribute VB_Description = "Implante un m�canisme de file de fonctions � appeler en s�quence, pour �viter les probl�mes de r�entrance"
' module modActionSuivante
' Implante un m�canisme de file de fonctions � appeler en s�quence, quand
' le blocage des communications (s�quence critique) ne permet pas un appel imm�diat.
' Les pointeurs de fonction n'existant pas en VB (addressof n'est pas utilisable
' depuis le VB !!!), on stocke le nom de la fonction, et � charge d'une fonction
' de rappel DoActionSuivante implant�e sur la feuille � qui on passe ce nom de fonction
' d'effectuer l'appel r�el.
'
' 27/10/97 PV

Option Explicit


' Collection des actions � effectuer au moment du rel�cher
Dim colAction As New Collection


' M�morise une action � traiter ult�rieurement
Sub ActionSuivante(fBase As Form, sAction As String)
  Dim a As New ActionSuivante
  Set a.f = fBase
  a.sProc = sAction
  
  colAction.Add a
End Sub


' Appel� par rel�cher
Sub TraiteActionSuivante()
  If colAction.Count > 0 Then
    Dim a As ActionSuivante
    Set a = colAction(1)
    colAction.Remove 1
    a.f.DoActionSuivante a.sProc
  End If
End Sub
