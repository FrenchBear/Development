VERSION 5.00
Begin VB.Form frmLibellésRA 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Gestion des libellés des rapports d'analyse"
   ClientHeight    =   3015
   ClientLeft      =   150
   ClientTop       =   150
   ClientWidth     =   8760
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmLibellésRA.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   201
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   584
   Tag             =   "Données"
   Begin VB.TextBox txtChamp 
      DataField       =   "*lcr_libelle"
      Height          =   315
      Index           =   2
      Left            =   2040
      TabIndex        =   7
      Tag             =   "Libellé complet"
      Top             =   1560
      Width           =   6660
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lcr_code"
      Height          =   315
      Index           =   1
      Left            =   2040
      TabIndex        =   5
      Tag             =   "Code de saisie rapide"
      Top             =   1200
      Width           =   855
   End
   Begin TablesAdmin.BDCombo bdcLangue 
      Height          =   330
      Left            =   2040
      TabIndex        =   3
      Tag             =   "Code langue du libellé"
      Top             =   840
      Width           =   2115
      _ExtentX        =   3731
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
      DataField       =   "*lcr_langue"
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   2040
      TabIndex        =   13
      Tag             =   "Date+heure de dernière modification de l'information"
      Top             =   2640
      Width           =   2055
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lcr_idmodif"
      Height          =   315
      Index           =   12
      Left            =   2040
      TabIndex        =   11
      Tag             =   "Origine de la modification"
      Top             =   2280
      Width           =   3750
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "lcr_comment"
      Height          =   315
      Index           =   8
      Left            =   2040
      TabIndex        =   9
      Tag             =   "Commentaire libre quelconque"
      Top             =   1920
      Width           =   6660
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*lcr_indice"
      Height          =   315
      Index           =   0
      Left            =   2040
      TabIndex        =   1
      Tag             =   "Indice du libellé"
      Top             =   480
      Width           =   615
   End
   Begin TablesAdmin.BDSélecteur bdSél 
      Align           =   1  'Align Top
      Height          =   435
      Left            =   0
      TabIndex        =   14
      Top             =   0
      Width           =   8760
      _ExtentX        =   15452
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
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   12
      Top             =   2700
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   11
      Left            =   60
      TabIndex        =   10
      Top             =   2340
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Commentaire :"
      Height          =   210
      Index           =   10
      Left            =   60
      TabIndex        =   8
      Top             =   1980
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Libellé :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   6
      Top             =   1620
      Width           =   735
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Code :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   4
      Top             =   1260
      Width           =   630
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Langue :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   2
      Top             =   900
      Width           =   840
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Indice :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   705
   End
End
Attribute VB_Name = "frmLibellésRA"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' frmLibellésRA
' Gestion des libellés de CRA
'  6/07/1998 PV
'  7/08/1998 PV Intervention opérateur
' 15/08/1998 PV BDActiveChamp
' 18/08/1998 PV Numérotation des ressources
' 22/12/1998 PV Ordre des champs dans colChamps; Parenthèses avant "and lcr_ressource=nn"
' 30/03/1999 PV Impressions (v1.1)
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des destructions et des créations


Option Explicit

Private cLcr As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition
Private sFinalSQL As String               ' Requête SQL courante

Private iRessource As eRessource          ' Ressource en cours d'édition
Private colChange As New Collection       ' Trace des modifications
Private colDétruit As New Collection      ' Trace des déstructions d'enregistrement
Private colCréé As New Collection         ' Trace des créations

Const sTable As String = "libcra"

'=================================================================================

Public Sub setMode(ByVal iRess As eRessource)
  Select Case iRess
    Case rSecteurPrélèvement:     Caption = "1. Secteur de prélèvement [7]"
    Case rInterventionOpérateur:  Caption = "2. Intervention opérateur [9]"
    Case rModeConditionnement:    Caption = "3. Mode de conditionnement [16]"
    Case rNiveauÉlaboration:      Caption = "4. Niveau d'élaboration [19]"
    Case rÉtatDivision:           Caption = "5. État de division [18]"
    Case rÉtatPhysique:           Caption = "6. État physique [8]"
    Case rTechnologieFabrication: Caption = "7. Technologie de fabrication [20]"
    Case rAspectÉchantillon:      Caption = "8. Aspect de l'échantillon [34]"
    Case rConditionsPrélèvement:  Caption = "9. Conditions de prélèvement [15]"
    Case rCadrePrélèvement:       Caption = "10. Cadre de prélèvement [10]"
    Case rLieuPrélèvement:        Caption = "11. Lieu de prélèvement [14]"
    Case rContenant:              Caption = "12. Contenant [17]"
    Case Else: Stop
  End Select
  iRessource = iRess
End Sub

Public Function GetRessource() As eRessource
  GetRessource = iRessource
End Function


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
  
  Dim cLcrQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from libcra where (" & sWP & ") and lcr_ressource=" & iRessource & " order by lcr_indice"
  cLcrQuery.OpenCurseur sSQL
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
  If Not cLcr Is Nothing Then cLcr.CloseCurseur
  Set cLcr = cLcrQuery
  sFinalSQL = sSQL
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cLcr.EOF And cLcr.BOF) Then
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
  
  If bdcLangue.Text <> UCase(bdcLangue.Text) Then bdcLangue.Text = UCase(bdcLangue.Text)
  If InStr(bdcLangue.FullText, bdcLangue.Séparateur) = 0 Then
    MsgBox "Code langue '" & bdcLangue & "' inconnu !", vbExclamation, App.Title
    Exit Function
  End If

  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Dim sType As String
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  Dim cLcrAdd As New BDCurseur
  cLcrAdd.OpenCurseur "select * from libcra where lcr_ressource=0"
  cLcrAdd.AddNew
  cLcrAdd!lcr_ressource = iRessource
  cLcrAdd!lcr_idmodif = sBDIdModif
  If Not bPrépareEditAdd(cLcrAdd, colColonnes, colChamps) Then cLcrAdd.CloseCurseur: Exit Sub
  cLcrAdd.CloseCurseur
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cLcr Is Nothing Then cLcr.CloseCurseur
  Set cLcr = New BDCurseur
  sFinalSQL = "select * from libcra where lcr_ressource=" & iRessource & " and lcr_indice=" & sFormToSQL(colChamps("lcr_indice"), BDTypeINTEGER) & " and lcr_langue=" & sFormToSQL(colChamps("lcr_langue"), BDTypeCHAR)
  cLcr.OpenCurseur sFinalSQL
  cLcr.MoveFirst
     
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
      JournalUnix sTable & " " & iRessource & " " & colChamps("lcr_indice") & " " & colChamps("lcr_langue"), "créé", sMsgTrace
    End If
  End If
  
  
  ActiveFormulaire False
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
  Dim sType As String
  Assert iMode = meChange
  Assert Not cLcr Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cLcr.Edit
  cLcr!lcr_idmodif = sBDIdModif
  If Not bPrépareEditAdd(cLcr, colColonnes, colChamps) Then Exit Sub
  
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
      JournalUnix sTable & " " & iRessource & " " & colChamps("lcr_indice") & " " & colChamps("lcr_langue"), "changé", sMsgTrace
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
  If Not cLcr Is Nothing Then
    If Not (cLcr.EOF And cLcr.BOF) Then
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
  
  colChamps("lcr_indice").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cLcr Is Nothing
  
  If cLcr.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  BDActiveMaxLength colChamps, colColonnes, True
  ActiveChamp "timestamp", False
  ActiveChamp "lcr_indice", False
  ActiveChamp "lcr_langue", False
  ActiveChamp "lcr_idmodif", False
  
  colChamps("lcr_code").SetFocus
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
  ActiveChamp "timestamp", False
  ActiveChamp "lcr_idmodif", False

  colChamps("lcr_indice").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cLcr Is Nothing

  If cLcr.bEffacé Then
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
    JournalUnix sTable & " " & iRessource & " " & colChamps("lcr_indice") & " " & colChamps("lcr_langue"), "détruit", sMsgTrace
  End If
  
  On Error Resume Next
  cLcr.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cLcr.MoveNext
  
  ' On place un enregistrement dans synchrodelete
  Dim cSD As New BDCurseur
  cSD.OpenCurseur "select * from synchrodelete where sd_table='@@'"
  cSD.AddNew
  cSD!sd_table = sTable
  cSD!sd_timestamp = BDTime
  cSD!sd_wherepart = "lcr_ressource=" & iRessource & " and lcr_indice=" & sFormToSQL(colChamps("lcr_indice"), BDTypeINTEGER) & " and lcr_langue=" & sFormToSQL(colChamps("lcr_langue"), BDTypeCHAR)
  cSD.Update

  ' On resynchronise le formulaire
  If cLcr.EOF Then
    cLcr.MovePrevious
    If cLcr.BOF Then
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
  Assert Not cLcr Is Nothing

  bdSél.ButtonEnabled("First") = cLcr.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cLcr.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cLcr.EOF
  bdSél.ButtonEnabled("Last") = Not cLcr.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cLcr.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  
  cLcr.MoveLast
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cLcr.MoveNext
  AjusteMouvements
  If cLcr.EOF Then cLcr.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cLcr.MovePrevious
  AjusteMouvements
  If cLcr.BOF Then cLcr.MoveFirst
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

Private Sub bdSél_GotFocus()
  SetStatus
End Sub

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
          C = colMémoireRA(ActiveControl.DataField)
          C.Refresh
          SendKeys "{Tab}"
        End If
        KeyCode = 0
      End If
    ElseIf Shift = 1 Then
      On Error Resume Next
      For Each C In colChamps
        If Not C.Locked Then      ' On ne remplit pas les champs verrouillés
          C = colMémoireRA(C.DataField)
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


' Le code et la langue sont en majuscules
Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "lcr_code" Then ToMaj txtChamp(Index)
End Sub

Private Sub bdcLangue_Change()
  ToMaj bdcLangue
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
  bdcLangue.AddItem "F", "Français"
  bdcLangue.AddItem "A", "Anglais"
  bdcLangue.AddItem "D", "Allemand"
  bdcLangue.AddItem "E", "Espagnol"
  bdcLangue.AddItem "I", "Italien"
  bdcLangue.AddItem "H", "Hollandais"
  bdcLangue.AddItem "P", "Portuguais"
  
  
  ' Formulaire en mode initial
  Set cLcr = Nothing
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
  sFinalSQL = ""
  Exit Sub
  
Problème:
  Unload Me
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
  If Not cLcr Is Nothing Then cLcr.CloseCurseur
  MDIAdministration.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cLcr Is Nothing Then
    EffaceFormulaire
  ElseIf cLcr.BOF And cLcr.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cLcr.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cLcr.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    
    bdSél.NumRec = cLcr.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cLcr.bEffacé = True
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

Private Sub txtChamp_GotFocus(Index As Integer)
  AutoSelect txtChamp(Index)
  SetStatus txtChamp(Index).Tag
End Sub


Private Sub bdcLangue_GotFocus()
  SetStatus bdcLangue.Tag
End Sub

Private Sub bdcLangue_LostFocus()
  bdcLangue.Synchronise
End Sub


'=================================================================================
' Accès au Web

Public Sub FenêtreWeb()
  FileShellExecute hWnd, "http://www.silliker/cgi-bin/rechxxx?table=libcra"
End Sub


'=================================================================================
' Copie des données dans le presse-papiers

Public Sub Copie()
  EffaceFormulaire
  SetMessage "Copie en cours…"
  BDCopieSélection cLcr, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  On Error Resume Next
  BDEtat sFinalSQL, drLibelléRA, True, Caption
End Sub

Public Sub Aperçu()
  On Error Resume Next
  BDEtat sFinalSQL, drLibelléRA, False, Caption
End Sub


'=================================================================================
' Mémorisation

Public Sub Mémorise()
  EffaceCollection colMémoireRA
  
  Dim t As Control
  For Each t In colChamps
    colMémoireRA.Add (t), t.DataField
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
  sWP = "jou_domaine='" & sTable & " " & iRessource & " " & colChamps("lcr_indice") & " " & colChamps("lcr_langue") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub


