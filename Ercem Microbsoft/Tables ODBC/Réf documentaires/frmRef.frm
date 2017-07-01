VERSION 5.00
Begin VB.Form frmRefDoc 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des r�f�rences documentaires"
   ClientHeight    =   5955
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8895
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   397
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   593
   Tag             =   "Donn�es"
   Begin RefsDocs.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   405
      Left            =   0
      TabIndex        =   28
      Top             =   0
      Width           =   8895
      _ExtentX        =   15690
      _ExtentY        =   714
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
   Begin VB.TextBox txtChamp 
      DataField       =   "rd_objet3"
      Height          =   315
      Index           =   11
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   27
      Top             =   4440
      Width           =   5835
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "rd_objet2"
      Height          =   315
      Index           =   10
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   26
      Top             =   4080
      Width           =   5835
   End
   Begin VB.TextBox txtChamp 
      Height          =   315
      Index           =   14
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   25
      Top             =   5520
      Width           =   5295
   End
   Begin VB.TextBox txtChamp 
      Height          =   315
      Index           =   13
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   23
      Top             =   5160
      Width           =   5295
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "rd_info"
      Height          =   315
      Index           =   12
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   21
      Top             =   4800
      Width           =   5295
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_objet1"
      Height          =   315
      Index           =   9
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   19
      Top             =   3720
      Width           =   5835
   End
   Begin VB.TextBox txtChamp 
      Height          =   315
      Index           =   8
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   17
      Top             =   3360
      Width           =   3555
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_date"
      Height          =   315
      Index           =   7
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   15
      Top             =   3000
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_ie"
      Height          =   315
      Index           =   6
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   13
      Top             =   2640
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_serie"
      Height          =   315
      Index           =   5
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   11
      Top             =   2280
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_jouran"
      Height          =   315
      Index           =   4
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   9
      Top             =   1920
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_annee"
      Height          =   315
      Index           =   3
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   7
      Top             =   1560
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_dactylo"
      Height          =   315
      Index           =   2
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   5
      Top             =   1200
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*^rd_auteur"
      Height          =   315
      Index           =   1
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   4
      Top             =   840
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_direction"
      Height          =   315
      Index           =   0
      Left            =   3000
      TabIndex        =   1
      Top             =   480
      Width           =   795
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Arborescence du fichier:"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   24
      Top             =   5580
      Width           =   2265
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Nom du fichier:"
      Height          =   210
      Index           =   17
      Left            =   60
      TabIndex        =   22
      Top             =   5220
      Width           =   1410
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Nom du destinataire (doc Ext):"
      Height          =   210
      Index           =   16
      Left            =   60
      TabIndex        =   20
      Top             =   4860
      Width           =   2895
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Objet / R�sum� / Titre :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   18
      Top             =   3780
      Width           =   2220
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "R�f�rence g�n�r�e :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   16
      Top             =   3420
      Width           =   1935
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Date en clair du document :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   14
      Top             =   3060
      Width           =   2610
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Interne/Externe :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   12
      Top             =   2700
      Width           =   1650
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "N� de s�rie du document :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   10
      Top             =   2340
      Width           =   2490
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Jour de l'ann�e :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   8
      Top             =   1980
      Width           =   1575
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Ann�e :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   6
      Top             =   1620
      Width           =   735
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Saisi par :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   3
      Top             =   1260
      Width           =   945
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Auteur du document :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   2055
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Direction :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   960
   End
End
Attribute VB_Name = "frmRefDoc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmRefDoc
' Feuille de gestion des r�f�rences documentaires
' 14/06/1999 NC

Option Explicit

Private cRefDoc As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire
Private sFinalSQL As String               ' Requ�te SQL courante

Private Const sTable = "refdoc"


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
        MsgBox "Erreur dans la requ�te !" & vbCrLf & sMsg, vbExclamation, sNomApp
        t.SetFocus
        Exit Sub
      End If
      If sWP <> "" Then sWP = sWP & " and "
      sWP = sWP & "(" & sFinal & ")"
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, sNomApp)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cRefDocQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from refdoc where " & sWP & " order by rd_serie"
  cRefDocQuery.OpenCurseur sSQL
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "�chec lors de la requ�te" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, sNomApp
    ActiveFormulaire True
    SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture �ventuelle du curseur en cours
  If Not cRefDoc Is Nothing Then cRefDoc.CloseCurseur
  Set cRefDoc = cRefDocQuery
  sFinalSQL = sSQL
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cRefDoc.EOF And cRefDoc.BOF) Then
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
  
  Dim cRefDocAdd As New BDCurseur
  cRefDocAdd.OpenCurseur "select * from refdoc where rd_serie=0"
  cRefDocAdd.AddNew
  
  ' On r�cup�re un n� de r�f�rence
  Dim cserie As New BDCurseur
  cserie.OpenCurseur "select max(rd_serie) from refdoc"
  colChamps("rd_serie") = cserie.Item(0) + 1
  cRefDocAdd!rd_serie = cserie.Item(0) + 1
  cserie.CloseCurseur
  
  If Not bPr�pareEditAdd(cRefDocAdd, colColonnes, colChamps) Then
    cRefDocAdd.CloseCurseur
    colChamps("rd_serie") = ""
    Exit Sub
  End If
  cRefDocAdd.CloseCurseur
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cRefDoc Is Nothing Then cRefDoc.CloseCurseur
  Set cRefDoc = New BDCurseur
  sFinalSQL = "select * from refdoc where rd_serie=" & sFormToSQL(colChamps("rd_serie"), BDTypeINTEGER)
  cRefDoc.OpenCurseur sFinalSQL
  cRefDoc.MoveFirst
  
  ActiveFormulaire False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  Emp�cheMouvements

  SetMessage
  SetStatus
  bdS�l.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cRefDoc Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cRefDoc.Edit
  If Not bPr�pareEditAdd(cRefDoc, colColonnes, colChamps) Then Exit Sub

  ActiveFormulaire False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
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
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cRefDoc Is Nothing Then
    If Not (cRefDoc.EOF And cRefDoc.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
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
  
  colChamps("rd_serie").SetFocus
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cRefDoc Is Nothing
  
  If cRefDoc.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "rd_serie", False
  ActiveChamp "timestamp", False
  
  colChamps("rd_objet1").SetFocus
  AutoSelect colChamps("rd_objet1"), True
  
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
  ActiveChamp "timestamp", False
  ActiveChamp "rd_serie", False
  
  colChamps("rd_objet1").SetFocus
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cRefDoc Is Nothing

  If cRefDoc.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, sNomApp)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cRefDoc.Delete
  If Err Then
    AfficheErreurODBC "�chec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cRefDoc.MoveNext
  If cRefDoc.EOF Then
    cRefDoc.MovePrevious
    If cRefDoc.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  bdS�l.ActiveMouvements iMode = meNavigate
  bdS�l.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cRefDoc Is Nothing

  bdS�l.ButtonEnabled("First") = cRefDoc.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cRefDoc.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cRefDoc.EOF
  bdS�l.ButtonEnabled("Last") = Not cRefDoc.EOF
End Sub

Private Sub Emp�cheMouvements()
  bdS�l.ButtonEnabled("First") = False
  bdS�l.ButtonEnabled("Previous") = False
  bdS�l.ButtonEnabled("Next") = False
  bdS�l.ButtonEnabled("Last") = False
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cRefDoc.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cRefDoc.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cRefDoc.MoveNext
  AjusteMouvements
  If cRefDoc.EOF Then cRefDoc.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cRefDoc.MovePrevious
  AjusteMouvements
  If cRefDoc.BOF Then cRefDoc.MoveFirst
  SynchroniseFormulaire
End Sub


Private Sub btnInfoNiveaux_Click()
  FileShellExecute hwnd, "http://www.silliker/microbsoft/serveur/codes.htm"
End Sub

'
'Private Sub btnEtbAttach�s_Click()
'  If IsNumeric(colChamps("rd_serie")) Then frmEtbAttach�s.AfficheEtbAttach�s CLng(colChamps("rd_serie"))
'End Sub


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


Private Sub BDSel_ButtonClick(ByVal Button As MSComctlLib.Button)

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

  
  ' Pas de chargement des combos !
  
  ' Formulaire en mode initial
  Set cRefDoc = Nothing
  ActiveFormulaire False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True

  iMode = meEmpty

  bdS�l.SetFocus

  SetMessage
  SetStatus
  sFinalSQL = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'op�ration en cours avant de fermer la fen�tre !", vbCritical, sNomApp
    Cancel = True
    Exit Sub
  End If

  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cRefDoc Is Nothing Then cRefDoc.CloseCurseur
  MDIREF.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub

'=================================================================================

Private Sub SynchroniseFormulaire()
  If cRefDoc Is Nothing Then
    EffaceFormulaire
  ElseIf cRefDoc.BOF And cRefDoc.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cRefDoc.Item(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cRefDoc.Item(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    bdS�l.NumRec = cRefDoc.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cRefDoc.bEffac� = True
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


Private Sub sbMessage_PanelClick(ByVal Panel As MSComctlLib.Panel)

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

'
''=================================================================================
'' Acc�s au Web
'
'Public Sub Fen�treWeb()
'  FileShellExecute hwnd, "http://www.silliker/cgi-bin/rechxxx?table=feu"
'End Sub
'

'=================================================================================
' Copie des donn�es dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours�"
  BDCopieS�lection cRefDoc, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub

'
''=================================================================================
'' Impression
'
'Public Sub Imprime()
'  BDEtat sFinalSQL, drFEU, True
'End Sub
'
'Public Sub Aper�u()
'  BDEtat sFinalSQL, drFEU, False
'End Sub
'
'
