VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmRefDoc 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des références documentaires"
   ClientHeight    =   6225
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
   ScaleHeight     =   415
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   593
   Tag             =   "Données"
   Begin VB.TextBox txtChamp 
      DataField       =   "rd_objet3"
      Height          =   315
      Index           =   11
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   32
      Top             =   4740
      Width           =   5835
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "rd_objet2"
      Height          =   315
      Index           =   10
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   31
      Top             =   4380
      Width           =   5835
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "feu_adr1"
      Height          =   315
      Index           =   14
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   30
      Top             =   5820
      Width           =   5295
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "feu_adr1"
      Height          =   315
      Index           =   13
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   27
      Top             =   5460
      Width           =   5295
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "rd_info"
      Height          =   315
      Index           =   12
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   25
      Top             =   5100
      Width           =   5295
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_objet1"
      Height          =   315
      Index           =   9
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   21
      Top             =   4020
      Width           =   5835
   End
   Begin VB.TextBox txtChamp 
      Height          =   315
      Index           =   8
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   19
      Top             =   3660
      Width           =   3555
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_date"
      Height          =   315
      Index           =   7
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   17
      Top             =   3300
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_ie"
      Height          =   315
      Index           =   6
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   15
      Top             =   2940
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_serie"
      Height          =   315
      Index           =   5
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   12
      Top             =   2580
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_jouran"
      Height          =   315
      Index           =   4
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   10
      Top             =   2220
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_annee"
      Height          =   315
      Index           =   3
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   8
      Top             =   1860
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_dactylo"
      Height          =   315
      Index           =   2
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   6
      Top             =   1500
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*^rd_auteur"
      Height          =   315
      Index           =   1
      Left            =   3000
      MaxLength       =   65
      TabIndex        =   5
      Top             =   1140
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rd_direction"
      Height          =   315
      Index           =   0
      Left            =   3000
      TabIndex        =   1
      Top             =   780
      Width           =   795
   End
   Begin MSComctlLib.StatusBar sbMessage 
      Align           =   1  'Align Top
      Height          =   315
      Left            =   0
      TabIndex        =   4
      Top             =   0
      Width           =   8895
      _ExtentX        =   15690
      _ExtentY        =   556
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Arborescence du fichier:"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   29
      Top             =   5880
      Width           =   2265
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Nom du fichier:"
      Height          =   210
      Index           =   18
      Left            =   0
      TabIndex        =   28
      Top             =   60
      Width           =   1410
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Nom du fichier:"
      Height          =   210
      Index           =   17
      Left            =   60
      TabIndex        =   26
      Top             =   5520
      Width           =   1410
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Nom du destinataire (doc Ext):"
      Height          =   210
      Index           =   16
      Left            =   60
      TabIndex        =   24
      Top             =   5160
      Width           =   2895
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Objet / Résumé / Titre :"
      Height          =   210
      Index           =   15
      Left            =   0
      TabIndex        =   23
      Top             =   60
      Width           =   2220
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Objet / Résumé / Titre :"
      Height          =   210
      Index           =   14
      Left            =   0
      TabIndex        =   22
      Top             =   60
      Width           =   2220
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Objet / Résumé / Titre :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   20
      Top             =   4080
      Width           =   2220
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Référence générée :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   18
      Top             =   3720
      Width           =   1935
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Date en clair du document :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   16
      Top             =   3360
      Width           =   2610
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Interne/Externe :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   14
      Top             =   3000
      Width           =   1650
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "N° de série du document :"
      Height          =   210
      Index           =   8
      Left            =   0
      TabIndex        =   13
      Top             =   60
      Width           =   2490
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "N° de série du document :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   11
      Top             =   2640
      Width           =   2490
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Jour de l'année :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   9
      Top             =   2280
      Width           =   1575
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Année :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   7
      Top             =   1920
      Width           =   735
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Saisi par :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   3
      Top             =   1560
      Width           =   945
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Auteur du document :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   2
      Top             =   1200
      Width           =   2055
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Direction :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   840
      Width           =   960
   End
End
Attribute VB_Name = "frmRefDoc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmFEU
' Feuille de gestion des fiches d'envoi urgent
' 13/02/1998 PV
'  8/07/1998 PV Utilisation d'un BDSélecteur, Copie des données
' 15/08/1998 PV BDActiveChamp
'  8/04/1999 PV Squelette d'impression


Option Explicit

Private cFeu As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private sFinalSQL As String               ' Requête SQL courante

