VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ClasseCRA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Implements ClasseDocument


Public Sub ClasseDocument_DocVisualisation(d As Document)
  frmClasseCRA.lblNom = d.sNom
  frmClasseCRA.Show vbModal
End Sub

Public Sub ClasseDocument_DocImpression(d As Document)
  MsgBox "Impression CRA " & d.sNom
End Sub


