Option Strict Off
Option Explicit On
Friend Class Historique
	' Classe historique
	' Impl�mentation simple d'une collection avec m�thode back
	' Un �l�ment est un num�ro de fichier en base 0
	
	
	
	Private c As New Collection
	
	Sub Ajoute(ByVal iPos As Short)
		c.Add(iPos)
	End Sub
	
	Function count() As Short
		count = c.Count()
	End Function
	
	Function Back() As Short
		c.Remove(c.Count())
		'UPGRADE_WARNING: Impossible de r�soudre la propri�t� par d�faut de l'objet c(). Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1037"'
		Back = c.Item(c.Count())
		c.Remove(c.Count())
	End Function
	
	' Effacement rapide de l'historique
	Sub clear()
		'UPGRADE_NOTE: L'objet c ne peut pas �tre d�truit tant qu'il n'est pas r�cup�r� par le garbage collector (ramasse-miettes). Cliquez ici : 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1029"'
		c = Nothing
	End Sub
End Class