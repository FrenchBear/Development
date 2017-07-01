Attribute VB_Name = "modSpool"
Attribute VB_Description = "Fonctions d'accès au spooler du démon"
' modSpool.bas
' Fonctions d'accès au spooler du démon
' 2/09/97 PV Module à part

Option Explicit


' Gestion du spooler
Public Sub DémonImprimeBegin(sImprimante As String, sTitre As String)
  Dim br As New Rev
  br.AddField sImprimante, sTitre
  Bloquer
    tcps.Envoie "IBEG " & br.Buffer
    AttendSynchro
  Relâcher
End Sub


Public Sub DémonImprimeEnd()
  Bloquer
    tcps.Envoie "IEND"
    AttendSynchro
  Relâcher
End Sub

