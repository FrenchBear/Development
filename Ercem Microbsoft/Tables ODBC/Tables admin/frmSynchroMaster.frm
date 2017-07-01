VERSION 5.00
Begin VB.Form frmSynchroMaster 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Synchro - Table maître"
   ClientHeight    =   3135
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
   Icon            =   "frmSynchroMaster.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   209
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   561
   Tag             =   "Données"
   Begin VB.TextBox txtChamp 
      DataField       =   "sm_postcmd"
      Height          =   315
      Index           =   7
      Left            =   1740
      TabIndex        =   17
      Top             =   2760
      Width           =   4515
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sm_count"
      Height          =   315
      Index           =   5
      Left            =   1740
      TabIndex        =   15
      Top             =   2400
      Width           =   1110
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sm_options"
      Height          =   315
      Index           =   4
      Left            =   1740
      TabIndex        =   13
      Top             =   2040
      Width           =   1110
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sm_waittimestamp"
      Height          =   315
      Index           =   3
      Left            =   5880
      TabIndex        =   11
      Top             =   840
      Width           =   2355
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*sm_systeme"
      Height          =   315
      Index           =   1
      Left            =   1740
      TabIndex        =   5
      Top             =   1200
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sm_nomdistant"
      Height          =   315
      Index           =   6
      Left            =   1740
      TabIndex        =   7
      Top             =   1560
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sm_lasttimestamp"
      Height          =   315
      Index           =   14
      Left            =   5880
      TabIndex        =   9
      Top             =   480
      Width           =   2355
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*sm_table"
      Height          =   315
      Index           =   2
      Left            =   1740
      TabIndex        =   3
      Top             =   840
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*sm_jeu"
      Height          =   315
      Index           =   0
      Left            =   1740
      TabIndex        =   1
      Top             =   480
      Width           =   2055
   End
   Begin TablesAdmin.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   18
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
      Caption         =   "Wait timestamp :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   16
      Top             =   2820
      Width           =   1620
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Count :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   14
      Top             =   2460
      Width           =   705
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Options :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   12
      Top             =   2100
      Width           =   870
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Wait timestamp :"
      Height          =   210
      Index           =   3
      Left            =   4200
      TabIndex        =   10
      Top             =   900
      Width           =   1620
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Système :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   945
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nom distant :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   6
      Top             =   1620
      Width           =   1275
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Last timestamp :"
      Height          =   210
      Index           =   13
      Left            =   4200
      TabIndex        =   8
      Top             =   540
      Width           =   1590
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Table :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   645
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Jeu :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   450
   End
End
Attribute VB_Name = "frmSynchroMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmSynchroMaster
' Synchro - Table maître
' 27/08/1999 PV
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des destructions et des créations

Option Explicit

Private cSM As BDCurseur                  ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private sFinalSQL As String               ' Requête SQL courante

Private colChange As New Collection       ' Trace des modifications
Private colDétruit As New Collection      ' Trace des déstructions d'enregistrement
Private colCréé As New Collection         ' Trace des créations

Private Const sTable = "synchromaster"


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
        MsgBox "Erreur dans la requête !" & vbCrLf & sMsg, vbExclamation, App.Title
        t.SetFocus
        Exit Sub
      End If
      If sWP <> "" Then sWP = sWP & " and "
      sWP = sWP & "(" & sFinal & ")"
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cSMQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from synchromaster where " & sWP & " order by sm_jeu,sm_table"
  cSMQuery.OpenCurseur sSQL
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    ActiveFormulaire True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cSM Is Nothing Then cSM.CloseCurseur
  Set cSM = cSMQuery
  sFinalSQL = sSQL
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cSM.EOF And cSM.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a été sélectionné"
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  bdSél.SetFocus
End Sub


