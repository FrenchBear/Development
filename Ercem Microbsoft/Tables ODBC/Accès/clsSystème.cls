VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Système"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gère les systèmes informatiques Ercem/LBF"
' Classe Système
' Gère les systèmes informatiques Silliker
'  4/02/1998 PV
' 16/11/2000 PV sys_adrlabo1



Option Explicit

Public sys_systeme As String      ' Lettre du système
Public sys_nom As String          ' Nom du système
Public sys_description As String  ' Machine+site
Public sys_balsite                ' lettre du système qui gère les BAL sur le site
Public sys_adrlabo1               ' Si labo sur le site, nom du labo
Public timestamp As Date          ' timestamp de l'enregistrement

' Duplique un objet Système
Function Copie() As Système
Attribute Copie.VB_Description = "Duplique un objet Système"
  Dim k As New Système
  With k
    .sys_systeme = sys_systeme
    .sys_nom = sys_nom
    .sys_description = sys_description
    .sys_balsite = sys_balsite
    .sys_adrlabo1 = sys_adrlabo1
    .timestamp = timestamp
  End With
  Set Copie = k
End Function

