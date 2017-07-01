Attribute VB_Name = "VBLibODBC"
' VBLibODBC
' Biblioth�que VB de base pour les applis ODBC
' 15/08/1998 PV
' 19/08/1998 SS AjusteListe
' 25/11/1998 PV Reprise de AjusteListView, avec messages � la liste
' 11/03/1999 PV Message explicite sur source de donn�es non trouv�e
' 16/04/1999 PV AfficheErreurODBC
'  6/08/1999 PV TrimCrLf
' 12/04/2000 PV ChargementInitialCommun: option bLoginForc� permettant d'emp�cher le login automatique pour certains programmes

Option Explicit


' =================================================================================
' Emp�che le lancement en double d'un programme
' N�cessite la feuille frmMsgBoxTimer

Public Sub NoPreviousInstance(F As Object)
  If App.PrevInstance Then
    'frmMsgBoxTimer.MsgBoxTimer "Ce programme fonctionne d�j�." & vbCrLf & "Vous ne pouvez pas le lancer une seconde fois.", vbCritical, App.Title, 30
    If Not bShiftPressed Then
      Dim sCaption As String
      sCaption = F.Caption
      F.Caption = "xxx"
      On Error Resume Next
      AppActivate sCaption
      EmergencyExit
    End If
  End If
End Sub


' =================================================================================
' Les messages d'erreur ODBC �tant format�s "compact" sans retour � la ligne,
' cette fonction essaie de les a�rer un peu

Public Function sAjusteMessageODBC(ByVal sMsg As String) As String
  Dim s As String
  Dim p1, p2 As Integer
  
  s = sMsg
  
  ' On ins�re un retour � la ligne apr�s le dernier ]
  p1 = 0
  Do
    p2 = InStr(p1 + 1, sMsg, "]")
    If p2 = 0 Then Exit Do
    p1 = p2
  Loop
  If p1 > 0 Then s = Left(s, p1) & vbCrLf & Trim(Mid(s, p1 + 1))
  
  ' On ins�re un retour � la ligne apr�s chaque point, sauf le dernier, sauf entre parenth�ses
  Dim i As Integer, nivp As Integer
  Do
    p2 = InStr(p1 + 1, s, ".")
    If p2 = 0 Or p2 = Len(s) Then Exit Do
    p1 = p2
    
    nivp = 0
    For i = 1 To p1
      Select Case Mid(s, i, 1)
        Case "(": nivp = nivp + 1
        Case ")": nivp = nivp - 1
      End Select
    Next
    If nivp = 0 Then s = Left(s, p1) & vbCrLf & Trim(Mid(s, p1 + 1))
  Loop
    
  sAjusteMessageODBC = s
End Function


Public Sub AfficheErreurODBC(ByVal sMessage As String)
  Dim iErr As Long, sErr As String
  
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  MsgBox sMessage & vbCrLf & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
End Sub


' =================================================================================
' Acc�s � la base de donn�es et chargement des utilisateurs pour les applis ODBC

Public Sub ChargementInitialCommun(F As MDIForm, ByVal bDemandeSource As Boolean, ByVal sNomSource As String, Optional bLoginForc� As Boolean = False)
  Dim bConnexionInitiale As Boolean
  
  If F.sbStatus.Panels("DataSource") = "" Then
    F.sbStatus.Panels("DataSource") = "En cours�"
    bConnexionInitiale = True
  End If
  
  SetStatus sIntlLib("F:Ouverture de la base de donn�es, patientez�%%A:Opening database, please wait�")
  Screen.MousePointer = vbHourglass
  
  Do
