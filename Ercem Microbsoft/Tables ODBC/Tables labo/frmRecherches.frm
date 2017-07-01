VERSION 5.00
Begin VB.Form frmRecherche 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des métaméthodes (recherches)"
   ClientHeight    =   3015
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
   Icon            =   "frmRecherches.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   201
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   561
   Tag             =   "Données"
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   7920
      Top             =   900
   End
   Begin VB.TextBox txtMéthode 
      BackColor       =   &H8000000F&
      Height          =   315
      Left            =   1920
      Locked          =   -1  'True
      TabIndex        =   6
      TabStop         =   0   'False
      Tag             =   "Origine de la modification"
      Top             =   1200
      Width           =   3750
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "rch_idmodif"
      Height          =   315
      Index           =   10
      Left            =   1560
      TabIndex        =   12
      Tag             =   "Origine de la modification"
      Top             =   2280
      Width           =   3750
   End
   Begin TablesLabo.BDCombo bdcMétaméthode 
      Height          =   330
      Left            =   1560
      TabIndex        =   3
      Tag             =   "Métaméthode d'analyse (A à Z valides)"
      Top             =   840
      Width           =   2535
      _ExtentX        =   4471
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
      DataField       =   "rch_mmethode"
   End
   Begin VB.CommandButton btnCouplesInexistants 
      Caption         =   "&Couples Germe/méthode inexistants"
      Height          =   795
      Left            =   6600
      TabIndex        =   15
      Top             =   2160
      Width           =   1755
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "rch_filler"
      Height          =   315
      Index           =   0
      Left            =   1560
      TabIndex        =   10
      Tag             =   "Filler (?)"
      Top             =   1920
      Width           =   315
   End
   Begin TablesLabo.BDCombo bdcGerme 
      Height          =   330
      Left            =   1560
      TabIndex        =   1
      Tag             =   "Germe concerné par la méthode"
      Top             =   480
      Width           =   6795
      _ExtentX        =   11986
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
      DataField       =   "*rch_germe"
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   1560
      TabIndex        =   14
      Tag             =   "Date+heure de dernière modification de l'information"
      Top             =   2640
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "rch_comment"
      Height          =   315
      Index           =   2
      Left            =   1560
      TabIndex        =   8
      Tag             =   "Commentaire libre"
      Top             =   1560
      Width           =   6795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*rch_methode"
      Height          =   315
      Index           =   1
      Left            =   1560
      TabIndex        =   5
      Tag             =   "Libellé de la méthode"
      Top             =   1200
      Width           =   315
   End
   Begin TablesLabo.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   16
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
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   11
      Top             =   2340
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Filler :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   9
      Top             =   1980
      Width           =   570
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Métaméthode :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   1440
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   13
      Top             =   2700
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Commentaire :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   7
      Top             =   1620
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Méthode :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   960
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Germe :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   750
   End
End
Attribute VB_Name = "frmRecherche"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmRecherche
' Feuille de gestion des méthodes
' 16/02/1998 PV
'  7/07/1998 PV Copie de données dans le presse-papiers
' 15/08/1998 PV sAjusteMessageODBC, BDActiveChamp
' 22/12/1998 PV Ordre des champs dans colChamps
' 31/03/1999 PV Impressions
' 16/04/1999 PV Synchronise sur les BDCombos
' 28/07/2001 PV Affichage de la méthode en lookup
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des déstructions et des créations

Option Explicit

Private cRch As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private sFinalWP As String                ' Where-part de la requête SQL courante
Private colChange As New Collection       ' Trace des modifications
Private coldétruit As New Collection      ' Trace de l'enregistrement qui va être détruit
Private colCréé As New Collection         ' Trace de la création de l'enregistrement

Private Const sTable = "recherche"


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
  
  Dim cRchQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cRchQuery.OpenCurseur "select * from recherche where " & sWP & " order by rch_germe"
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
  If Not cRch Is Nothing Then cRch.CloseCurseur
  Set cRch = cRchQuery
  sFinalWP = sWP
  
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  BDSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cRch.EOF And cRch.BOF) Then
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
  
  bdcGerme.Synchronise
  If InStr(bdcGerme.FullText, bdcGerme.Séparateur) = 0 Then
    MsgBox "Germe inconnu !", vbExclamation, App.Title
    Exit Function
  End If

  bdcMétaméthode.Synchronise
  If bdcMétaméthode.Text <> UCase(bdcMétaméthode.Text) Then bdcMétaméthode.Text = UCase(bdcMétaméthode.Text)
  If Len(bdcMétaméthode) <> 1 Or bdcMétaméthode < "A" Or bdcMétaméthode > "Z" Then
    MsgBox "Métaméthode inconnue (doit être une lettre de A à Z).", vbExclamation, App.Title
    Exit Function
  End If
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim cRchAdd As New BDCurseur
  cRchAdd.OpenCurseur "select * from recherche where rch_germe=0"
  cRchAdd.AddNew
  If Not bPrépareEditAdd(cRchAdd, colColonnes, colChamps) Then cRchAdd.CloseCurseur: Exit Sub
  cRchAdd.CloseCurseur
  
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cRch Is Nothing Then cRch.CloseCurseur
  Set cRch = New BDCurseur
  sFinalWP = "rch_germe=" & sFormToSQL(colChamps("rch_germe").Text, BDTypeINTEGER) & " and rch_mmethode=" & sFormToSQL(colChamps("rch_mmethode").Text, BDTypeCHAR)
  cRch.OpenCurseur "select * from recherche where " & sFinalWP
  cRch.MoveFirst
      
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
      JournalUnix sTable & " " & colChamps("rch_germe") & " " & colChamps("rch_methode"), "créé", sMsgTrace
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
  Assert Not cRch Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cRch.Edit
  If Not bPrépareEditAdd(cRch, colColonnes, colChamps) Then Exit Sub
  
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
      JournalUnix sTable & " " & colChamps("rch_germe") & " " & colChamps("rch_methode"), "changé", sMsgTrace
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
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
  
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:   ValidateAdd
    Case meQuery: ValidateQuery
  End Select
End Sub





Private Sub ActionCancel()
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  ActiveFormulaire False
  BDSél.ActiveValidation False
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cRch Is Nothing Then
    If Not (cRch.EOF And cRch.BOF) Then
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
  
  colChamps("rch_germe").SetFocus
  BDSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cRch Is Nothing
  
  If cRch.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  BDSél.ButtonEnabled("Query") = False
  BDSél.ButtonEnabled("Add") = False
  BDSél.ActiveMouvements False
  BDSél.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "rch_germe", False
  ActiveChamp "rch_mmethode", False
  ActiveChamp "rch_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("rch_methode").SetFocus
  AutoSelect colChamps("rch_methode"), True
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
  ActiveChamp "rch_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("rch_germe").SetFocus
  BDSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cRch Is Nothing

  If cRch.bEffacé Then
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
    JournalUnix sTable & " " & colChamps("rch_germe") & " " & colChamps("rch_methode"), "détruit", sMsgTrace
  End If
  
  On Error Resume Next
  cRch.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cRch.MoveNext
  If cRch.EOF Then
    cRch.MovePrevious
    If cRch.BOF Then
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
  Assert Not cRch Is Nothing

  BDSél.ButtonEnabled("First") = cRch.AbsolutePosition <> 1
  BDSél.ButtonEnabled("Previous") = cRch.AbsolutePosition <> 1
  BDSél.ButtonEnabled("Next") = Not cRch.EOF
  BDSél.ButtonEnabled("Last") = Not cRch.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cRch.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cRch.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cRch.MoveNext
  AjusteMouvements
  If cRch.EOF Then cRch.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cRch.MovePrevious
  AjusteMouvements
  If cRch.BOF Then cRch.MoveFirst
  SynchroniseFormulaire
End Sub

Private Sub btnCouplesInexistants_Click()
  If (iMode <> meNavigate) And (iMode <> meEmpty) Then
    MsgBox "Terminez l'opération courante avant d'utiliser cette commande !"
    Exit Sub
  End If
  
  MsgBox "Cette commande sélectionne toutes les définitions de métaméthodes pour lesquelles la combinaison Germe+Méthode n'existe pas dans la table des méthodes d'analyse.", vbInformation, App.Title
  
  If Not cRch Is Nothing Then cRch.CloseCurseur
  Dim cCI As New BDCurseur
  sFinalWP = "not exists(select * from methode where met_germe=rch_germe and met_methode=rch_methode)"
  cCI.OpenCurseur "select * from recherche where " & sFinalWP
  Set cRch = cCI
  
  BDSél.ButtonEnabled("Query") = True
  BDSél.ButtonEnabled("Add") = True
  BDSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cRch.EOF And cRch.BOF) Then
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


' La méthode est en minuscules
Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "rch_methode" Then ToMin txtChamp(Index)
  
  If txtChamp(Index).DataField = "rch_methode" Or txtChamp(Index).DataField = "rch_germe" Then
    txtMéthode = ""
    ActiveTimer mtLent
  End If
End Sub

' La métaméthode est en majuscules
Private Sub bdcMétaméthode_Change()
  ToMaj bdcMétaméthode
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
  bdcMétaméthode.AddItem "A", "AFNOR"
  bdcMétaméthode.AddItem "B", "AFNOR B"
  bdcMétaméthode.AddItem "E", "AFNOR Expertise"
  bdcMétaméthode.AddItem "S", "Simplifié"
  
  Dim cGer As New BDCurseur
  cGer.OpenCurseur "select ger_indice,ger_libelle from germe where ger_langue='F' order by ger_indice"
  While Not cGer.EOF
    bdcGerme.AddItem cGer!ger_indice, cGer!ger_libelle
    cGer.MoveNext
  Wend
  cGer.CloseCurseur
  
  
  ' Formulaire en mode initial
  Set cRch = Nothing
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
  If Not cRch Is Nothing Then cRch.CloseCurseur
  MDILabo.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cRch Is Nothing Then
    EffaceFormulaire
  ElseIf cRch.BOF And cRch.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cRch.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cRch.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    
    BDSél.NumRec = cRch.AbsolutePosition
  
    ' On efface les champs qui seront affichés par le timer
    txtMéthode = ""
        
    ActiveTimer mtRapide      ' Mise à jour en arrière plan
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cRch.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop

  ' Affichage des champs satellites
  If colChamps("rch_germe") <> "" And colChamps("rch_methode") <> "" And txtMéthode = "" Then
    txtMéthode = sNomMéthode(colChamps("rch_germe"), colChamps("rch_methode"))
  End If
End Sub



Private Sub EffaceFormulaire()
  Dim C As Control
  For Each C In colChamps
    C.Text = ""
  Next
  txtMéthode = ""
  BDSél.NumRec = ""
End Sub


' Activation du timer de mise à jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  timSatellites.Enabled = 0
  Select Case mtMode
    Case mtStop: timSatellites.Enabled = False
    Case mtLent: timSatellites.Interval = 1000: timSatellites.Enabled = True
    Case mtRapide: timSatellites.Interval = 250: timSatellites.Enabled = True
  End Select
End Sub


Private Sub ActiveFormulaire(bEnabled As Boolean)
  Dim C As Control
  For Each C In colChamps
    BDActiveChamp C, bEnabled
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

Private Sub bdcGerme_GotFocus()
  SetStatus bdcGerme.Tag
End Sub

Private Sub bdcMétaméthode_GotFocus()
  SetStatus bdcMétaméthode.Tag
End Sub


Private Sub bdcGerme_LostFocus()
  bdcGerme.Synchronise
End Sub

Private Sub bdcMétaméthode_LostFocus()
  bdcMétaméthode.Synchronise
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
  BDCopieSélection cRch, colChamps, BDSél
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
    MsgBox "Sélectionnez au préalable des enregistrements.", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim sSQL As String
  sSQL = "select * from recherche,germe,outer methode where rch_germe=ger_indice and ger_langue='F' and met_germe=rch_germe and met_methode=rch_methode and " & sFinalWP & " order by rch_germe,rch_mmethode"
  BDEtat sSQL, drRecherche, bImpression
End Sub


'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("rch_germe") & " " & colChamps("rch_methode") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub

