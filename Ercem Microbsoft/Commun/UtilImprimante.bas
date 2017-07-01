Attribute VB_Name = "UtilImprimante"
' UtilImprimante
' Fonctions g�n�rales de gestion des imprimantes
' Travaille sur l'objet VB g�n�ral printer
' 23/11/1999 PV
' 25/11/1999 PV Imprimante en mode portrait par d�faut
' 16/11/2000 PV Option mode pour ImprimanteRectoVerso
' 28/12/2000 PV bS�lectionImprimante
'  2/03/2001 PV ImprimanteR�solutionFaible

Option Explicit


Public Function bS�lectionImprimante(ByVal sImprimante As String) As Boolean
  sImprimante = Mid(sImprimante, 7)
  If sImprimante = "" Then sImprimante = sImprimanteWindowsD�faut
  
  Dim p As Printer
  For Each p In Printers
    If p.DeviceName = sImprimante Then
      Set Printer = p
      bS�lectionImprimante = True
      Exit Function
    End If
  Next
      
  MsgBox "Impossible de trouver l'imprimante " & sImprimante & vbCrLf & vbCrLf & "Vous devez s�lectionner une autere imprimante.", vbExclamation, App.Title
  bS�lectionImprimante = False
End Function



Public Function bS�lectionImprimantes(d As CommonDialog) As Boolean
  d.Flags = cdlPDNoPageNums Or cdlPDHidePrintToFile Or cdlPDNoSelection Or cdlPDUseDevModeCopies
  d.PrinterDefault = True
  d.CancelError = True
  On Error GoTo Annuler
  d.ShowPrinter
  bS�lectionImprimantes = True
  Exit Function
  
Annuler:
  bS�lectionImprimantes = False
End Function


Public Sub ImprimanteRectoVerso(Optional iMode As Integer = vbPRDPHorizontal)
  On Error Resume Next
  Printer.Duplex = iMode
End Sub


Public Sub ImprimantePapier(Optional iBac As Integer = vbPRBNAuto)
  On Error Resume Next
  Printer.PaperBin = iBac
End Sub


' Quand on demande plusieurs exemplaires en recto-verso, si le nombre de pages
' est impair, la 1�re page du deuxi�me exemplaire s'imprime au verso
' de la derni�re page du 1er exemplaire...
Public Function ImprimanteAjoute1PageSiRV() As Boolean
  ImprimanteAjoute1PageSiRV = False
  On Error Resume Next
  If Printer.Duplex <> vbPRDPSimplex Then
    Printer.NewPage
    Printer.Print "."
    ImprimanteAjoute1PageSiRV = True
  End If
End Function


Public Sub ImprimanteMilimetres(Optional Orientation As PrinterObjectConstants = vbPRORPortrait)
  Printer.Orientation = Orientation   ' On force le mode portrait, si le driver est en paysage par d�faut
  Printer.ScaleMode = vbMillimeters
  ' On consid�re que la zone d'impression est centr�e sur la page,
  ' sinon le point de coordonn�es (0,0) est le premier pixel imprimable en haut � gauche
  ' Du coup, les coordonn�es sont exprim�es en mm par rapport aux marges gauche et haut,
  ' ce qui est plus simple�
  Dim sw As Single, sh As Single
  sw = Printer.ScaleWidth
  sh = Printer.ScaleHeight
  If Orientation = vbPRORPortrait Then
    Printer.ScaleLeft = (210 - sw) / 2
    Printer.ScaleTop = (297 - sh) / 2
  Else
    Printer.ScaleLeft = (297 - sw) / 2
    Printer.ScaleTop = (210 - sh) / 2
  End If
End Sub


' Restaure 1 exemplaire pour l'imprimante
Public Sub Imprimante1Ex(d As CommonDialog)
  d.Copies = 1
  SendKeys "{Enter}"
  d.ShowPrinter
End Sub


' S�lectionne un mode 150dpi ou � d�faut r�solution moyenne
' pour �viter que les graphiques g�n�rent un volume d'impression trop important
Public Sub ImprimanteR�solutionFaible()
  On Error Resume Next
  Printer.PrintQuality = 150
  If Err <> 0 Then Printer.PrintQuality = vbPRPQMedium
End Sub
