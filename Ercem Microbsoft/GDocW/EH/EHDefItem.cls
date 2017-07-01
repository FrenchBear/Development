VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "EHDefItem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' EHDefItem
' Une ligne de définition de grille
' 5/2/99 PV

Option Explicit

Public ziIndice As Integer    ' Rang dans la grille
Public iSérie As Long         ' N° de série interne (unique)
Public iNumit As Long         ' N° d'item dans la table item
Public sNumloc As String
Public iNiveau As Integer
Public iFormat As Integer
Public sOptions As String
Public iDécote As Integer     ' Jamais NULL, 0 n'est pas affiché
Public sLibellé As String
Public sFormule As String
Public sTypeItem As String    ' T=Titre, …