Private Const sTable = "feu"


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
        MsgBox "Erreur dans la requête !" & vbCrLf & sMsg, vbExclamation, sNomApp
        t.SetFocus
        Exit Sub
      End If
      If sWP <> "" Then sWP = sWP & " and "
      sWP = sWP & "(" & sFinal & ")"
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, sNomApp)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cFeuQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from feu where " & sWP & " order by feu_numfeu"
  cFeuQuery.OpenCurseur sSQL
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, sNomApp
    ActiveFormulaire True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cFeu Is Nothing Then cFeu.CloseCurseur
  Set cFeu = cFeuQuery
  sFinalSQL = sSQL
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cFeu.EOF And cFeu.BOF) Then
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
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim cFeuAdd As New BDCurseur
  cFeuAdd.OpenCurseur "select * from feu where feu_numfeu=0"
  cFeuAdd.AddNew
  
  ' On récupère un n° de FEU
  Dim cNumFeu As New BDCurseur
  cNumFeu.OpenCurseur "select max(feu_numfeu) from feu"
  colChamps("feu_numfeu") = cNumFeu.Item(0) + 1
  cFeuAdd!feu_numfeu = cNumFeu.Item(0) + 1
  cNumFeu.CloseCurseur
  
  If Not bPrépareEditAdd(cFeuAdd, colColonnes, colChamps) Then
    cFeuAdd.CloseCurseur
    colChamps("feu_numfeu") = ""
    Exit Sub
  End If
  cFeuAdd.CloseCurseur
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cFeu Is Nothing Then cFeu.CloseCurseur
  Set cFeu = New BDCurseur
  sFinalSQL = "select * from feu where feu_numfeu=" & sFormToSQL(colChamps("feu_numfeu"), BDTypeINTEGER)
  cFeu.OpenCurseur sFinalSQL
  cFeu.MoveFirst
  
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  EmpêcheMouvements
  
  SetMessage
  SetStatus
  bdSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cFeu Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cFeu.Edit
  If Not bPrépareEditAdd(cFeu, colColonnes, colChamps) Then Exit Sub

  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  bdSél.SetFocus
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
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cFeu Is Nothing Then
    If Not (cFeu.EOF And cFeu.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
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
  ActiveFormulaire True
  
  colChamps("feu_numfeu").SetFocus
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cFeu Is Nothing
  
  If cFeu.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "feu_numfeu", False
  ActiveChamp "timestamp", False
  
  colChamps("feu_titre").SetFocus
  AutoSelect colChamps("feu_titre"), True
  
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
  ActiveFormulaire True
  ActiveChamp "timestamp", False
  ActiveChamp "feu_numfeu", False
  
  colChamps("feu_titre").SetFocus
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cFeu Is Nothing

  If cFeu.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, sNomApp
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, sNomApp)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cFeu.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cFeu.MoveNext
  If cFeu.EOF Then
    cFeu.MovePrevious
    If cFeu.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  bdSél.ActiveMouvements iMode = meNavigate
  bdSél.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cFeu Is Nothing

  bdSél.ButtonEnabled("First") = cFeu.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cFeu.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cFeu.EOF
  bdSél.ButtonEnabled("Last") = Not cFeu.EOF
End Sub

Private Sub EmpêcheMouvements()
  bdSél.ButtonEnabled("First") = False
  bdSél.ButtonEnabled("Previous") = False
  bdSél.ButtonEnabled("Next") = False
  bdSél.ButtonEnabled("Last") = False
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cFeu.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cFeu.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cFeu.MoveNext
  AjusteMouvements
  If cFeu.EOF Then cFeu.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cFeu.MovePrevious
  AjusteMouvements
  If cFeu.BOF Then cFeu.MoveFirst
  SynchroniseFormulaire
End Sub


Private Sub btnInfoNiveaux_Click()
  FileShellExecute hwnd, "http://www.silliker/microbsoft/serveur/codes.htm"
End Sub


Private Sub btnEtbAttachés_Click()
  If IsNumeric(colChamps("feu_numfeu")) Then frmEtbAttachés.AfficheEtbAttachés CLng(colChamps("feu_numfeu"))
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


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  Show
  SetStatus "Chargement en cours, patientez…"
  If colColonnes.Count = 0 Then
    BDDécritTable sTable, colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If

  
  ' Pas de chargement des combos !
  
  
  ' Formulaire en mode initial
  Set cFeu = Nothing
  ActiveFormulaire False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  bdSél.SetFocus
  
  SetMessage
  SetStatus
  sFinalSQL = ""
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'opération en cours avant de fermer la fenêtre !", vbCritical, sNomApp
    Cancel = True
    Exit Sub
  End If

  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cFeu Is Nothing Then cFeu.CloseCurseur
  MDIFEU.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub

'=================================================================================

Private Sub SynchroniseFormulaire()
  If cFeu Is Nothing Then
    EffaceFormulaire
  ElseIf cFeu.BOF And cFeu.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cFeu.Item(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cFeu.Item(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    bdSél.NumRec = cFeu.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cFeu.bEffacé = True
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
  bdSél.NumRec = ""
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


Private Sub lblLabels_Click(Index As Integer)

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


'=================================================================================
' Accès au Web

Public Sub FenêtreWeb()
  FileShellExecute hwnd, "http://www.silliker/cgi-bin/rechxxx?table=feu"
End Sub


'=================================================================================
' Copie des données dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours…"
  BDCopieSélection cFeu, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  BDEtat sFinalSQL, drFEU, True
End Sub

Public Sub Aperçu()
  BDEtat sFinalSQL, drFEU, False
End Sub


