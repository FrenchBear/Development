Option Strict Off
Option Explicit On
Module Global
	' Utilitaires communs de AfficheImage
	' 10/01/1999 PV bFrmFichiersCharg�
	
	Public bFrmFichiersCharg� As Boolean ' Vrai si la feuille frmFichiers est charg�e
	
	
	' Contr�le d'une valeur enti�re saisie dans un TextBox
	Function CtrlNumeric(ByRef c As System.Windows.Forms.TextBox, ByRef sNom As String, ByRef iMin As Short, ByRef iMax As Short) As Boolean
		If Not IsNumeric(c.Text) Then
			MsgBox("Entrez le " & sNom & " de la planche, entre " & iMin & " et " & iMax)
			CtrlNumeric = False
			Exit Function
		End If
		
		If CDbl(c.Text) < iMin Or CDbl(c.Text) > iMax Or CDbl(c.Text) <> Int(CDbl(c.Text)) Then
			MsgBox("Le " & sNom & " est invalide." & vbCrLf & "Entrez une valeur enti�re entre " & iMin & " et " & iMax)
			CtrlNumeric = False
			Exit Function
		End If
		
		CtrlNumeric = True
	End Function
End Module