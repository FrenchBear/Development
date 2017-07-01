Attribute VB_Name = "modCl�ture"
' modCl�ture
' Gestion des cl�tures mensuelles de plannings
' 18/03/1999 PV

Option Explicit


Public dPremierJourNonCl�t As Date


Function bContr�leCl�tureMensuelle(dDatePlanning As Date) As Boolean
  If dPremierJourNonCl�t = 0 Then       ' Pas encore lu
    Dim iNbJourn�es As Integer
    Dim cj As New AccJournee

    iNbJourn�es = cj.RechercheJournee("pla_etb$7")
    If iNbJourn�es = 0 Then
      dPremierJourNonCl�t = #1/1/1999#  ' Si pas de marqueur de cl�ture
    Else
      dPremierJourNonCl�t = cj(1).dDatePlan
    End If
  End If
  
  bContr�leCl�tureMensuelle = dDatePlanning >= dPremierJourNonCl�t
End Function
