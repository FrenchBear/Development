Attribute VB_Name = "modClôture"
' modClôture
' Gestion des clôtures mensuelles de plannings
' 18/03/1999 PV

Option Explicit


Public dPremierJourNonClôt As Date


Function bContrôleClôtureMensuelle(dDatePlanning As Date) As Boolean
  If dPremierJourNonClôt = 0 Then       ' Pas encore lu
    Dim iNbJournées As Integer
    Dim cj As New AccJournee

    iNbJournées = cj.RechercheJournee("pla_etb$7")
    If iNbJournées = 0 Then
      dPremierJourNonClôt = #1/1/1999#  ' Si pas de marqueur de clôture
    Else
      dPremierJourNonClôt = cj(1).dDatePlan
    End If
  End If
  
  bContrôleClôtureMensuelle = dDatePlanning >= dPremierJourNonClôt
End Function
