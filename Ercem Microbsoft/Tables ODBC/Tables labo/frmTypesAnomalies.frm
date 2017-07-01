VERSION 5.00
Begin VB.Form frmTypeAnomalie 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des types d'anomalies prédéfinis"
   ClientHeight    =   2280
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
   Icon            =   "frmTypesAnomalies.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   152
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   561
   Tag             =   "Données"
   Begin VB.TextBox txtChamp 
      DataField       =   "tan_idmodif"
      Height          =   315
      Index           =   10
      Left            =   1560
      TabIndex        =   7
      Tag             =   "Origine de la modification"
      Top             =   1560
      Width           =   3750
   End
   Begin TablesLabo.BDCombo bdcSection 
      Height          =   330
      Left            =   1560
      TabIndex        =   1
      Tag             =   "Section où peut être signalé le type d'anomalie"
      Top             =   480
      Width           =   6795
      _ExtentX        =   11986
      _ExtentY        =   582
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DataField       =   "*tan_section"
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*tan_libelle"
      Height          =   315
      Index           =   1
      Left            =   1560
      TabIndex        =   5
      Tag             =   "Description du type d'anomalie prédéfini"
      Top             =   1200
      Width           =   6795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   2
      Left            =   1560
      TabIndex        =   9
      Tag             =   "Timestamp de dernière modification des données"
      Top             =   1920
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*tan_code"
      Height          =   315
      Index           =   0
      Left            =   1560
      TabIndex        =   3
      Tag             =   "N° du type d'anomalie pour la section"
      Top             =   840
      Width           =   795
   End
   Begin TablesLabo.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   10
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
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   6
      Top             =   1620
      Width           =   1380
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Section :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   825
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Libellé :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   735
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   9
      Left            =   60
      TabIndex        =   8
      Top             =   1980
      Width           =   1155
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Code :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   630
   End
End
Attribute VB_Name = "frmTypeAnomalie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTypeAnomalie
' Feuille de gestion des types d'anomalies prédéfinis
' 13/02/1998 PV
'  7/07/1998 PV Copie de données dans le presse-papiers
' 15/08/1998 PV sAjusteMessageODBC, BDActiveChamp
' 22/12/1998 PV Ordre des champs dans colChamps
' 31/03/1999 PV Impression
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des déstructions et des créations

Option Explicit

Private cTan As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private sFinalSQL As String               ' Requête SQL courante
Private colChange As New Collection       ' Trace des modifications
Private coldétruit As New Collection      ' Trace de l'enregistrement qui va être détruit
Private colCréé As New Collection         ' Trace de la création de l'enregistrement

Private Const sTable = "typeanomalie"


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
  
  Dim cTanQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from typeanomalie where " & sWP & " order by tan_section, tan_code"
  cTanQuery.OpenCurseur sSQL
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
  If Not cTan Is Nothing Then cTan.CloseCurseur
  Set cTan = cTanQuery
  sFinalSQL = sSQL
  
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  BDSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cTan.EOF And cTan.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a été sélectionné"
  End If
  BDSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  BDSél.SetFocus
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
  
  Dim cTanAdd As New BDCurseur
  cTanAdd.OpenCurseur "select * from typeanomalie where tan_section='inconnu'"
  cTanAdd.AddNew
  
  If Not bPrépareEditAdd(cTanAdd, colColonnes, colChamps) Then
    cTanAdd.CloseCurseur
    Exit Sub
  End If
  cTanAdd.CloseCurseur
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cTan Is Nothing Then cTan.CloseCurseur
  Set cTan = New BDCurseur
  sFinalSQL = "select * from typeanomalie where tan_section=" & sFormToSQL(colChamps("tan_section").Text, BDTypeCHAR) & " and tan_code=" & sFormToSQL(colChamps("tan_code"), BDTypeINTEGER)
  cTan.OpenCurseur sFinalSQL
  cTan.MoveFirst
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
      JournalUnix sTable & " " & colChamps("tan_section") & " " & colChamps("tan_code"), "créé", sMsgTrace
    End If
  End If
  ActiveFormulaire False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  BDSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  BDSél.EmpêcheMouvements
  
  SetMessage
  SetStatus
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cTan Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cTan.Edit
  If Not bPrépareEditAdd(cTan, colColonnes, colChamps) Then Exit Sub

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
      JournalUnix sTable & " " & colChamps("tan_section") & " " & colChamps("tan_code"), "changé", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  BDSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDSél.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub



Private Sub ActionValidate()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:   ValidateAdd
    Case meQuery: ValidateQuery
  End Select
End Sub





Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  BDSél.ActiveValidation False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cTan Is Nothing Then
    If Not (cTan.EOF And cTan.BOF) Then
      iMode = meNavigate
    End If
  End If
  BDSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub


'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  
  colChamps("tan_section").SetFocus
  BDSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cTan Is Nothing
  
  If cTan.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "tan_section", False
  ActiveChamp "tan_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("tan_libelle").SetFocus
  AutoSelect colChamps("tan_libelle"), True
  BDSél.TabStop = False
  
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
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  ActiveChamp "tan_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("tan_section").SetFocus
  BDSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cTan Is Nothing

  If cTan.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  ' Mémorisation de la trace de l'enregistrement qui va être détruit
  EffaceCollection coldétruit
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      coldétruit.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  ' Tri des données à conserver et placement ds la variable Smsgtrace
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContrôle(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & coldétruit(C.DataField)
         End If
      End If
  Next
  
  ' On répertorie l'enregistrement dans le journal avant la destructiuon definitive
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("tan_section") & " " & colChamps("tan_code"), "détruit", sMsgTrace
  End If
  
  On Error Resume Next
  cTan.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cTan.MoveNext
  If cTan.EOF Then
    cTan.MovePrevious
    If cTan.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  BDSél.ActiveMouvements iMode = meNavigate
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cTan Is Nothing

  BDSél.ButtonEnabled("First") = cTan.AbsolutePosition <> 1
  BDSél.ButtonEnabled("Previous") = cTan.AbsolutePosition <> 1
  BDSél.ButtonEnabled("Next") = Not cTan.EOF
  BDSél.ButtonEnabled("Last") = Not cTan.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cTan.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cTan.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cTan.MoveNext
  AjusteMouvements
  If cTan.EOF Then cTan.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cTan.MovePrevious
  AjusteMouvements
  If cTan.BOF Then cTan.MoveFirst
  SynchroniseFormulaire
End Sub


Private Sub bdcSection_LostFocus()
  bdcSection.Synchronise
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
  BDSél.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then BDSél.KeyPress KeyAscii
End Sub
' Menu de commandes contextuel
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then    ' Bouton droit
    PopupMenu MDILabo.mnuCommandes
  End If
End Sub



' Les événements sont en majuscules
Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "tan_section" Then ToMaj txtChamp(Index)
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  Show
  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  
  ' Chargement des combos
  Dim s As Section
  For Each s In colSection
    bdcSection.AddItem s.sec_code, s.sec_libelle
  Next
  
  ' Formulaire en mode initial
  Set cTan = Nothing
  ActiveFormulaire False
  BDSél.LectureSeule = bLectureSeule
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  BDSél.SetFocus
  
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
  If Not cTan Is Nothing Then cTan.CloseCurseur
  MDILabo.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cTan Is Nothing Then
    EffaceFormulaire
  ElseIf cTan.BOF And cTan.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cTan.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cTan.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    BDSél.NumRec = cTan.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cTan.bEffacé = True
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
  BDSél.NumRec = ""
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
  BDCopieSélection cTan, colChamps, BDSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  BDEtat sFinalSQL, drTypeAnomalie, True
End Sub

Public Sub Aperçu()
  BDEtat sFinalSQL, drTypeAnomalie, False
End Sub



'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("tan_section") & " " & colChamps("tan_code") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub

