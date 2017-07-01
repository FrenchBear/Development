Attribute VB_Name = "FormateTarifs"
' FormateTarifs
' Module de mise en page des tarifs
' 19/12/2000 PV
' 19/07/2001 PV Classe AV (ABVT)
' 23/07/2001 PV Détail des méthodes


Option Explicit


Private o As Object                     ' frmImpression ou printer
Private c As BDCurseur                  ' Curseur tarif courant

Private iPage As Integer                ' n° de page courante
Private l As Single                     ' ligne courante (en mm)


Private g_iSec As Integer
Private g_sTitre As String
Private g_bTitreSectionImprimé As Boolean


' Point d'entrée unique
Public Sub DoFormatageTarif(ct As BDCurseur, ByVal bImpression As Boolean, oCallBack As frmTarif, iTypeEtat As Integer)
  Set c = ct
  If bImpression Then
    If Not bSélectionImprimantes(MDIServeur.cdPrinter) Then Exit Sub
    Screen.MousePointer = vbHourglass
    SetStatus "Impression en cours, patientez..."
    If bOptionRectoVerso Then ImprimanteRectoVerso
    ImprimanteMilimetres
  
    Set o = Printer
    DoFormatage
    
    If iPage > 0 Then
      If iPage And 1 Then ImprimanteAjoute1PageSiRV
      o.EndDoc
    End If

    ' On restaure le nombre d'exemplaires par défaut à 1
    If MDIServeur.cdPrinter.Copies > 1 Then Imprimante1Ex MDIServeur.cdPrinter
    
    SetStatus
    Screen.MousePointer = vbDefault
  Else
    Set o = New frmImprimante
    o.Show
    o.Height = MDIServeur.ScaleHeight - o.Top
    o.Width = o.Height / 297 * 210
    o.ScaleHeight = 297
    o.ScaleWidth = 210
    o.iTypeEtat = iTypeEtat
    Set o.CallBack = oCallBack
    DoFormatage
  End If
End Sub



Private Sub DoFormatage()
  iPage = 0
  NouvellePage
  
  With o.Font
    .Bold = True
    .Size = FSize(o, 12)
  End With
  Texte o, 10, 17, "Tarif " & c!tar_numtarif & " " & c!tar_libelle
  With o.Font
    .Bold = False
    .Size = FSize(o, 9)
  End With
  If Not IsNull(c!tar_tarifbase) Then
    Texte o, 10, 24, "Basé sur le tarif " & c!tar_tarifbase & " " & sNomTarif(c!tar_tarifbase)
  End If
  If Not IsNull(c!tar_remiseb) Then Texte o, 10, 29, "Remise B: " & c!tar_remiseb & " % sur le tarif de base bactério (param<1000)"
  If Not IsNull(c!tar_remisec) Then Texte o, 10, 33, "Remise C: " & c!tar_remisec & " % sur le tarif de base chimie (param>1000)"
  Texte o, 10, 38, NV(c!tar_comment) & "    " & c!timestamp
  
  l = 45
  Section 0, "Forfaits globaux"
  Section 1, "Prix par classe de document"
  Section 2, "Prix par critère/EH"
  Section 3, "Prix par param."
  Section 4, "Prix complémentaires"
  Section 5, "Prix Satti"
End Sub


Private Sub Section(iSec As Integer, sTitre As String)
  g_iSec = iSec
  g_sTitre = sTitre
  g_bTitreSectionImprimé = False

  Dim cd As New BDCurseur
  cd.OpenCurseur "select * from tarifdetail " & _
                 "  where td_numtarif=" & c!tar_numtarif & _
                 "  and td_niveau between " & iSec * 10 & " and " & iSec * 10 + 9 & _
                 "  order by td_niveau, td_index"
  Do Until cd.EOF
    UnTarif cd
    cd.MoveNext
  Loop
  cd.CloseCurseur
End Sub


Private Sub TitreSection(iSec As Integer, sTitre As String)
  If l > 270 Then NouvellePage
  
  l = l + 2
  With o.Font
    .Name = "Verdana"
    .Bold = True
    .Underline = True
    .Size = FSize(o, 10.5)
  End With
  Texte o, 10, l, sTitre
  With o.Font
    .Bold = False
    .Size = FSize(o, 8)
  End With
  
  If iSec = 3 Then
    Texte o, 45, l + 0.7, "Param."
    Texte o, 94, l + 0.7, "Méthode"
    Texte o, 130, l + 0.7, "Quantité"
'    Texte o, 105, l + 0.7, "Sensibilité"
'    Texte o, 125, l + 0.7, "Ss-traitant"
  End If
  
  o.Font.Underline = False
  l = l + 5
  
  g_bTitreSectionImprimé = True
End Sub


Private Sub UnTarif(cd As BDCurseur)
  If l > 280 Then NouvellePage
  
  If Not g_bTitreSectionImprimé Then TitreSection g_iSec, g_sTitre
  
  Texte o, 10, l, cd!td_niveau
  If cd!td_niveau = 30 Then
    Dim v
    v = Split(cd!td_option, "/")
    Texte o, 16, l, cd!td_option
    TexteTronqué o, 45, 93, l, sNomParamètre(Val(v(0)))
    TexteTronqué o, 94, 129, l, sNomMéthode(Val(v(0)), CStr(v(1)))
    Texte o, 130, l, CStr(v(2))    ' Quantité
'    Texte o, 105, l, CStr(v(3))    ' Sensibilité
'    Texte o, 125, l, CStr(v(4))    ' Sous-traitant
  Else
    Texte o, 16, l, sLibOption(cd!td_niveau, NV(cd!td_option))
    o.Line (o.CurrentX, o.CurrentY + 3)-(140, o.CurrentY + 3)
  End If

  If Not IsNull(cd!td_montant) Then
    TexteDroite o, 160, l, Format(cd!td_montant, "0.00") & " " & sDevise(cd!td_devise)
  End If
  If Not IsNull(cd!td_remise) Then
    TexteDroite o, 160, l, cd!td_remise & " %"
  End If
  BlocTexte o, 165, l, 35, NV(cd!td_comment), 1
  l = l + 3.5
End Sub


Public Function sDevise(cDevise As String) As String
  Select Case cDevise
    Case "F":   sDevise = "F"
    Case "E":   sDevise = "€"
    Case Else:  sDevise = cDevise
  End Select
End Function



Private Function NouvellePage() As Boolean
  If iPage > 0 Then
    If o Is Printer Then
      Printer.NewPage
      SetStatus "Impression en cours, page " & iPage
    Else
      Dim iRep As VbMsgBoxResult
      iRep = MsgBox("Page suivante ?", vbQuestion + vbYesNo)
      If iRep = vbNo Then
        Unload o
        NouvellePage = False
        Exit Function
      End If
      o.Cls
    End If
  End If
  
  NouvellePage = True
  iPage = iPage + 1
  
  ' Bandeau d'identification
  o.FontTransparent = False
  Texte o, 0, 0, "."
  o.FontTransparent = True
  
  With o.Font
    .Name = "Verdana"
    .Bold = True
    .Italic = True
    .Size = FSize(o, 10)
  End With
  Texte o, 10, 8, "Microb'Soft: Tarifs"
  With o.Font
    .Name = "Courier new"
    .Size = FSize(o, 8)
    .Italic = False
    .Bold = False
  End With
  Texte o, o.CurrentX, 10, " - Édition du " & Format(Now, "ddd dd mmm yyyy hh:MM") & " [" & sNomOpérateur & "]"
  TexteDroite o, 202, 10, "Page " & iPage
  
  With o.Font
    .Name = "Verdana"
    .Bold = False
    .Size = FSize(o, 8.5)
  End With
  
  l = 15
End Function


Public Function sNomTarif(t As Integer) As String
  sNomTarif = BDCurseurExpress("select tar_libelle from tarif where tar_numtarif=" & t)
End Function


Public Function sLibOption(ByVal iNiveau As Integer, ByVal sOption As String) As String
  Select Case iNiveau
    Case 0:   sLibOption = "Forfait prestation"
    Case 1:   sLibOption = "Forfait déplacement"
    Case 2:   sLibOption = "Rub fac " & sOption
    Case 9:   sLibOption = "Prix Le (Légionelle)"
    Case 10:  sLibOption = "Prix AV (ABVT)"
    Case 11:  sLibOption = "Prix AB (Analyse Bactério)"
    Case 12:  sLibOption = "Prix EH (Évaluation Hygiène)"
    Case 14:  sLibOption = "Prix FS (Frottis de Surface)"
    Case 15:  sLibOption = "Prix Ch (Chimie)"
    Case 16:  sLibOption = "Prix BS (Bactério Spéciale)"
    Case 17:  sLibOption = "Prix Li (Listeria)"
    Case 18:  sLibOption = "Prix Hu (Huile)"
    Case 19:  sLibOption = "Prix BM (OGM)"
    Case 20:  sLibOption = "Critère " & sOption
    Case 21:  sLibOption = "FDA " & sOption
    Case 22:  sLibOption = "EH " & sOption
    Case 30:  sLibOption = "Param " & sOption
    Case 31:  sLibOption = "Prise en charge Bactério"
    Case 32:  sLibOption = "Prise en charge Chimie"
    Case 33:  sLibOption = "Prise en charge Surface"
    Case 40:  sLibOption = sOption
'    Case 50:  sLibOption = "Satti contrat hygiéno " & sOption
'    Case 51:  sLibOption = "Satti catégorie bactério B " & sOption
'    Case 52:  sLibOption = "Satti catégorie chimie C " & sOption
'    Case 53:  sLibOption = "Satti catégorie surface S " & sOption
'    Case 54:  sLibOption = "Satti paramètre P " & sOption
    Case Else: sLibOption = "???? " & sOption
  End Select
End Function

