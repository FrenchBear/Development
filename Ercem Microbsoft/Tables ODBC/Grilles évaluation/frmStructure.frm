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
   Tag             =   "Données"
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
      Begin GrillesEvaluation.BDSélecteurTableau bdSélTab 
         Height          =   2040
         Left            =   0
         TabIndex        =   30
         TabStop         =   0   'False
         Top             =   1860
         Width           =   390
         _ExtentX        =   688
         _ExtentY        =   3598
      End
      Begin TrueOleDBGrid60.TDBGrid tdgDéfinitions 
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
         Caption         =   "Validé le :"
         Height          =   210
         Index           =   1
         Left            =   0
         TabIndex        =   21
         Top             =   780
         Width           =   930
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifié le :"
         Height          =   210
         Index           =   16
         Left            =   0
         TabIndex        =   17
         Top             =   420
         Width           =   1020
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Créé le :"
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
' 16/02/2000 PV  Mise à jour du timestamp en cas de modif partielle du corps de grille
'  5/06/2000 PV  Numloc 4 -> 6 caractères
' 11/07/2000 PV  Import de données
' 31/08/2000 PV  Impression des titres
' 15/09/2000 PV  Double-clic pour afficher un item
' 17/04/2001 PV  Gestion du mode lecture seule au niveau du tableau
'  5/07/2001 PV  Contrôle du niveau (on pouvait importer des niveaux erronés)
' 24/07/2001 PV  Modif corps --> MAJ traçabilité tête; Optimisation: ajout en fin de tableau = modif simple


Option Explicit

Private cGri As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private bOpGénérale As Boolean

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private Const sTable = "titgri"

Private xaTab As XArrayDB                 ' Données du tableau
Private bTabModifié As Boolean            ' Optimisation de la gestion du tableau
Private bTabModifSimple As Boolean        ' Vrai tant qu'il n'y a ni ajout ni suppression d'items

Private iCurFrame As Integer              ' Cadre courant visible

Private iSerieCG As Long                  ' Générateur de n°s de série (corgri)


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
  txtChamp(2).Width = fraFeuille(1).Width * Screen.TwipsPerPixelX - txtChamp(2).Left - 50
  txtChamp(12).Width = fraFeuille(1).Width * Screen.TwipsPerPixelX - txtChamp(12).Left - 50
  txtChamp(4).Width = fraFeuille(1).Width * Screen.TwipsPerPixelX - txtChamp(4).Left - 50
  
  ' Puis la grille
  tdgDéfinitions.Width = tsTab.ClientWidth * 15 - 38 * 15
  tdgDéfinitions.Height = tsTab.ClientHeight * 15 - tdgDéfinitions.Top - 10 * 15
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
  Dim bRequêteVide As Boolean
  
  bRequêteVide = True
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
      If t.DataField <> "tit_langue" Then bRequêteVide = False
    End If
  Next

  If bRequêteVide Then
    Dim iRep As VbMsgBoxResult
    iRep = AvertissementLectureFichierComplet
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If

  Dim cGriQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from titgri where " & sWP & " order by tit_numgri desc"

  cGriQuery.OpenCurseur sQuery
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
  If Not cGri Is Nothing Then cGri.CloseCurseur
  Set cGri = cGriQuery
  sFinalWP = sWP

  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire

  If Not (cGri.EOF And cGri.BOF) Then
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
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Dim iSérie As Long
  
  Assert iMode = meAdd

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  Dim cGriAdd As New BDCurseur
  cGriAdd.OpenCurseur "select * from titgri where tit_numgri=0"
  cGriAdd.AddNew

  ' Génération du n° de série
  If colChamps("tit_numgri") = "" Then
    RunSQL "insert into serialgrille values(0)"
    iSérie = BDCurseurExpress("select max(serialgrille) from serialgrille")
    If iSérie < 10 Then   ' Sécurité nouvelles bases
      RunSQL "insert into serialgrille values(10)"
      iSérie = 10
    End If
    colChamps("tit_numgri") = iSérie
    ' On purge les enregistrements ajoutés dans serialitem pour la génération des n°s de série
    RunSQL "delete from serialgrille where serialgrille<" & iSérie
  End If


' Traçabilité ancien style
  InitTraçabilité colChamps, "tit", True


' Seuls les champs actifs sont mis à jour
  ActiveTraçabilité True
  ActiveChamp "tit_numgri", True

  If Not bPrépareEditAdd(cGriAdd, colColonnes, colChamps) Then
    cGriAdd.CloseCurseur
    ActiveTraçabilité False
    ActiveChamp "tit_numgri", False
    Exit Sub
  End If
  cGriAdd.CloseCurseur


' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cGri Is Nothing Then cGri.CloseCurseur
  Set cGri = New BDCurseur

  sFinalWP = "tit_numgri=" & colChamps("tit_numgri")
  sQuery = "select * from titgri where " & sFinalWP & " order by tit_numgri"
  cGri.OpenCurseur sQuery
  cGri.MoveFirst

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
  Assert Not cGri Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cGri.Edit

  ' Traçabilité ancien style
  InitTraçabilité colChamps, "tit", False
  ActiveTraçabilité True     ' Pour mettre à jour la base

  If Not bPrépareEditAdd(cGri, colColonnes, colChamps) Then
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
  If Not cGri Is Nothing Then
    If Not (cGri.EOF And cGri.BOF) Then
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
  
  ' Valeur par défaut
  bdcEdLangue = cLangage

  colChamps("tit_numgri").SetFocus
  bdSél.TabStop = False

  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cGri Is Nothing

  If cGri.bEffacé Then
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
  ActiveChamp "tit_numgri", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False

  Page "Tête"
  colChamps("tit_titre1").SetFocus
  AutoSelect colChamps("tit_titre1"), True
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
  ActiveChamp "tit_numgri", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  ' Valeur par défaut
  bdcEdLangue = cLangage

  colChamps("tit_titre1").SetFocus
  bdSél.TabStop = False

  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cGri Is Nothing
  
  MsgBox "L'effacement des grilles n'est pas géré dans cette version du programme, voyez avec le service informatique.", vbExclamation, App.Title
  If Not bShiftPressed Then Exit Sub

  If cGri.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If

  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub

  On Error Resume Next
  cGri.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
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

  bdSél.ActiveMouvements iMode = meNavigate
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


'=================================================================================
' Traçabilité

Private Sub ActiveTraçabilité(bEnable As Boolean)
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

  bdSél.ButtonEnabled("First") = cGri.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cGri.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cGri.EOF
  bdSél.ButtonEnabled("Last") = Not cGri.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate

  cGri.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
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
  Assert Not cGri Is Nothing

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
  bTabModifSimple = True   ' Par défaut
  SélectionneCellule 1, 0
  tdgDéfinitions.SetFocus
End Sub


Private Sub ActionTabDeleteRow()
  Assert iMode = meChangeTab
  Assert Not cGri Is Nothing

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
  bTabModifSimple = False
  
  tdgDéfinitions.SetFocus
End Sub


Private Sub ActionTabInsertRow()
  Assert iMode = meChangeTab
  Assert Not cGri Is Nothing

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
  bTabModifSimple = False
  
  tdgDéfinitions.SetFocus
End Sub


Private Sub ActionTabValidate()
  Assert iMode = meChangeTab
  Assert Not cGri Is Nothing
  
  ' On valide les modifs de la ligne courante
  If tdgDéfinitions.DataChanged Then
    tdgDéfinitions.Update
    DoEvents
  End If
  
  If bTabModifié Then   ' Optimisation si pas de modif
    ' Contrôle général des données: doublons de numloc et items inexistants
    Dim i As Integer, j As Integer
    For i = 1 To xaTab.UpperBound(1)
    
      ' Par pure bonté, on ignore les lignes vides
      If Not IsEmpty(xaTab(i, 0)) Or Not IsEmpty(xaTab(i, 1)) Or Not IsEmpty(xaTab(i, 2)) Then
      
        ' Toutes les colonnes doivent être remplies
        If xaTab(i, 0) = "" Or xaTab(i, 1) = "" Or xaTab(i, 2) = "" Then
          MsgBox "Vous devez remplir le n° d'item, le n° local et le niveau avant de valider.", vbExclamation, App.Title
          SélectionneCellule i, 0
          Exit Sub
        End If
      
        ' Détection des items invalides
        If xaTab(i, 0) = 0 Or InStr(1, xaTab(i, 3), sLibelléInexistant) > 0 Then
          MsgBox "Impossible d'enregistrer une grille avec des n°s d'item invalides.", vbExclamation, App.Title
          SélectionneCellule i, 0
          Exit Sub
        End If
        
        ' Contrôle du niveau
        If Not (xaTab(i, 2) Like "[1234]") Then
          MsgBox "Niveau invalide (doit être compris entre 1 et 4).", vbExclamation, App.Title
          SélectionneCellule i, 2
          Exit Sub
        End If
        
        ' Détection de doublons dans le n° local sauf pour les !xxx
        If Left(Trim(CStr(xaTab(i, 1))), 1) <> "!" Then
          For j = i + 1 To xaTab.UpperBound(1)
            If Trim(CStr(xaTab(i, 1))) = Trim(CStr(xaTab(j, 1))) Then
              MsgBox "Le n° local " & xaTab(i, 1) & " est présent plusieurs fois. Eliminez les doublons avant de valider.", vbExclamation, App.Title
              SélectionneCellule i, 1
              Exit Sub
            End If
          Next
        End If
        
      End If    ' if not isempty
    Next


    ' Tests Ok, on peut mettre à jour la base de données
    SetStatus "Mise à jour de la base de données…"
    Screen.MousePointer = vbHourglass
    
    Dim dBDTime As Date
    dBDTime = BDTime
    
    Dim cr As New BDCurseur
    Dim Index As Integer
    If bTabModifSimple Then
      ' Mise à jour simplifiée (updates ou insert en fin)
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
      ' Mise à jour lourde
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
        SetStatus "Mise à jour de la base de données… " & i & "/" & xaTab.UpperBound(1)
        If Not IsEmpty(xaTab(i, 0)) Then
          AjouteItem i, cr, Index
          Index = Index + 1
        End If
      Next
      cr.CloseCurseur
    End If
    
    ' On purge les enregistrements ajoutés dans serialcorgri pour la génération des n°s de série
    If iSerieCG > 0 Then RunSQL "delete from serialcorgri where serialcorgri<" & iSerieCG
    
    ' Mise à jour de la traçabilité de la tête
    cGri.Edit
    InitTraçabilité colChamps, "tit", False
    ActiveTraçabilité True     ' Pour mettre à jour la base
    bPrépareEditAdd cGri, colColonnes, colChamps
    ActiveTraçabilité False

    
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


Private Sub AjouteItem(i As Integer, cr As BDCurseur, Index As Integer)
  cr.AddNew
  cr!cg_numgri = colChamps("tit_numgri")
  cr!cg_index = Index
  cr!cg_numit = xaTab(i, 0)
  cr!cg_numloc = xaTab(i, 1)
  cr!cg_niveau = xaTab(i, 2)
  
  ' N° de série unique pour la combinaison grille/item
  If xaTab(i, 4) = "" Then ' Nouvel item
    RunSQL "insert into serialcorgri values(0)"
    iSerieCG = BDGetLastSerial
    If iSerieCG < 10 Then   ' Sécurité nouvelles bases
      RunSQL "insert into serialcorgri values(10)"
      iSerieCG = 10
    End If
    cr!cg_serie = iSerieCG
  Else
    cr!cg_serie = xaTab(i, 4) ' Item lu dans la base, on conserve le n°
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
    If InStr(1, sErr, "duplicate") <> 0 Then sErr = sErr & vbCrLf & vbCrLf & "Le type " & VN(xaTab(i, 0)) & "." & VN(xaTab(i, 1)) & "." & VN(xaTab(i, 2)) & "." & VN(xaTab(i, 3)) & "." & VN(xaTab(i, 4)) & " est utilisé dans une autre catégorie du jeu, et la création de doublon est interdite."
    MsgBox "Échec lors de l'écriture des données." & vbCrLf & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
  End If
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
  Assert Not cGri Is Nothing

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



