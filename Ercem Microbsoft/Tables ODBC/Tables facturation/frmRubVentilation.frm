VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "MSWLESS.OCX"
Begin VB.Form frmRubVentilation 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des rubriques de ventilation"
   ClientHeight    =   2070
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8115
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmRubVentilation.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   138
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   541
   Tag             =   "Donn�es"
   Begin VB.Frame frlTra�abilit� 
      Caption         =   "Tra�abilit�"
      Height          =   735
      Left            =   60
      TabIndex        =   5
      Top             =   1260
      Width           =   7995
      Begin MSWLess.WLText txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   14
         Left            =   1680
         TabIndex        =   3
         Tag             =   "Champ interne de synchronisation, format AAAA-MM-JJ HH:MM:SS"
         Top             =   240
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483639
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   6
         Top             =   300
         Width           =   1155
      End
   End
   Begin TablesFacturation.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   7
      Top             =   0
      Width           =   8115
      _ExtentX        =   14314
      _ExtentY        =   767
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*ruv_libelle"
      Height          =   315
      Index           =   4
      Left            =   1740
      TabIndex        =   2
      Tag             =   "Libell� de la rubrique de ventilation"
      Top             =   840
      Width           =   6315
      _ExtentX        =   11139
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   60
      ForeColor       =   -2147483630
      BackColor       =   -2147483639
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*ruv_numruv"
      Height          =   315
      Index           =   0
      Left            =   1740
      TabIndex        =   1
      Tag             =   "N� de la rubrique de ventilation"
      Top             =   480
      Width           =   795
      _ExtentX        =   1402
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483639
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Libell�:"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   4
      Top             =   900
      Width           =   675
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Num�ro :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   870
   End
End
Attribute VB_Name = "frmRubVentilation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmRubVentilation
' Feuille de gestion des rubriques de ventilation
' 30/08/1999 NC

Option Explicit

Private cRV As BDCurseur                  ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire

Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private sQuery As String                  ' Query de la s�lection en cours

Private Const sTable = "rubvent"


'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim sWP As String
  Dim t As Control
  Dim bWPInt�greEtat As Boolean
  
  For Each t In colChamps
    If Not t.Locked And t.Text <> "" Then
      Dim sFinal As String, sMsg As String
      If Not bQueryToWP(t.DataField, t.Text, colColonnes(t.DataField).iType, sFinal, sMsg) Then
        MsgBox "Erreur dans la requ�te !" & vbCrLf & sMsg, vbExclamation, App.Title
        t.SetFocus
        Exit Sub
      End If
      If sWP <> "" Then sWP = sWP & " and "
      sWP = sWP & "(" & sFinal & ")"
      End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cRVQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from rubvent where " & sWP & " order by ruv_numruv"
  
  cRVQuery.OpenCurseur sQuery
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "�chec lors de la requ�te" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    BDActiveFormulaire colChamps, True
    SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture �ventuelle du curseur en cours
  If Not cRV Is Nothing Then cRV.CloseCurseur
  Set cRV = cRVQuery
  sFinalWP = sWP
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cRV.EOF And cRV.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a �t� s�lectionn�"
  End If
  bdS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  bdS�l.SetFocus
End Sub


' V�rifie que les champs contiennent des valeurs l�gales
' Le contr�le des NULL et des types a d�j� �t� fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer
  
  bOkValeurs = False
  
'  ' On contr�le que le pays est valide
'  If bdcPays.ListIndex < 0 Then
'    bdcPays.Synchronise
'    If bdcPays.ListIndex < 0 Then
'      MsgBox "Pays inconnu !", vbExclamation, App.Title
'      bdcPays.SetFocus
'      Exit Function
'    End If
'  End If
  

  ' On regarde si le nom n'existe pas d�j�
  Dim iSer As Long
  iSer = BDCurseurExpress("select ruv_numruv from rubvent where ruv_libelle=" & sFormToSQL(colChamps("ruv_libelle"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("ruv_numruv") Then
    MsgBox "ATTENTION - Cette rubrique de ventilation existe d�j� sous le n� " & iSer & ".", vbExclamation, App.Title
    Exit Function
  End If
  
  ' On regarde si le code de la rubrique est d�j� attribu� uniquement en cas d'ajout
  If iMode = meAdd Then
    Dim iSer1 As Integer
    iSer1 = BDCurseurExpress("select ruv_numruv from rubvent where ruv_numruv=" & sFormToSQL(colChamps("ruv_numruv"), BDTypeINTEGER))
    If iSer1 <> 0 Then
      MsgBox "ATTENTION - Ce num�ro de rubrique existe d�j�.", vbExclamation, App.Title
      Exit Function
    End If
  End If
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  Dim cRVAdd As New BDCurseur
  cRVAdd.OpenCurseur "select * from rubvent where ruv_numruv=0"
  cRVAdd.AddNew

  If Not bPr�pareEditAdd(cRVAdd, colColonnes, colChamps) Then
    cRVAdd.CloseCurseur
    Exit Sub
  End If
  cRVAdd.CloseCurseur
 
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cRV Is Nothing Then cRV.CloseCurseur
  Set cRV = New BDCurseur
  
  sFinalWP = "ruv_numruv=" & colChamps("ruv_numruv")
  sQuery = "select * from rubvent where " & sFinalWP
  cRV.OpenCurseur sQuery
  cRV.MoveFirst
  
  BDActiveFormulaire colChamps, False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  bdS�l.Emp�cheMouvements
  
  RubVentilationARecharger  ' Cache � recharger
  
  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cRV Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cRV.Edit
    
  If Not bPr�pareEditAdd(cRV, colColonnes, colChamps) Then Exit Sub
  
  BDActiveFormulaire colChamps, False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  AjusteMouvements
  
  RubVentilationARecharger  ' Cache � recharger

  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub



Private Sub ActionValidate()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub




Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  BDActiveFormulaire colChamps, False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cRV Is Nothing Then
    If Not (cRV.EOF And cRV.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub


'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, False
  BDActiveFormulaire colChamps, True
  
  colChamps("ruv_numruv").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cRV Is Nothing
  
  colChamps("ruv_libelle").SetFocus
  AutoSelect colChamps("ruv_numruv"), True
  
  If cRV.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "ruv_numruv", False
  ActiveChamp "timestamp", False
  
  iMode = meChange
  SetMessage "Modifiez les valeurs affich�es, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionAdd()
  colChamps("ruv_numruv").SetFocus
  
'$ NC
' On regarde si le num�ro existe d�j�
'  Dim cRubVAdd As New BDCurseur
'  cRubVAdd.OpenCurseur "select * from rubvent where ruv_numruv=0"
'  cRubVAdd.AddNew
'  If cRubVAdd = colChamps("ruv_numruv") Then
'    MsgBox "N� existant"
'    Exit Sub
'  End If

'  Dim cnumbanque As New BDCurseur
'  cnumbanque.OpenCurseur "select max (ban_numbanque) from banque"
'  colChamps("ban_numbanque") = cnumbanque.Fields(0) + 1
'  cBanqueAdd!ban_numbanque = cnumbanque.Fields(0) + 1
'  cnumbanque.CloseCurseur
  
  
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "timestamp", False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cRV Is Nothing
  
  If cRV.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est d�finitive." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cRV.Delete
  If Err Then
    AfficheErreurODBC "�chec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
'  ' On place un enregistrement dans synchrodelete
'  Dim cSD As New BDCurseur
'  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
'  cSD.AddNew
'  cSD!sd_table = sTable
'  cSD!sd_timestamp = Now+tOffsetNow
'  cSD!sd_wherepart = "ruv_numruv=" & sFormToSQL(colChamps("ruv_numruv"), BDTypeINTEGER)
'  cSD.Update
'  cSD.CloseCurseur
  
  cRV.MoveNext
  If cRV.EOF Then
    cRV.MovePrevious
    If cRV.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  RubVentilationARecharger  ' Cache � recharger
  
  bdS�l.ActiveMouvements iMode = meNavigate
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cRV Is Nothing

  bdS�l.ButtonEnabled("First") = cRV.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cRV.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cRV.EOF
  bdS�l.ButtonEnabled("Last") = Not cRV.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cRV.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cRV.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cRV.MoveNext
  AjusteMouvements
  If cRV.EOF Then cRV.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cRV.MovePrevious
  AjusteMouvements
  If cRV.BOF Then cRV.MoveFirst
  SynchroniseFormulaire
End Sub


'=================================================================================
' Actions du s�lecteur

Private Sub bdS�l_ActionAdd():      ActionAdd:      End Sub
Private Sub bdS�l_ActionCancel():   ActionCancel:   End Sub
Private Sub bdS�l_ActionChange():   ActionChange:   End Sub
Private Sub bdS�l_ActionDelete():   ActionDelete:   End Sub
Private Sub bdS�l_ActionFirst():    ActionFirst:    End Sub
Private Sub bdS�l_ActionLast():     ActionLast:     End Sub
Private Sub bdS�l_ActionNext():     ActionNext:     End Sub
Private Sub bdS�l_ActionPrevious(): ActionPrevious: End Sub
Private Sub bdS�l_ActionQuery():    ActionQuery:    End Sub
Private Sub bdS�l_ActionValidate(): ActionValidate: End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  bdS�l.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
End Sub

' Filtrage des Entr�e intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  If Not bExisteTable(sTable) Then
    MsgBox "La table '" & sTable & "' n'est pas pr�sente dans la base de donn�es courante, affichage impossible.", vbCritical, App.Title
    Unload Me
    Exit Sub
  End If
  
  Show
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  
  ' Chargement des combos
'  Dim p As Pays
'  For Each p In colPays
'    bdcPays.AddItem p.pay_pays, p.pay_libelle
'  Next
'
'  Dim u As Utilisateur
'  For Each u In colUtilisateur
'    bdcOperCreat.AddItem u.uti_numuti, u.uti_l1
'    bdcOperModif.AddItem u.uti_numuti, u.uti_l1
'    bdcOperValid.AddItem u.uti_numuti, u.uti_l1
'  Next

  
  ' Formulaire en mode initial
  Set cRV = Nothing
  BDActiveFormulaire colChamps, False
  bdS�l.LectureSeule = bLectureSeule
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  bdS�l.SetFocus
  
  SetMessage
  SetStatus
  sFinalWP = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'op�ration en cours avant de fermer la fen�tre !", vbCritical, App.Title
    If Not bShiftPressed Then
      Cancel = True
      Exit Sub
    End If
  End If

  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cRV Is Nothing Then cRV.CloseCurseur
  MDIFacturation.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub

' Aide des options
Private Sub lblOptions_Click(Index As Integer)
  If Index = 1 Then
    FileShellExecute hWnd, "http://www.silliker/microbsoft/secretariat/frmoptcr.htm"
  Else
    FileShellExecute hWnd, "http://www.silliker/microbsoft/serveur/optlabo.htm"
  End If
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cRV Is Nothing Then
    EffaceFormulaire
  ElseIf cRV.BOF And cRV.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cRV.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cRV.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdS�l.NumRec = cRV.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cRV.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  bdS�l.NumRec = ""
End Sub


Private Sub ActiveChamp(ByVal sChamp As String, bEnabled As Boolean)
  BDActiveChamp colChamps(sChamp), bEnabled
End Sub


'=================================================================================
' Ligne d'aide

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub bdS�l_GotFocus()
  SetStatus
End Sub

'Private Sub bdcPays_GotFocus()
'  SetStatus bdcPays.Tag
'End Sub

'Private Sub bdcPays_LostFocus()
'  bdcPays.Synchronise
'End Sub

'NC
'Private Sub bdcRV_GotFocus()
'  SetStatus bdcRV.Tag
'End Sub

'NC
'Private Sub bdcRV_LostFocus()
'  If bdcRV <> "" Then
'    bdcRV.Synchronise
'    If bdcRV.ListIndex < 0 Then Synchrorubvent
'  End If
'End Sub

'NC
'Private Sub Synchrorubvent()
'  Dim iNum As Long, sNom As String
'  iNum = Int(Val(bdcRV))
'  sNom = BDCurseurExpress("select ruv_libelle from rubvent where ruv_numruv=" & iNum)
'  If sNom <> "" Then bdcRV.AddItem iNum, sNom
'End Sub

'Private Sub bdcOperCreat_GotFocus()
'  SetStatus bdcOperCreat.Tag
'End Sub
'
'Private Sub bdcOperModif_GotFocus()
'  SetStatus bdcOperModif.Tag
'End Sub
'
'Private Sub bdcOperValid_GotFocus()
'  SetStatus bdcOperValid.Tag
'End Sub
'

'=================================================================================
' Acc�s au Web

Public Sub Fen�treWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=" & sTable
End Sub


'=================================================================================
' Copie des donn�es dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours�"
  BDCopieS�lection cRV, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub



'=================================================================================
' Impression

Public Sub Imprime()
  Etat True
End Sub

Public Sub Aper�u()
  Etat False
End Sub

Private Sub Etat(ByVal bImpression As Boolean)
  Dim sSQL As String
  sSQL = "select * from rubvent where " & sFinalWP & " order by ruv_numruv"
  BDEtat sSQL, drRubVentilation, bImpression
End Sub

