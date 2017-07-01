VERSION 5.00
Begin VB.Form frmEtape 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des étapes"
   ClientHeight    =   4320
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8415
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmETAPE.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4320
   ScaleWidth      =   8415
   Tag             =   "Données"
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   6
      Left            =   2040
      Locked          =   -1  'True
      TabIndex        =   15
      Tag             =   "date de la dernière modification"
      Top             =   3960
      Width           =   1995
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*etp_num"
      Height          =   315
      Index           =   0
      Left            =   2040
      TabIndex        =   3
      Tag             =   "N° Étape"
      Top             =   900
      Width           =   915
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*etp_duree"
      Height          =   315
      Index           =   3
      Left            =   2040
      TabIndex        =   9
      Tag             =   "durée de l'étape (en jours)"
      Top             =   2160
      Width           =   1215
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etp_comment"
      Height          =   795
      Index           =   4
      Left            =   2040
      MultiLine       =   -1  'True
      TabIndex        =   11
      Tag             =   "Commentaires de l'étape"
      Top             =   2580
      Width           =   5115
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "etp_datevalid"
      Height          =   315
      Index           =   5
      Left            =   2040
      TabIndex        =   13
      Tag             =   "Date de validation de l'étape (rien si elle n'est pas encore validée)"
      Top             =   3480
      Width           =   1515
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*etp_nom"
      Height          =   315
      Index           =   1
      Left            =   2040
      TabIndex        =   5
      Tag             =   "nom de l'étape"
      Top             =   1320
      Width           =   5115
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*etp_resp"
      Height          =   315
      Index           =   2
      Left            =   2040
      TabIndex        =   7
      Tag             =   "nom du responsable"
      Top             =   1740
      Width           =   5115
   End
   Begin Projets.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   16
      Top             =   0
      Width           =   8415
      _ExtentX        =   14843
      _ExtentY        =   767
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin Projets.BDCombo BDcListeProjet 
      Height          =   330
      Left            =   2040
      TabIndex        =   1
      Tag             =   "N° et nom du projet"
      Top             =   480
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
      DataField       =   "*etp_projet"
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   14
      Top             =   4020
      Width           =   1155
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "N° étape :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   2
      Top             =   1020
      Width           =   990
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Nom :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   4
      Top             =   1440
      Width           =   555
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Responsable :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   6
      Top             =   1860
      Width           =   1350
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Durée (jours) :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   8
      Top             =   2280
      Width           =   1395
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Commentaires :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   10
      Top             =   2640
      Width           =   1500
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Date de validation :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   12
      Top             =   3540
      Width           =   1860
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Projet :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   0
      Top             =   600
      Width           =   705
   End
End
Attribute VB_Name = "frmEtape"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmEtape
' Gestion des étapes
' 14/08/1998 SS
'  1/04/1999 PV Impressions


Option Explicit

Private cEtapes As BDCurseur              ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition
Private sFinalWP As String                ' Where-part de la requête SQL courante

Private Const sTable As String = "etape"


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
  
  Dim cEtapesQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cEtapesQuery.OpenCurseur "select * from etape where " & sWP & " order by etp_projet"
  iErr = Err
  sErr = Error
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    ActiveFormulaire True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cEtapes Is Nothing Then cEtapes.CloseCurseur
  Set cEtapes = cEtapesQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cEtapes.EOF And cEtapes.BOF) Then
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
  bOkValeurs = True
  
  If Subst(colChamps("etp_duree"), ".", ",") < 0 Then
    bOkValeurs = False
    MsgBox " Une durée ne peut être négative !"
  End If
  
  If colChamps("etp_num") < 0 Then
    bOkValeurs = False
    MsgBox " Un numéro d'étape ne peut être négatif !"
  End If
    
    
End Function


Private Sub ValidateAdd()
  Dim sType As String
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cEtapesAdd As New BDCurseur
  cEtapesAdd.OpenCurseur "select * from etape where etp_projet=0"
  cEtapesAdd.AddNew
  cEtapesAdd!timestamp = BDTime
  If Not bPrépareEditAdd(cEtapesAdd, colColonnes, colChamps) Then cEtapesAdd.CloseCurseur: Exit Sub
  cEtapesAdd.CloseCurseur
  

  If Not cEtapes Is Nothing Then cEtapes.CloseCurseur
  Set cEtapes = New BDCurseur
  sFinalWP = "etp_num= " & sFormToSQL(txtChamp(0), BDTypeCHAR) & " and etp_projet= " & sFormToSQL(BDcListeProjet, BDTypeINTEGER)
  cEtapes.OpenCurseur "select * from etape where " & sFinalWP

  
  
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  ' Affiche le timestamp
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
  Dim sType As String
  Assert iMode = meChange
  Assert Not cEtapes Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cEtapes.Edit
  cEtapes!timestamp = BDTime
  If Not bPrépareEditAdd(cEtapes, colColonnes, colChamps) Then Exit Sub

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
  bdSél.TabStop = True
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
  If Not cEtapes Is Nothing Then
    If Not (cEtapes.EOF And cEtapes.BOF) Then
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
  ActiveFormulaire True
  
  colChamps("etp_projet").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cEtapes Is Nothing
  
  If cEtapes.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "etp_projet", False
  ActiveChamp "timestamp", False
  colChamps("etp_num").SetFocus
  AutoSelect colChamps("etp_num"), True
  
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
  bdSél.TabStop = False
  ActiveChamp "timestamp", False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
  colChamps("etp_projet").SetFocus
  
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cEtapes Is Nothing

  If cEtapes.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cEtapes.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cEtapes.MoveNext
  
  ' On place un enregistrement dans synchrodelete
  Dim cSD As New BDCurseur
  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
  cSD.AddNew
  cSD!sd_table = sTable
  cSD!sd_timestamp = BDTime
  cSD!sd_wherepart = "etp_num=" & sFormToSQL(colChamps("etp_num"), BDTypeINTEGER)
  cSD.Update
  cSD.CloseCurseur
  
  If cEtapes.EOF Then
    cEtapes.MovePrevious
    If cEtapes.BOF Then
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
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cEtapes Is Nothing

  bdSél.ButtonEnabled("First") = cEtapes.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cEtapes.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cEtapes.EOF
  bdSél.ButtonEnabled("Last") = Not cEtapes.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cEtapes.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cEtapes.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cEtapes.MoveNext
  AjusteMouvements
  If cEtapes.EOF Then cEtapes.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cEtapes.MovePrevious
  AjusteMouvements
  If cEtapes.BOF Then cEtapes.MoveFirst
  SynchroniseFormulaire
End Sub




Private Sub BDcListeProjet_GotFocus()
    SetStatus "Numéro et nom du projet"
End Sub

Private Sub BDcListeprojet_LostFocus()
  BDcListeProjet.Synchronise
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

Public Sub AfficheEtapes(ByVal sNumProjet As String, Optional iEtape)
  Load Me
  EffaceFormulaire
  ActiveFormulaire True
  iMode = meQuery
  colChamps("etp_projet") = sNumProjet
  If Not IsMissing(iEtape) Then colChamps("etp_num") = iEtape
  ValidateQuery
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
  
  
  ' Chargement des combos
  Dim BDC As New BDCurseur
  BDC.OpenCurseur "select prj_num, prj_nom from projet where 1=1 order by prj_num"
  While Not BDC.EOF
    BDcListeProjet.AddItem BDC!prj_num, BDC!prj_nom
    BDC.MoveNext
  Wend
  
  BDC.CloseCurseur
  ' …
  
  
  ' Formulaire en mode initial
  Set cEtapes = Nothing
  ActiveFormulaire False
  With bdSél
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
  If Not cEtapes Is Nothing Then cEtapes.CloseCurseur
  MDIProjets.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cEtapes Is Nothing Then
    EffaceFormulaire
  ElseIf cEtapes.BOF And cEtapes.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cEtapes.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cEtapes.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cEtapes.AbsolutePosition
       
    ' Mise à jour en arrière plan
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cEtapes.bEffacé = True
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
   Dim chaine As String
  If colChamps("etp_projet") <> "" Then
     chaine = "?btnAction=Details&txtNumPro=" & colChamps("etp_projet")
  Else
    chaine = ""
  End If
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/projet" & chaine
End Sub


'=================================================================================
' Copie des données dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours…"
  BDCopieSélection cEtapes, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  Etat True
End Sub

Public Sub Aperçu()
  Etat False
End Sub

Private Sub Etat(ByVal bImpression As Boolean)
  If sFinalWP = "" Then
    MsgBox "Sélectionnez des enregistrements au préalable.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim sSQL As String
  sSQL = "SHAPE {select * from projet where prj_num in (select unique etp_projet from etape where " & sFinalWP & ")} AS Projets APPEND ({select * from etape where " & sFinalWP & "} AS Etape RELATE 'prj_num' TO 'etp_projet') AS Etapes"
  BDEtat sSQL, drEtape, bImpression
End Sub


