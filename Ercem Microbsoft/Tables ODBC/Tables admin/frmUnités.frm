VERSION 5.00
Begin VB.Form frmUnité 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des unités"
   ClientHeight    =   5145
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
   Icon            =   "frmUnités.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   343
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   561
   Tag             =   "Données"
   Begin VB.TextBox txtChamp 
      DataField       =   "uni_email"
      Height          =   315
      Index           =   8
      Left            =   2100
      TabIndex        =   19
      Top             =   4080
      Width           =   2070
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uni_idmodif"
      Height          =   315
      Index           =   4
      Left            =   2100
      TabIndex        =   21
      Tag             =   "Origine de la modification"
      Top             =   4440
      Width           =   3750
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uni_telfax"
      Height          =   315
      Index           =   7
      Left            =   2100
      TabIndex        =   13
      Tag             =   "Téléphone et fax de l'unité"
      Top             =   3000
      Width           =   5955
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uni_adr3"
      Height          =   315
      Index           =   6
      Left            =   2100
      TabIndex        =   11
      Tag             =   "Adresse (ligne 3)"
      Top             =   2640
      Width           =   5955
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uni_adr2"
      Height          =   315
      Index           =   5
      Left            =   2100
      TabIndex        =   10
      Tag             =   "Adresse (ligne 2)"
      Top             =   2280
      Width           =   5955
   End
   Begin TablesAdmin.BDCombo bdcType 
      Height          =   330
      Left            =   2100
      TabIndex        =   5
      Tag             =   "Type d'unité (inutilisé)"
      Top             =   1200
      Width           =   2595
      _ExtentX        =   4577
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
      DataField       =   "uni_type"
   End
   Begin TablesAdmin.BDCombo bdcUVent 
      Height          =   330
      Left            =   2100
      TabIndex        =   15
      Tag             =   "Unité de ventilation (facturation)"
      Top             =   3360
      Width           =   5955
      _ExtentX        =   10504
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
      DataField       =   "uni_uvent"
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   6960
      Top             =   480
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   2100
      TabIndex        =   23
      Tag             =   "Date+heure de dernière modification de l'information"
      Top             =   4800
      Width           =   2295
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "uni_adr1"
      Height          =   315
      Index           =   3
      Left            =   2100
      TabIndex        =   9
      Tag             =   "Adresse (ligne 1)"
      Top             =   1920
      Width           =   5955
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*uni_titre"
      Height          =   315
      Index           =   2
      Left            =   2100
      TabIndex        =   7
      Tag             =   "Nom complet de l'unité"
      Top             =   1560
      Width           =   5955
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*uni_code"
      Height          =   315
      Index           =   1
      Left            =   2100
      TabIndex        =   3
      Tag             =   "Code abrégé de l'unité"
      Top             =   840
      Width           =   1335
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*uni_numunite"
      Height          =   315
      Index           =   0
      Left            =   2100
      TabIndex        =   1
      Tag             =   "N° unique d'unité"
      Top             =   480
      Width           =   915
   End
   Begin TablesAdmin.BDCombo bdcMsgId 
      Height          =   330
      Left            =   2100
      TabIndex        =   17
      Tag             =   "Utilisateur recevant les messages de l'unité"
      Top             =   3720
      Width           =   5955
      _ExtentX        =   10504
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
      DataField       =   "uni_msgid"
   End
   Begin TablesAdmin.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   24
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
      Caption         =   "Email diffusion"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   18
      Top             =   4140
      Width           =   1350
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   20
      Top             =   4500
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   22
      Top             =   4860
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Messages de l'unité :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   16
      Top             =   3780
      Width           =   2010
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Ventilation :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   14
      Top             =   3420
      Width           =   1140
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Type :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   585
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Tel + Fax :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   12
      Top             =   3060
      Width           =   990
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Adresse :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   8
      Top             =   1980
      Width           =   900
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Titre :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   6
      Top             =   1620
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Code :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   630
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "N° unité :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   915
   End
End
Attribute VB_Name = "frmUnité"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmUnités
' Feuille de gestion des unités
' 12/02/1998 PV
'  7/07/1998 PV Copie des données dans le presse-papiers
' 16/07/1998 PV Traçabilité
'  5/08/1998 PV Contrôles avec bOkUtilisateur
' 15/08/1998 PV DoActiveChamp
' 22/12/1998 PV Ordre des champs dans colChamps
' 30/03/1999 PV Impressions
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des destructions et des créations

Option Explicit

Private cUni As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition
Private sFinalWP As String                ' Where-part de la requête SQL courante

Private colChange As New Collection       ' Trace des modifications
Private colDétruit As New Collection      ' Trace des déstructions d'enregistrement
Private colCréé As New Collection         ' Trace des créations

Private Const sTable = "unite"


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
  
  Dim cUniQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  cUniQuery.OpenCurseur "select * from unite where " & sWP & " order by uni_numunite"
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
  If Not cUni Is Nothing Then cUni.CloseCurseur
  Set cUni = cUniQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cUni.EOF And cUni.BOF) Then
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
  Dim i As Integer
  
  bOkValeurs = False
  If bdcUVent.Text <> "" And sNomUnitéVentilation(bdcUVent.Text) = "" Then
    MsgBox "Unité de ventilation '" & bdcUVent.Text & "' inconnue !", vbExclamation, App.Title
    Exit Function
  End If
  
  If bdcMsgId.Text <> "" Then
    If sNomUtilisateur(bdcMsgId.Text) = "" Then
      MsgBox "Utilisateur recevant les messages de l'unité '" & bdcMsgId.Text & "' inconnu !", vbExclamation, App.Title
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
  
  Dim cUniAdd As New BDCurseur
  cUniAdd.OpenCurseur "select * from unite where uni_numunite=0"
  cUniAdd.AddNew
  If Not bPrépareEditAdd(cUniAdd, colColonnes, colChamps) Then cUniAdd.CloseCurseur: Exit Sub
  cUniAdd.CloseCurseur
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cUni Is Nothing Then cUni.CloseCurseur
  Set cUni = New BDCurseur
  sFinalWP = "uni_numunite=" & sFormToSQL(colChamps("uni_numunite"), BDTypeINTEGER)
  cUni.OpenCurseur "select * from unite where " & sFinalWP
  cUni.MoveFirst
            
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
      JournalUnix sTable & " " & colChamps("uni_numunite"), "créé", sMsgTrace
    End If
  End If
  
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire           ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  bdSél.EmpêcheMouvements         ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  
  Mémorise
  
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cUni Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cUni.Edit
  If Not bPrépareEditAdd(cUni, colColonnes, colChamps) Then Exit Sub
  
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
      JournalUnix sTable & " " & colChamps("uni_numunite"), "changé", sMsgTrace
    End If
  End If
  ActiveFormulaire False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  AjusteMouvements
  
  Mémorise

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

  ActiveFormulaire False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cUni Is Nothing Then
    If Not (cUni.EOF And cUni.BOF) Then
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
  BDActiveMaxLength colChamps, colColonnes, False
  
  colChamps("uni_numunite").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cUni Is Nothing
  
  If cUni.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "uni_numunite", False
  ActiveChamp "uni_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("uni_code").SetFocus
  AutoSelect colChamps("uni_code"), True
  bdSél.TabStop = False
  
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
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  EffaceFormulaire
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "uni_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("uni_numunite").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cUni Is Nothing

  If cUni.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  Dim iNb As Integer
  iNb = BDCurseurExpress("select count(*) from utilisateur where uti_unite=" & colChamps("uni_numunite"))
  If iNb > 0 Then
    MsgBox "Effacement impossible, " & iNb & " utilisateurs(s) encore rattaché(s) à cette unité.", vbExclamation, App.Title
    Exit Sub
  End If
  iNb = BDCurseurExpress("select count(*) from lettre where let_unite=" & colChamps("uni_numunite"))
  If iNb > 0 Then
    MsgBox "Effacement impossible, " & iNb & " lettre(s) encore rattachée(s) à cette unité.", vbExclamation, App.Title
    Exit Sub
  End If
       
  ' Mémorisation de la trace de l'enregistrement qui va être détruit
  EffaceCollection colDétruit
  Dim C As Control
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      colDétruit.Add ValeurContrôle(C), C.DataField
    End If
  Next
  
  ' Tri des données à conserver et placement ds la variable Smsgtrace
  Dim sMsgTrace As String
  For Each C In Controls
    If DataFieldEx(C) <> "" Then
      If ValeurContrôle(C) <> "" Then
         If sMsgTrace <> "" Then sMsgTrace = sMsgTrace & ","
            sMsgTrace = sMsgTrace & C.DataField & ":" & colDétruit(C.DataField)
         End If
      End If
  Next
  
  ' On répertorie l'enregistrement dans le journal avant la destructiuon definitive
  If sMsgTrace <> "" Then
    JournalUnix sTable & " " & colChamps("uni_numunite"), "détruit", sMsgTrace
  End If
  
  On Error Resume Next
  cUni.Delete
  If Err.Number <> 0 Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cUni.MoveNext
  If cUni.EOF Then
    cUni.MovePrevious
    If cUni.BOF Then
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
  Assert Not cUni Is Nothing

  bdSél.ButtonEnabled("First") = cUni.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cUni.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cUni.EOF
  bdSél.ButtonEnabled("Last") = Not cUni.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cUni.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cUni.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cUni.MoveNext
  AjusteMouvements
  If cUni.EOF Then cUni.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cUni.MovePrevious
  AjusteMouvements
  If cUni.BOF Then cUni.MoveFirst
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
  Dim C As Control
  
  ResetChienDeGarde
  If KeyCode = vbKeyF5 Then   ' Mémoire
    If Shift = 0 Then
      If iMode = meAdd Or iMode = meChange Or iMode = meQuery Then
        On Error Resume Next
        If Not ActiveControl.Locked Then
          Set C = ActiveControl
          C = colMémoireUnité(ActiveControl.DataField)
          C.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each C In colChamps
        If Not C.Locked Then      ' On ne remplit pas les champs verrouillés
          C = colMémoireUnité(C.DataField)
        End If
      Next
    End If
  Else
    bdSél.KeyDown KeyCode
  End If
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
  If (iMode = meEmpty) Or (iMode = meNavigate) Then bdSél.KeyPress KeyAscii
End Sub

' Menu de commandes contextuel
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 2 Then    ' Bouton droit
    PopupMenu MDIAdministration.mnuCommandes
  End If
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
  bdcType.AddItem "O", "Opérationnel"
  bdcType.AddItem "F", "Fonctionnel"
  bdcType.AddItem "S", "Secrétariat"
  bdcType.AddItem "L", "Labo"
  bdcType.AddItem "C", "Comptable"
  
  Dim uv As UnitéVentilation
  For Each uv In colUnitéVentilation
    bdcUVent.AddItem uv.uv_numuv, uv.uv_titre
  Next
  
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcMsgId.AddItem u.sNumUti, u.uti_nom
  Next
  
  
  ' Formulaire en mode initial
  Set cUni = Nothing
  ActiveFormulaire False
  With bdSél
    .LectureSeule = bLectureSeule
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
  If Not cUni Is Nothing Then
    cUni.CloseCurseur
    Set cUni = Nothing
  End If
  MDIAdministration.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cUni Is Nothing Then
    EffaceFormulaire
  ElseIf cUni.BOF And cUni.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cUni.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cUni.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    bdSél.NumRec = cUni.AbsolutePosition
       
    ' Mise à jour en arrière plan
    ActiveTimer mtRapide
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cUni.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  ' Rien pour l'instant
End Sub



Private Sub EffaceFormulaire()
  Dim C As Control
  For Each C In colChamps
    C.Text = ""
  Next
  bdSél.NumRec = ""
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
' Activation du timer de mise à jour des champs satellites

Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop: timSatellites.Enabled = False
    Case mtLent: timSatellites.Interval = 1000: timSatellites.Enabled = True
    Case mtRapide: timSatellites.Interval = 250: timSatellites.Enabled = True
  End Select
End Sub


Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub


Private Sub bdcMsgId_GotFocus()
  SetStatus bdcMsgId.Tag
End Sub

Private Sub bdcMsgId_LostFocus()
  bdcMsgId.Synchronise
End Sub


Private Sub bdcUVent_GotFocus()
  SetStatus bdcUVent.Tag
End Sub

Private Sub bdcUVent_LostFocus()
  bdcUVent.Synchronise
End Sub


Private Sub bdcType_GotFocus()
  SetStatus bdcType.Tag
End Sub

Private Sub bdcType_LostFocus()
  bdcType.Synchronise
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
  BDCopieSélection cUni, colChamps, bdSél
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
  Dim iChoix As Integer
  iChoix = 1
  iChoix = frmMessageChoix.ChoixEtat("Liste alphabétique", "Par unité de ventilation")
  If iChoix = 0 Then Exit Sub
  Etat iChoix, bImpression
End Sub

Private Sub Etat(ByVal iChoix As Integer, ByVal bImpression As Boolean)
  Dim sSQL As String

  Select Case iChoix
    Case 1:
      sSQL = "select * from unite,outer utilisateur,outer uvent where uv_numuv=uni_uvent and uti_numuti=uni_msgid and " & sFinalWP & " order by uni_numunite"
      BDEtat sSQL, drUnité, bImpression
      
    Case 2:
      sSQL = "SHAPE {select * from uvent where uv_numuv in (select unique uni_uvent from unite where " & sFinalWP & ") order by uv_numuv} AS Tête APPEND ({select * from unite where " & sFinalWP & " order by uni_numunite} AS Corps RELATE 'uv_numuv' TO 'uni_uvent') AS Corps"
      BDEtat sSQL, drUnitéParUV, bImpression
  End Select
End Sub


'=================================================================================
' Mémorisation

Public Sub Mémorise()
  EffaceCollection colMémoireUnité
  
  Dim t As Control
  For Each t In colChamps
    colMémoireUnité.Add Trim(t), t.DataField
  Next
End Sub



'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("uni_numunite") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub


