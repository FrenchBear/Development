Attribute VB_Name = "ModEtiquette"
' ModEtiquette
' Formateur WPrint etiquette
' Utilise les polices Arial Narrow et Verdana
'
' 18/03/97 PV
' 27/08/97 PV VB5SP2; constante bAffichage
' 12/11/97 PV Kill du fichier de données en fin d'impression

Option Explicit

Public sVersion As String
Const sTitreApp = "Formateur WPrint étiquette"
Const sFormat = "etiquette.1"

#Const bImprime = True
#Const bAffichage = False

' Variables globales pour simplifier
' Requête
Dim sProtocole As String, sFormateur As String, sTitre As String, sUtilisateur As String, sDate As String, sImprimante As String

' Tête de planche
Dim sLettres As String, sNomAssistant As String, dDate

' Étiquette
Dim sRéférence As String, sValeur As String, sEtablissement As String

Dim iPage As Integer
Dim iNbEtiqTotal As Integer       ' Nb d'interventions imprimées au total



Sub Main()
  Dim sNomfic As String
  
  sVersion = "Etiquette " & App.Major & "." & App.Minor & "." & App.Revision
  
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
  
  ' Alimentation manuelle, mais pas supporté par tous les drivers
  On Error Resume Next
  Printer.PaperBin = vbPRBNManual
  On Error GoTo 0
  
#End If
  
  Do Until EOF(1)
#If bAffichage Then
    frmImprimante.Cls
#End If
    iPage = 0
    iNbEtiqTotal = 0
    
    Line Input #1, sLigne
    br.Buffer = sLigne
    br.GetField sLettres, sNomAssistant, dDate
    
    Do Until EOF(1)
      Line Input #1, sLigne
      If sLigne = "" Then Exit Do
      br.Buffer = sLigne
      br.GetField sRéférence, sValeur, sEtablissement
      
      If (iNbEtiqTotal Mod 44) = 0 Then
        iPage = iPage + 1
        
#If bAffichage Then
        If iPage > 1 Then MsgBox "Page suivante": frmImprimante.Cls
        EtiqEntête frmImprimante
#End If
#If bImprime Then
        If iPage > 1 Then Printer.NewPage
        EtiqEntête Printer
#End If
      End If
      
#If bAffichage Then
      Etiquette frmImprimante
#End If
#If bImprime Then
      Etiquette Printer
#End If
      iNbEtiqTotal = iNbEtiqTotal + 1
      
    Loop ' Etiquette suivante
    
  Loop ' Journal suivant
  
#If bAffichage Then
  Unload frmImprimante
#End If
#If bImprime Then
  On Error Resume Next
  Printer.EndDoc
  If Err Then
    MsgBox "Échec lors de l'accès à l'imprimante" & vbCrLf & "Erreur : " & Error, vbError, sVersion
  End If
  On Error GoTo 0
#End If

End Sub



Sub EtiqEntête(o As Object)
  ' Astuce d'initialisation
  Printer.FontTransparent = False
  Texte o, 0, 0, "."
  Printer.FontTransparent = True
  
  ' Bandeau d'identification
  With o.Font
    .Name = "Verdana"
    .bold = True
    .italic = True
    .Size = FSize(o, 9)
  End With
  Texte o, 10, 4, "Microb'Soft: Étiquettes"
  With o.Font
    .italic = False
    .bold = False
  End With
  o.Print " [" & sVersion & "] - Édité le " & Format(Now, "ddd dd mmm yyyy hh:MM") & " par " & sUtilisateur;
  
  If iPage > 1 Then
    TexteDroite o, 200, 4, "Page " & iPage
  End If
  
  o.Font.bold = True
  Texte o, 10, 7.25, sLettres & " " & sNomAssistant
  If Not IsNull(dDate) Then
    o.Print " "; Format(dDate, "dd/mm/yyyy")
  End If
End Sub


Sub Etiquette(o As Object)
  Dim fTop As Single, fLeft As Single
  
  fTop = 13 + 25 * ((iNbEtiqTotal Mod 44) \ 4)
  fLeft = 7 + 50.5 * (iNbEtiqTotal Mod 4)
  
  With o.Font
    .Name = "Arial Narrow"
    .bold = True
    .Size = FSize(o, 20)
  End With
  Texte o, fLeft, fTop + 1, sRéférence
  
  CodeBarre o, fLeft, fTop + 10, 0.31, 4.5, sValeur
  
  With o.Font
    .Name = "Verdana"
    .bold = False
    .Size = FSize(o, 6.75)
  End With
  BlocTexte o, fLeft, fTop + 15, 47, sEtablissement
End Sub

Sub CodeBarre(o As Object, ByVal x As Single, y As Single, fEchelle As Single, height As Single, sValeur As String)
  Dim sCode As String, i As Integer, l As Integer
  
  sCode = GénèreCode128(sValeur)
  For i = 1 To Len(sCode)
    l = Val(Mid(sCode, i, 1))
    If (i And 1) = 1 Then
      o.Line (x, y)-Step(l * fEchelle - 0.1, height), 0, BF
    End If
    x = x + l * fEchelle
  Next
End Sub

