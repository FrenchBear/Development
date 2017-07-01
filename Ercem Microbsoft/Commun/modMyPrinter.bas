Attribute VB_Name = "modMyPrinter"
' modMyPrinter
' Emballage de la gestion des travaux d'impression
' On appelle MyPrinterNewPage y compris pour la page 1
' 9/2/1 PV

Option Explicit

Private iPageJob As Integer           ' Nb de pages dans le planning courant



Public Sub MyPrinterStartDoc()
'  Debug.Print "Printer.StartDoc"
  iPageJob = 0
End Sub
     
Public Sub MyPrinterEndDoc()
'  Debug.Print "Printer.EndDoc  Pages=" & iPageJob
  If iPageJob > 0 Then Printer.EndDoc
End Sub



Public Sub MyPrinterNewPage()
  iPageJob = iPageJob + 1
  If iPageJob > 1 Then
'    Debug.Print "Printer.NewPage " & iPageJob
    Printer.NewPage
  Else
'    Debug.Print "Printer.NewPage 1 (Autoalimentation)"
  End If
End Sub


Public Sub MyPrinterNewPageRecto()
  MyPrinterNewPage
  
  If (iPageJob And 1) = 0 Then
    If ImprimanteAjoute1PageSiRV Then
      iPageJob = iPageJob + 1
'     Debug.Print "Printer.NewPage " & iPageJob & " (Ajoute1PageRV)"
    End If
  End If
End Sub

     
Public Sub MyPrinterPrint(sMsg As String)
'  Debug.Print sMsg
End Sub


Public Property Get MyPrinterPages() As Integer
  MyPrinterPages = iPageJob
End Property
