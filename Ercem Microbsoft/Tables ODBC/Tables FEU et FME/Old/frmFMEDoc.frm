VERSION 5.00
Begin VB.Form frmDoc 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Documents de FME"
   ClientHeight    =   3615
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
   ForeColor       =   &H8000000F&
   Icon            =   "frmFMEDoc.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   241
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   591
   Tag             =   "Donn�es"
   Begin TablesFEU.BDCombo bdcClasse 
      Height          =   330
      Left            =   2160
      TabIndex        =   20
      Top             =   1200
      Width           =   6675
      _ExtentX        =   11774
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
      DataField       =   "*fmo_classe"
   End
   Begin TablesFEU.BDS�lecteur bdS�l 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   19
      Top             =   0
      Width           =   8865
      _ExtentX        =   15637
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
      DataField       =   "fmo_options"
      Height          =   555
      Index           =   3
      Left            =   2160
      TabIndex        =   10
      Tag             =   "Options d'�dition du document"
      Top             =   1920
      Width           =   6660
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "fmo_nbex"
      Height          =   315
      Index           =   2
      Left            =   2160
      TabIndex        =   8
      Tag             =   "Nb d'exemplaires � imprimer pour ce document"
      Top             =   1560
      Width           =   960
   End
   Begin VB.TextBox txtTitreFME 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   3120
      Locked          =   -1  'True
      TabIndex        =   2
      TabStop         =   0   'False
      Tag             =   "N� de FME"
      Top             =   480
      Width           =   5715
   End
   Begin VB.TextBox txtDestinataire 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   3120
      Locked          =   -1  'True
      TabIndex        =   5
      TabStop         =   0   'False
      Tag             =   "N� de FME"
      Top             =   840
      Width           =   5715
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*fmo_numcr"
      Height          =   315
      Index           =   1
      Left            =   2160
      TabIndex        =   4
      Tag             =   "N� de centre de r�ception du destinataire"
      Top             =   840
      Width           =   915
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "fmo_tscreation"
      Height          =   315
      Index           =   11
      Left            =   6780
      TabIndex        =   18
      Tag             =   "Date+heure de cr�ation"
      Top             =   3240
      Width           =   2055
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   6180
      Top             =   2880
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   2160
      TabIndex        =   16
      Tag             =   "Date+heure de derni�re modification de l'information"
      Top             =   3240
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "fmo_idmodif"
      Height          =   315
      Index           =   12
      Left            =   2160
      TabIndex        =   14
      Tag             =   "Origine de la modification"
      Top             =   2880
      Width           =   3750
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "fmo_comment"
      Height          =   315
      Index           =   8
      Left            =   2160
      TabIndex        =   12
      Tag             =   "Commentaire libre quelconque"
      Top             =   2520
      Width           =   6660
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*fmo_numfme"
      Height          =   315
      Index           =   0
      Left            =   2160
      TabIndex        =   1
      Tag             =   "N� de FME"
      Top             =   480
      Width           =   915
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Options d'impression :"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   420
      Index           =   4
      Left            =   60
      MousePointer    =   14  'Arrow and Question
      TabIndex        =   9
      Top             =   1980
      Width           =   1815
      WordWrap        =   -1  'True
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nb d'exemplaires :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   7
      Top             =   1620
      Width           =   1755
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Cr�� le :"
      Height          =   210
      Index           =   8
      Left            =   5580
      TabIndex        =   17
      Top             =   3300
      Width           =   810
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   15
      Top             =   3300
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   13
      Top             =   2940
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Commentaire :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   11
      Top             =   2580
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Classe de document :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   6
      Top             =   1260
      Width           =   2055
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
Attribute VB_Name = "frmDoc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' frmFMEDoc
' Gestion des documents des FME
' 31/07/1998 PV
' 15/08/1998 PV BDActiveChamp

Option Explicit

Private cDoc As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs � l'�cran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eMode�dition

Public g_iFME As Long                     ' N� de FME courant
Public g_iCR As Long                      ' N� de CR courant


'=================================================================================
' Acc�s direct

Public Sub AfficheDocuments(ByVal iFME As Long, ByVal iCR As Long, Optional iClasse)
  g_iFME = iFME
  g_iCR = iCR
  Load Me
  EffaceFormulaire
  ActiveFormulaire True
  iMode = meQuery
  colChamps("fmo_numfme") = iFME
  colChamps("fmo_numcr") = iCR
  If Not IsMissing(iClasse) Then colChamps("fmo_classe") = iClasse
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
  
  Dim cDocQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours�"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cDocQuery.OpenCurseur "select * from fmedoc where " & sWP & " order by fmo_numfme,fmo_numcr"
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
  If Not cDoc Is Nothing Then cDoc.CloseCurseur
  Set cDoc = cDocQuery
  
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  bdS�l.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cDoc.EOF And cDoc.BOF) Then
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
  bOkValeurs = False
  
  ' On r�sout les satellites�
  timSatellites_Timer
  
  If txtTitreFME = "" Or Left(txtTitreFME, 1) = "?" Or txtDestinataire = "" Or Left(txtDestinataire, 1) = "?" Then
    MsgBox "Erreur dans les donn�es." & vbCrLf & vbCrLf & "Vous ne pouvez pas valides ces donn�es tant que le n� de FME et le n� de destinataire ne sont pas corrects !", vbExclamation, App.Title
    bOkValeurs = False
    Exit Function
  End If
  
  If Not IsNumeric(colChamps("fmo_nbex")) Then
    MsgBox "Le nombre d'exemplaires doit �tre num�rique !"
    colChamps("fmo_nbex").SetFocus
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
  Dim cDocAdd As New BDCurseur
  cDocAdd.OpenCurseur "select * from fmedoc where fmo_numfme=0"
  cDocAdd.AddNew
  cDocAdd!fmo_idmodif = sBDIdModif
  cDocAdd!fmo_tscreation = Now
  If Not bPr�pareEditAdd(cDocAdd, colColonnes, colChamps) Then cDocAdd.CloseCurseur: Exit Sub
  cDocAdd.CloseCurseur
  
  If Not cDoc Is Nothing Then cDoc.CloseCurseur
  Set cDoc = New BDCurseur
  cDoc.OpenCurseur "select * from fmedoc where fmo_numfme=" & sFormToSQL(colChamps("fmo_numfme"), BDTypeINTEGER) & " and fmo_numcr=" & sFormToSQL(colChamps("fmo_numcr"), BDTypeINTEGER)
  cDoc.MoveFirst
  
  
  ActiveFormulaire False
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
  Dim sType As String
  Assert iMode = meChange
  Assert Not cDoc Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cDoc.Edit
  cDoc!fmo_idmodif = sBDIdModif
  If Not bPr�pareEditAdd(cDoc, colColonnes, colChamps) Then Exit Sub

  ActiveFormulaire False
  bdS�l.ButtonEnabled("Query") = True
  bdS�l.ButtonEnabled("Add") = True
  
  bdS�l.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdS�l.ActiveMouvements True
  AjusteMouvements

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
  If Not cDoc Is Nothing Then
    If Not (cDoc.EOF And cDoc.BOF) Then
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
  
  EffaceFormulaire
  ActiveFormulaire True
  
  colChamps("fmo_numfme").SetFocus
  bdS�l.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les crit�res de recherche, puis validez [Entr�e] ou abandonnez [�chap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cDoc Is Nothing
  
  If cDoc.bEffac� Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdS�l.ButtonEnabled("Query") = False
  bdS�l.ButtonEnabled("Add") = False
  bdS�l.ActiveMouvements False
  bdS�l.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "fmo_numfme", False
  ActiveChamp "fmo_numcr", False
  ActiveChamp "fmo_classe", False
  ActiveChamp "fmo_idmodif", False
  ActiveChamp "fmo_tscreation", False
  ActiveChamp "timestamp", False
  
  colChamps("fmo_nbex").SetFocus
  AutoSelect colChamps("fmo_nbex"), True
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
  
  EffaceFormulaire
  ActiveFormulaire True
  ActiveChamp "fmo_idmodif", False
  ActiveChamp "fmo_tscreation", False
  ActiveChamp "timestamp", False
  
  If g_iFME <> 0 Then
    colChamps("fmo_numfme") = g_iFME
    colChamps("fmo_numcr").SetFocus
    
    If g_iCR <> 0 Then
      colChamps("fmo_numcr") = g_iFME
      colChamps("fmo_classe").SetFocus
    Else
      colChamps("fmo_numcr").SetFocus
    End If
  Else
    colChamps("fmo_numfme").SetFocus
  End If
  bdS�l.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entr�e] ou abandonnez [�chap]"
  ActiveTimer mtLent
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cDoc Is Nothing

  If cDoc.bEffac� Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a �t� effac� !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iNb As Integer
  iNb = BDCurseurExpress("select count(*) from fmedoc where fmo_numfme=" & cDoc!fmo_numfme & " and fmo_numcr=" & cDoc!fmo_numcr)
  If iNb > 0 Then
    MsgBox "Vous ne pouvez pas supprimer ce destinataire, il y " & iNb & " documents rattach�s." & vbCrLf & vbCrLf & "Supprimez les documents avant de supprimer le destinataire.", vbExclamation, App.Title
    If Not bShiftPressed Then Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est d�finitif." & vbCrLf & "Confirmez-vous cette op�ration ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  cDoc.Delete
  cDoc.MoveNext
  
  ' On place un enregistrement dans synchrodelete
  Dim cSD As New BDCurseur
  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
  cSD.AddNew
  cSD!sd_table = "fmedoc"
  cSD!sd_timestamp = Now
  cSD!sd_wherepart = "fmo_numfme=" & sFormToSQL(colChamps("fmo_numfme"), BDTypeINTEGER) & " and fmo_numcr=" & sFormToSQL(colChamps("fmo_numcr"), BDTypeINTEGER)
  cSD.Update
  cSD.CloseCurseur
  
  If cDoc.EOF Then
    cDoc.MovePrevious
    If cDoc.BOF Then
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
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cDoc Is Nothing

  bdS�l.ButtonEnabled("First") = cDoc.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Previous") = cDoc.AbsolutePosition <> 1
  bdS�l.ButtonEnabled("Next") = Not cDoc.EOF
  bdS�l.ButtonEnabled("Last") = Not cDoc.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cDoc.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cDoc.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cDoc.MoveNext
  AjusteMouvements
  If cDoc.EOF Then cDoc.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cDoc.MovePrevious
  AjusteMouvements
  If cDoc.BOF Then cDoc.MoveFirst
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
    BDD�critTable "fmedoc", colColonnes
    BDRemplitColChamps Me, colChamps, colColonnes
  End If
  
  
  ' Chargement des combos
  bdcClasse.AddItem "CR", "Compte-rendu d'analyse"
  bdcClasse.AddItem "EH", "Grille d'�valuation"
  bdcClasse.AddItem "ST", "Synth�ses (statistiques)"
  
  ' Formulaire en mode initial
  On Error Resume Next
  Set cDoc = Nothing
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
  If Not cDoc Is Nothing Then cDoc.CloseCurseur
  MDIFEU.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cDoc Is Nothing Then
    EffaceFormulaire
  ElseIf cDoc.BOF And cDoc.EOF Then
    EffaceFormulaire
  Else
    Dim c As Control
    On Error GoTo pb
    For Each c In colChamps
      If IsNull(cDoc.Fields(c.DataField)) Then
        c.Text = ""
      Else
        c.Text = cDoc.Fields(c.DataField)
      End If
      c.Refresh
    Next
    On Error GoTo 0
    
    bdS�l.NumRec = cDoc.AbsolutePosition
    txtDestinataire = ""
    txtTitreFME = ""
       
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
    cDoc.bEffac� = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  If txtTitreFME = "" And colChamps("fmo_numfme") <> "" Then
    If IsNumeric(colChamps("fmo_numfme")) Then
      txtTitreFME = BDCurseurExpress("select fme_titre from fme where fme_numfme=" & sFormToSQL(colChamps("fmo_numfme"), BDTypeINTEGER))
      If txtTitreFME = "" Then
        txtTitreFME = "??? N�FME inexistant !"
      End If
    Else
      txtTitreFME = "??? N�FME incorrect !"
    End If
  End If
  
  If txtDestinataire = "" And colChamps("fmo_numcr") <> "" Then
    If IsNumeric(colChamps("fmo_numcr")) Then
      txtDestinataire = BDCurseurExpress("select cr_nom from centrereception where cr_numcr=" & sFormToSQL(colChamps("fmo_numcr"), BDTypeINTEGER))
      If txtDestinataire = "" Then
        txtDestinataire = "??? N�CR inexistant !"
      End If
    Else
      txtDestinataire = "??? N�CR incorrect !"
    End If
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
' Ligne d'aide / Synchros diverses

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub

Private Sub bdS�l_GotFocus()
  SetStatus
End Sub

Private Sub bdcClasse_LostFocus()
  bdcClasse.Synchronise
End Sub

Private Sub lblChamp_Click(Index As Integer)
  If Index = 4 Then
    Screen.MousePointer = vbHourglass
    FileShellExecute hWnd, "http://www.silliker/microbsoft/serveur/fme.htm"
    Screen.MousePointer = vbDefault
  End If
End Sub

'=================================================================================

Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "fmo_numfme" Then
    txtTitreFME = ""
    ActiveTimer mtLent
  End If
  
  If txtChamp(Index).DataField = "fmo_numcr" Then
    txtDestinataire = ""
    ActiveTimer mtLent
  End If
End Sub



'=================================================================================
' Acc�s au Web

Public Sub Fen�treWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=fmedoc"
End Sub


'=================================================================================
' Copie des donn�es dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours�"
  BDCopieS�lection cDoc, colChamps, bdS�l
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


' =================================================================================
' Impression des donn�es

Public Sub Imprime()
  ImpressionPasDisponible
End Sub

