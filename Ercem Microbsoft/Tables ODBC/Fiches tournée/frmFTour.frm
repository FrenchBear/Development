VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "MSWLESS.OCX"
Begin VB.Form frmFTour 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Fiches tourn�e (t�te)"
   ClientHeight    =   2655
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8880
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmFTour.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   177
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   592
   Tag             =   "Donn�es"
   Begin VB.CommandButton btnVide 
      Caption         =   "Fiches vides"
      Height          =   375
      Left            =   5820
      TabIndex        =   16
      Top             =   2220
      Width           =   1455
   End
   Begin VB.CommandButton btnD�tail 
      Caption         =   "D�tails�"
      Height          =   375
      Left            =   7500
      TabIndex        =   15
      Top             =   2220
      Width           =   1335
   End
   Begin FichesTourn�e.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   14
      Top             =   0
      Width           =   8880
      _ExtentX        =   15663
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
      DataField       =   "^ft_etat"
      Height          =   315
      Index           =   2
      Left            =   3720
      TabIndex        =   3
      Top             =   480
      Width           =   315
      _ExtentX        =   556
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Etat :"
      Height          =   210
      Index           =   2
      Left            =   3060
      TabIndex        =   2
      Top             =   540
      Width           =   525
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*ft_region"
      Height          =   315
      Index           =   3
      Left            =   1560
      TabIndex        =   5
      Top             =   840
      Width           =   7275
      _ExtentX        =   12832
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*ft_tournee"
      Height          =   315
      Index           =   1
      Left            =   1560
      TabIndex        =   7
      Top             =   1200
      Width           =   7275
      _ExtentX        =   12832
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   1560
      TabIndex        =   13
      Top             =   2280
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "ft_idmodif"
      Height          =   315
      Index           =   12
      Left            =   1560
      TabIndex        =   11
      Top             =   1920
      Width           =   3750
      _ExtentX        =   6615
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "ft_comment"
      Height          =   315
      Index           =   8
      Left            =   1560
      TabIndex        =   9
      Top             =   1560
      Width           =   7275
      _ExtentX        =   12832
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*^ft_fiche"
      Height          =   315
      Index           =   0
      Left            =   1560
      TabIndex        =   1
      Top             =   480
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483633
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   12
      Top             =   2340
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   10
      Top             =   1980
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Commentaire :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   8
      Top             =   1620
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Tourn�e :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   6
      Top             =   1260
      Width           =   915
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "R�gion :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   4
      Top             =   900
      Width           =   780
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Fiche :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   615
   End
End
Attribute VB_Name = "frmFTour"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmFTour
' Gestion des fiches tourn�e
' 28/07/1998 PV
'  9/03/2000 PV Impression
'  4/08/2000 PV Contr�le de s�curit� de rattachement d'etb avant la suppression
' 16/08/2001 PV Chien de garde


Option Explicit

Private cFT As BDCurseur                  ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition
Private sFinalWP As String                ' Where-part de la requ�te SQL courante


Const sTable As String = "ftour"


'=================================================================================
' Acc�s direct

Public Sub AfficheFTour(ByVal sFiche As String)
  Load Me
  DoEvents
  EffaceFormulaire
  ActiveFormulaire True
  iMode = meQuery
  colChamps("ft_fiche") = sFiche
  ValidateQuery
End Sub


'=================================================================================

Private Sub btnVide_Click()
  If iMode <> meQuery Then Exit Sub
  Dim sWP As String
  sWP = "ft_fiche in (select ft_fiche from ftour,outer dettour where dt_fiche=ft_fiche group by 1 having count(dt_fiche)=0)"
  ValidateQuery sWP
End Sub


'=================================================================================
' Actions de validation

Private Sub ValidateQuery(Optional sWP As String = "")
  Assert iMode = meQuery
  
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
  
  Dim cFTQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from ftour where (" & sWP & ") order by ft_fiche"
  cFTQuery.OpenCurseur sSQL
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
  If Not cFT Is Nothing Then cFT.CloseCurseur
  Set cFT = cFTQuery
  sFinalWP = sWP
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cFT.EOF And cFT.BOF) Then
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
  Dim i As Integer
  
  bOkValeurs = False
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Dim sType As String
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cFTAdd As New BDCurseur
  cFTAdd.OpenCurseur "select * from ftour where ft_fiche='@'"
  cFTAdd.AddNew
  cFTAdd!ft_idmodif = sBDIdModif
  If Not bPr�pareEditAdd(cFTAdd, colColonnes, colChamps) Then cFTAdd.CloseCurseur: Exit Sub
  cFTAdd.CloseCurseur
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cFT Is Nothing Then cFT.CloseCurseur
  Set cFT = New BDCurseur
  sFinalWP = "ft_fiche=" & sFormToSQL(colChamps("ft_fiche"), BDTypeCHAR)
  cFT.OpenCurseur "select * from ftour where " & sFinalWP
  cFT.MoveFirst
  
  
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
  Dim sType As String
  Assert iMode = meChange
  Assert Not cFT Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cFT.Edit
  cFT!ft_idmodif = sBDIdModif
  If Not bPr�pareEditAdd(cFT, colColonnes, colChamps) Then Exit Sub

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
  If Not cFT Is Nothing Then
    If Not (cFT.EOF And cFT.BOF) Then
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
  
    ' Valeurs par d�faut
  colChamps("ft_etat") = "="
  
  colChamps("ft_fiche").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cFT Is Nothing
  
  If cFT.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  
  ActiveChamp "timestamp", False
  ActiveChamp "ft_fiche", False
  ActiveChamp "ft_idmodif", False
  
  colChamps("ft_region").SetFocus
  AutoSelect colChamps("ft_region"), True
  bdS�l.TabStop = False
  
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
  BDActiveMaxLength colChamps, colColonnes, True
  
  ActiveChamp "ft_etat", False
  ActiveChamp "timestamp", False
  ActiveChamp "ft_idmodif", False

  colChamps("ft_fiche").SetFocus
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub

Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cFT Is Nothing

  If cFT.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If

  If bShiftPressed Then
    ActionD�truit             ' D�truit l'enregistrement
  Else
    ActionSupprime            ' Marque l'enregistrement supprim� (�tat S)
  End If
End Sub


Public Sub ActionSupprime()   ' Marque l'enregistrement supprim� (�tat S)
  If colChamps("ft_etat") <> "" Then
    MsgBox "D�j� supprim� (�tat S)", vbExclamation, App.Title
    Exit Sub
  End If

  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, vous allez basculer l'enregistrement � l'�tat S (supprim�)." & vbCrLf & "Vous pourrez ult�rieurement restaurer l'enregistrement � l'�tat normal en choisissant le menu Commandes, R�cup�re un enregistrement supprim�." & vbCrLf & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub

  cFT.Edit
  cFT!ft_etat = "S"
  cFT!TimeStamp = BDTime
  cFT.Update
  
  SynchroniseFormulaire
End Sub


Public Sub ActionD�truit()
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
'  If colChamps("ft_etat") <> "S" Then
'    MsgBox "Vous ne pouvez pas d�truire un enregistrement sans l'avoir au pr�alable supprim� (�tat S)", vbExclamation, App.Title
'    If Not bShiftPressed Then Exit Sub
'  End If
  
  On Error Resume Next
  cFT.Delete
  If Err Then
    AfficheErreurODBC "�chec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cFT.MoveNext
  If cFT.EOF Then
    cFT.MovePrevious
    If cFT.BOF Then
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



Public Sub R�cup�re()   ' R�cup�re un enregistrement supprim� (�tat S)
  If colChamps("ft_etat") <> "S" Then
    MsgBox "Vous ne pouvez r�cup�rer qu'un enregistrement supprim� (�tat S)", vbExclamation, App.Title
    Exit Sub
  End If

  cFT.Edit
  cFT!ft_etat = Null
  cFT!TimeStamp = BDTime
  cFT.Update
  
  SynchroniseFormulaire
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cFT Is Nothing

  bdS�l.ButtonEnabled("First") = cFT.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cFT.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cFT.EOF
  bdS�l.ButtonEnabled("Last") = Not cFT.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cFT.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cFT.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cFT.MoveNext
  AjusteMouvements
  If cFT.EOF Then cFT.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cFT.MovePrevious
  AjusteMouvements
  If cFT.BOF Then cFT.MoveFirst
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

Private Sub bdS�l_GotFocus()
  SetStatus
End Sub

Private Sub btnD�tail_Click()
  If colChamps("ft_fiche") <> "" Then
    frmDTour.AfficheDTour colChamps("ft_fiche")
  End If
End Sub

' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  Dim c As Control
  
  ResetChienDeGarde
  If KeyCode = vbKeyF5 Then   ' M�moire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set c = ActiveControl
          c = colM�moireFTour(ActiveControl.DataField)
          c.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each c In colChamps
        If Not c.Locked Then      ' On ne remplit pas les champs verrouill�s
          c = colM�moireFTour(c.DataField)
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
  Set cFT = Nothing
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
  sFinalWP = ""
  Exit Sub
  
Probl�me:
  Unload Me
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
  If Not cFT Is Nothing Then cFT.CloseCurseur
  MDIFTour.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cFT Is Nothing Then
    EffaceFormulaire
  ElseIf cFT.BOF And cFT.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cFT.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cFT.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdS�l.NumRec = cFT.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cFT.bEffac� = True
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


'=================================================================================

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
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
  BDCopieS�lection cFT, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  DoEtat True
End Sub

Public Sub Aper�u()
  DoEtat False
End Sub


Private Sub DoEtat(ByVal bImpression As Boolean)
  Dim iChoix As Integer
  iChoix = frmMessageChoix.ChoixEtat("Liste des fiches", "Fiches tourn�e compl�tes", "Extrait mensuel")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
End Sub


Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String
  
  Select Case iChoix
    Case 1:
      'sSQL = "select * from ftour where " & sFinalWP
      sSQL = "select * from ftour where (" & sFinalWP & ") order by ft_fiche"
      On Error Resume Next
      BDEtat sSQL, drFTour, bImpression
      On Error GoTo 0
      
    Case 2:
      DoFormateFichesTourn�e 0, sFinalWP, bImpression, Me, 2
  
    Case 3:
      Dim sMois As String
      sMois = InputBox("Mois de l'extrait (1-12) ?", App.Title)
      If sMois = "" Or Not IsNumeric(sMois) Then Exit Sub
      Dim iMois As Integer
      iMois = Val(sMois)
      If iMois < 1 Or iMois > 12 Then
        MsgBox "Mois invalide.", vbExclamation, App.Title
        Exit Sub
      End If
      DoFormateFichesTourn�e iMois, sFinalWP, bImpression, Me, 4 + iMois
    
    Case Is >= 4:   ' CallBack sans poser la question du mois
      DoFormateFichesTourn�e iChoix - 4, sFinalWP, bImpression, Me, iChoix
  End Select
End Sub


' Callback de l'aper�u avant impression
Public Sub PrintReport(ByVal iChoix As Integer)
  Etat iChoix, True
End Sub


'=================================================================================
' M�morisation

Public Sub M�morise()
  EffaceCollection colM�moireFTour
  
  Dim t As Control
  For Each t In colChamps
    colM�moireFTour.Add (t), t.DataField
  Next
End Sub

