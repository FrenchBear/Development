VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmDest 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Destinataires de FME"
   ClientHeight    =   5220
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8865
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmFMEDest.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   348
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   591
   Tag             =   "Donn�es"
   Begin TablesFEU.BDCombo bdcFr�quence 
      Height          =   330
      Left            =   2100
      TabIndex        =   18
      Top             =   1200
      Width           =   6735
      _ExtentX        =   11880
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
      DataField       =   "*fmd_frequence"
   End
   Begin TablesFEU.BDS�lecteur bdS�l 
      Height          =   435
      Left            =   0
      TabIndex        =   17
      Top             =   0
      Width           =   8775
      _ExtentX        =   15478
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
   Begin VB.TextBox txtTitreFME 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   3060
      Locked          =   -1  'True
      TabIndex        =   2
      TabStop         =   0   'False
      Tag             =   "N� de FME"
      Top             =   480
      Width           =   5775
   End
   Begin VB.TextBox txtDestinataire 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   3060
      Locked          =   -1  'True
      TabIndex        =   5
      TabStop         =   0   'False
      Tag             =   "N� de FME"
      Top             =   840
      Width           =   5775
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*fmd_numcr"
      Height          =   315
      Index           =   1
      Left            =   2100
      TabIndex        =   4
      Tag             =   "N� de centre de r�ception du destinataire"
      Top             =   840
      Width           =   915
   End
   Begin VB.CommandButton btnDocuments 
      Caption         =   "&Documents�"
      Enabled         =   0   'False
      Height          =   375
      Left            =   60
      TabIndex        =   15
      Top             =   2820
      Width           =   1995
   End
   Begin MSComctlLib.ListView lwDocuments 
      Height          =   1935
      Left            =   60
      TabIndex        =   16
      TabStop         =   0   'False
      Top             =   3240
      Width           =   8775
      _ExtentX        =   15478
      _ExtentY        =   3413
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Classe"
         Object.Width           =   1323
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "NbEx"
         Object.Width           =   1323
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Options"
         Object.Width           =   7937
      EndProperty
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "fmd_tscreation"
      Height          =   315
      Index           =   11
      Left            =   6780
      TabIndex        =   14
      Tag             =   "Date+heure de cr�ation"
      Top             =   2280
      Width           =   2055
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   7320
      Top             =   2760
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   2100
      TabIndex        =   12
      Tag             =   "Date+heure de derni�re modification de l'information"
      Top             =   2280
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "fmd_idmodif"
      Height          =   315
      Index           =   12
      Left            =   2100
      TabIndex        =   10
      Tag             =   "Origine de la modification"
      Top             =   1920
      Width           =   3750
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "fmd_comment"
      Height          =   315
      Index           =   8
      Left            =   2100
      TabIndex        =   8
      Tag             =   "Commentaire libre quelconque"
      Top             =   1560
      Width           =   6720
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*fmd_numfme"
      Height          =   315
      Index           =   0
      Left            =   2100
      TabIndex        =   1
      Tag             =   "N� de FME"
      Top             =   480
      Width           =   915
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Cr�� le :"
      Height          =   210
      Index           =   8
      Left            =   5520
      TabIndex        =   13
      Top             =   2340
      Width           =   810
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   11
      Top             =   2340
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   9
      Top             =   1980
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Commentaire :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   7
      Top             =   1620
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Fr�quence d'envoi :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   6
      Top             =   1260
      Width           =   1860
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Destinataire :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   3
      Top             =   900
      Width           =   1290
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "FME :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   510
   End
End
Attribute VB_Name = "frmDest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmFMEDest
' Gestion des destinataires des FME
' 30/07/1998 PV
' 15/08/1998 PV BDActiveChamp

Option Explicit

Private cDest As BDCurseur                ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition

Public g_iFME As Long                    ' N� de FME courant


'=================================================================================
' Acc�s direct

Public Sub AfficheDestinataires(ByVal iFME As Long, Optional iDest)
  g_iFME = iFME
  Load Me
  EffaceFormulaire
  ActiveFormulaire True
  iMode = meQuery
  colChamps("fmd_numfme") = iFME
  If Not IsMissing(iDest) Then colChamps("fmd_numcr") = iDest
  ValidateQuery
End Sub


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
  
  Dim cDestQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cDestQuery.OpenCurseur "select * from fmedest where " & sWP & " order by fmd_numfme,fmd_numcr"
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "�chec lors de la requ�te" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    ActiveFormulaire True
    SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture �ventuelle du curseur en cours
  If Not cDest Is Nothing Then cDest.CloseCurseur
  Set cDest = cDestQuery
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cDest.EOF And cDest.BOF) Then
    iMode = meNavigate
    SetMessage
    btnDocuments.Enabled = True
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
  bOkValeurs = False
  
  ' On r�sout les satellites�
  timSatellites_Timer
  
  If txtTitreFME = "" Or Left(txtTitreFME, 1) = "?" Or txtDestinataire = "" Or Left(txtDestinataire, 1) = "?" Then
    MsgBox "Erreur dans les donn�es." & vbCrLf & vbCrLf & "Vous ne pouvez pas valides ces donn�es tant que le n� de FME et le n� de destinataire ne sont pas corrects !", vbExclamation, App.Title
    bOkValeurs = False
    Exit Function
  End If
  
  ' Tous les tests ont �t� pass�s avec succ�s !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Dim sType As String
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cDestAdd As New BDCurseur
  cDestAdd.OpenCurseur "select * from fmedest where fmd_numfme=0"
  cDestAdd.AddNew
  cDestAdd!fmd_idmodif = sBDIdModif
  cDestAdd!fmd_tscreation = Now
  If Not bPr�pareEditAdd(cDestAdd, colColonnes, colChamps) Then cDestAdd.CloseCurseur: Exit Sub
  cDestAdd.CloseCurseur
  
  If Not cDest Is Nothing Then cDest.CloseCurseur
  Set cDest = New BDCurseur
  cDest.OpenCurseur "select * from fmedest where fmd_numfme=" & sFormToSQL(colChamps("fmd_numfme"), BDTypeINTEGER) & " and fmd_numcr=" & sFormToSQL(colChamps("fmd_numcr"), BDTypeINTEGER)
  cDest.MoveFirst
  
  
  ActiveFormulaire False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  ' Aucun d�placement permis, puisque le recordset ne contient qu'un enregistrement
  bdS�l.Emp�cheMouvements
  
  btnDocuments.Enabled = True
  
  SetMessage
  SetStatus
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub



Private Sub ValidateEdit()
  Dim sType As String
  Assert iMode = meChange
  Assert Not cDest Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cDest.Edit
  cDest!fmd_idmodif = sBDIdModif
  If Not bPr�pareEditAdd(cDest, colColonnes, colChamps) Then Exit Sub

  ActiveFormulaire False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  AjusteMouvements

  btnDocuments.Enabled = True
  
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

  ActiveFormulaire False
  bdS�l.ActiveValidation False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cDest Is Nothing Then
    If Not (cDest.EOF And cDest.BOF) Then
      iMode = meNavigate
    End If
  End If
  bdS�l.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  btnDocuments.Enabled = (iMode = meNavigate)
  
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
  btnDocuments.Enabled = False
  
  EffaceFormulaire
  ActiveFormulaire True
  
  colChamps("fmd_numfme").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cDest Is Nothing
  
  If cDest.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  btnDocuments.Enabled = False
  
  ActiveFormulaire True
  ActiveChamp "fmd_numfme", False
  ActiveChamp "fmd_numcr", False
  ActiveChamp "fmd_idmodif", False
  ActiveChamp "fmd_tscreation", False
  ActiveChamp "timestamp", False
  
  colChamps("fmd_frequence").SetFocus
  AutoSelect colChamps("fmd_frequence"), True
  bdS�l.TabStop = False
  
  iMode = meChange
  SetMessage "Modifiez les valeurs affich�es, puis validez [Entr�e] ou abandonnez [�chap]"
  ActiveTimer mtLent
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  btnDocuments.Enabled = False
  
  EffaceFormulaire
  ActiveFormulaire True
  ActiveChamp "fmd_idmodif", False
  ActiveChamp "fmd_tscreation", False
  ActiveChamp "timestamp", False
  
  If g_iFME <> 0 Then
    colChamps("fmd_numfme") = g_iFME
    colChamps("fmd_numcr").SetFocus
  Else
    colChamps("fmd_numfme").SetFocus
  End If
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
  ActiveTimer mtLent
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cDest Is Nothing

  If cDest.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNb As Integer
  iNb = BDCurseurExpress("select count(*) from fmedoc where fmo_numfme=" & cDest!fmd_numfme & " and fmo_numcr=" & cDest!fmd_numcr)
  If iNb > 0 Then
    MsgBox "Vous ne pouvez pas supprimer ce destinataire, il y " & iNb & " documents rattach�s." & vbCrLf & vbCrLf & "Supprimez les documents avant de supprimer le destinataire.", vbExclamation, App.Title
    If Not bShiftPressed Then Exit Sub
  End If
  
  ActiveTimer mtStop
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  cDest.Delete
  cDest.MoveNext
  
  ' On place un enregistrement dans synchrodelete
  Dim cSD As New BDCurseur
  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
  cSD.AddNew
  cSD!sd_table = "fmedest"
  cSD!sd_timestamp = Now
  cSD!sd_wherepart = "fmd_numfme=" & sFormToSQL(colChamps("fmd_numfme"), BDTypeINTEGER) & " and fmd_numcr=" & sFormToSQL(colChamps("fmd_numcr"), BDTypeINTEGER)
  cSD.Update
  cSD.CloseCurseur
  
  iMode = meDelete        ' Emp�che l'activation du timer
  If cDest.EOF Then
    cDest.MovePrevious
    If cDest.BOF Then
      EffaceFormulaire
      btnDocuments.Enabled = False
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  If iMode = meDelete Then iMode = meNavigate
  bdS�l.ActiveMouvements iMode = meNavigate
  btnDocuments.Enabled = iMode = meNavigate
  If iMode = meNavigate Then ActiveTimer mtRapide
  bdS�l.TabStop = True
  bdS�l.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cDest Is Nothing

  bdS�l.ButtonEnabled("First") = cDest.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cDest.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cDest.EOF
  bdS�l.ButtonEnabled("Last") = Not cDest.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cDest.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cDest.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cDest.MoveNext
  AjusteMouvements
  If cDest.EOF Then cDest.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cDest.MovePrevious
  AjusteMouvements
  If cDest.BOF Then cDest.MoveFirst
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


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  bdS�l.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdS�l.KeyPress KeyAscii
End Sub


'=================================================================================
' Fonctions de service

Private Sub Form_Load()
  Show
  
  SetStatus "Chargement en cours, patientez�"
  If colColonnes.Count = 0 Then
    BDD�critTable "fmedest", colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If
  
  
  ' Chargement des combos
  bdcFr�quence.AddItem 1, "Flux tendu (�dition quotidienne)"
  bdcFr�quence.AddItem 2, "Manuel (�dition � la demande)"
  bdcFr�quence.AddItem 11, "Hebdomadaire, le lundi)"
  bdcFr�quence.AddItem 12, "Hebdomadaire, le mardi"
  bdcFr�quence.AddItem 13, "Hebdomadaire, le mercredi"
  bdcFr�quence.AddItem 14, "Hebdomadaire, le jeudi"
  bdcFr�quence.AddItem 15, "Hebdomadaire, le vendredi"
  Dim i As Integer
  For i = 1 To 31
    bdcFr�quence.AddItem 100 + i, "Mensuel, le " & i
  Next
  
  ' Formulaire en mode initial
  On Error Resume Next
  Set cDest = Nothing
  ActiveFormulaire False
  With bdS�l
    .ActiveMouvements False
    .ActiveValidation False
    .ButtonEnabled("Query") = True
    .ButtonEnabled("Add") = True
    .SetFocus
  End With
  
  iMode = meEmpty
  SetMessage
  SetStatus
  On Error GoTo 0
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
    MsgBox "Terminez l'op�ration en cours avant de fermer la fen�tre !", vbCritical, App.Title
    Cancel = True
    Exit Sub
  End If
  
  Cancel = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
  If Not cDest Is Nothing Then cDest.CloseCurseur
  MDIFEU.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cDest Is Nothing Then
    EffaceFormulaire
  ElseIf cDest.BOF And cDest.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cDest.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cDest.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdS�l.NumRec = cDest.AbsolutePosition
    txtDestinataire = ""
    txtTitreFME = ""
    lwDocuments.ListItems.Clear
       
    ' Mise � jour en arri�re plan
    ActiveTimer mtRapide
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each c In colChamps
      c.BackColor = 0
      c.Text = ""
    Next
    cDest.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  If txtTitreFME = "" And colChamps("fmd_numfme") <> "" Then
    If IsNumeric(colChamps("fmd_numfme")) Then
      txtTitreFME = BDCurseurExpress("select fme_titre from fme where fme_numfme=" & sFormToSQL(colChamps("fmd_numfme"), BDTypeINTEGER))
      If txtTitreFME = "" Then
        txtTitreFME = "??? N�FME inexistant !"
      End If
    Else
      txtTitreFME = "??? N�FME incorrect !"
    End If
  End If
  
  If txtDestinataire = "" And colChamps("fmd_numcr") <> "" Then
    If IsNumeric(colChamps("fmd_numcr")) Then
      txtDestinataire = BDCurseurExpress("select cr_nom from centrereception where cr_numcr=" & sFormToSQL(colChamps("fmd_numcr"), BDTypeINTEGER))
      If txtDestinataire = "" Then
        txtDestinataire = "??? N�CR inexistant !"
      End If
    Else
      txtDestinataire = "??? N�CR incorrect !"
    End If
  End If
  
  ' On affiche la liste des classes de documents
  If Not cDest Is Nothing And lwDocuments.ListItems.Count = 0 And iMode <> meAdd Then
    Dim itmX As ListItem
    Dim cDoc As New BDCurseur
    cDoc.OpenCurseur "select fmo_classe,fmo_nbex,fmo_options from fmedoc where fmo_numfme=" & cDest!fmd_numfme & " and fmo_numcr=" & cDest!fmd_numcr
    If cDoc.EOF Then
      Set itmX = lwDocuments.ListItems.Add
      itmX.SubItems(2) = "Aucun document associ�."
    Else
      While Not cDoc.EOF
        Set itmX = lwDocuments.ListItems.Add
        itmX.Text = cDoc!fmo_classe
        itmX.SubItems(1) = cDoc!fmo_nbex
        itmX.SubItems(2) = NV(cDoc!fmo_options)
        cDoc.MoveNext
      Wend
    End If
    cDoc.CloseCurseur
  End If
End Sub



Private Sub EffaceFormulaire()
  Dim c As Control
  For Each c In colChamps
    c.Text = ""
  Next
  bdS�l.NumRec = ""
  txtTitreFME = ""
  txtDestinataire = ""
  lwDocuments.ListItems.Clear
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
' Activation du timer de mise � jour des champs satellites

Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop: timSatellites.Enabled = False
    Case mtLent: timSatellites.Interval = 1000: timSatellites.Enabled = True
    Case mtRapide: timSatellites.Interval = 250: timSatellites.Enabled = True
  End Select
End Sub


'=================================================================================
' Ligne d'aide / Synchros

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub bdS�l_GotFocus()
  SetStatus
End Sub

Private Sub bdcFr�quence_LostFocus()
  bdcFr�quence.Synchronise
End Sub


'=================================================================================

Private Sub txtChamp_Change(Index As Integer)
  If iMode = meNavigate Or iMode = meAdd Or iMode = meChange Then
    If txtChamp(Index).DataField = "fmd_numfme" Then
      txtTitreFME = ""
      ActiveTimer mtLent
    End If
    
    If txtChamp(Index).DataField = "fmd_numcr" Then
      txtDestinataire = ""
      ActiveTimer mtLent
    End If
  End If
End Sub


'=================================================================================
' Acc�s au Web

Public Sub Fen�treWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=fmedest"
End Sub


'=================================================================================
' Copie des donn�es dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours�"
  BDCopieS�lection cDest, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


' =================================================================================
' Impression des donn�es

Public Sub Imprime()
  ImpressionPasDisponible
End Sub


