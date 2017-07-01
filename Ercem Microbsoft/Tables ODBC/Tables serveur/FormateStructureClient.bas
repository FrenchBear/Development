Attribute VB_Name = "FormateStructureClient"
' FormateStructureClient
' Module d'impression de la structure client
' 30/09/1999 PV
'  3/11/1999 PV Détail
' 25/11/1999 PV Impression des tarifs, mode paysage
'  2/08/2001 PV Fin du filtrage Ercem/Fimebio, et du détail tarifs


Option Explicit

Private o As Object
Private iPage As Integer, iLigne As Integer
Private iPageSommaire As Integer
Private iLastSec As Long, iLastDrg As Long, iLastDna As Long, iLastGrp As Long

Private iDétail As Integer              ' 1:Prestation, 2:Grilles,  (ex:3:Tarifs)

Private g_sWP As String                 ' Requête de sélection

' Dimensions de la page
Private iLargeur As Integer             ' Largeur en mm
Private iHauteur As Integer             ' Hauteur en mm
Private iTaillePage As Integer          ' Nb de lignes par page

' Collections et recordsets
Private rCli As ADODB.Recordset         ' Ensemble des établissements sélectionnés
Private cSec As New Collection          ' Collection des secteurs concernés
Private cDrg As New Collection
Private cDna As New Collection
Private cGrp As New Collection

' Formatage de la zone détail
Private Const x0Détail As Single = 117  ' Marge de gauche du détail
Private Const wPrix = 11.5              ' Largeur d'un prix
Private Const wLibellé = 21.5           ' Largeur d'un libellé supplémentaire

' Sommaire
Private rSommaire As ADODB.Recordset



Public Sub FormateStructure(ByVal sWP As String, ByVal bImpression As Boolean, oCallBack As Form, iTypeEtat As Integer)
  frmOptionsStructure.Options iDétail
  If iDétail = 0 Then Exit Sub
  
  If iDétail = 3 Then   ' ex-Tarifs en mode paysage
    iHauteur = 210
    iLargeur = 297
    iTaillePage = 55
  Else
    iHauteur = 297
    iLargeur = 210
    iTaillePage = 82
  End If

  
  If bImpression Then
    If Not bSélectionImprimantes(MDIServeur.cdPrinter) Then Exit Sub
    Screen.MousePointer = vbHourglass
    SetStatus "Impression en cours, patientez..."
    If bOptionRectoVerso Then ImprimanteRectoVerso
    ImprimanteMilimetres IIf(iDétail = 3, vbPRORLandscape, vbPRORPortrait)
    Set o = Printer
    DoFormatage sWP
    
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
    o.Width = o.Height / iHauteur * iLargeur
    o.ScaleHeight = iHauteur
    o.ScaleWidth = iLargeur
    Set o.CallBack = oCallBack
    o.iTypeEtat = iTypeEtat
    DoFormatage sWP
  End If
End Sub


Private Sub DoFormatage(sWP As String)
  Dim sSQL As String
  
  Set rCli = New ADODB.Recordset
  rCli.Fields.Append "etb_numetb", adVarChar, 6
  rCli.Fields.Append "etb_prefixe", adVarChar, 16
  rCli.Fields.Append "etb_nom", adVarChar, 41
  rCli.Fields.Append "sec_numsec", adInteger
  rCli.Fields.Append "drg_numdrg", adInteger
  rCli.Fields.Append "dna_numdna", adInteger
  rCli.Fields.Append "grp_numgrp", adInteger
  rCli.Fields.Append "sec_nom", adVarChar, 41
  rCli.Fields.Append "drg_nom", adVarChar, 41
  rCli.Fields.Append "dna_nom", adVarChar, 41
  rCli.Fields.Append "grp_nom", adVarChar, 41

  sSQL = "select etb_numetb,etb_prefixe,etb_nom,sec_numsec,drg_numdrg,dna_numdna,grp_numgrp"
  
  Select Case iDétail
    Case 1
      sSQL = sSQL & ",etb_unite,etb_prest"
      rCli.Fields.Append "etb_unite", adSmallInt, , adFldIsNullable
      rCli.Fields.Append "etb_prest", adVarChar, 40, adFldIsNullable
      
    Case 2
      sSQL = sSQL & ",etb_typeh1,etb_sceeh1,etb_typeh2,etb_sceeh2,etb_typeh3,etb_sceeh3,etb_typeh4,etb_sceeh4"
      rCli.Fields.Append "etb_typeh1", adSmallInt, , adFldIsNullable
      rCli.Fields.Append "etb_sceeh1", adSmallInt, , adFldIsNullable
      rCli.Fields.Append "etb_typeh2", adSmallInt, , adFldIsNullable
      rCli.Fields.Append "etb_sceeh2", adSmallInt, , adFldIsNullable
      rCli.Fields.Append "etb_typeh3", adSmallInt, , adFldIsNullable
      rCli.Fields.Append "etb_sceeh3", adSmallInt, , adFldIsNullable
      rCli.Fields.Append "etb_typeh4", adSmallInt, , adFldIsNullable
      rCli.Fields.Append "etb_sceeh4", adSmallInt, , adFldIsNullable
      
  End Select

  g_sWP = sWP
  sSQL = sSQL & " from etablissement,secteur,dirreg,dirnat,groupe where " & sWP
  sSQL = sSQL & " and etb_etat is null and sec_numsec=etb_numsec and drg_numdrg=sec_numdrg and dna_numdna=drg_numdna and grp_numgrp=dna_numgrp"

  iPage = 0
  iLigne = 0
  iLastGrp = -1
  
  DoEvents    ' Effacement de la boîte de dialogue/réaffichage de la feuille
  SetStatus "Recherche des données en cours..."
  rCli.Open
  
  Dim cs As New BDCurseur
  cs.OpenCurseur sSQL
  Do Until cs.EOF
    If cs.AbsolutePosition Mod 50 = 0 Then
      SetStatus "Lu: " & cs.AbsolutePosition & " enregistrements"
    End If
    
    rCli.AddNew
    rCli!etb_numetb = cs!etb_numetb
    rCli!etb_prefixe = cs!etb_prefixe
    rCli!etb_nom = cs!etb_nom
    rCli!sec_numsec = cs!sec_numsec
    rCli!drg_numdrg = cs!drg_numdrg
    rCli!dna_numdna = cs!dna_numdna
    rCli!grp_numgrp = cs!grp_numgrp
    
    Select Case iDétail
      Case 1
        rCli!etb_unite = cs!etb_unite
        rCli!etb_prest = cs!etb_prest
        
      Case 2
        rCli!etb_typeh1 = cs!etb_typeh1
        rCli!etb_sceeh1 = cs!etb_sceeh1
        rCli!etb_typeh2 = cs!etb_typeh2
        rCli!etb_sceeh2 = cs!etb_sceeh2
        rCli!etb_typeh3 = cs!etb_typeh3
        rCli!etb_sceeh3 = cs!etb_sceeh3
        rCli!etb_typeh4 = cs!etb_typeh4
        rCli!etb_sceeh4 = cs!etb_sceeh4
        
    End Select
    
    cs.MoveNext
  Loop
  cs.CloseCurseur
  
  Recup "secteur", "secteurs", "sec_numsec", "sec_nom", cSec
  Recup "dirreg", "directions régionales", "drg_numdrg", "drg_nom", cDrg
  Recup "dirnat", "directions nationales", "dna_numdna", "dna_nom", cDna
  Recup "groupe", "groupes", "grp_numgrp", "grp_nom", cGrp
  
  Set rSommaire = New ADODB.Recordset
  rSommaire.Fields.Append "niveau", adSmallInt
  rSommaire.Fields.Append "num", adVarChar, 6
  rSommaire.Fields.Append "nom", adVarChar, 41
  rSommaire.Fields.Append "page", adSmallInt
  rSommaire.Open
  
  SetStatus "Formatage en cours..."
  rCli.Sort = "grp_numgrp,dna_numdna,drg_numdrg,sec_numsec,etb_nom"
  rCli.MoveFirst
  Do Until rCli.EOF
    FormateEnregistrement rCli
    rCli.MoveNext
  Loop
  FormateSommaire

Sortie:
  Set cSec = Nothing
  Set cDrg = Nothing
  Set cDna = Nothing
  Set cGrp = Nothing
  rCli.Close
  Set rCli = Nothing
  rSommaire.Close
  Set rSommaire = Nothing
  Exit Sub
  
Problème:
  MessageErreurStandard "Échec lors de la lecture des données"
  GoTo Sortie
End Sub


Private Sub Recup(sTable As String, sNomClair As String, sColNum As String, sColNom As String, c As Collection)
  Dim sSQL As String
  Dim cs As New BDCurseur
  Dim iLast As Long
  
  SetStatus "Récupération des " & sNomClair
  sSQL = "select " & sColNum & "," & sColNom & " from " & sTable & " where " & sColNum & " in (0"
  rCli.Sort = sColNum
  rCli.MoveFirst
  iLast = -1
  Do Until rCli.EOF
    If rCli.Fields(sColNum) <> iLast Then
      sSQL = sSQL & "," & rCli.Fields(sColNum)
      iLast = rCli.Fields(sColNum)
    End If
    rCli.MoveNext
  Loop
  sSQL = sSQL & ")"
  cs.OpenCurseur sSQL
  Do Until cs.EOF
    c.Add cs.Fields(1), "R" & cs.Fields(0)
    cs.MoveNext
  Loop
  cs.CloseCurseur
End Sub


Private Sub FormateSommaire()
  If iPage < 10 Then Exit Sub
  
  ' Le sommaire s'imprime sur une page impaire !
  If o Is Printer Then
    If (iPage Mod 2) = 1 Then
      If ImprimanteAjoute1PageSiRV Then iPage = iPage + 1
    End If
  End If
  
  Dim iColonne As Integer
  rSommaire.MoveFirst
  iLigne = 0
  iColonne = 2  ' Force le 1er saut de page
  iPageSommaire = 0
  Do Until rSommaire.EOF
    If rSommaire!niveau <= 1 And iLigne > 0 Then
      iLigne = iLigne + 1
      If iLigne > 77 Then iLigne = 0: iColonne = iColonne + 1
    End If
    
    If iColonne = 2 Then
      NouvellePage True
      
      iLigne = 0
      iColonne = 0
    End If
    
    Texte o, 10 + 100 * iColonne, 20 + 3.3 * iLigne, Space(rSommaire!niveau * 5) & " " & rSommaire!num & " " & rSommaire!nom
    o.Line (o.CurrentX + 1, o.CurrentY + 2)-(95 + 100 * iColonne, o.CurrentY + 2)
    TexteDroite o, 100 + 100 * iColonne, 20 + 3.3 * iLigne, rSommaire!Page
    rSommaire.MoveNext
    
    iLigne = iLigne + 1
    If iLigne > 77 Then iLigne = 0: iColonne = iColonne + 1
  Loop
End Sub


Private Sub FormateEnregistrement(c As ADODB.Recordset)
  Dim bNouveauBandeau As Boolean
  
  bNouveauBandeau = False
  If c!grp_numgrp <> iLastGrp Then
    iLastGrp = c!grp_numgrp
    iLastDna = -1
    bNouveauBandeau = True
    If iLigne > 0 Then iLigne = iLigne + 1
    If iLigne > iTaillePage - 10 Then iLigne = 0
    Ligne 0, c!grp_numgrp, cGrp("R" & c!grp_numgrp)
    AjouteSommaire 0, c!grp_numgrp, cGrp("R" & c!grp_numgrp)
  End If
  
  If c!dna_numdna <> iLastDna Then
    iLastDna = c!dna_numdna
    iLastDrg = -1
    If Not bNouveauBandeau Then
      bNouveauBandeau = True
      If iLigne > 0 Then iLigne = iLigne + 1
      If iLigne > iTaillePage - 10 Then iLigne = 0
    End If
    Ligne 1, c!dna_numdna, cDna("R" & c!dna_numdna)
    AjouteSommaire 1, c!dna_numdna, cDna("R" & c!dna_numdna)
  End If
  
  If c!drg_numdrg <> iLastDrg Then
    iLastDrg = c!drg_numdrg
    iLastSec = -1
    If Not bNouveauBandeau Then
      bNouveauBandeau = True
      If iLigne > 0 Then iLigne = iLigne + 1
      If iLigne > iTaillePage - 10 Then iLigne = 0
    End If
    Ligne 2, c!drg_numdrg, cDrg("R" & c!drg_numdrg)
    AjouteSommaire 2, c!drg_numdrg, cDrg("R" & c!drg_numdrg)
  End If
  
  If c!sec_numsec <> iLastSec Then
    iLastSec = c!sec_numsec
    If Not bNouveauBandeau Then
      bNouveauBandeau = True
      If iLigne > 0 Then iLigne = iLigne + 1
      If iLigne > iTaillePage - 10 Then iLigne = 0
    End If
    Ligne 3, c!sec_numsec, cSec("R" & c!sec_numsec)
    AjouteSommaire 3, c!sec_numsec, cSec("R" & c!sec_numsec)
  End If
  
  Ligne 4, c!etb_numetb, c!etb_prefixe & " " & c!etb_nom, c
End Sub


Private Sub AjouteSommaire(iNiveau As Integer, sNum As String, sNom As String)
  rSommaire.AddNew
  rSommaire!niveau = iNiveau
  rSommaire!num = sNum
  rSommaire!nom = sNom
  rSommaire!Page = iPage
  rSommaire.Update
End Sub


Private Sub Ligne(iNiveau As Integer, sNum As String, sNom As String, Optional c As ADODB.Recordset = Nothing)
  Static tsNum(0 To 3) As String, tsNom(0 To 3) As String
  If iLigne = 0 Then
    NouvellePage
    Dim i As Integer
    For i = 0 To iNiveau - 1
      Ligne2 i, tsNum(i), tsNom(i) & " (suite)"
    Next
  End If
  If iNiveau < 4 Then
    tsNum(iNiveau) = sNum
    tsNom(iNiveau) = sNom
  End If
  Ligne2 iNiveau, sNum, sNom, c
End Sub

Private Sub Ligne2(iNiveau As Integer, sNum As String, sNom As String, Optional c As ADODB.Recordset = Nothing)
  Dim x As Single, y As Single
  x = 20 + 3 * iNiveau
  y = 20 + 3.2 * iLigne

  Dim iFill As Integer
  Select Case iNiveau
    Case 0: iFill = 195
    Case 1: iFill = 210
    Case 2: iFill = 225
    Case 3: iFill = 240
    Case 4: iFill = 255
  End Select
  
  If Not bOptionSansGrisés Then
    o.FillColor = RGB(iFill, iFill, iFill)
    o.FillStyle = vbFSSolid
    o.Line (x - 10, y - 0.4)-(115, y + 2.8), RGB(255, 255, 255), B
  End If

  o.FontBold = iNiveau < 4
  TexteDroite o, x - 1.5, y, sNum
  Texte o, x, y, sNom
  
  If Not c Is Nothing Then
    Select Case iDétail
      Case 1
        o.Line (o.CurrentX + 1, o.CurrentY + 2)-(x0Détail - 2, o.CurrentY + 2)
        If Not IsNull(c!etb_unite) Then TexteDroite o, x0Détail + 3, y, c!etb_unite
        If Not IsNull(c!etb_prest) Then Texte o, x0Détail + 4.5, y, c!etb_prest
        
      Case 2
        Dim i As Integer
        For i = 1 To 4
          If Not IsNull(c.Fields("etb_typeh" & i)) Then
            TexteDroite o, x0Détail + i * 12 - 4.5, y, NV(c.Fields("etb_typeh" & i)) & "/"
            o.Print NV(c.Fields("etb_sceeh" & i));
          End If
        Next
        o.Line (23, y - 0.5)-(x0Détail + 4 * 12, y - 0.5)
        o.Line (23, y + 3.2 - 0.5)-(x0Détail + 4 * 12, y + 3.2 - 0.5)
        
    End Select
  End If
  
  iLigne = iLigne + 1
  If iLigne >= iTaillePage Then iLigne = 0
End Sub


Private Function bSorPrix(p As Variant, x As Single, y As Single) As Boolean
  bSorPrix = False
  If IsNull(p) Then Exit Function
  If p = 0 Then Exit Function
  TexteDroite o, x + wPrix - 0.4, y, Format(p / 100, "# ##0.00")
  bSorPrix = True
End Function


Private Sub NouvellePage(Optional bSommaire As Boolean = False)
  If iPage > 0 Then
    If o Is Printer Then
      Printer.NewPage
      SetStatus "Impression en cours, page " & iPage
    Else
      Dim iRep As VbMsgBoxResult
      iRep = MsgBox("Page suivante ?", vbQuestion + vbYesNo)
      If iRep = vbNo Then
        Unload o
        Err.Raise 1000, "NouvellePage", "Interruption aperçu"
      End If
      o.Cls
    End If
  End If
  
  iPage = iPage + 1
  If bSommaire Then iPageSommaire = iPageSommaire + 1
  
  ' Bandeau d'identification
  o.FontTransparent = False
  Texte o, 0, 0, "."
  o.FontTransparent = True
  
  SetFont o, "Univers Condensed", "Arial Narrow"
  With o.Font
    .Bold = True
    .Italic = True
    .Size = FSize(o, 11.5)
  End With
  Texte o, 10, 9, "Microb'Soft: Structure client"
  With o.Font
    .Name = "Courier new"
    .Size = FSize(o, 8)
    .Italic = False
    .Bold = False
  End With
  Texte o, o.CurrentX, 10, " - Édition du " & Format(Now, "ddd dd mmm yyyy hh:MM") & " [" & sNomOpérateur & "]"
  TexteDroite o, iLargeur - 11, 10, "Page " & IIf(bSommaire, iPageSommaire, iPage)
  
  ' Police standard du texte
  SetFont o, "Univers Condensed", "Arial Narrow"
  With o.Font
    .Bold = False
    .Italic = False
    .Size = FSize(o, 7.5)
  End With
  
  If bSommaire Then
    o.Font.Bold = True
    Texte o, 10, 14, "SOMMAIRE"
    o.Font.Bold = False
    Exit Sub
  End If
  
  ' Requête
  If iPage = 1 Then Texte o, 10, 13, g_sWP
  
  ' Légende du rab
  Dim i As Integer, x As Single
  x = x0Détail
  Select Case iDétail
    Case 2
      For i = 1 To 4
        Colonne "EH/Sce " & i, x, 12
        x = x + 12
      Next
  End Select
  
End Sub

Private Sub Colonne(sTitre As String, x As Single, w As Single)
  TexteCentré o, x, x + w, 20.5, sTitre
  o.Line (x, 20)-Step(w, 0)
  o.Line (x, 23)-Step(w, 0)
  o.Line (x, 20)-(x, iHauteur - 15)
  o.Line (x + w, 20)-(x + w, iHauteur - 15)
End Sub
