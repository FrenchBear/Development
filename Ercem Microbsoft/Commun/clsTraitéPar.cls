VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TraitéPar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Class TraitéPar
' Enregistrement de la table traitepar
' Repère les flots de traitements sur un système donné

Option Explicit

Public trp_systeme As String
Public trp_traitepar As Integer
Public trp_libelle As String

