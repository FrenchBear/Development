VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form frmSc�nario 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Sc�narios"
   ClientHeight    =   6225
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   9720
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmScenario.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   415
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   648
   Tag             =   "Donn�es"
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   4395
      Index           =   1
      Left            =   120
      TabIndex        =   28
      Top             =   1080
      Visible         =   0   'False
      Width           =   9075
      Begin VB.TextBox txtTitreSc�nario 
         DataField       =   "*sce_titre"
         Height          =   315
         Left            =   1920
         TabIndex        =   5
         Top             =   360
         Width           =   6540
      End
      Begin VB.TextBox txtTitre 
         BackColor       =   &H80000004&
         Height          =   315
         Left            =   1920
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   0
         Width           =   6540
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "sce_comment"
         Height          =   315
         Index           =   4
         Left            =   1260
         TabIndex        =   11
         Top             =   1080
         Width           =   7320
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "*sce_numgri"
         Height          =   315
         Index           =   1
         Left            =   1260
         TabIndex        =   1
         Top             =   0
         Width           =   615
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "*sce_scenario"
         Height          =   315
         Index           =   2
         Left            =   1260
         MaxLength       =   60
         MultiLine       =   -1  'True
         TabIndex        =   4
         Top             =   360
         Width           =   615
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "sce_options"
         Height          =   315
         Index           =   3
         Left            =   1260
         TabIndex        =   7
         Top             =   720
         Width           =   780
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "*sce_format"
         Height          =   315
         Index           =   9
         Left            =   3360
         TabIndex        =   9
         Top             =   720
         Width           =   840
      End
      Begin GrillesEvaluation.BDS�lecteurTableau bdS�lTab 
         Height          =   2040
         Left            =   0
         TabIndex        =   29
         TabStop         =   0   'False
         Top             =   1860
         Width           =   390
         _ExtentX        =   688
         _ExtentY        =   3598
      End
      Begin TrueOleDBGrid60.TDBGrid tdgCotation 
         Height          =   2715
         Left            =   480
         OleObjectBlob   =   "frmScenario.frx":014A
         TabIndex        =   30
         TabStop         =   0   'False
         Top             =   1800
         Width           =   8235
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Sc�nario :"
         Height          =   210
         Index           =   3
         Left            =   0
         TabIndex        =   3
         Top             =   420
         Width           =   945
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Remarques :"
         Height          =   210
         Index           =   2
         Left            =   0
         TabIndex        =   10
         Top             =   1140
         Width           =   1200
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "N� grille :"
         Height          =   210
         Index           =   0
         Left            =   0
         TabIndex        =   0
         Top             =   60
         Width           =   885
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Options :"
         Height          =   210
         Index           =   4
         Left            =   0
         TabIndex        =   6
         Top             =   780
         Width           =   870
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Format 1 :"
         Height          =   210
         Index           =   5
         Left            =   2340
         TabIndex        =   8
         Top             =   780
         Width           =   975
      End
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   435
      Index           =   2
      Left            =   180
      TabIndex        =   27
      Top             =   5580
      Visible         =   0   'False
      Width           =   6195
      Begin VB.TextBox txtChamp 
         DataField       =   "sce_tsvalid"
         Height          =   315
         Index           =   0
         Left            =   2340
         TabIndex        =   22
         Top             =   720
         Width           =   2055
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "sce_heuremodif"
         Height          =   315
         Index           =   8
         Left            =   2340
         TabIndex        =   18
         Top             =   360
         Width           =   975
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "sce_datemodif"
         Height          =   315
         Index           =   7
         Left            =   1260
         TabIndex        =   17
         Top             =   360
         Width           =   1035
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "sce_heurecreat"
         Height          =   315
         Index           =   6
         Left            =   2340
         TabIndex        =   14
         Top             =   0
         Width           =   975
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "sce_datecreat"
         Height          =   315
         Index           =   5
         Left            =   1260
         TabIndex        =   13
         Top             =   0
         Width           =   1035
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   10
         Left            =   1260
         TabIndex        =   24
         Top             =   1080
         Width           =   2055
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "sce_opervalid"
         Height          =   315
         Index           =   11
         Left            =   1260
         TabIndex        =   21
         Top             =   720
         Width           =   1035
      End
      Begin GrillesEvaluation.BDCombo bdcOperCreat 
         Height          =   330
         Left            =   3360
         TabIndex        =   15
         Top             =   0
         Width           =   4875
         _ExtentX        =   8599
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
         DataField       =   "sce_opercreat"
      End
      Begin GrillesEvaluation.BDCombo bdcOperModif 
         Height          =   330
         Left            =   3360
         TabIndex        =   19
         Top             =   360
         Width           =   4875
         _ExtentX        =   8599
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
         DataField       =   "sce_opermodif"
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Valid� le :"
         Height          =   210
         Index           =   1
         Left            =   0
         TabIndex        =   20
         Top             =   780
         Width           =   930
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifi� le :"
         Height          =   210
         Index           =   16
         Left            =   0
         TabIndex        =   16
         Top             =   420
         Width           =   1020
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Cr�� le :"
         Height          =   210
         Index           =   17
         Left            =   0
         TabIndex        =   12
         Top             =   60
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   0
         TabIndex        =   23
         Top             =   1140
         Width           =   1155
      End
   End
   Begin MSComctlLib.TabStrip tsTab 
      Height          =   435
      Left            =   1260
      TabIndex        =   26
      TabStop         =   0   'False
      Top             =   480
      Width           =   4455
      _ExtentX        =   7858
      _ExtentY        =   767
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "T�te"
            Key             =   "T�te"
            Object.ToolTipText     =   "Informations g�n�rales sur la grille"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Tra�abilit�"
            Key             =   "Tra�abilit�"
            Object.ToolTipText     =   "Tra�abilit� relative � la grille"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   720
      Top             =   480
   End
   Begin GrillesEvaluation.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   25
      Top             =   0
      Width           =   9720
      _ExtentX        =   17145
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
End
Attribute VB_Name = "frmSc�nario"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmScenario
' Feuille de gestion des sc�narios des grilles
' 24/11/1999 NC
'  9/06/2000 PV  Impression n� sc�nario et fond blanc
' 11/07/2000 PV  Import de donn�es
' 31/08/2000 PV  Impression des titres
' 17/04/2001 PV  Gestion du mode lecture seule au niveau du tableau
' 24/07/2001 PV  Modif corps --> MAJ tra�abilit� t�te


Option Explicit

Private cSce As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire
Private bOpG�n�rale As Boolean

Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private sQuery As String                  ' Query de la s�lection en cours

Private Const sTable = "scenario"

Private xaTab As XArrayDB                 ' Donn�es du tableau
Private bTabModifi� As Boolean            ' Optimisation de la gestion du tableau

Private iCurFrame As Integer              ' Cadre courant visible


'=================================================================================
' Gestion des onglets

' Change le frame affich�
Private Sub Page(ByVal sPage)
  ' On ne change que l'onglet, ce code appelle automatiquement tsTab_Click
  Set tsTab.SelectedItem = tsTab.Tabs(sPage)
End Sub


Private Sub tsTab_Click()
  ' Utilise le m�canisme visible/invisible comme il est conseill� dans l'aide
  ' et contrairement � la doc qui pr�ne l'usage du ZOrder�
  ' Avantage: (entre autres, voir l'aide) �vite les conflits d'acc�l�rateurs entre pages
  If tsTab.SelectedItem.Index = iCurFrame Then Exit Sub     ' Inutile de changer le cadre.
  ' Sinon, masque l'ancien cadre et affiche le nouveau.
  fraFeuille(tsTab.SelectedItem.Index).Visible = True
  If iCurFrame >= 0 Then fraFeuille(iCurFrame).Visible = False
  ' Affecte la nouvelle valeur � iCurFrame.
  iCurFrame = tsTab.SelectedItem.Index

  ' Accompagnement du focus
  ' �a serait pas mal de m�moriser page par page le contr�le qui a le focus au moment
  ' du changement de focus, de fa�on � restaurer le focus sur ce contr�le
  ' mais il faut traiter le fait que c'est le contr�le tabstop qui prend le focus
  ' quand on clique dessus (pas s�r il me semble, c'est au 2�me clic qu'il prend le focus !!!)
  DoEvents
  Select Case tsTab.SelectedItem.Key
    Case "T�te": txtChamp(1).SetFocus
    Case "Tra�abilit�": txtChamp(5).SetFocus
    Case Else: Stop
  End Select
End Sub

Private Sub Form_Resize()
  If ScaleHeight < 250 Or ScaleWidth < 550 Then Exit Sub
  
  ' On retaille le tabstrip�
  tsTab.Move 2, 31, ScaleWidth - 4, ScaleHeight - 35
  
  ' Puis les frames contenant les contr�les
  Dim F As Frame
  For Each F In fraFeuille
    F.Move tsTab.ClientLeft + 2, tsTab.ClientTop + 6, tsTab.ClientWidth - 2, tsTab.ClientHeight - 4
  Next
  
  ' Puis le contenu des frames
  txtTitre.Width = fraFeuille(1).Width * Screen.TwipsPerPixelX - txtTitre.Left - 50
  txtTitreSc�nario.Width = fraFeuille(1).Width * Screen.TwipsPerPixelX - txtTitreSc�nario.Left - 50
  txtChamp(4).Width = fraFeuille(1).Width * Screen.TwipsPerPixelX - txtChamp(4).Left - 50
  
  ' Puis la grille
  tdgCotation.Width = tsTab.ClientWidth * 15 - 38 * 15
  tdgCotation.Height = tsTab.ClientHeight * 15 - tdgCotation.Top - 10 * 15
