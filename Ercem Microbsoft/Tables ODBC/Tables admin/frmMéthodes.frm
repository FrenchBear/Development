VERSION 5.00
Begin VB.Form frmMéthode 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Gestion des méthodes d'analyse"
   ClientHeight    =   4380
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
   Icon            =   "frmMéthodes.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   ScaleHeight     =   292
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   561
   Tag             =   "Données"
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
   Begin TablesAdmin.BDCombo bdcGerme 
      Height          =   330
      Left            =   1980
      TabIndex        =   23
      Top             =   480
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
      ForeColor       =   -2147483630
      DataField       =   "*met_germe"
   End
   Begin VB.CommandButton btnCheck 
      Caption         =   "Méthodes sans recherche associée"
      Height          =   735
      Left            =   6660
      TabIndex        =   22
      Top             =   3600
      Width           =   1635
   End
   Begin VB.CommandButton btnListeSys 
      Caption         =   "…"
      Height          =   315
      Left            =   3060
      TabIndex        =   9
      TabStop         =   0   'False
      ToolTipText     =   "Liste les lettres des labos utilisables"
      Top             =   2220
      Width           =   375
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "met_idmodif"
      Height          =   315
      Index           =   10
      Left            =   1980
      TabIndex        =   19
      Tag             =   "Origine de la modification"
      Top             =   3660
      Width           =   3750
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "met_filler"
      Height          =   315
      Index           =   0
      Left            =   1980
      TabIndex        =   17
      Tag             =   "Filler (?)"
      Top             =   3300
      Width           =   315
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "met_deltadureeinc"
      Height          =   315
      Index           =   8
      Left            =   3360
      TabIndex        =   15
      Tag             =   "Variation de la durée d'incubation en heures"
      Top             =   2940
      Width           =   555
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "met_dureeinc"
      Height          =   315
      Index           =   6
      Left            =   1980
      TabIndex        =   13
      Tag             =   "Durée d'incubation en heures"
      Top             =   2940
      Width           =   555
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "met_laboaccr"
      Height          =   315
      Index           =   5
      Left            =   1980
      TabIndex        =   8
      Tag             =   "Lettres des systèmes Unix des labos accrédités"
      Top             =   2220
      Width           =   1035
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "met_reference"
      Height          =   615
      Index           =   4
      Left            =   1980
      MultiLine       =   -1  'True
      TabIndex        =   6
      Tag             =   "Textes de référence utilisés"
      Top             =   1560
      Width           =   5955
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "*met_methode"
      Height          =   315
      Index           =   3
      Left            =   1980
      TabIndex        =   2
      Tag             =   "Méthode d'analyse, 1 lettre minuscule"
      Top             =   840
      Width           =   315
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "timestamp"
      Height          =   315
      Index           =   14
      Left            =   1980
      TabIndex        =   21
      Tag             =   "Date+heure de dernière modification de l'information"
      Top             =   4020
      Width           =   2475
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "met_comment"
      Height          =   315
      Index           =   2
      Left            =   1980
      TabIndex        =   11
      Tag             =   "Commentaire libre"
      Top             =   2580
      Width           =   5955
   End
   Begin VB.TextBox txtChamp 
      DataField       =   "met_libelle"
      Height          =   315
      Index           =   1
      Left            =   1980
      TabIndex        =   4
      Tag             =   "Libellé de la méthode"
      Top             =   1200
      Width           =   5955
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Origine modif :"
      Height          =   210
      Index           =   14
      Left            =   60
      TabIndex        =   18
      Top             =   3720
      Width           =   1380
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Filler :"
      Height          =   210
      Index           =   4
      Left            =   60
      TabIndex        =   16
      Top             =   3360
      Width           =   570
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Delta :"
      Height          =   210
      Index           =   8
      Left            =   2640
      TabIndex        =   14
      Top             =   3000
      Width           =   630
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Durée d'incubation :"
      Height          =   210
      Index           =   7
      Left            =   60
      TabIndex        =   12
      Top             =   3000
      Width           =   1905
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Référence :"
      Height          =   210
      Index           =   6
      Left            =   60
      TabIndex        =   5
      Top             =   1620
      Width           =   1080
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Labos accrédités :"
      Height          =   210
      Index           =   5
      Left            =   60
      TabIndex        =   7
      Top             =   2280
      Width           =   1725
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Méthode :"
      Height          =   210
      Index           =   3
      Left            =   60
      TabIndex        =   1
      Top             =   900
      Width           =   960
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Timestamp :"
      Height          =   210
      Index           =   13
      Left            =   60
      TabIndex        =   20
      Top             =   4080
      Width           =   1155
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Commentaire :"
      Height          =   210
      Index           =   2
      Left            =   60
      TabIndex        =   10
      Top             =   2640
      Width           =   1395
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Libellé :"
      Height          =   210
      Index           =   1
      Left            =   60
      TabIndex        =   3
      Top             =   1260
      Width           =   735
   End
   Begin VB.Label lblChamp 
      AutoSize        =   -1  'True
      Caption         =   "Paramètre :"
      Height          =   210
      Index           =   0
      Left            =   60
      TabIndex        =   0
      Top             =   540
      Width           =   1125
   End
End
Attribute VB_Name = "frmMéthode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

' frmMéthode
' Feuille de gestion des méthodes
' 16/02/1998 PV
'  7/07/1998 PV Copie de données dans le presse-papiers
' 15/08/1998 PV sAjusteMessageODBC, BDActiveChamp
' 22/12/1998 PV Ordre des champs dans colChamps
' 31/03/1999 PV Impressions
' 12/09/2001 PV Mise à jour des labos susceptibles d'être accrédités
' 31/11/2001 FF Historique des modifications
' 04/12/2001 FF Historique des destructions et des créations


Option Explicit

Private cMet As BDCurseur                 ' Curseur courant
Private colChamps As New Collection       ' Champs à l'écran
Private colColonnes As New Collection     ' Colonnes de la table
Private iMode As eModeÉdition             ' Mode du formulaire
Private sFinalSQL As String               ' Requête SQL courante

Private colChange As New Collection       ' Trace des modifications
Private colDétruit As New Collection      ' Trace des déstructions d'enregistrement
Private colCréé As New Collection         ' Trace des créations

Private Const sTable As String = "methode"


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
  
  Dim cMetQuery As New BDCurseur
  ActiveFormulaire False
  SetMessage "Recherche en cours…"
  Dim iErr As Long, sErr As String, sSQL As String
  On Error Resume Next
  sSQL = "select * from methode where " & sWP & " order by met_germe,met_methode"
  cMetQuery.OpenCurseur sSQL
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
  If Not cMet Is Nothing Then cMet.CloseCurseur
  Set cMet = cMetQuery
  sFinalSQL = "select * from germe, methode where met_germe=ger_indice and ger_langue='F' and " & sWP & " order by met_germe,met_methode"
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cMet.EOF And cMet.BOF) Then
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

Private Sub btnCheck_Click()
  If (iMode <> meNavigate) And (iMode <> meEmpty) Then
    MsgBox "Terminez l'opération courante avant d'utiliser cette commande !"
    Exit Sub
  End If
  
  MsgBox "Cette commande sélectionne toutes les méthodes qui ne sont jamais référencées dans la table recherche (métaméthodes), donc inutilisables.", vbInformation, App.Title
  
  Dim sWP As String
  Dim cMetQuery As New BDCurseur
  Dim iErr As Long, sErr As String, sSQL As String
  sWP = "met_germe||met_methode not in (select rch_germe||rch_methode from recherche)"
  sSQL = "select * from methode where " & sWP & " order by met_germe,met_methode"
  cMetQuery.OpenCurseur sSQL
  iErr = Err
  sErr = sAjusteMessageODBC(Error)
  On Error GoTo 0
  If iErr Then
    MsgBox "Échec lors de la requête" & vbCrLf & "Erreur " & iErr & ": " & sErr, vbExclamation, App.Title
    Exit Sub
  End If
  
  ' Tout est Ok
  ' Fermeture éventuelle du curseur en cours
  If Not cMet Is Nothing Then cMet.CloseCurseur
  Set cMet = cMetQuery
  sFinalSQL = "select * from germe, methode where met_germe=ger_indice and ger_langue='F' and " & sWP & " order by met_germe,met_methode"
  
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True
  bdSél.ActiveValidation False
  SynchroniseFormulaire
  
  If Not (cMet.EOF And cMet.BOF) Then
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
  
  bdcGerme.Text = bdcGerme.Text
  If InStr(bdcGerme.FullText, bdcGerme.Séparateur) = 0 Then
    MsgBox "Code germe inconnu !", vbExclamation, App.Title
    bdcGerme.SetFocus
    Exit Function
  End If

  
  ' On vérifie les lettres des systèmes des labos accrédités
  Dim cSys As String, i As Integer
  For i = 1 To Len(colChamps("met_laboaccr"))
    cSys = Mid(colChamps("met_laboaccr"), i, 1)
    If sNomSystème(cSys) = "" Then
      MsgBox "Labo accrédité '" & cSys & "' inconnu !", vbExclamation, App.Title
      Exit Function
    End If
    If InStr(Left(colChamps("met_laboaccr"), i - 1), cSys) <> 0 Then
      MsgBox "Labo accrédité '" & cSys & "' spécifié en double !", vbExclamation, App.Title
      Exit Function
    End If
  Next
  
  ' Tous les tests ont été passés avec succès !
  bOkValeurs = True
End Function


Private Sub ValidateAdd()
  Assert iMode = meAdd
  
  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  
  Dim cMetAdd As New BDCurseur
  cMetAdd.OpenCurseur "select * from methode where met_germe=0"
  cMetAdd.AddNew
  If Not bPrépareEditAdd(cMetAdd, colColonnes, colChamps) Then cMetAdd.CloseCurseur: Exit Sub
  cMetAdd.CloseCurseur
  
  
  ' Tout est Ok, on sélectionne l'enregistrement qu'on vient d'ajouter
  If Not cMet Is Nothing Then cMet.CloseCurseur
  Set cMet = New BDCurseur
  'sFinalSQL = "met_germe=" & sFormToSQL(colChamps("met_germe"), BDTypeINTEGER) & " and met_methode=" & sFormToSQL(colChamps("met_methode"), BDTypeCHAR)
  'cMet.OpenCurseur "select * from methode where " & sFinalSQL
  'cMet.MoveFirst
  sFinalSQL = "select * from methode where met_germe=" & sFormToSQL(colChamps("met_germe"), BDTypeINTEGER) & " and met_methode=" & sFormToSQL(colChamps("met_methode"), BDTypeCHAR)
  cMet.OpenCurseur sFinalSQL
  cMet.MoveFirst
     
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
      JournalUnix sTable & " " & colChamps("met_germe") & " " & colChamps("met_methode"), "créé", sMsgTrace
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
  
  SetMessage
  SetStatus
  bdSél.TabStop = True
  bdSél.SetFocus
End Sub



Private Sub ValidateEdit()
  Assert iMode = meChange
  Assert Not cMet Is Nothing

  If Not bOkNullType(colColonnes, colChamps) Then Exit Sub
  If Not bOkValeurs Then Exit Sub
  cMet.Edit
  If Not bPrépareEditAdd(cMet, colColonnes, colChamps) Then Exit Sub
  
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
     JournalUnix sTable & " " & colChamps("met_germe") & " " & colChamps("met_methode"), "changé", sMsgTrace
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
  If Not cMet Is Nothing Then
    If Not (cMet.EOF And cMet.BOF) Then
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
  
  colChamps("met_germe").SetFocus
  bdSél.TabStop = False
  
  iMode = meQuery
  SetMessage "Entrez les critères de recherche, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionChange()
  Assert iMode = meNavigate
  Assert Not cMet Is Nothing
  
  If cMet.bEffacé Then
    MsgBox "Vous ne pouvez pas changer l'enregistrement, il a été effacé !", vbExclamation, App.Title
    Exit Sub
  End If
  
  bdSél.ButtonEnabled("Query") = False
  bdSél.ButtonEnabled("Add") = False
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation True
  
  ActiveFormulaire True
  ActiveChamp "met_germe", False
  ActiveChamp "met_methode", False
  ActiveChamp "met_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("met_libelle").SetFocus
  AutoSelect colChamps("met_libelle"), True
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
  ActiveChamp "met_idmodif", False
  ActiveChamp "timestamp", False
  
  colChamps("met_germe").SetFocus
  bdSél.TabStop = False
  
  iMode = meAdd
  SetMessage "Ajoutez un nouvel enregistrement, puis validez [Entrée] ou abandonnez [Échap]"
End Sub


Public Sub ActionDelete()
  Assert iMode = meNavigate
  Assert Not cMet Is Nothing

  If cMet.bEffacé Then
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
    JournalUnix sTable & " " & colChamps("met_germe") & " " & colChamps("met_methode"), "détruit", sMsgTrace
  End If
  
  On Error Resume Next
  cMet.Delete
  If Err Then
    AfficheErreurODBC "Échec de la suppression de l'enregistrement"
    Exit Sub
  End If
  On Error GoTo 0
  
  cMet.MoveNext
  If cMet.EOF Then
    cMet.MovePrevious
    If cMet.BOF Then
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
  Assert Not cMet Is Nothing

  bdSél.ButtonEnabled("First") = cMet.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Previous") = cMet.AbsolutePosition <> 1
  bdSél.ButtonEnabled("Next") = Not cMet.EOF
  bdSél.ButtonEnabled("Last") = Not cMet.EOF
