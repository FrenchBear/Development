VERSION 5.00
Begin VB.Form frmTitreJeuCatégorie 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des Jeux de catégories"
   ClientHeight    =   3840
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   9060
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmTitreJeuCatégorie.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   256
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   604
   Tag             =   "Données"
   Begin VB.CheckBox chkAvecJeuxNonValidés 
      Caption         =   "&Inclure les jeux non validés dans la recherche"
      Height          =   255
      Left            =   2760
      TabIndex        =   2
      Top             =   540
      Width           =   4875
   End
   Begin Statistiques.BDSélecteur bdSél 
      Height          =   435
      Left            =   -120
      TabIndex        =   22
      Top             =   0
      Width           =   9195
      _ExtentX        =   16219
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
      DataField       =   "jeu_class2"
      Height          =   315
      Index           =   2
      Left            =   1680
      TabIndex        =   10
      Top             =   1980
      Width           =   7335
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "jeu_class1"
      Height          =   315
      Index           =   1
      Left            =   1680
      TabIndex        =   8
      Top             =   1620
      Width           =   7335
   End
   Begin VB.Frame frlTraçabilité 
      Caption         =   "Traçabilité"
      Height          =   1395
      Left            =   0
      TabIndex        =   11
      Top             =   2400
      Width           =   9015
      Begin VB.TextBox txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   10
         Left            =   1680
         TabIndex        =   21
         Top             =   960
         Width           =   2055
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "jeu_datecreat"
         Height          =   315
         Index           =   5
         Left            =   1680
         TabIndex        =   13
         Top             =   240
         Width           =   1035
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "jeu_heurecreat"
         Height          =   315
         Index           =   6
         Left            =   2760
         TabIndex        =   14
         Top             =   240
         Width           =   975
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "jeu_datemodif"
         Height          =   315
         Index           =   7
         Left            =   1680
         TabIndex        =   17
         Top             =   600
         Width           =   1035
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "jeu_heuremodif"
         Height          =   315
         Index           =   8
         Left            =   2760
         TabIndex        =   18
         Top             =   600
         Width           =   975
      End
      Begin Statistiques.BDCombo bdcOperCreat 
         Height          =   330
         Left            =   3780
         TabIndex        =   15
         Top             =   240
         Width           =   5115
         _ExtentX        =   9022
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
         DataField       =   "jeu_opercreat"
      End
      Begin Statistiques.BDCombo bdcOperModif 
         Height          =   330
         Left            =   3780
         TabIndex        =   19
         Top             =   600
         Width           =   5115
         _ExtentX        =   9022
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
         DataField       =   "jeu_opermodif"
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   20
         Top             =   1020
         Width           =   1155
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Créé le :"
         Height          =   210
         Index           =   17
         Left            =   120
         TabIndex        =   12
         Top             =   300
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifié le :"
         Height          =   210
         Index           =   16
         Left            =   120
         TabIndex        =   16
         Top             =   660
         Width           =   1020
      End
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "^*jeu_libelle"
      Height          =   315
      Index           =   3
      Left            =   1680
      MaxLength       =   35
      TabIndex        =   4
      Top             =   840
      Width           =   5055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "jeu_comment"
      Height          =   315
      Index           =   4
      Left            =   1680
      TabIndex        =   6
      Top             =   1200
      Width           =   7335
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*jeu_indice"
      Height          =   315
      Index           =   0
      Left            =   1680
      TabIndex        =   1
      Top             =   480
      Width           =   795
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Class. 2 :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   9
      Top             =   2040
      Width           =   885
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Class. 1 :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   7
      Top             =   1680
      Width           =   885
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Libellé :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   3
      Top             =   900
      Width           =   735
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Remarques :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   5
      Top             =   1260
      Width           =   1200
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
Attribute VB_Name = "frmTitreJeuCatégorie"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmTitreJeuCatégorie
' Feuille de gestion des titres des jeux de catégories
' 14/10/1999 NC
' 24/12/1999 NC On peut déterminer le n° du jeu (double-clic)
' 30/11/2000 PV Impression des jeux de catégorie reprise


Option Explicit

Private cJeu As BDCurseur                 ' Curseur courant
Private rJC As ADODB.Recordset            ' Curseur d'impression
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private Const sTable = "jeucat"


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
  
  
  ' Par défaut, on élimine de la sélection les jeux dont le titre commence par !
  If chkAvecJeuxNonValidés = vbUnchecked Then
    sWP = sWP & " and jeu_libelle not matches ""!*"""
  End If
  
  ' Modification avancée de la requête
  If bShiftPressed Then
    sWP = InputBox("Modification avancée de la requête", "Sélection", sWP)
    If sWP = "" Then Exit Sub
  End If

  
  Dim cJeuQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from jeucat where " & sWP
  If Not bWPIntègreEtat Then sQuery = sQuery

  cJeuQuery.OpenCurseur sQuery
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
  If Not cJeu Is Nothing Then cJeu.CloseCurseur
  Set cJeu = cJeuQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cJeu.EOF And cJeu.BOF) Then
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
  
  ' On regarde si le nom n'existe pas déjà
  Dim iSer As Long
  iSer = BDCurseurExpress("select jeu_indice from jeucat where jeu_libelle=" & sFormToSQL(colChamps("jeu_libelle"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("jeu_indice") Then
    MsgBox "ATTENTION - Ce jeu de catégorie existe déjà sous le n° " & iSer, vbExclamation, App.Title
    Exit Function
  End If
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  ' Génération du n° de série
  
  Dim cjeuAdd As New BDCurseur
  cjeuAdd.OpenCurseur "select * from jeucat where jeu_indice=0"
  cjeuAdd.AddNew
  If colChamps("jeu_indice") = "" Then
    Dim cindice As New BDCurseur
    cindice.OpenCurseur "select max (jeu_indice) from jeucat"
    colChamps("jeu_indice") = cindice.Fields(0) + 1
    cjeuAdd!jeu_indice = cindice.Fields(0) + 1
    cindice.CloseCurseur
  End If

  ' Traçabilité ancien style
  InitTraçabilité colChamps, "jeu", True

  ' Seuls les champs actifs sont mis à jour
  ActiveTraçabilité True
  ActiveChamp "jeu_indice", True
  
  If Not bPrépareEditAdd(cjeuAdd, colColonnes, colChamps) Then
    cjeuAdd.CloseCurseur
    ActiveTraçabilité False
    ActiveChamp "jeu_indice", False
    Exit Sub
  End If
  cjeuAdd.CloseCurseur
  
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cJeu Is Nothing Then cJeu.CloseCurseur
  Set cJeu = New BDCurseur
  
  sFinalWP = "jeu_indice=" & colChamps("jeu_indice")
  sQuery = "select * from jeucat where " & sFinalWP
  cJeu.OpenCurseur sQuery
  cJeu.MoveFirst
  
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
  Assert Not cJeu Is Nothing
  
  If colChamps("jeu_libelle") <> sNormaliseNom(colChamps("jeu_libelle")) Then
    colChamps("jeu_libelle") = sNormaliseNom(colChamps("jeu_libelle"))
    MsgBox "Attention, le nom a été modifié pour correspondre aux règles générales de créations de nom (pas d'espaces en double, nom en majuscules, le É est la seule majuscule accentuée acceptée).", vbInformation, App.Title
  End If

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cJeu.Edit
      
  ' Traçabilité ancien style
   InitTraçabilité colChamps, "jeu", False
   ActiveTraçabilité True     ' Pour mettre à jour la base

  If Not bPrépareEditAdd(cJeu, colColonnes, colChamps) Then
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
  
  PurgeCacheJeu colChamps("jeu_indice")

  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ActionValidate()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
 
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub


Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  BDActiveFormulaire colChamps, False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cJeu Is Nothing Then
    If Not (cJeu.EOF And cJeu.BOF) Then
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
  BDActiveFormulaire colChamps, True
  
  colChamps("jeu_indice").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cJeu Is Nothing
  
  If cJeu.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If

  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True

  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "jeu_indice", False
  'ActiveChamp "jeu_etat", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False


  colChamps("jeu_libelle").SetFocus
  AutoSelect colChamps("jeu_libelle"), True
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
  BDActiveFormulaire colChamps, True
  ActiveChamp "jeu_indice", False
  'ActiveChamp "jeu_etat", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  colChamps("jeu_libelle").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub



Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cJeu Is Nothing

  If cJeu.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  
  Dim iNb As Integer
  iNb = BDCurseurExpress("select count(*) from nouvcat where ncat_jeu=" & colChamps("jeu_indice"))
  If iNb > 0 Then
  MsgBox "Vous ne pouvez pas supprimer ce jeu, il y " & iNb & " catégorie(s) rattachée(s)." & vbCrLf & vbCrLf & "Supprimez les catégories avant de supprimer le jeu.", vbExclamation, App.Title
  If Not bShiftPressed Then Exit Sub
  End If

  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cJeu.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  PurgeCacheJeu colChamps("jeu_indice")
  
  cJeu.MoveNext
  If cJeu.EOF Then
    cJeu.MovePrevious
    If cJeu.BOF Then
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


  
Public Sub ActionDétruit()    ' Détruit l'enregistrement
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
'  If colChamps("jeu_etat") <> "S" Then
'    MsgBox "Vous ne pouvez pas détruire un enregistrement sans l'avoir au préalable supprimé (état S)", vbExclamation, App.Title
'    Exit Sub
'  End If
  
  On Error Resume Next
  cJeu.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0

  ' On place un enregistrement dans synchrodelete
  Dim cSD As New BDCurseur
  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
  cSD.AddNew
  cSD!sd_table = sTable
  cSD!sd_timestamp = BDTime
  cSD!sd_wherepart = "jeu_indice=" & sFormToSQL(colChamps("jeu_indice"), BDTypeINTEGER)
  cSD.Update
  cSD.CloseCurseur

  
  cJeu.MoveNext
  If cJeu.EOF Then
    cJeu.MovePrevious
    If cJeu.BOF Then
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

Private Sub ActiveTraçabilité(bEnable As Boolean)
  ActiveChamp "jeu_datecreat", bEnable
  ActiveChamp "jeu_heurecreat", bEnable
  ActiveChamp "jeu_opercreat", bEnable
  ActiveChamp "jeu_datemodif", bEnable
  ActiveChamp "jeu_heuremodif", bEnable
  ActiveChamp "jeu_opermodif", bEnable
'  ActiveChamp "jeu_tsvalid", bEnable
'  ActiveChamp "jeu_opervalid", bEnable
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cJeu Is Nothing

  bdSél.ButtonEnabled("First") = cJeu.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cJeu.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cJeu.EOF
  bdSél.ButtonEnabled("Last") = Not cJeu.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cJeu.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cJeu.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cJeu.MoveNext
  AjusteMouvements
  If cJeu.EOF Then cJeu.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cJeu.MovePrevious
  AjusteMouvements
  If cJeu.BOF Then cJeu.MoveFirst
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


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  bdSél.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
End Sub

Private Sub txtChamp_DblClick(Index As Integer)
  If iMode = meAdd And txtChamp(Index).DataField = "jeu_indice" Then
    ActiveChamp "jeu_indice", True
  End If
End Sub

' Filtrage des Entrée intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
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
0
  
  ' Chargement des combos
  
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcOperModif.AddItem u.uti_numuti, u.uti_nom
  Next

  
  ' Formulaire en mode initial
  Set cJeu = Nothing
  BDActiveFormulaire colChamps, False
  bdSél.LectureSeule = bLectureSeule
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  bdSél.SetFocus
  
  SetMessage
  SetStatus
  sFinalWP = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'opération en cours avant de fermer la fenêtre !", vbCritical, App.Title
    If Not bShiftPressed Then
      Cancel = True
      Exit Sub
    End If
  End If

  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cJeu Is Nothing Then cJeu.CloseCurseur
  MDIStatistiques.AjusteMenus -1
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
'  ActiveTimer mtStop
  If cJeu Is Nothing Then
    EffaceFormulaire
  ElseIf cJeu.BOF And cJeu.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cJeu.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cJeu.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cJeu.AbsolutePosition
'    ActiveTimer mtRapide      ' Mise à jour en arrière plan
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cJeu.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


'
'' Champs satellites sur timer
'Private Sub timSatellites_Timer()
'  ActiveTimer mtStop
'
'  'NC
'  '  If bdcGroupe.ListIndex < 0 Then
'  '   SynchroGroupe
'  '  End If
'End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  bdSél.NumRec = ""
End Sub

'
'' Activation du timer de mise à jour des champs satellites
'Private Sub ActiveTimer(mtMode As eModeTimer)
'  Select Case mtMode
'    Case mtStop:    timSatellites.Enabled = False
'    Case mtLent:    timSatellites.Interval = 1000:  timSatellites.Enabled = True
'    Case mtRapide:  timSatellites.Interval = 250:   timSatellites.Enabled = True
'  End Select
'End Sub


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
  BDCopieSélection cJeu, colChamps, bdSél
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
  On Error GoTo pb
  
  Dim iChoix As Integer
  iChoix = 1
'  iChoix = frmMessageChoix.ChoixEtat("Etat VB6", "Nouvelle présentation")
'  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
  Exit Sub
  
pb:
  intlMessageErreurEtat
End Sub

Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Select Case iChoix
    Case 1:
      ChargeJeuCat
      Set drTitreJeuDet.DataSource = rJC
  
      With drTitreJeuDet.Sections("secReportHeader").Controls
        !lblApplication.Caption = !lblApplication.Caption & " " & App.Major & "." & App.Minor & "." & App.Revision & " sur le système " & Environ("SYSTEMID")
        !lblDate.Caption = "Édité le %D à %t par " & sNomOpérateur & " connecté à " & BDSource & " (" & cSystèmeCA & ")"
      End With
      
      On Error Resume Next    ' Si pas d'imprimante configurée
      If bImpression Then
        drTitreJeuDet.PrintReport
        Unload drTitreJeuDet
      Else
        drTitreJeuDet.Show
      End If
      
      rJC.Close
      Set rJC = Nothing
  End Select
End Sub

' Remplit le recordset structuré rJC avec les jeux, catégories et définitions
Private Sub ChargeJeuCat()
  Screen.MousePointer = vbHourglass
  SetStatus "Lecture des enregistrements, patientez..."
  
  Dim rsCat As ADODB.Recordset
  Dim rsDef As ADODB.Recordset
  
  ' On récupère les données
  Set rJC = New ADODB.Recordset
  rJC.ActiveConnection = "provider=msdatashape;data provider=none;"
  
  rJC.Open "SHAPE APPEND new adInteger As jeu_indice, " & _
      " New adVarChar(35) As jeu_libelle, " & _
      " New adVarChar(65) As jeu_comment, " & _
      "((SHAPE APPEND new adInteger As ncat_jeu, " & _
      " New adInteger As ncat_indice, " & _
      " New adVarChar(35) As ncat_libelle, " & _
      "((SHAPE APPEND new adInteger As dca_jeu, " & _
      " New adInteger As dca_categ, " & _
      " New adInteger As dca_t1, " & _
      " New adInteger As dca_t2, " & _
      " New adInteger As dca_t3, " & _
      " New adInteger As dca_t4, " & _
      " New adInteger As dca_t5, " & _
      " New adVarChar(120) As dca_description) " & _
      " RELATE ncat_jeu TO dca_jeu,ncat_indice TO dca_categ) As Définitions) " & _
      " RELATE jeu_indice TO ncat_jeu) AS Catégories", , _
       adOpenStatic, adLockOptimistic

  EffaceFormulaire
  Refresh

  cJeu.MoveFirst
  Do Until cJeu.EOF
    If cJeu.AbsolutePosition Mod 10 = 0 Then
      bdSél.NumRec = cJeu.AbsolutePosition
      bdSél.RefreshNumRec
    End If
    
    rJC.AddNew
    rJC!jeu_indice = cJeu!jeu_indice
    rJC!jeu_libelle = cJeu!jeu_libelle
    rJC!jeu_comment = cJeu!jeu_comment
    
    Set rsCat = rJC("Catégories").Value
    Dim cCat As New BDCurseur
    cCat.OpenCurseur "select ncat_jeu,ncat_indice,ncat_libelle from nouvcat where ncat_jeu=" & cJeu!jeu_indice
    Do Until cCat.EOF
      rsCat.AddNew
      rsCat!ncat_jeu = cCat!ncat_jeu
      rsCat!ncat_indice = cCat!ncat_indice
      rsCat!ncat_libelle = cCat!ncat_libelle
      
      Set rsDef = rsCat("Définitions").Value
      Dim cDef As New BDCurseur
      cDef.OpenCurseur "select dca_jeu,dca_categ,dca_indice,dca_t1,dca_t2,dca_t3,dca_t4,dca_t5,dca_numpro from defcat where dca_jeu=" & cJeu!jeu_indice & " and dca_categ=" & cCat!ncat_indice & " order by dca_indice"
      Do Until cDef.EOF
        rsDef.AddNew
        rsDef!dca_jeu = cDef!dca_jeu
        rsDef!dca_categ = cDef!dca_categ
        If IsNull(cDef!dca_numpro) Then
          rsDef!dca_t1 = cDef!dca_t1
          rsDef!dca_t2 = cDef!dca_t2
          rsDef!dca_t3 = cDef!dca_t3
          rsDef!dca_t4 = cDef!dca_t4
          rsDef!dca_t5 = cDef!dca_t5
          rsDef!dca_description = Left(sType(NZ(cDef!dca_t1), NZ(cDef!dca_t2), NZ(cDef!dca_t3), NZ(cDef!dca_t4), NZ(cDef!dca_t5)), 120)
        Else
          rsDef!dca_t1 = Null
          rsDef!dca_t2 = Null
          rsDef!dca_t3 = Null
          rsDef!dca_t4 = Null
          rsDef!dca_t5 = Null
          rsDef!dca_description = Left("Produit " & cDef!dca_numpro & ": " & sType(5, cDef!dca_numpro, 0, 0, 0), 120)
        End If
        cDef.MoveNext
      Loop
      cDef.CloseCurseur
      
      cCat.MoveNext
    Loop
    cCat.CloseCurseur

    cJeu.MoveNext
  Loop
  ' On ne ferme pas cJeu, c'est le curseur "principal" de la feuille
  
  cJeu.MoveFirst
  SynchroniseFormulaire
  
  SetStatus
  Screen.MousePointer = vbDefault
End Sub

