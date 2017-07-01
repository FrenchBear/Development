Attribute VB_Name = "ModFRT"
' ModFRT
' Formateur WPrint FRT, Fiches Récapitulatives Tournée
' 12/11/97 PV Première version
'  5/12/97 PV Nom établissement, commentaires, température…
' 11/12/97 PV Espacement du code barre et module plus large (HP LaserJet3 150dpi)

Option Explicit

Public sVersion As String
Const sTitreApp = "Formateur WPrint FRT"
Const sFormat = "FRT.1"

#Const bImprime = True
#Const bAffichage = False

' Variables globales pour simplifier
' Requête
Dim sProtocole As String, sFormateur As String, sTitre As String, sUtilisateur As String, sDate As String, sImprimante As String
' Tête de planche
Dim iNumFRT As Long

' FRT
Dim sRéférence As String, sValeur As String, sEtablissement As String
Dim sProduit As String, sRemarques As String
Dim sCritère As String, sOptLabo As String, sTemp As String
Dim bRevivification As String, bIE As String, bFax As String

' Pagination
Dim iPage As Integer
Dim iNbEchantillonTotal As Integer



Sub Main()
  Dim sNomfic As String
  
  sVersion = "FRT " & App.Major & "." & App.Minor & "." & App.Revision
  
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
  
  ' Choix du papier auto, mais pas supporté par tous les drivers
  On Error Resume Next
  Printer.PaperBin = vbPRBNAuto
  On Error GoTo 0
#End If
  
  Do Until EOF(1)
#If bAffichage Then
    frmImprimante.Cls
#End If
    iPage = 0
    iNbEchantillonTotal = 0
    
    Line Input #1, sLigne
    br.Buffer = sLigne
    br.GetField iNumFRT
    
    Do Until EOF(1)
      Line Input #1, sLigne
      If sLigne = "" Then Exit Do
      br.Buffer = sLigne
      br.GetField sRéférence, sValeur, sEtablissement
      br.GetField sProduit, sRemarques
      br.GetField sCritère, sOptLabo, sTemp
      br.GetField bRevivification, bIE, bFax
      
      If (iNbEchantillonTotal Mod 18) = 0 Then
        iPage = iPage + 1
        
#If bAffichage Then
        If iPage > 1 Then FRTMessageSuite frmImprimante
        If iPage > 1 Then MsgBox "Page suivante": frmImprimante.Cls
        FRTEntête frmImprimante
#End If
#If bImprime Then
        If iPage > 1 Then FRTMessageSuite Printer
        If iPage > 1 Then Printer.NewPage
        FRTEntête Printer
#End If
      End If
      
#If bAffichage Then
      FRTEchantillon frmImprimante
#End If
#If bImprime Then
      FRTEchantillon Printer
#End If
      iNbEchantillonTotal = iNbEchantillonTotal + 1
      
    Loop ' FRT suivante
    
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



Sub FRTEntête(o As Object)
  ' Astuce d'initialisation, pour compenser un défaut du driver ou du VB5…
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
  Texte o, 9, 4, "Microb'Soft: FRT"
  With o.Font
    .italic = False
    .bold = False
  End With
  o.Print " [" & sVersion & "]"
  Texte o, 9, 7.5, "Édité le " & Format(Now, "ddd dd mmm yyyy hh:MM") & " par " & sUtilisateur
  
  If iPage > 1 Then
    TexteDroite o, 202, 12, "Page " & iPage
  End If
  
  o.Font.bold = True
  o.Font.Size = FSize(o, 22)
  TexteDroite o, 202, 2.5, "FRT " & iNumFRT
  
  o.Font.Size = FSize(o, 12)
  Texte o, 9, 20, "Technicienne :"
  
  Dim fTop As Single
  fTop = 33
  o.Line (7, fTop)-Step(195, 12.5), RGB(220, 220, 220), BF
  o.Line (7, fTop)-Step(195, 12.5), , B
  o.Line (94, fTop)-Step(0, 12.5)
  o.Line (167, fTop)-Step(0, 12.5)
  o.Line (188, fTop)-Step(0, 12.5)
  With o.Font
    .Name = "Verdana"
    .Size = FSize(o, 9)
  End With
  Texte o, 8, fTop + 1, "Référence"
  Texte o, 8, fTop + 4.5, "Code barre"
  Texte o, 8, fTop + 8, "Établissement"
  Texte o, 95, fTop + 1, "Produit"
  Texte o, 95, fTop + 4.5, "Remarques"
  Texte o, 168, fTop + 1, "Critère"
  Texte o, 168, fTop + 4.5, "Opt Labo"
  Texte o, 168, fTop + 8, "Temp"
  Texte o, 189, fTop + 1, "Reviv"
  Texte o, 189, fTop + 4.5, "IE"
  Texte o, 189, fTop + 8, "Fax"

End Sub


Sub FRTEchantillon(o As Object)
  Dim fTop As Single
  
  fTop = 33 + 12.5 * (1 + iNbEchantillonTotal Mod 18)
  o.Line (7, fTop)-Step(195, 12.5), , B
  o.Line (94, fTop)-Step(0, 12.5)
  o.Line (167, fTop)-Step(0, 12.5)
  o.Line (188, fTop)-Step(0, 12.5)
  
  With o.Font
    .Name = "Verdana"
    .bold = True
    .Size = FSize(o, 9)
  End With
  Texte o, 8, fTop + 0.5, sRéférence
  With o.Font
    .bold = False
    .Size = FSize(o, 6)
  End With
  Texte o, 8, fTop + 5.5, sValeur
  Texte o, 8, fTop + 9, sEtablissement
  
' 36 -> 40
  CodeBarre o, 40, fTop + 2, 0.3387, 6, sValeur
  
  o.Font.Size = FSize(o, 9)
  
  BlocTexte o, 95, fTop + 0.5, 73, sProduit, 2
  If sRemarques <> "" Then
    o.Line (94, fTop + 9)-(167, fTop + 12.5), RGB(200, 200, 200), BF
  End If
  BlocTexte o, 95, fTop + 8.5, 168 - 95, sRemarques, 1
  
  Texte o, 168, fTop + 0.5, sCritère
  Texte o, 168, fTop + 4.5, sOptLabo
  Texte o, 168, fTop + 8.5, sTemp
  
  Texte o, 189, fTop + 0.5, IIf(bRevivification, "Reviv", "")
  Texte o, 189, fTop + 4.5, IIf(bIE, "IE", "")
  Texte o, 189, fTop + 8.5, IIf(bFax, "Fax", "")
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


Sub FRTMessageSuite(o As Object)
  Dim fTop As Single
  
  fTop = 33 + 12.5 * 19
  With o.Font
    .Name = "Verdana"
    .bold = True
    .Size = FSize(o, 9)
  End With
  TexteDroite o, 202, fTop + 1, "Suite…"
End Sub
