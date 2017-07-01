VERSION 5.00
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form frmCat2 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des catégories+définitions"
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
   Tag             =   "Données"
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
   Begin VB.Frame frlTraçabilité 
      Caption         =   "Traçabilité"
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
         Caption         =   "Modifié le :"
         Height          =   210
         Index           =   16
         Left            =   120
         TabIndex        =   13
         Top             =   660
         Width           =   1020
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Créé le :"
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
   Begin Statistiques.BDSélecteurTableau bdSélTab 
      Height          =   2040
      Left            =   60
      TabIndex        =   19
      TabStop         =   0   'False
      Top             =   3660
      Width           =   390
      _ExtentX        =   688
      _ExtentY        =   3598
   End
   Begin TrueOleDBGrid60.TDBGrid tdgDéfinitions 
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
   Begin Statistiques.BDSélecteur bdSél 
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
      Caption         =   "Catégorie :"
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
' Feuille de gestion des catégories et définitions
'  5/11/1999 PV

Option Explicit

Private cCat As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private bOpGénérale As Boolean

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private Const sTable = "nouvcat"

Private xaTab As XArrayDB                 ' Données du tableau
Private bTabModifié As Boolean            ' Optimisation de la gestion du tableau


'=================================================================================
' Actions de validation

Private Sub ValidateQuery()
  Assert iMode = meQuery
  
  Dim sWP As String
  Dim t As Control
  Dim bWPIntègreEtat As Boolean
  
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
  
  Dim cCatQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from nouvcat where " & sWP & " order by ncat_indice"
  
  cCatQuery.OpenCurseur sQuery
  iErr = Err
  If iErr Then sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    BDActiveFormulaire colChamps, True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cCat Is Nothing Then cCat.CloseCurseur
  Set cCat = cCatQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cCat.EOF And cCat.BOF) Then
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
  Dim iOld As Integer
  
  bOkValeurs = False
  ' $NC
  ' On regarde si le nom n'existe pas déjà
  Dim iSer As Long
  iSer = BDCurseurExpress("select ncat_indice from nouvcat where ncat_jeu=" & sFormToSQL(colChamps("ncat_jeu"), BDTypeINTEGER) & " and ncat_libelle=" & sFormToSQL(colChamps("ncat_libelle"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("ncat_indice") Then
    MsgBox "ATTENTION - Cette catégorie existe déjà dans ce jeu sous le n° " & iSer, vbExclamation, App.Title
    Exit Function
  End If
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  Dim cCatAdd As New BDCurseur
  cCatAdd.OpenCurseur "select * from nouvcat where ncat_jeu=0"
  cCatAdd.AddNew

' Génération du n° de catégorie, si nécessaire
  If colChamps("ncat_indice") = "" Then
    colChamps("ncat_indice") = 1 + NZ(BDCurseurExpress("select max (ncat_indice) from nouvcat where ncat_jeu=" & colChamps("ncat_jeu")))
    cCatAdd!ncat_indice = colChamps("ncat_indice")
  End If
    
  
' Traçabilité ancien style
  InitTraçabilité colChamps, "ncat", True

' Seuls les champs actifs sont mis à jour
  ActiveTraçabilité True
  ActiveChamp "ncat_indice", True
  
  If Not bPrépareEditAdd(cCatAdd, colColonnes, colChamps) Then
    cCatAdd.CloseCurseur
    ActiveTraçabilité False
    ActiveChamp "ncat_indice", False
    Exit Sub
  End If
  cCatAdd.CloseCurseur
 
  
' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cCat Is Nothing Then cCat.CloseCurseur
  Set cCat = New BDCurseur
  
  sFinalWP = "ncat_jeu=" & colChamps("ncat_jeu") & " and ncat_indice=" & colChamps("ncat_indice")
  sQuery = "select * from nouvcat where " & sFinalWP & " order by ncat_indice"
  cCat.OpenCurseur sQuery
  cCat.MoveFirst
  
  BDActiveFormulaire colChamps, False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  bdSél.EmpêcheMouvements
  
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cCat Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cCat.Edit
    
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "ncat", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
  
  If Not bPrépareEditAdd(cCat, colColonnes, colChamps) Then
    ActiveTraçabilité False
    Exit Sub
  End If

  BDActiveFormulaire colChamps, False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  AjusteMouvements
  
  PurgeCacheCatégorie colChamps("ncat_jeu"), colChamps("ncat_indice")
  
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
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
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cCat Is Nothing Then
    If Not (cCat.EOF And cCat.BOF) Then
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
  
  bdSélTab.ButtonEnabled = False    ' Pas d'action tableau pendant une interrogation
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, False
  BDActiveFormulaire colChamps, True
  
  colChamps("ncat_jeu").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cCat Is Nothing
  
  If cCat.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  bdSélTab.ButtonEnabled = False    ' Pas d'action tableau pendant un changement de tête
  
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "ncat_jeu", False
  ActiveChamp "ncat_idmodif", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  colChamps("ncat_libelle").SetFocus
  AutoSelect colChamps("ncat_libelle"), True
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
  
  bdSélTab.ButtonEnabled = False    ' Pas d'action tableau pendant un ajout
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "ncat_indice", False
  ActiveChamp "ncat_idmodif", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  colChamps("ncat_jeu").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cCat Is Nothing
  
  If cCat.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If


  Dim iNb As Integer
  iNb = BDCurseurExpress("select count(*) from defcat where dca_jeu=" & colChamps("ncat_jeu") & " and dca_categ=" & colChamps("ncat_indice"))
  If iNb > 0 Then
  MsgBox "Vous ne pouvez pas supprimer cette catégorie, il y " & iNb & " définitions de catégorie rattachées." & vbCrLf & vbCrLf & "Supprimez les définitions de catégorie avant de supprimer la catégorie.", vbExclamation, App.Title
  If Not bShiftPressed Then Exit Sub
  End If
  
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cCat.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  PurgeCacheCatégorie colChamps("ncat_jeu"), colChamps("ncat_indice")
  
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
  
  bdSél.ActiveMouvements iMode = meNavigate
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


'=================================================================================
' Traçabilité

Private Sub ActiveTraçabilité(bEnable As Boolean)
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

  bdSél.ButtonEnabled("First") = cCat.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cCat.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cCat.EOF
  bdSél.ButtonEnabled("Last") = Not cCat.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cCat.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
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


'=================================================================================
' Actions tableau

Public Sub ActionTabChange()
  Assert iMode = meNavigate
  Assert Not cCat Is Nothing
  
  BDActiveChamp tdgDéfinitions, True
  tdgDéfinitions.AllowAddNew = True
  tdgDéfinitions.AllowUpdate = True
  bdSél.ActiveMouvements False
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False

  bdSélTab.ButtonEnabled("Change") = False
  bdSélTab.ActiveValidation True
  bdSélTab.ButtonEnabled("InsertRow") = True
  bdSélTab.ButtonEnabled("DeleteRow") = True
  
  iMode = meChangeTab
  bTabModifié = False
  SélectionneCellule 1, 0
  tdgDéfinitions.SetFocus
End Sub


Private Sub ActionTabDeleteRow()
  Assert iMode = meChangeTab
  Assert Not cCat Is Nothing
  
  Dim fr As Integer, r As Integer
  If tdgDéfinitions.FirstRow = "" Then Exit Sub
  fr = tdgDéfinitions.FirstRow
  r = tdgDéfinitions.Row
  If fr + r <= xaTab.UpperBound(1) Then
    xaTab.DeleteRows fr + r
    tdgDéfinitions.ReBind
    tdgDéfinitions.FirstRow = fr
    tdgDéfinitions.Row = r
  End If
  bTabModifié = True
  
  tdgDéfinitions.SetFocus
End Sub


Private Sub ActionTabInsertRow()
  Assert iMode = meChangeTab
  Assert Not cCat Is Nothing
  
  Dim fr As Integer, r As Integer
  If tdgDéfinitions.FirstRow = "" Then
    fr = 1
  Else
    fr = tdgDéfinitions.FirstRow
  End If
  r = tdgDéfinitions.Row
  xaTab.InsertRows fr + r
  tdgDéfinitions.ReBind
  tdgDéfinitions.FirstRow = fr
  tdgDéfinitions.Row = r
  bTabModifié = True
  
  tdgDéfinitions.SetFocus
End Sub


Private Sub ActionTabValidate()
  Assert iMode = meChangeTab
  Assert Not cCat Is Nothing
  ' $NC
  If tdgDéfinitions.DataChanged Then
    tdgDéfinitions.Update
    DoEvents
  End If

  If bTabModifié Then   ' Optimisation si pas de modif
    
    ' Contrôle général des données
    Dim i As Integer, j As Integer
    For i = 1 To xaTab.UpperBound(1)
      If Not IsEmpty(xaTab(i, 0)) Or Not IsEmpty(xaTab(i, 1)) Or Not IsEmpty(xaTab(i, 2)) Or Not IsEmpty(xaTab(i, 3)) Then
        ' Détection de doublons dans la catégorie
        For j = i + 1 To xaTab.UpperBound(1)
          If Trim(CStr(xaTab(i, 0))) = Trim(CStr(xaTab(j, 0))) And _
             Trim(CStr(xaTab(i, 1))) = Trim(CStr(xaTab(j, 1))) And _
             Trim(CStr(xaTab(i, 2))) = Trim(CStr(xaTab(j, 2))) And _
             Trim(CStr(xaTab(i, 3))) = Trim(CStr(xaTab(j, 3))) And _
             Trim(CStr(xaTab(i, 4))) = Trim(CStr(xaTab(j, 4))) Then
            MsgBox "La définition " & xaTab(i, 0) & "." & xaTab(i, 1) & "." & xaTab(i, 2) & "." & xaTab(i, 3) & "." & xaTab(i, 4) & " est présente plusieurs fois. Supprimez les définitions multiples avant de valider.", vbExclamation, App.Title
            SélectionneCellule i, 0
            Exit Sub
          End If
        Next

      End If    ' if not isempty
    Next

    ' Tests Ok, on peut mettre à jour la base de données
    SetStatus "Mise à jour de la base de données..."
    Screen.MousePointer = vbHourglass
    
    Dim dBDTime As Date
    dBDTime = BDTime
    
    RunSQL "delete from defcat where dca_jeu=" & sFormToSQL(colChamps("ncat_jeu"), BDTypeINTEGER) & " and dca_categ=" & sFormToSQL(colChamps("ncat_indice"), BDTypeINTEGER)
    Dim cr As New BDCurseur
    cr.OpenCurseur "select * from defcat where dca_jeu=0"
    For i = 1 To xaTab.UpperBound(1)
      If Not IsEmpty(xaTab(i, 0)) Or Not IsEmpty(xaTab(i, 1)) Or Not IsEmpty(xaTab(i, 2)) Or Not IsEmpty(xaTab(i, 3)) Or Not IsEmpty(xaTab(i, 4)) Then
        SetStatus "Mise à jour de la base de données... " & i & "/" & xaTab.UpperBound(1)
        cr.AddNew
        cr!dca_jeu = colChamps("ncat_jeu")
        cr!dca_categ = colChamps("ncat_indice")
        cr!dca_indice = 0      ' Serial, généré automatiquement par la base
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
          If InStr(sErr, "duplicate") <> 0 Then sErr = sErr & vbCrLf & vbCrLf & "Le type " & VN(xaTab(i, 0)) & "." & VN(xaTab(i, 1)) & "." & VN(xaTab(i, 2)) & "." & VN(xaTab(i, 3)) & "." & VN(xaTab(i, 4)) & " est utilisé dans une autre catégorie du jeu, et la création de doublon est interdite."
          MsgBox "Échec lors de l'écriture des données." & vbCrLf & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
        End If
      
      End If
    Next
  
    cr.CloseCurseur
    Screen.MousePointer = vbDefault
    SetStatus
  End If    ' if bTabModifié
  
  BDActiveChamp tdgDéfinitions, False
  tdgDéfinitions.AllowAddNew = False
  tdgDéfinitions.AllowUpdate = False
  bdSélTab.ButtonEnabled = False
  bdSélTab.ButtonEnabled("Change") = True
  
  bdSél.ActiveMouvements True
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.SetFocus
  
  If bTabModifié Then SynchroniseFormulaire     ' Réffiche la liste triée
  
  iMode = meNavigate
End Sub

Private Sub SélectionneCellule(i As Integer, c As Integer)
  On Error Resume Next
  tdgDéfinitions.Row = i - tdgDéfinitions.FirstRow
  If Err Then
    tdgDéfinitions.FirstRow = i
    tdgDéfinitions.Row = 0
  End If
  On Error GoTo 0
  tdgDéfinitions.col = c
  tdgDéfinitions.SetFocus
End Sub

Private Sub ActionTabCancel()
  Assert iMode = meChangeTab
  Assert Not cCat Is Nothing
  
  BDActiveChamp tdgDéfinitions, False
  tdgDéfinitions.AllowAddNew = False
  tdgDéfinitions.AllowUpdate = False
  bdSélTab.ButtonEnabled = False
  bdSélTab.ButtonEnabled("Change") = True
  
  bdSél.ActiveMouvements True
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.SetFocus
  
  If bTabModifié Or tdgDéfinitions.DataChanged Then SynchroniseFormulaire   ' Restore le tableau précédent
  
  iMode = meNavigate
End Sub


Private Sub Form_Resize()
  On Error Resume Next
  tdgDéfinitions.Width = Me.ScaleWidth - tdgDéfinitions.Left - 4
  tdgDéfinitions.Height = Me.ScaleHeight - tdgDéfinitions.Top - 4
End Sub


Private Sub tdgDéfinitions_AfterInsert()
  bTabModifié = True
End Sub

Private Sub tdgDéfinitions_AfterUpdate()
  bTabModifié = True
  If iMode = meChangeTab Then
    Dim fr As Integer, r As Integer
    If tdgDéfinitions.FirstRow = "" Then
      fr = 1
    Else
      fr = tdgDéfinitions.FirstRow
    End If
    If tdgDéfinitions.Row = -1 Then
      r = xaTab.UpperBound(1)
    Else
      r = fr + tdgDéfinitions.Row
    End If
    
    xaTab(r, 5) = sType(Val(xaTab(r, 0)), Val(xaTab(r, 1)), Val(xaTab(r, 2)), Val(xaTab(r, 3)), Val(xaTab(r, 4)))
    
    ' On réaffiche
    tdgDéfinitions.RefetchRow r
  End If
End Sub


'=================================================================================
' Actions du sélecteur tableau

Private Sub bdSélTab_ActionTabChange():     ActionTabChange:    End Sub
Private Sub bdSélTab_ActionTabDeleteRow():  ActionTabDeleteRow: End Sub
Private Sub bdSélTab_ActionTabInsertRow():  ActionTabInsertRow: End Sub
Private Sub bdSélTab_ActionTabValidate():   ActionTabValidate:  End Sub
Private Sub bdSélTab_ActionTabCancel():     ActionTabCancel:    End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  bdSél.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If KeyAscii = Asc("t") Or KeyAscii = Asc("T") Then
    If bdSélTab.ButtonEnabled("Change") Then
      KeyAscii = 0
      ActionTabChange
    End If
  Else
    If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
  End If
End Sub

Private Sub tdgDéfinitions_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
  If tdgDéfinitions.Text = "" Then Exit Sub
  If Not IsNumeric(tdgDéfinitions.Text) Then
    MsgBox "Type incorrect (non numérique).", vbExclamation, App.Title
    Cancel = True
    Exit Sub
  End If
  If tdgDéfinitions.Text < 0 Or tdgDéfinitions.Text > 100000 Then
    MsgBox "Type incorrect (<0 ou >100000).", vbExclamation, App.Title
    Cancel = True
    Exit Sub
  End If
End Sub

Private Sub tdgDéfinitions_KeyDown(KeyCode As Integer, Shift As Integer)
  bdSélTab.KeyDown KeyCode, Shift
End Sub

Private Sub txtChamp_DblClick(Index As Integer)
  If iMode = meAdd And txtChamp(Index).DataField = "ncat_indice" Then
    ActiveChamp "ncat_indice", True
  End If
End Sub

' Filtrage des Entrée intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  If Not bExisteTable(sTable) Then
    MsgBox "La table '" & sTable & "' n'est pas présente dans la base de données courante, affichage impossible.", vbCritical, App.Title
    Unload Me
    Exit Sub
  End If
  
  Show
  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  
  ' Chargement des combos
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcOperModif.AddItem u.uti_numuti, u.uti_nom
  Next

  ' Préparation de la grille
  With tdgDéfinitions
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
    .Columns(1).Caption = "T2/N°"
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
  
  BDActiveChamp tdgDéfinitions, False

  ' Formulaire en mode initial
  Set cCat = Nothing
  BDActiveFormulaire colChamps, False
  bdSél.LectureSeule = bLectureSeule
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSélTab.ButtonEnabled = False

  iMode = meEmpty
    
  bdSél.SetFocus
  
  SetMessage
  SetStatus
  sFinalWP = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meChangeTab Or iMode = meQuery Then
    MsgBox "Terminez l'opération en cours avant de fermer la fenêtre !", vbCritical, App.Title
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
    
    ' On efface les champs qui seront affichés par le timer
    txtJeu = ""
    txtJeu.Refresh
    
    
    bdSél.NumRec = cCat.AbsolutePosition
    ActiveTimer mtRapide              ' Mise à jour en arrière plan
    bdSélTab.ButtonEnabled = False    ' Aucune commande de tableau disponible
    EffaceTableau
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cCat.bEffacé = True
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
  
  BDActiveChamp tdgDéfinitions, False
  
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
  tdgDéfinitions.Array = xaTab
  tdgDéfinitions.ReBind
  bdSélTab.ButtonEnabled("change") = True
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  txtJeu = ""
  bdSél.NumRec = ""
  EffaceTableau
End Sub

Private Sub EffaceTableau()
  xaTab.ReDim 1, 0, 0, 5
  tdgDéfinitions.ReBind
End Sub


' Activation du timer de mise à jour des champs satellites
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

Private Sub bdSél_GotFocus()
  SetStatus
End Sub

Private Sub bdcOperCreat_GotFocus()
  SetStatus bdcOperCreat.Tag
End Sub

Private Sub bdcOperModif_GotFocus()
  SetStatus bdcOperModif.Tag
End Sub

Private Sub tdgDéfinitions_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
  Select Case tdgDéfinitions.col
    Case 0: SetStatus "Définition du type T1"
    Case 1: SetStatus "Définition du type T2"
    Case 2: SetStatus "Définition du type T3"
    Case 3: SetStatus "Définition du type T4"
    Case 4: SetStatus "Définition du type T5"
  End Select
End Sub

Private Sub txtChamp_LostFocus(Index As Integer)
'Mise à jour du champ txt_jeu
  If txtChamp(Index).DataField = "ncat_jeu" Then
    If IsNumeric(txtChamp(Index)) Then
        txtJeu = sGetJeu(txtChamp(Index))
    Else
        txtJeu = ""
    End If
  End If
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
  BDCopieSélection cCat, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub

'=================================================================================
' Impression

Public Sub Imprime()
  DoEtat True
End Sub

Public Sub Aperçu()
  DoEtat False
End Sub

Private Sub DoEtat(ByVal bImpression As Boolean)
  Dim iChoix As Integer
  
  iChoix = frmMessageChoix.ChoixEtat("Édition des catégories", "Édition des définitions de catégorie")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
End Sub


Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  
  Select Case iChoix
    Case 1:
    ' Le "on error resume next" sert à éviter une erreur 13:Type incompatible, venue de dieu sait où et impossible à localiser...
      Dim sSQL As String
      sSQL = "select * from nouvcat where " & sFinalWP
      On Error Resume Next
      BDEtat sSQL, drCatégorie, bImpression
      On Error GoTo 0
    
    Case 2:
      ' Impression sur fond blanc
      BDActiveChamp tdgDéfinitions, True
      
      With tdgDéfinitions.PrintInfo
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
    
      BDActiveChamp tdgDéfinitions, False
  End Select
End Sub

