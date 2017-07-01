Attribute VB_Name = "ModJournal"
' ModJournal
' Formateur WPrint journal
' 18/03/97 PV
' 27/08/97 PV VB5SP2; constante bAffichage
' 12/11/97 PV Kill du fichier de données à la fin d'une impression

Option Explicit

Public sVersion As String
Const sTitreApp = "Formateur WPrint journal"
Const sFormat = "journal.1"

#Const bImprime = True
#Const bAffichage = False

Const iMaxIntParPage = 35
Const iMaxIntPageFin = 24

' Variables globales pour simplifier
' Requête
Dim sProtocole As String, sFormateur As String, sTitre As String, sUtilisateur As String, sDate As String, sImprimante As String
' Planning
Dim dDatePlan As Date, sLettres As String, sNomAssistant As String, iJournal As Integer, iPersClot, sNomPersClot As String, dDateClot, sSysRef As String
' Intervention
Dim sRef As String, sNomEtb As String, iEtb As Long, iSec As Long, iUnité As Integer, sNomUnité As String, iPers As Integer, sNomPers As String, iNbAb, iNbBs, iNbLi, iNbFs, iNbCh, iNbEh, iNbrAn, sComment

Dim iPage As Integer
Dim iNbIntTotal As Integer       ' Nb d'interventions imprimées au total
Dim iNbIntSurPage As Integer     ' Nb d'interventions imprimées sur la page
Dim iTotAb As Integer, iTotBs As Integer, iTotLi As Integer, iTotFS As Integer, iTotCh As Integer, iTotEh As Integer


Sub Main()
  Dim sNomfic As String
  
  sVersion = "Journal " & App.Major & "." & App.Minor & "." & App.Revision
  
  If Command = "" Then
    SaveSetting "WPrint", "Formateurs", sFormat, App.Path & "\" & App.EXEName & ".exe"
    MsgBox "Usage: " & App.EXEName & " nom_fichier" & vbCrLf & sVersion & ": " & sTitreApp & vbCrLf & vbCrLf & "Le formateur a été enregistré pour WPrint.", vbInformation, sVersion
    Exit Sub
  End If
  
  ' Version simplifiée en attendant le traitement des options
  sNomfic = Command
  
  ChDrive Left(App.Path, 2)
  ChDir App.Path
  On Error GoTo pb_ouverture
  Open sNomfic For Input As #1
  On Error GoTo 0
  DoFormatage
  Close #1
  
#If bImprime Then
  ' En mode impression, on renomme le fichier de données .bak
  ' Valable uniquement pendant la mise au point, après on effacera.
  'Name sNomfic As sNomfic & ".bak"
  
  Kill sNomfic
#End If

fin:
  Exit Sub
  
pb_ouverture:
  MsgBox "Échec à l'ouverture du fichier '" & sNomfic & "'" & vbCrLf & vbCrLf & "Répertoire courant : " & CurDir & vbCrLf & "Erreur : " & Error, vbError, sVersion
  Resume fin
End Sub


Sub DoFormatage()
  Dim sLigne As String
  Line Input #1, sLigne
  
  Dim br As New Rev
  br.Buffer = sLigne
  br.GetField sProtocole, sFormateur, sTitre, sUtilisateur, sDate, sImprimante
  
  If sFormateur <> sFormat Then
    MsgBox App.EXEName & " ne sait formater que des flots de données de type " & sFormat & " alors que le fichier " & Command & " contient des données de type " & sFormateur
    Exit Sub
  End If
  
  If Not IsImprimante(sImprimante) Then
    MsgBox App.EXEName & ": imprimante " & sImprimante & " inconnue !"
    Exit Sub
  End If
  
#If bAffichage Then
  frmImprimante.Show
  frmImprimante.Caption = sVersion & " - Impression"
#End If
#If bImprime Then
  Set Printer = GetImprimante(sImprimante)
  Printer.ScaleMode = 6      ' mm
  ' On considère que la zone d'impression est centrée sur la page,
  ' sinon le point de coordonnées (0,0) est le premier pixel imprimable en haut à gauche
  ' Du coup, les coordonnées sont exprimées en mm par rapport aux marges gauche et haut,
  ' ce qui est plus simple…
  Dim sw As Single, sh As Single
  sw = Printer.ScaleWidth
  sh = Printer.ScaleHeight
  Printer.ScaleLeft = (210 - sw) / 2
  Printer.ScaleTop = (297 - sh) / 2
#End If
  
  Dim bDéjàImprimé As Boolean
  bDéjàImprimé = False
  Do Until EOF(1)
#If bAffichage Then
    frmImprimante.Cls
#End If
    iPage = 0
    
    Line Input #1, sLigne
    If sLigne = "" Then Exit Do     ' Fins de lignes parasites en fin de fichier
    br.Buffer = sLigne
    br.GetField dDatePlan, sLettres, sNomAssistant, iJournal, iPersClot, sNomPersClot, dDateClot, sSysRef
    
#If bImprime Then
    If bDéjàImprimé Then
      Printer.NewPage
    Else
      bDéjàImprimé = True
    End If
#End If

    iNbIntTotal = 0
    iTotAb = 0
    iTotBs = 0
    iTotLi = 0
    iTotFS = 0
    iTotCh = 0
    iTotEh = 0
    
    Do Until EOF(1)
      Line Input #1, sLigne
      If sLigne = "" Then Exit Do
      br.Buffer = sLigne
      br.GetField sRef, sNomEtb, iEtb, iSec, iUnité, sNomUnité, iPers, sNomPers, iNbAb, iNbBs, iNbLi, iNbFs, iNbCh, iNbEh, iNbrAn, sComment
      
      If (iNbIntTotal Mod iMaxIntParPage) = 0 Then
        iPage = iPage + 1
        
#If bAffichage Then
        If iPage > 1 Then MsgBox "Page suivante": frmImprimante.Cls
        JournalEntête frmImprimante
#End If
#If bImprime Then
        If iPage > 1 Then Printer.NewPage
        JournalEntête Printer
#End If
      End If
      
#If bAffichage Then
      JournalCorps frmImprimante
#End If
#If bImprime Then
      JournalCorps Printer
#End If
      iNbIntTotal = iNbIntTotal + 1
      iNbIntSurPage = iNbIntSurPage + 1
      
      If IsNumeric(iNbAb) Then iTotAb = iTotAb + iNbAb
      If IsNumeric(iNbBs) Then iTotBs = iTotBs + iNbBs
      If IsNumeric(iNbLi) Then iTotLi = iTotLi + iNbLi
      If IsNumeric(iNbFs) Then iTotFS = iTotFS + iNbFs
      If IsNumeric(iNbCh) Then iTotCh = iTotCh + iNbCh
      If IsNumeric(iNbEh) Then iTotEh = iTotEh + iNbEh
    Loop
    
    ' S'il ne reste pas assez de place en bas de la dernière page,
    ' on passe à la page suivante
    If (iNbIntTotal Mod iMaxIntParPage) > iMaxIntPageFin Then
      iPage = iPage + 1
      
#If bAffichage Then
      MsgBox "Page suivante"
      frmImprimante.Cls
      JournalEntête frmImprimante
#End If
#If bImprime Then
      If iPage > 1 Then Printer.NewPage
      JournalEntête Printer
#End If
    End If

    
    ' Pied de journal
#If bAffichage Then
    JournalPied frmImprimante
#End If
#If bImprime Then
    JournalPied Printer
#End If

  Loop ' Journal suivant
  
#If bImprime Then
  If iPage > 0 Then Printer.EndDoc
#End If
#If bAffichage Then
  Unload frmImprimante
#End If

End Sub



Sub JournalEntête(o As Object)
  ' Bandeau d'identification
  Texte o, 0, 0, "."
  With o.Font
    .Name = "Verdana"
    .bold = True
    .italic = True
    .Size = FSize(o, 9)
  End With
  Texte o, 10, 12, "Microb'Soft: Planning"
  With o.Font
'    .Size = FSize(o, 8)
    .italic = False
    .bold = False
  End With
  o.Print " [" & sVersion & "] - Édité le " & Format(Now, "ddd dd mmm yyyy hh:MM") & " par " & sUtilisateur;
  
  If iPage > 1 Then
    TexteDroite o, 200, 12, "Page " & iPage
  End If
  
  ' Tête du journal
  o.DrawWidth = 3
  o.Line (10, 20)-(200, 40), 0, B
  o.Line (10, 30)-(200, 30)
  o.Line (30, 30)-Step(0, 10)
  o.Line (158, 30)-Step(0, 10)
  o.Line (165, 35)-Step(0, 5)
  o.Line (172, 35)-Step(0, 5)
  o.Line (179, 35)-Step(0, 5)
  o.Line (186, 35)-Step(0, 5)
  o.Line (193, 30)-Step(0, 10)
  o.Line (158, 35)-Step(35, 0)
  o.Line (200, 21)-Step(1, 19), 0, BF
  
  With o.Font
    .Size = FSize(o, 10)
    .bold = True
  End With
  o.FontTransparent = False   ' Sinon sur la 5Si le texte n'est pas transparent
  Texte o, 30, 20.5, IIf(iJournal, "JOURNAL", "PLANNING")
  If Not IsNull(dDateClot) Then o.Print " Définitif"
  o.FontTransparent = True    ' Suite de l'astuce pour 5Si
  o.Font.bold = False
  Texte o, 110, 20.5, "DATE :"
  Texte o, 110, 25, "LETTRES :"
  o.Font.bold = True
  Texte o, 133, 20.5, Format(dDatePlan, "dd/mm/yyyy")
  Texte o, 133, 25, sLettres
  o.Font.Size = FSize(o, 9)
  Texte o, 140, 25.4, sNomAssistant
  o.Font.bold = False
  If Not IsNull(dDateClot) Then
    Texte o, 30, 25, "Clôt le " & Format(dDateClot, "dd/mm/yyyy") & " par " & iPersClot & ": " & sNomPersClot
  End If
  
  o.Font.Size = FSize(o, 9.5)
  TexteCentré o, 10, 30, 30.5, "Réf. " & sSysRef
  TexteCentré o, 30, 158, 30.5, "Nom de l'établissement"
  TexteCentré o, 158, 193, 30.5, "ANALYSES"
  TexteCentré o, 158, 165, 35.5, "AB"
  TexteCentré o, 165, 172, 35.5, "BS"
  TexteCentré o, 172, 179, 35.5, "LI"
  TexteCentré o, 179, 186, 35.5, "FS"
  TexteCentré o, 186, 193, 35.5, "Ch"
  TexteCentré o, 193, 200, 30.5, "EH"
  
  iNbIntSurPage = 0
End Sub


Sub JournalCorps(o As Object)
  Dim fTop As Single
  Dim iNbAb2, iNbrAn2
  
  fTop = 40 + 7 * iNbIntSurPage
  o.Line (200, fTop)-Step(1, 7), 0, BF
  
  iNbrAn2 = IIf(IsNull(iNbrAn), 0, iNbrAn)
  iNbAb2 = IIf(IsNull(iNbAb), 0, iNbAb)
  If iNbrAn2 <> iNbAb2 Then o.Line (158, fTop)-Step(7, 4), RGB(200, 200, 200), BF

  o.Font.Size = FSize(o, 9)
  Texte o, 12, fTop + 1.5, sRef
  o.Font.bold = True
  Texte o, 32, fTop + 0.1, sNomEtb
  o.Font.bold = False
  TexteDroite o, 164, fTop + 0.1, Format(iNbAb)
  TexteDroite o, 171, fTop + 0.1, Format(iNbBs)
  TexteDroite o, 178, fTop + 0.1, Format(iNbLi)
  TexteDroite o, 185, fTop + 0.1, Format(iNbFs)
  TexteDroite o, 192, fTop + 0.1, Format(iNbCh)
  If Not IsNull(iNbEh) Then TexteCentré o, 193, 200, fTop + 0.1, IIf(iNbEh = 1, "EH", Format(iNbEh))
  o.Font.Size = FSize(o, 6.5)
  Texte o, 32, fTop + 3.8, iEtb & "/" & iSec
  Texte o, 57, fTop + 3.8, iUnité & ": " & sNomUnité
  Texte o, 77, fTop + 3.8, iPers & ": " & sNomPers
  Texte o, 159, fTop + 3.9, IIf(IsNull(sComment), "", sComment)
  
  o.Line (10, fTop)-Step(190, 7), 0, B
  o.Line (30, fTop)-Step(0, 7)
  o.Line (158, fTop)-Step(0, 7)
  o.Line (165, fTop)-Step(0, 4)
  o.Line (172, fTop)-Step(0, 4)
  o.Line (179, fTop)-Step(0, 4)
  o.Line (186, fTop)-Step(0, 4)
  o.Line (193, fTop)-Step(0, 4)
  o.Line (158, fTop + 4)-Step(42, 0)
