Attribute VB_Name = "BDForm"
' BDForm
' Accès ODBC - Assistance à la gestion des feuilles BD
' 26/01/1998 PV
' 14/02/1998 PV sFormToSQL
'  7/07/1998 PV CopieSélection
' 15/07/1998 PV sBDIdModif pour rationaliser les infos de trace
' 15/08/1998 PV BDActiveChamp
' 20/08/1998 PV Mise à jour automatique du champ de traçabilité xxx_idmodif dans bPrépareEditAdd. Type smallint
' 21/12/1998 PV Argument de ToMAJ de type control et non textbox
' 31/03/1999 PV MAJ du timestamp dans bPrépareEditAdd uniquement si le champ est verrouillé
' 15/04/1999 PV Message en cas de copie sur un curseur vide
' 16/04/1999 PV Contrôle de la cohérence taille de champ/maxlength dans OkNullType
' 18/05/1999 PV BDRemplitColChamps; Mécanisme bForceUpShift et iMaxLength
' 24/08/1999 PV ForceUpShift via ForceTextBoxCase pour les textboxes
'  3/11/1999 PV meChangeTab
'  1/12/1999 PV Tri des contrôles de colChamps par tabindex et plus par coordonnées…
' 16/12/1999 PV Test maxlength/longueur de champ pour FG
' 27/12/1999 PV Filtrage des caractères à problème dans bOkNullType
'  9/03/2000 PV Dans BDRemplitColChamps, si MaxLength vaut 0, on prend la taille dans le dictionnaire
' 21/03/2000 PV Gestion de l'attribut de colonne booléen (datafield contient !)
'  6/06/2000 PV datafield ajouté automatiquement au tag pour l'utilisateur 46
'  1/12/2000 PV + tOffsetNow lors de la mise à jour du timestamp
' 27/02/2001 PV Couleur de champ inactif ramenée à la safety palette pour TSE
' 11/05/2001 FG correction timestamp = tOffsetNow au lieu de Now + tOffsetNow et remplacement par BDTime
' 21/05/2001 PV sBDIdModif --> BDMain pour réduire les dépendances
' 17/06/2001 PV Filtre des espaces en début/fin pour le contrôle champ vide (bOkNullType)


Option Explicit

' Pour la gestion de la feuille-table
Public Enum eModeÉdition
  meEmpty     ' Aucun enregistrement sélectionné
  meNavigate  ' Navigation ordinaire
  meChange    ' Édition d'enregistrement en cours
  meChangeTab ' Édition de la partie tableau d'un enregistrement en cours
  meAdd       ' Ajout d'enregistrement en cours
  meQuery     ' Saisie de critères de recherche en cours
  meDelete    ' Effacement en cours (provisoire)
End Enum

Public Enum eModeTimer
  mtStop      ' Arrêt du timer
  mtLent      ' Mise à jour à 1 s
  mtRapide    ' Mise à jour à 0,25 s
End Enum


Private Function bOkTypeSmallint(ByVal sText As String) As Boolean
  bOkTypeSmallint = False
  If IsNumeric(sText) Then
    If sText = Int(sText) Then
      If sText >= -32767 And sText <= 32767 Then
        bOkTypeSmallint = True
      End If
    End If
  End If
End Function

Private Function bOkTypeInteger(ByVal sText As String) As Boolean
  bOkTypeInteger = False
  If IsNumeric(sText) Then
    If sText = Int(sText) Then
      If sText >= -2147483647 And sText <= 2147483647 Then
        bOkTypeInteger = True
      End If
    End If
  End If
End Function

Private Function bOkTypeDecimal(ByVal sText As String) As Boolean
  sText = Subst(sText, ".", ",")
  bOkTypeDecimal = IsNumeric(sText)
End Function


Private Function sNomChamp(t As Control) As String
  sNomChamp = "Champ " & t.Name
  On Error Resume Next
  If t.Index <> "" Then sNomChamp = sNomChamp & "(" & t.Index & ")"
  If t.Tag <> "" Then sNomChamp = sNomChamp & ": " & t.Tag
  sNomChamp = sNomChamp & vbCrLf
End Function

' Élimine d'un champ texte les retours à la ligne, les tabs, les Del et autres
' caractères qui ne plaisent pas à la base
Public Function BDFiltreTexte(ByVal t As String) As String
  t = Subst(t, vbCrLf, "")
  t = Subst(t, vbTab, " ")
  t = Subst(t, Chr(127), "")
  t = Subst(t, "…", "...")
  t = Subst(t, "Œ", "OE")
  t = Subst(t, "œ", "oe")
  t = Subst(t, Chr(150), "-")
  t = Subst(t, Chr(151), "-")
  BDFiltreTexte = t
