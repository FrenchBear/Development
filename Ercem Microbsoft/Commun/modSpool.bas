Attribute VB_Name = "modSpool"
Attribute VB_Description = "Fonctions d'acc�s au spooler du d�mon"
' modSpool.bas
' Fonctions d'acc�s au spooler du d�mon
' 2/09/97 PV Module � part

Option Explicit


' Gestion du spooler
Public Sub D�monImprimeBegin(sImprimante As String, sTitre As String)
  Dim br As New Rev
  br.AddField sImprimante, sTitre
  Bloquer
    tcps.Envoie "IBEG " & br.Buffer
    AttendSynchro
  Rel�cher
End Sub


Public Sub D�monImprimeEnd()
  Bloquer
    tcps.Envoie "IEND"
    AttendSynchro
  Rel�cher
End Sub

