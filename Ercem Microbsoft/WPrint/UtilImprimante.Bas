Attribute VB_Name = "UtilImprimante"
' Module imprimante
' Fonctions de manipulation d'imprimante pour WPrint et les formateurs
' 18/03/97 PV
' 24/03/97 Synonymes

Option Explicit
Public tSynonymes As Variant

Public Function IsImprimante(ByVal sImprimante As String) As Boolean
  ' On recherche s'il y a un synonyme local
  Dim i As Integer
  If Not IsEmpty(tSynonymes) Then
    For i = 0 To UBound(tSynonymes, 1)
      If UCase(tSynonymes(i, 0)) = UCase(sImprimante) Then
        sImprimante = tSynonymes(i, 1)
        Exit For
      End If
    Next
  End If
  
  ' Puis dans la collection des imprimantes
  Dim p As Printer
  For Each p In Printers
    If UCase(p.DeviceName) = UCase(sImprimante) Then
      IsImprimante = True
      Exit Function
    End If
  Next
  
  IsImprimante = False
End Function


Public Function GetImprimante(ByVal sImprimante As String) As Printer
  Dim i As Integer
  If Not IsEmpty(tSynonymes) Then
    For i = 0 To UBound(tSynonymes, 1)
      If UCase(tSynonymes(i, 0)) = UCase(sImprimante) Then
        sImprimante = tSynonymes(i, 1)
        Exit For
      End If
    Next
  End If
  
  Dim p As Printer
  For Each p In Printers
    If UCase(p.DeviceName) = UCase(sImprimante) Then
      Set GetImprimante = p
      Exit Function
    End If
  Next
  Set GetImprimante = Nothing
End Function


Public Sub LitSynonymes()
  tSynonymes = GetAllSettings("WPrint", "Synonymes")
End Sub