End Function


' Vérifie pour les NULL et les types des valeurs saisies
' Contrôle les longueurs de champs
' Filtre les caractères à problème pour la base de données (Del, …, ...)

Public Function bOkNullType(colColonnes As Collection, colChamps As Collection) As Boolean
  Dim t As Control
  For Each t In colChamps
  
    ' Contrôle des longueurs (aide au développement)
    If iNumOpérateur = 46 Or iNumOpérateur = 256 Or iNumOpérateur = 152 Or iNumOpérateur = 133 Then
      On Error Resume Next
      If colColonnes(t.DataField).iType = BDTypeCHAR And t.MaxLength > 0 And t.MaxLength <> colColonnes(t.DataField).iSize Then
        MsgBox "Attention - Différence entre la taille du champ dans la base de données et la propriété Maxlength" & vbCrLf & vbCrLf & "Colonne: " & t.DataField & vbCrLf & "Maxlength: " & t.MaxLength & vbCrLf & "Size: " & colColonnes(t.DataField).iSize, vbExclamation, App.Title
      End If
      On Error GoTo 0
    End If

    If t.Enabled And Not t.Locked Then
      If Trim(t.Text) = "" Then
        If colColonnes(t.DataField).bRequired Then
          Dim sMsg As String
          sMsg = sNomChamp(t) & "Ce champ est obligatoire."
          MsgBox sMsg, vbExclamation, App.Title
          If t.Visible Then t.SetFocus
          bOkNullType = False
          Exit Function
        End If
        If t.Text <> "" Then t.Text = ""
      Else
        Dim col As BDColonne
        Set col = colColonnes(t.DataField)
        Select Case col.iType
          
          Case BDTypeCHAR:
            ' Filtrage des caractères à problème
            Dim sf As String
            sf = BDFiltreTexte(Trim(t.Text))
            If sf <> t.Text Then t.Text = sf
            
            If Len(t.Text) > col.iSize Then
              MsgBox sNomChamp(t) & "Trop long, " & col.iSize & " caractère(s) maximum !", vbExclamation, App.Title
              If t.Visible Then
                t.SetFocus
                t.SelStart = col.iSize
                t.SelLength = 999
              End If
              bOkNullType = False
              Exit Function
            End If
            
            ' Cas des colonnes booléennes [char(1) contenant O ou N]
            If col.bBoolean And (t.Text <> "O" And t.Text <> "N" And t.Text <> "") Then
              MsgBox sNomChamp(t) & "C'est une colonne " & Format(True, "Yes/No") & "/" & Format(False, "Yes/No") & " qui ne peut contenir que les valeurs " & Left(Format(True, "Yes/No"), 1) & " ou " & Left(Format(False, "Yes/No"), 1) & ".", vbExclamation, App.Title
              If t.Visible Then t.SetFocus
              bOkNullType = False
              Exit Function
            End If
            
          Case BDTypeINTEGER:
            If Not bOkTypeInteger(t.Text) Then
              MsgBox sNomChamp(t) & "Ce n'est pas un nombre entier.", vbExclamation, App.Title
              If t.Visible Then t.SetFocus
              bOkNullType = False
              Exit Function
            End If
              
          Case BDTYPESMALLINT:
            If Not bOkTypeSmallint(t.Text) Then
              MsgBox sNomChamp(t) & "Ce n'est pas un nombre entier court." & vbCrLf & "Plage: -32767 à +32767", vbExclamation, App.Title
              If t.Visible Then t.SetFocus
              bOkNullType = False
              Exit Function
            End If
              
          Case BDTypeDECIMAL:
            If Not bOkTypeDecimal(t.Text) Then
              MsgBox sNomChamp(t) & "Ce n'est pas un nombre décimal.", vbExclamation, App.Title
              If t.Visible Then t.SetFocus
              bOkNullType = False
              Exit Function
            End If
          
          Case BDTypeDATE:
            Dim sSQL As String, sVal As String, sErr As String
            If Not bOkValType(t.Text, BDTypeDATE, sSQL, sVal, sErr) Then
              MsgBox sNomChamp(t) & "Ce n'est pas une date valide." & vbCrLf & vbCrLf & sErr, vbExclamation, App.Title
              If t.Visible Then t.SetFocus
              bOkNullType = False
              Exit Function
            End If
  
          Case BDTypeTIMESTAMP:
            If Not IsDate(t.Text) Then
              MsgBox sNomChamp(t) & "Ce n'est pas une valeur date/heure valide." & vbCrLf & "Doit être de la forme jj/mm/aaaa hh:mm:ss", vbExclamation, App.Title
              If t.Visible Then t.SetFocus
              bOkNullType = False
              Exit Function
            End If
  
          Case Else:  Stop
        End Select
      End If
    End If    ' If Not t.Locked
  Next
  bOkNullType = True
End Function




' Transfère les champs du formulaire dans le recordset (Edit et Add)
' Met à jour le timestamp et la traçabilité
Public Function bPrépareEditAdd(c As BDCurseur, colColonnes As Collection, colChamps As Collection) As Boolean
  bPrépareEditAdd = False
  
  Dim t As Control
  Dim sVal As String, sValSQL As String, sValInterne As String, sMsg As String
  For Each t In colChamps
    If Not t.Locked Then
      If t.Text = "" Then
        c.Fields(t.DataField) = Null
      Else
        bOkValType t.Text, colColonnes(t.DataField).iType, sValSQL, sValInterne, sMsg
        c.Fields(t.DataField) = sValInterne
      End If
    End If
  Next
  
  ' Ajout du timestamp (note: le recordset DOIT avoir un champ timestamp)
  ' Uniquement si le champ n'est pas verrouillé: permet une MAJ manuelle du timestamp
  On Error Resume Next        ' Si pas de timestamp
  If colChamps("timestamp").Locked Then
    colChamps("timestamp") = BDTime
    c("timestamp") = colChamps("timestamp")
  End If
  On Error GoTo 0
  
  ' Ajout éventuel de la taçabilité, dans ine colonne en xxx_idmodif
  Dim col As BDColonne
  For Each col In colColonnes
    If LCase(col.sNom) Like "*_idmodif" Then
      c(col.sNom) = sBDIdModif
      Exit For
    End If
  Next
  
  ' Écriture des données
  Dim iErr As Long, sErr As String
  On Error Resume Next
  c.Update
  iErr = Err
  If iErr Then sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    c.CancelUpdate
    If InStr(1, sErr, "duplicate") <> 0 Then sErr = sErr & vbCrLf & vbCrLf & "L'enregistrement existe déjà dans la base de données, modifiez-le au lieu de créer un doublon."
    MsgBox "Échec lors de l'écriture des données." & vbCrLf & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    Exit Function
  End If
  
  bPrépareEditAdd = True
End Function



' Convertit une valeur entrée dans un champ de saisie en valeur à
' insérer dans une expression SQL (guillemets inclus).
Public Function sFormToSQL(ByVal sValeurGrille As String, iType As BDColType)
  Dim sValSQL As String, sValInterne As String, sMsg As String
  bOkValType sValeurGrille, iType, sValSQL, sValInterne, sMsg
  sFormToSQL = sValSQL
End Function



' Passe un champ en majuscules
Public Sub ToMaj(txtControl As Control)
  If txtControl <> UCase(txtControl) Then
    Dim sStart As Integer, sLength As Integer
    sStart = txtControl.SelStart
    sLength = txtControl.SelLength
    txtControl = UCase(txtControl)
    txtControl.SelStart = sStart
    txtControl.SelLength = sLength
  End If
End Sub


' Passe un champ en minuscules
Public Sub ToMin(txtControl As Control)
  If txtControl <> LCase(txtControl) Then
    Dim sStart As Integer, sLength As Integer
    sStart = txtControl.SelStart
    sLength = txtControl.SelLength
    txtControl = LCase(txtControl)
    txtControl.SelStart = sStart
    txtControl.SelLength = sLength
  End If
End Sub




