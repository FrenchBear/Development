VERSION 5.00
Begin VB.Form frmTable 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des tables"
   ClientHeight    =   3015
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
   Icon            =   "frmTables.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   201
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   561
   Tag             =   "Données"
   Begin VB.CommandButton btnListeSys 
      Caption         =   "…"
      Height          =   315
      Left            =   4500
      TabIndex        =   10
      ToolTipText     =   "Liste les lettres des systèmes utilisables"
      Top             =   1920
      Width           =   375
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*dt_systemes"
      Height          =   315
      Index           =   11
      Left            =   1740
      TabIndex        =   9
      Top             =   1920
      Width           =   2715
   End
   Begin VB.CommandButton btnTablesEnTrop 
      Caption         =   "Tables en trop"
      Height          =   435
      Left            =   6360
      TabIndex        =   17
      Top             =   1860
      Width           =   1995
   End
   Begin VB.CommandButton btnTablesSansDoc 
      Caption         =   "Tables non documentées"
      Height          =   615
      Left            =   6360
      TabIndex        =   16
      Top             =   2340
      Width           =   1995
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "dt_idmodif"
      Height          =   315
      Index           =   12
      Left            =   1740
      TabIndex        =   12
      Top             =   2280
      Width           =   3750
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "dt_nivsynchro"
      Height          =   315
      Index           =   0
      Left            =   1740
      TabIndex        =   7
      Top             =   1560
      Width           =   495
   End
   Begin DocBD.BDCombo bdcJeu 
      Height          =   330
      Left            =   1740
      TabIndex        =   1
      Top             =   480
      Width           =   6615
      _ExtentX        =   11668
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
      DataField       =   "dt_jeu"
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*dt_table"
      Height          =   315
      Index           =   1
      Left            =   1740
      TabIndex        =   3
      Top             =   840
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   1740
      TabIndex        =   14
      Top             =   2640
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*dt_titre"
      Height          =   315
      Index           =   2
      Left            =   1740
      TabIndex        =   5
      Top             =   1200
      Width           =   6615
   End
   Begin DocBD.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   15
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
      Caption         =   "Systèmes :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   8
      Top             =   1980
      Width           =   1050
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   11
      Top             =   2340
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Niveau synchro :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   6
      Top             =   1620
      Width           =   1575
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Table :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   645
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   13
      Top             =   2700
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Titre :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   555
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
Attribute VB_Name = "frmTable"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTable
' Feuille de gestion des tables
' 12/02/1998 PV
' 16/07/1998 PV idmodif
' 15/08/1998 PV BDActiveChamp
'  3/09/1998 PV Tables en trop / Tables non définies
'  1/04/1999 PV Impressions
' 18/05/1999 PV BDActiveMaxLength


Option Explicit

Private cTab As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private sFinalSQL As String               ' Requête SQL courante

Private Const sTable = "doctables"


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
  
  Dim cTabQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from doctables where " & sWP & " order by dt_jeu,dt_table"
  cTabQuery.OpenCurseur sSQL
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
  If Not cTab Is Nothing Then cTab.CloseCurseur
  Set cTab = cTabQuery
  sFinalSQL = sSQL
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cTab.EOF And cTab.BOF) Then
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
  Dim i As Integer
  
  bOkValeurs = False
  
  ' On vérifie que la table existe
  Dim iNb As Integer
  iNb = BDCurseurExpress("select count(*) from systables where tabname=" & sFormToSQL(colChamps("dt_table"), BDTypeCHAR))
  If iNb = 0 Then
    MsgBox "Table inexistante dans la base de données.", vbExclamation, App.Title
    colChamps("dt_table").SetFocus
    Exit Function
  End If
  
  
  ' On vérifie que la liste des systèmes est valide (lettres ou + ou - ou vide)
  If colChamps("dt_systemes") <> "" And colChamps("dt_systemes") <> "*" Then
    If colChamps("dt_systemes") <> UCase(colChamps("dt_systemes")) Then colChamps("dt_systemes") = UCase(colChamps("dt_systemes"))
    
    Dim cSys As String
    For i = 1 To Len(colChamps("dt_systemes"))
      cSys = Mid(colChamps("dt_systemes"), i, 1)
      If sNomSystème(cSys) = "" Then
        MsgBox "Système '" & cSys & "' inconnu !", vbExclamation, App.Title
        txtChamp(11).SetFocus
        Exit Function
      End If
      If InStr(Left(colChamps("dt_systemes"), i - 1), cSys) <> 0 Then
        MsgBox "Système '" & cSys & "' spécifié en double !", vbExclamation, App.Title
        Exit Function
      End If
    Next
  End If

  
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cTabAdd As New BDCurseur
  cTabAdd.OpenCurseur "select * from doctables where dt_table='inexistant'"
  cTabAdd.AddNew
  cTabAdd!dt_idmodif = sBDIdModif
  If Not bPrépareEditAdd(cTabAdd, colColonnes, colChamps) Then cTabAdd.CloseCurseur: Exit Sub
  cTabAdd.CloseCurseur
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cTab Is Nothing Then cTab.CloseCurseur
  Set cTab = New BDCurseur
  sFinalSQL = "select * from doctables where dt_table=" & sFormToSQL(colChamps("dt_table"), BDTypeCHAR)
  cTab.OpenCurseur sFinalSQL
  cTab.MoveFirst
  
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  EmpêcheMouvements
  
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cTab Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cTab.Edit
  cTab!dt_idmodif = sBDIdModif
  If Not bPrépareEditAdd(cTab, colColonnes, colChamps) Then Exit Sub
  
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
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
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cTab Is Nothing Then
    If Not (cTab.EOF And cTab.BOF) Then
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
  BDActiveMaxLength colChamps, colColonnes, False
  ActiveFormulaire True
  
  colChamps("dt_jeu").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cTab Is Nothing
  
  If cTab.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveFormulaire True
  ActiveChamp "dt_table", False
  ActiveChamp "dt_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("dt_jeu").SetFocus
  AutoSelect colChamps("dt_jeu"), True
  bdSél.TabStop = False
  
  iMode = meChange
  SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveFormulaire True
  ActiveChamp "dt_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("dt_jeu").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cTab Is Nothing

  If cTab.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cTab.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  ' synchrodelete: via trigger
  
  cTab.MoveNext
  If cTab.EOF Then
    cTab.MovePrevious
    If cTab.BOF Then
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
  Assert Not cTab Is Nothing

  bdSél.ButtonEnabled("First") = cTab.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cTab.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cTab.EOF
  bdSél.ButtonEnabled("Last") = Not cTab.EOF
End Sub

Private Sub EmpêcheMouvements()
  bdSél.ButtonEnabled("First") = False
  bdSél.ButtonEnabled("Previous") = False
  bdSél.ButtonEnabled("Next") = False
  bdSél.ButtonEnabled("Last") = False
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cTab.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cTab.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cTab.MoveNext
  AjusteMouvements
  If cTab.EOF Then cTab.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cTab.MovePrevious
  AjusteMouvements
  If cTab.BOF Then cTab.MoveFirst
  SynchroniseFormulaire
End Sub


Private Sub bdcJeu_LostFocus()
  bdcJeu.Synchronise
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


Private Sub btnListeSys_Click()
  Dim sMsg As String
  Dim s As Système
  For Each s In colSystème
    sMsg = sMsg & vbCrLf & s.sys_systeme & ": " & s.sys_nom
    If s.sys_description <> "" Then sMsg = sMsg & " (" & s.sys_description & ")"
  Next
  MsgBox Mid(sMsg, 3), vbInformation, App.Title
End Sub


Private Sub btnTablesEnTrop_Click()
  Dim ctet As New BDCurseur
  Dim sMsg As String
  
  ctet.OpenCurseur "select dt_table from doctables where dt_table not in (select tabname from systables where tabid>=100 and tabtype in ('T','V','P','S')) order by dt_table"
  While Not ctet.EOF
    sMsg = sMsg & ctet!dt_table & ", "
    ctet.MoveNext
  Wend
  ctet.CloseCurseur
  
  If sMsg = "" Then
    MsgBox "Il n'y a pas de tables en trop.", vbInformation, App.Title
  Else
    MsgBox "Tables en trop:" & vbCrLf & vbCrLf & sMsg, vbInformation, App.Title
  End If
End Sub


Private Sub btnTablesSansDoc_Click()
  Dim ctnd As New BDCurseur
  Dim sMsgT As String, sMsgX As String
  Dim bTrouvé As Boolean
  
  ctnd.OpenCurseur "select tabname,tabtype from systables where tabid>=100 and tabname not matches 'sys*' and tabtype in ('T','V','P','S') and tabname not in (select dt_table from doctables) and tabname not matches 'a??_*' order by tabname"
  bTrouvé = False
  While Not ctnd.EOF
    If ctnd!tabtype = "T" Then
      sMsgT = sMsgT & ctnd!tabname & ", "
    Else
      sMsgX = sMsgX & ctnd!tabname & ", "
    End If
    bTrouvé = True
    ctnd.MoveNext
  Wend
  ctnd.CloseCurseur
  
  sMsgT = "Tables non documentées: " & sMsgT
  sMsgX = "Vues non documentées: " & sMsgX
  
  If Not bTrouvé Then
    MsgBox "Toutes les tables sont déclarées.", vbInformation, App.Title
  Else
    MsgBox sMsgT & vbCrLf & vbCrLf & sMsgX, vbInformation, App.Title
  End If
End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  bdSél.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
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

  
  ' Chargement des combos !
  Dim cJeux As New BDCurseur
  cJeux.OpenCurseur "select dj_jeu,dj_titre from docjeux order by dj_jeu"
  While Not cJeux.EOF
    bdcJeu.AddItem cJeux!dj_jeu, cJeux!dj_titre
    cJeux.MoveNext
  Wend
  cJeux.CloseCurseur
  
  
  ' Formulaire en mode initial
  Set cTab = Nothing
  ActiveFormulaire False
  With bdSél
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
    Cancel = True
    Exit Sub
  End If

  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cTab Is Nothing Then cTab.CloseCurseur
  MDIDocBD.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cTab Is Nothing Then
    EffaceFormulaire
  ElseIf cTab.BOF And cTab.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cTab.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cTab.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    bdSél.NumRec = cTab.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cTab.bEffacé = True
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
  bdSél.NumRec = ""
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



'=================================================================================
' Ligne d'aide

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub bdSél_GotFocus()
  SetStatus
End Sub

Private Sub bdcJeu_GotFocus()
  SetStatus bdcJeu.Tag
End Sub


'=================================================================================
' Accès au Web

Public Sub FenêtreWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=doctables"
End Sub


'=================================================================================
' Copie des données dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours…"
  BDCopieSélection cTab, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  BDEtat sFinalSQL, drTable, True
End Sub

Public Sub Aperçu()
  BDEtat sFinalSQL, drTable, False
End Sub

