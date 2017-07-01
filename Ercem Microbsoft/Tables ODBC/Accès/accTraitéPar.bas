Attribute VB_Name = "AccTrait�Par"
' Module AccTrait�Par
' Remplit la collection colTrait�Par
' 25/11/01

Option Explicit

Public colTrait�Par As New Collection


Public Sub ChargeInfosTrait�Par()
  Dim sLigne As String
  Dim br As New Rev
  
  Dim sSyst�me As String, iTrait�Par As Integer, sLibell� As String
  Dim t As Trait�Par
  
  Bloquer
    tcps.Envoie "ETRP"
    
    Do
      sLigne = tcps.Re�oit
      If Left(sLigne, 2) = "->" Then Exit Do
      br.Buffer = sLigne
      br.GetField sSyst�me, iTrait�Par, sLibell�
      
      Set t = New Trait�Par
      t.trp_systeme = sSyst�me
      t.trp_traitepar = iTrait�Par
      t.trp_libelle = sLibell�
      
      colTrait�Par.Add t
      Set t = Nothing
    Loop
  Rel�cher
  
  If cLangage = "F" Then
    Dim sMsg As String
    sMsg = "Lors de l'enregistrement d'un �chantillon, s�lectionnez le bon code pour le champ 'Trait� par' (onglet labo)." & vbCrLf & vbCrLf & "Sur le syst�me auquel vous �tes connect�, les valeurs possibles sont :"
    For Each t In colTrait�Par
      If t.trp_systeme = cSyst�meCA Then
        sMsg = sMsg & vbCrLf & t.trp_traitepar & ": " & t.trp_libelle
      End If
    Next
    MsgBox sMsg, vbInformation, sNomApp
  End If
  
End Sub


