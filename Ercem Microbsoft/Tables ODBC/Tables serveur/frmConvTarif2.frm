VERSION 5.00
Begin VB.Form frmConvTarif 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Conversion des tarifs Satti"
   ClientHeight    =   3000
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   9300
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmConvTarif2.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   200
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   620
   Tag             =   "Données"
   Begin VB.TextBox txtSatti 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   3360
      Locked          =   -1  'True
      TabIndex        =   5
      TabStop         =   0   'False
      Tag             =   "Valeur du paramètre Satti"
      Top             =   840
      Width           =   5895
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ct_freq"
      Height          =   315
      Index           =   4
      Left            =   2100
      TabIndex        =   7
      Tag             =   "Nb de fois ou le paramètre est utilisé dans une fiche tarif"
      Top             =   1200
      Width           =   495
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ct_libelle"
      Height          =   315
      Index           =   1
      Left            =   2640
      TabIndex        =   8
      Tag             =   "Libellé descriptif du paramètre"
      Top             =   1200
      Width           =   6615
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ct_param"
      Height          =   315
      Index           =   3
      Left            =   2640
      TabIndex        =   4
      Tag             =   "Valeur du paramètre Satti"
      Top             =   840
      Width           =   675
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ct_c1"
      Height          =   315
      Index           =   15
      Left            =   2100
      MaxLength       =   10
      TabIndex        =   10
      Tag             =   "Critère ou FDA ou Paramètre"
      Top             =   1560
      Width           =   1215
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ct_c2"
      Height          =   315
      Index           =   16
      Left            =   2100
      MaxLength       =   2
      TabIndex        =   12
      Tag             =   "Métaméthode ou Méthode"
      Top             =   1920
      Width           =   495
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ct_idmodif"
      Height          =   315
      Index           =   6
      Left            =   2100
      TabIndex        =   14
      Tag             =   "Origine de la modification"
      Top             =   2280
      Width           =   3750
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   2100
      TabIndex        =   16
      Tag             =   "Date+heure de dernière modification de l'information"
      Top             =   2640
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "ct_niveau"
      Height          =   315
      Index           =   2
      Left            =   2100
      TabIndex        =   3
      Tag             =   "Niveau du paramètre  50=Hygiéno, 51=Catégorie bactério, 52=Catérgorie chimie, 53=Catégorie surface, 54=Paramètre"
      Top             =   840
      Width           =   495
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*ct_numct"
      Height          =   315
      Index           =   0
      Left            =   2100
      TabIndex        =   1
      Tag             =   "N° de série interne unique dans la table de conversion"
      Top             =   480
      Width           =   735
   End
   Begin TablesServeur.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   17
      Top             =   0
      Width           =   9300
      _extentx        =   16087
      _extenty        =   767
      font            =   "frmConvTarif2.frx":0442
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Fréq / Libellé :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   6
      Top             =   1260
      Width           =   1350
   End
   Begin VB.Label lblC1 
      AutoSize        =   -1  'True
      Caption         =   "C1 :"
      Height          =   210
      Left            =   60
      TabIndex        =   9
      Top             =   1620
      Width           =   390
   End
   Begin VB.Label lblC2 
      AutoSize        =   -1  'True
      Caption         =   "C2 :"
      Height          =   210
      Left            =   60
      TabIndex        =   11
      Top             =   1980
      Width           =   390
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   13
      Top             =   2340
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   15
      Top             =   2700
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Niv / Param :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   1215
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "N° interne :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   1110
   End
End
Attribute VB_Name = "frmConvTarif"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmConvTarif
' Gestion de la conversion des tarifs Satti
' 14/01/2001 PV

Option Explicit

Private cCT As BDCurseur                  ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private sFinalSQL As String               ' Requête SQL courante

Private Const sTable = "convtarif"


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
  
  Dim cCTQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from convtarif where " & sWP & " order by ct_niveau,ct_param"
  cCTQuery.OpenCurseur sSQL
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
  If Not cCT Is Nothing Then cCT.CloseCurseur
  Set cCT = cCTQuery
  sFinalSQL = sSQL
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cCT.EOF And cCT.BOF) Then
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
  Dim cCTAdd As New BDCurseur
  cCTAdd.OpenCurseur "select * from convtarif where ct_numct=0"
  cCTAdd.AddNew
  ActiveChamp "ct_freq", True
  ActiveChamp "ct_libelle", True
  If Not bPrépareEditAdd(cCTAdd, colColonnes, colChamps) Then
    ActiveChamp "ct_freq", False
    ActiveChamp "ct_libelle", False
    cCTAdd.CloseCurseur
    Exit Sub
  End If
  cCTAdd.CloseCurseur
  
  Dim iSerial As Long
  iSerial = BDCurseurExpress("select max(ct_numct) from convtarif")

  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cCT Is Nothing Then cCT.CloseCurseur
  Set cCT = New BDCurseur
  sFinalSQL = "select * from convtarif where ct_numct=" & iSerial
  cCT.OpenCurseur sFinalSQL
  cCT.MoveFirst
  
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  
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
  Assert Not cCT Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cCT.Edit
  If Not bPrépareEditAdd(cCT, colColonnes, colChamps) Then Exit Sub

  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  
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
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub





Private Sub ActionCancel()
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cCT Is Nothing Then
    If Not (cCT.EOF And cCT.BOF) Then
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


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cCT Is Nothing
  
  If cCT.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  On Error Resume Next
  cCT.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  
  cCT.MoveNext
  If cCT.EOF Then
    cCT.MovePrevious
    If cCT.BOF Then
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
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, False
  
  colChamps("ct_niveau").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
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
  ActiveChamp "ct_numct", False
  ActiveChamp "ct_freq", False
  ActiveChamp "ct_libelle", False
  ActiveChamp "ct_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("ct_freq") = "1"
  colChamps("ct_libelle") = "Ajouté"
  
  colChamps("ct_niveau").SetFocus
  AutoSelect colChamps("ct_niveau"), True
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cCT Is Nothing
  
  If cCT.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "ct_numct", False
  ActiveChamp "ct_niveau", False
  ActiveChamp "ct_param", False
  ActiveChamp "ct_libelle", False
  ActiveChamp "ct_freq", False
  ActiveChamp "ct_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("ct_c1").SetFocus
  AutoSelect colChamps("ct_c1"), True
  bdSél.TabStop = False
  
  iMode = meChange
  SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cCT Is Nothing
  
  bdSél.ButtonEnabled("First") = cCT.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cCT.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cCT.EOF
  bdSél.ButtonEnabled("Last") = Not cCT.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cCT.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cCT.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cCT.MoveNext
  AjusteMouvements
  If cCT.EOF Then cCT.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cCT.MovePrevious
  AjusteMouvements
  If cCT.BOF Then cCT.MoveFirst
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


  ' Formulaire en mode initial
  Set cCT = Nothing
  ActiveFormulaire False
  With bdSél
    .LectureSeule = bLectureSeule
    .ActiveMouvements False
    .ActiveValidation False
    .ButtonEnabled("Query") = True
    .ButtonEnabled("Delete") = False
    .SetFocus
  End With
  
  iMode = meEmpty
  SetMessage
  SetStatus
  sFinalSQL = ""
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
  If Not cCT Is Nothing Then
    cCT.CloseCurseur
    Set cCT = Nothing
  End If
  MDIServeur.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cCT Is Nothing Then
    EffaceFormulaire
  ElseIf cCT.BOF And cCT.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cCT.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cCT.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    bdSél.NumRec = cCT.AbsolutePosition
    
    Select Case colChamps("ct_niveau")
      Case "50":  lblC1 = "N° EH :": lblC2 = "N° Scénario ou * :": txtSatti = "Satti Contrat Hygiéno"
      Case "51":  lblC1 = "Critère :": lblC2 = "Métaméthode ou * :": txtSatti = "Satti Catégorie bactério B"
      Case "52":  lblC1 = "FDA :": lblC2 = "(vide)": txtSatti = "Satti Catégorie chimie C"
      Case "53":  lblC1 = "Critère :": lblC2 = "Métaméthode ou * :": txtSatti = "Satti Catégorie surface S"
      Case "54":  lblC1 = "N°Paramètre :": lblC2 = "Méthode ou * :": txtSatti = "Satti Paramètre P"
      Case Else:  lblC1 = "?": lblC2 = "?"
    End Select
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cCT.bEffacé = True
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
  lblC1 = "?"
  lblC2 = "?"
  txtSatti = ""
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
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=" & sTable
End Sub


'=================================================================================
' Copie des données dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours…"
  BDCopieSélection cCT, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub



'=================================================================================
' Impression

Public Sub Imprime()
  BDEtat sFinalSQL, drConvTarif, True
End Sub

Public Sub Aperçu()
  BDEtat sFinalSQL, drConvTarif, False
End Sub