' Vérifie que les champs contiennent des valeurs légales
' Le contrôle des NULL et des types a déjà été fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer
  
  bOkValeurs = False
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cSMAdd As New BDCurseur
  cSMAdd.OpenCurseur "select * from synchromaster where sm_table='@'"
  cSMAdd.AddNew
  If Not bPrépareEditAdd(cSMAdd, colColonnes, colChamps) Then cSMAdd.CloseCurseur: Exit Sub
  cSMAdd.CloseCurseur
  
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cSM Is Nothing Then cSM.CloseCurseur
  Set cSM = New BDCurseur
  sFinalSQL = "select * from synchromaster where sm_table=" & sFormToSQL(colChamps("sm_table"), BDTypeCHAR) & " and sm_systeme=" & sFormToSQL(colChamps("sm_systeme"), BDTypeCHAR)
  cSM.OpenCurseur sFinalSQL
  cSM.MoveFirst
        
  ' On mémorise toutes les valeurs saisie par l'utilisateur
  EffaceCollection colCréé
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colCréé.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  ' Si on est en train d'ajouter un enregistrement, on recence ds l'historique la valeur des différents paramètres
  If iMode = meAdd Then
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        ' On enregistre uniquement si les champs ne sont pas vides
        If ValeurContrôle(C) <> "" Then
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colCréé(C.DataField)
        End If
      End If
    Next
    ' On enregistre dans le journal la trace de la création
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("sm_table"), "créé", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  bdSél.EmpêcheMouvements
  
  Mémorise
  
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cSM Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cSM.Edit
  If Not bPrépareEditAdd(cSM, colColonnes, colChamps) Then Exit Sub

  ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a été changé
  If iMode = meChange Then
    Dim C As Control
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        If colChange(C.DataField) <> ValeurContrôle(C) Then  ' Modifié !
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colChange(C.DataField) & "->" & ValeurContrôle(C)
        End If
      End If
    Next
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("sm_table"), "changé", sMsgTrace
    End If
  End If
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  AjusteMouvements
  
  Mémorise

  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
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
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cSM Is Nothing Then
    If Not (cSM.EOF And cSM.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, False
  
  colChamps("sm_jeu").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cSM Is Nothing
  
  If cSM.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  
  colChamps("sm_jeu").SetFocus
  AutoSelect colChamps("sm_jeu"), True
  bdSél.TabStop = False
  
  iMode = meChange
  
  ' On mémorise les valeurs avant le changement
  EffaceCollection colChange
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colChange.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  
  colChamps("sm_jeu").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cSM Is Nothing

  If cSM.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
       
  ' Mémorisation de la trace de l'enregistrement qui va être détruit
  EffaceCollection colDétruit
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colDétruit.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  ' Tri des données à conserver et placement ds la variable Smsgtrace
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContrôle(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & colDétruit(C.DataField)
         End If
      End If
  Next
  
  ' On répertorie l'enregistrement dans le journal avant la destructiuon definitive
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("sm_table"), "détruit", sMsgTrace
  End If
  
  On Error Resume Next
  cSM.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cSM.MoveNext
  If cSM.EOF Then
    cSM.MovePrevious
    If cSM.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  bdSél.ActiveMouvements iMode = meNavigate
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cSM Is Nothing
  
  bdSél.ButtonEnabled("First") = cSM.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cSM.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cSM.EOF
  bdSél.ButtonEnabled("Last") = Not cSM.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cSM.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cSM.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cSM.MoveNext
  AjusteMouvements
  If cSM.EOF Then cSM.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cSM.MovePrevious
  AjusteMouvements
  If cSM.BOF Then cSM.MoveFirst
  SynchroniseFormulaire
End Sub


'=================================================================================
' Actions du sélecteur

Private Sub bdSél_ActionAdd():      ActionAdd:      End Sub
Private Sub bdSél_ActionCancel():   ActionCancel:   End Sub
Private Sub bdSél_ActionChange():   ActionChange:   End Sub
Private Sub bdSél_ActionDelete():   ActionDelete:   End Sub
Private Sub bdSél_ActionFirst():    ActionFirst:    End Sub
Private Sub bdSél_ActionLast():     ActionLast:     End Sub
Private Sub bdSél_ActionNext():     ActionNext:     End Sub
Private Sub bdSél_ActionPrevious(): ActionPrevious: End Sub
Private Sub bdSél_ActionQuery():    ActionQuery:    End Sub
Private Sub bdSél_ActionValidate(): ActionValidate: End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  Dim C As Control
  
  ResetChienDeGarde
  If KeyCode = vbKeyF5 Then   ' Mémoire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set C = ActiveControl
          C = colMémoireSM(ActiveControl.DataField)
          C.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each C In colChamps
        If Not C.Locked Then      ' On ne remplit pas les champs verrouillés
          C = colMémoireSM(C.DataField)
        End If
      Next
    End If
  Else
    bdSél.KeyDown KeyCode
  End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
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
    MsgBox "La table '" & sTable & "' n'est pas présente dans la base de données courante, affichage impossible.", vbCritical, App.Title
    Unload Me
    Exit Sub
  End If
  
  Show
  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  
  ' Pas de chargement des combos !
  
  
  
  ' Formulaire en mode initial
  Set cSM = Nothing
  ActiveFormulaire False
  With bdSél
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
    MsgBox "Terminez l'opération en cours avant de fermer la fenêtre !", vbCritical, App.Title
    If Not bShiftPressed Then
      Cancel = True
      Exit Sub
    End If
  End If

  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cSM Is Nothing Then
    cSM.CloseCurseur
    Set cSM = Nothing
  End If
  MDIAdministration.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cSM Is Nothing Then
    EffaceFormulaire
  ElseIf cSM.BOF And cSM.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cSM.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cSM.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    bdSél.NumRec = cSM.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cSM.bEffacé = True
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
  bdSél.NumRec = ""
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

Private Sub bdSél_GotFocus()
  SetStatus
End Sub


'=================================================================================
' Accès au Web

Public Sub FenêtreWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=" & sTable
End Sub


'=================================================================================
' Copie des données dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours…"
  BDCopieSélection cSM, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

'Public Sub Imprime()
'  BDEtat sFinalSQL, drSynchroMaster, True
'End Sub
'
'Public Sub Aperçu()
'  BDEtat sFinalSQL, drSynchroMaster, False
'End Sub



'=================================================================================
' Mémorisation

Public Sub Mémorise()
  EffaceCollection colMémoireSM
  
  Dim t As Control
  For Each t In colChamps
    colMémoireSM.Add (t), t.DataField
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
  sWP = "jou_domaine='" & sTable & " " & colChamps("sm_table") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub

