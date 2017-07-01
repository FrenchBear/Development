VERSION 5.00
Begin VB.Form frmJournalEvénement 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion du journal des événements labo"
   ClientHeight    =   4065
   ClientLeft      =   150
   ClientTop       =   150
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
   Icon            =   "frmJournalEvénements.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   271
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   561
   Tag             =   "Données"
   Begin VB.CommandButton btnSériesSS 
      Caption         =   "Séries d'une SuperSérie"
      Height          =   315
      Left            =   3960
      TabIndex        =   23
      Top             =   2280
      Width           =   2655
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*evt_ts"
      Height          =   315
      Index           =   7
      Left            =   1620
      TabIndex        =   5
      Tag             =   "Date+Heure de l'événement"
      Top             =   1200
      Width           =   1935
   End
   Begin TablesLabo.BDCombo bdcMilieu 
      Height          =   330
      Left            =   1620
      TabIndex        =   3
      Tag             =   "Milieu concerné par l'événement, ou 0 sinon"
      Top             =   840
      Width           =   4995
      _ExtentX        =   8811
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
      DataField       =   "*evt_milieu"
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "evt_info3"
      Height          =   315
      Index           =   6
      Left            =   1620
      MaxLength       =   20
      TabIndex        =   19
      Tag             =   "Info complémentaire 3 (varie selon l'événement)"
      Top             =   3360
      Width           =   4995
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "evt_info2"
      Height          =   315
      Index           =   4
      Left            =   1620
      MaxLength       =   20
      TabIndex        =   17
      Tag             =   "Info complémentaire 2 (varie selon l'événement)"
      Top             =   3000
      Width           =   4995
   End
   Begin TablesLabo.BDCombo bdcPers 
      Height          =   330
      Left            =   1620
      TabIndex        =   11
      Tag             =   "Code personne ayant signalé l'événement"
      Top             =   1920
      Width           =   4995
      _ExtentX        =   8811
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
      DataField       =   "*evt_pers"
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "evt_info1"
      Height          =   315
      Index           =   5
      Left            =   1620
      MaxLength       =   20
      TabIndex        =   15
      Tag             =   "Info complémentaire 1 (varie selon l'événement)"
      Top             =   2640
      Width           =   4995
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*evt_date"
      Height          =   315
      Index           =   3
      Left            =   4500
      TabIndex        =   7
      Tag             =   "Date de l'événement"
      Top             =   1200
      Width           =   1155
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*evt_serielabo"
      Height          =   315
      Index           =   1
      Left            =   1620
      TabIndex        =   13
      Tag             =   "Brève description de l'anomalie"
      Top             =   2280
      Width           =   2295
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   2
      Left            =   1620
      TabIndex        =   21
      Tag             =   "Timestamp de dernière modification des données"
      Top             =   3720
      Width           =   1935
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*evt_serie"
      Height          =   315
      Index           =   0
      Left            =   1620
      TabIndex        =   1
      Tag             =   "N° interne d'enregistrement de l'événement"
      Top             =   480
      Width           =   1155
   End
   Begin TablesLabo.BDCombo bdcEvénement 
      Height          =   330
      Left            =   1620
      TabIndex        =   9
      Tag             =   "Code événement"
      Top             =   1560
      Width           =   4995
      _ExtentX        =   8811
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
      DataField       =   "*evt_evenement"
   End
   Begin TablesLabo.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   22
      Top             =   0
      Width           =   8415
      _ExtentX        =   14843
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
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Date :"
      Height          =   210
      Index           =   10
      Left            =   3840
      TabIndex        =   6
      Top             =   1260
      Width           =   585
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Milieu :"
      Height          =   210
      Index           =   8
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   660
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Info 3 :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   18
      Top             =   3420
      Width           =   690
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Info 2 :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   16
      Top             =   3060
      Width           =   690
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Personne :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   10
      Top             =   1980
      Width           =   1035
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Info 1 :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   14
      Top             =   2700
      Width           =   690
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Evénement :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   8
      Top             =   1620
      Width           =   1200
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Date+Heure :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   1290
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Série labo :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   12
      Top             =   2340
      Width           =   1080
   End
   Begin VB.Label lblLabels 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   9
      Left            =   60
      TabIndex        =   20
      Top             =   3780
      Width           =   1155
   End
   Begin VB.Label lblLabels 
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
Attribute VB_Name = "frmJournalEvénement"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmJournalEvénement
' Feuille de gestion du journal des événements labo
' 13/02/1998 PV
'  7/07/1998 PV Copie de données dans le presse-papiers
' 15/08/1998 PV sAjusteMessageODBC, BDActiveChamp
'  4/09/1998 PV Problème du séparateur de bdcombo ":" codé en dur dans bOkValeurs
' 22/12/1998 PV Ordre des champs dans colChamps
' 31/03/1999 PV Impressions, evt_ts
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des déstructions et des créations

Option Explicit

Private cEvt As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private sFinalWP As String                ' Where-part de la requête SQL courante
Private colChange As New Collection       ' Trace des modifications
Private coldétruit As New Collection      ' Trace de l'enregistrement qui va être détruit
Private colCréé As New Collection         ' Trace de la création de l'enregistrement

Private Const sTable = "c_evenement"


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
  
  Dim cEvtQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cEvtQuery.OpenCurseur "select * from c_evenement where " & sWP & " order by evt_serie"
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    ActiveFormulaire True
    SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
    Exit Sub
  End If
  
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cEvt Is Nothing Then cEvt.CloseCurseur
  Set cEvt = cEvtQuery
  sFinalWP = sWP
  
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  BDSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cEvt.EOF And cEvt.BOF) Then
    iMode = meNavigate
    SetMessage
  Else
    iMode = meEmpty
    SetMessage "Aucun enregistrement n'a été sélectionné"
  End If
  BDSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
    
  BDSél.SetFocus
End Sub


' Vérifie que les champs contiennent des valeurs légales
' Le contrôle des NULL et des types a déjà été fait
Private Function bOkValeurs() As Boolean
  Dim iOld As Integer
  
  bOkValeurs = False
  
  bdcEvénement.Synchronise
  If bdcEvénement.ListIndex < 0 Then
    MsgBox "Code événement inconnu !", vbExclamation, App.Title
    bdcEvénement.SetFocus
    Exit Function
  End If

  bdcPers.Synchronise
  If bdcPers.ListIndex < 0 Then
    MsgBox "Code personne inconnu !", vbExclamation, App.Title
    bdcPers.SetFocus
    Exit Function
  End If
  
  If IsDate(colChamps("evt_date")) And IsDate(colChamps("evt_ts")) Then
    If Int(CDate(colChamps("evt_date"))) <> Int(CDate(colChamps("evt_ts"))) Then
      MsgBox "Les deux champs date doivent indiquer la même date.", vbExclamation, App.Title
      colChamps("evt_date").SetFocus
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
  
  Dim cEvtAdd As New BDCurseur
  cEvtAdd.OpenCurseur "select * from c_evenement where evt_serie=0"
  cEvtAdd.AddNew
  
  colChamps("evt_serie").Text = "0"
  If Not bPrépareEditAdd(cEvtAdd, colColonnes, colChamps) Then
    cEvtAdd.CloseCurseur
    Exit Sub
  End If
  cEvtAdd.CloseCurseur
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cEvt Is Nothing Then cEvt.CloseCurseur
  Set cEvt = New BDCurseur
  
  ' triche: pour récupérer un sérial, on lit le max…
  Dim cMax As New BDCurseur, iMax As Long
  cMax.OpenCurseur "select max(evt_serie) from c_evenement"
  If cMax.EOF Then iMax = 1 Else iMax = cMax(0)
  cMax.CloseCurseur
  sFinalWP = "evt_serie=" & iMax
  cEvt.OpenCurseur "select * from c_evenement where " & sFinalWP
  cEvt.MoveFirst
    
  ' On mémorise toutes les valeurs saisie par l'utilisateur
  EffaceCollection colCréé
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colCréé.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  ' Si on est en train d'ajouter un enregistrement, on recence ds l'historique la valeur des différents paramètres
  If iMode = meAdd Then
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        ' On enregistre uniquement si les champs ne sont pas vides
        If ValeurContrôle(C) <> "" Then
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colCréé(C.DataField)
        End If
      End If
    Next
    ' On enregistre dans le journal la trace de la création
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("evt_serie"), "créé", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  BDSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  BDSél.EmpêcheMouvements
  
  SetMessage
  SetStatus
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cEvt Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cEvt.Edit
  If Not bPrépareEditAdd(cEvt, colColonnes, colChamps) Then Exit Sub
  
  ' Tout est Ok: si on est en train de faire une modif, on trace ce qui a été changé
  If iMode = meChange Then
    Dim C As Control
    Dim sMsgTrace As String
    For Each C In Controls
      If DataFieldEx(C) <> "" Then
        If colChange(C.DataField) <> ValeurContrôle(C) Then  ' Modifié !
          If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ", "
          sMsgTrace = sMsgTrace & C.DataField & ":" & colChange(C.DataField) & "->" & ValeurContrôle(C)
        End If
      End If
    Next
    If sMsgTrace <> "" Then
      JournalUnix sTable & " " & colChamps("evt_serie"), "changé", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  BDSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  BDSél.ActiveMouvements True
  AjusteMouvements

  SetMessage
  SetStatus
  BDSél.TabStop = True
  BDSél.SetFocus
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
  BDSél.ActiveValidation False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cEvt Is Nothing Then
    If Not (cEvt.EOF And cEvt.BOF) Then
      iMode = meNavigate
    End If
  End If
  BDSél.ActiveMouvements iMode = meNavigate
  If iMode = meNavigate Then AjusteMouvements
  
  SetMessage
  SetStatus
  
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub


'=================================================================================
' Commandes

Public Sub ActionQuery()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  btnSériesSS.Visible = True
  
  colChamps("evt_serie").SetFocus
  BDSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cEvt Is Nothing
  
  If cEvt.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "evt_serie", False
  ActiveChamp "timestamp", False
  
  colChamps("evt_milieu").SetFocus
  AutoSelect colChamps("evt_milieu"), True
  BDSél.TabStop = False
  
  iMode = meChange
  
  ' On mémorise les valeurs avant le changement
  EffaceCollection colChange
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colChange.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  SetMessage "Modifiez les valeurs affichées, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionAdd()
  Assert (iMode = meEmpty) Or (iMode = meNavigate)
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  ActiveChamp "timestamp", False
  ActiveChamp "evt_serie", False
  
  colChamps("evt_date").Text = Today
  colChamps("evt_ts").Text = BDTime
  colChamps("evt_milieu").SetFocus
  AutoSelect colChamps("evt_milieu"), True
  BDSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cEvt Is Nothing

  If cEvt.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  ' Mémorisation de la trace de l'enregistrement qui va être détruit
  EffaceCollection coldétruit
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      coldétruit.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  ' Tri des données à conserver et placement ds la variable Smsgtrace
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContrôle(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & coldétruit(C.DataField)
         End If
      End If
  Next
  
  ' On répertorie l'enregistrement dans le journal avant la destructiuon definitive
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("evt_serie"), "détruit", sMsgTrace
  End If
  
  On Error Resume Next
  cEvt.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cEvt.MoveNext
  If cEvt.EOF Then
    cEvt.MovePrevious
    If cEvt.BOF Then
      EffaceFormulaire
      iMode = meEmpty
    Else
      SynchroniseFormulaire
    End If
  Else
    SynchroniseFormulaire
  End If
  
  BDSél.ActiveMouvements iMode = meNavigate
  BDSél.TabStop = True
  BDSél.SetFocus
End Sub


'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cEvt Is Nothing

  BDSél.ButtonEnabled("First") = cEvt.AbsolutePosition <> 1
  BDSél.ButtonEnabled("Previous") = cEvt.AbsolutePosition <> 1
  BDSél.ButtonEnabled("Next") = Not cEvt.EOF
  BDSél.ButtonEnabled("Last") = Not cEvt.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cEvt.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cEvt.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cEvt.MoveNext
  AjusteMouvements
  If cEvt.EOF Then cEvt.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cEvt.MovePrevious
  AjusteMouvements
  If cEvt.BOF Then cEvt.MoveFirst
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


Private Sub btnSériesSS_Click()
  Dim sDate As String, sSS As String, dSS As Double
  sDate = InputBox("Pour rechercher les séries d'une supersérie, entrez la date de la supersérie.", App.Title, Today)
  If Not IsDateSouple(sDate) Then Exit Sub
  sSS = InputBox("Entrez le n° de la supersérie du " & sDate, App.Title, "1")
  If Not IsNumeric(sSS) Then Exit Sub
  dSS = CDbl(sSS)
  If dSS < 1 Or dSS > 40 Or dSS <> Int(dSS) Then
    MsgBox "N° de supersérie invalide, doit être compris entre 1 et 40", vbExclamation, App.Title
    Exit Sub
  End If
  
  Screen.MousePointer = vbHourglass
  Dim sSer As String
  Dim cSS As New BDCurseur
  cSS.OpenCurseur "select ser_numserie from c_serielabo where date(ser_dh)=" & sFormToSQL(sDate, BDTypeDATE) & " and ser_superserie=" & sFormToSQL(sSS, BDTypeINTEGER)
  While Not cSS.EOF
    If sSer <> "" Then sSer = sSer & "|"
    sSer = sSer & cSS!ser_numserie
    cSS.MoveNext
  Wend
  Screen.MousePointer = vbDefault
  colChamps!evt_serielabo = sSer
  colChamps!evt_serielabo.SetFocus
End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  BDSél.KeyDown KeyCode
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then BDSél.KeyPress KeyAscii
End Sub
' Menu de commandes contextuel
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then    ' Bouton droit
    PopupMenu MDILabo.mnuCommandes
  End If
End Sub


Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "cev_evenement" Then
    Dim txtEvénement As TextBox
    Set txtEvénement = txtChamp(Index)
    ' On convertit les événement en majuscules
    If txtEvénement <> UCase(txtEvénement) Then
      Dim sStart As Integer, sLength As Integer
      sStart = txtEvénement.SelStart
      sLength = txtEvénement.SelLength
      txtEvénement = UCase(txtEvénement)
      txtEvénement.SelStart = sStart
      txtEvénement.SelLength = sLength
    End If
  End If
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
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcPers.AddItem u.uti_numuti, u.uti_nom
  Next
  
  Dim cCev As New BDCurseur
  cCev.OpenCurseur "select cev_evenement,cev_libelle from catevenement order by cev_evenement"
  While Not cCev.EOF
    bdcEvénement.AddItem cCev!cev_evenement, cCev!cev_libelle
    cCev.MoveNext
  Wend
  cCev.CloseCurseur
  
  Dim cMil As New BDCurseur, s As String
  bdcMilieu.AddItem 0, "(Pas d'info de milieu pour cet événement)"
  cMil.OpenCurseur "select mil_indice,mil_libelle,mil_abrege from milieu order by mil_indice"
  While Not cMil.EOF
    s = cMil!mil_libelle
    If cMil!mil_libelle <> cMil!mil_abrege Then s = s & " (" & cMil!mil_abrege & ")"
    bdcMilieu.AddItem cMil!mil_indice, s
    cMil.MoveNext
  Wend
  cMil.CloseCurseur
 
  
  ' Formulaire en mode initial
  Set cEvt = Nothing
  ActiveFormulaire False
  BDSél.LectureSeule = bLectureSeule
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  BDSél.SetFocus
  
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
  If Not cEvt Is Nothing Then cEvt.CloseCurseur
  MDILabo.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cEvt Is Nothing Then
    EffaceFormulaire
  ElseIf cEvt.BOF And cEvt.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cEvt.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cEvt.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    BDSél.NumRec = cEvt.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cEvt.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


Private Sub EffaceFormulaire()
  Dim C As Control
  For Each C In colChamps
    C.Text = ""
  Next
  BDSél.NumRec = ""
End Sub


Private Sub ActiveFormulaire(bEnabled As Boolean)
  Dim C As Control
  For Each C In colChamps
    BDActiveChamp C, bEnabled
  Next
  btnSériesSS.Visible = False
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

Private Sub bdcMilieu_GotFocus()
  SetStatus bdcMilieu.Tag
End Sub

Private Sub bdcPers_GotFocus()
  SetStatus bdcPers.Tag
End Sub

Private Sub bdcEvénement_GotFocus()
  SetStatus bdcEvénement.Tag
End Sub

Private Sub bdcMilieu_LostFocus()
  bdcMilieu.Synchronise
End Sub

Private Sub bdcPers_LostFocus()
  bdcPers.Synchronise
End Sub

Private Sub bdcEvénement_LostFocus()
  bdcEvénement.Synchronise
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
  BDCopieSélection cEvt, colChamps, BDSél
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
  sSQL = "select * from c_evenement,milieu where evt_milieu=mil_indice and " & sFinalWP & " order by evt_serielabo,evt_evenement,evt_milieu"
  BDEtat sSQL, drEvénement, bImpression
End Sub


'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("evt_serie") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub


