VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ShellDoc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' ShellDoc
' Classe g�n�rique qu'implantent toutes les classes de documents r�els
' 04/02/1999 PV

Option Explicit


Public Sub Visualisation(d As Document)
End Sub

Public Function bCr�ation(d As Document, sNRef As String) As Boolean
End Function

Public Function bSuppression(d As Document) As Boolean
End Function

Public Function bSaisie(d As Document, ByRef sNTitre As String, ByRef iOperContr�le As Integer, ByVal sNRef As String, ByVal bRestreint As Boolean) As Boolean
End Function

Public Function bPr�pareImpression(d As Document, sImprimante As String, bD�tail As Boolean) As Boolean
End Function

Public Function bFinImpression(d As Document) As Boolean
End Function

Public Function bImprimeRelecture(d As Document, bSimulation As Boolean) As Boolean
End Function

Public Function bImprimeD�finitif(d As Document, iNbEx As Integer, bSimulation As Boolean) As Boolean
End Function

Public Function bImprime(d As Document, iType As Integer, bForc� As Boolean, iNbEx As Integer) As Boolean
End Function

