VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ActionSuivante"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "M�canisme g�n�rique de protection contre les probl�mes de r�-entrance, stocke la procha�ne action � ex�cuter"
' classe ActionSuivante
' Implante un m�canisme g�n�rique de protection contre les probl�mes de r�-entrance
' cons�cutifs � l'utilisation du DoEvents dans la biblioth�que TCPSynchrone�
' Cette classe m�morise les informations pour une fonction � rappeller
' voir modActionSuivante pour les commentaires
' 27/10/97 PV

Option Explicit

Public f As Form            ' Feuille contenant le code
Public sProc As String      ' Nom de la fonction � ex�cuter

