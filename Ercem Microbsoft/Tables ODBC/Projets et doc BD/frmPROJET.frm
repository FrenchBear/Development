VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmProjet 
   BackColor       =   &H80000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des projets"
   ClientHeight    =   6075
   ClientLeft      =   45
   ClientTop       =   330
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
   Icon            =   "frmPROJET.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6075
   ScaleWidth      =   8415
   Tag             =   "Donn�es"
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   6
      Left            =   1980
      Locked          =   -1  'True
      TabIndex        =   13
      Tag             =   "date de la derni�re modification"
      Top             =   3060
      Width           =   1995
   End
   Begin VB.Timer Timer1 
      Interval        =   250
      Left            =   6180
      Top             =   3240
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*prj_datefinp"
      Height          =   315
      Index           =   5
      Left            =   1980
      TabIndex        =   5
      Tag             =   "date de fin pr�vue (ex : fin mars 99)"
      Top             =   900
      Width           =   1995
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*prj_chef"
      Height          =   315
      Index           =   2
      Left            =   1980
      TabIndex        =   7
      Tag             =   "chef de projet"
      Top             =   1320
      Width           =   6375
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "prj_comment"
      Height          =   795
      Index           =   3
      Left            =   1980
      MultiLine       =   -1  'True
      TabIndex        =   9
      Tag             =   "Commentaires du projet"
      Top             =   1740
      Width           =   6375
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "prj_datevalid"
      Height          =   315
      Index           =   4
      Left            =   1980
      TabIndex        =   11
      Tag             =   "Date de validation (ex : 18/05/99)"
      Top             =   2640
      Width           =   1995
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*prj_nom"
      Height          =   315
      Index           =   1
      Left            =   1980
      TabIndex        =   3
      Tag             =   "nom du projet"
      Top             =   480
      Width           =   6375
   End
   Begin VB.CommandButton btnEtapes 
      Caption         =   "�&tapes"
      Height          =   375
      Left            =   60
      TabIndex        =   14
      ToolTipText     =   "S�lectionne les �tapes du projet courant"
      Top             =   3540
      Width           =   1455
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*prj_num"
      Height          =   315
      Index           =   0
      Left            =   480
      TabIndex        =   1
      Tag             =   "N� de projet"
      Top             =   480
      Width           =   495
   End
   Begin Projets.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   16
      Top             =   0
      Width           =   8415
      _ExtentX        =   14843
      _ExtentY        =   767
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComctlLib.ListView ListView 
      Height          =   2055
      Left            =   60
      TabIndex        =   15
      Tag             =   "Liste des �tapes du projet"
      Top             =   3960
      Width           =   8295
      _ExtentX        =   14631
      _ExtentY        =   3625
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   5
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "N�"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Libell�"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "responsable"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "dur�e"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "valid�e"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp: "
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   12
      Top             =   3120
      Width           =   1155
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "&N� :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Tag             =   "N� du projet"
      Top             =   540
      Width           =   375
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "N&om : "
      Height          =   210
      Index           =   1
      Left            =   1080
      TabIndex        =   2
      Top             =   540
      Width           =   615
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "&Chef : "
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   6
      Top             =   1380
      Width           =   630
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Date de &fin pr�vue :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   4
      Top             =   960
      Width           =   1890
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Co&mmentaires : "
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   8
      Top             =   1800
      Width           =   1560
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Date de &validation : "
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   10
      Top             =   2700
      Width           =   1920
   End
End
Attribute VB_Name = "frmProjet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmProjet
' Gestion des projets
' 17/08/1998 SS
'  1/04/1999 PV Impressions


Option Explicit

Private cProjets As BDCurseur             ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition
Private sFinalSQL As String               ' Requ�te SQL courante

Private Const sTable = "projet"

Dim btnEtapescliqu� As Boolean


'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  ActiveTimer mtStop
  Assert iMode = meQuery
  
  btnEtapes.Enabled = True
  ListView.Enabled = True
  
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
  
  Dim cprojetsQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from projet where " & sWP & " order by prj_num"
  cprojetsQuery.OpenCurseur sSQL
  iErr = Err
  sErr = Error
  On Error GoTo 0
  If iErr Then
    MsgBox "�chec lors de la requ�te" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    ActiveFormulaire True
    SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture �ventuelle du curseur en cours
  If Not cProjets Is Nothing Then cProjets.CloseCurseur
  Set cProjets = cprojetsQuery
  sFinalSQL = sSQL
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cProjets.EOF And cProjets.BOF) Then
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
  bOkValeurs = False
  
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Dim sType As String
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cprojetsAdd As New BDCurseur
  cprojetsAdd.OpenCurseur "select * from projet where prj_num=0"
  cprojetsAdd.AddNew
  If Not bPr�pareEditAdd(cprojetsAdd, colColonnes, colChamps) Then cprojetsAdd.CloseCurseur: Exit Sub
  cprojetsAdd.CloseCurseur
  

  If Not cProjets Is Nothing Then cProjets.CloseCurseur
  Set cProjets = New BDCurseur

  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  ' On lit le max, faute de pouvoir obtenir le serial r�el�
  Dim iS�rie As Long

  iS�rie = BDCurseurExpress("select max(prj_num) from projet")
  sFinalSQL = "select * from projet where prj_num=" & iS�rie
  cProjets.OpenCurseur sFinalSQL
  cProjets.MoveFirst
  
  
  ActiveFormulaire False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  bdS�l.Emp�cheMouvements
  
  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub



Private Sub ValidateEdit()
  Dim sType As String
  Assert iMode = meChange
  Assert Not cProjets Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cProjets.Edit
  If Not bPr�pareEditAdd(cProjets, colColonnes, colChamps) Then Exit Sub

  ActiveFormulaire False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  AjusteMouvements
  
  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
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
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  
  ActiveFormulaire False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  btnEtapes.Enabled = True
  ListView.Enabled = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cProjets Is Nothing Then
    If Not (cProjets.EOF And cProjets.BOF) Then
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
  btnEtapes.Enabled = False
  ListView.ListItems.Clear
  ListView.Enabled = False
  colChamps("prj_nom").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cProjets Is Nothing
  
  If cProjets.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "prj_num", False
  ActiveChamp "timestamp", False
  btnEtapes.Enabled = False
  ListView.Enabled = False
  
  colChamps("prj_nom").SetFocus
  AutoSelect colChamps("prj_nom"), True
  
  iMode = meChange
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
  bdS�l.TabStop = False
   ActiveChamp "prj_num", False
   ActiveChamp "timestamp", False
   btnEtapes.Enabled = False
   ListView.ListItems.Clear
   ListView.Enabled = False
   
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
  colChamps("prj_nom").SetFocus
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cProjets Is Nothing

  If cProjets.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNb As Integer

  iNb = BDCurseurExpress("select count(*) from etape where etp_projet=" & cProjets!prj_num)
  If iNb > 0 Then
  MsgBox "Vous ne pouvez pas supprimer ce projet, il y " & iNb & " �tapes rattach�s." & vbCrLf & vbCrLf & "Supprimez les �tapes avant de supprimer le projet.", vbExclamation, App.Title
  frmEtape.AfficheEtapes colChamps("prj_num")
  If Not bShiftPressed Then Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cProjets.Delete
  If Err Then
    AfficheErreurODBC "�chec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cProjets.MoveNext
  
  ' On place un enregistrement dans synchrodelete
  Dim cSD As New BDCurseur
  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
  cSD.AddNew
  cSD!sd_table = sTable
  cSD!sd_timestamp = BDTime
  cSD!sd_wherepart = "prj_num=" & sFormToSQL(colChamps("prj_num"), BDTypeINTEGER)
  cSD.Update
  cSD.CloseCurseur
  
  If cProjets.EOF Then
    cProjets.MovePrevious
    If cProjets.BOF Then
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
  Assert Not cProjets Is Nothing

  bdS�l.ButtonEnabled("First") = cProjets.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cProjets.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cProjets.EOF
  bdS�l.ButtonEnabled("Last") = Not cProjets.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cProjets.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cProjets.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cProjets.MoveNext
  AjusteMouvements
  If cProjets.EOF Then cProjets.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cProjets.MovePrevious
  AjusteMouvements
  If cProjets.BOF Then cProjets.MoveFirst
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


Private Sub btnEtapes_Click()
  frmEtape.AfficheEtapes colChamps("prj_num")
End Sub



' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  bdS�l.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
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
  
  ' Formulaire en mode initial
  Set cProjets = Nothing
  ActiveFormulaire False
  With bdS�l
    .ActiveMouvements False
    .ActiveValidation False
    .ButtonEnabled("Query") = True
    .ButtonEnabled("Add") = True
    .SetFocus
  End With
  
  btnEtapes.Enabled = True
  ListView.Enabled = False
  
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
  If Not cProjets Is Nothing Then cProjets.CloseCurseur
  MDIProjets.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
  ListView.Refresh
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cProjets Is Nothing Then
    EffaceFormulaire
  ElseIf cProjets.BOF And cProjets.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cProjets.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cProjets.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdS�l.NumRec = cProjets.AbsolutePosition
      
    ListView.ListItems.Clear
    ' Mise � jour en arri�re plan
    ActiveTimer mtRapide
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cProjets.bEffac� = True
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



Private Sub ActiveFormulaire(bEnabled As Boolean)
  Dim c As Control
  For Each c In colChamps
    BDActiveChamp c, bEnabled
  Next
End Sub



Private Sub ActiveChamp(ByVal sChamp As String, bEnabled As Boolean)
  BDActiveChamp colChamps(sChamp), bEnabled
End Sub

Private Sub ListView_DblClick()
  If Not ListView.SelectedItem Is Nothing Then frmEtape.AfficheEtapes colChamps("prj_num"), ListView.SelectedItem.Text
End Sub

