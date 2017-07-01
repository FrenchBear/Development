Attribute VB_Name = "Global"
' Utilitaires communs de AfficheImage
' 10/01/1999 PV bFrmFichiersCharg�

Global bFrmFichiersCharg� As Boolean      ' Vrai si la feuille frmFichiers est charg�e

Option Explicit

' Contr�le d'une valeur enti�re saisie dans un TextBox
Function CtrlNumeric(c As TextBox, sNom As String, iMin As Integer, iMax As Integer) As Boolean
  If Not IsNumeric(c) Then
    MsgBox "Entrez le " & sNom & " de la planche, entre " & iMin & " et " & iMax
    CtrlNumeric = False
    Exit Function
  End If
  
  If c < iMin Or c > iMax Or c <> Int(c) Then
    MsgBox "Le " & sNom & " est invalide." & vbCrLf & "Entrez une valeur enti�re entre " & iMin & " et " & iMax
    CtrlNumeric = False
    Exit Function
  End If
  
  CtrlNumeric = True
End Function

