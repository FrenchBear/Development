VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form frmStructure 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Structure EH"
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
   Icon            =   "frmStructure.frx":0000
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
      Height          =   4755
      Index           =   1
      Left            =   180
      TabIndex        =   29
      Top             =   1680
      Visible         =   0   'False
      Width           =   9015
      Begin VB.TextBox txtChamp 
         DataField       =   "tit_comment"
         Height          =   315
         Index           =   4
         Left            =   1260
         TabIndex        =   12
         Top             =   1440
         Width           =   7320
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "*tit_numgri"
         Height          =   315
         Index           =   1
         Left            =   1260
         TabIndex        =   1
         Top             =   0
         Width           =   615
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "*tit_titre1"
         Height          =   315
         Index           =   2
         Left            =   1260
         MaxLength       =   60
         MultiLine       =   -1  'True
         TabIndex        =   5
         Top             =   360
         Width           =   7335
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "tit_class1"
         Height          =   315
         Index           =   3
         Left            =   1260
         TabIndex        =   8
         Top             =   1080
         Width           =   3060
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "tit_class2"
         Height          =   315
         Index           =   9
         Left            =   5520
         TabIndex        =   10
         Top             =   1080
         Width           =   3060
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "tit_titre2"
         Height          =   315
         Index           =   12
         Left            =   1260
         MaxLength       =   60
         MultiLine       =   -1  'True
         TabIndex        =   6
         Top             =   720
         Width           =   7335
      End
      Begin GrillesEvaluation.BDCombo bdcEdLangue 
         Height          =   330
         Left            =   3000
         TabIndex        =   3
         Top             =   0
         Width           =   2355
         _ExtentX        =   4154
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
         DataField       =   "^*tit_langue"
      End
      Begin GrillesEvaluation.BDS�lecteurTableau bdS�lTab 
         Height          =   2040
         Left            =   0
         TabIndex        =   30
         TabStop         =   0   'False
         Top             =   1860
         Width           =   390
         _ExtentX        =   688
         _ExtentY        =   3598
      End
      Begin TrueOleDBGrid60.TDBGrid tdgD�finitions 
         Height          =   2715
         Left            =   480
         OleObjectBlob   =   "frmStructure.frx":014A
         TabIndex        =   31
         TabStop         =   0   'False
         Top             =   1860
         Width           =   8235
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Titre :"
         Height          =   210
         Index           =   3
         Left            =   0
         TabIndex        =   4
         Top             =   420
         Width           =   555
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Remarques :"
         Height          =   210
         Index           =   2
         Left            =   0
         TabIndex        =   11
         Top             =   1500
         Width           =   1200
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Serial :"
         Height          =   210
         Index           =   0
         Left            =   0
         TabIndex        =   0
         Top             =   60
         Width           =   660
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Langue :"
         Height          =   210
         Index           =   10
         Left            =   2040
         TabIndex        =   2
         Top             =   60
         Width           =   840
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Class. 1 :"
         Height          =   210
         Index           =   4
         Left            =   0
         TabIndex        =   7
         Top             =   1140
         Width           =   885
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Class. 2 :"
         Height          =   210
         Index           =   5
         Left            =   4500
         TabIndex        =   9
         Top             =   1140
         Width           =   885
      End
   End
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   1275
      Index           =   2
      Left            =   7860
      TabIndex        =   28
      Top             =   600
      Visible         =   0   'False
      Width           =   1335
      Begin VB.TextBox txtChamp 
         DataField       =   "tit_tsvalid"
         Height          =   315
         Index           =   0
         Left            =   2340
         TabIndex        =   23
         Top             =   720
         Width           =   2055
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "tit_heuremodif"
         Height          =   315
         Index           =   8
         Left            =   2340
         TabIndex        =   19
         Top             =   360
         Width           =   975
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "tit_datemodif"
         Height          =   315
         Index           =   7
         Left            =   1260
         TabIndex        =   18
         Top             =   360
         Width           =   1035
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "tit_heurecreat"
         Height          =   315
         Index           =   6
         Left            =   2340
         TabIndex        =   15
         Top             =   0
         Width           =   975
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "tit_datecreat"
         Height          =   315
         Index           =   5
         Left            =   1260
         TabIndex        =   14
         Top             =   0
         Width           =   1035
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   10
         Left            =   1260
         TabIndex        =   25
         Top             =   1080
         Width           =   2055
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "tit_opervalid"
         Height          =   315
         Index           =   11
         Left            =   1260
         TabIndex        =   22
         Top             =   720
         Width           =   1035
      End
      Begin GrillesEvaluation.BDCombo bdcOperCreat 
         Height          =   330
         Left            =   3360
         TabIndex        =   16
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
         DataField       =   "tit_opercreat"
      End
      Begin GrillesEvaluation.BDCombo bdcOperModif 
         Height          =   330
         Left            =   3360
         TabIndex        =   20
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
         DataField       =   "tit_opermodif"
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Valid� le :"
         Height          =   210
         Index           =   1
         Left            =   0
         TabIndex        =   21
         Top             =   780
         Width           =   930
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifi� le :"
         Height          =   210
         Index           =   16
         Left            =   0
         TabIndex        =   17
         Top             =   420
         Width           =   1020
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Cr�� le :"
         Height          =   210
         Index           =   17
         Left            =   0
         TabIndex        =   13
         Top             =   60
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   0
         TabIndex        =   24
         Top             =   1140
         Width           =   1155
      End
   End
   Begin MSComctlLib.TabStrip tsTab 
      Height          =   435
      Left            =   1260
      TabIndex        =   27
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
      TabIndex        =   26
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
Attribute VB_Name = "frmStructure"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmStructure
' Feuille de gestion de la structure des grilles
' 17/11/1999 NC
' 16/02/2000 PV  Mise � jour du timestamp en cas de modif partielle du corps de grille
'  5/06/2000 PV  Numloc 4 -> 6 caract�res
' 11/07/2000 PV  Import de donn�es
' 31/08/2000 PV  Impression des titres
' 15/09/2000 PV  Double-clic pour afficher un item
' 17/04/2001 PV  Gestion du mode lecture seule au niveau du tableau
'  5/07/2001 PV  Contr�le du niveau (on pouvait importer des niveaux erron�s)
' 24/07/2001 PV  Modif corps --> MAJ tra�abilit� t�te; Optimisation: ajout en fin de tableau = modif simple


