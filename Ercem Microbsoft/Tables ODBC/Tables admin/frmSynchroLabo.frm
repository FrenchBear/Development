VERSION 5.00
Begin VB.Form frmSynchroLabo 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Synchro - Diffusion des r�sultats Labo"
   ClientHeight    =   1980
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8415
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmSynchroLabo.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   132
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   561
   Tag             =   "Donn�es"
   Begin VB.TextBox txtChamp 
      DataField       =   "sl_options"
      Height          =   315
      Index           =   4
      Left            =   1680
      TabIndex        =   7
      Top             =   840
      Width           =   1110
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sl_waittimestamp"
      Height          =   315
      Index           =   3
      Left            =   1680
      TabIndex        =   5
      Top             =   1560
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*sl_systeme"
      Height          =   315
      Index           =   1
      Left            =   1680
      TabIndex        =   1
      Top             =   480
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sl_lasttimestamp"
      Height          =   315
      Index           =   14
      Left            =   1680
      TabIndex        =   3
      Top             =   1200
      Width           =   2055
   End
   Begin TablesAdmin.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   8
      Top             =   0
      Width           =   8415
      _ExtentX        =   14843
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
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Options :"
      Height          =   210
      Index           =   4
      Left            =   0
      TabIndex        =   6
      Top             =   900
      Width           =   870
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Wait timestamp :"
      Height          =   210
      Index           =   3
      Left            =   0
      TabIndex        =   4
      Top             =   1620
      Width           =   1620
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Syst�me :"
      Height          =   210
      Index           =   1
      Left            =   0
      TabIndex        =   0
      Top             =   540
      Width           =   945
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Last timestamp :"
      Height          =   210
      Index           =   13
      Left            =   0
      TabIndex        =   2
      Top             =   1260
      Width           =   1590
   End
End
Attribute VB_Name = "frmSynchroLabo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmSynchroLabo
' Synchro - Diffusion des r�sultats Labo
' 11/12/2000 NC
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des destructions et des cr�ations

Option Explicit

Private cSL As BDCurseur                  ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire
Private sFinalSQL As String               ' Requ�te SQL courante

Private colChange As New Collection       ' Trace des modifications
Private colD�truit As New Collection      ' Trace des d�structions d'enregistrement
Private colCr�� As New Collection         ' Trace des cr�ations

Private Const sTable = "synchrolabo"


'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim sWP As String
  Dim t As Control
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
  
  Dim cSLQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from synchrolabo where " & sWP & ""
  cSLQuery.OpenCurseur sSQL
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "�chec lors de la requ�te" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    ActiveFormulaire True
    SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture �ventuelle du curseur en cours
  If Not cSL Is Nothing Then cSL.CloseCurseur
  Set cSL = cSLQuery
  sFinalSQL = sSQL
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cSL.EOF And cSL.BOF) Then
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
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cSLAdd As New BDCurseur
  cSLAdd.OpenCurseur "select * from synchrolabo where sl_systeme='@'"
  cSLAdd.AddNew
  If Not bPr�pareEditAdd(cSLAdd, colColonnes, colChamps) Then cSLAdd.CloseCurseur: Exit Sub
  cSLAdd.CloseCurseur
  
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cSL Is Nothing Then cSL.CloseCurseur
  Set cSL = New BDCurseur
  sFinalSQL = "select * from synchrolabo where sl_systeme=" & sFormToSQL(colChamps("sl_systeme"), BDTypeCHAR)
  cSL.OpenCurseur sFinalSQL
  cSL.MoveFirst
        
  ' On m�morise toutes les valeurs saisie par l'utilisateur
  EffaceCollection colCr��
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colCr��.Add ValeurContr�le(C), C.DataField
    End If
  Next
  
  ' Si on est en train d'ajouter un enregistrement, on recence ds l'historique la valeur des diff�rents param�tres
  If iMode = meAdd Then
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        ' On enregistre uniquement si les champs ne sont pas vides
        If ValeurContr�le(C) <> "" Then
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colCr��(C.DataField)
        End If
      End If
    Next
    ' On enregistre dans le journal la trace de la cr�ation
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("sl_systeme"), "cr��", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  bdS�l.Emp�cheMouvements
  
  M�morise
  
  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cSL Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cSL.Edit
  If Not bPr�pareEditAdd(cSL, colColonnes, colChamps) Then Exit Sub
  
  ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a �t� chang�
  If iMode = meChange Then
  Dim C As Control
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If colChange(C.DataField) <> ValeurContr�le(C) Then  ' Modifi� !
        If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
        sMsgTrace = sMsgTrace & C.DataField & ":" & colChange(C.DataField) & "->" & ValeurContr�le(C)
      End If
    End If
  Next
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("sl_systeme"), "chang�", sMsgTrace
  End If
  End If
  ActiveFormulaire False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  AjusteMouvements
  
  M�morise

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

  ActiveFormulaire False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cSL Is Nothing Then
    If Not (cSL.EOF And cSL.BOF) Then
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
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, False
  
  colChamps("sl_systeme").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cSL Is Nothing
  
  If cSL.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  
  colChamps("sl_options").SetFocus
  bdS�l.TabStop = False
  
  iMode = meChange
  
  ' On m�morise les valeurs avant le changement
  EffaceCollection colChange
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colChange.Add ValeurContr�le(C), C.DataField
    End If
  Next
  
  SetMessage "Modifiez les valeurs affich�es, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  
  colChamps("sl_systeme").SetFocus
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cSL Is Nothing

  If cSL.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
   
  ' M�morisation de la trace de l'enregistrement qui va �tre d�truit
  EffaceCollection colD�truit
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colD�truit.Add ValeurContr�le(C), C.DataField
    End If
  Next
  
  ' Tri des donn�es � conserver et placement ds la variable Smsgtrace
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContr�le(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & colD�truit(C.DataField)
         End If
      End If
  Next
  
  ' On r�pertorie l'enregistrement dans le journal avant la destructiuon definitive
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("sl_systeme"), "d�truit", sMsgTrace
  End If
  
  On Error Resume Next
  cSL.Delete
  If Err Then
    AfficheErreurODBC "�chec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cSL.MoveNext
  If cSL.EOF Then
    cSL.MovePrevious
    If cSL.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  bdS�l.ActiveMouvements iMode = meNavigate
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cSL Is Nothing
  
  bdS�l.ButtonEnabled("First") = cSL.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cSL.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cSL.EOF
  bdS�l.ButtonEnabled("Last") = Not cSL.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cSL.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cSL.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cSL.MoveNext
  AjusteMouvements
  If cSL.EOF Then cSL.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cSL.MovePrevious
  AjusteMouvements
  If cSL.BOF Then cSL.MoveFirst
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
  Dim C As Control
  
  ResetChienDeGarde
  If KeyCode = vbKeyF5 Then   ' M�moire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set C = ActiveControl
          C = colM�moireSM(ActiveControl.DataField)
          C.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each C In colChamps
        If Not C.Locked Then      ' On ne remplit pas les champs verrouill�s
          C = colM�moireSM(C.DataField)
        End If
      Next
    End If
  Else
    bdS�l.KeyDown KeyCode
  End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
End Sub

' Menu de commandes contextuel
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then    ' Bouton droit
    PopupMenu MDIAdministration.mnuCommandes
  End If
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

  
  ' Pas de chargement des combos !
  
  
  
  ' Formulaire en mode initial
  Set cSL = Nothing
  ActiveFormulaire False
  With bdS�l
    .LectureSeule = bLectureSeule
    .ActiveMouvements False
    .ActiveValidation False
    .ButtonEnabled("Query") = True
    .ButtonEnabled("Add") = True
    .SetFocus
  End With
  
  iMode = meEmpty
  SetMessage
  SetStatus
  sFinalSQL = ""
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
  If Not cSL Is Nothing Then
    cSL.CloseCurseur
    Set cSL = Nothing
  End If
  MDIAdministration.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cSL Is Nothing Then
    EffaceFormulaire
  ElseIf cSL.BOF And cSL.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cSL.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cSL.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    bdS�l.NumRec = cSL.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cSL.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


Private Sub EffaceFormulaire()
  Dim C As Control
  For Each C In colChamps
    C.Text = ""
  Next
  bdS�l.NumRec = ""
End Sub


Private Sub ActiveFormulaire(bEnabled As Boolean)
  Dim C As Control
  For Each C In colChamps
    BDActiveChamp C, bEnabled
  Next
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
  BDCopieS�lection cSL, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

'Public Sub Imprime()
'  BDEtat sFinalSQL, drsynchrolabo, True
'End Sub
'
'Public Sub Aper�u()
'  BDEtat sFinalSQL, drsynchrolabo, False
'End Sub



'=================================================================================
' M�morisation

Public Sub M�morise()
  EffaceCollection colM�moireSM
  
  Dim t As Control
  For Each t In colChamps
    colM�moireSM.Add (t), t.DataField
  Next
End Sub


'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("sl_systeme") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub


