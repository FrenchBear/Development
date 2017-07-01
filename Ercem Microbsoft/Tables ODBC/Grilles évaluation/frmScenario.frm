VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{0D6234D1-DBA2-11D1-B5DF-0060976089D0}#6.0#0"; "TODG6.OCX"
Begin VB.Form frmScénario 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Scénarios"
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
   Tag             =   "Données"
   Begin VB.Frame fraFeuille 
      BorderStyle     =   0  'None
      Height          =   4395
      Index           =   1
      Left            =   120
      TabIndex        =   28
      Top             =   1080
      Visible         =   0   'False
      Width           =   9075
      Begin VB.TextBox txtTitreScénario 
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
      Begin GrillesEvaluation.BDSélecteurTableau bdSélTab 
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
         Caption         =   "Scénario :"
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
         Caption         =   "N° grille :"
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
         Caption         =   "Validé le :"
         Height          =   210
         Index           =   1
         Left            =   0
         TabIndex        =   20
         Top             =   780
         Width           =   930
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifié le :"
         Height          =   210
         Index           =   16
         Left            =   0
         TabIndex        =   16
         Top             =   420
         Width           =   1020
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Créé le :"
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
            Caption         =   "Tête"
            Key             =   "Tête"
            Object.ToolTipText     =   "Informations générales sur la grille"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Traçabilité"
            Key             =   "Traçabilité"
            Object.ToolTipText     =   "Traçabilité relative à la grille"
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
   Begin GrillesEvaluation.BDSélecteur bdSél 
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
Attribute VB_Name = "frmScénario"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmScenario
' Feuille de gestion des scénarios des grilles
' 24/11/1999 NC
'  9/06/2000 PV  Impression n° scénario et fond blanc
' 11/07/2000 PV  Import de données
' 31/08/2000 PV  Impression des titres
' 17/04/2001 PV  Gestion du mode lecture seule au niveau du tableau
' 24/07/2001 PV  Modif corps --> MAJ traçabilité tête


Option Explicit

Private cSce As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private bOpGénérale As Boolean

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private Const sTable = "scenario"

Private xaTab As XArrayDB                 ' Données du tableau
Private bTabModifié As Boolean            ' Optimisation de la gestion du tableau

Private iCurFrame As Integer              ' Cadre courant visible


'=================================================================================
' Gestion des onglets

' Change le frame affiché
Private Sub Page(ByVal sPage)
  ' On ne change que l'onglet, ce code appelle automatiquement tsTab_Click
  Set tsTab.SelectedItem = tsTab.Tabs(sPage)
End Sub


Private Sub tsTab_Click()
  ' Utilise le mécanisme visible/invisible comme il est conseillé dans l'aide
  ' et contrairement à la doc qui prône l'usage du ZOrder…
  ' Avantage: (entre autres, voir l'aide) évite les conflits d'accélérateurs entre pages
  If tsTab.SelectedItem.Index = iCurFrame Then Exit Sub     ' Inutile de changer le cadre.
  ' Sinon, masque l'ancien cadre et affiche le nouveau.
  fraFeuille(tsTab.SelectedItem.Index).Visible = True
  If iCurFrame >= 0 Then fraFeuille(iCurFrame).Visible = False
  ' Affecte la nouvelle valeur à iCurFrame.
  iCurFrame = tsTab.SelectedItem.Index

  ' Accompagnement du focus
  ' Ça serait pas mal de mémoriser page par page le contrôle qui a le focus au moment
  ' du changement de focus, de façon à restaurer le focus sur ce contrôle
  ' mais il faut traiter le fait que c'est le contrôle tabstop qui prend le focus
  ' quand on clique dessus (pas sûr il me semble, c'est au 2ème clic qu'il prend le focus !!!)
  DoEvents
  Select Case tsTab.SelectedItem.Key
    Case "Tête": txtChamp(1).SetFocus
    Case "Traçabilité": txtChamp(5).SetFocus
    Case Else: Stop
  End Select
End Sub

Private Sub Form_Resize()
  If ScaleHeight < 250 Or ScaleWidth < 550 Then Exit Sub
  
  ' On retaille le tabstrip…
  tsTab.Move 2, 31, ScaleWidth - 4, ScaleHeight - 35
  
  ' Puis les frames contenant les contrôles
  Dim F As Frame
  For Each F In fraFeuille
    F.Move tsTab.ClientLeft + 2, tsTab.ClientTop + 6, tsTab.ClientWidth - 2, tsTab.ClientHeight - 4
  Next
  
  ' Puis le contenu des frames
  txtTitre.Width = fraFeuille(1).Width * Screen.TwipsPerPixelX - txtTitre.Left - 50
  txtTitreScénario.Width = fraFeuille(1).Width * Screen.TwipsPerPixelX - txtTitreScénario.Left - 50
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
    bdSél.KeyDown KeyCode
  End If
End Sub


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
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If

  Dim cSceQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from scenario where " & sWP & " order by sce_numgri"

  cSceQuery.OpenCurseur sQuery
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
  If Not cSce Is Nothing Then cSce.CloseCurseur
  Set cSce = cSceQuery
  sFinalWP = sWP

  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire

  If Not (cSce.EOF And cSce.BOF) Then
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
'  ' On regarde si le nom n'existe pas déjà
'  Dim iSer As Long
'  iSer = BDCurseurExpress("select sce_numgri from scenario where sce_jeu=" & sFormToSQL(colChamps("sce_jeu"), BDTypeINTEGER) & " and sce_libelle=" & sFormToSQL(colChamps("sce_libelle"), BDTypeCHAR))
'  If iSer <> 0 And iSer <> colChamps("sce_numgri") Then
'    MsgBox "ATTENTION - Cette catégorie existe déjà dans ce jeu sous le n° " & iSer, vbExclamation, App.Title
'    Exit Function
'  End If
'
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  Dim cSceAdd As New BDCurseur
  cSceAdd.OpenCurseur "select * from scenario where sce_scenario=0"
  cSceAdd.AddNew

  ' Génération du n° de scénario, si nécessaire
  If colChamps("sce_scenario") = "" Then
    colChamps("sce_scenario") = 1 + NZ(BDCurseurExpress("select max (sce_scenario) from scenario where sce_numgri=" & colChamps("sce_numgri")))
    cSceAdd!sce_scenario = colChamps("sce_scenario")
  End If


' Traçabilité ancien style
  InitTraçabilité colChamps, "sce", True


' Seuls les champs actifs sont mis à jour
  ActiveTraçabilité True
  ActiveChamp "sce_scenario", True

  If Not bPrépareEditAdd(cSceAdd, colColonnes, colChamps) Then
    cSceAdd.CloseCurseur
    ActiveTraçabilité False
    ActiveChamp "sce_scenario", False
    Exit Sub
  End If
  cSceAdd.CloseCurseur


' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cSce Is Nothing Then cSce.CloseCurseur
  Set cSce = New BDCurseur

  sFinalWP = "sce_numgri=" & colChamps("sce_numgri") & " and sce_scenario=" & colChamps("sce_scenario")
  sQuery = "select * from scenario where " & sFinalWP & " order by sce_scenario"
  cSce.OpenCurseur sQuery
  cSce.MoveFirst

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
  Assert Not cSce Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cSce.Edit

  ' Traçabilité ancien style
  InitTraçabilité colChamps, "sce", False
  ActiveTraçabilité True     ' Pour mettre à jour la base

  If Not bPrépareEditAdd(cSce, colColonnes, colChamps) Then
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

  'PurgeCacheCatégorie colChamps("sce_jeu"), colChamps("sce_numgri")

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

  ' Réaffiche les données. En mode change, pas besoin de réafficher le tableau
  SynchroniseFormulaire Not (iMode = meChange)

  iMode = meEmpty
  If Not cSce Is Nothing Then
    If Not (cSce.EOF And cSce.BOF) Then
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

  Page "Tête"
  
  colChamps("sce_numgri").SetFocus
  bdSél.TabStop = False

  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cSce Is Nothing

  If cSce.bEffacé Then
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
  ActiveChamp "sce_numgri", False
  ActiveChamp "sce_scenario", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False

  Page "Tête"
  colChamps("sce_titre").SetFocus
  AutoSelect colChamps("sce_titre"), True
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
  Page "Tête"
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "sce_scenario", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  colChamps("sce_numgri").SetFocus
  ActiveChamp "sce_scenario", False
  bdSél.TabStop = False

  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cSce Is Nothing
  
  If cSce.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If

  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub

  ' On efface la tête…
  On Error Resume Next
  cSce.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  ' Puis le corps du scénario
  RunSQL "delete from cotation where cot_numgri=" & sFormToSQL(colChamps("sce_numgri"), BDTypeINTEGER) & " and cot_scenario=" & sFormToSQL(colChamps("sce_scenario"), BDTypeINTEGER)


  ' On place les enregistrements dans synchrodelete (tête+corps)
  Dim cSD As New BDCurseur
  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
  ' Corps
  cSD.AddNew
  cSD!sd_table = "cotation"
  cSD!sd_timestamp = BDTime
  cSD!sd_wherepart = "cot_numgri=" & sFormToSQL(colChamps("sce_numgri"), BDTypeINTEGER) & " and cot_scenario=" & sFormToSQL(colChamps("sce_scenario"), BDTypeINTEGER)
  cSD.Update
  
  ' Tête
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

  bdSél.ActiveMouvements iMode = meNavigate
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


'=================================================================================
' Traçabilité

Private Sub ActiveTraçabilité(bEnable As Boolean)
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

  bdSél.ButtonEnabled("First") = cSce.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cSce.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cSce.EOF
  bdSél.ButtonEnabled("Last") = Not cSce.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate

  cSce.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
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
  Assert Not cSce Is Nothing

  BDActiveChamp tdgCotation, True
  'tdgCotation.AllowAddNew = True
  tdgCotation.AllowUpdate = True
  bdSél.ActiveMouvements False
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False

  bdSélTab.ButtonEnabled("Change") = False
  bdSélTab.ActiveValidation True
  bdSélTab.ButtonEnabled("InsertRow") = False
  bdSélTab.ButtonEnabled("DeleteRow") = False

  iMode = meChangeTab
  bTabModifié = False
  SélectionneCellule 1, 2
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
  
  If bTabModifié Then   ' Optimisation si pas de modif
  
    ' Contrôle général des données: doublons de numloc et items inexistants
    Dim i As Integer, j As Integer, k As Integer
    For i = 1 To xaTab.UpperBound(1)

      ' Détection des items invalides
      If Trim(xaTab(i, 2)) <> "" Then
        If Not IsNumeric(xaTab(i, 2)) Then
          MsgBox "Décote invalide.", vbExclamation, App.Title
          SélectionneCellule i, 2
          Exit Sub
        End If
        
        If Abs(xaTab(i, 2)) > 10000 Then
          MsgBox "Décote invalide (doit être comprise entre -10 000 et +10 000).", vbExclamation, App.Title
          SélectionneCellule i, 2
          Exit Sub
        End If
      End If

      ' Détection de doublons dans les options
      Dim sOpt As String
      sOpt = Trim(xaTab(i, 3))
      For j = 1 To Len(sOpt)
        For k = j + 1 To Len(sOpt)
          If Mid(sOpt, j, 1) = Mid(sOpt, k, 1) Then
            MsgBox "L'option " & Mid(sOpt, j, 1) & " est présente plusieurs fois. Éliminez les doublons avant de valider.", vbExclamation, App.Title
            SélectionneCellule i, 3
            Exit Sub
          End If
        Next
      Next
      
      If Trim(xaTab(i, 4)) <> "" And Not IsNumeric(xaTab(i, 4)) Then
        MsgBox "Format invalide.", vbExclamation, App.Title
        SélectionneCellule i, 4
        Exit Sub
      End If
    Next


    ' Tests Ok, on peut mettre à jour la base de données
    SetStatus "Mise à jour de la base de données…"
    Screen.MousePointer = vbHourglass
    
    Dim dBDTime As Date
    dBDTime = BDTime
    
    Dim cr As New BDCurseur
    For i = 1 To xaTab.UpperBound(1)
      If xaTab(i, 6) < 0 Then         ' La ligne a été modifiée
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
    
    
    ' Mise à jour de la traçabilité de la tête
    cSce.Edit
    InitTraçabilité colChamps, "sce", False
    ActiveTraçabilité True     ' Pour mettre à jour la base
    bPrépareEditAdd cSce, colColonnes, colChamps
    ActiveTraçabilité False

    
    Screen.MousePointer = vbDefault
    SetStatus
  End If    ' if bTabModifié

  BDActiveChamp tdgCotation, False
  tdgCotation.AllowAddNew = False
  tdgCotation.AllowUpdate = False
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
  bdSélTab.ButtonEnabled = False
  bdSélTab.ButtonEnabled("Change") = True

  bdSél.ActiveMouvements True
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.SetFocus

  If bTabModifié Or tdgCotation.DataChanged Then SynchroniseFormulaire   ' Restore le tableau précédent

  iMode = meNavigate
End Sub



' Affichage du texte de l'item dès qu'on change de ligne en saisie dans le tableau
Private Sub tdgCotation_AfterUpdate()
  bTabModifié = True
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

    ' On marque la ligne comme étant modifiée
    If xaTab(r, 6) > 0 Then
      xaTab(r, 6) = -xaTab(r, 6)
      tdgCotation.RefetchRow r        ' Utile en mode mise au point, quand la colonne 6 est visible
    End If
  End If
End Sub


'=================================================================================
' Actions du sélecteur tableau

Private Sub bdSélTab_ActionTabChange():     ActionTabChange:    End Sub
Private Sub bdSélTab_ActionTabValidate():   ActionTabValidate:  End Sub
Private Sub bdSélTab_ActionTabCancel():     ActionTabCancel:    End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_Keypress(KeyAscii As Integer)
  If KeyAscii = Asc("t") Or KeyAscii = Asc("T") Then
    If bdSélTab.ButtonEnabled("Change") Then
      KeyAscii = 0
      ActionTabChange
    End If
  Else
    If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
  End If
End Sub


Private Sub tdgCotation_KeyDown(KeyCode As Integer, Shift As Integer)
  bdSélTab.KeyDown KeyCode, Shift
  If KeyCode = 13 Then KeyCode = 0
End Sub


Private Sub txtChamp_DblClick(Index As Integer)
  If iMode = meAdd And txtChamp(Index).DataField = "sce_numgri" Then
    ActiveChamp "sce_numgri", True
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
  
  ' On met les frames en tête de pile d'affichage, sinon certains sont derrière le tsTab
  Dim F As Frame
  For Each F In fraFeuille
    F.ZOrder 0
  Next

  Show
  iCurFrame = -1   ' Pour forcer le passage à la page 0
  Page "Tête"
  
  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  ' Chargement des combos
' Utilisateurs
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcoperModif.AddItem u.uti_numuti, u.uti_nom
  Next
  
  ' Préparation de la grille
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

    With .Columns(0)                      ' N° de l'item
      .Caption = "Item"
      .Width = 50 * 15
      .DataWidth = 5
      .Locked = True
      .BackColor = RGB(220, 220, 220)
    End With
    
    With .Columns(1)                      ' N° local sur la grille
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
      .EditMask = "##"                    ' Laisse passer les éçù !!!!!!!!
    End With
        
    With .Columns(5)                      ' Libellé de l'item
      .Caption = "Item"
      .Width = 360 * 15
      .Locked = True
      .BackColor = RGB(220, 220, 220)
      .WrapText = True                    ' Impression sur plusieurs lignes
    End With
    
    With .Columns(6)                      ' N° série (colonne invisible)
      .Caption = "Série"
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
  bdSél.LectureSeule = bLectureSeule
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True

  bdSélTab.ButtonEnabled = False
  bdSélTab.LectureSeule = bLectureSeule

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
  If Not cSce Is Nothing Then cSce.CloseCurseur
  MDIGrilles.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire(Optional bRéafficheTableau As Boolean = True)
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

    bdSél.NumRec = cSce.AbsolutePosition
    
    ' On efface les champs qui seront affichés par le timer = le tableau
    If bRéafficheTableau Then
      ActiveTimer mtRapide              ' Mise à jour en arrière plan
      bdSélTab.ButtonEnabled = False    ' Aucune commande de tableau disponible
      EffaceTableau
    Else
      bdSélTab.ButtonEnabled("change") = True
    End If
  End If
  Exit Sub

pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cSce.bEffacé = True
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
  bdSélTab.ButtonEnabled("change") = True
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  txtTitre = ""
  bdSél.NumRec = ""
  EffaceTableau
End Sub

Private Sub EffaceTableau()
  xaTab.ReDim 1, 0, 0, 6
  tdgCotation.ReBind
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
  SetStatus bdcoperModif.Tag
End Sub


Private Sub tdgCotation_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
  Select Case tdgCotation.col
    Case 0: SetStatus "N° de série de l'item dans la table item"
    Case 1: SetStatus "Numérotation de l'item dans la grille client"
    Case 2: SetStatus "Décote de l'item"
    Case 3: SetStatus "Options de l'item"
    Case 4: SetStatus "Format de l'item"
    Case 5: SetStatus "Libellé de l'item"
    Case Else: SetStatus
  End Select
End Sub

Private Sub txtChamp_LostFocus(Index As Integer)
  ' Mise à jour du champ txt_titre
  If txtChamp(Index).DataField = "sce_numgri" Then
    If IsNumeric(txtChamp(Index)) Then
      txtTitre = sGetTitreGrille(txtChamp(Index), cLangage)
    Else
      txtTitre = ""
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
  BDCopieSélection cSce, colChamps, bdSél
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

Public Sub Aperçu()
  DoEtat False
End Sub

Private Sub DoEtat(ByVal bImpression As Boolean)
  Dim iChoix As Integer
  
  iChoix = frmMessageChoix.ChoixEtat("Titres de scénarios sélectionnés", "Scénario courant")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
End Sub


Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String
  sSQL = "select * from scenario where " & sFinalWP
  
  Select Case iChoix
    Case 1:
    ' Le "on error resume next" sert à éviter une erreur 13:Type incompatible, venue de dieu sait où et impossible à localiser...
      On Error Resume Next
      BDEtat sSQL, drTitresScénarios, bImpression
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
' Import de données

Private Sub ClésImport(Optional ByRef tsClésLigne1 As Variant, Optional tsClésBase As Variant, Optional tsDéfaut As Variant)
  If Not IsMissing(tsClésLigne1) Then tsClésLigne1 = Array("*NLoc", "Dec", "Opt", "Fmt")
  If Not IsMissing(tsClésBase) Then tsClésBase = Nothing
  If Not IsMissing(tsDéfaut) Then tsDéfaut = Array("", "", "", "")
End Sub

Public Sub Importer()
  Dim tsClésL1 As Variant     ' Tableau des clés, * en préfixe des clés obligatoires
  Dim tsDéfaut As Variant     ' Tableau des valeurs par défaut, de même taille que le tableau des clés
  
  If iMode <> meNavigate Then
    MsgBox "Sélectionnez ou créez un en-tête de scénario avant d'importer les données.", vbExclamation, App.Title
    Exit Sub
  End If
  
  ClésImport tsClésLigne1:=tsClésL1, tsDéfaut:=tsDéfaut
  PrépareImport Me, "Import de scénarion EH", tsClésL1, tsDéfaut, frmImport
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
  bTabModifié = True
  
  bdSélTab.ButtonEnabled("change") = True

  frmImport.btnAnnuler.Enabled = True
  frmImport.btnAnnuler.Caption = "Fermer"
  SetStatus
End Sub