End Sub

Public Sub ActionFirst()
  Assert iMode = meNavigate
  
  cMet.MoveFirst
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionLast()
  Assert iMode = meNavigate
  SetMessage "Recherche en cours…"
  cMet.MoveLast
  SetMessage
  AjusteMouvements
  SynchroniseFormulaire
End Sub

Public Sub ActionNext()
  Assert iMode = meNavigate
  
  cMet.MoveNext
  AjusteMouvements
  If cMet.EOF Then cMet.MoveLast
  SynchroniseFormulaire
End Sub

Public Sub ActionPrevious()
  Assert iMode = meNavigate
  
  cMet.MovePrevious
  AjusteMouvements
  If cMet.BOF Then cMet.MoveFirst
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


Private Sub btnListeSys_Click()
  Dim sMsg As String
  Dim s As Système
  For Each s In colSystème
    sMsg = sMsg & vbCrLf & s.sys_systeme & ": " & s.sys_nom & " (" & s.sys_description & ")"
  Next
  MsgBox Mid(sMsg, 3), vbInformation, App.Title
End Sub


' ==============================================================================
' Interface clavier

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  ResetChienDeGarde
  bdSél.KeyDown KeyCode
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

' Les labos accrédités sont en majuscules
' La méthode est en minuscules
Private Sub txtChamp_Change(Index As Integer)
  If txtChamp(Index).DataField = "met_laboaccr" Then ToMaj txtChamp(Index)
  If txtChamp(Index).DataField = "met_methode" Then ToMin txtChamp(Index)
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
  Dim cGer As New BDCurseur
  cGer.OpenCurseur "select ger_indice,ger_libelle from germe where ger_langue='F' order by ger_indice"
  While Not cGer.EOF
    bdcGerme.AddItem cGer!ger_indice, cGer!ger_libelle
    cGer.MoveNext
  Wend
  cGer.CloseCurseur
  
  
  ' Formulaire en mode initial
  Set cMet = Nothing
  ActiveFormulaire False
  bdSél.LectureSeule = bLectureSeule
  bdSél.ActiveMouvements False
  bdSél.ActiveValidation False
  bdSél.ButtonEnabled("Query") = True
  bdSél.ButtonEnabled("Add") = True

  iMode = meEmpty
    
  bdSél.SetFocus
  
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
  If Not cMet Is Nothing Then cMet.CloseCurseur
  MDIAdministration.AjusteMenus -1
  EffaceCollection colChamps
  EffaceCollection colColonnes
End Sub


'=================================================================================

Private Sub SynchroniseFormulaire()
  If cMet Is Nothing Then
    EffaceFormulaire
  ElseIf cMet.BOF And cMet.EOF Then
    EffaceFormulaire
  Else
    Dim C As Control
    On Error GoTo pb
    For Each C In colChamps
      If IsNull(cMet.Fields(C.DataField)) Then
        C.Text = ""
      Else
        C.Text = cMet.Fields(C.DataField)
      End If
      C.Refresh
    Next
    On Error GoTo 0
    bdSél.NumRec = cMet.AbsolutePosition
  End If
  Exit Sub
  
pb:
  If Err = 3167 Then
    For Each C In colChamps
      C.BackColor = 0
      C.Text = ""
    Next
    cMet.bEffacé = True
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

Private Sub bdcGerme_LostFocus()
  bdcGerme.Synchronise
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
  BDCopieSélection cMet, colChamps, bdSél
  SynchroniseFormulaire   ' Affiche le premier enregistrement
  SetMessage
End Sub


'=================================================================================
' Impression

Public Sub Imprime()
  BDEtat sFinalSQL, drMéthode, True
End Sub

Public Sub Aperçu()
  BDEtat sFinalSQL, drMéthode, False
End Sub

'========================================================
' Historique des modifications

Public Sub Historique()
  If iMode <> meNavigate Then
    frmHistorique.MsgErr 1
    Exit Sub
  End If
  
  Dim sWP As String
  sWP = "jou_domaine='" & sTable & " " & colChamps("met_germe") & " " & colChamps("met_methode") & "'"
  frmHistorique.AfficheHistorique sWP
End Sub


