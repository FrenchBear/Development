VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "EHVisite"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' classe EHEval
' Mod�lise les informations sur une visite
' 05/02/1999 PV

Option Explicit

Public sRef As String       ' R�f�rence de planning
Public sHeure As String     ' Heure de visite (hh:mm)
Public iFormat As Integer   ' Format d'�dition, jamais null
Public sOptions As String   ' Options de la visite
Public dDateVisite As Date
Public iPers As Integer     ' Code personne
Public iCP As Integer       ' Centre de profit
Public cLangueED As String  ' Langue d'�dition du document

Public colEval As New Collection

