Attribute VB_Name = "BDForm"
' BDForm
' Acc�s ODBC - Assistance � la gestion des feuilles BD
' 26/01/1998 PV
' 14/02/1998 PV sFormToSQL
'  7/07/1998 PV CopieS�lection
' 15/07/1998 PV sBDIdModif pour rationaliser les infos de trace
' 15/08/1998 PV BDActiveChamp
' 20/08/1998 PV Mise � jour automatique du champ de tra�abilit� xxx_idmodif dans bPr�pareEditAdd. Type smallint
' 21/12/1998 PV Argument de ToMAJ de type control et non textbox
' 31/03/1999 PV MAJ du timestamp dans bPr�pareEditAdd uniquement si le champ est verrouill�
' 15/04/1999 PV Message en cas de copie sur un curseur vide
' 16/04/1999 PV Contr�le de la coh�rence taille de champ/maxlength dans OkNullType
' 18/05/1999 PV BDRemplitColChamps; M�canisme bForceUpShift et iMaxLength
' 24/08/1999 PV ForceUpShift via ForceTextBoxCase pour les textboxes
'  3/11/1999 PV meChangeTab
'  1/12/1999 PV Tri des contr�les de colChamps par tabindex et plus par coordonn�es�
' 16/12/1999 PV Test maxlength/longueur de champ pour FG
' 27/12/1999 PV Filtrage des caract�res � probl�me dans bOkNullType
'  9/03/2000 PV Dans BDRemplitColChamps, si MaxLength vaut 0, on prend la taille dans le dictionnaire
' 21/03/2000 PV Gestion de l'attribut de colonne bool�en (datafield contient !)
'  6/06/2000 PV datafield ajout� automatiquement au tag pour l'utilisateur 46
'  1/12/2000 PV + tOffsetNow lors de la mise � jour du timestamp
' 27/02/2001 PV Couleur de champ inactif ramen�e � la safety palette pour TSE
' 11/05/2001 FG correction timestamp = tOffsetNow au lieu de Now + tOffsetNow et remplacement par BDTime
' 21/05/2001 PV sBDIdModif --> BDMain pour r�duire les d�pendances
' 17/06/2001 PV Filtre des espaces en d�but/fin pour le contr�le champ vide (bOkNullType)


Option Explicit

' Pour la gestion de la feuille-table
Public Enum eMode�dition
  meEmpty     ' Aucun enregistrement s�lectionn�
  meNavigate  ' Navigation ordinaire
  meChange    ' �dition d'enregistrement en cours
  meChangeTab ' �dition de la partie tableau d'un enregistrement en cours
  meAdd       ' Ajout d'enregistrement en cours
  meQuery     ' Saisie de crit�res de recherche en cours
  meDelete    ' Effacement en cours (provisoire)
End Enum

Public Enum eModeTimer
  mtStop      ' Arr�t du timer
  mtLent      ' Mise � jour � 1 s
  mtRapide    ' Mise � jour � 0,25 s
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

' �limine d'un champ texte les retours � la ligne, les tabs, les Del et autres
' caract�res qui ne plaisent pas � la base
Public Function BDFiltreTexte(ByVal t As String) As String
  t = Subst(t, vbCrLf, "")
  t = Subst(t, vbTab, " ")
  t = Subst(t, Chr(127), "")
  t = Subst(t, "�", "...")
  t = Subst(t, "�", "OE")
  t = Subst(t, "�", "oe")
  t = Subst(t, Chr(150), "-")
  t = Subst(t, Chr(151), "-")
  BDFiltreTexte = t
End Function


' V�rifie pour les NULL et les types des valeurs saisies
' Contr�le les longueurs de champs
' Filtre les caract�res � probl�me pour la base de donn�es (Del, �, ...)

Public Function bOkNullType(colColonnes As Collection, colChamps As Collection) As Boolean
  Dim t As Control
  For Each t In colChamps
  
    ' Contr�le des longueurs (aide au d�veloppement)
    If iNumOp�rateur = 46 Or iNumOp�rateur = 256 Or iNumOp�rateur = 152 Or iNumOp�rateur = 133 Then
      On Error Resume Next
      If colColonnes(t.DataField).iType = BDTypeCHAR And t.MaxLength > 0 And t.MaxLength <> colColonnes(t.DataField).iSize Then
        MsgBox "Attention - Diff�rence entre la taille du champ dans la base de donn�es et la propri�t� Maxlength" & vbCrLf & vbCrLf & "Colonne: " & t.DataField & vbCrLf & "Maxlength: " & t.MaxLength & vbCrLf & "Size: " & colColonnes(t.DataField).iSize, vbExclamation, App.Title
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
            ' Filtrage des caract�res � probl�me
            Dim sf As String
            sf = BDFiltreTexte(Trim(t.Text))
            If sf <> t.Text Then t.Text = sf
            
            If Len(t.Text) > col.iSize Then
              MsgBox sNomChamp(t) & "Trop long, " & col.iSize & " caract�re(s) maximum !", vbExclamation, App.Title
              If t.Visible Then
                t.SetFocus
                t.SelStart = col.iSize
                t.SelLength = 999
              End If
              bOkNullType = False
              Exit Function
            End If
            
            ' Cas des colonnes bool�ennes [char(1) contenant O ou N]
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
              MsgBox sNomChamp(t) & "Ce n'est pas un nombre entier court." & vbCrLf & "Plage: -32767 � +32767", vbExclamation, App.Title
              If t.Visible Then t.SetFocus
              bOkNullType = False
              Exit Function
            End If
              
          Case BDTypeDECIMAL:
            If Not bOkTypeDecimal(t.Text) Then
              MsgBox sNomChamp(t) & "Ce n'est pas un nombre d�cimal.", vbExclamation, App.Title
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
              MsgBox sNomChamp(t) & "Ce n'est pas une valeur date/heure valide." & vbCrLf & "Doit �tre de la forme jj/mm/aaaa hh:mm:ss", vbExclamation, App.Title
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




' Transf�re les champs du formulaire dans le recordset (Edit et Add)
' Met � jour le timestamp et la tra�abilit�
Public Function bPr�pareEditAdd(c As BDCurseur, colColonnes As Collection, colChamps As Collection) As Boolean
  bPr�pareEditAdd = False
  
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
  ' Uniquement si le champ n'est pas verrouill�: permet une MAJ manuelle du timestamp
  On Error Resume Next        ' Si pas de timestamp
  If colChamps("timestamp").Locked Then
    colChamps("timestamp") = BDTime
    c("timestamp") = colChamps("timestamp")
  End If
  On Error GoTo 0
  
  ' Ajout �ventuel de la ta�abilit�, dans ine colonne en xxx_idmodif
  Dim col As BDColonne
  For Each col In colColonnes
    If LCase(col.sNom) Like "*_idmodif" Then
      c(col.sNom) = sBDIdModif
      Exit For
    End If
  Next
  
  ' �criture des donn�es
  Dim iErr As Long, sErr As String
  On Error Resume Next
  c.Update
  iErr = Err
  If iErr Then sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    c.CancelUpdate
    If InStr(1, sErr, "duplicate") <> 0 Then sErr = sErr & vbCrLf & vbCrLf & "L'enregistrement existe d�j� dans la base de donn�es, modifiez-le au lieu de cr�er un doublon."
    MsgBox "�chec lors de l'�criture des donn�es." & vbCrLf & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    Exit Function
  End If
  
  bPr�pareEditAdd = True
End Function



' Convertit une valeur entr�e dans un champ de saisie en valeur �
' ins�rer dans une expression SQL (guillemets inclus).
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




' Copie la s�lection dans le presse-papiers
Public Sub BDCopieS�lection(c As BDCurseur, colChamps As Collection, bdS�l As BDS�lecteur)
  If c Is Nothing Then
    MsgBox "Effectuez une s�lection avant de copier des donn�es dans le presse-papiers.", vbExclamation, App.Title
    Exit Sub
  End If
  
  If c.BOF And c.EOF Then
    MsgBox "S�lectionnez des enregistrements avant de copier des donn�es dans le presse-papiers.", vbExclamation, App.Title
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
      bdS�l.NumRec = c.AbsolutePosition
      bdS�l.RefreshNumRec
      If c.AbsolutePosition = 1000 Then
        MsgBox "Plus de 1000 enregistrements dans la s�lection, seuls les 1000 premiers sont copi�s.", vbInformation, App.Title
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
  ' On d�termine empiriquement une couleur un peu plus claire que le fond
  ' de l'�cran pour les champs inactifs pour qu'ils soient plus visibles
  If lCouleurInactif = 0 Then
'    Dim coul As String, sType As String
'    Dim r As Integer, g As Integer, b As Integer
'    Dim p1 As Integer, p2 As Integer
'    On Error GoTo D�faut
'    coul = R�cup�reValeurRegistry("HKEY_CURRENT_USER\Control Panel\Colors", "ButtonFace", sType)
'    On Error GoTo 0
'    p1 = InStr(1, coul, " ")
'    p2 = InStr(p1 + 1, coul, " ")
'    r = Val(Left(coul, p1 - 1)) + 30
'    g = Val(Mid(coul, p1 + 1, p2 - p1 - 1)) + 30
'    b = Val(Mid(coul, p2 + 1)) + 30
''    Stop
'    ' On se ram�ne � la "safety palette"
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
D�faut:
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


' Active ou non le contr�le de saisie MaxLength sur les contr�les de colChamps
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
    
      ' Champs n'acceptant pas les NULL (rep�r�s par *)
      If InStr(1, sNomCol, "*") <> 0 Then
        bRequired = True
        c.DataField = Subst(c.DataField, "*", "")
      Else
        bRequired = False
      End If
      
      ' Champs dont la saisie est forc�e en majuscules (rep�r�s par ^)
      If InStr(1, sNomCol, "^") <> 0 Then
        bForceUpShift = True
        c.DataField = Subst(c.DataField, "^", "")
        If TypeOf c Is TextBox Then ForceTextBoxCase c, 1
      Else
        bForceUpShift = False
      End If
      
      ' Champs bool�ens (O/N dans la base) (rep�r�s par !)
      If InStr(1, sNomCol, "!") <> 0 Then
        bForceUpShift = True
        bBoolean = True
        c.DataField = Subst(c.DataField, "!", "")
        ForceTextBoxCase c, 1
      Else
        bForceUpShift = False
        bBoolean = False
      End If
      
      
      ' M�morisation du MaxLength
      On Error Resume Next
      iMaxLength = c.MaxLength
      If Err Then iMaxLength = -1         ' Pas de propri�t� MaxLength
      On Error GoTo 0
      If iMaxLength = 0 Then              ' Si ind�fini, on prend celui de la colonne sous-jacente
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
        sMsgErr = "Erreur interne - Colonne " & c.DataField & " non trouv�e pour le champ " & c.Name
        If c.Index <> 0 Then sMsgErr = sMsgErr & "(" & c.Index & ")"
        MsgBox sMsgErr, vbCritical, App.Title
        End
      End If
      On Error GoTo 0
      
      ' Tag des champs � partir de la desription de doccolonnes
      ' Si la colonne est bool�enne, on ajoute " (O/N)" dans la langue du syst�me � la fin
      If c.Tag = "" Then c.Tag = colColonnes(c.DataField).sDescription
      If bBoolean Then c.Tag = c.Tag & " (" & UCase(Left(Format(True, "Yes/No"), 1)) & "/" & UCase(Left(Format(False, "Yes/No"), 1)) & ")"
      If iNumOp�rateur = 46 Or iNumOp�rateur = 133 Then c.Tag = c.Tag & " [" & c.DataField & "]"
    End If
  Next
End Sub