Private Sub Timer1_Timer()
  ActiveTimer mtStop
  If colChamps("prj_num") = "" Then
    Exit Sub
  End If
  
  ListView.ListItems.Clear
  Dim BDE As New BDCurseur
  BDE.OpenCurseur "select * from etape where etp_projet=" & sFormToSQL(colChamps("prj_num"), BDTypeINTEGER)
  While Not BDE.EOF
   Dim x As ListItem
   Set x = ListView.ListItems.Add
    x.Text = BDE!etp_num
    x.SubItems(1) = BDE!etp_nom
    x.SubItems(2) = BDE!etp_resp
    x.SubItems(3) = BDE!etp_duree
    If BDE!etp_datevalid <> "" Then
     x.SubItems(4) = "oui, le " & BDE!etp_datevalid
    Else
      x.SubItems(4) = "non"
    End If
  BDE.MoveNext
  Wend
 BDE.CloseCurseur

 AjusteListView Me, ListView
End Sub

Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop: Timer1.Enabled = False
    Case mtLent: Timer1.Interval = 1000: Timer1.Enabled = True
    Case mtRapide: Timer1.Interval = 250: Timer1.Enabled = True
  End Select
End Sub

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub bdS�l_GotFocus()
  SetStatus
End Sub

' Acc�s au Web

Public Sub Fen�treWeb()
  Dim chaine As String
  If colChamps("prj_num") <> "" Then
     chaine = "?btnAction=Details&txtNumPro=" & colChamps("prj_num")
  Else
    chaine = ""
  End If
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/projet" & chaine
End Sub


'=================================================================================
' Copie des donn�es dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours�"
  BDCopieS�lection cProjets, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression des donn�es

Public Sub ImprimeOld()
  If cProjets Is Nothing Then
    MsgBox "Effectuez une s�lection avant d'imprimer les donn�es.", vbExclamation, App.Title
    Exit Sub
  End If
  
  EffaceFormulaire
  SetMessage "Impression en cours�"
  
  Dim sData As String
  Dim t As Control, bFirst As Boolean
  
  Screen.MousePointer = vbHourglass
  cProjets.MoveFirst
  bFirst = True
  Do Until cProjets.EOF
    SynchroniseFormulaire   ' Affiche le premier enregistrement
    If bFirst Then
      Printer.Orientation = vbPRORPortrait
    Else
      Printer.NewPage
    End If
    Imprime1FME
    bFirst = False
    cProjets.MoveNext
  Loop
  
  cProjets.MoveFirst
  Screen.MousePointer = vbDefault
  EffaceFormulaire
  Printer.EndDoc
  
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


Private Sub Imprime1FME()
  Printer.Font = "Courier New"
  Printer.FontSize = 10
  
  Printer.FontBold = True
  Printer.Print "FICHE MODALIT� D'ENVOI"
  Printer.FontBold = False
  
  Printer.Print
  Printer.Print "N�      "; cProjets!prj_num
  Printer.Print "Titre   "; cProjets!prj_nom
  Printer.Print "Comment "; NV(cProjets!prj_comment)
  
  Printer.Print
  Printer.FontUnderline = True
  Printer.Print "Destinataires"
  Printer.FontUnderline = False
  
  Dim cDest As New BDCurseur
  cDest.OpenCurseur "select * from projet"
  While Not cDest.EOF
    Printer.Print
    Printer.FontBold = True
    Printer.Print cDest!fmd_numcr & ": " & cDest!cr_nom
    If Not IsNull(cDest!cr_rue) Then Printer.Print NV(cDest!cr_rue)
    If Not IsNull(cDest!cr_loc) Then Printer.Print NV(cDest!cr_loc)
    If Not IsNull(cDest!cr_cpost) Or Not IsNull(cDest!cr_bdist) Then Printer.Print NV(cDest!cr_cpost); " "; NV(cDest!cr_bdist)
    If Not IsNull(cDest!cr_interloc) Then Printer.Print "Interlocuteur: "; NV(cDest!cr_interloc)
    Printer.Print
    Printer.FontBold = False
    Printer.Print "Fr�quence "; cDest!fmd_frequence
    Printer.Print "Comment   "; NV(cDest!fmd_comment)
    
    Dim cDoc As New BDCurseur
    cDoc.OpenCurseur "select fmo_classe,fmo_nbex,fmo_options,fmo_comment from fmedoc where fmo_numfme=" & cDest!fmd_numfme & " and fmo_numcr=" & cDest!fmd_numcr
    While Not cDoc.EOF
      Printer.Print "   Classe  "; cDoc!fmo_classe
      Printer.Print "   NbEx    "; cDoc!fmo_nbex
      Printer.Print "   Options "; NV(cDoc!fmo_options)
      Printer.Print "   Comment "; NV(cDoc!fmo_comment)
      
      cDoc.MoveNext
    Wend
    cDoc.CloseCurseur

    cDest.MoveNext
  Wend
  cDest.CloseCurseur
End Sub



'=================================================================================
' Impression

Public Sub Imprime()
  BDEtat sFinalSQL, drProjet, True
End Sub

Public Sub Aper�u()
  BDEtat sFinalSQL, drProjet, False
End Sub