End Sub

' Changement d'onglet avec PgPrec/PgSuiv
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyPageUp Then
    If tsTab.SelectedItem.Index > 1 Then Page tsTab.SelectedItem.Index - 1
    KeyCode = 0
  ElseIf KeyCode = vbKeyPageDown Then
    If tsTab.SelectedItem.Index < tsTab.Tabs.Count Then Page tsTab.SelectedItem.Index + 1
    KeyCode = 0
  Else
    bdS�l.KeyDown KeyCode
  End If
End Sub


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
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If

  Dim cSceQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from scenario where " & sWP & " order by sce_numgri"

  cSceQuery.OpenCurseur sQuery
  iErr = Err
  If iErr Then sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "�chec lors de la requ�te" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    BDActiveFormulaire colChamps, True
    SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
    Exit Sub
  End If


  ' Tout est Ok
  ' Fermeture �ventuelle du curseur en cours
  If Not cSce Is Nothing Then cSce.CloseCurseur
  Set cSce = cSceQuery
  sFinalWP = sWP

  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire

  If Not (cSce.EOF And cSce.BOF) Then
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
  ' $NC
'  ' On regarde si le nom n'existe pas d�j�
'  Dim iSer As Long
'  iSer = BDCurseurExpress("select sce_numgri from scenario where sce_jeu=" & sFormToSQL(colChamps("sce_jeu"), BDTypeINTEGER) & " and sce_libelle=" & sFormToSQL(colChamps("sce_libelle"), BDTypeCHAR))
'  If iSer <> 0 And iSer <> colChamps("sce_numgri") Then
'    MsgBox "ATTENTION - Cette cat�gorie existe d�j� dans ce jeu sous le n� " & iSer, vbExclamation, App.Title
'    Exit Function
'  End If
'
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  Dim cSceAdd As New BDCurseur
  cSceAdd.OpenCurseur "select * from scenario where sce_scenario=0"
  cSceAdd.AddNew

  ' G�n�ration du n� de sc�nario, si n�cessaire
  If colChamps("sce_scenario") = "" Then
    colChamps("sce_scenario") = 1 + NZ(BDCurseurExpress("select max (sce_scenario) from scenario where sce_numgri=" & colChamps("sce_numgri")))
    cSceAdd!sce_scenario = colChamps("sce_scenario")
  End If


' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "sce", True


' Seuls les champs actifs sont mis � jour
  ActiveTra�abilit� True
  ActiveChamp "sce_scenario", True

  If Not bPr�pareEditAdd(cSceAdd, colColonnes, colChamps) Then
    cSceAdd.CloseCurseur
    ActiveTra�abilit� False
    ActiveChamp "sce_scenario", False
    Exit Sub
  End If
  cSceAdd.CloseCurseur


' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cSce Is Nothing Then cSce.CloseCurseur
  Set cSce = New BDCurseur

  sFinalWP = "sce_numgri=" & colChamps("sce_numgri") & " and sce_scenario=" & colChamps("sce_scenario")
  sQuery = "select * from scenario where " & sFinalWP & " order by sce_scenario"
  cSce.OpenCurseur sQuery
  cSce.MoveFirst

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
  Assert Not cSce Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cSce.Edit

  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "sce", False
  ActiveTra�abilit� True     ' Pour mettre � jour la base

  If Not bPr�pareEditAdd(cSce, colColonnes, colChamps) Then
    ActiveTra�abilit� False
    Exit Sub
  End If

  BDActiveFormulaire colChamps, False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True

  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate

  bdS�l.ActiveMouvements True
  AjusteMouvements

  'PurgeCacheCat�gorie colChamps("sce_jeu"), colChamps("sce_numgri")

  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub



Private Sub ActionValidate()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  ActiveTimer mtStop

  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub




Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  ActiveTimer mtStop

  BDActiveFormulaire colChamps, False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True

  ' R�affiche les donn�es. En mode change, pas besoin de r�afficher le tableau
  SynchroniseFormulaire Not (iMode = meChange)

  iMode = meEmpty
  If Not cSce Is Nothing Then
    If Not (cSce.EOF And cSce.BOF) Then
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

  bdS�lTab.ButtonEnabled = False    ' Pas d'action tableau pendant une interrogation

  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, False
  BDActiveFormulaire colChamps, True

  Page "T�te"
  
  colChamps("sce_numgri").SetFocus
  bdS�l.TabStop = False

  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cSce Is Nothing

  If cSce.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If

  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True

  bdS�lTab.ButtonEnabled = False    ' Pas d'action tableau pendant un changement de t�te

  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "sce_numgri", False
  ActiveChamp "sce_scenario", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False

  Page "T�te"
  colChamps("sce_titre").SetFocus
  AutoSelect colChamps("sce_titre"), True
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

  bdS�lTab.ButtonEnabled = False    ' Pas d'action tableau pendant un ajout

  EffaceFormulaire
  Page "T�te"
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "sce_scenario", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
  
  colChamps("sce_numgri").SetFocus
  ActiveChamp "sce_scenario", False
  bdS�l.TabStop = False

  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cSce Is Nothing
  
  If cSce.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If

  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est d�finitive." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub

  ' On efface la t�te�
  On Error Resume Next
  cSce.Delete
  If Err Then
    AfficheErreurODBC "�chec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  ' Puis le corps du sc�nario
  RunSQL "delete from cotation where cot_numgri=" & sFormToSQL(colChamps("sce_numgri"), BDTypeINTEGER) & " and cot_scenario=" & sFormToSQL(colChamps("sce_scenario"), BDTypeINTEGER)


  ' On place les enregistrements dans synchrodelete (t�te+corps)
  Dim cSD As New BDCurseur
  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
  ' Corps
  cSD.AddNew
  cSD!sd_table = "cotation"
  cSD!sd_timestamp = BDTime
  cSD!sd_wherepart = "cot_numgri=" & sFormToSQL(colChamps("sce_numgri"), BDTypeINTEGER) & " and cot_scenario=" & sFormToSQL(colChamps("sce_scenario"), BDTypeINTEGER)
  cSD.Update
  
  ' T�te
  cSD.AddNew
  cSD!sd_table = "scenario"
  cSD!sd_timestamp = BDTime
  cSD!sd_wherepart = "sce_numgri=" & sFormToSQL(colChamps("sce_numgri"), BDTypeINTEGER) & " and sce_scenario=" & sFormToSQL(colChamps("sce_scenario"), BDTypeINTEGER)
  cSD.Update
  cSD.CloseCurseur

  cSce.MoveNext
  If cSce.EOF Then
    cSce.MovePrevious
    If cSce.BOF Then
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
' Tra�abilit�

Private Sub ActiveTra�abilit�(bEnable As Boolean)
  ActiveChamp "sce_datecreat", bEnable
  ActiveChamp "sce_heurecreat", bEnable
  ActiveChamp "sce_opercreat", bEnable
  ActiveChamp "sce_datemodif", bEnable
  ActiveChamp "sce_heuremodif", bEnable
  ActiveChamp "sce_opermodif", bEnable
  ActiveChamp "sce_opervalid", bEnable
  ActiveChamp "sce_tsvalid", bEnable
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cSce Is Nothing

  bdS�l.ButtonEnabled("First") = cSce.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cSce.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cSce.EOF
  bdS�l.ButtonEnabled("Last") = Not cSce.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate

  cSce.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cSce.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate

  cSce.MoveNext
  AjusteMouvements
  If cSce.EOF Then cSce.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate

  cSce.MovePrevious
  AjusteMouvements
  If cSce.BOF Then cSce.MoveFirst
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


'=================================================================================
' Actions tableau

Public Sub ActionTabChange()
  Assert iMode = meNavigate
  Assert Not cSce Is Nothing

  BDActiveChamp tdgCotation, True
  'tdgCotation.AllowAddNew = True
  tdgCotation.AllowUpdate = True
  bdS�l.ActiveMouvements False
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False

  bdS�lTab.ButtonEnabled("Change") = False
  bdS�lTab.ActiveValidation True
  bdS�lTab.ButtonEnabled("InsertRow") = False
  bdS�lTab.ButtonEnabled("DeleteRow") = False

  iMode = meChangeTab
  bTabModifi� = False
  S�lectionneCellule 1, 2
  tdgCotation.SetFocus
End Sub


Private Sub ActionTabValidate()
  Assert iMode = meChangeTab
  Assert Not cSce Is Nothing
  
  ' On valide les modifs de la ligne courante
  If tdgCotation.DataChanged Then
    tdgCotation.Update
    DoEvents
  End If
  
  If bTabModifi� Then   ' Optimisation si pas de modif
  
    ' Contr�le g�n�ral des donn�es: doublons de numloc et items inexistants
    Dim i As Integer, j As Integer, k As Integer
    For i = 1 To xaTab.UpperBound(1)

      ' D�tection des items invalides
      If Trim(xaTab(i, 2)) <> "" Then
        If Not IsNumeric(xaTab(i, 2)) Then
          MsgBox "D�cote invalide.", vbExclamation, App.Title
          S�lectionneCellule i, 2
          Exit Sub
        End If
        
        If Abs(xaTab(i, 2)) > 10000 Then
          MsgBox "D�cote invalide (doit �tre comprise entre -10 000 et +10 000).", vbExclamation, App.Title
          S�lectionneCellule i, 2
          Exit Sub
        End If
      End If

      ' D�tection de doublons dans les options
      Dim sOpt As String
      sOpt = Trim(xaTab(i, 3))
      For j = 1 To Len(sOpt)
        For k = j + 1 To Len(sOpt)
          If Mid(sOpt, j, 1) = Mid(sOpt, k, 1) Then
            MsgBox "L'option " & Mid(sOpt, j, 1) & " est pr�sente plusieurs fois. �liminez les doublons avant de valider.", vbExclamation, App.Title
            S�lectionneCellule i, 3
            Exit Sub
          End If
        Next
      Next
      
      If Trim(xaTab(i, 4)) <> "" And Not IsNumeric(xaTab(i, 4)) Then
        MsgBox "Format invalide.", vbExclamation, App.Title
        S�lectionneCellule i, 4
        Exit Sub
      End If
    Next


    ' Tests Ok, on peut mettre � jour la base de donn�es
    SetStatus "Mise � jour de la base de donn�es�"
    Screen.MousePointer = vbHourglass
    
    Dim dBDTime As Date
    dBDTime = BDTime
    
    Dim cr As New BDCurseur
    For i = 1 To xaTab.UpperBound(1)
      If xaTab(i, 6) < 0 Then         ' La ligne a �t� modifi�e
        '$ NC
        cr.OpenCurseur "select * from cotation where cot_numgri=" & sFormToSQL(colChamps("sce_numgri"), BDTypeINTEGER) & " and cot_scenario=" & sFormToSQL(colChamps("sce_scenario"), BDTypeINTEGER) & " and cot_cgserie=" & -xaTab(i, 6)
        If cr.EOF Then
          cr.AddNew
          cr!cot_numgri = colChamps("sce_numgri")
          cr!cot_scenario = colChamps("sce_scenario")
          cr!cot_cgserie = -xaTab(i, 6)
        Else
          cr.Edit
        End If
        cr!cot_decote = VN(Trim(xaTab(i, 2)))
        cr!cot_options = VN(Trim(xaTab(i, 3)))
        cr!cot_format = VN(Trim(xaTab(i, 4)))
        cr!timestamp = dBDTime
        cr.Update
        cr.CloseCurseur
      End If
    Next
    
    
    ' Mise � jour de la tra�abilit� de la t�te
    cSce.Edit
    InitTra�abilit� colChamps, "sce", False
    ActiveTra�abilit� True     ' Pour mettre � jour la base
    bPr�pareEditAdd cSce, colColonnes, colChamps
    ActiveTra�abilit� False

    
    Screen.MousePointer = vbDefault
    SetStatus
  End If    ' if bTabModifi�

  BDActiveChamp tdgCotation, False
  tdgCotation.AllowAddNew = False
  tdgCotation.AllowUpdate = False
  bdS�lTab.ButtonEnabled = False
  bdS�lTab.ButtonEnabled("Change") = True

  bdS�l.ActiveMouvements True
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.SetFocus

  If bTabModifi� Then SynchroniseFormulaire     ' R�ffiche la liste tri�e

  iMode = meNavigate
End Sub

Private Sub S�lectionneCellule(i As Integer, c As Integer)
  On Error Resume Next
  tdgCotation.Row = i - tdgCotation.FirstRow
  If Err Then
    tdgCotation.FirstRow = i
    tdgCotation.Row = 0
  End If
  On Error GoTo 0
  tdgCotation.col = c
  tdgCotation.SetFocus
End Sub

Private Sub ActionTabCancel()
  Assert iMode = meChangeTab
  Assert Not cSce Is Nothing

  BDActiveChamp tdgCotation, False
  tdgCotation.AllowAddNew = False
  tdgCotation.AllowUpdate = False
  bdS�lTab.ButtonEnabled = False
  bdS�lTab.ButtonEnabled("Change") = True

  bdS�l.ActiveMouvements True
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.SetFocus

  If bTabModifi� Or tdgCotation.DataChanged Then SynchroniseFormulaire   ' Restore le tableau pr�c�dent

  iMode = meNavigate
End Sub



' Affichage du texte de l'item d�s qu'on change de ligne en saisie dans le tableau
Private Sub tdgCotation_AfterUpdate()
  bTabModifi� = True
  If iMode = meChangeTab Then
    Dim fr As Integer, r As Integer
    If tdgCotation.FirstRow = "" Then
      fr = 1
    Else
      fr = tdgCotation.FirstRow
    End If
    If tdgCotation.Row = -1 Then
      r = xaTab.UpperBound(1)
    Else
      r = fr + tdgCotation.Row
    End If

    ' On marque la ligne comme �tant modifi�e
    If xaTab(r, 6) > 0 Then
      xaTab(r, 6) = -xaTab(r, 6)
      tdgCotation.RefetchRow r        ' Utile en mode mise au point, quand la colonne 6 est visible
    End If
  End If
End Sub


'=================================================================================
' Actions du s�lecteur tableau

Private Sub bdS�lTab_ActionTabChange():     ActionTabChange:    End Sub
Private Sub bdS�lTab_ActionTabValidate():   ActionTabValidate:  End Sub
Private Sub bdS�lTab_ActionTabCancel():     ActionTabCancel:    End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_Keypress(KeyAscii As Integer)
  If KeyAscii = Asc("t") Or KeyAscii = Asc("T") Then
    If bdS�lTab.ButtonEnabled("Change") Then
      KeyAscii = 0
      ActionTabChange
    End If
  Else
    If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
  End If
End Sub


Private Sub tdgCotation_KeyDown(KeyCode As Integer, Shift As Integer)
  bdS�lTab.KeyDown KeyCode, Shift
  If KeyCode = 13 Then KeyCode = 0
End Sub


Private Sub txtChamp_DblClick(Index As Integer)
  If iMode = meAdd And txtChamp(Index).DataField = "sce_numgri" Then
    ActiveChamp "sce_numgri", True
  End If
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
  
  ' On met les frames en t�te de pile d'affichage, sinon certains sont derri�re le tsTab
  Dim F As Frame
  For Each F In fraFeuille
    F.ZOrder 0
  Next

  Show
  iCurFrame = -1   ' Pour forcer le passage � la page 0
  Page "T�te"
  
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  ' Chargement des combos
' Utilisateurs
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcoperModif.AddItem u.uti_numuti, u.uti_nom
  Next
  
  ' Pr�paration de la grille
  With tdgCotation
    .AllowRowSelect = False
    .AllowColSelect = False
    .AllowAddNew = False
    .AllowUpdate = False
    .AllowDelete = False
    .RecordSelectors = False
    .HighlightRowStyle.BackColor = RGB(180, 180, 255)
    .HighlightRowStyle.ForeColor = &H80000008
    .TabAction = 2    ' Grid navigation

    With .Columns(0)                      ' N� de l'item
      .Caption = "Item"
      .Width = 50 * 15
      .DataWidth = 5
      .Locked = True
      .BackColor = RGB(220, 220, 220)
    End With
    
    With .Columns(1)                      ' N� local sur la grille
      .Caption = "NLoc"
      .Width = 45 * 15
      .DataWidth = 4
      .Locked = True
      .BackColor = RGB(220, 220, 220)
    End With
    
    With .Columns(2)                      ' Decote de l'item
      .Caption = "Dec"
      .Width = 55 * 15
      .DataWidth = 6
      .EditMask = "&#####"
    End With
    
    With .Columns(3)                      ' Options de l'item
      .Caption = "Opt"
      .Width = 60 * 15
      .DataWidth = 5
      .EditMask = ">&&&&&"
    End With
    
    With .Columns(4)                      ' Format de l'item
      .Caption = "Fmt"
      .Width = 30 * 15
      .DataWidth = 2
      .EditMask = "##"                    ' Laisse passer les ��� !!!!!!!!
    End With
        
    With .Columns(5)                      ' Libell� de l'item
      .Caption = "Item"
      .Width = 360 * 15
      .Locked = True
      .BackColor = RGB(220, 220, 220)
      .WrapText = True                    ' Impression sur plusieurs lignes
    End With
    
    With .Columns(6)                      ' N� s�rie (colonne invisible)
      .Caption = "S�rie"
      .Width = 50 * 15
      .Visible = False
      .Locked = True
      .BackColor = RGB(220, 220, 220)
    End With

    Set xaTab = New XArrayDB
    .Array = xaTab
    EffaceTableau
  End With


  ' Formulaire en mode initial
  BDActiveFormulaire colChamps, False
  BDActiveChamp tdgCotation, False
  Set cSce = Nothing
  bdS�l.LectureSeule = bLectureSeule
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True

  bdS�lTab.ButtonEnabled = False
  bdS�lTab.LectureSeule = bLectureSeule

  iMode = meEmpty

  bdS�l.SetFocus

  SetMessage
  SetStatus
  sFinalWP = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meChangeTab Or iMode = meQuery Then
    MsgBox "Terminez l'op�ration en cours avant de fermer la fen�tre !", vbCritical, App.Title
    If Not bShiftPressed Then
      Cancel = True
      Exit Sub
    End If
  End If

  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cSce Is Nothing Then cSce.CloseCurseur
  MDIGrilles.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire(Optional bR�afficheTableau As Boolean = True)
  ActiveTimer mtStop
  If cSce Is Nothing Then
    EffaceFormulaire
  ElseIf cSce.BOF And cSce.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cSce.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cSce.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0

    bdS�l.NumRec = cSce.AbsolutePosition
    
    ' On efface les champs qui seront affich�s par le timer = le tableau
    If bR�afficheTableau Then
      ActiveTimer mtRapide              ' Mise � jour en arri�re plan
      bdS�lTab.ButtonEnabled = False    ' Aucune commande de tableau disponible
      EffaceTableau
    Else
      bdS�lTab.ButtonEnabled("change") = True
    End If
  End If
  Exit Sub

pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cSce.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop

  
  ' Affichage des champs satellites
  If colChamps("sce_numgri") <> "" Then
    txtTitre = sGetTitreGrille(colChamps("sce_numgri"), cLangage)
    txtTitre.Refresh
  End If

  Dim cV As New BDCurseur
  cV.OpenCurseur "select cg_numit,cg_numloc,it_libelle,cot_decote,cot_options,cot_format,cg_serie,cg_index " & _
                 "  from corgri,outer items,outer cotation" & _
                 "  where cg_numgri=" & colChamps("sce_numgri") & " and cot_cgserie=cg_serie and cot_scenario='" & colChamps("sce_scenario") & "'" & _
                 "    and it_numit=cg_numit and it_langue='" & cLangage & "' " & _
                 "  order by cg_index"

  Dim iRec As Integer
  iRec = 1
  Do Until cV.EOF
    xaTab.InsertRows iRec
    xaTab(iRec, 0) = cV!cg_numit
    xaTab(iRec, 1) = cV!cg_numloc
    xaTab(iRec, 2) = NV(cV!cot_decote)
    xaTab(iRec, 3) = NV(cV!cot_options)
    xaTab(iRec, 4) = NV(cV!cot_format)
    xaTab(iRec, 5) = cV!it_libelle
    xaTab(iRec, 6) = cV!cg_serie
        
    cV.MoveNext
    iRec = iRec + 1
  Loop
  cV.CloseCurseur
  tdgCotation.Array = xaTab
  tdgCotation.ReBind
  bdS�lTab.ButtonEnabled("change") = True
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  txtTitre = ""
  bdS�l.NumRec = ""
  EffaceTableau
End Sub

Private Sub EffaceTableau()
  xaTab.ReDim 1, 0, 0, 6
  tdgCotation.ReBind
End Sub


' Activation du timer de mise � jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop:    timSatellites.Enabled = False
    Case mtLent:    timSatellites.Interval = 1000:  timSatellites.Enabled = True
    Case mtRapide:  timSatellites.Interval = 250:   timSatellites.Enabled = True
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

Private Sub bdcOperCreat_GotFocus()
  SetStatus bdcOperCreat.Tag
End Sub

Private Sub bdcOperModif_GotFocus()
  SetStatus bdcoperModif.Tag
End Sub


Private Sub tdgCotation_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
  Select Case tdgCotation.col
    Case 0: SetStatus "N� de s�rie de l'item dans la table item"
    Case 1: SetStatus "Num�rotation de l'item dans la grille client"
    Case 2: SetStatus "D�cote de l'item"
    Case 3: SetStatus "Options de l'item"
    Case 4: SetStatus "Format de l'item"
    Case 5: SetStatus "Libell� de l'item"
    Case Else: SetStatus
  End Select
End Sub