' Copie la sélection dans le presse-papiers
Public Sub BDCopieSélection(c As BDCurseur, colChamps As Collection, bdSél As BDSélecteur)
  If c Is Nothing Then
    MsgBox "Effectuez une sélection avant de copier des données dans le presse-papiers.", vbExclamation, App.Title
    Exit Sub
  End If
  
  If c.BOF And c.EOF Then
    MsgBox "Sélectionnez des enregistrements avant de copier des données dans le presse-papiers.", vbExclamation, App.Title
    Screen.MousePointer = vbDefault
    Exit Sub
  End If
  
  Dim sData As String
  Dim t As Control, bFirst As Boolean
  Screen.MousePointer = vbHourglass
  
  
  ' On place les noms de colonnes dans le presse-papiers
  sData = ""
  bFirst = True
  For Each t In colChamps
    If bFirst Then
      sData = sData & t.DataField
      bFirst = False
    Else
      sData = sData & Chr(9) & t.DataField
    End If
  Next
  sData = sData & vbCrLf
  
  c.MoveFirst
  Do Until c.EOF
    If c.AbsolutePosition Mod 10 = 0 Then
      bdSél.NumRec = c.AbsolutePosition
      bdSél.RefreshNumRec
      If c.AbsolutePosition = 1000 Then
        MsgBox "Plus de 1000 enregistrements dans la sélection, seuls les 1000 premiers sont copiés.", vbInformation, App.Title
        Exit Do
      End If
    End If
    bFirst = True
    For Each t In colChamps
      If bFirst Then
        sData = sData & c.Fields(t.DataField)
        bFirst = False
      Else
        sData = sData & Chr(9) & c.Fields(t.DataField)
      End If
    Next
    sData = sData & vbCrLf
    c.MoveNext
  Loop
  c.MoveFirst
  Clipboard.Clear
  Clipboard.SetText sData
  Screen.MousePointer = vbDefault
End Sub




Public Sub BDActiveChamp(c As Control, bEnabled As Boolean)
  If Not c.Enabled Then Exit Sub
  
  Static lCouleurInactif As Long
  ' On détermine empiriquement une couleur un peu plus claire que le fond
  ' de l'écran pour les champs inactifs pour qu'ils soient plus visibles
  If lCouleurInactif = 0 Then
'    Dim coul As String, sType As String
'    Dim r As Integer, g As Integer, b As Integer
'    Dim p1 As Integer, p2 As Integer
'    On Error GoTo Défaut
'    coul = RécupèreValeurRegistry("HKEY_CURRENT_USER\Control Panel\Colors", "ButtonFace", sType)
'    On Error GoTo 0
'    p1 = InStr(1, coul, " ")
'    p2 = InStr(p1 + 1, coul, " ")
'    r = Val(Left(coul, p1 - 1)) + 30
'    g = Val(Mid(coul, p1 + 1, p2 - p1 - 1)) + 30
'    b = Val(Mid(coul, p2 + 1)) + 30
''    Stop
'    ' On se ramène à la "safety palette"
'    r = 51 * Int(r / 51 + 0.5)
'    g = 51 * Int(g / 51 + 0.5)
'    b = 51 * Int(b / 51 + 0.5)
'    If r > 255 Then r = 255
'    If g > 255 Then g = 255
'    If b > 255 Then b = 255
'    ' Pas de fond blanc !
'    If r = 255 And g = 255 And b = 255 Then
'      r = &HCC
'      g = &HCC
'      b = &HCC
'    End If
'    lCouleurInactif = RGB(r, g, b)
    lCouleurInactif = &HC0C0C0
    GoTo fin
Défaut:
    On Error GoTo 0
    lCouleurInactif = &H8000000F
fin:
  End If

  On Error Resume Next
  If bEnabled Then
    c.BackColor = &H80000005
    If TypeName(c) = "TDBGrid" Then
      c.DeadAreaBackColor = &H80000005
    Else
      c.Locked = False
    End If
    c.TabStop = True
  Else
    c.BackColor = lCouleurInactif
    If TypeName(c) = "TDBGrid" Then
      c.DeadAreaBackColor = lCouleurInactif
    Else
      c.Locked = True
    End If
    c.TabStop = False
  End If
End Sub


Public Sub BDActiveFormulaire(colChamps As Collection, bEnabled As Boolean)
  Dim c As Control
  For Each c In colChamps
    BDActiveChamp c, bEnabled
  Next
End Sub


' Active ou non le contrôle de saisie MaxLength sur les contrôles de colChamps
Public Sub BDActiveMaxLength(colChamps As Collection, colColonnes As Collection, bEnabled As Boolean)
  Dim c As Control
  Dim iMaxLength As Integer
  
  For Each c In colChamps
    iMaxLength = colColonnes(c.DataField).iMaxLength
    If iMaxLength > 0 Then
      If bEnabled Then
        c.MaxLength = iMaxLength
      Else
        c.MaxLength = 0
      End If
    End If
  Next
End Sub

Public Sub BDRemplitColChamps(F As Form, colChamps As Collection, colColonnes As Collection)
  Dim c As Control
  Dim bRequired As Boolean, bForceUpShift As Boolean, bBoolean As Boolean
  Dim iMaxLength As Integer
  Dim sNomCol As String
  Dim iErr As Long
  
  For Each c In F.Controls
    On Error Resume Next
    sNomCol = c.DataField
    iErr = Err
    On Error GoTo 0
    
    If iErr = 0 And sNomCol <> "" Then
    
      ' Champs n'acceptant pas les NULL (repérés par *)
      If InStr(1, sNomCol, "*") <> 0 Then
        bRequired = True
        c.DataField = Subst(c.DataField, "*", "")
      Else
        bRequired = False
      End If
      
      ' Champs dont la saisie est forcée en majuscules (repérés par ^)
      If InStr(1, sNomCol, "^") <> 0 Then
        bForceUpShift = True
        c.DataField = Subst(c.DataField, "^", "")
        If TypeOf c Is TextBox Then ForceTextBoxCase c, 1
      Else
        bForceUpShift = False
      End If
      
      ' Champs booléens (O/N dans la base) (repérés par !)
      If InStr(1, sNomCol, "!") <> 0 Then
        bForceUpShift = True
        bBoolean = True
        c.DataField = Subst(c.DataField, "!", "")
        ForceTextBoxCase c, 1
      Else
        bForceUpShift = False
        bBoolean = False
      End If
      
      
      ' Mémorisation du MaxLength
      On Error Resume Next
      iMaxLength = c.MaxLength
      If Err Then iMaxLength = -1         ' Pas de propriété MaxLength
      On Error GoTo 0
      If iMaxLength = 0 Then              ' Si indéfini, on prend celui de la colonne sous-jacente
        Select Case colColonnes(c.DataField).iType
          Case BDTypeCHAR:      iMaxLength = colColonnes(c.DataField).iSize
          Case BDTYPESMALLINT:  iMaxLength = 6     ' -30000
          Case BDTypeINTEGER:   iMaxLength = 11    ' -4111222333
          Case BDTypeDATE:      iMaxLength = 10    ' 31/12/2000
          Case BDTypeTIMESTAMP
          Case BDTypeDECIMAL
        End Select
      End If

      ' Tri des champs par tabindex
      Dim i As Integer
      For i = 1 To colChamps.Count
        If c.TabIndex < colChamps(i).TabIndex Then Exit For
      Next
      On Error Resume Next
      If i > colChamps.Count Then
        colChamps.Add c, c.DataField
      Else
        colChamps.Add c, c.DataField, i
      End If
      
      If Err Then
        Dim sMsgErr As String
        sMsgErr = "Erreur interne grave" & vbCrLf & "Doublon pour datafield=" & c.DataField & ", champs " & c.Name
        If c.Index <> 0 Then sMsgErr = sMsgErr & "(" & c.Index & ")"
        sMsgErr = sMsgErr & " et " & colChamps(c.DataField).Name
        If colChamps(c.DataField).Index <> 0 Then sMsgErr = sMsgErr & "(" & colChamps(c.DataField).Index & ")"
        MsgBox sMsgErr, vbCritical, App.Title
        End
      End If
      On Error GoTo 0
      
      On Error Resume Next
      With colColonnes(c.DataField)
        .bRequired = bRequired
        .bForceUpShift = bForceUpShift
        .bBoolean = bBoolean
        .iMaxLength = iMaxLength
      End With
      If Err Then
        sMsgErr = "Erreur interne - Colonne " & c.DataField & " non trouvée pour le champ " & c.Name
        If c.Index <> 0 Then sMsgErr = sMsgErr & "(" & c.Index & ")"
        MsgBox sMsgErr, vbCritical, App.Title
        End
      End If
      On Error GoTo 0
      
      ' Tag des champs à partir de la desription de doccolonnes
      ' Si la colonne est booléenne, on ajoute " (O/N)" dans la langue du système à la fin
      If c.Tag = "" Then c.Tag = colColonnes(c.DataField).sDescription
      If bBoolean Then c.Tag = c.Tag & " (" & UCase(Left(Format(True, "Yes/No"), 1)) & "/" & UCase(Left(Format(False, "Yes/No"), 1)) & ")"
      If iNumOpérateur = 46 Or iNumOpérateur = 133 Then c.Tag = c.Tag & " [" & c.DataField & "]"
    End If
  Next
End Sub

