Attribute VB_Name = "AccTraitéPar"
' Module AccTraitéPar
' Remplit la collection colTraitéPar
' 25/11/01

Option Explicit

Public colTraitéPar As New Collection


Public Sub ChargeInfosTraitéPar()
  Dim sLigne As String
  Dim br As New Rev
  
  Dim sSystème As String, iTraitéPar As Integer, sLibellé As String
  Dim t As TraitéPar
  
  Bloquer
    tcps.Envoie "ETRP"
    
    Do
      sLigne = tcps.Reçoit
      If Left(sLigne, 2) = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sSystème, iTraitéPar, sLibellé
      
      Set t = New TraitéPar
      t.trp_systeme = sSystème
      t.trp_traitepar = iTraitéPar
      t.trp_libelle = sLibellé
      
      colTraitéPar.Add t
      Set t = Nothing
    Loop
  Relâcher
  
  If cLangage = "F" Then
    Dim sMsg As String
    sMsg = "Lors de l'enregistrement d'un échantillon, sélectionnez le bon code pour le champ 'Traité par' (onglet labo)." & vbCrLf & vbCrLf & "Sur le système auquel vous êtes connecté, les valeurs possibles sont :"
    For Each t In colTraitéPar
      If t.trp_systeme = cSystèmeCA Then
        sMsg = sMsg & vbCrLf & t.trp_traitepar & ": " & t.trp_libelle
      End If
    Next
    MsgBox sMsg, vbInformation, sNomApp
  End If
  
End Sub