Restart:
    On Error Resume Next
    If bDemandeSource Then sNomSource = "?"
    BDInit sNomSource
    If Err Then
      Dim sMsg As String
      sMsg = sAjusteMessageODBC(Err.Description)
      If InStr(1, sMsg, "is currently opened by another") <> 0 Then
        sMsg = sMsg & vbCrLf & vbCrLf & "La base de donn�es est actuellement verrouill�e; il y a peut-�tre une sauvegarde en cours (pr�paration). Attendez la fin de la compression pour utiliser ce programme, ou s'il n'y a pas de sauvagarde en cours, pr�venez le Service Informatique !"
      End If
      If InStr(1, sMsg, "source name not found") <> 0 Then
        sMsg = sMsg & vbCrLf & vbCrLf & "Ce programme n�cessite une source de donn�es ODBC nomm�e '" & sNomSource & "' pour fonctionner. Voyez avec le Service Informatique comment la configuer."
      End If
      
      Dim sD�butMsg As String
      sD�butMsg = sIntlLib("F:�chec lors de la connexion � la base de donn�es%%A:Database connection failed")
      If sNomSource <> "" Then sD�butMsg = sD�butMsg & ", source " & sNomSource
      sD�butMsg = sD�butMsg & "."
      
      sD�butMsg = sD�butMsg & vbCrLf & vbCrLf & "Erreur " & Err.Number & ": " & Err.Source & ": " & sMsg
      If bConnexionInitiale Then
        sD�butMsg = sD�butMsg & vbCrLf & vbCrLf & sIntlLib("F:Pour changer de source de donn�es, utiliser Maj+OK.%%A:To change data source, use Shift+OK.")
      End If
      
      MsgBox sD�butMsg, IIf(bConnexionInitiale, vbCritical, vbExclamation), App.Title
      If bConnexionInitiale Then
        If bShiftPressed Then
          bDemandeSource = True
          On Error GoTo 0
          GoTo Restart
        End If
        EmergencyExit
        End
      Else
        Screen.MousePointer = vbDefault
        GoTo fin
      End If
    End If
    On Error GoTo 0
    F.sbStatus.Panels("DataSource") = BDSource & " (" & cSyst�meCA & ")"
    
    F.sbStatus.Panels("Message") = sIntlLib("F:Chargement des utilisateurs, patientez�%%A:Loading users, plase wait�")
    DoEvents
    ChargeUtilisateurs
    Screen.MousePointer = vbDefault
    
    ' Identification de l'utilisateur
    F.sbStatus.Panels("Utilisateur") = ""
    Select Case frmBDLogin.iInitUtilisateur(True, bLoginForc�)
      Case 0:
        F.sbStatus.Panels("Utilisateur") = sNomOp�rateur & " (" & iNumOp�rateur & ")"
        Exit Do       ' Ok pour le changement d'utilisateur
      Case 1:
        MsgBox sIntlLib("F:�chec lors de l'identification de l'utilisateur, fin du programme.%%A:User identification failed, program aborted."), vbCritical, App.Title
        EmergencyExit
      Case 2:
        bDemandeSource = True ' On reboucle
    End Select
  Loop
  
fin:
  F.sbStatus.Panels("Message") = ""
End Sub


' =================================================================================
' Met � jour les labels des boutons
' Lit l'�tat dans la registry
' Initialement le texte des boutons est vide. S'il doit �tre affich�, il est
' r�cup�r� dans la propri�t� Tag de chacun des boutons.

Public Sub AjusteEtiquettesBoutons(tbBoutons As Toolbar)
  Dim bEtiq As Boolean
  bEtiq = GetSetting(App.EXEName, "Affichage", "Etiquettes", 1) = 1
  Dim b As Button
  For Each b In tbBoutons.Buttons
    If bEtiq Then
      b.Caption = b.Tag
    Else
      b.Caption = ""
    End If
  Next
End Sub


' =================================================================================
' Pour patienter�

Public Sub ImpressionPasDisponible()
  MsgBox "L'impression n'est pas encore disponible." & vbCrLf & "Passez par le Web pour s�lectionner et imprimer les donn�es.", vbExclamation, App.Title
End Sub


' =================================================================================
' Ajustement automatique des largeurs de colonne d'une listview
' en fonction de l'�l�ment le plus large (header compris) de chaque colonne

Public Sub AjusteListView(F As Form, Liste As ListView)
  LVSetAllColWidths Liste, LVSCW_AUTOSIZE_USEHEADER
End Sub

Public Sub AjusteListViewVB(F As Form, Liste As ListView)
Attribute AjusteListViewVB.VB_Description = "Ajustement automatique des largeurs de colonne d'une listview"
  Dim l As Integer, lmax As Integer
  Dim i As Integer, j As Integer

  For j = 1 To Liste.ColumnHeaders.Count
    lmax = F.TextWidth(Liste.ColumnHeaders(j).Text & "   ")
    For i = 1 To Liste.ListItems.Count
        If j = 1 Then
          l = F.TextWidth(Liste.ListItems(i).Text & "   ")
        Else
          l = F.TextWidth(Liste.ListItems(i).SubItems(j - 1) & "   ")
        End If
        If l > lmax Then lmax = l
    Next
    Liste.ColumnHeaders(j).Width = lmax
  Next
End Sub


'=================================================================================
' Supprime les CrLf en d�but et en fin de cha�ne; remplace les crlf int�rieurs en |

Public Sub TrimCrLf(c As Control, Optional sSubstInterne As String = "|")
  Dim bRefresh As Boolean
  Do While Len(c) >= 2
    If Right(c, 2) = vbCrLf Then
      c = Left(c, Len(c) - 2)
      bRefresh = True
    ElseIf Left(c, 2) = vbCrLf Then
      c = Mid(c, 3)
      bRefresh = True
    Else
      Exit Do
    End If
  Loop
  If InStr(1, c, vbCrLf) > 0 Then
    c = Replace(c, vbCrLf, sSubstInterne)
    bRefresh = True
  End If
  
  If bRefresh Then c.Refresh
End Sub