Option Explicit

Private cGri As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire
Private bOpG�n�rale As Boolean

Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private sQuery As String                  ' Query de la s�lection en cours

Private Const sTable = "titgri"

Private xaTab As XArrayDB                 ' Donn�es du tableau
Private bTabModifi� As Boolean            ' Optimisation de la gestion du tableau
Private bTabModifSimple As Boolean        ' Vrai tant qu'il n'y a ni ajout ni suppression d'items

Private iCurFrame As Integer              ' Cadre courant visible

Private iSerieCG As Long                  ' G�n�rateur de n�s de s�rie (corgri)


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
  txtChamp(2).Width = fraFeuille(1).Width * Screen.TwipsPerPixelX - txtChamp(2).Left - 50
  txtChamp(12).Width = fraFeuille(1).Width * Screen.TwipsPerPixelX - txtChamp(12).Left - 50
  txtChamp(4).Width = fraFeuille(1).Width * Screen.TwipsPerPixelX - txtChamp(4).Left - 50
  
  ' Puis la grille
  tdgD�finitions.Width = tsTab.ClientWidth * 15 - 38 * 15
  tdgD�finitions.Height = tsTab.ClientHeight * 15 - tdgD�finitions.Top - 10 * 15
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
  Dim bRequ�teVide As Boolean
  
  bRequ�teVide = True
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
      If t.DataField <> "tit_langue" Then bRequ�teVide = False
    End If
  Next

  If bRequ�teVide Then
    Dim iRep As VbMsgBoxResult
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If

  Dim cGriQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from titgri where " & sWP & " order by tit_numgri desc"

  cGriQuery.OpenCurseur sQuery
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
  If Not cGri Is Nothing Then cGri.CloseCurseur
  Set cGri = cGriQuery
  sFinalWP = sWP

  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire

  If Not (cGri.EOF And cGri.BOF) Then
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
  Dim iS�rie As Long
  
  Assert iMode = meAdd

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  Dim cGriAdd As New BDCurseur
  cGriAdd.OpenCurseur "select * from titgri where tit_numgri=0"
  cGriAdd.AddNew

  ' G�n�ration du n� de s�rie
  If colChamps("tit_numgri") = "" Then
    RunSQL "insert into serialgrille values(0)"
    iS�rie = BDCurseurExpress("select max(serialgrille) from serialgrille")
    If iS�rie < 10 Then   ' S�curit� nouvelles bases
      RunSQL "insert into serialgrille values(10)"
      iS�rie = 10
    End If
    colChamps("tit_numgri") = iS�rie
    ' On purge les enregistrements ajout�s dans serialitem pour la g�n�ration des n�s de s�rie
    RunSQL "delete from serialgrille where serialgrille<" & iS�rie
  End If


' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "tit", True


' Seuls les champs actifs sont mis � jour
  ActiveTra�abilit� True
  ActiveChamp "tit_numgri", True

  If Not bPr�pareEditAdd(cGriAdd, colColonnes, colChamps) Then
    cGriAdd.CloseCurseur
    ActiveTra�abilit� False
    ActiveChamp "tit_numgri", False
    Exit Sub
  End If
  cGriAdd.CloseCurseur


' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cGri Is Nothing Then cGri.CloseCurseur
  Set cGri = New BDCurseur

  sFinalWP = "tit_numgri=" & colChamps("tit_numgri")
  sQuery = "select * from titgri where " & sFinalWP & " order by tit_numgri"
  cGri.OpenCurseur sQuery
  cGri.MoveFirst

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
  Assert Not cGri Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cGri.Edit

  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "tit", False
  ActiveTra�abilit� True     ' Pour mettre � jour la base

  If Not bPr�pareEditAdd(cGri, colColonnes, colChamps) Then
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
  If Not cGri Is Nothing Then
    If Not (cGri.EOF And cGri.BOF) Then
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
  
  ' Valeur par d�faut
  bdcEdLangue = cLangage

  colChamps("tit_numgri").SetFocus
  bdS�l.TabStop = False

  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cGri Is Nothing

  If cGri.bEffac� Then
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
  ActiveChamp "tit_numgri", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False

  Page "T�te"
  colChamps("tit_titre1").SetFocus
  AutoSelect colChamps("tit_titre1"), True
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
  ActiveChamp "tit_numgri", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
  
  ' Valeur par d�faut
  bdcEdLangue = cLangage

  colChamps("tit_titre1").SetFocus
  bdS�l.TabStop = False

  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cGri Is Nothing
  
  MsgBox "L'effacement des grilles n'est pas g�r� dans cette version du programme, voyez avec le service informatique.", vbExclamation, App.Title
  If Not bShiftPressed Then Exit Sub

  If cGri.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If

  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est d�finitive." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub

  On Error Resume Next
  cGri.Delete
  If Err Then
    AfficheErreurODBC "�chec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0

  cGri.MoveNext
  If cGri.EOF Then
    cGri.MovePrevious
    If cGri.BOF Then
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
  ActiveChamp "tit_datecreat", bEnable
  ActiveChamp "tit_heurecreat", bEnable
  ActiveChamp "tit_opercreat", bEnable
  ActiveChamp "tit_datemodif", bEnable
  ActiveChamp "tit_heuremodif", bEnable
  ActiveChamp "tit_opermodif", bEnable
  ActiveChamp "tit_opervalid", bEnable
  ActiveChamp "tit_tsvalid", bEnable
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cGri Is Nothing

  bdS�l.ButtonEnabled("First") = cGri.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cGri.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cGri.EOF
  bdS�l.ButtonEnabled("Last") = Not cGri.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate

  cGri.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cGri.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate

  cGri.MoveNext
  AjusteMouvements
  If cGri.EOF Then cGri.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate

  cGri.MovePrevious
  AjusteMouvements
  If cGri.BOF Then cGri.MoveFirst
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
  Assert Not cGri Is Nothing

  BDActiveChamp tdgD�finitions, True
  tdgD�finitions.AllowAddNew = True
  tdgD�finitions.AllowUpdate = True
  bdS�l.ActiveMouvements False
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False

  bdS�lTab.ButtonEnabled("Change") = False
  bdS�lTab.ActiveValidation True
  bdS�lTab.ButtonEnabled("InsertRow") = True
  bdS�lTab.ButtonEnabled("DeleteRow") = True

  iMode = meChangeTab
  bTabModifi� = False
  bTabModifSimple = True   ' Par d�faut
  S�lectionneCellule 1, 0
  tdgD�finitions.SetFocus
End Sub


Private Sub ActionTabDeleteRow()
  Assert iMode = meChangeTab
  Assert Not cGri Is Nothing

  Dim fr As Integer, r As Integer
  If tdgD�finitions.FirstRow = "" Then Exit Sub
  fr = tdgD�finitions.FirstRow
  r = tdgD�finitions.Row
  If fr + r <= xaTab.UpperBound(1) Then
    xaTab.DeleteRows fr + r
    tdgD�finitions.ReBind
    tdgD�finitions.FirstRow = fr
    tdgD�finitions.Row = r
  End If
  bTabModifi� = True
  bTabModifSimple = False
  
  tdgD�finitions.SetFocus
End Sub


Private Sub ActionTabInsertRow()
  Assert iMode = meChangeTab
  Assert Not cGri Is Nothing

  Dim fr As Integer, r As Integer
  If tdgD�finitions.FirstRow = "" Then
    fr = 1
  Else
    fr = tdgD�finitions.FirstRow
  End If
  r = tdgD�finitions.Row
  xaTab.InsertRows fr + r
  tdgD�finitions.ReBind
  tdgD�finitions.FirstRow = fr
  tdgD�finitions.Row = r
  bTabModifi� = True
  bTabModifSimple = False
  
  tdgD�finitions.SetFocus
End Sub


Private Sub ActionTabValidate()
  Assert iMode = meChangeTab
  Assert Not cGri Is Nothing
  
  ' On valide les modifs de la ligne courante
  If tdgD�finitions.DataChanged Then
    tdgD�finitions.Update
    DoEvents
  End If
  
  If bTabModifi� Then   ' Optimisation si pas de modif
    ' Contr�le g�n�ral des donn�es: doublons de numloc et items inexistants
    Dim i As Integer, j As Integer
    For i = 1 To xaTab.UpperBound(1)
    
      ' Par pure bont�, on ignore les lignes vides
      If Not IsEmpty(xaTab(i, 0)) Or Not IsEmpty(xaTab(i, 1)) Or Not IsEmpty(xaTab(i, 2)) Then
      
        ' Toutes les colonnes doivent �tre remplies
        If xaTab(i, 0) = "" Or xaTab(i, 1) = "" Or xaTab(i, 2) = "" Then
          MsgBox "Vous devez remplir le n� d'item, le n� local et le niveau avant de valider.", vbExclamation, App.Title
          S�lectionneCellule i, 0
          Exit Sub
        End If
      
        ' D�tection des items invalides
        If xaTab(i, 0) = 0 Or InStr(1, xaTab(i, 3), sLibell�Inexistant) > 0 Then
          MsgBox "Impossible d'enregistrer une grille avec des n�s d'item invalides.", vbExclamation, App.Title
          S�lectionneCellule i, 0
          Exit Sub
        End If
        
        ' Contr�le du niveau
        If Not (xaTab(i, 2) Like "[1234]") Then
          MsgBox "Niveau invalide (doit �tre compris entre 1 et 4).", vbExclamation, App.Title
          S�lectionneCellule i, 2
          Exit Sub
        End If
        
        ' D�tection de doublons dans le n� local sauf pour les !xxx
        If Left(Trim(CStr(xaTab(i, 1))), 1) <> "!" Then
          For j = i + 1 To xaTab.UpperBound(1)
            If Trim(CStr(xaTab(i, 1))) = Trim(CStr(xaTab(j, 1))) Then
              MsgBox "Le n� local " & xaTab(i, 1) & " est pr�sent plusieurs fois. Eliminez les doublons avant de valider.", vbExclamation, App.Title
              S�lectionneCellule i, 1
              Exit Sub
            End If
          Next
        End If
        
      End If    ' if not isempty
    Next


    ' Tests Ok, on peut mettre � jour la base de donn�es
    SetStatus "Mise � jour de la base de donn�es�"
    Screen.MousePointer = vbHourglass
    
    Dim dBDTime As Date
    dBDTime = BDTime
    
    Dim cr As New BDCurseur
    Dim Index As Integer
    If bTabModifSimple Then
      ' Mise � jour simplifi�e (updates ou insert en fin)
      Index = 1
      iSerieCG = 0
      For i = 1 To xaTab.UpperBound(1)
        If Not IsEmpty(xaTab(i, 0)) Then
          If xaTab(i, 5) = "" Then
            If Not cr.bCurseurOuvert Then cr.OpenCurseur "select * from corgri where cg_numgri=0"
            AjouteItem i, cr, Index
          End If
          If xaTab(i, 5) < 0 Then
            cr.OpenCurseur "select * from corgri where cg_numgri=" & sFormToSQL(colChamps("tit_numgri"), BDTypeINTEGER) & " and cg_index=" & -xaTab(i, 5)
            cr.Edit
            cr!cg_numit = xaTab(i, 0)
            cr!cg_numloc = xaTab(i, 1)
            cr!cg_niveau = xaTab(i, 2)
            cr!timestamp = dBDTime
            cr.Update
            cr.CloseCurseur
          End If
          Index = Index + 1
        End If
      Next
      If cr.bCurseurOuvert Then cr.CloseCurseur
    Else
      ' Mise � jour lourde
      RunSQL "delete from corgri where cg_numgri=" & sFormToSQL(colChamps("tit_numgri"), BDTypeINTEGER)
      ' On place un enregistrement dans synchrodelete
      Dim cSD As New BDCurseur
      cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
      cSD.AddNew
      cSD!sd_table = "corgri"
      cSD!sd_timestamp = dBDTime - TimeSerial(0, 0, 1)
      cSD!sd_wherepart = "cg_numgri=" & sFormToSQL(colChamps("tit_numgri"), BDTypeINTEGER)
      cSD.Update
      cSD.CloseCurseur
      
      cr.OpenCurseur "select * from corgri where cg_numgri=0"
      Index = 1
      iSerieCG = 0
      For i = 1 To xaTab.UpperBound(1)
        SetStatus "Mise � jour de la base de donn�es� " & i & "/" & xaTab.UpperBound(1)
        If Not IsEmpty(xaTab(i, 0)) Then
          AjouteItem i, cr, Index
          Index = Index + 1
        End If
      Next
      cr.CloseCurseur
    End If
    
    ' On purge les enregistrements ajout�s dans serialcorgri pour la g�n�ration des n�s de s�rie
    If iSerieCG > 0 Then RunSQL "delete from serialcorgri where serialcorgri<" & iSerieCG
    
    ' Mise � jour de la tra�abilit� de la t�te
    cGri.Edit
    InitTra�abilit� colChamps, "tit", False
    ActiveTra�abilit� True     ' Pour mettre � jour la base
    bPr�pareEditAdd cGri, colColonnes, colChamps
    ActiveTra�abilit� False

    
    Screen.MousePointer = vbDefault
    SetStatus
  End If    ' if bTabModifi�

  BDActiveChamp tdgD�finitions, False
  tdgD�finitions.AllowAddNew = False
  tdgD�finitions.AllowUpdate = False
  bdS�lTab.ButtonEnabled = False
  bdS�lTab.ButtonEnabled("Change") = True

  bdS�l.ActiveMouvements True
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.SetFocus

  If bTabModifi� Then SynchroniseFormulaire     ' R�ffiche la liste tri�e

  iMode = meNavigate
End Sub


Private Sub AjouteItem(i As Integer, cr As BDCurseur, Index As Integer)
  cr.AddNew
  cr!cg_numgri = colChamps("tit_numgri")
  cr!cg_index = Index
  cr!cg_numit = xaTab(i, 0)
  cr!cg_numloc = xaTab(i, 1)
  cr!cg_niveau = xaTab(i, 2)
  
  ' N� de s�rie unique pour la combinaison grille/item
  If xaTab(i, 4) = "" Then ' Nouvel item
    RunSQL "insert into serialcorgri values(0)"
    iSerieCG = BDGetLastSerial
    If iSerieCG < 10 Then   ' S�curit� nouvelles bases
      RunSQL "insert into serialcorgri values(10)"
      iSerieCG = 10
    End If
    cr!cg_serie = iSerieCG
  Else
    cr!cg_serie = xaTab(i, 4) ' Item lu dans la base, on conserve le n�
  End If
  
  cr!timestamp = BDTime

  Dim iErr As Long, sErr As String
  On Error Resume Next
  cr.Update
  iErr = Err.Number
  If iErr Then sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    cr.CancelUpdate
    If InStr(1, sErr, "duplicate") <> 0 Then sErr = sErr & vbCrLf & vbCrLf & "Le type " & VN(xaTab(i, 0)) & "." & VN(xaTab(i, 1)) & "." & VN(xaTab(i, 2)) & "." & VN(xaTab(i, 3)) & "." & VN(xaTab(i, 4)) & " est utilis� dans une autre cat�gorie du jeu, et la cr�ation de doublon est interdite."
    MsgBox "�chec lors de l'�criture des donn�es." & vbCrLf & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
  End If
End Sub


Private Sub S�lectionneCellule(i As Integer, c As Integer)
  On Error Resume Next
  tdgD�finitions.Row = i - tdgD�finitions.FirstRow
  If Err Then
    tdgD�finitions.FirstRow = i
    tdgD�finitions.Row = 0
  End If
  On Error GoTo 0
  tdgD�finitions.col = c
  tdgD�finitions.SetFocus
End Sub

Private Sub ActionTabCancel()
  Assert iMode = meChangeTab
  Assert Not cGri Is Nothing

  BDActiveChamp tdgD�finitions, False
  tdgD�finitions.AllowAddNew = False
  tdgD�finitions.AllowUpdate = False
  bdS�lTab.ButtonEnabled = False
  bdS�lTab.ButtonEnabled("Change") = True

  bdS�l.ActiveMouvements True
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.SetFocus

  If bTabModifi� Or tdgD�finitions.DataChanged Then SynchroniseFormulaire   ' Restore le tableau pr�c�dent

  iMode = meNavigate
End Sub



Private Sub tdgD�finitions_AfterInsert()
  bTabModifi� = True
  'bTabModifSimple = False        SI: AfterInsert reste une modif simple
End Sub


' Affichage du texte de l'item d�s qu'on change de ligne en saisie dans le tableau
Private Sub tdgD�finitions_AfterUpdate()
  bTabModifi� = True
  If iMode = meChangeTab Then
    Dim fr As Integer, r As Integer
    If tdgD�finitions.FirstRow = "" Then
      fr = 1
    Else
      fr = tdgD�finitions.FirstRow
    End If
    If tdgD�finitions.Row = -1 Then
      r = xaTab.UpperBound(1)
    Else
      r = fr + tdgD�finitions.Row
    End If

    If xaTab(r, 0) = "" Then
      xaTab(r, 3) = ""
    Else
      xaTab(r, 3) = sFormateItem(sGetItem(Val(xaTab(r, 0)), colChamps("tit_langue")), Val(xaTab(r, 2)))
    End If
    
    ' On marque la ligne pour les modifs rapides
    If IsNumeric(xaTab(r, 5)) And xaTab(r, 5) > 0 Then xaTab(r, 5) = -xaTab(r, 5)
    
    ' ET on r�affiche
    tdgD�finitions.RefetchRow r
  End If
End Sub


'=================================================================================
' Actions du s�lecteur tableau

Private Sub bdS�lTab_ActionTabChange():     ActionTabChange:    End Sub
Private Sub bdS�lTab_ActionTabDeleteRow():  ActionTabDeleteRow: End Sub
Private Sub bdS�lTab_ActionTabInsertRow():  ActionTabInsertRow: End Sub
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

Private Sub tdgD�finitions_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
'  If tdgD�finitions.Text = "" Then Exit Sub
'  If Not IsNumeric(tdgD�finitions.Text) Then
'    MsgBox "Type incorrect (non num�rique).", vbExclamation, App.Title
'    Cancel = True
'    Exit Sub
'  End If
'  If tdgD�finitions.Text < 0 Or tdgD�finitions.Text > 100000 Then
'    MsgBox "Type incorrect (<0 ou >100000).", vbExclamation, App.Title
'    Cancel = True
'    Exit Sub
'  End If
End Sub

Private Sub tdgD�finitions_AfterColEdit(ByVal ColIndex As Integer)
'  Dim fr As Integer, r As Integer
'  If tdgD�finitions.FirstRow = "" Then
'    fr = 1
'  Else
'    fr = tdgD�finitions.FirstRow
'  End If
'  r = fr + tdgD�finitions.Row
'
'  Debug.Print "r=" & r
'  If xaTab(r, 2) = "" Then
'    xaTab(r, 2) = 3
'    tdgD�finitions.RefetchRow r
'  End If
End Sub


Private Sub tdgD�finitions_DblClick()
  Dim fr As Integer, r As Integer
  If tdgD�finitions.FirstRow = "" Then
    fr = 1
  Else
    fr = tdgD�finitions.FirstRow
  End If
  r = fr + tdgD�finitions.Row
  
  If xaTab.UpperBound(1) > 0 Then
    frmItem.AfficheItem "it_numit=" & xaTab(r, 0) & " and it_langue='" & colChamps("tit_langue") & "'"
  End If
End Sub



Private Sub tdgD�finitions_KeyDown(KeyCode As Integer, Shift As Integer)
  bdS�lTab.KeyDown KeyCode, Shift
  If KeyCode = 13 Then KeyCode = 0
End Sub


Private Sub txtChamp_DblClick(Index As Integer)
  If iMode = meAdd And txtChamp(Index).DataField = "tit_numgri" Then
    ActiveChamp "tit_numgri", True
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
  
' Langues
  Dim l As Langue
  For Each l In colLangue
      bdcEdLangue.AddItem l.lan_code, l.lan_langue
  Next

  ' Pr�paration de la grille
  With tdgD�finitions
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
    End With
    
    With .Columns(1)                      ' N� local sur la grille
      .Caption = "NLoc"
      .Width = 50 * 15
      .DataWidth = 6
    End With
    
    With .Columns(2)                      ' Niveau de d�calage
      .Caption = "Niv"
      .Width = 30 * 15
    End With
    
    With .Columns(3)                      ' Libell� de l'item
      .Caption = "Item"
      .Width = 460 * 15
      .Locked = True
      .BackColor = RGB(220, 220, 220)
      .WrapText = True                    ' Impression sur plusieurs lignes
    End With
    
    With .Columns(4)                      ' N� s�rie (colonne invisible)
      .Caption = "S�rie"
      .Width = 50 * 15
      .Visible = False
      .Locked = True
      .BackColor = RGB(220, 220, 220)
    End With
        
    With .Columns(5)                      ' Index (colonne invisible)
      .Caption = "Index"
      .Width = 45 * 15
      .Visible = False
      .Locked = True
      .BackColor = RGB(220, 220, 220)
    End With
        
    ' Saisie restreinte � 1..4+(vide) pour le niveau
    Dim v As New ValueItem
    With .Columns(2).ValueItems
      v.Value = "": .Add v
      v.Value = 1: .Add v
      v.Value = 2: .Add v
      v.Value = 3: .Add v
      v.Value = 4: .Add v
      .Validate = True
    End With

    Set xaTab = New XArrayDB
    .Array = xaTab
    EffaceTableau
  End With


  ' Formulaire en mode initial
  BDActiveFormulaire colChamps, False
  BDActiveChamp tdgD�finitions, False
  Set cGri = Nothing
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
  If Not cGri Is Nothing Then cGri.CloseCurseur
  MDIGrilles.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire(Optional bR�afficheTableau As Boolean = True)
  ActiveTimer mtStop
  If cGri Is Nothing Then
    EffaceFormulaire
  ElseIf cGri.BOF And cGri.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cGri.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cGri.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0

    bdS�l.NumRec = cGri.AbsolutePosition
    
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
    cGri.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop

  Dim cV As New BDCurseur
  cV.OpenCurseur "select cg_numit,cg_numloc,cg_niveau,cg_serie,cg_index,it_libelle" & _
                 "  from corgri,outer items" & _
                 "  where cg_numgri=" & colChamps("tit_numgri") & " and it_numit=cg_numit and it_langue='" & colChamps("tit_langue") & "'" & _
                 "  order by cg_index"

  Dim iRec As Integer
  iRec = 1
  Do Until cV.EOF
    xaTab.InsertRows iRec
    xaTab(iRec, 0) = cV!cg_numit
    xaTab(iRec, 1) = cV!cg_numloc
    xaTab(iRec, 2) = cV!cg_niveau
    
    Dim sLibell� As String
    If IsNull(cV!it_libelle) Then
      sLibell� = sLibell�Inexistant
    Else
      sLibell� = cV!it_libelle
    End If
    xaTab(iRec, 3) = sFormateItem(sLibell�, cV!cg_niveau)
    
    xaTab(iRec, 4) = cV!cg_serie
    xaTab(iRec, 5) = cV!cg_index
    
    cV.MoveNext
    iRec = iRec + 1
  Loop
  cV.CloseCurseur
  tdgD�finitions.Array = xaTab
  tdgD�finitions.ReBind
  bdS�lTab.ButtonEnabled("change") = True
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
'  txtJeu = ""
  bdS�l.NumRec = ""
  EffaceTableau
End Sub

Private Sub EffaceTableau()
  xaTab.ReDim 1, 0, 0, 5
  tdgD�finitions.ReBind
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

Private Sub bdcEdLangue_Change()
  ToMaj bdcEdLangue
End Sub

Private Sub bdcEdLangue_GotFocus()
  SetStatus bdcEdLangue.Tag
End Sub

Private Sub bdcEdLangue_LostFocus()
  bdcEdLangue.Synchronise
End Sub


Private Sub tdgD�finitions_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
  Select Case tdgD�finitions.col
    Case 0: SetStatus "N� de s�rie de l'item dans la table item"
    Case 1: SetStatus "Num�rotation de l'item dans la grille client"
    Case 2: SetStatus "Niveau de d�calage, de 1 � 4"
    Case 3: SetStatus "Libell� de l'item"
    Case Else: SetStatus
  End Select
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
  BDCopieS�lection cGri, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub

Public Sub CopieTableau()
  gtCopieTableau tdgD�finitions, xaTab
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
  
  iChoix = frmMessageChoix.ChoixEtat("Liste des titres s�lectionn�s", "Structure de la grille courante")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
End Sub

Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String
  sSQL = "select * from titgri where " & sFinalWP
  
  Select Case iChoix
    Case 1:
    ' Le "on error resume next" sert � �viter une erreur 13:Type incompatible, venue de dieu sait o� et impossible � localiser...
      On Error Resume Next
      BDEtat sSQL, drTitresGrilles, bImpression
      On Error GoTo 0
    
    Case 2:
      ' Impression sur fond blanc
      BDActiveChamp tdgD�finitions, True
      
      With tdgD�finitions.PrintInfo
        .PageHeader = colChamps("tit_numgri") & " " & colChamps("tit_titre1") & " " & colChamps("tit_titre2")
        .PageFooter = Date & " " & Time & "\tPage \p"
        .RepeatColumnHeaders = True
        .PreviewCaption = "Grille " & colChamps("tit_numgri")
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
    
      BDActiveChamp tdgD�finitions, False
  End Select
End Sub



'=================================================================================
' Import de donn�es

Private Sub Cl�sImport(Optional ByRef tsCl�sLigne1 As Variant, Optional tsCl�sBase As Variant, Optional tsD�faut As Variant)
  If Not IsMissing(tsCl�sLigne1) Then tsCl�sLigne1 = Array("*NLoc", "Niv", "*Item")
  If Not IsMissing(tsCl�sBase) Then tsCl�sBase = Nothing
  If Not IsMissing(tsD�faut) Then tsD�faut = Array("", "3", "")
End Sub


Public Sub Importer()
  Dim tsCl�sL1 As Variant     ' Tableau des cl�s, * en pr�fixe des cl�s obligatoires
  Dim tsD�faut As Variant     ' Tableau des valeurs par d�faut, de m�me taille que le tableau des cl�s
  
  If iMode <> meNavigate Then
    MsgBox "S�lectionnez ou cr�ez un en-t�te de grille avant d'importer la structure.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Cl�sImport tsCl�sLigne1:=tsCl�sL1, tsD�faut:=tsD�faut
  Pr�pareImport Me, "Import de structure EH", tsCl�sL1, tsD�faut, frmImport
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
  iRec = 1
  
  Set h = frmImport.lvImport.ColumnHeaders
  For Each x In frmImport.lvImport.ListItems
    SetStatus "Traitement ligne " & iRec
    Dim sItem As String
    sItem = BDFiltreTexte(x.SubItems(3))
    iSerial = BDCurseurExpress("select it_numit from items where it_langue=" & sFormToSQL(bdcEdLangue, BDTypeCHAR) & " and it_libelle=" & sFormToSQL(sItem, BDTypeCHAR))
    If iSerial = 0 Then iSerial = frmItem.iCr�eItemD�faut(bdcEdLangue, sItem)
    
    xaTab.InsertRows iRec
    xaTab(iRec, 0) = iSerial
    xaTab(iRec, 1) = x.SubItems(1)    ' Nloc
    xaTab(iRec, 2) = x.SubItems(2)    ' Niv
    xaTab(iRec, 3) = sFormateItem(sItem, x.SubItems(2))
    
    xaTab(iRec, 4) = ""
    xaTab(iRec, 5) = ""
    
    x.Text = "Ok"
    iRec = iRec + 1
    DoEvents
  Next
  On Error Resume Next
  Unload frmItem
  On Error GoTo 0
  tdgD�finitions.Array = xaTab
  tdgD�finitions.ReBind
  
  bTabModifi� = True
  bTabModifSimple = False
  
  bdS�lTab.ButtonEnabled("change") = True

  frmImport.btnAnnuler.Enabled = True
  frmImport.btnAnnuler.Caption = "Fermer"
  Unload frmImport
  SetStatus
End Sub
