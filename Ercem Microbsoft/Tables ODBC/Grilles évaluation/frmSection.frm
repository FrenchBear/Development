VERSION 5.00
Begin VB.Form frmSection 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des titres de section"
   ClientHeight    =   3420
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   9090
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmSection.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   228
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   606
   Tag             =   "Donn�es"
   Begin VB.TextBox txtChamp 
      DataField       =   "ts_titre"
      Height          =   315
      Index           =   1
      Left            =   1560
      MaxLength       =   60
      TabIndex        =   11
      Top             =   2280
      Width           =   7395
   End
   Begin GrillesEvaluation.BDS�lecteur bdS�l 
      Height          =   435
      Left            =   0
      TabIndex        =   15
      Top             =   0
      Width           =   9075
      _ExtentX        =   16007
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
   Begin VB.TextBox txtChamp 
      DataField       =   "ts_sousrub"
      Height          =   315
      Index           =   2
      Left            =   1560
      MaxLength       =   1
      TabIndex        =   9
      Top             =   1920
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ts_rubrique"
      Height          =   315
      Index           =   8
      Left            =   1560
      TabIndex        =   7
      Top             =   1560
      Width           =   795
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   960
      Top             =   540
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ts_secteur"
      Height          =   315
      Index           =   6
      Left            =   1560
      TabIndex        =   5
      Top             =   1200
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*^ts_theme"
      Height          =   315
      Index           =   4
      Left            =   1560
      TabIndex        =   3
      Top             =   840
      Width           =   315
   End
   Begin VB.Frame frlTra�abilit� 
      Caption         =   "Tra�abilit�"
      Height          =   675
      Left            =   0
      TabIndex        =   14
      Top             =   2700
      Width           =   8955
      Begin VB.TextBox txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   22
         Left            =   1560
         TabIndex        =   13
         Top             =   240
         Width           =   2055
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   12
         Top             =   300
         Width           =   1155
      End
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ts_serie"
      Height          =   315
      Index           =   0
      Left            =   1560
      TabIndex        =   1
      Top             =   480
      Width           =   795
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Titre :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   10
      Top             =   2340
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Sous-rubrique :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   8
      Top             =   1980
      Width           =   1470
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Rubrique :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   6
      Top             =   1620
      Width           =   975
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Secteur :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   855
   End
   Begin VB.Label lblChamp 
      Caption         =   "Th�me"
      Height          =   195
      Index           =   7
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Serial :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   660
   End
End
Attribute VB_Name = "frmSection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmSection
' Feuille de gestion des titres de section
' 26/11/1999 NC


Option Explicit

Private cSect As BDCurseur                ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire

Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private sQuery As String                  ' Query de la s�lection en cours

Private Const sTable = "titsec"


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
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cSectQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select *   from titsec where " & sWP


  cSectQuery.OpenCurseur sQuery
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
  If Not cSect Is Nothing Then cSect.CloseCurseur
  Set cSect = cSectQuery
  sFinalWP = sWP
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cSect.EOF And cSect.BOF) Then
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

  ' G�n�ration du n� de s�rie
  
  Dim cSectAdd As New BDCurseur
  cSectAdd.OpenCurseur "select * from titsec where ts_serie=0"
  cSectAdd.AddNew
  
  Dim cserie As New BDCurseur
  cserie.OpenCurseur "select max (ts_serie) from titsec"
  colChamps("ts_serie") = cserie.Fields(0) + 1
  cSectAdd!ts_serie = cserie.Fields(0) + 1
  cserie.CloseCurseur
  

' Seuls les champs actifs sont mis � jour
  ActiveChamp "ts_serie", True
  
  If Not bPr�pareEditAdd(cSectAdd, colColonnes, colChamps) Then
    cSectAdd.CloseCurseur
    ActiveChamp "ts_serie", False
    Exit Sub
  End If
  cSectAdd.CloseCurseur
  
  
  ' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cSect Is Nothing Then cSect.CloseCurseur
  Set cSect = New BDCurseur
  
  sQuery = "select * from titsec where ts_serie=" & sFormToSQL(colChamps("ts_serie"), BDTypeINTEGER) & " "
  cSect.OpenCurseur sQuery
  cSect.MoveFirst
  
  BDActiveFormulaire colChamps, False
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
  Assert iMode = meChange
  Assert Not cSect Is Nothing
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  cSect.Edit
  If Not bPr�pareEditAdd(cSect, colColonnes, colChamps) Then Exit Sub

  BDActiveFormulaire colChamps, False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
  
End Sub


Private Sub ActionValidate()
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
 
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub

Private Sub ActionCancel()
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  BDActiveFormulaire colChamps, False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cSect Is Nothing Then
    If Not (cSect.EOF And cSect.BOF) Then
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
  
  colChamps("ts_serie").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cSect Is Nothing
  
  If cSect.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If

  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True

  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "ts_serie", False
  ActiveChamp "timestamp", False
  
  colChamps("ts_theme").SetFocus
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
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "ts_serie", False
  ActiveChamp "timestamp", False
      
  colChamps("ts_theme").SetFocus
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub

Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cSect Is Nothing
  
  If cSect.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est d�finitive." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cSect.Delete
  If Err Then
    AfficheErreurODBC "�chec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cSect.MoveNext
  If cSect.EOF Then
    cSect.MovePrevious
    If cSect.BOF Then
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
  Assert Not cSect Is Nothing

  bdS�l.ButtonEnabled("First") = cSect.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cSect.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cSect.EOF
  bdS�l.ButtonEnabled("Last") = Not cSect.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cSect.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cSect.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cSect.MoveNext
  AjusteMouvements
  If cSect.EOF Then cSect.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cSect.MovePrevious
  AjusteMouvements
  If cSect.BOF Then cSect.MoveFirst
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
  If KeyCode = 13 Then KeyCode = 0
End Sub

Private Sub Form_Keypress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
  If KeyAscii = 13 Then KeyAscii = 0
End Sub

' Filtrage des Entr�e intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
End Sub

Private Sub txtChamp_KeyPress(Index As Integer, KeyAscii As Integer)
  If KeyAscii = 13 Then KeyAscii = 0
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
  Set cSect = Nothing
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
  If Not cSect Is Nothing Then cSect.CloseCurseur
  MDIGrilles.AjusteMenus -1
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
  ActiveTimer mtStop
    If cSect Is Nothing Then
    EffaceFormulaire
  ElseIf cSect.BOF And cSect.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cSect.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cSect.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    bdS�l.NumRec = cSect.AbsolutePosition
    
    ActiveTimer mtRapide      ' Mise � jour en arri�re plan

  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cSect.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop

End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  
  bdS�l.NumRec = ""
End Sub


' Activation du timer de mise � jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop: timSatellites.Enabled = False
    Case mtLent: timSatellites.Interval = 1000: timSatellites.Enabled = True
    Case mtRapide: timSatellites.Interval = 250: timSatellites.Enabled = True
  End Select
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
  BDCopieS�lection cSect, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub

