VERSION 5.00
Object = "{CFC13920-9EF4-11D0-B72F-0000C04D4C0A}#6.0#0"; "MSWLESS.OCX"
Begin VB.Form frmRubVentilation 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des rubriques de ventilation"
   ClientHeight    =   2070
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8115
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmRubVentilation.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   138
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   541
   Tag             =   "Données"
   Begin VB.Frame frlTraçabilité 
      Caption         =   "Traçabilité"
      Height          =   735
      Left            =   60
      TabIndex        =   5
      Top             =   1260
      Width           =   7995
      Begin MSWLess.WLText txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   14
         Left            =   1680
         TabIndex        =   3
         Tag             =   "Champ interne de synchronisation, format AAAA-MM-JJ HH:MM:SS"
         Top             =   240
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483630
         BackColor       =   -2147483639
         BorderStyle     =   1
         Appearance      =   1
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   6
         Top             =   300
         Width           =   1155
      End
   End
   Begin TablesFacturation.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   7
      Top             =   0
      Width           =   8115
      _ExtentX        =   14314
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
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*ruv_libelle"
      Height          =   315
      Index           =   4
      Left            =   1740
      TabIndex        =   2
      Tag             =   "Libellé de la rubrique de ventilation"
      Top             =   840
      Width           =   6315
      _ExtentX        =   11139
      _ExtentY        =   556
      _Version        =   393216
      MaxLength       =   60
      ForeColor       =   -2147483630
      BackColor       =   -2147483639
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin MSWLess.WLText txtChamp 
      DataField       =   "*ruv_numruv"
      Height          =   315
      Index           =   0
      Left            =   1740
      TabIndex        =   1
      Tag             =   "N° de la rubrique de ventilation"
      Top             =   480
      Width           =   795
      _ExtentX        =   1402
      _ExtentY        =   556
      _Version        =   393216
      ForeColor       =   -2147483630
      BackColor       =   -2147483639
      BorderStyle     =   1
      Appearance      =   1
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Libellé:"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   4
      Top             =   900
      Width           =   675
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Numéro :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   870
   End
End
Attribute VB_Name = "frmRubVentilation"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmRubVentilation
' Feuille de gestion des rubriques de ventilation
' 30/08/1999 NC

Option Explicit

Private cRV As BDCurseur                  ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private Const sTable = "rubvent"


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
  
  Dim cRVQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from rubvent where " & sWP & " order by ruv_numruv"
  
  cRVQuery.OpenCurseur sQuery
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    BDActiveFormulaire colChamps, True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cRV Is Nothing Then cRV.CloseCurseur
  Set cRV = cRVQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cRV.EOF And cRV.BOF) Then
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
  
'  ' On contrôle que le pays est valide
'  If bdcPays.ListIndex < 0 Then
'    bdcPays.Synchronise
'    If bdcPays.ListIndex < 0 Then
'      MsgBox "Pays inconnu !", vbExclamation, App.Title
'      bdcPays.SetFocus
'      Exit Function
'    End If
'  End If
  

  ' On regarde si le nom n'existe pas déjà
  Dim iSer As Long
  iSer = BDCurseurExpress("select ruv_numruv from rubvent where ruv_libelle=" & sFormToSQL(colChamps("ruv_libelle"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("ruv_numruv") Then
    MsgBox "ATTENTION - Cette rubrique de ventilation existe déjà sous le n° " & iSer & ".", vbExclamation, App.Title
    Exit Function
  End If
  
  ' On regarde si le code de la rubrique est dèjà attribué uniquement en cas d'ajout
  If iMode = meAdd Then
    Dim iSer1 As Integer
    iSer1 = BDCurseurExpress("select ruv_numruv from rubvent where ruv_numruv=" & sFormToSQL(colChamps("ruv_numruv"), BDTypeINTEGER))
    If iSer1 <> 0 Then
      MsgBox "ATTENTION - Ce numéro de rubrique existe déjà.", vbExclamation, App.Title
      Exit Function
    End If
  End If
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  Dim cRVAdd As New BDCurseur
  cRVAdd.OpenCurseur "select * from rubvent where ruv_numruv=0"
  cRVAdd.AddNew

  If Not bPrépareEditAdd(cRVAdd, colColonnes, colChamps) Then
    cRVAdd.CloseCurseur
    Exit Sub
  End If
  cRVAdd.CloseCurseur
 
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cRV Is Nothing Then cRV.CloseCurseur
  Set cRV = New BDCurseur
  
  sFinalWP = "ruv_numruv=" & colChamps("ruv_numruv")
  sQuery = "select * from rubvent where " & sFinalWP
  cRV.OpenCurseur sQuery
  cRV.MoveFirst
  
  BDActiveFormulaire colChamps, False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  bdSél.EmpêcheMouvements
  
  RubVentilationARecharger  ' Cache à recharger
  
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cRV Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cRV.Edit
    
  If Not bPrépareEditAdd(cRV, colColonnes, colChamps) Then Exit Sub
  
  BDActiveFormulaire colChamps, False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  AjusteMouvements
  
  RubVentilationARecharger  ' Cache à recharger

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
  If Not cRV Is Nothing Then
    If Not (cRV.EOF And cRV.BOF) Then
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
  
  colChamps("ruv_numruv").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cRV Is Nothing
  
  colChamps("ruv_libelle").SetFocus
  AutoSelect colChamps("ruv_numruv"), True
  
  If cRV.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "ruv_numruv", False
  ActiveChamp "timestamp", False
  
  iMode = meChange
  SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionAdd()
  colChamps("ruv_numruv").SetFocus
  
'$ NC
' On regarde si le numéro existe déjà
'  Dim cRubVAdd As New BDCurseur
'  cRubVAdd.OpenCurseur "select * from rubvent where ruv_numruv=0"
'  cRubVAdd.AddNew
'  If cRubVAdd = colChamps("ruv_numruv") Then
'    MsgBox "N° existant"
'    Exit Sub
'  End If

'  Dim cnumbanque As New BDCurseur
'  cnumbanque.OpenCurseur "select max (ban_numbanque) from banque"
'  colChamps("ban_numbanque") = cnumbanque.Fields(0) + 1
'  cBanqueAdd!ban_numbanque = cnumbanque.Fields(0) + 1
'  cnumbanque.CloseCurseur
  
  
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "timestamp", False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cRV Is Nothing
  
  If cRV.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cRV.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
'  ' On place un enregistrement dans synchrodelete
'  Dim cSD As New BDCurseur
'  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
'  cSD.AddNew
'  cSD!sd_table = sTable
'  cSD!sd_timestamp = Now+tOffsetNow
'  cSD!sd_wherepart = "ruv_numruv=" & sFormToSQL(colChamps("ruv_numruv"), BDTypeINTEGER)
'  cSD.Update
'  cSD.CloseCurseur
  
  cRV.MoveNext
  If cRV.EOF Then
    cRV.MovePrevious
    If cRV.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  RubVentilationARecharger  ' Cache à recharger
  
  bdSél.ActiveMouvements iMode = meNavigate
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cRV Is Nothing

  bdSél.ButtonEnabled("First") = cRV.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cRV.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cRV.EOF
  bdSél.ButtonEnabled("Last") = Not cRV.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cRV.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cRV.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cRV.MoveNext
  AjusteMouvements
  If cRV.EOF Then cRV.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cRV.MovePrevious
  AjusteMouvements
  If cRV.BOF Then cRV.MoveFirst
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
'  Dim p As Pays
'  For Each p In colPays
'    bdcPays.AddItem p.pay_pays, p.pay_libelle
'  Next
'
'  Dim u As Utilisateur
'  For Each u In colUtilisateur
'    bdcOperCreat.AddItem u.uti_numuti, u.uti_l1
'    bdcOperModif.AddItem u.uti_numuti, u.uti_l1
'    bdcOperValid.AddItem u.uti_numuti, u.uti_l1
'  Next

  
  ' Formulaire en mode initial
  Set cRV = Nothing
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
  If Not cRV Is Nothing Then cRV.CloseCurseur
  MDIFacturation.AjusteMenus -1
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
  If cRV Is Nothing Then
    EffaceFormulaire
  ElseIf cRV.BOF And cRV.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cRV.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cRV.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cRV.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cRV.bEffacé = True
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

'Private Sub bdcPays_GotFocus()
'  SetStatus bdcPays.Tag
'End Sub

'Private Sub bdcPays_LostFocus()
'  bdcPays.Synchronise
'End Sub

'NC
'Private Sub bdcRV_GotFocus()
'  SetStatus bdcRV.Tag
'End Sub

'NC
'Private Sub bdcRV_LostFocus()
'  If bdcRV <> "" Then
'    bdcRV.Synchronise
'    If bdcRV.ListIndex < 0 Then Synchrorubvent
'  End If
'End Sub

'NC
'Private Sub Synchrorubvent()
'  Dim iNum As Long, sNom As String
'  iNum = Int(Val(bdcRV))
'  sNom = BDCurseurExpress("select ruv_libelle from rubvent where ruv_numruv=" & iNum)
'  If sNom <> "" Then bdcRV.AddItem iNum, sNom
'End Sub

'Private Sub bdcOperCreat_GotFocus()
'  SetStatus bdcOperCreat.Tag
'End Sub
'
'Private Sub bdcOperModif_GotFocus()
'  SetStatus bdcOperModif.Tag
'End Sub
'
'Private Sub bdcOperValid_GotFocus()
'  SetStatus bdcOperValid.Tag
'End Sub
'

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
  BDCopieSélection cRV, colChamps, bdSél
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
  Dim sSQL As String
  sSQL = "select * from rubvent where " & sFinalWP & " order by ruv_numruv"
  BDEtat sSQL, drRubVentilation, bImpression
End Sub