Private Sub tdgDéfinitions_AfterInsert()
  bTabModifié = True
  'bTabModifSimple = False        SI: AfterInsert reste une modif simple
End Sub


' Affichage du texte de l'item dès qu'on change de ligne en saisie dans le tableau
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

    If xaTab(r, 0) = "" Then
      xaTab(r, 3) = ""
    Else
      xaTab(r, 3) = sFormateItem(sGetItem(Val(xaTab(r, 0)), colChamps("tit_langue")), Val(xaTab(r, 2)))
    End If
    
    ' On marque la ligne pour les modifs rapides
    If IsNumeric(xaTab(r, 5)) And xaTab(r, 5) > 0 Then xaTab(r, 5) = -xaTab(r, 5)
    
    ' ET on réaffiche
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

Private Sub tdgDéfinitions_BeforeColUpdate(ByVal ColIndex As Integer, OldValue As Variant, Cancel As Integer)
'  If tdgDéfinitions.Text = "" Then Exit Sub
'  If Not IsNumeric(tdgDéfinitions.Text) Then
'    MsgBox "Type incorrect (non numérique).", vbExclamation, App.Title
'    Cancel = True
'    Exit Sub
'  End If
'  If tdgDéfinitions.Text < 0 Or tdgDéfinitions.Text > 100000 Then
'    MsgBox "Type incorrect (<0 ou >100000).", vbExclamation, App.Title
'    Cancel = True
'    Exit Sub
'  End If
End Sub

Private Sub tdgDéfinitions_AfterColEdit(ByVal ColIndex As Integer)
'  Dim fr As Integer, r As Integer
'  If tdgDéfinitions.FirstRow = "" Then
'    fr = 1
'  Else
'    fr = tdgDéfinitions.FirstRow
'  End If
'  r = fr + tdgDéfinitions.Row
'
'  Debug.Print "r=" & r
'  If xaTab(r, 2) = "" Then
'    xaTab(r, 2) = 3
'    tdgDéfinitions.RefetchRow r
'  End If
End Sub


Private Sub tdgDéfinitions_DblClick()
  Dim fr As Integer, r As Integer
  If tdgDéfinitions.FirstRow = "" Then
    fr = 1
  Else
    fr = tdgDéfinitions.FirstRow
  End If
  r = fr + tdgDéfinitions.Row
  
  If xaTab.UpperBound(1) > 0 Then
    frmItem.AfficheItem "it_numit=" & xaTab(r, 0) & " and it_langue='" & colChamps("tit_langue") & "'"
  End If
End Sub



Private Sub tdgDéfinitions_KeyDown(KeyCode As Integer, Shift As Integer)
  bdSélTab.KeyDown KeyCode, Shift
  If KeyCode = 13 Then KeyCode = 0
End Sub


Private Sub txtChamp_DblClick(Index As Integer)
  If iMode = meAdd And txtChamp(Index).DataField = "tit_numgri" Then
    ActiveChamp "tit_numgri", True
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
  
' Langues
  Dim l As Langue
  For Each l In colLangue
      bdcEdLangue.AddItem l.lan_code, l.lan_langue
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

    With .Columns(0)                      ' N° de l'item
      .Caption = "Item"
      .Width = 50 * 15
      .DataWidth = 5
    End With
    
    With .Columns(1)                      ' N° local sur la grille
      .Caption = "NLoc"
      .Width = 50 * 15
      .DataWidth = 6
    End With
    
    With .Columns(2)                      ' Niveau de décalage
      .Caption = "Niv"
      .Width = 30 * 15
    End With
    
    With .Columns(3)                      ' Libellé de l'item
      .Caption = "Item"
      .Width = 460 * 15
      .Locked = True
      .BackColor = RGB(220, 220, 220)
      .WrapText = True                    ' Impression sur plusieurs lignes
    End With
    
    With .Columns(4)                      ' N° série (colonne invisible)
      .Caption = "Série"
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
        
    ' Saisie restreinte à 1..4+(vide) pour le niveau
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
  BDActiveChamp tdgDéfinitions, False
  Set cGri = Nothing
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
  If Not cGri Is Nothing Then cGri.CloseCurseur
  MDIGrilles.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire(Optional bRéafficheTableau As Boolean = True)
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

    bdSél.NumRec = cGri.AbsolutePosition
    
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
    cGri.bEffacé = True
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
    
    Dim sLibellé As String
    If IsNull(cV!it_libelle) Then
      sLibellé = sLibelléInexistant
    Else
      sLibellé = cV!it_libelle
    End If
    xaTab(iRec, 3) = sFormateItem(sLibellé, cV!cg_niveau)
    
    xaTab(iRec, 4) = cV!cg_serie
    xaTab(iRec, 5) = cV!cg_index
    
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
'  txtJeu = ""
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


Private Sub tdgDéfinitions_RowColChange(LastRow As Variant, ByVal LastCol As Integer)
  Select Case tdgDéfinitions.col
    Case 0: SetStatus "N° de série de l'item dans la table item"
    Case 1: SetStatus "Numérotation de l'item dans la grille client"
    Case 2: SetStatus "Niveau de décalage, de 1 à 4"
    Case 3: SetStatus "Libellé de l'item"
    Case Else: SetStatus
  End Select
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
  BDCopieSélection cGri, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub

Public Sub CopieTableau()
  gtCopieTableau tdgDéfinitions, xaTab
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
  
  iChoix = frmMessageChoix.ChoixEtat("Liste des titres sélectionnés", "Structure de la grille courante")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
End Sub

Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String
  sSQL = "select * from titgri where " & sFinalWP
  
  Select Case iChoix
    Case 1:
    ' Le "on error resume next" sert à éviter une erreur 13:Type incompatible, venue de dieu sait où et impossible à localiser...
      On Error Resume Next
      BDEtat sSQL, drTitresGrilles, bImpression
      On Error GoTo 0
    
    Case 2:
      ' Impression sur fond blanc
      BDActiveChamp tdgDéfinitions, True
      
      With tdgDéfinitions.PrintInfo
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
    
      BDActiveChamp tdgDéfinitions, False
  End Select
End Sub



'=================================================================================
' Import de données

Private Sub ClésImport(Optional ByRef tsClésLigne1 As Variant, Optional tsClésBase As Variant, Optional tsDéfaut As Variant)
  If Not IsMissing(tsClésLigne1) Then tsClésLigne1 = Array("*NLoc", "Niv", "*Item")
  If Not IsMissing(tsClésBase) Then tsClésBase = Nothing
  If Not IsMissing(tsDéfaut) Then tsDéfaut = Array("", "3", "")
End Sub


Public Sub Importer()
  Dim tsClésL1 As Variant     ' Tableau des clés, * en préfixe des clés obligatoires
  Dim tsDéfaut As Variant     ' Tableau des valeurs par défaut, de même taille que le tableau des clés
  
  If iMode <> meNavigate Then
    MsgBox "Sélectionnez ou créez un en-tête de grille avant d'importer la structure.", vbExclamation, App.Title
    Exit Sub
  End If
  
  ClésImport tsClésLigne1:=tsClésL1, tsDéfaut:=tsDéfaut
  PrépareImport Me, "Import de structure EH", tsClésL1, tsDéfaut, frmImport
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
    If iSerial = 0 Then iSerial = frmItem.iCréeItemDéfaut(bdcEdLangue, sItem)
    
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
  tdgDéfinitions.Array = xaTab
  tdgDéfinitions.ReBind
  
  bTabModifié = True
  bTabModifSimple = False
  
  bdSélTab.ButtonEnabled("change") = True

  frmImport.btnAnnuler.Enabled = True
  frmImport.btnAnnuler.Caption = "Fermer"
  Unload frmImport
  SetStatus
End Sub
