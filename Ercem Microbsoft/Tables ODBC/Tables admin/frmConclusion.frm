VERSION 5.00
Begin VB.Form frmConclusion 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des conclusions"
   ClientHeight    =   4590
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   9090
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmConclusion.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   306
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   606
   Tag             =   "Données"
   Begin VB.TextBox txtChamp 
      DataField       =   "*con_libellecourt"
      Height          =   315
      Index           =   2
      Left            =   1740
      MaxLength       =   30
      TabIndex        =   5
      Top             =   1200
      Width           =   5715
   End
   Begin TablesAdmin.BDCombo bdcLangue 
      Height          =   330
      Left            =   5160
      TabIndex        =   3
      Top             =   480
      Width           =   2295
      _ExtentX        =   4048
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
      DataField       =   "^*con_langue"
   End
   Begin TablesAdmin.BDSélecteur bdSél 
      Height          =   435
      Left            =   -60
      TabIndex        =   28
      Top             =   0
      Width           =   9135
      _ExtentX        =   16113
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
      DataField       =   "con_options"
      Height          =   315
      Index           =   8
      Left            =   1740
      TabIndex        =   8
      Top             =   2280
      Width           =   795
   End
   Begin VB.Timer timSatellites 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   960
      Top             =   540
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "con_comment"
      Height          =   315
      Index           =   16
      Left            =   1740
      TabIndex        =   9
      Top             =   2640
      Width           =   7275
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "con_abrege"
      Height          =   315
      Index           =   6
      Left            =   1740
      TabIndex        =   7
      Top             =   1920
      Width           =   795
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*con_cprin"
      Height          =   315
      Index           =   4
      Left            =   1740
      TabIndex        =   6
      Top             =   1560
      Width           =   795
   End
   Begin VB.Frame frlTraçabilité 
      Caption         =   "Traçabilité"
      Height          =   1395
      Left            =   60
      TabIndex        =   19
      Top             =   3120
      Width           =   8955
      Begin TablesAdmin.BDCombo bdcoperModif 
         Height          =   330
         Left            =   3780
         TabIndex        =   15
         Top             =   600
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
         DataField       =   "con_opermodif"
      End
      Begin TablesAdmin.BDCombo bdcOperCreat 
         Height          =   330
         Left            =   3780
         TabIndex        =   12
         Top             =   240
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
         DataField       =   "con_opercreat"
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "timestamp"
         Height          =   315
         Index           =   22
         Left            =   1680
         TabIndex        =   16
         Top             =   960
         Width           =   2055
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "con_datecreat"
         Height          =   315
         Index           =   17
         Left            =   1680
         TabIndex        =   10
         Top             =   240
         Width           =   1035
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "con_heurecreat"
         Height          =   315
         Index           =   18
         Left            =   2760
         TabIndex        =   11
         Top             =   240
         Width           =   975
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "con_datemodif"
         Height          =   315
         Index           =   19
         Left            =   1680
         TabIndex        =   13
         Top             =   600
         Width           =   1035
      End
      Begin VB.TextBox txtChamp 
         DataField       =   "con_heuremodif"
         Height          =   315
         Index           =   20
         Left            =   2760
         TabIndex        =   14
         Top             =   600
         Width           =   975
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Timestamp :"
         Height          =   210
         Index           =   13
         Left            =   120
         TabIndex        =   22
         Top             =   1020
         Width           =   1155
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Créé le :"
         Height          =   210
         Index           =   17
         Left            =   120
         TabIndex        =   20
         Top             =   300
         Width           =   810
      End
      Begin VB.Label lblChamp 
         AutoSize        =   -1  'True
         Caption         =   "Modifié le :"
         Height          =   210
         Index           =   16
         Left            =   120
         TabIndex        =   21
         Top             =   660
         Width           =   1020
      End
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*con_libelle"
      Height          =   315
      Index           =   3
      Left            =   1740
      MaxLength       =   70
      TabIndex        =   4
      Top             =   840
      Width           =   7275
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "con_etat"
      Height          =   315
      Index           =   1
      Left            =   3540
      TabIndex        =   2
      Top             =   480
      Width           =   315
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "con_indice"
      Height          =   315
      Index           =   0
      Left            =   1740
      TabIndex        =   1
      Top             =   480
      Width           =   795
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Libellé court :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   29
      Top             =   1260
      Width           =   1275
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Remarques :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   27
      Top             =   2700
      Width           =   1200
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Options :"
      Height          =   210
      Index           =   12
      Left            =   60
      TabIndex        =   26
      Top             =   2340
      Width           =   870
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Abrégé : "
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   25
      Top             =   1980
      Width           =   870
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Langue :"
      Height          =   210
      Index           =   10
      Left            =   4200
      TabIndex        =   24
      Top             =   540
      Width           =   840
   End
   Begin VB.Label lblChamp 
      Caption         =   "C. Prin :"
      Height          =   195
      Index           =   7
      Left            =   60
      TabIndex        =   23
      Top             =   1620
      Width           =   855
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Libellé :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   18
      Top             =   900
      Width           =   735
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "État :"
      Height          =   210
      Index           =   1
      Left            =   2880
      TabIndex        =   17
      Top             =   540
      Width           =   525
   End
   Begin VB.Label lblChamp 
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
Attribute VB_Name = "frmConclusion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmConclusion
' Feuille de gestion des conclusions
' 01/06/1999 NC
' 04/01/2000 NC Choix du n° de conclusion autorisé - Multilangue
' 12/01/2001 PV Mémorisation, langue par défaut
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des destructions et des créations
' 05/12/2001 FF Historique des récupérations d'enregistrement

Option Explicit

Private cConc As BDCurseur                ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire

Private sFinalWP As String                ' Where-part de la requête SQL courante
Private sQuery As String                  ' Query de la sélection en cours

Private colChange As New Collection       ' Trace des modifications
Private colDétruit As New Collection      ' Trace des déstructions d'enregistrement
Private colCréé As New Collection         ' Trace des créations

Private Const sTable = "conclusion"


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
      If t.DataField = "con_etat" Then bWPIntègreEtat = True
    End If
  Next
  
  If sWP = "" Then
    Dim iRep As VbMsgBoxResult
    iRep = MsgBox("Attention, vous allez lire tous les enregistrements." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
    If iRep = vbNo Then Exit Sub
    sWP = "1=1"
  End If
  
  Dim cConcQuery As New BDCurseur
  BDActiveFormulaire colChamps, False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String
  On Error Resume Next
  sQuery = "select * from conclusion where " & sWP
  'sQuery = "select * from conclusion where con_indice=" & sFormToSQL(colChamps("con_indice"), BDTypeINTEGER) & " and con_langue=" & sFormToSQL(colChamps("con_langue"), BDTypeCHAR)
  If Not bWPIntègreEtat Then sQuery = sQuery & " and con_etat is null"
  sQuery = sQuery & " order by con_indice"

  cConcQuery.OpenCurseur sQuery
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
  If Not cConc Is Nothing Then cConc.CloseCurseur
  Set cConc = cConcQuery
  sFinalWP = sWP
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cConc.EOF And cConc.BOF) Then
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
  
  ' On regarde si le nom n'existe pas déjà
  Dim iSer As Long
  iSer = BDCurseurExpress("select con_indice from conclusion where con_libelle=" & sFormToSQL(colChamps("con_libelle"), BDTypeCHAR))
  If iSer <> 0 And iSer <> colChamps("con_indice") Then
    MsgBox "ATTENTION - Ce conclusion existe déjà sous le n° " & iSer, vbExclamation, App.Title
    Exit Function
  End If
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub

  ' Génération du n° de série
  
  Dim cConcAdd As New BDCurseur
  cConcAdd.OpenCurseur "select * from conclusion where con_indice=0"
  cConcAdd.AddNew
  
  ' Génération du n° de série
  
  If colChamps("con_indice") = "" Then
    Dim cnumcon As New BDCurseur
    cnumcon.OpenCurseur "select max (con_indice) from conclusion"
    colChamps("con_indice") = cnumcon.Fields(0) + 1
    cConcAdd!con_indice = cnumcon.Fields(0) + 1
    cnumcon.CloseCurseur
  End If
  
' Traçabilité ancien style
  InitTraçabilité colChamps, "con", True

' Seuls les champs actifs sont mis à jour
  ActiveTraçabilité True
  ActiveChamp "con_indice", True
  
  If Not bPrépareEditAdd(cConcAdd, colColonnes, colChamps) Then
    cConcAdd.CloseCurseur
    ActiveTraçabilité False
    ActiveChamp "con_indice", False
    Exit Sub
  End If
  cConcAdd.CloseCurseur
  
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cConc Is Nothing Then cConc.CloseCurseur
  Set cConc = New BDCurseur
  
  sFinalWP = "con_indice=" & colChamps("con_indice")
  ' sQuery = "select * from conclusion where " & sFinalWP
  sQuery = "select * from conclusion where con_indice=" & sFormToSQL(colChamps("con_indice"), BDTypeINTEGER) & " and con_langue=" & sFormToSQL(colChamps("con_langue"), BDTypeCHAR)
  cConc.OpenCurseur sQuery
  cConc.MoveFirst
  
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
      JournalUnix sTable & " " & colChamps("con_indice") & " " & colChamps("con_langue"), "créé", sMsgTrace
    End If
  End If
    
  BDActiveFormulaire colChamps, False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  bdSél.ActiveValidation False
  SynchroniseFormulaire   ' Affiche le timestamp
  iMode = meNavigate
  
  bdSél.ActiveMouvements True
  ' Aucun déplacement permis, puisque le recordset ne contient qu'un enregistrement
  bdSél.EmpêcheMouvements
  
  Mémorise
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cConc Is Nothing
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cConc.Edit
      
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "con", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
    
  If Not bPrépareEditAdd(cConc, colColonnes, colChamps) Then
    ActiveTraçabilité False
    Exit Sub
  End If
  
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
      JournalUnix sTable & " " & colChamps("con_indice") & " " & colChamps("con_langue"), "changé", sMsgTrace
    End If
  End If
  
  BDActiveFormulaire colChamps, False
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
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)
 
  Select Case iMode
    Case meChange:  ValidateEdit
    Case meAdd:     ValidateAdd
    Case meQuery:   ValidateQuery
  End Select
End Sub





Private Sub ActionCancel()
  ActiveTimer mtStop
  Assert (iMode = meAdd) Or (iMode = meChange) Or (iMode = meQuery)

  BDActiveFormulaire colChamps, False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  
  SynchroniseFormulaire   ' Affiche le timestamp
  
  iMode = meEmpty
  If Not cConc Is Nothing Then
    If Not (cConc.EOF And cConc.BOF) Then
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
  
  colChamps("con_indice").SetFocus
  bdSél.TabStop = False
  bdcLangue = cSystèmeLang
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cConc Is Nothing
  
  If cConc.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If

  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True

  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "con_indice", False
  ActiveChamp "con_etat", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False


  colChamps("con_libelle").SetFocus
  AutoSelect colChamps("con_libelle"), True
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
  BDActiveMaxLength colChamps, colColonnes, True
  BDActiveFormulaire colChamps, True
  ActiveChamp "con_indice", False
  ActiveChamp "con_etat", False
  ActiveChamp "timestamp", False
  ActiveTraçabilité False
  
  bdcLangue = cSystèmeLang
  colChamps("con_libelle").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub



Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cConc Is Nothing
  
  If cConc.bEffacé Then
    MsgBox "Vous ne pouvez pas supprimer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  If bShiftPressed Then
    ActionDétruit             ' Détruit l'enregistrement
  Else
    ActionSupprime            ' Marque l'enregistrement supprimé (état S)
  End If
End Sub


Public Sub ActionSupprime()   ' Marque l'enregistrement supprimé (état S)
  If colChamps("con_etat") <> "" Then
    MsgBox "Déjà supprimé (état S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  cConc.Edit
  cConc!con_etat = "S"
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "con", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
  bPrépareEditAdd cConc, colColonnes, colChamps
  ActiveTraçabilité False
  
  ' On spécifie dans l'historique des modifications que le numéro X est passé à l'état de supprimé
  Dim sMsgTrace As String
  sMsgTrace = colChamps("con_indice") & "-> Etat S"
    If cConc!con_etat = "S" Then
       If sMsgTrace <> "" Then
          JournalUnix sTable & " " & colChamps("con_indice") & " " & colChamps("con_langue"), "Supprimé", sMsgTrace
       End If
    End If
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub


Public Sub Récupère()   ' Récupère un enregistrement supprimé (état S)
  If colChamps("con_etat") <> "S" Then
    MsgBox "Vous ne pouvez récupérer qu'un enregistrement supprimé (état S)", vbExclamation, App.Title
    Exit Sub
  End If
  
  cConc.Edit
  cConc!con_etat = Null
  
  ' Traçabilité ancien style
  InitTraçabilité colChamps, "con", False
  ActiveTraçabilité True     ' Pour mettre à jour la base
  bPrépareEditAdd cConc, colColonnes, colChamps
  ActiveTraçabilité False
  
  ' Si on veut récupérer, on le mentionne ds l'historique
  Dim sMsgTrace As String
  sMsgTrace = colChamps("con_indice") & " " & colChamps("con_langue") & " -> Récup"
  If sMsgTrace <> "" Then
        JournalUnix sTable & " " & colChamps("con_indice") & " " & colChamps("con_langue"), "Récupéré", sMsgTrace
  End If
  
  SynchroniseFormulaire   ' Affiche le timestamp
End Sub

  
Public Sub ActionDétruit()    ' Détruit l'enregistrement
  Dim iRep As VbMsgBoxResult
  iRep = MsgBox("Attention, la destruction est définitive." & vbCrLf & "Confirmez-vous cette opération ?", vbYesNo + vbQuestion, App.Title)
  If iRep = vbNo Then Exit Sub
  
  If colChamps("con_etat") <> "S" Then
    MsgBox "Vous ne pouvez pas détruire un enregistrement sans l'avoir au préalable supprimé (état S)", vbExclamation, App.Title
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
    JournalUnix sTable & " " & colChamps("con_indice") & " " & colChamps("con_langue"), "détruit", sMsgTrace
  End If
  
  On Error Resume Next
  cConc.Delete
  If Err Then
    AfficheErreurODBC "Échec de la destruction de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cConc.MoveNext
  If cConc.EOF Then
    cConc.MovePrevious
    If cConc.BOF Then
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

Private Sub ActiveTraçabilité(bEnable As Boolean)
  ActiveChamp "con_datecreat", bEnable
  ActiveChamp "con_heurecreat", bEnable
  ActiveChamp "con_opercreat", bEnable
  ActiveChamp "con_datemodif", bEnable
  ActiveChamp "con_heuremodif", bEnable
  ActiveChamp "con_opermodif", bEnable
'  ActiveChamp "con_tsvalid", bEnable
'  ActiveChamp "con_opervalid", bEnable
End Sub

'=================================================================================
' Mouvements

Private Sub AjusteMouvements()
  Assert iMode = meNavigate
  Assert Not cConc Is Nothing

  bdSél.ButtonEnabled("First") = cConc.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cConc.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cConc.EOF
  bdSél.ButtonEnabled("Last") = Not cConc.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cConc.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cConc.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cConc.MoveNext
  AjusteMouvements
  If cConc.EOF Then cConc.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cConc.MovePrevious
  AjusteMouvements
  If cConc.BOF Then cConc.MoveFirst
  SynchroniseFormulaire
End Sub

Private Sub bdcLangue_Change()
  ToMaj bdcLangue
End Sub

Private Sub bdcLangue_LostFocus()
  bdcLangue.Synchronise
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
          C = colMémoireConclusion(ActiveControl.DataField)
          C.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each C In colChamps
        If Not C.Locked Then      ' On ne remplit pas les champs verrouillés
          C = colMémoireConclusion(C.DataField)
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

Private Sub txtChamp_DblClick(Index As Integer)
  If iMode = meAdd And txtChamp(Index).DataField = "con_indice" Then
    ActiveChamp "con_indice", True
  End If
  
End Sub

' Filtrage des Entrée intempestifs
Private Sub txtChamp_KeyDown(Index As Integer, KeyCode As Integer, Shift As Integer)
  If KeyCode = 13 Then KeyCode = 0
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
  
  ' Utilisateurs
  Dim u As Utilisateur
  For Each u In colUtilisateur
    bdcOperCreat.AddItem u.uti_numuti, u.uti_nom
    bdcOperModif.AddItem u.uti_numuti, u.uti_nom
  '  bdcOperValid.AddItem u.uti_numuti, u.uti_nom
  Next
  
  ' Langues
  Dim l As Langue
  For Each l In colLangue
    bdcLangue.AddItem l.lan_code, l.lan_langue
  Next
  
  
  ' Formulaire en mode initial
  Set cConc = Nothing
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
  If Not cConc Is Nothing Then cConc.CloseCurseur
  MDIAdministration.AjusteMenus -1
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
  ActiveTimer mtStop
  If cConc Is Nothing Then
    EffaceFormulaire
  ElseIf cConc.BOF And cConc.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cConc.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cConc.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cConc.AbsolutePosition
    
    ActiveTimer mtRapide      ' Mise à jour en arrière plan

  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cConc.bEffacé = True
    Exit Sub
  End If
  On Error GoTo 0
  Resume
End Sub



' Champs satellites sur timer
Private Sub timSatellites_Timer()
  ActiveTimer mtStop

'  ' Affichage des champs satellites
'  If colChamps("con_critere") <> "" Then
'    txtCritère = BDCurseurExpress("select cri_titre1 from critere where cri_critere='" & colChamps("con_critere") & "'")
'  End If
'
'  If colChamps("con_t1") <> "" Then
'    txtType(1) = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & colChamps("con_t1") & " and lnt_t2=0 and lnt_t3=0 and lnt_t4=0 and lnt_t5=0")
'    txtType(2) = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & colChamps("con_t1") & " and lnt_t2=" & colChamps("con_t2") & " and lnt_t3=0 and lnt_t4=0 and lnt_t5=0")
'    txtType(3) = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & colChamps("con_t1") & " and lnt_t2=" & colChamps("con_t2") & " and lnt_t3=" & colChamps("con_t3") & " and lnt_t4=0 and lnt_t5=0")
'    txtType(4) = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & colChamps("con_t1") & " and lnt_t2=" & colChamps("con_t2") & " and lnt_t3=" & colChamps("con_t3") & " and lnt_t4=" & colChamps("con_t4") & " and lnt_t5=0")
'    txtType(5) = BDCurseurExpress("select lnt_libelle from libntype where lnt_t1=" & colChamps("con_t1") & " and lnt_t2=" & colChamps("con_t2") & " and lnt_t3=" & colChamps("con_t3") & " and lnt_t4=" & colChamps("con_t4") & " and lnt_t5=" & colChamps("con_t5"))
'  End If
End Sub



Private Sub EffaceFormulaire()
  Dim C As Control
  For Each C In colChamps
    C.Text = ""
  Next
  
  bdSél.NumRec = ""
End Sub


' Activation du timer de mise à jour des champs satellites
Private Sub ActiveTimer(mtMode As eModeTimer)
  Select Case mtMode
    Case mtStop: timSatellites.Enabled = False
    Case mtLent: timSatellites.Interval = 1000: timSatellites.Enabled = True
    Case mtRapide: timSatellites.Interval = 250: timSatellites.Enabled = True
  End Select
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

Private Sub bdcLangue_GotFocus()
  SetStatus bdcLangue.Tag
End Sub

Private Sub bdcOperCreat_GotFocus()
  SetStatus bdcOperCreat.Tag
End Sub

Private Sub bdcOperModif_GotFocus()
  SetStatus bdcOperModif.Tag
End Sub

'Private Sub bdcOperValid_GotFocus()
'  SetStatus bdcOperValid.Tag
'End Sub


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
  BDCopieSélection cConc, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub

'=================================================================================
' Impression

Public Sub Imprime()
  BDEtat sQuery, drConSimple, True
End Sub

Public Sub Aperçu()
  BDEtat sQuery, drConSimple, False
End Sub


'=================================================================================
' Mémorisation

Public Sub Mémorise()
  EffaceCollection colMémoireConclusion
  
  Dim t As Control
  For Each t In colChamps
    colMémoireConclusion.Add (t), t.DataField
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
  sWP = "jou_domaine='" & sTable & " " & colChamps("con_indice") & " " & colChamps("con_langue") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub

