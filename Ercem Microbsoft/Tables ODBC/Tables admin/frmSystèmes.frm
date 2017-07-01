VERSION 5.00
Begin VB.Form frmSystème 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des systèmes Unix / adresses labo"
   ClientHeight    =   5955
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8880
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmSystèmes.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   397
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   592
   Tag             =   "Données"
   Begin VB.TextBox txtChamp 
      DataField       =   "sys_sc3"
      Height          =   315
      Index           =   13
      Left            =   1500
      TabIndex        =   29
      Top             =   5520
      Width           =   7335
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sys_sc2"
      Height          =   315
      Index           =   12
      Left            =   1500
      TabIndex        =   27
      Top             =   5160
      Width           =   7335
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sys_sc1"
      Height          =   315
      Index           =   11
      Left            =   1500
      TabIndex        =   25
      Top             =   4800
      Width           =   7335
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sys_motd1"
      Height          =   315
      Index           =   10
      Left            =   1500
      MaxLength       =   60
      TabIndex        =   21
      Top             =   4080
      Width           =   7335
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sys_motd2"
      Height          =   315
      Index           =   9
      Left            =   1500
      MaxLength       =   60
      TabIndex        =   23
      Top             =   4440
      Width           =   7335
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sys_cofrac"
      Height          =   315
      Index           =   8
      Left            =   1500
      TabIndex        =   19
      Top             =   3720
      Width           =   1035
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sys_adrlabo3"
      Height          =   315
      Index           =   7
      Left            =   1500
      TabIndex        =   17
      Top             =   3360
      Width           =   7335
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sys_adrlabo2"
      Height          =   315
      Index           =   5
      Left            =   1500
      TabIndex        =   15
      Top             =   3000
      Width           =   7335
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sys_adrlabo1"
      Height          =   315
      Index           =   4
      Left            =   1500
      TabIndex        =   13
      Top             =   2640
      Width           =   7335
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "sys_idmodif"
      Height          =   315
      Index           =   6
      Left            =   1500
      TabIndex        =   9
      Tag             =   "Origine de la modification"
      Top             =   1920
      Width           =   3750
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   5040
      Top             =   480
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   3
      Left            =   1500
      TabIndex        =   11
      Tag             =   "Date+heure de dernière modification de l'information"
      Top             =   2280
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*sys_description"
      Height          =   315
      Index           =   2
      Left            =   1500
      TabIndex        =   5
      Tag             =   "Nom et affectation du système"
      Top             =   1200
      Width           =   4035
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*sys_nom"
      Height          =   315
      Index           =   1
      Left            =   1500
      TabIndex        =   3
      Tag             =   "Nom du système Unix"
      Top             =   840
      Width           =   1440
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*sys_systeme"
      Height          =   315
      Index           =   0
      Left            =   1500
      TabIndex        =   1
      Tag             =   "Une lettre en majuscules pour décrire le système"
      Top             =   480
      Width           =   615
   End
   Begin TablesAdmin.BDCombo bdcBalSite 
      Height          =   330
      Left            =   1500
      TabIndex        =   7
      Tag             =   "Système Unix gérant les boîtes aux lettres sur le site"
      Top             =   1560
      Width           =   2055
      _ExtentX        =   3625
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
      DataField       =   "sys_balsite"
   End
   Begin TablesAdmin.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   24
      Top             =   0
      Width           =   8880
      _ExtentX        =   15663
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
      Caption         =   "Serv. Client 3 :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   30
      Top             =   5580
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Serv. Client 2 :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   28
      Top             =   5220
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Serv. Client 1 :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   26
      Top             =   4860
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "motd 1 :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   20
      Top             =   4140
      Width           =   795
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "motd 2 :"
      Height          =   210
      Index           =   9
      Left            =   60
      TabIndex        =   22
      Top             =   4500
      Width           =   795
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "COFRAC :"
      Height          =   210
      Index           =   8
      Left            =   60
      TabIndex        =   18
      Top             =   3780
      Width           =   900
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Adr labo 3 :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   16
      Top             =   3420
      Width           =   1095
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Adr labo 2 :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   14
      Top             =   3060
      Width           =   1095
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Adr labo 1 :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   12
      Top             =   2700
      Width           =   1095
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   8
      Top             =   1980
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   10
      Top             =   2340
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "BAL site :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   6
      Top             =   1620
      Width           =   885
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Description :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   1185
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Nom :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   555
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Système :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   945
   End
End
Attribute VB_Name = "frmSystème"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmSystèmes
' Gestion des systèmes Unix
' 12/02/1998 PV
'  7/07/1998 PV Copie des données dans le presse-papiers
' 16/07/1998 PV Traçabilité
'  5/08/1998 PV Contrôles avec bOkUtilisateur
' 15/08/1998 PV DoActiveChamp
' 22/12/1998 PV Ordre des champs dans colChamps
' 30/03/1999 PV Impression
' 15/01/2000 PV sys_motd1 et sys_motd2
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des destructions et des créations

Option Explicit

Private cSys As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition
Private sFinalSQL As String               ' Requête SQL courante

Private colChange As New Collection       ' Trace des modification
Private colDétruit As New Collection      ' Trace des déstructions d'enregistrement
Private colCréé As New Collection         ' Trace des créations

Private Const sTable = "systeme"


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
  
  Dim cSysQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from systeme where " & sWP & " order by sys_systeme"
  cSysQuery.OpenCurseur sSQL
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
  If Not cSys Is Nothing Then cSys.CloseCurseur
  Set cSys = cSysQuery
  sFinalSQL = sSQL
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cSys.EOF And cSys.BOF) Then
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
  
  If Len(colChamps("sys_systeme").Text) <> 1 Then
    MsgBox "Système incorrect ! (Une lettre majuscule)", vbExclamation, App.Title
    Exit Function
  End If
  If colChamps("sys_systeme") < "A" Or colChamps("sys_systeme") > "Z" Then
    MsgBox "Système incorrect ! (Une lettre majuscule)", vbExclamation, App.Title
    Exit Function
  End If
  
  If bdcBalSite.Text <> UCase(bdcBalSite.Text) Then bdcBalSite.Text = UCase(bdcBalSite.Text)
  If bdcBalSite.Text <> "" And sNomSystème(bdcBalSite.Text) = "" Then
    MsgBox "Système de gestion des BAL du site '" & bdcBalSite.Text & "' inconnu !", vbExclamation, App.Title
    Exit Function
  End If

  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim cSysAdd As New BDCurseur
  cSysAdd.OpenCurseur "select * from systeme where sys_systeme='@'"
  cSysAdd.AddNew
  If Not bPrépareEditAdd(cSysAdd, colColonnes, colChamps) Then cSysAdd.CloseCurseur: Exit Sub
  cSysAdd.CloseCurseur

  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cSys Is Nothing Then cSys.CloseCurseur
  Set cSys = New BDCurseur
  sFinalSQL = "select * from systeme where sys_systeme=" & sFormToSQL(colChamps("sys_systeme"), BDTypeCHAR)
  cSys.OpenCurseur sFinalSQL
  cSys.MoveFirst
        
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
      JournalUnix sTable & " " & colChamps("sys_systeme"), "créé", sMsgTrace
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
  Assert Not cSys Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cSys.Edit
  If Not bPrépareEditAdd(cSys, colColonnes, colChamps) Then Exit Sub

  
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
      JournalUnix sTable & " " & colChamps("sys_systeme"), "changé", sMsgTrace
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
  If Not cSys Is Nothing Then
    If Not (cSys.EOF And cSys.BOF) Then
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
  
  colChamps("sys_systeme").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cSys Is Nothing
  
  If cSys.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "sys_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("sys_systeme").SetFocus
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
  ActiveChamp "sys_idmodif", False
  ActiveChamp "timestamp", False

  colChamps("sys_systeme").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cSys Is Nothing

  If cSys.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, l'effacement est définitif." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
       
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
    JournalUnix sTable & " " & colChamps("sys_systeme"), "détruit", sMsgTrace
  End If
  
  On Error Resume Next
  cSys.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cSys.MoveNext
  If cSys.EOF Then
    cSys.MovePrevious
    If cSys.BOF Then
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
  Assert Not cSys Is Nothing

  bdSél.ButtonEnabled("First") = cSys.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cSys.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cSys.EOF
  bdSél.ButtonEnabled("Last") = Not cSys.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cSys.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cSys.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cSys.MoveNext
  AjusteMouvements
  If cSys.EOF Then cSys.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cSys.MovePrevious
  AjusteMouvements
  If cSys.BOF Then cSys.MoveFirst
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
          C = colMémoireSystème(ActiveControl.DataField)
          C.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each C In colChamps
        If Not C.Locked Then      ' On ne remplit pas les champs verrouillés
          C = colMémoireSystème(C.DataField)
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
  Dim s As Système
  For Each s In colSystème
    bdcBalSite.AddItem s.sys_systeme, s.sys_nom
  Next
  
  
  ' Formulaire en mode initial
  Set cSys = Nothing
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
  If Not cSys Is Nothing Then
    cSys.CloseCurseur
    Set cSys = Nothing
  End If
  MDIAdministration.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  ActiveTimer mtStop
  If cSys Is Nothing Then
    EffaceFormulaire
  ElseIf cSys.BOF And cSys.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cSys.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cSys.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cSys.AbsolutePosition
       
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
    cSys.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub


' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop
  
  If bdcBalSite.Text <> "" And InStr(bdcBalSite.Text, bdcBalSite.Séparateur) = 0 Then
    bdcBalSite.AddItem bdcBalSite.Text, sNomSystème(bdcBalSite.Text)
  End If
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

Private Sub bdcBalSite_GotFocus()
  SetStatus bdcBalSite.Tag
End Sub

Private Sub bdcBalSite_LostFocus()
  bdcBalSite.Synchronise
End Sub

Private Sub bdSél_GotFocus()
  SetStatus
End Sub


Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "sys_systeme" Then
    Dim txtSystème As TextBox
    Set txtSystème = txtChamp(Index)
    ' On convertit les Systèmes en majuscules
    If txtSystème <> UCase(txtSystème) Then
      Dim sStart As Integer, sLength As Integer
      sStart = txtSystème.SelStart
      sLength = txtSystème.SelLength
      txtSystème = UCase(txtSystème)
      txtSystème.SelStart = sStart
      txtSystème.SelLength = sLength
    End If
  End If
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
  BDCopieSélection cSys, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  BDEtat sFinalSQL, drSystème, True
End Sub

Public Sub Aperçu()
  BDEtat sFinalSQL, drSystème, False
End Sub


'=================================================================================
' Mémorisation

Public Sub Mémorise()
  EffaceCollection colMémoireSystème
  
  Dim t As Control
  For Each t In colChamps
    colMémoireSystème.Add (t), t.DataField
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
  sWP = "jou_domaine='" & sTable & " " & colChamps("sys_systeme") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub



