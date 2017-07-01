VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form frmCat2 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des cat�gories+d�finitions"
   ClientHeight    =   6390
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8820
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmCat2.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   426
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   588
   Tag             =   "Donn�es"
   Begin VB.TextBox txtChamp 
      DataField       =   "*ncat_jeu"
      Height          =   315
      Index           =   1
      Left            =   1440
      TabIndex        =   1
      Top             =   480
      Width           =   615
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ncat_comment"
      Height          =   315
      Index           =   4
      Left            =   1440
      TabIndex        =   7
      Top             =   1260
      Width           =   7320
   End
   Begin VB.TextBox txtJeu 
      BackColor       =   &H80000000&
      Height          =   315
      Left            =   2160
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   480
      Width           =   6600
   End
   Begin VB.Frame frlTra�abilit� 
      Caption         =   "Tra�abilit�"
      Height          =   1755
      Left            =   60
      TabIndex        =   8
      Top             =   1680
      Width           =   8715
      Begin VB.TextBox txtChamp 
         DataField       =   "ncat_idmodif"
         Height          =   315
         Index           =   0
         Left            =   1620
         TabIndex        =   22
         Tag             =   "Origine de la modification"
         Top             =   960
         Width           =   3810
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "ncat_heuremodif"
         Height          =   315
         Index           =   8
         Left            =   2700
         TabIndex        =   15
         Top             =   600
         Width           =   975
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "ncat_datemodif"
         Height          =   315
         Index           =   7
         Left            =   1620
         TabIndex        =   14
         Top             =   600
         Width           =   1035
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "ncat_heurecreat"
         Height          =   315
         Index           =   6
         Left            =   2700
         TabIndex        =   11
         Top             =   240
         Width           =   975
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "ncat_datecreat"
         Height          =   315
         Index           =   5
         Left            =   1620
         TabIndex        =   10
         Top             =   240
         Width           =   1035
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   10
         Left            =   1620
         TabIndex        =   18
         Top             =   1320
         Width           =   2055
      End
      Begin Statistiques.BDCombo bdcOperCreat 
         Height          =   330
         Left            =   3720
         TabIndex        =   12
         Top             =   240
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
         DataField       =   "ncat_opercreat"
      End
      Begin Statistiques.BDCombo bdcOperModif 
         Height          =   330
         Left            =   3720
         TabIndex        =   16
         Top             =   600
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
         DataField       =   "ncat_opermodif"
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Origine modif :"
         Height          =   210
         Index           =   1
         Left            =   120
         TabIndex        =   23
         Top             =   1020
         Width           =   1380
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifi� le :"
         Height          =   210
         Index           =   16
         Left            =   120
         TabIndex        =   13
         Top             =   660
         Width           =   1020
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Cr�� le :"
         Height          =   210
         Index           =   17
         Left            =   120
         TabIndex        =   9
         Top             =   300
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   17
         Top             =   1380
         Width           =   1155
      End
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ncat_libelle"
      Height          =   315
      Index           =   3
      Left            =   2160
      MaxLength       =   35
      TabIndex        =   5
      Top             =   840
      Width           =   6600
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ncat_indice"
      Height          =   315
      Index           =   2
      Left            =   1440
      TabIndex        =   4
      Top             =   840
      Width           =   615
   End
   Begin Statistiques.BDS�lecteurTableau bdS�lTab 
      Height          =   2040
      Left            =   60
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   3660
      Width           =   390
      _ExtentX        =   688
      _ExtentY        =   3598
   End
   Begin TrueOleDBGrid60.TDBGrid tdgD�finitions 
      Height          =   2595
      Left            =   540
      OleObjectBlob   =   "frmCat2.frx":014A
      TabIndex        =   20
      TabStop         =   0   'False
      Top             =   3660
      Width           =   8235
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   720
      Top             =   480
   End
   Begin Statistiques.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   21
      Top             =   0
      Width           =   8820
      _ExtentX        =   15558
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
      Caption         =   "Jeu :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   450
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Remarques :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   6
      Top             =   1320
      Width           =   1200
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Cat�gorie :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   3
      Top             =   900
      Width           =   1065
   End
End
Attribute VB_Name = "frmCat2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmCat2
' Feuille de gestion des cat�gories et d�finitions
'  5/11/1999 PV

Option Explicit

Private cCat As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition             ' Mode du formulaire
Private bOpG�n�rale As Boolean

Private sFinalWP As String                ' Where-part de la requ�te SQL courante
Private sQuery As String                  ' Query de la s�lection en cours

Private Const sTable = "nouvcat"

Private xaTab As XArrayDB                 ' Donn�es du tableau
Private bTabModifi� As Boolean            ' Optimisation de la gestion du tableau


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
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cCatQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from nouvcat where " & sWP & " order by ncat_indice"
  
  cCatQuery.OpenCurseur sQuery
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
  If Not cCat Is Nothing Then cCat.CloseCurseur
  Set cCat = cCatQuery
  sFinalWP = sWP
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cCat.EOF And cCat.BOF) Then
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
  ' On regarde si le nom n'existe pas d�j�
  Dim iSer As Long
  iSer = BDCurseurExpress("select ncat_indice from nouvcat where ncat_jeu=" & sFormToSQL(colChamps("ncat_jeu"), BDTypeINTEGER) & " and ncat_libelle=" & sFormToSQL(colChamps("ncat_libelle"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("ncat_indice") Then
    MsgBox "ATTENTION - Cette cat�gorie existe d�j� dans ce jeu sous le n� " & iSer, vbExclamation, App.Title
    Exit Function
  End If
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  Dim cCatAdd As New BDCurseur
  cCatAdd.OpenCurseur "select * from nouvcat where ncat_jeu=0"
  cCatAdd.AddNew

' G�n�ration du n� de cat�gorie, si n�cessaire
  If colChamps("ncat_indice") = "" Then
    colChamps("ncat_indice") = 1 + NZ(BDCurseurExpress("select max (ncat_indice) from nouvcat where ncat_jeu=" & colChamps("ncat_jeu")))
    cCatAdd!ncat_indice = colChamps("ncat_indice")
  End If
    
  
' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "ncat", True

' Seuls les champs actifs sont mis � jour
  ActiveTra�abilit� True
  ActiveChamp "ncat_indice", True
  
  If Not bPr�pareEditAdd(cCatAdd, colColonnes, colChamps) Then
    cCatAdd.CloseCurseur
    ActiveTra�abilit� False
    ActiveChamp "ncat_indice", False
    Exit Sub
  End If
  cCatAdd.CloseCurseur
 
  
' Tout est Ok, on s�lectionne l'enregistrement qu'on vient d'ajouter
  If Not cCat Is Nothing Then cCat.CloseCurseur
  Set cCat = New BDCurseur
  
  sFinalWP = "ncat_jeu=" & colChamps("ncat_jeu") & " and ncat_indice=" & colChamps("ncat_indice")
  sQuery = "select * from nouvcat where " & sFinalWP & " order by ncat_indice"
  cCat.OpenCurseur sQuery
  cCat.MoveFirst
  
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
  Assert Not cCat Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cCat.Edit
    
  ' Tra�abilit� ancien style
  InitTra�abilit� colChamps, "ncat", False
  ActiveTra�abilit� True     ' Pour mettre � jour la base
  
  If Not bPr�pareEditAdd(cCat, colColonnes, colChamps) Then
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
  
  PurgeCacheCat�gorie colChamps("ncat_jeu"), colChamps("ncat_indice")
  
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
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cCat Is Nothing Then
    If Not (cCat.EOF And cCat.BOF) Then
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
  
  colChamps("ncat_jeu").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cCat Is Nothing
  
  If cCat.bEffac� Then
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
  ActiveChamp "ncat_jeu", False
  ActiveChamp "ncat_idmodif", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
  
  colChamps("ncat_libelle").SetFocus
  AutoSelect colChamps("ncat_libelle"), True
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
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "ncat_indice", False
  ActiveChamp "ncat_idmodif", False
  ActiveChamp "timestamp", False
  ActiveTra�abilit� False
  
  colChamps("ncat_jeu").SetFocus
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cCat Is Nothing
  
  If cCat.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If


  Dim iNb As Integer
  iNb = BDCurseurExpress("select count(*) from defcat where dca_jeu=" & colChamps("ncat_jeu") & " and dca_categ=" & colChamps("ncat_indice"))
  If iNb > 0 Then
  MsgBox "Vous ne pouvez pas supprimer cette cat�gorie, il y " & iNb & " d�finitions de cat�gorie rattach�es." & vbCrLf & vbCrLf & "Supprimez les d�finitions de cat�gorie avant de supprimer la cat�gorie.", vbExclamation, App.Title
  If Not bShiftPressed Then Exit Sub
  End If
  
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est d�finitive." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cCat.Delete
  If Err Then
    AfficheErreurODBC "�chec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  PurgeCacheCat�gorie colChamps("ncat_jeu"), colChamps("ncat_indice")
  
  cCat.MoveNext
  If cCat.EOF Then
    cCat.MovePrevious
    If cCat.BOF Then
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
  ActiveChamp "ncat_datecreat", bEnable
  ActiveChamp "ncat_heurecreat", bEnable
  ActiveChamp "ncat_opercreat", bEnable
  ActiveChamp "ncat_datemodif", bEnable
  ActiveChamp "ncat_heuremodif", bEnable
  ActiveChamp "ncat_opermodif", bEnable
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cCat Is Nothing

  bdS�l.ButtonEnabled("First") = cCat.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cCat.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cCat.EOF
  bdS�l.ButtonEnabled("Last") = Not cCat.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cCat.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours�"
  cCat.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cCat.MoveNext
  AjusteMouvements
  If cCat.EOF Then cCat.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cCat.MovePrevious
  AjusteMouvements
  If cCat.BOF Then cCat.MoveFirst
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
  Assert Not cCat Is Nothing
  
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
  S�lectionneCellule 1, 0
  tdgD�finitions.SetFocus
End Sub


Private Sub ActionTabDeleteRow()
  Assert iMode = meChangeTab
  Assert Not cCat Is Nothing
  
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
  
  tdgD�finitions.SetFocus
End Sub


Private Sub ActionTabInsertRow()
  Assert iMode = meChangeTab
  Assert Not cCat Is Nothing
  
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
  
  tdgD�finitions.SetFocus
End Sub


Private Sub ActionTabValidate()
  Assert iMode = meChangeTab
  Assert Not cCat Is Nothing
  ' $NC
  If tdgD�finitions.DataChanged Then
    tdgD�finitions.Update
    DoEvents
  End If

  If bTabModifi� Then   ' Optimisation si pas de modif
    
    ' Contr�le g�n�ral des donn�es
    Dim i As Integer, j As Integer
    For i = 1 To xaTab.UpperBound(1)
      If Not IsEmpty(xaTab(i, 0)) Or Not IsEmpty(xaTab(i, 1)) Or Not IsEmpty(xaTab(i, 2)) Or Not IsEmpty(xaTab(i, 3)) Then
        ' D�tection de doublons dans la cat�gorie
        For j = i + 1 To xaTab.UpperBound(1)
          If Trim(CStr(xaTab(i, 0))) = Trim(CStr(xaTab(j, 0))) And _
             Trim(CStr(xaTab(i, 1))) = Trim(CStr(xaTab(j, 1))) And _
             Trim(CStr(xaTab(i, 2))) = Trim(CStr(xaTab(j, 2))) And _
             Trim(CStr(xaTab(i, 3))) = Trim(CStr(xaTab(j, 3))) And _
             Trim(CStr(xaTab(i, 4))) = Trim(CStr(xaTab(j, 4))) Then
            MsgBox "La d�finition " & xaTab(i, 0) & "." & xaTab(i, 1) & "." & xaTab(i, 2) & "." & xaTab(i, 3) & "." & xaTab(i, 4) & " est pr�sente plusieurs fois. Supprimez les d�finitions multiples avant de valider.", vbExclamation, App.Title
            S�lectionneCellule i, 0
            Exit Sub
          End If
        Next

      End If    ' if not isempty
    Next

    ' Tests Ok, on peut mettre � jour la base de donn�es
    SetStatus "Mise � jour de la base de donn�es..."
    Screen.MousePointer = vbHourglass
    
    Dim dBDTime As Date
    dBDTime = BDTime
    
    RunSQL "delete from defcat where dca_jeu=" & sFormToSQL(colChamps("ncat_jeu"), BDTypeINTEGER) & " and dca_categ=" & sFormToSQL(colChamps("ncat_indice"), BDTypeINTEGER)
    Dim cr As New BDCurseur
    cr.OpenCurseur "select * from defcat where dca_jeu=0"
    For i = 1 To xaTab.UpperBound(1)
      If Not IsEmpty(xaTab(i, 0)) Or Not IsEmpty(xaTab(i, 1)) Or Not IsEmpty(xaTab(i, 2)) Or Not IsEmpty(xaTab(i, 3)) Or Not IsEmpty(xaTab(i, 4)) Then
        SetStatus "Mise � jour de la base de donn�es... " & i & "/" & xaTab.UpperBound(1)
        cr.AddNew
        cr!dca_jeu = colChamps("ncat_jeu")
        cr!dca_categ = colChamps("ncat_indice")
        cr!dca_indice = 0      ' Serial, g�n�r� automatiquement par la base
        If Val(xaTab(i, 0)) = 5 Then
          cr!dca_t1 = Null
          cr!dca_t2 = Null
          cr!dca_t3 = Null
          cr!dca_t4 = Null
          cr!dca_t5 = Null
          cr!dca_numpro = Val(xaTab(i, 1))
        Else
          cr!dca_t1 = VN(xaTab(i, 0))
          cr!dca_t2 = VN(xaTab(i, 1))
          cr!dca_t3 = VN(xaTab(i, 2))
          cr!dca_t4 = VN(xaTab(i, 3))
          cr!dca_t5 = VN(xaTab(i, 4))
          cr!dca_numpro = Null
        End If
        cr!timestamp = dBDTime
        
        Dim iErr As Long, sErr As String
        On Error Resume Next
        cr.Update
        iErr = Err.Number
        If iErr Then sErr = sAjusteMessageODBC(Error)
        On Error GoTo 0
        If iErr Then
          cr.CancelUpdate
          If InStr(sErr, "duplicate") <> 0 Then sErr = sErr & vbCrLf & vbCrLf & "Le type " & VN(xaTab(i, 0)) & "." & VN(xaTab(i, 1)) & "." & VN(xaTab(i, 2)) & "." & VN(xaTab(i, 3)) & "." & VN(xaTab(i, 4)) & " est utilis� dans une autre cat�gorie du jeu, et la cr�ation de doublon est interdite."
          MsgBox "�chec lors de l'�criture des donn�es." & vbCrLf & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
        End If
      
      End If
    Next
  
    cr.CloseCurseur
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
  Assert Not cCat Is Nothing
  
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


Private Sub Form_Resize()
  On Error Resume Next
  tdgD�finitions.Width = Me.ScaleWidth - tdgD�finitions.Left - 4
  tdgD�finitions.Height = Me.ScaleHeight - tdgD�finitions.Top - 4
End Sub


Private Sub tdgD�finitions_AfterInsert()
  bTabModifi� = True
End Sub

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
    
    xaTab(r, 5) = sType(Val(xaTab(r, 0)), Val(xaTab(r, 1)), Val(xaTab(r, 2)), Val(xaTab(r, 3)), Val(xaTab(r, 4)))
    
    ' On r�affiche
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

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  bdS�l.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
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
  If tdgD�finitions.Text = "" Then Exit Sub
  If Not IsNumeric(tdgD�finitions.Text) Then
    MsgBox "Type incorrect (non num�rique).", vbExclamation, App.Title
    Cancel = True
    Exit Sub
  End If
  If tdgD�finitions.Text < 0 Or tdgD�finitions.Text > 100000 Then
    MsgBox "Type incorrect (<0 ou >100000).", vbExclamation, App.Title
    Cancel = True
    Exit Sub
  End If
End Sub

Private Sub tdgD�finitions_KeyDown(KeyCode As Integer, Shift As Integer)
  bdS�lTab.KeyDown KeyCode, Shift
End Sub

Private Sub txtChamp_DblClick(Index As Integer)
  If iMode = meAdd And txtChamp(Index).DataField = "ncat_indice" Then
    ActiveChamp "ncat_indice", True
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
  
  Show
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  
  ' Chargement des combos
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcOperModif.AddItem u.uti_numuti, u.uti_nom
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
    
    .Columns(0).Caption = "T1/5"
    .Columns(1).Caption = "T2/N�"
    .Columns(2).Caption = "T3"
    .Columns(3).Caption = "T4"
    .Columns(4).Caption = "T5"
    .Columns(5).Caption = "Type"
  
    Dim i As Integer
    For i = 0 To 4
      If i = 1 Then
        .Columns(i).Width = 50
      Else
        .Columns(i).Width = 40
      End If
      .Columns(i).DataWidth = 5
    Next
    .Columns(5).Width = 320
    .Columns(5).Locked = True
    .Columns(5).BackColor = RGB(220, 220, 220)
    
    Set xaTab = New XArrayDB
    .Array = xaTab
    EffaceTableau
  End With
  
  BDActiveChamp tdgD�finitions, False

  ' Formulaire en mode initial
  Set cCat = Nothing
  BDActiveFormulaire colChamps, False
  bdS�l.LectureSeule = bLectureSeule
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�lTab.ButtonEnabled = False

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
  If Not cCat Is Nothing Then cCat.CloseCurseur
  MDIStatistiques.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cCat Is Nothing Then
    EffaceFormulaire
  ElseIf cCat.BOF And cCat.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cCat.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cCat.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    ' On efface les champs qui seront affich�s par le timer
    txtJeu = ""
    txtJeu.Refresh
    
    
    bdS�l.NumRec = cCat.AbsolutePosition
    ActiveTimer mtRapide              ' Mise � jour en arri�re plan
    bdS�lTab.ButtonEnabled = False    ' Aucune commande de tableau disponible
    EffaceTableau
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cCat.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  ' Affichage des champs satellites
  If colChamps("ncat_jeu") <> "" Then
    txtJeu = sGetJeu(colChamps("ncat_jeu"))
    txtJeu.Refresh
  End If
  
  BDActiveChamp tdgD�finitions, False
  
  Dim cV As New BDCurseur
  cV.OpenCurseur "select dca_t1,dca_t2,dca_t3,dca_t4,dca_t5,dca_numpro" & _
                 "  from defcat" & _
                 "  where dca_jeu=" & colChamps("ncat_jeu") & " and dca_categ=" & colChamps("ncat_indice") & _
                 "  order by dca_indice"
  Dim iRec As Integer
  iRec = 1
  Do Until cV.EOF
    xaTab.InsertRows iRec
    If IsNull(cV!dca_numpro) Then
      xaTab(iRec, 0) = NV(cV!dca_t1)
      xaTab(iRec, 1) = NV(cV!dca_t2)
      xaTab(iRec, 2) = NV(cV!dca_t3)
      xaTab(iRec, 3) = NV(cV!dca_t4)
      xaTab(iRec, 4) = NV(cV!dca_t5)
      xaTab(iRec, 5) = sType(NZ(cV!dca_t1), NZ(cV!dca_t2), NZ(cV!dca_t3), NZ(cV!dca_t4), NZ(cV!dca_t5))
    Else
      xaTab(iRec, 0) = 5
      xaTab(iRec, 1) = NV(cV!dca_numpro)
      xaTab(iRec, 5) = sType(5, NV(cV!dca_numpro), 0, 0, 0)
    End If
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
  txtJeu = ""
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
  SetStatus bdcOperModif.Tag
End Sub

Private Sub tdgD�finitions_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
  Select Case tdgD�finitions.col
    Case 0: SetStatus "D�finition du type T1"
    Case 1: SetStatus "D�finition du type T2"
    Case 2: SetStatus "D�finition du type T3"
    Case 3: SetStatus "D�finition du type T4"
    Case 4: SetStatus "D�finition du type T5"
  End Select
End Sub

Private Sub txtChamp_LostFocus(Index As Integer)
'Mise � jour du champ txt_jeu
  If txtChamp(Index).DataField = "ncat_jeu" Then
    If IsNumeric(txtChamp(Index)) Then
        txtJeu = sGetJeu(txtChamp(Index))
    Else
        txtJeu = ""
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
  BDCopieS�lection cCat, colChamps, bdS�l
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
  
  iChoix = frmMessageChoix.ChoixEtat("�dition des cat�gories", "�dition des d�finitions de cat�gorie")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
End Sub


Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  
  Select Case iChoix
    Case 1:
    ' Le "on error resume next" sert � �viter une erreur 13:Type incompatible, venue de dieu sait o� et impossible � localiser...
      Dim sSQL As String
      sSQL = "select * from nouvcat where " & sFinalWP
      On Error Resume Next
      BDEtat sSQL, drCat�gorie, bImpression
      On Error GoTo 0
    
    Case 2:
      ' Impression sur fond blanc
      BDActiveChamp tdgD�finitions, True
      
      With tdgD�finitions.PrintInfo
'        .PageHeader = colChamps("dca_jeu") & " " & colChamps("dca_indice") & " " & colChamps("dca_categ")
        .PageFooter = Date & " " & Time & "\tPage \p"
        .RepeatColumnHeaders = True
 '       .PreviewCaption = "Jeu " & colChamps("dca_jeu")
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

