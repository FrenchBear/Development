Attribute VB_Name = "AccType"
Attribute VB_Description = "Module d'accès aux types (de produits)"
' AccType
' Module d'accès aux types (de produits)
' Pour l'instant, on fournit juste un service de vérification d'existence de type
' On verra plus tard pour le cache…
' 29/10/97 PV

Option Explicit

Public Function bTypeExistant(ByVal sType As String) As Boolean
  Dim br As New Rev
  
  Bloquer
    br.AddField sType
    tcps.Envoie "TTYP " & br.Buffer
    
    Dim sLigne As String, bRéponse As Boolean
    sLigne = tcps.Reçoit
    br.Buffer = sLigne
    br.GetField bRéponse
    bTypeExistant = bRéponse

    ' Contrôle
    sLigne = tcps.Reçoit
    If Left(sLigne, 2) <> "->" Then Stop
  Relâcher
End Function