End Sub


Sub JournalPied(o As Object)
  Dim fTop As Single
  
  fTop = 40 + 7 * iNbIntSurPage
  o.Line (11, fTop)-Step(190, 1), 0, BF
  
  o.Font.Size = FSize(o, 9)
  
  Texte o, 12, fTop + 1, iNbIntTotal & " intervention"
  If iNbIntTotal > 1 Then o.Print "s";
  If iTotAb > 0 Then TexteDroite o, 164, fTop + 1, Format(iTotAb)
  If iTotBs > 0 Then TexteDroite o, 171, fTop + 1, Format(iTotBs)
  If iTotLi > 0 Then TexteDroite o, 178, fTop + 1, Format(iTotLi)
  If iTotFS > 0 Then TexteDroite o, 185, fTop + 1, Format(iTotFS)
  If iTotCh > 0 Then TexteDroite o, 192, fTop + 1, Format(iTotCh)
  If iTotEh > 0 Then TexteDroite o, 199, fTop + 1, Format(iTotEh)
  
  Texte o, 10, 215, "Tournée effective le"
  TexteDroite o, 77, 215, ":"
  Texte o, 115, 215, "Documents envoyés le"
  TexteDroite o, 177, 215, ":"
  
  Texte o, 10, 221, "Remis au labo le"
  TexteDroite o, 77, 221, ":"
  Texte o, 115, 221, "Date d'envoi des échantillons"
  TexteDroite o, 177, 221, ":"
  
  o.Font.Underline = True
  Texte o, 10, 227, "Saisie / 1ère lecture"
  Texte o, 115, 227, "Correction / 2ème lecture"
  o.Font.Underline = False
  
  Texte o, 10, 233, "Date d'arrivée des FP"
  TexteDroite o, 77, 233, ":"
  Texte o, 115, 233, "Date de retour en saisie"
  TexteDroite o, 177, 233, ":"
  
  Texte o, 10, 239, "Saisi par :"
  TexteDroite o, 77, 239, "Le :"
  Texte o, 115, 239, "Corrigé par :"
  TexteDroite o, 177, 239, "Le :"
  
  Texte o, 10, 245, "Date de remise en relecture"
  TexteDroite o, 77, 245, ":"
  Texte o, 115, 245, "Date de remise en relecture"
  TexteDroite o, 177, 245, ":"
  
  Texte o, 10, 251, "Relu par :"
  TexteDroite o, 77, 251, "Le :"
  Texte o, 115, 251, "Relu par :"
  TexteDroite o, 177, 251, "Le :"
  
  Texte o, 10, 257, "Conclusion"
  TexteDroite o, 77, 257, ":"
  Texte o, 115, 257, "Conclusion"
  TexteDroite o, 177, 257, ":"
  
  Texte o, 10, 263, "Validé en relecture par"
  TexteDroite o, 77, 263, ":"
  Texte o, 115, 263, "Le :"
  
  ' Calendrier
  Dim i As Integer, d As Date
  d = dDatePlan
  For i = 0 To 9
    If WeekDay(d) = vbSunday Or WeekDay(d) = vbSaturday Then
      o.Line (10 + 19 * i, 273)-Step(19, 7), RGB(200, 200, 200), BF
    End If
    o.Line (10 + 19 * i, 273)-Step(0, 7)
    o.Line -Step(19, 0)
    o.Line -Step(0, -7)
    Texte o, 11 + 19 * i, 272.5, Format(d, "ddd dd")
    If i = 0 Or Day(d) = 1 Then Texte o, 11 + 19 * i, 276, Format(d, "mmm")
    d = d + 1
  Next
End Sub

