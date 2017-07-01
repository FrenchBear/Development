VERSION 5.00
Begin VB.Form frmS�rie 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des s�ries"
   ClientHeight    =   3315
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
   Icon            =   "frmS�ries.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   221
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   561
   Tag             =   "Donn�es"
   Begin VB.TextBox txtChamp 
      DataField       =   "ser_superserie"
      Height          =   315
      Index           =   1
      Left            =   2460
      TabIndex        =   13
      Tag             =   "N� d'imprimante qui a produit les �tiquettes"
      Top             =   2640
      Width           =   1035
   End
   Begin TablesLabo.BDCombo bdcOperImpr 
      Height          =   330
      Left            =   2460
      TabIndex        =   7
      Tag             =   "Technicienne ayant imprim� la s�rie"
      Top             =   1560
      Width           =   5895
      _ExtentX        =   10398
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
      DataField       =   "ser_operimpr"
   End
   Begin TablesLabo.BDCombo bdcTechnicienne 
      Height          =   330
      Left            =   2460
      TabIndex        =   3
      Tag             =   "Technicienne ayant enregistr� la s�rie"
      Top             =   840
      Width           =   5895
      _ExtentX        =   10398
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
      DataField       =   "*ser_numtech"
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ser_imprimesur"
      Height          =   315
      Index           =   3
      Left            =   2460
      TabIndex        =   5
      Tag             =   "N� d'imprimante qui a produit les �tiquettes"
      Top             =   1200
      Width           =   1035
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ser_dh"
      Height          =   315
      Index           =   14
      Left            =   2460
      TabIndex        =   11
      Tag             =   "Date+heure d'enregistrement de la s�rie"
      Top             =   2280
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ser_tsimpr"
      Height          =   315
      Index           =   2
      Left            =   2460
      TabIndex        =   9
      Tag             =   "Date d'impression des �tiquettes de la s�rie"
      Top             =   1920
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ser_numserie"
      Height          =   315
      Index           =   0
      Left            =   2460
      TabIndex        =   1
      Tag             =   "Code interne du serielabo"
      Top             =   480
      Width           =   1035
   End
   Begin TablesLabo.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   14
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
      Caption         =   "N� supers�rie :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   12
      Top             =   2700
      Width           =   1440
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Date+heure impression :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   8
      Top             =   1980
      Width           =   2355
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Oper impr :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   6
      Top             =   1620
      Width           =   1065
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Imprim� sur :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   1260
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Date+heure cr�ation :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   10
      Top             =   2340
      Width           =   2100
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Technicienne :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   1350
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "N� s�rie labo :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   1365
   End
End
Attribute VB_Name = "frmS�rie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmS�ries
' Feuille de gestion des s�ries (g�loses)
' 16/02/1998 PV
'  7/07/1998 PV Copie de donn�es dans le presse-papiers
' 15/08/1998 PV sAjusteMessageODBC, BDActiveChamp
' 22/12/1998 PV Ordre des champs dans colChamps
' 31/03/1999 PV Impressions
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des d�structions et des cr�ations

Option Explicit

Private cSer As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire
Private sFinalSQL As String               ' Requ�te SQL courante
Private colChange As New Collection       ' Trace des modifications
Private cold�truit As New Collection      ' Trace de l'enregistrement qui va �tre d�truit
Private colCr�� As New Collection         ' Trace de la cr�ation de l'enregistrement

Private Const sTable = "c_serielabo"


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
  
  Dim cSerQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from c_serielabo where " & sWP & " order by ser_numserie"
  cSerQuery.OpenCurseur sSQL
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
  If Not cSer Is Nothing Then cSer.CloseCurseur
  Set cSer = cSerQuery
  sFinalSQL = sSQL
  
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  BDS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cSer.EOF And cSer.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a �t� s�lectionn�"
  End If
  BDS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  BDS�l.SetFocus
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
  
  Dim cSerAdd As New BDCurseur
  cSerAdd.OpenCurseur "select * from c_serielabo where ser_numserie=0"
  cSerAdd.AddNew
  If Not bPr�pareEditAdd(cSerAdd, colColonnes, colChamps) Then cSerAdd.CloseCurseur: Exit Sub
  cSerAdd.CloseCurseur
  
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cSer Is Nothing Then cSer.CloseCurseur
  Set cSer = New BDCurseur
  sFinalSQL = "select * from c_serielabo where ser_numserie=" & sFormToSQL(colChamps("ser_numserie"), BDTypeINTEGER)
  cSer.OpenCurseur sFinalSQL
  cSer.MoveFirst
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
      JournalUnix sTable & " " & colChamps("ser_numserie"), "cr��", sMsgTrace
    End If
  End If
  ActiveFormulaire False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  
  BDS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  BDS�l.Emp�cheMouvements
  
  SetMessage
  SetStatus
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cSer Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cSer.Edit
  If Not bPr�pareEditAdd(cSer, colColonnes, colChamps) Then Exit Sub
  
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
      JournalUnix sTable & " " & colChamps("ser_numserie"), "chang�", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  
  BDS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDS�l.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  BDS�l.TabStop = True
  BDS�l.SetFocus
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
  BDS�l.ActiveValidation False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cSer Is Nothing Then
    If Not (cSer.EOF And cSer.BOF) Then
      iMode = meNavigate
    End If
  End If
  BDS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub


'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  BDS�l.ButtonEnabled("Query") = False
  BDS�l.ButtonEnabled("Add") = False
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  
  colChamps("ser_numserie").SetFocus
  BDS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cSer Is Nothing
  
  If cSer.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  BDS�l.ButtonEnabled("Query") = False
  BDS�l.ButtonEnabled("Add") = False
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "ser_numserie", False
  
  colChamps("ser_numtech").SetFocus
  AutoSelect colChamps("ser_numtech"), True
  BDS�l.TabStop = False
  
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
  
  BDS�l.ButtonEnabled("Query") = False
  BDS�l.ButtonEnabled("Add") = False
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  
  colChamps("ser_numserie").SetFocus
  BDS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cSer Is Nothing

  If cSer.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If

  ' M�morisation de la trace de l'enregistrement qui va �tre d�truit
  EffaceCollection cold�truit
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      cold�truit.Add ValeurContr�le(C), C.DataField
    End If
  Next
  
  ' Tri des donn�es � conserver et placement ds la variable Smsgtrace
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContr�le(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & cold�truit(C.DataField)
         End If
      End If
  Next
  
  ' On r�pertorie l'enregistrement dans le journal avant la destructiuon definitive
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("ser_numserie"), "d�truit", sMsgTrace
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  cSer.Delete
  cSer.MoveNext
  If cSer.EOF Then
    cSer.MovePrevious
    If cSer.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  BDS�l.ActiveMouvements iMode = meNavigate
  BDS�l.TabStop = True
  BDS�l.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cSer Is Nothing

  BDS�l.ButtonEnabled("First") = cSer.AbsolutePosition <> 1
  BDS�l.ButtonEnabled("Previous") = cSer.AbsolutePosition <> 1
  BDS�l.ButtonEnabled("Next") = Not cSer.EOF
  BDS�l.ButtonEnabled("Last") = Not cSer.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cSer.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cSer.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cSer.MoveNext
  AjusteMouvements
  If cSer.EOF Then cSer.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cSer.MovePrevious
  AjusteMouvements
  If cSer.BOF Then cSer.MoveFirst
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
  BDS�l.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then BDS�l.KeyPress KeyAscii
End Sub
' Menu de commandes contextuel
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then    ' Bouton droit
    PopupMenu MDILabo.mnuCommandes
  End If
End Sub

'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  Show
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  
  ' Chargement des combos !
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcTechnicienne.AddItem u.uti_numuti, u.uti_nom
    bdcOperImpr.AddItem u.uti_numuti, u.uti_nom
  Next
  
  ' Formulaire en mode initial
  Set cSer = Nothing
  ActiveFormulaire False
  BDS�l.LectureSeule = bLectureSeule
  BDS�l.ActiveMouvements False
  BDS�l.ActiveValidation False
  BDS�l.ButtonEnabled("Query") = True
  BDS�l.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  BDS�l.SetFocus
  
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
  If Not cSer Is Nothing Then cSer.CloseCurseur
  MDILabo.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cSer Is Nothing Then
    EffaceFormulaire
  ElseIf cSer.BOF And cSer.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cSer.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cSer.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    BDS�l.NumRec = cSer.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cSer.bEffac� = True
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
  BDS�l.NumRec = ""
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


Private Sub bdcTechnicienne_GotFocus()
  SetStatus bdcTechnicienne.Tag
End Sub

Private Sub bdcTechnicienne_LostFocus()
  bdcTechnicienne.Synchronise
End Sub


Private Sub bdcOperImpr_GotFocus()
  SetStatus bdcOperImpr.Tag
End Sub

Private Sub bdcOperImpr_LostFocus()
  bdcOperImpr.Synchronise
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
  BDCopieS�lection cSer, colChamps, BDS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  BDEtat sFinalSQL, drS�rie, True
End Sub

Public Sub Aper�u()
  BDEtat sFinalSQL, drS�rie, False
End Sub

'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("ser_numserie") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub

