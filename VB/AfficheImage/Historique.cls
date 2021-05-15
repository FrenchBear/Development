VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Historique"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Implémentation simple d'une collection avec méthode back"
' Classe historique
' Implémentation simple d'une collection avec méthode back
' Un élément est un numéro de fichier en base 0


Option Explicit

Private c As New Collection

Sub Ajoute(ByVal iPos As Integer)
    c.Add iPos
End Sub

Function count() As Integer
    count = c.count
End Function

Function Back() As Integer
    c.Remove c.count
    Back = c(c.count)
    c.Remove c.count
End Function

' Effacement rapide de l'historique
Sub clear()
    Set c = Nothing
End Sub

