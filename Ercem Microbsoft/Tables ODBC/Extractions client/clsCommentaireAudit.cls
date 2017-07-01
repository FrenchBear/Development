VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CommentaireAudit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' Classe CommentaireAudit
' Modélise un enregistrement de type 'commentaire d'audit' pour Carrefour 2002
' 17/12/01 PV

Option Explicit

Public Id_Rayon_at As Integer
Public Id_Question As String
Public Type_commentaire As Integer
Public Libelle_commentaire As String

