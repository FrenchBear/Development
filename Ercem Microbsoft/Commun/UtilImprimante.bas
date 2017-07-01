Attribute VB_Name = "UtilImprimante"
' UtilImprimante
' Fonctions générales de gestion des imprimantes
' Travaille sur l'objet VB général printer
' 23/11/1999 PV
' 25/11/1999 PV Imprimante en mode portrait par défaut
' 16/11/2000 PV Option mode pour ImprimanteRectoVerso
' 28/12/2000 PV bSélectionImprimante
'  2/03/2001 PV ImprimanteRésolutionFaible

Option Explicit


Public Function bSélectionImprimante(ByVal sImprimante As String) As Boolean
  sImprimante = Mid(sImprimante, 7)
  If sImprimante = "" Then sImprimante = sImprimanteWindowsDéfaut
  
  Dim p As Printer
  For Each p In Printers
    If p.DeviceName = sImprimante Then
      Set Printer = p
      bSélectionImprimante = True
      Exit Function
    End If
  Next
      
  MsgBox "Impossible de trouver l'imprimante " & sImprimante & vbCrLf & vbCrLf & "Vous devez sélectionner une autere imprimante.", vbExclamation, App.Title
  bSélectionImprimante = False
End Function



Public Function bSélectionImprimantes(d As CommonDialog) As Boolean
  d.Flags = cdlPDNoPageNums Or cdlPDHidePrintToFile Or cdlPDNoSelection Or cdlPDUseDevModeCopies
  d.PrinterDefault = True
  d.CancelError = True
  On Error GoTo Annuler
  d.ShowPrinter
  bSélectionImprimantes = True
  Exit Function
  
Annuler:
  bSélectionImprimantes = False
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
' est impair, la 1ère page du deuxième exemplaire s'imprime au verso
' de la dernière page du 1er exemplaire...
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
  Printer.Orientation = Orientation   ' On force le mode portrait, si le driver est en paysage par défaut
  Printer.ScaleMode = vbMillimeters
  ' On considère que la zone d'impression est centrée sur la page,
  ' sinon le point de coordonnées (0,0) est le premier pixel imprimable en haut à gauche
  ' Du coup, les coordonnées sont exprimées en mm par rapport aux marges gauche et haut,
  ' ce qui est plus simple…
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


' Sélectionne un mode 150dpi ou à défaut résolution moyenne
' pour éviter que les graphiques génèrent un volume d'impression trop important
Public Sub ImprimanteRésolutionFaible()
  On Error Resume Next
  Printer.PrintQuality = 150
  If Err <> 0 Then Printer.PrintQuality = vbPRPQMedium
End Sub
