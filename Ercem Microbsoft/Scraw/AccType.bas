Attribute VB_Name = "AccType"
Attribute VB_Description = "Module d'acc�s aux types (de produits)"
' AccType
' Module d'acc�s aux types (de produits)
' Pour l'instant, on fournit juste un service de v�rification d'existence de type
' On verra plus tard pour le cache�
' 29/10/97 PV

Option Explicit

Public Function bTypeExistant(ByVal sType As String) As Boolean
  Dim br As New Rev
  
  Bloquer
    br.AddField sType
    tcps.Envoie "TTYP " & br.Buffer
    
    Dim sLigne As String, bR�ponse As Boolean
    sLigne = tcps.Re�oit
    br.Buffer = sLigne
    br.GetField bR�ponse
    bTypeExistant = bR�ponse

    ' Contr�le
    sLigne = tcps.Re�oit
    If Left(sLigne, 2) <> "->" Then Stop
  Rel�cher
End Function