Private Sub txtChamp_LostFocus(Index As Integer)
  ' Mise � jour du champ txt_titre
  If txtChamp(Index).DataField = "sce_numgri" Then
    If IsNumeric(txtChamp(Index)) Then
      txtTitre = sGetTitreGrille(txtChamp(Index), cLangage)
    Else
      txtTitre = ""
    End If
  End If
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
  BDCopieS�lection cSce, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub

Public Sub CopieTableau()
  gtCopieTableau tdgCotation, xaTab
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
  
  iChoix = frmMessageChoix.ChoixEtat("Titres de sc�narios s�lectionn�s", "Sc�nario courant")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
End Sub


Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String
  sSQL = "select * from scenario where " & sFinalWP
  
  Select Case iChoix
    Case 1:
    ' Le "on error resume next" sert � �viter une erreur 13:Type incompatible, venue de dieu sait o� et impossible � localiser...
      On Error Resume Next
      BDEtat sSQL, drTitresSc�narios, bImpression
      On Error GoTo 0
    
    Case 2:
      BDActiveChamp tdgCotation, True
      Dim i As Integer
    '  For i = 0 To tdgCotation.Columns.Count - 1
    '    With tdgCotation.Columns(i)
    '      .FooterBackColor = .BackColor
    '      .BackColor = RGB(255, 255, 255)
    '    End With
    '  Next
        
      With tdgCotation.PrintInfo
        .PageHeader = colChamps("sce_numgri") & "/" & colChamps("sce_scenario") & " " & colChamps("sce_titre") ' & " " & colChamps("sce_titre2")
        .PageFooter = Date & " " & Time & "\tPage \p"
        .RepeatColumnHeaders = True
        .PreviewCaption = "Grille " & colChamps("sce_numgri")
        .VariableRowHeight = True
        .SettingsMarginTop = 500
        .SettingsMarginBottom = 500
        .SettingsMarginLeft = 1000
        .SettingsMarginRight = 1000
        
        If bImpression Then
          .PrintData
        Else
          .PrintPreview
        End If
      End With
      
    '  For i = 0 To tdgCotation.Columns.Count - 1
    '    tdgCotation.Columns(i).BackColor = tdgCotation.Columns(i).FooterBackColor
    '  Next
      BDActiveChamp tdgCotation, False
  End Select
End Sub



'=================================================================================
' Import de donn�es

Private Sub Cl�sImport(Optional ByRef tsCl�sLigne1 As Variant, Optional tsCl�sBase As Variant, Optional tsD�faut As Variant)
  If Not IsMissing(tsCl�sLigne1) Then tsCl�sLigne1 = Array("*NLoc", "Dec", "Opt", "Fmt")
  If Not IsMissing(tsCl�sBase) Then tsCl�sBase = Nothing
  If Not IsMissing(tsD�faut) Then tsD�faut = Array("", "", "", "")
End Sub

Public Sub Importer()
  Dim tsCl�sL1 As Variant     ' Tableau des cl�s, * en pr�fixe des cl�s obligatoires
  Dim tsD�faut As Variant     ' Tableau des valeurs par d�faut, de m�me taille que le tableau des cl�s
  
  If iMode <> meNavigate Then
    MsgBox "S�lectionnez ou cr�ez un en-t�te de sc�nario avant d'importer les donn�es.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Cl�sImport tsCl�sLigne1:=tsCl�sL1, tsD�faut:=tsD�faut
  Pr�pareImport Me, "Import de sc�narion EH", tsCl�sL1, tsD�faut, frmImport
End Sub


Public Sub ImportCallBack()
  frmImport.btnAnnuler.Enabled = False
  frmImport.btnImporter.Enabled = False
  SetStatus "Import en cours, patientez..."
  
  Dim x As ListItem
  Dim h As ColumnHeaders
  Dim iSerial As Long
  Dim s
  
  ActionTabChange
  
  Dim iRec As Integer
  Set h = frmImport.lvImport.ColumnHeaders
  For Each x In frmImport.lvImport.ListItems
    For iRec = 1 To xaTab.UpperBound(1)
      If xaTab(iRec, 1) = x.SubItems(1) Then
        xaTab(iRec, 2) = x.SubItems(2)
        xaTab(iRec, 3) = x.SubItems(3)
        xaTab(iRec, 4) = x.SubItems(4)
        xaTab(iRec, 6) = -xaTab(iRec, 6)        ' Marqueur de modification
        x.Text = "Ok"
        Exit For
      End If
    Next
  Next
  
  
  tdgCotation.ReBind
  bTabModifi� = True
  
  bdS�lTab.ButtonEnabled("change") = True

  frmImport.btnAnnuler.Enabled = True
  frmImport.btnAnnuler.Caption = "Fermer"
  SetStatus
End Sub

